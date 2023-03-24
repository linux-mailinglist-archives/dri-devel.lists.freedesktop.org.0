Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 502656C879B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 22:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B3E10E1D3;
	Fri, 24 Mar 2023 21:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658CD10E1A3;
 Fri, 24 Mar 2023 21:44:34 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 cm7-20020a056830650700b006a11f365d13so306339otb.0; 
 Fri, 24 Mar 2023 14:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679694273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqEFHlB+2JQgdcLpq9d89sNhaRMUYseTfGNRwpSqibM=;
 b=bY78Y2BLXe2jAKkGu0PgFhJ+gBj/i0WCl1aOVD/JCGmnSqN4ol45MCyEaYs9wIqbCw
 BteW153mgL3PL70n5pxwwM1RlYmhLRvWTvNObA+Lt960JBOahmCU21rE0CjLzGroQP7w
 5ADjjV5R39IGa3BXdzZrH8VMBytwU94oDhb7U8bphcyYv5mZ94WSlekXIN4BwNdSFcmy
 hwQcoqjzcLHHKfVNp5cqXV6i1aUjD+5mwu84w6ZhLUcOPqjk5eYyzDiPhpcaj9G5kHoy
 8AB1MpiTUBB5AF02dn8lUl1ef1VuHB0TYeWvq6QMeT5sxdzDODHNQKae6m88cxUVMlrl
 7rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679694273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqEFHlB+2JQgdcLpq9d89sNhaRMUYseTfGNRwpSqibM=;
 b=7GIZYU9V+m6sH/+qDicP/cCC8/k/gse44gZS/xQ3JSquP3bqKzrYyJ5pvbY0k4M5sM
 LcKiWWbJPpOWd1tcsF+dFY1BNiWOaTqPTx6+SeE5oscY9PPq9sk066ctFb4DMPuB3SDo
 3MkwX/YUKI5QDT6/tIU0BE1m68d667jF0bxoeUD67EIjvgRIQqNOUubHetPNGxoIipaa
 2t1KVyEXgQyP5c/QVnNTXvhS9TzPaf7zFK8I7zwJ4ZOzxaYmEFiEfXzDhZIZFP0bgg2m
 C/fW8ThTTID95tvNHGg4vgk2a8+ElYmWbkIHLJMRBVQEJKXQLA3C6bo9ZKSWNN3m6mAw
 TgsA==
X-Gm-Message-State: AO0yUKW0pmHe7TEO3IJhHwI9x9Kx/V13LsZbqEyiFpPEotYZrCMydCoP
 +yQh+QDBTlMwyqTHQ8U7xj23fsMVlgpNlbczJUk=
X-Google-Smtp-Source: AK7set+KjLPLCRb5YUduM/NDSmohJkxbYdjwFXg5mMLMYDNYM6HSVnDz9+5yO+VH7VnCB8V/E37kTY5OOxBsql9jX90=
X-Received: by 2002:a05:6830:1bed:b0:69f:bb3:2163 with SMTP id
 k13-20020a0568301bed00b0069f0bb32163mr1528225otb.3.1679694273517; Fri, 24 Mar
 2023 14:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
 <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
 <8cc926f5-ccee-b5ea-b217-297829051a7f@gmail.com>
 <1b85517d-1847-a779-2a13-b7cb5c7a592b@suse.de>
 <CADnq5_O-x8EYf0bR9JeJbHtc4P-uomUYdFLQ0CAeHu74Frc4EA@mail.gmail.com>
 <55157c5c-69ee-50eb-f5ea-c3b0aebcf948@suse.de>
In-Reply-To: <55157c5c-69ee-50eb-f5ea-c3b0aebcf948@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 24 Mar 2023 17:44:22 -0400
Message-ID: <CADnq5_M5PtfFDOhShfHtQYUPOJf0DaL0fmWmVbgTcUMzwODx_g@mail.gmail.com>
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

