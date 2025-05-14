Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA82AB75C9
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1A610E703;
	Wed, 14 May 2025 19:23:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rrg3c3g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193F10E703
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIj6Vu002604
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yni3LltaA+0t8FG4nm2JYBtt
 /uZ60urKlv5zgXzidKY=; b=Rrg3c3g5co+tTuf+LdMu2tXpZFIPWU+w+dBOXMLw
 WNs6nYDjR1A8DgZ5YfHK/8Q3AaCwBlUK8axzq6vPToPmEJc7yQIWgViERORCbh6F
 0/aBMhSi02ITQi6F7qJfs0f5iewwlE8V+67c4+mui7Np48RuFiCWxs3FsCY6HpQG
 x2Yengs2V6ehaqoI7b8rYGEOljnExFGNaCnxERl3YiKaLYHsBlNhHh5NNoP/vZmz
 vwITdVi2iT6tK46AD+nEkhZkJfsPiG0vRQthZTlLfQddqY1XlqXPQUhqxdZOE7+1
 Xo9DRmxCRUZlBlKNzgGwQSZGdXnMLLy6IgXZRFMtexxEbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex3u81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e6f5so26652885a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250619; x=1747855419;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yni3LltaA+0t8FG4nm2JYBtt/uZ60urKlv5zgXzidKY=;
 b=D4z1JmXBJHulJOJ01Inz9LPQU0KTaaB0wTbV3csy2utWTk3Ufewt9yQlTuZEIbcnjx
 MH6iudyw8KTSb1wCV3FlftvNKdAXN7elg9mW40kc1jL2dDKURUDs3eMjXO4ogarffExd
 MFJd66N7XlKLDu30tw6FUUluGEWPchgw8l5+M8Np4gPYbhnEO0CyCHEnqTT7kgntXR07
 EfFYbb1dC/qZ/EPd7KlVxCIX0at/o508DVsUMhKi7y3BOMDDdC8VX871XKMShItJJK6Y
 7+Gwd8Ecywj/YZuE9SAiIJscyqCBkFBARSG+9YFJDgZYn3O9qGpqiee5xHogrg4O7+HG
 Y6mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpDYxnphTX2PFdL4LuRdmf15LWejAAt/uhPZbrmlNjkVAotsPo6nlA/4eqsclD5YpxtafTzmsma6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3y9qkGKfhc69Qi4z/fbsyWM/401fPEQ9pkeZBJPQLpNMUXwUn
 jzJ2hTAbvwRO77IfC6ifaXHAX1i+rSi1FzahtVPPxmXEMgKjouRYoMWS5FtH+wjUvo8UkHhzsTK
 6ii08ZGHyn16RVrjPZYI3F6nFiRjY8KuAoq/X0AMyuN2XdpEeSVh5LsPfVdQRftdrJNk=
X-Gm-Gg: ASbGncseCGglTPTAnO30gt15ESnbDqp/NPzH+dNMvW+wm/LNCRXVvFGBUDKFN9KotC3
 twzL8uRQ6V9CLU/Io0JkdaOkSlRktc4XLR8NB1kvZjolMrXJFqeL2CzCPE60ZjxTvrLp6ZjFtCQ
 EHSoKYiVsfnVZJIkn7zyHV0wp7SkArPK/1ot/AA3QZLVuzpq9xme2zvwkn+45dIEh4KWxNrvEEg
 wTzfJVaBR+KsKAKMTSBWXVwubfy3fHfFfpswsoQBbDQpcIxsRYYhzOoWF85qjyrQe6BW8NzQjXz
 va5/zCjSRGlrpQM1zVvW8RkXshYayCK/aUjny18reS7PP4flrfaNjzE/6OmtQGVQy0gHHSfU97k
 =
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id
 af79cd13be357-7cd287f8fdamr535577885a.2.1747250619578; 
 Wed, 14 May 2025 12:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBX2PjHSIJlvnaBpvy/6NraZk7yT3imlz6y9snlTUgoROJLWl1hT5lxeeviHrQmSmcw02csg==
X-Received: by 2002:a05:620a:1a8b:b0:7c5:407e:1ff8 with SMTP id
 af79cd13be357-7cd287f8fdamr535574285a.2.1747250619083; 
 Wed, 14 May 2025 12:23:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c33b7b2asm20255511fa.33.2025.05.14.12.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:23:38 -0700 (PDT)
Date: Wed, 14 May 2025 22:23:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
Message-ID: <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXxP5qw3FkU9gJ
 FR+NioHIosWBgOqAv8DMdgpblpSRSD3CoWbNab6epHyTO0/2NrJKNOomk1CIQZDA0CUuuHZEYxm
 HmE1KpAtgesDhg2VLq2IFwkMcH7/MDZYTiqYWKUGlM1+yCneZwv5S7Fbi0qLKu4+0v5geu/Sve4
 e+G5/YTWEaTgUHJZP9hy2OaCQ+5MdWfyqiHpId7eb/SRYwanX8SJ0Jw1YEyiE/WoA+EaX0zp9wJ
 hHP+r/8Tp6nW1gf0g4clckiGmvyiShZ9nI7RArv4QYLhyoTrfDaibgM3rzqEXFHz2gfGWh/rzWy
 yfQ5vlawdBYgmujAoJ1f7ofHU+qKYucR/3ZCjDk1EBQT4rtZlPuUDxCZH2gFUy0RAVAhormK8+u
 9orB9BpH22+p+uPU0bcnpnFXo+joJxo4oGFFSm7DB8s5oEEeoVmiZ0SmVXpV+onztQE2Cru1
X-Proofpoint-ORIG-GUID: KbMH2fesjDKojsoqn_LFzddLyfXGgA-G
X-Proofpoint-GUID: KbMH2fesjDKojsoqn_LFzddLyfXGgA-G
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6824edbc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jk0O2evD6aPmCTIX_U4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177
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

On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
> swizzling) is what we want on this platform (and others with a UBWC
> 1.0 encoder).
> 
> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
> bits, as they weren't consumed on this platform).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>  static const struct qcom_ubwc_cfg_data sm6125_data = {
>  	.ubwc_enc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_3_0,
> -	.ubwc_swizzle = 1,
> +	.ubwc_swizzle = 7,
>  	.highest_bank_bit = 14,
>  };

Add a comment and squash into the patch 1.

-- 
With best wishes
Dmitry
