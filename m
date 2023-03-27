Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126096CB1DF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 00:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBCB10E411;
	Mon, 27 Mar 2023 22:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB54310E783;
 Mon, 27 Mar 2023 22:39:53 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 r17-20020a05683002f100b006a131458abfso2833876ote.2; 
 Mon, 27 Mar 2023 15:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679956793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lUgt/sxFdPO2L/YHRhAbRa6Kx4Baw60m94hwiyt4LWw=;
 b=lR7KSRn26ByHSzV/l311BgLSDjwvSr9MtJfcFMZ/grYU03tkRfnxXl7MvfpOXlPB3O
 HocqR8gs9Sg4LVeUfdUleLNQucsKpjOOou6MzgtnQsGaLpQNx2ROq7p115rL56bwY3U+
 qqMcM03NzuGtnQKmp4c+2NRXrl21yrrkT/ARgAEBIfOmiFqlCaODES1cus63xoWJ5kBo
 E1R2Xn9n8u9LnSvqkhLjRtSLU8E+wWj/BZf2r8PtHWg2uFrvNy04WV6T+/9/iDVXLOZE
 MbXr4tvH+Ea4JYN0Lw6gAWiIQGquh8ps9XOTd0gmL88WI9bvLhjq+qTsa8NGthRwRmV3
 FbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679956793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lUgt/sxFdPO2L/YHRhAbRa6Kx4Baw60m94hwiyt4LWw=;
 b=PbafC5GeTAxOYWUDyLbz9KSSOfkQpvhYD6tg7dazoMdeXy9FPFA6bimS659sLnBfpK
 d5sRt5qnyXimUm+AkRmsirpJMoz0C8Nds7P8B5Z+PtIOTl9oMMMoKlX1BO0QjZPQIFg5
 rTe5MgTnxjMZgSWLnlpPQJHWv5WIxWRWjPZFJIHe0KRfHhahoF6s190b450BatNGyEP3
 We/AQ2cxAUHYuggHMITDLDZd0XgNGRiagnOCcDWePsaOF+5eR+AzZdKTGRmpQF4GKAjg
 OycE/HtXIzvFaU5MbW3x4xuWZxEyYvwDoCf+nCPt7qcGcYhnpKlmDlA1lciP8pUN8ghU
 cBJA==
X-Gm-Message-State: AO0yUKVz2/o39gNEvebDPaBFtu3L9gTrKvD3SsuSuIzG3l8c1GsvGNy+
 +Lc7yZXb0wrlQX+JfbHoOUSMa4SkyFGs4V33Wm4=
X-Google-Smtp-Source: AK7set8zusvPx2Hk84mPMguh9gqCt99/xQO0nrUWQD4XR1+p279D180ORCS5kD07c0YRuEX2Mxco7uxgAHVtBePk2pY=
X-Received: by 2002:a9d:67d8:0:b0:698:f988:7c37 with SMTP id
 c24-20020a9d67d8000000b00698f9887c37mr4140439otn.3.1679956793059; Mon, 27 Mar
 2023 15:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
 <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
 <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
 <55157c5c-69ee-50eb-f5ea-c3b0aebcf948@suse.de>
 <CADnq5_M5PtfFDOhShfHtQYUPOJf0DaL0fmWmVbgTcUMzwODx_g@mail.gmail.com>
In-Reply-To: <CADnq5_M5PtfFDOhShfHtQYUPOJf0DaL0fmWmVbgTcUMzwODx_g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Mar 2023 18:39:41 -0400
Message-ID: <CADnq5_OV=PudZ0ryvtVWt+7anxU=33g7Zrai6FgSHzCh2JBi3A@mail.gmail.com>
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
 Xinhui.Pan@amd.com, javierm@redhat.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Mar 24, 2023 at 5:44=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Mar 21, 2023 at 5:33=E2=80=AFAM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> >
