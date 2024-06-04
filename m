Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789158FBEF0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 00:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1B010E19F;
	Tue,  4 Jun 2024 22:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WqTdr5DZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20310E19F;
 Tue,  4 Jun 2024 22:30:19 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-57a7dc13aabso1971680a12.0; 
 Tue, 04 Jun 2024 15:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717540218; x=1718145018; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/zBIhwWOU3sfIXfCl/yDKdwgVeuDp4na980Yh4ssgHM=;
 b=WqTdr5DZr9gS57lXKtR+F0D7MISi6X1ku6ZUmar3Jg+1x8TYuz78y6XAwB8H1v86si
 FsMAQgMsP3S17hAlPyGR2K0VISKK0cVvHXGYzJBjzTYx5K4G/ZJFYAPxzvyQ4eC58D3p
 OjGIuTQVUXpQ3voxeqwTK05rx1X7B19GP5l1WwOcFGDtg8bqudmb75PYr18Qa2dGvHi3
 B0xU9hcBiY6CfV6krWRtfO2/7JJCx5XOZ+25C+dgreYQ4ucAFCgrFV7xv+pHttyShp1+
 x2DcYPtUJ7gQxBGtlyzdqKVvEzTtMEDK5DXY6kjEWWZqZqPlMTXEUBrQlkdqOXUDAtRl
 3IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717540218; x=1718145018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zBIhwWOU3sfIXfCl/yDKdwgVeuDp4na980Yh4ssgHM=;
 b=UdjfcL4ZJLGT0O/eTmim6VKjuFZyXkn2t28fbIDRmgFFAqTwSgKjdEYpKA9JGp84FQ
 OEcgfQ5EJwEuVXJYNfr9YMqGcmyWO4QTT/7CbQg2mBtHcejjB5y70IMqdt7zbfEtPwRi
 VxuQmbg9pmmEgTTbyky1Usd08tW+jMC0JScxt1CoyCgTZSeTr25r3iTlkubReHJ4qyLc
 q7z+dYaydk+40Vv85kMnB/y1l7N11sscqdLAyd7gUIKgxI2WI1mahNO2ZPPaqJphnNFB
 PoACc8LJsieEyzyPbLGHVbi5t7vD0tMLSmFQPdb9x2acuFf1MEU840thONz+MF4eWDwE
 I5QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWi5aw5Xx76giTEjHgc5r2g7CMAImmjFh4HcNnYLeaG/UvYWlPbdba/svZW2wz1KJFVFIw13PmcalekRxF5VZnxWiMeWa4ej4cXqvmEX5C6xLaHOyFBvg/anowJuA5t7VURfQnzjmeLOwmPzrpZKW1
X-Gm-Message-State: AOJu0Yzu/xwscfiEcWfPfefE2ObQRUKviEVXhzU5WXGR0E1Iw1+GM8bf
 LocqH+u+C2RZNPpQj5MZvMQlRBw4kgy8qm0m6e+SZjNj9Vwv5mOg3Tt/L93EgUH4v24cPR1Cuzu
 0Y6QA8uDuWR8We5iJac6Fi6KbDGw=
X-Google-Smtp-Source: AGHT+IEgc/2xYZJH0orvDOqF6CS/WciMa45guyxcdJXuZmAqXqt861e50qlHAxpv6QFDsG9tVrrKi3a+q2i2Uyxdt7g=
X-Received: by 2002:a50:d50e:0:b0:57a:31a3:f4e6 with SMTP id
 4fb4d7f45d1cf-57a8b6750f7mr508203a12.2.1717540217807; Tue, 04 Jun 2024
 15:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
 <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
In-Reply-To: <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 4 Jun 2024 23:30:06 +0100
Message-ID: <CALeDE9O9QmX2YUvMxbfVNcC+nmNNh2dgQkLvMqNaQNr+3S9Beg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Tue, 4 Jun 2024 at 23:18, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> > this is needed for automatically adding firmware to things
> > like initrds when the drivers are built as modules. This is
> > useful for devices like the X13s and the RBx devices on
> > general distros.
> >
> > Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> > Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> > Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > index c3703a51287b4..fede5159e7f5b 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a650_sqe.fw");
> >  MODULE_FIRMWARE("qcom/a660_gmu.bin");
> >  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> > +MODULE_FIRMWARE("qcom/a660_zap.mbn");
>
> -ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn

> > +MODULE_FIRMWARE("qcom/a702_sqe.fw");
> >  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> >  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> > +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");
>
> I'm a bit sceptical here. Each device has its own zap MBN file (this
> one is also a fancy named a690_zap.mbn).  Do we want to list all such
> files? Consider all the vendors, which are open-source / Linux
> friendly, like FairPhone, OnePlus, etc.

That's what's in linux-firmware, I would have thought they would be
SoC specific as opposed to device specific, but that's not what we
currently have, are we supposed to have devices that selectively work
based on what firmware they have?

> >  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> >  MODULE_FIRMWARE("qcom/yamato_pm4.fw");
> >
> > --
> > 2.45.1
> >
>
>
> --
> With best wishes
> Dmitry
