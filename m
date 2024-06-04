Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E228FBF57
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 00:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F5E10E1CB;
	Tue,  4 Jun 2024 22:55:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="etN/bq0a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B01410E1CB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 22:55:06 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-681ad081695so4543161a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 15:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717541705; x=1718146505; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
 b=etN/bq0alduXPerbyLjUD3XI6icFjI+YxVsgeKEb+yDWr7COCUqN2L7pQ6gR9uBNNT
 +vQEFvES9+vJjIRwI9OklxrDZJ9fupVxTo44eivg5IZpDXKWPqzm3uGY6/6Bl7ll6npd
 k6TnYu+PT8AgQfwNm3OjAPjtQKBpK6dvvcdOTVY0fItUgdWzGkGSuBdk1r4sJeONyWbe
 TAAHD8J5R6Z+bxve0t+r/LRiiC44Ss7+qpKINbwL14IlAcb1777Gi3USWp5cCNkt6Rul
 Lcf5vDKn2LHyTPE+CGGBmVbL9BeGjir11qVBrC5NdUU8Jo44rV/JaSYVTWNdl2pjLRGo
 CKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717541705; x=1718146505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SQevM+iAWilYVFaIm59IJ4p3nypKMOp+UN8VS5oKnP0=;
 b=GPboSu1GdALoF3YiHn8LHIDPyhH7d6Wbv/o/g4n65f3mMRVq52IFUbs7dYDTuHS1Ot
 cblzgg2RaPOJWJhiKyNpKiWoDGPt4HxXIOd7yj6VyCeZV2hsk9/R0J3ZPJfJFBJzct/f
 XD9c4sn0vMuSDQSU5LzZKXnEnFrTb931bbjOvVtrQvEgQmbMN51mbn7effET8yit2HaB
 Pmqbxnc1Q2O0FGKYpLsyZ/m7wUHL8lOrPIKEYBlICGPBJM8zcEdjTfEkoIUxtoZ7tbPS
 7HXhGmvfvlrZCYYF23yDQtkNQUzyrvY8yBCbx0uDzHvDeHFa9T76ITqR7eAb0tN97v3C
 YBbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2nSfsewZfnw4ddEzfydgUgub+qo6v+bFqv/HDr1Uu7lXimfnku1Dt7xZRdpkUx40OUs/lzAV3PrGhy2mmSsw6omN7wVDys2NZgIpoBMWy
X-Gm-Message-State: AOJu0Yyh3nCnaLiiHsTuo0B3MWmC/WDcjtOsMqe1WyZ6BouHF3R1wwPV
 +nqu/EGSAmKXWBD4118f6OJiu+4LH+JxQuWU5YCZl+nu3LEyZqd5X236hbJ1oN6nxuioI0wsTh0
 DE8Xb+R8ejJwHJnVUPc4ARjKLDU/FtOqJ9bdkLg==
X-Google-Smtp-Source: AGHT+IEdxJwvadlhULTZyWilBXhj3SiFyCHIB/1Em0OwEwBh1H9runBVla3t1ChZKYRpSeG0b/daRqpR7likHUus/TA=
X-Received: by 2002:a17:90a:408f:b0:2bd:f439:546b with SMTP id
 98e67ed59e1d1-2c27db0f54amr812983a91.19.1717541705422; Tue, 04 Jun 2024
 15:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
 <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
 <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
In-Reply-To: <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:54:52 +0300
Message-ID: <CAA8EJpomhPJ9o-tWKRmuCzbZDn7CA4qkYMFWYs9qaGWOczq=sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 5 Jun 2024 at 01:30, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Tue, 4 Jun 2024 at 23:18, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
> > >
> > > Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> > > this is needed for automatically adding firmware to things
> > > like initrds when the drivers are built as modules. This is
> > > useful for devices like the X13s and the RBx devices on
> > > general distros.
> > >
> > > Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> > > Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> > > Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > index c3703a51287b4..fede5159e7f5b 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a650_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/a660_gmu.bin");
> > >  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > > +MODULE_FIRMWARE("qcom/a660_zap.mbn");
> >
> > -ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn
>
> > > +MODULE_FIRMWARE("qcom/a702_sqe.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> > >  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > > +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
> >
> > I'm a bit sceptical here. Each device has its own zap MBN file (this
> > one is also a fancy named a690_zap.mbn).  Do we want to list all such
> > files? Consider all the vendors, which are open-source / Linux
> > friendly, like FairPhone, OnePlus, etc.
>
> That's what's in linux-firmware, I would have thought they would be
> SoC specific as opposed to device specific, but that's not what we
> currently have, are we supposed to have devices that selectively work
> based on what firmware they have?

The firmware is signed with the manufacturer's key. End-user devices
verify the signature while loading the firmware and decline firmware
without vendor's signature.

>
> > >  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> > >  MODULE_FIRMWARE("qcom/yamato_pm4.fw");



-- 
With best wishes
Dmitry
