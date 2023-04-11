Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80316DE023
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 17:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E6610E5A0;
	Tue, 11 Apr 2023 15:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B6B10E37F;
 Tue, 11 Apr 2023 15:58:02 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5491fa028adso489769007b3.10; 
 Tue, 11 Apr 2023 08:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681228680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+3w89leq3eEIkwoZcDVhq9F0DoH4q/Sj2floJIfCG0=;
 b=nbG6FGyfIyP9Z+C29I6hztMKGubg9X3ytmJtrpsh7upKQW2l3WsoGkKUDNujNPSdhr
 OCF6IE/fcMcAdSWbD5oqulccMZWb9KNe+CijMYFugk3y0XIHyh6Paw8oz9lGMCbh8WQT
 qQfTdXq9RM7ILwL/75IrZgSxZPL3pmtQhBQEnAG+LwWc8KwYDxGHyszgHSYpT9lWb2/S
 zvfNtO9guqNWWKcfRgZ2+4yVQtjmGxlkISWvrAmjmZ2/aCQ4Q2BJ891Dg57VRu2lmGNa
 KRmx+WYHH4wtdcYJdV2t9QCKDe9y4fmfgeIl2f62oMiuQ9JT4g4JDH5o7ZuEm/38Xw9j
 jlIQ==
X-Gm-Message-State: AAQBX9d3WI14JD1V6hg60UnKHE1KaYo5JPO74mQemzx9icEKWfNt3K00
 CXDWj+W7Qc674s9iZ8o3rvrMPHajEnj0EA==
X-Google-Smtp-Source: AKy350YLQGCcnAD5Owu02qeMWZr/5RVA9DuDqjCD0v+1mJTXI/cApxKS/N71bNAVGwLhqvsqHIoE6w==
X-Received: by 2002:a0d:d413:0:b0:54c:cab:66d8 with SMTP id
 w19-20020a0dd413000000b0054c0cab66d8mr2666786ywd.31.1681228680420; 
 Tue, 11 Apr 2023 08:58:00 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175]) by smtp.gmail.com with ESMTPSA id
 a71-20020a811a4a000000b0054640a352f2sm3548523ywa.20.2023.04.11.08.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 08:57:58 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id ch3so9764594ybb.4;
 Tue, 11 Apr 2023 08:57:58 -0700 (PDT)
X-Received: by 2002:a25:7654:0:b0:b8e:e0db:5b9d with SMTP id
 r81-20020a257654000000b00b8ee0db5b9dmr4304677ybc.12.1681228677832; Tue, 11
 Apr 2023 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230404193934.472457-1-daniel.vetter@ffwll.ch>
 <ZDVkSaskEvwix8Bz@phenom.ffwll.local>
In-Reply-To: <ZDVkSaskEvwix8Bz@phenom.ffwll.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 17:57:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVME6RnXkq-0FsUdH6-hqe5BqeT2UzgtW1uK+sg0GsQg@mail.gmail.com>
Message-ID: <CAMuHMdUVME6RnXkq-0FsUdH6-hqe5BqeT2UzgtW1uK+sg0GsQg@mail.gmail.com>
Subject: Re: [PATCH] fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
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
Cc: linux-fbdev@vger.kernel.org, Shigeru Yoshida <syoshida@redhat.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 shlomo@fastmail.com, Nathan Chancellor <natechancellor@gmail.com>,
 stable@vger.kernel.org, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Peter Rosin <peda@axentia.se>,
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, Apr 11, 2023 at 3:44=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
> On Tue, Apr 04, 2023 at 09:39:34PM +0200, Daniel Vetter wrote:
> > This is an oversight from dc5bdb68b5b3 ("drm/fb-helper: Fix vt
> > restore") - I failed to realize that nasty userspace could set this.
> >
> > It's not pretty to mix up kernel-internal and userspace uapi flags
> > like this, but since the entire fb_var_screeninfo structure is uapi
> > we'd need to either add a new parameter to the ->fb_set_par callback
> > and fb_set_par() function, which has a _lot_ of users. Or some other
> > fairly ugly side-channel int fb_info. Neither is a pretty prospect.
> >
> > Instead just correct the issue at hand by filtering out this
> > kernel-internal flag in the ioctl handling code.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Fixes: dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore")

> An Ack on this (or a better idea) would be great, so I can stuff it into
> -fixes.

I don't understand what the original commit this fixes is doing anyway...

> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1116,6 +1116,8 @@ static long do_fb_ioctl(struct fb_info *info, uns=
igned int cmd,
> >       case FBIOPUT_VSCREENINFO:
> >               if (copy_from_user(&var, argp, sizeof(var)))
> >                       return -EFAULT;
> > +             /* only for kernel-internal use */
> > +             var.activate &=3D ~FB_ACTIVATE_KD_TEXT;
> >               console_lock();
> >               lock_fb_info(info);
> >               ret =3D fbcon_modechange_possible(info, &var);

Perhaps FB_ACTIVATE_KD_TEXT should be removed (marked as
reserved) from include/uapi/linux/fb.h, too?

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
