Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2AB0FAAD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 21:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385E110E848;
	Wed, 23 Jul 2025 19:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1hsHUTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5D410E85D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:05:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NGq9a0024471
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LlwxGzbxOFLE6tNUdLnrCDcI
 n1YFSoVX4yc5JSgu4+8=; b=l1hsHUTrgTE7qd/eAxzIIAPPwarGjdXcx56NN52j
 F+j9zlJ6VRNZp825RrlRrIUojTEpFyP6CU8DHN3zQj9uhORUL9BRsCaPaGL5OQwg
 Zzat7JfrFHTsTWFHXhub+YhJWBF1s0tOXv6vkP9YIST3k/Aulb06J2NhkND3lg5k
 1Ttuwtd1HB+WuEYWXcwjGJSxatj+yu7GnHQfeaPBGwGApIttVhUPQ/hElc+DnSL0
 sktYR5LPlavblOMiiRdz4Xvkq5+mkNq229iK8Ux4j1Qgeow4CKqGcy3yo0IBDvc7
 Lbjo9VLg3MAVDp2AgV/+NRwpvbybNozyDgyLdZ6KFSVjoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3es3up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 19:05:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e1b84c9a3dso29659185a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 12:05:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297505; x=1753902305;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlwxGzbxOFLE6tNUdLnrCDcIn1YFSoVX4yc5JSgu4+8=;
 b=htZkZ9yfpOc8Ts3R6ndk8twRgDazn7za1TRRRjNz+NUeKudRFcbNSvXbRWTeRWi0DE
 17/h3VV2WuJzBCt5E0QyPRd76JvVkeHpaJMaPsyVFlwSZ0DHoQFNy0zZ+bQ7P59OnPuo
 bPDZKL4ZZ9CTyCYjDjOgMY0A2EvlU4JnLuKzL4FxleRjDE4W8QFvPW6hpZLj6Hp0hEec
 uhvl59f+wMEsK6UrqDI+tTUfHjHgcXEUPEJINNSt6KevYZ9x+pOBPGQ+5EntBfEjohfg
 Rec156GSp1hiv8+joinJkiqE27rxZ0E4hA47n+7kAUAvgzXFGkYrMpAhmvV7HD4Fj91T
 3R1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSk4k57sy8R0ptb84YtsZfoRO3o0Zeo0stbdwXW3OmR2fAOyZpcxWMHz/IwfYWe/cH4dp0Cd6GZgY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+f30PhnOYKxbU4ExUpDcug+h8hHjWupIufOMhGJTANBhJfRav
 JfOSeW2G7Mbbf8qWNx7jvk3A5ojQgb0T+TIJp1o4XHILG0iJsSpn7qffWZZ9bcycmJUzop4XidG
 pvpnCKIk1VQC4RZe8kKle/vJ9Z5JVrFMntavig0iSpB0Ixz6nAyajx1CaJjyIpviQ177wUHA=
X-Gm-Gg: ASbGncu3G1Z8Xzfmmhlwj4elDuRd7OoWGT6JmeASvqVwtnpa7QcuwzWfY7uGg1eiDju
 P2kr9gqLmj/P3IUL8yd370qNv3tgarh3r7VVW/91Da27dtJ43UPcplMOAekJZkeWXgqheFjHPuY
 2mcolbvjLLFF7gb9OaAXjwZNCgke28ZKQQTvHfltavKFSMYNcf1PVkc4luVV9yeLbOtkezZumaw
 ycljtt9vSIUMch8c6LiCCxKdDITdZHC8U67kEIQUmRgqtbotYZrCSh14RKJlRHopv/MqWmUynub
 UtsWO0vb0MxbcaQotUJAF62JifkU1Br5gGU37CHin7h5YVlaZZHEfxrqBIbCdk5Bf1fBiw0JAuC
 bDtiIETkov4akTYmJPIzL2K6KLlx1W3IF3aWhjQRT9XK/WxFbC8vk
X-Received: by 2002:a05:620a:a201:b0:7d3:f883:6047 with SMTP id
 af79cd13be357-7e62a19e6bdmr438161385a.51.1753297504548; 
 Wed, 23 Jul 2025 12:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVikEHzskkn5r6WHCg2DXMAwpPQxlleG1dXDP5Na0HIBh6BhiLe+Oy1cOXXzmZ/m6sol52RQ==
X-Received: by 2002:a05:620a:a201:b0:7d3:f883:6047 with SMTP id
 af79cd13be357-7e62a19e6bdmr438155485a.51.1753297503926; 
 Wed, 23 Jul 2025 12:05:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a4e0338casm527398e87.190.2025.07.23.12.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:05:03 -0700 (PDT)
Date: Wed, 23 Jul 2025 22:05:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 tglx@linutronix.de, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add a null ptr check for
 dpu_encoder_needs_modeset
Message-ID: <ciawdvjevycjjuowmykfux2v25lvr66kzey4jklq7t5cjzqalj@qfcva77k2bvr>
References: <20250722211740.3697191-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722211740.3697191-1-chenyuan0y@gmail.com>
X-Proofpoint-ORIG-GUID: VHqmRz5-XlWIDMukv4FCXYlP3p3JBbr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MSBTYWx0ZWRfX9ozKjQlO07qw
 2OkFP4uht4U8w9VJf2/Vv8z7wpvcObAO0u4yTqrGA1uCo6bggNGNsK3fJp2YkSCuX9iL7jge3pu
 DvEOREpUM2plZYRl5ghgk6qTw7GmR1ySEoe8b3D9QAKW3Z0QM15WDQJaVgkDvX+Ab/V8cJyWRYq
 O9Ao9tsGHCewnwHkgA21mR+oOXpOAyEghUDQbiUQXmzgVijekBdjsel5u40e5E0XP39d+qAL4GP
 vVnN7oSUUXht+ryeFqbQ6oCx1dffpqBaTnK45s4R3Hiob36b9UBq6ID2CoiLjUdDXNxXYVfxNr1
 lqmfXvCB3UWL9dsrp4mHM2yRciEJRtuFvkvnevch9rtxnpheZuUC4d62qYi9D8NOYoM1GD1/qPI
 3Okj8RmGgI+3l/r6POmsS6kVdp1SaJA1cBRRZycA0ceapagICe61Cd5uqHKRfq3HZHVg7S6K
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68813262 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=_XfERVBWgaszTNbD_PYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: VHqmRz5-XlWIDMukv4FCXYlP3p3JBbr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230161
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

On Tue, Jul 22, 2025 at 04:17:40PM -0500, Chenyuan Yang wrote:
> The drm_atomic_get_new_connector_state() can return NULL if the
> connector is not part of the atomic state. Add a check to prevent
> a NULL pointer dereference.
> 
> This follows the same pattern used in dpu_encoder_update_topology()
> within the same file, which checks for NULL before using conn_state.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 1ce69c265a53 ("drm/msm/dpu: move resource allocation to CRTC")
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c0ed110a7d30..4bddb9504796 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -729,6 +729,8 @@ bool dpu_encoder_needs_modeset(struct drm_encoder *drm_enc, struct drm_atomic_st
>  		return false;
>  
>  	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state)
> +		return false;

Did this happen in a real case or is it just
yet-another-static-analysys?

>  
>  	/**
>  	 * These checks are duplicated from dpu_encoder_update_topology() since
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
