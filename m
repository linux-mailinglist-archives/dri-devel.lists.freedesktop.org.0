Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210D9B2D62
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A0B10E476;
	Mon, 28 Oct 2024 10:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aqnFFyEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B6110E473
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:52:05 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso61173971fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730112724; x=1730717524; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=75RMsbUWQqHekparXFuWHBkmwh5mRCxsXcIEwNzMOBY=;
 b=aqnFFyEI3+6LlzDx7PZKBT3x55dIbbgRO7P2JTKhmZfsdL4IJ08LOO2/aYJCPVuC37
 ZdZYZ9EBIZyPeyyCpLwy/AlRtvC2KhBTg8xchu0oNky4Nhe/cHsf41mzgm5h2XxX7GWc
 34hk9sVYTC381uY3s1hgou+Am7gdBkB+SDxdAU5/7cNpexkawSDCil1rlNJLmkVJqoJ4
 8wfWGivCUPVq6SAiUAgLnWwkqNwD4gxzSjO4bEX1+VRhdZRXuSSMIHFMK52hzuKZJ/UU
 vRwJ9OXXseqFv56o/Pu3ddxDnICGSyF2lWtyomqZf97b+bwY7SHo1JSYUneYEuxukvMR
 RukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730112724; x=1730717524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75RMsbUWQqHekparXFuWHBkmwh5mRCxsXcIEwNzMOBY=;
 b=c8uCt9+Fn0L3FtCJdZFEQkYq7eC67aLu0GtyXRkIeIUETuYa9A0kY7fj1vhv3dYjZW
 Fa6XZgcPLka7GVjm5XBY+ZFXE9RaMr+Gpqxf9t2qcji1PAcDhu+Hd/+NqTlDlU71qtkg
 ipszxyaANAjojY5tdCPgNTnb2mTR+ZTNdzzplKgUp9VFrRaFTmPWmnf+RGUFKUQonCE4
 7WJ8n1GMDGzs5R/R8gcJgEQ9y/xQLhICy2CiDBF14htNVH8m27d+4w/9tC0ftGlJL88K
 k0PmriFUvFURr7ZZCD9zGOCzWjHOfGJ2Ra0Yec4eneQGwA/rQ2CNeDkIroN+3gM1/FgT
 Sktw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXEBJDOJzt4eQ8DRGVmRIjla/9tlUHoHIIU9a2aM29oOUcMy247E7Wr48JMbxe4pHtC4McswWae44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7dmqrf0J9GUVs6CNU3cyetPbK431yXvreGB3NzM2HXNmA28OD
 Kmm4wZ5bxdLa/FwZIseO4XXAEgc6ReADL82bURu9nX6VaMTioHC/tS48fQbIfrY=
X-Google-Smtp-Source: AGHT+IF5XS7brW24GwzPn8C79xMYDDlFcF/p3I5r6p+BJD+JCe/k5iD0/fpLRAMX38xJREuHzHCMcA==
X-Received: by 2002:a05:6512:4009:b0:539:94f5:bf with SMTP id
 2adb3069b0e04-53b34c3f9b6mr5770526e87.59.1730112723695; 
 Mon, 28 Oct 2024 03:52:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e126dd1sm1049798e87.77.2024.10.28.03.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:52:03 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
Message-ID: <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
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

On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
> > On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>
> >> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >>>> Clang-19 and above sometimes end up with multiple copies of the large
> >>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >>>> fill the structure, but these create another copy of the structure on
> >>>> the stack which gets copied to the first.
> >>>>
> >>>> If the functions get inlined, that busts the warning limit:
> >>>>
> >>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>>>
> >>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >>>> the stack. Also, use this opportunity to skip re-initializing this table
> >>>> to optimize gpu wake up latency.
> >>>>
> >>>> Cc: Arnd Bergmann <arnd@kernel.org>
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>>>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>>>      struct completion pd_gate;
> >>>>
> >>>>      struct qmp *qmp;
> >>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>>>  };
> >>>>
> >>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> index cdb3f6e74d3e..55e51c81be1f 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>>>
> >>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>>>  {
> >>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >>>> +    struct a6xx_hfi_msg_bw_table *msg;
> >>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>>>
> >>>> +    if (gmu->bw_table)
> >>>> +            goto send;
> >>>> +
> >>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >>>
> >>> Is it necessary after being sent? Isn't it better to just kzalloc() it
> >>> and then kfree() it at the end of the function?
> >>
> >> Keeping it around will help to cut down unnecessary work during
> >> subsequent gpu wake ups.
> > 
> > Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
> 
> I think a6xx_gmu makes more logical sense here.
> 
> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless

Hmm, are we expected to handle / perform BW requests in case of GMU-less
devices?

-- 
With best wishes
Dmitry
