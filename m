Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIxEI5hQn2k7aAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F019CD4A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCC810E370;
	Wed, 25 Feb 2026 19:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP9qH0mn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJXqqLIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573CD10E370
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:42:13 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61PGkH8e3632319
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uKiJRMm8nRVVx0UgrjMgw0Zj
 aPILLGggnDG0A0EXFAI=; b=DP9qH0mntEKSt685xTJTXokXhhzNWeycFfuhPcnC
 iK+oOKfa13lHhpIVTVwt5nYiv38hlqN5GpRbvMF9aY0PsvYvTwIK9ZSfhAjU612k
 OiHuV6RW5B6UlaMPCSmARAy4POmW67fqioptjedstJjhyhFecL5alwkOQEGj3g+N
 FNqqdowJSv0SoGL2NQBZNWR16fD8wGWLAOWmTzYIC2UQZ16kHBbRuEWIDPwNDXkR
 HQj9dT7omotUpTab8+WWH6RRfKgfixcMkoS6Q2B8BzIG/8GAkbsRITSUDF8iLzmT
 6tF1RnqjjwA5eUubQgCroChaJ7B22eCK+qV90/FVeF+CPg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj4w4rk2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:42:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cb413d0002so79935285a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772048531; x=1772653331;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uKiJRMm8nRVVx0UgrjMgw0ZjaPILLGggnDG0A0EXFAI=;
 b=AJXqqLIeD/tlPqTeJ64qeIqgTkPE4c90XaRlpVJ9Wt7b9rhCwODtfQMqUApTmpTY/7
 ecbue6XGJcBOK1fHusadpCQKTPAXPqyZegVDc2ba/vQ1/X9Dhogzs37rxw22BL23GoX0
 sqTywpz8/pvKrrfQdkcx9pf6evsChrqCaU+0COnJeDeoj3cGu0qB5Iq96w2AgVgdNuVB
 vWdaQ+N75YJT4v9dHahLMlQ9RpwKM2GIrBkX8cxhvZVNyJMmIlXZtPCMcN3jhvh6+hJM
 A3Heca/DmuubF8JiTBd2KdBZAV41mx/1bBF/qMw5pfVkH02IBs8nVjFdxJeyQzxNz7id
 uWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772048531; x=1772653331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uKiJRMm8nRVVx0UgrjMgw0ZjaPILLGggnDG0A0EXFAI=;
 b=szyherCIF2SaGhrwFrOwgtV3WaQHRYuzQ78e6itaquo2Zp0HHR6Y60mYdAOMLHrOlr
 wo25xIYZ9dK+w/9+s004CgFdpjOf/WpzuSAec2PBwSfLA12g0FmaPw5l6Wj2+Th1jTai
 zMQXVyDnCLFJC/NQ0CcT21V9noXLWEi6Vqg6k10DPcbbjVB+j2sclaBuR9eMTwz7UjGI
 AuQnIwHNx4X+lV2iDJo8Nlgcc7s4hnaJu+CMqzsoGtBoxm3uQAlWuBJFHjyFhCW800oF
 EPQM9F8YdsNgVpRUCVQb5MlcuRUMH5Toe/TTJJ0Mmb3cdiTokA4fb4G2VjqgEc4m/Hfu
 wmbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZjCoC8Rt0GzjmKod6lkfxlENOc7YY9OqdMyM03YgL6FVlE9a85y/pt/u3rTZdjrLbeluXBd+XeF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEbVAWy2d5Zcq1SfSpP6LD2snSWxv9iR+yKbLY57T+d/3tyRwu
 WhTHbbdZhrmiDkTtfb6Vn9TGVE49OUNQkbOnkPgDT8lpeKliHHnI2DmU7bABz+syrMJOoVUcIuE
 yG5NDyQDBnVKOKZcR4D+6o03ck5LA0qYcJePA6ooNY+b2AKhCr0zaD2KTW3/xsyNgWIavakU=
