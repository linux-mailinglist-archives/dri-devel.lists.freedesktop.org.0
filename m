Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E614CE8DCB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 08:13:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFEE10E83F;
	Tue, 30 Dec 2025 07:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIvOZoAE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fL25M9h8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25910E837
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:13:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTMiRhk3159040
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2t4zTTKKthp0P8Am8Kh6TS+m
 +XzSxbQAsLzx7iUdk8c=; b=iIvOZoAEe2tkOOyie62WCeiytuUyKvrJpQ9jZPRE
 thHcjkXdyS1WMqk9XDgGQb3i/RZdnNuOHbJwjezBQas1Y/jl2j2V0Kcvr0tZr/kg
 DMfOGUCT7XgPE9iivgzvn58JUfytFQjn+Tc8PxYjYJ1RndaExTHp8fdlzy2hT1i/
 T5tQkcR3JS+NLYKlEYsaIF1V0X+sRcSYrqv2lED8fArc2nXhbsKyXo3EIPwfj94X
 7R0uh4+bA7Lt/XLxqYJGBVYj737IJgFc9CsiyCIEt7/+iP66XyYzf1yGtpi80GKh
 lsPgM1jz/fW3kO68Za1BkxuWBTCHWgToTpwDyxfVR7ARTQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v3pnf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 07:13:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a47331c39so261607296d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 23:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767078798; x=1767683598;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2t4zTTKKthp0P8Am8Kh6TS+m+XzSxbQAsLzx7iUdk8c=;
 b=fL25M9h8ZCtmhe05uyZrykVLug+KRSlvpmK8dD6EmUktd2hC8Dca+L9PqthjUpdVFG
 ROMAXGjCTE19MLIIq8R8KX7PEOF7RB7aHnFqtHdhGX84ws86EJGIOzqmvcN+Kvs+6YFw
 F8n/AmnWMTroYt1kW4Xt82mJJkrsm3bQF8KZ22M4zS2qKx8B9TQpBetOP51K1NVyHQFE
 7uQUgcduPbQeIaqi3hWxUaof8yWZAaJWXKZoBpMJ4St+/aUoc6rn3jfb7SC2dxUlRJzT
 v8/mkcWs1LwBHt/FnBZIabT+c0DlpavXYAPdC2YWaVOUaEvJoipOaxMBqBpxRuxLBvB4
 4XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767078798; x=1767683598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2t4zTTKKthp0P8Am8Kh6TS+m+XzSxbQAsLzx7iUdk8c=;
 b=A/QHvMBR2qrQtCDOLJqEgHhkL0tbxuuD3yNZUVBKklT1puWWgT9+1u45+6XZlGLXVD
 tAHllA+pTCYVSwqT+0+UoHiy97oWkMahL/kcEq8S21Ad1YlM4OUHO7pFI3CaY+9BS7+w
 VlfYghjA/KIrgdrm8+gjoNrcsLXtll8Vn8QXHB45OYzoWe2XK6POwsHNtZ5uLhVHthBC
 F5Edzj4QuplBZJSjGglDepYbExQ5MqpqxxMaaIjipvGkQU+isoNZL9Zq6t0/zf2XZPOT
 13yXvfcEOPm1sWP0gX7VToLPkd+VnBl9+LCz4JDUsD29busoS87HvjSGZd8RkfIcfxlR
 5fxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBj2w1tlT6tgJPnU4cQ0n811HdgGz/9brkGVWgjI3Ks09QE3Pp+VFhrteJ4fOGKCQ0yZEihwfrjcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF2ex3C41qATxQslV8CZeAeTuNwPpfFx5+zs7RIpJqqAFOFSec
 PoB2eH1mJW+RIHmI+tprzPbJiU245Yi1XbnFH1WbIe+gF8ZbgTDYkFGy90KwGhI0TNvMXcFY+Oz
 SGN5WPFQDCq4RtRWhg8l0qb5dPfb9l8OSvUN7qo9yzmGoClaCHEJWbxkTGqZHXGoTzOnl6A0=
X-Gm-Gg: AY/fxX4EVLRkazrkTdS8qm7wqdJnHo8kpbLnGuNOYfSILG23wEdCdNPBzl/k2a+RvYW
 QK5vA8h9Okau/VORIXsYsEYxwbAE07cixTQ1XyHoH+3v3jzMjRZBS5GEWnU6goZlHsposGB9rq4
 wpWcCuerbQfiAFtZFgrtcUfpQuqc/fes5fO8FMA2u5+XB9f7NnsIIrHn5BIj3yl/ru4jPaD8qAn
 QDW8jjLjPTO2OSplKABzjAR7ooVRwb/QDQN1CVhU5BujJ18sw41vVvopg4kDael9lTRCccFsIvM
 Um9zv2HBIJtf2kljToKypbBqx6kJEevEWJQZwSnAhAbcIhS9G+XIOsql21h2nWggCEJxo5nO6W/
 CdRY+qEoxMpKQqzSOtE/BPqFCdgTpFj+dHlRpuDJ0VShEGDTJLuNuJsFZqqIMvrYdQaskvZD9ml
 wDEbppsDhgMIqMU7B1ieF0RY8=
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id
 6a1803df08f44-88d823300f6mr528311466d6.27.1767078798574; 
 Mon, 29 Dec 2025 23:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXL9PeBhvMT8/4p2SJ7DsWu4DdAlh7lnhb5mktPynlGQSvdJ49OQrCr6XsR8efN+SSL8GXEg==
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id
 6a1803df08f44-88d823300f6mr528311286d6.27.1767078798093; 
 Mon, 29 Dec 2025 23:13:18 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628040sm9952668e87.88.2025.12.29.23.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 23:13:17 -0800 (PST)
