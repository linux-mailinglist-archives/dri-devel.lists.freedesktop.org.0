Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D5D2C5B0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 07:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A57510E7F8;
	Fri, 16 Jan 2026 06:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7vhwqp5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UNr50FRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460E10E132
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 06:10:58 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMcqqn4100940
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 06:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8dvGPLqwrrYLb/jUyaHbTl0R
 INjXWSRLqYqkLp0HioU=; b=R7vhwqp5cDUhV0nwb9FqfTFX0WA2X7STq1Li3Twu
 u/C2rqetf0G99ZRCUdfoXSC9z7puk2b7idtC1gCPijNtDviUTtBSKUuXYUlyS6pD
 ZcDIKo8KhvODP8JI4M2kXPAbzJMch4M+2SNu2JlwYdwPUow+wfuHY0l3kK/89166
 UKUBtp948E5vf5n2FMgFp68SqCN6UBcYeSjX2vdvHeoicGQaQqBE3MRlkpYYxxLb
 ER61lGuN8b+WGxAOdWcku2Ix4AUiZGULhrjX9RAAJm1Gk1KsPHyJO0U4fgTnCrJB
 7xHC6kKaBHp2BVHK1L06RkTda0gsf7+fFbv7SYidLQ360Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97510sg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 06:10:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c53919fbfcso432265785a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 22:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768543857; x=1769148657;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8dvGPLqwrrYLb/jUyaHbTl0RINjXWSRLqYqkLp0HioU=;
 b=UNr50FREi5/wDWJPxWIxQXu3gyTeEXNuCus4tx1LQer8FuO23gBOq0iHIWZqrhzFc+
 Yw1EcaGist5XjChkuTiov75MFPotZztFiPsSXSx1kRIjsQASscDU2HOHusj7RCPUVmsi
 FevfEfsm580clw9HU43jNvT4ibPcN0r+k4cD1Het0OeERXTtXTXrQpquysiyCzUP1dte
 xBQP+7sWvBw6RpLajG21Lp3mfNUC5EJtZS6rKqmPdgygpVFYrJsytUiNKY5sv8W8q40I
 oSRlIMEGkQlKD/iA/u7uCH+TURBOH6RaUqhipDfRroSXy69EcOwVNHCRtzdslnsXEEZG
 hj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768543857; x=1769148657;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dvGPLqwrrYLb/jUyaHbTl0RINjXWSRLqYqkLp0HioU=;
 b=jOrtvOAZ0kEuYUzHh3kxlZ2rPt0fZ0m650hRHaKRv0q0uEegVBxlMfGmndd7uK2Pvc
 9iARrOi3c5AdY7Hh7xScKHwxBv7HvRmrSOJ2f0xK+cn5iWkIvVtVShhHyJ3SBsOKm7Ls
 Wl/c+BDvx6zqf9N8XCXb6MygrlRGt80HxDoMXWOoc2XE4J2G0cnge3P4WawLoyyu7dic
 aWClFs9r8vm+PfH5R3nG/WFyA9vuQrPikR9wUace//igCRDA7GfNDmkQIczAJp2dZN47
 Lk8OCQLj1fI/hmSv6HB8v2viFLsiGYm0rZYIX3w8Ws6b5BRoN6Kz/g7+4/Y/4g6h53uz
 Cmvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvfBxxKegKTru98SMb+8evyGBvsZoXhIH9EGX85D4ZYLye/76TzSr+uw+LgXCnzKdmRB0p/J5DDOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynfOihkwh7N/jHGNj25Cacg5mmPwtAd47ihmb65UofHHfrdnnK
 ef560F6sgLIFx7Dsf3TFQ4A6bK/gfXou3C7PnTO1Z1t7wbGGyXry7BONLDo+qdancj1j77uiDVK
 7xU70QkAdbtC6LnTASe3xQRB1yJKpbCghiRQQ9PvWhP04urINlZKGhHZ3E+6Q/HjpsYIcaoQ=