X-Gm-Gg: ATEYQzzHMI79lBep4HtgyrMxvF1Qrr9Ih8l327g0TWFCa2TNO0xiAT3Krp/kRJcaHUI
 0r/p8WBRUUCEG7SNhBEaziYq/Q018RaLfx9zpXs1+CDSqeCRMRBdvfzlOvKm27TNiGb8+a/2Y34
 Cl526OgV4Rjb1ENrJ0ytpNAYPmwZvvcRm1SERk8HoYpaApWPH8hDoodR1STnDfTC+zPhGNITzQK
 rXQI+U+hzGYG6xrGOy3TH6yz4EMLMkAJsZwWTbSWGUcEzL9q/tPW81qgZBMlXzVe+BAnFYGUYI2
 TdiqCm0xZ+zMTNdsm9JBYQBeSbZGIZDm66fDrlJI52x4Bq+LLuU1AWhWTH+lciWxQzIvb6DK0Hj
 uXjrc9+pGtaNAyRP0CzXvniMfJaiLkx8tS6TP00yAe5dVbLe0/TlxM9l8QsJSZXHHux/P40dzyJ
 cpUVC955ZRSTBgsnXmNz2+ETZNdqGocV6E34A=
X-Received: by 2002:a05:620a:2988:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8cbbf352669mr37082185a.8.1772048531319; 
 Wed, 25 Feb 2026 11:42:11 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:891:7008:f2e0 with SMTP id
 af79cd13be357-8cbbf352669mr37078485a.8.1772048530853; 
 Wed, 25 Feb 2026 11:42:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10933ea99sm3616e87.16.2026.02.25.11.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 11:42:08 -0800 (PST)
Date: Wed, 25 Feb 2026 21:42:07 +0200
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
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sm8750-mdss: Fix model typo
Message-ID: <nivmy3yrxapwwba3lmmfay5ikg7tuyjelxvhhswgsavyfydabm@wkcqc2u2q44c>
References: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225173419.125565-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yOEZMttIimG8e5IO8q788_OrAuEdFy-K
X-Authority-Analysis: v=2.4 cv=IqMTsb/g c=1 sm=1 tr=0 ts=699f5094 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=WlJJIdEJN-TvAJyvr94A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE4OCBTYWx0ZWRfX32gHzgwbqULV
 lBndwpc/hCSp8eAlHwfzkpehv1omOaTSSYb/VGulBo4GLh6riX0qnHs+itmtNC6CK0z7LSBxji2
 Oerm9evxv91wvA8BGaBdDEVd57GRA+bfKVk3Z4p0qQqjNTQnZz8qXuEcMXO+pKZKQ2tRYuJvGm9
 kezOIIlSh+9u/2FVmCd8CKoQmdV6iwH8lRStmWAEMuc1+OCGfVQyOHWfyZ4OlRzCiAJOSACYRJj
 H1Dq+HrL5+e0BDsq+22WgTeGMJPcDFxCtjcv2lBXeqv77DnsTa8HkoUvm+uLb27a1sEVj0gONwc
 Yons0w+JMlonA28D5JlFOi9WhF0S1uWIozmTGiGNniA9OvOOZIQl1kZ2/rxvlNrxClTVfGU+gp2
 w7GZSd+SzMzIu+ZBnnnJYyiCuGq4r2+ZO0nK39B6WkL+s+vy+xbHLfOVMXLQ94p9Qzkl+UKkIER
 UeqWNzwPPxaKqzHwZjQ==
X-Proofpoint-GUID: yOEZMttIimG8e5IO8q788_OrAuEdFy-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250188
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 317F019CD4A
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:34:20PM +0100, Krzysztof Kozlowski wrote:
> Fix obvious model typo (SM8650->SM8750) in the description.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> index d55fda9a523e..a38c2261ef1a 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
>  description:
> -  SM8650 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
> +  SM8750 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
>    DPU display controller, DSI and DP interfaces etc.
>  
>  $ref: /schemas/display/msm/mdss-common.yaml#
> -- 

Fixes: 6b93840116df ("dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750")


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
