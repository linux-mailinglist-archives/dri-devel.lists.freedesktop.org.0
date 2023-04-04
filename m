Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3E6D671C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 17:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4880510E6D7;
	Tue,  4 Apr 2023 15:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E461F10E6D3;
 Tue,  4 Apr 2023 15:20:48 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p203so39079423ybb.13;
 Tue, 04 Apr 2023 08:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680621648;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwpxyD/L/JdRbsDbYgifY/Bzo8+RV7g8PvhEjly15kU=;
 b=PeKeVB2L3UJchQuV1JI/rmnwfajpGfKHYo4DM6LfvCSfFEYb8T9X2qMwGEdJ0Bq8zU
 ygpHApz9xgyl5FjMAUrT+xJI3mlv3JOCf0N2HpA5mMQwBdgOFIEmaEw3MOFmTAWRCvKa
 ELbe7JY1xUdUJVhb6OdCTmyr6SuJA35weJwWQMmxp1ImMgrv7uUERKWDnKYAnwHSb8U6
 NUpsxz3oAuXit1r2b3kRSPnZ1FbIJXh6cKJ5jiMJxPrVi0FBgQQXOSradDfEXV4C/CyA
 oeaC4ScLBLc5LhMSe+FsIfk/FtkKrjw9ZCwOEoeynwmcCIoAPR5D3yOLtl6EuAdPsfkE
 luMw==
X-Gm-Message-State: AAQBX9dIBASRry00TBjwArDgDVaFLWE5ibc0Y9ia/RmmejiuC6XCXm4o
 8dPfs3BeCY++k0K69edNHD4WfmRjQJfv+bnP
X-Google-Smtp-Source: AKy350bXukHbZMpJD1lcUKipPytDaDrHORb5cOOFMkan2QstmLY7w9k3y86BMF/VD/eNznhKTOodhQ==
X-Received: by 2002:a25:cdc9:0:b0:b87:4ba5:d588 with SMTP id
 d192-20020a25cdc9000000b00b874ba5d588mr2623320ybf.63.1680621647659; 
 Tue, 04 Apr 2023 08:20:47 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 o78-20020a25d751000000b00b7767ca748fsm3357288ybg.44.2023.04.04.08.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 08:20:47 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i6so39148404ybu.8;
 Tue, 04 Apr 2023 08:20:47 -0700 (PDT)
X-Received: by 2002:a25:734d:0:b0:b67:d295:d614 with SMTP id
 o74-20020a25734d000000b00b67d295d614mr1786237ybc.12.1680621646854; Tue, 04
 Apr 2023 08:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220629105658.1373770-1-geert@linux-m68k.org>
 <d27c08a3-0f2f-c0f2-143f-482a33a6a4ce@gmx.de>
 <YvJ3R2HnTSXDF7lx@phenom.ffwll.local>
In-Reply-To: <YvJ3R2HnTSXDF7lx@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 17:20:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaHd1jgrsCSxCqF-HP2rAo2ODM_ZOjhk7Q4vjuqvt36w@mail.gmail.com>
Message-ID: <CAMuHMdUaHd1jgrsCSxCqF-HP2rAo2ODM_ZOjhk7Q4vjuqvt36w@mail.gmail.com>
Subject: Re: [PATCH] drm/fb-helper: Remove helpers to change frame buffer
 config
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-fbdev@vger.kernel.org, Tomi Valkeinen <tomba@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Aug 9, 2022 at 5:03=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> On Sat, Jul 02, 2022 at 08:05:54PM +0200, Helge Deller wrote:
> > On 6/29/22 12:56, Geert Uytterhoeven wrote:
> > > The DRM fbdev emulation layer does not support pushing back
> > > changes to fb_var_screeninfo to KMS.
> > >
> > > However, drm_fb_helper still implements the fb_ops.fb_check_var() and
> > > fb_ops.fb_set_par() callbacks, but the former fails to validate vario=
us
> > > parameters passed from userspace.  Hence unsanitized and possible
> > > invaled values are passed up through the fbdev, fbcon, and console
> > > stack, which has become an endless source of security issues reported
> > > against fbdev.
> > >
> > > Fix this by not populating the fb_ops.fb_check_var() and
> > > fb_ops.fb_set_par() callbacks, as there is no point in providing them=
 if
> > > the frame buffer config cannot be changed anyway.  This makes the fbd=
ev
> > > core aware that making changes to the frame buffer config is not
> > > supported, so it will always return the current config.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > It's unfortunate that DRM currently isn't able to switch resolutions
> > at runtime.
> >
> > With that in mind I agree with Geert that it's probably better to
> > disable (or drop) that code until DRM can cope with fbdev's
> > interface to switch resolutions.
> >
> > Furthermore, with the upcoming patches to fbcon (which prevents crashes=
 on
> > invalid userspace input), you will face a kernel WARNING if you call fb=
set
> > to switch screen resolutions with DRM drivers.
> >
> > So, from my side (although I'd prefer a better fix for DRM):
> >
> > Acked-by: Helge Deller <deller@gmx.de>
>
> So maybe I'm missing something, but I think this breaks a lot of stuff.
> The issue is that fbdev is only a subordinate owner of the kms device, if
> there's a real drm kms owner around that wins.
>
> Which means when you switch back then set_par needs to restore the fbdev
> framebuffer. So that might break some recovery/use-cases.

Upon closer look, I think I was a bit too over-eager, and we can keep
the implementation of fb_ops.fb_set_par().

> The other thing is that I think this also breaks the scanout offset, and
> people do use that for double-buffering on top of fbdev on top of drm
> drivers. So we can't just nuke it completely.

You mean panning? That does not need fb_ops.fb_check_var(), as it
should be done through fb_ops.fb_pan_display().

> For better or worse I think we need to keep playing the whack-a-mole game=
.
> Or do I miss something here?

With the above fixed, we can continue whacking the drm bugs in
implementing the fbdev API?

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