Date: Tue, 30 Dec 2025 09:13:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
Message-ID: <hl6gz2m5jcdvkobkwbzrnfulphdssrqqwnkt3jtap4eplr64ej@gmmeikz7z5n4>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
 <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
 <aVJlvFWcq5QMVWYM@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVJlvFWcq5QMVWYM@SoMainline.org>
X-Proofpoint-GUID: oHv5qwvxZCXKILO3uclmcavGe4eeY0qN
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=69537b8f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gKpLsENyAAAA:20 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=zvAJQZrOlr4PNjufmXUA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA2NCBTYWx0ZWRfX7Vr8wnbXYqpG
 l7KmnkJOLJ2iqGpLejYl6ZPKpnuV+znVfpvg3jz5KfOembvCrTnxCRctGzG1+yAayoD5PhCjB1h
 ZJvvXU0GXXlV+WaNhGStfsDpWPLzSEOxzK7yE+qzbX/uXpzp/UtukSTsInfqrnZCnE193QgYLAK
 TSR9qbiN1BXxTF5ZpSYj7inPTvjthARRwbT3q6m4N4f3PV3MPPpCu3AObycVCPhWxM13XLJthFS
 Fuuu32OgNqwVVuKiKkaNTJ4KfhdSlIWllDnhyznWfeh5bQNkPwQZasy1zNK4nR8Pcd0ZgNPSFPT
 UHNnVVtBHKwu/eRlC5wd93N4pMn3SCXS0BIKXjzg1+ssYjcURQBJ/G3NoJjbEcZZv+c7K6Gj7CG
 cnZIrLCt6zYJ3BuwgzQmH+n/wdCGlNjoC27aNHGFmaNyrgfcTgVn+Bv6o5gkF9bvKVrh8vqQsUE
 WWITgsUKaoJGG6ssRDw==
X-Proofpoint-ORIG-GUID: oHv5qwvxZCXKILO3uclmcavGe4eeY0qN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300064
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

On Mon, Dec 29, 2025 at 12:39:13PM +0100, Marijn Suijten wrote:
> On 2025-12-28 05:57:12, Dmitry Baryshkov wrote:
> > Since DPU 8.x Watchdog timer settings were moved from the TOP to the
> > INTF block. Support programming the timer in the INTF block. Fixes tag
> > points to the commit which removed register access to thos registers on
> 
> thos -> those
> 
> > DPU 8.x+ (and which also should have added proper support for WD timer
> > on those devices).
> 
> Right, yes.  Commit 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming
> through TOP on >= SM8450") was already a fixup of that (though marked as fixing
> the followup commit 100d7ef ("drm/msm/dpu: add support for SM8450") for being
> the first to use the new DPU_MDP_PERIPH_0_REMOVED flag).
> 
> > 
> > Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> ...
> > @@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  
> >  		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
> >  			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
> > -							 vsync_cfg.vsync_source);
> > +							 &vsync_cfg);
> 
> In some way this makes me wonder if we simply need another struct, in favour
> of not missing fields that are never / not-yet read, although resulting in more
> clutter.
> 
> (Just a nit / question, not a request)
> 
> ...
> > +	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
> > +		u32 reg;
> > +
> > +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
> > +			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
> > +
> > +		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
> > +		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
> > +		reg |= BIT(8);		/* enable heartbeat timer */
> > +		reg |= BIT(0);		/* enable WD timer */
> 
> My downstream also sets BIT(1) for "select default 16 clock ticks":
> 
> https://github.com/sonyxperiadev/kernel-techpack-display-driver/blob/61a727e1ce1fda617a73793b2cbb76b5ca846ea2/msm/sde/sde_hw_intf.c#L511
> 
> Although it doesn't read back the current register value.  Do we need that; or
> maybe you are inferring this "missing" BIT(1) via this readback?
> 
> After all downstream removed the readback exactly in favour of setting BIT(1)
> though because of a "default value change" since MDSS 9.x.x:

Ack, thanks for the note.

> 
> https://github.com/sonyxperiadev/kernel-techpack-display-driver/commit/e55c68138b04770d51067c158f92de526e0c926e
> 
> - Marijn

-- 
With best wishes
Dmitry
