Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92558975DF5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 02:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7419D10E0E5;
	Thu, 12 Sep 2024 00:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mxPL5zZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1599910E0E5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 00:26:30 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2d86f713557so254388a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 17:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726100789; x=1726705589; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KfXOZmFnB0RCicjkER0daQ4yJ1WQ0U6fnNsCPP4bbDk=;
 b=mxPL5zZcTU0yixhbNkRDmpozEqokHc+o2lQSMrHpm9NUUY0AudNGvrb8JyLXPlbW+i
 GBf/ZT1PjIC9mRu5JBb2qRmC/F7LrcxZnvy3PxfeUxAqJhjbm43+PzmCbVNADLx1sjPj
 FlW18Zs4XabtY7Kkhg2ExIboQDT3zurizOgftEW8plQiM6LiLmneIe9h1Z/8yiWTc0Mm
 367dMQLCpdHtpYFfuyf1rW1UzLXMzANO/yi/pryZN9heW62xrgjSKoAb1EWYeTUhige9
 DpXJq1GMR6MrW4I0CqLtfPb5VkssIoB+5osTpY0cmfnH4thYViHtxus+c/GP3A8EtlRo
 bUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726100789; x=1726705589;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfXOZmFnB0RCicjkER0daQ4yJ1WQ0U6fnNsCPP4bbDk=;
 b=ohkxRmBrT1gYv6o74/0sgXNoUhkss1iy3gJK38NhaMFAhjRGkRAhKuAXrWcDVUtaF1
 7knNgFlDWW3v6Dh+A70ZNconL+biviA7KPAYvGssgpNpItSCX+7QSicm5VCQPzSyCa+D
 Y/8dzOY4fM1/WW2SrIlPWvvsSWpG58BQOpYXOIlZdZlmew9G+fHITDzSoKmT8RRkOeak
 kn5wJ1fHWSg+P9FMvWHMYjIMaOFXs4lxm90l6/n1WAirGu9S5wguojvEcOAV+0YzRqT5
 wguWIPYotsvmZlJuObMMQwIkTJLOLHoCnoEo0myOQ5LP3ghSoiNGEOh3z3pD4guFEj2a
 Z6Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPIdZsrSgP8DChWb+8Mzx7GGOdalDie4X7+UcdDIvpQbY6yQGdAdT0Ttz17wmeINOm6Fq7u+NnlM0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJHN8CafcNkFC4BnIrSRK7zros3fNvZBDLEq+eREAHn1LnyaUV
 r7B6tgUPDF6g7qhOQecqhXR1V866DiaXcGDHpsSFxb8O7eDo0HUt
X-Google-Smtp-Source: AGHT+IH2fGYf4ERmiPFCi3lGAkDSSQdZ8YwlweCm1l7pE1CERkvDT1yK/XaWyerqooXL1IfLZ8ml9Q==
X-Received: by 2002:a17:90a:684c:b0:2d3:d414:4511 with SMTP id
 98e67ed59e1d1-2db9ffefa37mr1086933a91.24.1726100789148; 
 Wed, 11 Sep 2024 17:26:29 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.231])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2dadc12dfccsm11204096a91.47.2024.09.11.17.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 17:26:28 -0700 (PDT)
Date: Thu, 12 Sep 2024 05:56:23 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: tejasvipin76@gmail.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, javierm@redhat.com
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi
 wrapped functions
Message-ID: <ZuI1L8mypd0kyw7V@embed-PC.myguest.virtualbox.org>
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
 <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
 <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
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

On Tue, Sep 10, 2024 at 02:19:53PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sat, Sep 7, 2024 at 1:32 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > On 9/7/24 3:53 AM, Jessica Zhang wrote:
> > >
> > >
> > > On 9/6/2024 3:14 PM, Jessica Zhang wrote:
> > >>
> > >>
> > >> On 9/4/2024 7:15 AM, Tejas Vipin wrote:
> > >>> Changes the himax-hx83112a panel to use multi style functions for
> > >>> improved error handling.
> > >>>
> > >>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > >>
> > >> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > >
> > > Hi Tejas,
> > >
> > > Just a heads up, it seems that this might be a duplicate of this change [1]?
> > >
> > > Thanks,
> > >
> > > Jessica Zhang
> > >
> > > [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
> >
> > Ah, thanks for letting me know. I hadn't realized someone else had
> > started working on this too.
> >
> > However, I would argue that my patch [2] is a better candidate for merging
> > because of the following reasons:
> >
> > 1) Removes unnecessary error printing:
> > The mipi_dsi_*_multi() functions all have inbuilt error printing which
> > makes printing errors after hx83112a_on unnecessary as is addressed in
> > [2] like so:
> >
> > > -     ret = hx83112a_on(ctx);
> > > +     ret = hx83112a_on(ctx->dsi);
> > >       if (ret < 0) {
> > > -             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> > >               gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> > >               regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > -             return ret;
> > >       }
> >
> > [2] also removes the unnecessary dev_err after regulator_bulk_enable as was
> > addressed in [3] like so:
> >
> > >       ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
> > > -     if (ret < 0) {
> > > -             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > > +     if (ret < 0)
> > >               return ret;
> > > -     }
> >
> > 2) Better formatting
> >
> > The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
> > quite right according to what has been done so far. They are written as
> > such in [1]:
> >
> > > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> > >                              0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> >
> > Where they should be written as such in [2]:
> >
> > > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> > > +                                  0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
> >
> > All in all, the module generated using my patch ends up being a teensy
> > bit smaller (1% smaller). But if chronology is what is important, then
> > it would at least be nice to see the above changes as part of Abhishek's
> > patch too. And I'll be sure to look at the mail in the drm inbox now
> > onwards :p
> >
> > [1] https://patchwork.freedesktop.org/patch/612367/?series=138155&rev=1
> > [2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@gmail.com/
> > [3] https://lore.kernel.org/all/CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com/
> 
> I would tend to agree that Tejas's patch looks slightly better, but
> Abhishek's patch appears to have been posted first.
> 
> Neil: any idea what to do here? Maybe a Co-Developed-by or something?
> ...or we could land Abhishek and Tejas could post a followup for the
> extra cleanup?
> 
> Abhishek: are you planning to post more _multi cleanups? 
I’ve just started learning about the DRM subsystem, I don’t have specific 
plans for _multi cleanups at the moment. However, I would be happy 
to contribute further.
>If so, please
> make sure to CC Tejas (who has been posting a bunch of them) and
> perhaps me since I've been helping to review them a bit.
Yes, I’ll make sure to CC Tejas and you.

Regards,
ABhishek