> > Hi
> >
> > Am 20.03.23 um 16:23 schrieb Alex Deucher:
> > > On Mon, Mar 20, 2023 at 11:19=E2=80=AFAM Thomas Zimmermann <tzimmerma=
nn@suse.de> wrote:
> > >>
> > >> Hi
> > >>
> > >> Am 20.03.23 um 16:11 schrieb Christian K=C3=B6nig:
> > >>> Am 17.03.23 um 10:20 schrieb Thomas Zimmermann:
> > >>>> Hi Christian
> > >>>>
> > >>>> Am 17.03.23 um 09:53 schrieb Christian K=C3=B6nig:
> > >>>>> Am 16.03.23 um 10:37 schrieb Thomas Zimmermann:
> > >>>>>> Convert radeon's fbdev code to drm_client. Replaces the current
> > >>>>>> ad-hoc integration. The conversion includes a number of cleanups=
.
> > >>>>>> Only build fbdev support if the config option has been set.
> > >>>>>
> > >>>>> I'm torn apart on that. On the one hand it looks like a really ni=
ce
> > >>>>> cleanup on the other hand we don't really want to touch radeon an=
y more.
> > >>>>
> > >>>> It's a driver in the upstream kernel. You have to expect at least =
some
> > >>>> changes.
> > >>>
> > >>> Some changes is not the problem, but we need a justification to cha=
nge
> > >>> something. Just that it's nice to have won't do it without extensiv=
e
> > >>> testing.
> > >>>
> > >>>>
> > >>>>>
> > >>>>> Alex what do you think? Is that worth the risk of breaking stuff?
> > >>>>
> > >>>> Moving all fbdev emulation to struct drm_client is required for ne=
w
> > >>>> in-kernel DRM clients, such as a DRM kernel logger or a boot splas=
h.
> > >>>
> > >>> Well that's a rather good justification. I suggest to add that to t=
he
> > >>> cover-letter.
> > >>
> > >> Ok, will go into a possible v2. The mid-term plan is to convert the
> > >> fbdev code in all remaining drivers to struct drm_client and remove =
the
> > >> old ad-hoc callbacks.
> > >>
> > >> With struct drm_client, we can select in-kernel clients at compile t=
ime
> > >> or runtime just like userspace clients. I guess, we can have a bootu=
p
> > >> screen and then switch to the console or the DRM logger. Or go from =
any
> > >> client to the logger on kernel panics (or something like that). Ther=
e's
> > >> been occasional talk about userspace consoles, which would use such
> > >> functionality.
> > >
> > > Patches look good to me.  I have a pretty limited set of HW I can tes=
t
> > > on since I don't have a functional AGP system anymore and most of my
> > > older PCIe radeons are packed up in the attic.  Feel free to add my:
> >
> > I've tested the patches with an R5-based card.
> >
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > > to the series.
> >
> > Thank you so much. Do you want to take the patches into the amd tree?
>
> I haven't forgotten these.  Will pick them up next week.
>
> Thanks,
>
> Alex
>
> >
> > Best regards
> > Thomas
> >
> > >
> > > Alex
> > >
> > >>
> > >> Best regards
> > >> Thomas
> > >>
> > >>>
> > >>> Regards,
> > >>> Christian.
> > >>>
> > >>>>
> > >>>> Best regards
> > >>>> Thomas
> > >>>>
> > >>>>>
> > >>>>> Christian.
> > >>>>>
> > >>>>>>
> > >>>>>> Thomas Zimmermann (10):
> > >>>>>>     drm/radeon: Move radeon_align_pitch() next to dumb-buffer he=
lpers
> > >>>>>>     drm/radeon: Improve fbdev object-test helper
> > >>>>>>     drm/radeon: Remove struct radeon_fbdev
> > >>>>>>     drm/radeon: Remove test for !screen_base in fbdev probing
> > >>>>>>     drm/radeon: Move fbdev object helpers before struct fb_ops e=
t al
> > >>>>>>     drm/radeon: Fix coding style in fbdev emulation
> > >>>>>>     drm/radeon: Move fbdev cleanup code into fb_destroy callback
> > >>>>>>     drm/radeon: Correctly clean up failed display probing
> > >>>>>>     drm/radeon: Implement client-based fbdev emulation
> > >>>>>>     drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
> > >>>>>>
> > >>>>>>    drivers/gpu/drm/radeon/Makefile         |   3 +-
> > >>>>>>    drivers/gpu/drm/radeon/radeon.h         |   2 +
> > >>>>>>    drivers/gpu/drm/radeon/radeon_display.c |   4 -
> > >>>>>>    drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
> > >>>>>>    drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
> > >>>>>>    drivers/gpu/drm/radeon/radeon_fb.c      | 400 ---------------=
-------
> > >>>>>>    drivers/gpu/drm/radeon/radeon_fbdev.c   | 422
> > >>>>>> ++++++++++++++++++++++++
> > >>>>>>    drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
> > >>>>>>    drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
> > >>>>>>    drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
> > >>>>>>    10 files changed, 464 insertions(+), 433 deletions(-)
> > >>>>>>    delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
> > >>>>>>    create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
> > >>>>>>
> > >>>>>>
> > >>>>>> base-commit: ec0708e846b819c8d5b642de42448a87d7526564
> > >>>>>
> > >>>>
> > >>>
> > >>
> > >> --
> > >> Thomas Zimmermann
> > >> Graphics Driver Developer
> > >> SUSE Software Solutions Germany GmbH
> > >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > >> (HRB 36809, AG N=C3=BCrnberg)
> > >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
> >
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> > (HRB 36809, AG N=C3=BCrnberg)
> > Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