On Tue, Mar 21, 2023 at 5:33=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 20.03.23 um 16:23 schrieb Alex Deucher:
> > On Mon, Mar 20, 2023 at 11:19=E2=80=AFAM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:
> >>
> >> Hi
> >>
> >> Am 20.03.23 um 16:11 schrieb Christian K=C3=B6nig:
> >>> Am 17.03.23 um 10:20 schrieb Thomas Zimmermann:
> >>>> Hi Christian
> >>>>
> >>>> Am 17.03.23 um 09:53 schrieb Christian K=C3=B6nig:
> >>>>> Am 16.03.23 um 10:37 schrieb Thomas Zimmermann:
> >>>>>> Convert radeon's fbdev code to drm_client. Replaces the current
> >>>>>> ad-hoc integration. The conversion includes a number of cleanups.
> >>>>>> Only build fbdev support if the config option has been set.
> >>>>>
> >>>>> I'm torn apart on that. On the one hand it looks like a really nice
> >>>>> cleanup on the other hand we don't really want to touch radeon any =
more.
> >>>>
> >>>> It's a driver in the upstream kernel. You have to expect at least so=
me
> >>>> changes.
> >>>
> >>> Some changes is not the problem, but we need a justification to chang=
e
> >>> something. Just that it's nice to have won't do it without extensive
> >>> testing.
> >>>
> >>>>
> >>>>>
> >>>>> Alex what do you think? Is that worth the risk of breaking stuff?
> >>>>
> >>>> Moving all fbdev emulation to struct drm_client is required for new
> >>>> in-kernel DRM clients, such as a DRM kernel logger or a boot splash.
> >>>
> >>> Well that's a rather good justification. I suggest to add that to the
> >>> cover-letter.
> >>
> >> Ok, will go into a possible v2. The mid-term plan is to convert the
> >> fbdev code in all remaining drivers to struct drm_client and remove th=
e
> >> old ad-hoc callbacks.
> >>
> >> With struct drm_client, we can select in-kernel clients at compile tim=
e
> >> or runtime just like userspace clients. I guess, we can have a bootup
> >> screen and then switch to the console or the DRM logger. Or go from an=
y
> >> client to the logger on kernel panics (or something like that). There'=
s
> >> been occasional talk about userspace consoles, which would use such
> >> functionality.
> >
> > Patches look good to me.  I have a pretty limited set of HW I can test
> > on since I don't have a functional AGP system anymore and most of my
> > older PCIe radeons are packed up in the attic.  Feel free to add my:
>
> I've tested the patches with an R5-based card.
>
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > to the series.
>
> Thank you so much. Do you want to take the patches into the amd tree?

I haven't forgotten these.  Will pick them up next week.

Thanks,

Alex

>
> Best regards
> Thomas
>
> >
> > Alex
> >
> >>
> >> Best regards
> >> Thomas
> >>
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>>
> >>>>> Christian.
> >>>>>
> >>>>>>
> >>>>>> Thomas Zimmermann (10):
> >>>>>>     drm/radeon: Move radeon_align_pitch() next to dumb-buffer help=
ers
> >>>>>>     drm/radeon: Improve fbdev object-test helper
> >>>>>>     drm/radeon: Remove struct radeon_fbdev
> >>>>>>     drm/radeon: Remove test for !screen_base in fbdev probing
> >>>>>>     drm/radeon: Move fbdev object helpers before struct fb_ops et =
al
> >>>>>>     drm/radeon: Fix coding style in fbdev emulation
> >>>>>>     drm/radeon: Move fbdev cleanup code into fb_destroy callback
> >>>>>>     drm/radeon: Correctly clean up failed display probing
> >>>>>>     drm/radeon: Implement client-based fbdev emulation
> >>>>>>     drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set
> >>>>>>
> >>>>>>    drivers/gpu/drm/radeon/Makefile         |   3 +-
> >>>>>>    drivers/gpu/drm/radeon/radeon.h         |   2 +
> >>>>>>    drivers/gpu/drm/radeon/radeon_display.c |   4 -
> >>>>>>    drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
> >>>>>>    drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
> >>>>>>    drivers/gpu/drm/radeon/radeon_fb.c      | 400 -----------------=
-----
> >>>>>>    drivers/gpu/drm/radeon/radeon_fbdev.c   | 422
> >>>>>> ++++++++++++++++++++++++
> >>>>>>    drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
> >>>>>>    drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
> >>>>>>    drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
> >>>>>>    10 files changed, 464 insertions(+), 433 deletions(-)
> >>>>>>    delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
> >>>>>>    create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c
> >>>>>>
> >>>>>>
> >>>>>> base-commit: ec0708e846b819c8d5b642de42448a87d7526564
> >>>>>
> >>>>
> >>>
> >>
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> >> (HRB 36809, AG N=C3=BCrnberg)
> >> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
