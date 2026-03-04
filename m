Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOriLqo6qGkTqgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:59:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D076200DAE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992210EA3D;
	Wed,  4 Mar 2026 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGCPAMpa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMxNpjZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192210EA47
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:59:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624CcaUr1678348
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 13:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U7dURIckBm+11kzsdxwpPLsV
 Ye086yDRD1pOrWSULIY=; b=iGCPAMpaXPjjb7k+N9YtGTCdVuZiNv/OMMRQqYDq
 T8J8v816wGZmbgLB7Qru4bal1KfbqYvS1DdIMLcl8Y9AaoqdrbXE8rgWB/rWpWe3
 teto/vkpEKGj7TAyVpOSt6CRNPDDN7ghEj/5/x6nGvrvnAuBBN+davHcrS7PW0xl
 /JkDYAEuoGvgHVpRKcQl1loGCE7NXqOxWbZ1xtm8l86+p/s0Lf8ztE+CEnjxZmO6
 VlwD67kRH3Pnx7pohCtgxLcFm8HHbUkSFdUtARMrH6RqWO2buXQk1E+eBc3rxap3
 4NIBxsh1dBpu6aCl7HcmUfdjnQmmheUYavucrUFSPUgypw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73hb1gp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:59:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cb3b0d938dso4880764585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772632741; x=1773237541;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
 b=ZMxNpjZfbU3YOnssIO10Dwz0d6kSqt7u4pn3VDNfQhAtSsFrOrKcYYBXN0R5kWKoPN
 1f5AXZvx601rvhKvHmbHkPEO5NkI8p1CK3bgI2fnVIVGun3NYdCEHWd1HTj+MmoQvs6u
 1vcPFv2eb7WZ5JeOEHS5h5pwHN04Q7TGyhIYaE35YnZmMr6YWQDxNSBWlrgEj1r5974o
 ix1QZcJbouVJd4mAPUFGuJ0ye2trIOWHvzkyYCb+tvmkWfa1UDuVtkopuynYOCjZlrf3
 rri0uGBrX7SW4ifRPrhjElAgu6fgxDhuv+Y10DMtxJ/JibWVN06m6sMuAexj95uI4xh2
 E7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632741; x=1773237541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
 b=n5xDGPl6VyJ/0QsYBHbWE/v6bF0pm9NPezDeenpsw9QVl+xePZTBw3QopdqVbpM/mq
 lFU/j/e6uFgVgQ5/TgkCWTA5xxi+68ItB+76RDoC2UE+p99UmzcUGmcMjqEH9d+l1uED
 rH5RE4x9CJZx4HFg0iH6UJ7APh8fYRIC1fwQpAbms87ke48DwVPJXt9Jlx442rw4rt3Z
 EnqHNLwhxGDtlN/5OQkxFsDzeOSHf5vi9TQSOMhLXofV84DM6mA9TECexDUxvf7rLiBq
 TLESsnvBeTCeLZRW3LGovVIibJMsu3IcX4VMdl1twwGjKjQLL5YlkTlC4JlIMH/w4Shg
 513A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYcSOxMk3tVdsTGqPymzBtIGdUUU5/g0a7GHp+rmAuhQpUldhW8QM4LQ/13UW/D1sBqMsp5U7/aXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3PnP6PLYGXRDOL+B+5WHw/61N2J3jS1+kcr0vBUGaDY9UDSGW
 Y81yhDlM3uCOsNjZx6A9KWpWJao6Z9YFX4Mcm02JN0ktURNUVFgfRBGq6S64H70QUj/3CFd2/za
 ca4SdOiKsEgZzpAGq9kWanqHFJTfmiYmtQEaIvOL46El2ajeOGTqU8nA6SQFKPWGAQdrFXDQ=
X-Gm-Gg: ATEYQzztpddCsQVCa4ZecJhvisgPTYynCmY8U52SbwmjWwwt27aiTsE6ZEcZ9GwzIGC
 +jgaNzZjFFk0n7hCbMIjDVmdu/Zd+en2tLhBClkYglN68Hd4Vz/Z/0+hF8DvLVK/bIe6DNhPxBn
 ZC8SWYLenIwrCfVeBQYXDzrXgpIjmGg61G2XN1B2nV2q1qzy5mGCUeUEv90NfskXvIijAAOR4at
 4+4zyYOTYNHtdJzgRduV5yU9+TMj6GqGrO4eGORd0CE2EcKRBl0RHRYyH8h3Xv6j26MusAS3h+T
 sZAXeLZ8YWbXEnVRhsbUcapVWOuQfgRj69TDszK0T1b2gc7t5LS64NusD24WCHydmLSwFJs2pZY
 3zxhxN1LXw1UMiFXjEuCiBHmYPWzuGetUPA81KmrE8wPPW0618BtIxEECAcMfVF9g0+TpVsm29w
 o+q3/tMGg0HK1208nwhTZ5ADp63Kk3sgqlyBQ=
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id
 af79cd13be357-8cd5afa9ecfmr237120885a.64.1772632740853; 
 Wed, 04 Mar 2026 05:59:00 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id
 af79cd13be357-8cd5afa9ecfmr237116585a.64.1772632740365; 
 Wed, 04 Mar 2026 05:59:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123588ffcsm1318304e87.5.2026.03.04.05.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:58:59 -0800 (PST)
Date: Wed, 4 Mar 2026 15:58:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
Message-ID: <n7xd4svnk377y3jidocyi6mtncqy3nvnym7vvmxv3v2wolumq7@daasfxggcbyl>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
X-Proofpoint-GUID: Ax5es-Z-HTs8cSW5EupIj5_CqbDKuevA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfX7kRrDGn8FnF9
 89AzbDkvMTJRndoL60S4ktt8mbkaZE8O7mjbhkPeHa1NGqJiFsP3squ5GR3Yyas+MDIfbVUF/Dm
 2UXizydrhcJ0+Fvl/DoGhrbSQDOBMcdX0qMy5L5pZTcdAulDttoKlq7Zxh9ttX1pt1itkpEYc2k
 Kg7Xnk67FSyFFRDAh14B//Y/6nGZus6Ew+ENqv6L1FCndv3Q9YbRxdI7T5dHof3qN4a6U5ZZj0q
 MhwGW/eFVV9lEscxyqvLG3q999yhhMFBzWu92s7OqmxFFxkQJye42xWgPP3hwACXT+1RX2DHEKi
 E92O/QruYAMjlIT73P7F2mEEsyyAy6YdvQ2d0cufD8q2L4YArRyv73sJME+h+GsZxmInN56v+8r
 0eQzCWS8DM5z1aulebtjjQkxJnMBpcaEpTIM33e48EfziUjWN4F85C0wJSc4IIFLGgua+/ijerC
 2ASOl/GEE6zhRZThfWg==
X-Proofpoint-ORIG-GUID: Ax5es-Z-HTs8cSW5EupIj5_CqbDKuevA
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a83aa5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ofcykXZfb13_7XvavCoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040112
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 6D076200DAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:48PM +0100, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different

Why is it "but"?

>    highest bank bits).
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..633d1efa0883 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
>  	/* no UBWC, no HBB */
>  };
>  
> +static const struct qcom_ubwc_cfg_data eliza_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = 6,

Please use defines for swizzle levels as the rest of the file does.

> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
> +	.highest_bank_bit = 15,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data kaanapali_data = {
>  	.ubwc_enc_version = UBWC_6_0,
>  	.ubwc_dec_version = UBWC_6_0,
> @@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
> +	{ .compatible = "qcom,eliza", .data = &eliza_data, },
>  	{ .compatible = "qcom,glymur", .data = &glymur_data},
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
