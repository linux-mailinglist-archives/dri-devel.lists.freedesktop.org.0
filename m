Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97019904CB0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 09:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CF710E7AB;
	Wed, 12 Jun 2024 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1102310E7AB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 07:24:33 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-62a2424ec39so66732177b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 00:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718177072; x=1718781872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zeFPKbreJch0TwgOsbnEmSQi8HZBb1Xdf2vs1TiCa/E=;
 b=n99R2voKXJxMM6j18dwm6V+qSuwrvOrzx50kfFR41njCjGzSq533l5qV6Bjr9dPa1e
 iAF+Hu+SDxe2e55tPjUGV3mWlkl6bf4Zf1lOOVIRz8mubjCYs9BvPoBOEZAOgQ+rYUuT
 gqvz37YHCPDx/zYO66Q5hlfiNQaAP7QhR4LWQceEy5Tco9+rhCl1RkusR+/yx3Xr6GoN
 N0GJv3/IIVbwXPY+S8mV8rKfJe0Ps9gKCieMlqJjaWludGsZ5I4okoqoed4j1fCT7Qlh
 uu/w0wNE01E02+IgmRRhZ/GoSYaSJ8QskUhIMzvHzgLS0ETV3h2tBK9bOqZvuNdiAOst
 HjqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWbjXpr1oDBNeI89S1pF8j7RUdisq6yIV7c/i5Aq20J/Ryddx+w0xPwsC/da30Dp4uG8gXbOOtgRKv/NDt9oMo9oGAhbubzsoYd2k/LjB6
X-Gm-Message-State: AOJu0YxlYvS2NY+tmjHyBbAGG2tTv1nERdS6pdk9S/z2KqW0JfHaJcNG
 KJ2YnRj6FnLdIqIty/WmgHA5URWKbLJY7zfSgWOhG6Y7acWfSVNWiU3acI8i95k=
X-Google-Smtp-Source: AGHT+IGO1zFdwHnjpTMpJo52BS9wyfS83niUseHVb8bcF9Q+Xsp8EpAJrBDBli1qcxuwIGckfg5K7w==
X-Received: by 2002:a0d:d648:0:b0:618:b08:2ab6 with SMTP id
 00721157ae682-62fbcac83femr8906197b3.47.1718177070831; 
 Wed, 12 Jun 2024 00:24:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-62ce77a0a5dsm15939647b3.28.2024.06.12.00.24.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 00:24:30 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dfe43dca3bfso522310276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 00:24:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVVnf7dqPie5ibCwRer0NZbFSG0D3wnrIlqrzBidnHSq8BNJEIN3hsULF9XwIb+4N5HDkAmjjQ/5pwJ0c59rR4goq4ExLyieqQ5pniIbbN7
X-Received: by 2002:a25:b125:0:b0:dfa:5748:124c with SMTP id
 3f1490d57ef6-dfe6606d5famr828847276.10.1718177068915; Wed, 12 Jun 2024
 00:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
 <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jun 2024 09:24:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQkrLkwersttFEoR-oUsb4-EMEVXHs8JTdmz31X+DeAQ@mail.gmail.com>
Message-ID: <CAMuHMdUQkrLkwersttFEoR-oUsb4-EMEVXHs8JTdmz31X+DeAQ@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Doug Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Tue, Jun 11, 2024 at 7:33=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Wed, May 29, 2024 at 5:16=E2=80=AFAM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> >
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > Based on grepping through the source code, this driver appears to be
> > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > This is important because drm_helper_force_disable_all() will cause
> > panels to get disabled cleanly which may be important for their power
> > sequencing.  Future changes will remove any custom powering off in
> > individual panel drivers so the DRM drivers need to start getting this
> > right.
> >
> > The fact that we should call drm_atomic_helper_shutdown() in the case o=
f
> > OS shutdown comes straight out of the kernel doc "driver instance
> > overview" in drm_drv.c.
> >
> > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c30=
7a6192efabb4cbb06b195f15@changeid
> > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > v2:
> >   - Add Reviewed-by.
> >
> > Tested on Atmark Techno Armadillo-800-EVA.
> > ---
> >  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>
> FWIW: I've created a patch to list DRM modeset drivers that handle
> shutdown properly [1]. For now "shmob-drm" is not part of that
> patchset. Assuming my patch lands we'll have to later add it to the
> list.

Ouch, keeping such a list is ugly ;-)

> [1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b2=
9f746b93621749c@changeid
>
> I will also note that the subject/description of this patch could be
> adjusted. They still reference "drm_helper_force_disable_all" which
> should have been changed to "drm_atomic_helper_shutdown".

Thanks, v3 sent.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