X-Gm-Gg: AY/fxX60kOx39FHme4CyOlFzFcYA8ujg9GzJWNnn6mgc3UlwPeVJTFDNgO5Ckxa5wdv
 tGqmWMDjrO09IpIwg2vNqXofu7p6D7w5+exFjtenFD+cTr7zctdRsbub+C0VYnJMxW/FH6GZcgf
 ntMiw7HA7Yz5Yvu9kYWjDleHszWQD9MEgpxyYb8WZWOI9ylMLnvSLgPyuAo4oorgTBZOi6Z+6i1
 HkClUQpSIzI5leSy17h1cxeRf0xvSninwaOhPcZAcbCkE7Cf5DZWXAZrLaFsBNYgjpKVTwbhtYJ
 x4NmkDG1jnA94mrL0+yXqE1mBBjAQKWcQ8j75i5vnsKoyBBwa/mJ5YkfSuN3YGFQlWSeArVKS2B
 iZIFen+nr2CI5DuFEgDbr3/0FULkiHav0sUiz3myk/V7gV1D89Fe6LiQyXRdAgCTXVxg6tLsRwd
 qUCiSXoNFXvDcmvqmOH/ANyxc=
X-Received: by 2002:a05:620a:1a86:b0:8b2:4a1b:b80a with SMTP id
 af79cd13be357-8c6a66e4ec2mr297781385a.25.1768543856750; 
 Thu, 15 Jan 2026 22:10:56 -0800 (PST)
X-Received: by 2002:a05:620a:1a86:b0:8b2:4a1b:b80a with SMTP id
 af79cd13be357-8c6a66e4ec2mr297778685a.25.1768543856296; 
 Thu, 15 Jan 2026 22:10:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf34d572sm457592e87.24.2026.01.15.22.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 22:10:54 -0800 (PST)
Date: Fri, 16 Jan 2026 08:10:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] soc: qcom: ubwc: Add configuration Glymur platform
Message-ID: <s5eu5xqoh7zs762dciup426fxed7kcnk3offyguv2qhqsnaomt@drou2clinmly>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
 <20251027-glymur-display-v3-7-aa13055818ac@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-glymur-display-v3-7-aa13055818ac@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0OCBTYWx0ZWRfX9+MlM5Be+Xjg
 mjLmkJ7/08lioYwmg6rglo3eajWUJjZRSW8eROhYajwkRBM8R9YIddxSkKn9p074VZtv2vED+A9
 6PF2mMuvcREMEHtr8stAyk4ImSkJzjjHORwUJC3cn5w6YYn0U6nUhmHSjGxJiQs+att6v8FUYuc
 GBe32/5WyhL1y8Sbu7IZph2BCHPFZr9BptlUjChi+qA0GFs20+Qj2Upqw9i/UBGWWx5hg58Gd/M
 UvxLtKjoNn3oNW+TQMcXtPdpj778GbnmrMx8ZZTLS759xwr8+2SQtV2Rd5C64Y7R/OKTp7OdevN
 Q+c1dtIi09WVf+BEbJL22OxX7kQQ9avpuEuQgOS9O/UEzfEI9iE4oQc5lKsuTLeq24n8tSmJazc
 lMOjXY4BK0cSf6TqUmkMYXPK/9RhzheMasf9WDAiiFFexun4vilDZG5qZ5lJwrTXiu0wj+cVV5g
 bR9boOh/1eEnAdnjDog==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969d671 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=qHQHcOLFhFkQKvqmysIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qSaRgWpp3XsRMupc_krjGqs1zvsHa9lm
X-Proofpoint-ORIG-GUID: qSaRgWpp3XsRMupc_krjGqs1zvsHa9lm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160048
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

On Mon, Oct 27, 2025 at 04:59:24PM +0200, Abel Vesa wrote:
> Describe the Universal Bandwidth Compression (UBWC) configuration
> for the new Glymur platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..7cca2afb68e3e9d33f3066f1deb3b9fcc01641a1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -218,11 +218,23 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
>  	.macrotile_mode = true,
>  };
>  
> +static const struct qcom_ubwc_cfg_data glymur_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
> +			UBWC_SWIZZLE_ENABLE_LVL3,
> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
> +	.highest_bank_bit = 16,

As I started reviewing UBWC bits and pieces... Could you please check,
according to the document I'm looking at this configuration is not
correct.

> +	.macrotile_mode = true,
> +};
> +

-- 
With best wishes
Dmitry
