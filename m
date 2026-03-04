Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BWaBC81qGm+pQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:35:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A5820080A
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 14:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1250610E9F5;
	Wed,  4 Mar 2026 13:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJsYsb/2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FCPThvbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372210E189
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 13:35:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6249smUr1213363
 for <dri-devel@lists.freedesktop.org>; Wed, 4 Mar 2026 13:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=; b=VJsYsb/2vSUGtnPX
 iAmIkOgQTRoD/pXdcxv1p9Ch0KCg8y24kjy3jAWP4wTumPB6ms0CkgQw/LwXj4ft
 jP5S7gacgbggk+5rn5iq5pzem1VogAAJ4ZV6zmZ5+gpii9RmVKti/zw6QSyShX3y
 XHUCT9i7mQKRxa7HMw2lvXY1bUYLjYVqTpsDua7MZbX9AAaV/tbsPOYIlxXFbCM2
 gsWcrtBwC/BRN9c/dDXdPZHguTytvXTGXHySYLjjGWCtO2VwqlPEZ5k5hQPO3QG6
 bQk4G3Mxuyr7yhbli8QeIIutffjrcG3TXMi87c2vzO1hS/4vkK/RJwSFiam8i/Rp
 pF3uSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5rkwe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 13:35:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb38a5dc3cso540491485a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 05:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772631338; x=1773236138;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
 b=FCPThvbhh5IGHVxAaWiTtR9x8+gEIjALVTrwAP5oZNmQA7/oGgtN+IIrog9CRWCExh
 W3a5xxKkJG1Ng4eiXWmsMoWPWgyeEP6fE9VLdUWRIqzzuPmXRjyYBWALDS7tHohOA2u+
 atGRDgDgcqSLoRPEM8NHab9wU0sBnQfaLmdakoPURZvhJcmIPyRHCHHlqEhDAQJhJ/kr
 69674f8buZxShsWe5GA7vAZ7Wt8LC3HrhBUIwnUq/rL6Z68OTqabSBMpPYYlz/L+sY6k
 0pfHBw9gHy8S7lA0vxYwUFpyIPLmjZl/Wsd4bC6tpkwmHpU3xIHuamP3pg9wGyCWvhBM
 +8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772631338; x=1773236138;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HHFSyLWU+Oy7MJVGltMtPHpNmUOfcwnnSnJ2aE5TD9U=;
 b=NJBn8aw+5alJvioFjtWdmBNE+9hPnMpcLpiwYEHUJd5u0+aoDFAU5WiijwjdRPQZqB
 ZNNIoN0zZN3DcoMh0fCfd5cxvyzIgr/OjHAixKiRksGH8wWbntq6hMS+ABKPh8Gsh1mY
 g2tUMARHKDfx7Y1DchmJ8vgzshJHb0krrWNuR7o9hzWYdq6wbkQt5qZSQ2cSYlcN8KtX
 tUEozBYbyKKkscaj/4Fc79VcFgXy/ArSVecdivEhckNYM4XkjaSKylZTA+6MfqJ/1GjO
 7Npfj0U0fmDbDAedSlLAi8ORtQ5W9asxfwswX/bIdV4AVPgP3d0pWLSXFQINQ0zEprix
 Vtiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEfeMyssoChweJpqPVcBZDipGru6TTIW7JqMKrd6DCI/qfZmcc94zjy5vKHcZ3B3l5tljekw72eZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/rFV9jeQJXS7Em3NH0LM5FmHafnAbp05ENGPW3/X9b4FX/bpj
 DNasMmENlINcvYc9S0gHFDSvb0WztDJv/VzX4w/xX7WKgOvNMuc7egm83NQik4AILNBBya6b5m6
 v6XHCuu067jF52oBhZchBvlt/ipdfQv4NuB3F64KRAwGlxUkrLu6UDByBKfEnpLkmik8/tRU=
X-Gm-Gg: ATEYQzzp94HlQFGoQFaJq0FjRm0r5HCbINUwWs2HP7S1/ND7U8L3LMw8yE5CD/Z0by9
 OMFQGd8/UQ+h0HiqlZc3NYHhBou2bbVUxtazgu7EQafoXpAYfqaTojXMYFIDNcJA1T2N7fQRQND
 wgZrEBdf3YrTXf6+5aQrimSlxOR68vJIpCtL1elqa0LpbjWkXHzRaaoX5oC2Unpoj9mV1YxTTSj
 3NSaV4yen6RpleyaQDCSdL+rVzWKzMB8hiwlrshL9q2TC/6c9UDl83MkdLbbbyaEYu9dGNqGsYn
 Xt/fiJhiHkOIAaS9en4KUezWLAiEUyVCTob2MrSed2JCLsTe/i+nVlhB3A9adD7lhghcvjXFjSl
 Eet5SEkYDvMEG1DuRlx+ce7jHx+FUYl4dOhiqvkoLUNsXMoZsAfeDfRH1cXJ43x7rFjMDOH7mX9
 3M6po=
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr175282385a.9.1772631337990; 
 Wed, 04 Mar 2026 05:35:37 -0800 (PST)
X-Received: by 2002:a05:620a:404c:b0:8c7:1b40:d096 with SMTP id
 af79cd13be357-8cd5afcdcfbmr175276685a.9.1772631337417; 
 Wed, 04 Mar 2026 05:35:37 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-660b5df4bf9sm1505895a12.29.2026.03.04.05.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 05:35:36 -0800 (PST)
Message-ID: <7e092c9d-ccc9-4084-91a8-7ddb063a904d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 14:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5teO9NMSC2iPC5Tt34Igr71BzafTWyyn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwOSBTYWx0ZWRfX0Qh8PWLXUo/z
 Pt1esqtB8i23MXHcDFYy0HAJGjzOdb02Se45Y57f1cgsIALRMgVODHGa4U+PlVSuAX9dxuTgHXn
 8QeeNFuNjlyepmYBNFShsCbJcf4UAmjOo2ryBb/NRPhW1IrZRsQMu3tAs81vLCB+y7FJglqqxSL
 sUfjja8CYAafTGuw6OWc8wZR+fwQM8qBZFXtsFvv+GuCaaPkLyARChRkoVQqU2+jqCa0PyCvhLR
 HSdMKarDCl19vwxRO5uYA0D4ak4JXon1vbEk7fmWJf/UiAHeFW8uLiTTKO/W6vHdrjaRPVT1xBk
 s6/vioiEahUjYQTGr2MAUmdUJO8MVuaV//Ihv0otFiVo3ieIjYEGhM2tWxf2gqMOSDMGFKDMz0J
 ydpW1LdQb2XfYAQTq9eO9+28kU1WsWgs79Cn2YmpWo6SS8/wO6Xf1uTSGEyDiaibYraZHsollI5
 y9VBDtKNaKWk86lRGTA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8352a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ofcykXZfb13_7XvavCoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 5teO9NMSC2iPC5Tt34Igr71BzafTWyyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040109
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
X-Rspamd-Queue-Id: B5A5820080A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/4/26 1:58 PM, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
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

 = UBWC_SWIZZLE_ENABLE_LVL2 | UBWC_SWIZZLE_ENABLE_LVL3

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
