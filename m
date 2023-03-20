Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351B6C1869
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5687010E5C9;
	Mon, 20 Mar 2023 15:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4DD10E5C5;
 Mon, 20 Mar 2023 15:24:03 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 v2-20020a056830090200b0069c6952f4d3so6922763ott.7; 
 Mon, 20 Mar 2023 08:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679325842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OJBAjE1F+aLwkPYivvIoImtiWi1TIUQuyBQ4Yo23rg=;
 b=pW+AHoHevoT6B3TzuqHDALXmRkU0lKsBdbvt74HDbXovSdA+UaJ+Mpcgs4PyyIonqU
 pG9V9ACO0J+9mki2LxGKrC+EnMdYfP+R4avE8mIjRi2Z/VdrDzcksQTPMQRvfKYUK+a9
 e/i/BwROszQSLXYrla9+VOMdWbX/0BgigFdAk6mK63k7Ie9vGFs/bMlU23HsQLrPk3x6
 QAnZf2nKLQxO2FTsMLEi7UVbGo+i3/z+O1AhXrQpYG2CHFncw09g1ZaVwg17dS2hj3RJ
 m589LdkoBH/aH7ZihyQzFgjVY2IRRaxpeK/U266LDRPsXLYx7kvnBqNGhYgNcDyiKuKL
 E+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325842;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2OJBAjE1F+aLwkPYivvIoImtiWi1TIUQuyBQ4Yo23rg=;
 b=2rM3QGgII3WV5ZuFVFNlD+vCJJJTZHE5Z9rkiJdsVXAGk+x+26GfEWxIGhzETHjRPa
 AzrOaPQWG2sYi0i7dFbDBNYwYeAUKePcPpNGgQYmDkGURG8qsU11KNLMiaXzEVsBWy6b
 6Ksy9LV/ZX63Pa6fblBoznZzFFW1vM9MvLpKx71KEpP0bbZbdWG4qyyP6VXcHdErSQoT
 Me2EH/JPa/HMBwSBB5/w6xISSvdPAHAiqAvpiPJJC3V9mC6/NTGQb+fpEEuduC6Rgs2l
 cvUKFkjnR6LS9zBR+8SBZkyrbJYkAOJ9a6Ka+f0mXQo1SQHD9wfJWjH340joKFYPb7C4
 rLOw==
X-Gm-Message-State: AO0yUKVWmlekqt97QB3Z3vi+njy8jZaQAEgSiQFgspsY3PHhteJr8mtT
 cXzU1soroZEmVakJXdGWIqg2w20V7L96XBw6Enc=
X-Google-Smtp-Source: AK7set9EXkbp3LniU6G5GzcsuFyU1GsxqwcjfJyXVqBuIEFRY3zlEANjxcHUAPJMnSwJNyWDwxhM38aqXD3WoD0xDbk=
X-Received: by 2002:a9d:7f88:0:b0:69f:882:cdb2 with SMTP id
 t8-20020a9d7f88000000b0069f0882cdb2mr130805otp.3.1679325842656; Mon, 20 Mar
 2023 08:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
 <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
In-Reply-To: <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Mar 2023 11:23:51 -0400
Message-ID: <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Xinhui.Pan@amd.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:19=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 20.03.23 um 16:11 schrieb Christian K=C3=B6nig:
> > Am 17.03.23 um 10:20 schrieb Thomas Zimmermann:
> >> Hi Christian
> >>
> >> Am 17.03.23 um 09:53 schrieb Christian K=C3=B6nig:
> >>> Am 16.03.23 um 10:37 schrieb Thomas Zimmermann:
> >>>> Convert radeon's fbdev code to drm_client. Replaces the current
> >>>> ad-hoc integration. The conversion includes a number of cleanups.
> >>>> Only build fbdev support if the config option has been set.
> >>>
> >>> I'm torn apart on that. On the one hand it looks like a really nice
> >>> cleanup on the other hand we don't really want to touch radeon any mo=
re.
> >>
> >> It's a driver in the upstream kernel. You have to expect at least some
> >> changes.
> >
> > Some changes is not the problem, but we need a justification to change
> > something. Just that it's nice to have won't do it without extensive
> > testing.
> >
> >>
> >>>
> >>> Alex what do you think? Is that worth the risk of breaking stuff?
> >>
> >> Moving all fbdev emulation to struct drm_client is required for new
> >> in-kernel DRM clients, such as a DRM kernel logger or a boot splash.
> >
> > Well that's a rather good justification. I suggest to add that to the
> > cover-letter.
>
> Ok, will go into a possible v2. The mid-term plan is to convert the
> fbdev code in all remaining drivers to struct drm_client and remove the
> old ad-hoc callbacks.
>
> With struct drm_client, we can select in-kernel clients at compile time
> or runtime just like userspace clients. I guess, we can have a bootup
> screen and then switch to the console or the DRM logger. Or go from any
> client to the logger on kernel panics (or something like that). There's
> been occasional talk about userspace consoles, which would use such
> functionality.

Patches look good to me.  I have a pretty limited set of HW I can test
on since I don't have a functional AGP system anymore and most of my
older PCIe radeons are packed up in the attic.  Feel free to add my:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
to the series.

Alex

>
> Best regards
> Thomas
>
> >
> > Regards,
> > Christian.
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Christian.
> >>>
> >>>>
> >>>> Thomas Zimmermann (10):
> >>>>    drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
> >>>>    drm/radeon: Improve fbdev object-test helper
> >>>>    drm/radeon: Remove struct radeon_fbdev
> >>>>    drm/radeon: Remove test for !screen_base in fbdev probing
> >>>>    drm/radeon: Move fbdev object helpers before struct fb_ops et al
> >>>>    drm/radeon: Fix coding style in fbdev emulation
> >>>>    drm/radeon: Move fbdev cleanup code into fb_destroy callback
> >>>>    drm/radeon: Correctly clean up failed display probing
> >>>>    drm/radeon: Implement client-based fbdev emulation
> >>>>    drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
> >>>>
> >>>>   drivers/gpu/drm/radeon/Makefile         |   3 +-
> >>>>   drivers/gpu/drm/radeon/radeon.h         |   2 +
> >>>>   drivers/gpu/drm/radeon/radeon_display.c |   4 -
> >>>>   drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
> >>>>   drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
> >>>>   drivers/gpu/drm/radeon/radeon_fb.c      | 400 --------------------=
--
> >>>>   drivers/gpu/drm/radeon/radeon_fbdev.c   | 422
> >>>> ++++++++++++++++++++++++
> >>>>   drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
> >>>>   drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
> >>>>   drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
> >>>>   10 files changed, 464 insertions(+), 433 deletions(-)
> >>>>   delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
> >>>>   create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
> >>>>
> >>>>
> >>>> base-commit: ec0708e846b819c8d5b642de42448a87d7526564
> >>>
> >>
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
