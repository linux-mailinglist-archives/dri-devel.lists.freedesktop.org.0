Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523C71C2403
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B372F6E0C8;
	Sat,  2 May 2020 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0383E6EC8A;
 Fri,  1 May 2020 13:15:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id l11so3839872lfc.5;
 Fri, 01 May 2020 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fH1uQyb91g9BRoTHNdBr1xD1n5oHVtfhK1lN3zoG4Rk=;
 b=Aw2AkAXsWbng9nGYiFe0ptX+OybKGnkaCp5157HDfEmyu+TU5ufUVJvW4+lOH6ztVB
 73zPXr/2iKPU8gx42sHP2l7CmWO5hlC2jMcm7fdcT26Vv1Poe6QpZucWoYCvXw2+gri8
 GtKiR/dvq6XiVIbdqhDNkj9vAWM/8NEfXlHNnkZo2rvIRYfN7IvQQ7dy+3EV3yLUv1cB
 GF2C8Ik2V0RjPAN94rPAGoGV2uLyJEq6b7cMRi7/uJUm3oXp9MHHZQfvQkIY8jrGqHWo
 Ebtj96Qs4zPBaUdksKtf+Z0B7ORDmw0P39NYlY3EpIcRjcHWRRdm4je9QaspY8pT4Hqe
 Etaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fH1uQyb91g9BRoTHNdBr1xD1n5oHVtfhK1lN3zoG4Rk=;
 b=m7+upWXciAN+jMlMrtIkkJS6yY7Fz2Z/JY8cQjv/kzflQujWl3xoBtO8AgutVFN+fg
 CIJKNfndzHwdsKrWwmCs6Qd5toqAZU+t/eU+dw0+J2DZ5AJlQXdI5UZyi5xc8nn/IPrQ
 4yMFh0fEEdoGzgt1Ylc2+625yq+1KyQM084QsF6WIT7SL7fV2Ax5j9AG2M881n59KyOx
 zYdT1+J5/t8fAIEYY0c1YkLBvkgxLF2fz7skrGwLy6c9GJ1FovSQDVeibk/g5ZdIvzfO
 T3S5calJrlW/kUgj8kMOc2IPA7jAGzqrZ2Zxwv10ioa8YIaqUKJ1c8MEswup3WW+zIqJ
 vYRQ==
X-Gm-Message-State: AGi0PuY0r7SzxE0JCjv3LRAqBN5JxjxQVtplFh+RIqeq/zoCn/p7tMXb
 KrqpZcRrUMVVzGE9W93XZmDOK3BtwTDTHe9ldzk=
X-Google-Smtp-Source: APiQypIlgTEljLdRs53ypaaUWZ/FkvFXTQCVFzi38BrHASkAEXWCo5yHyupQ8kzxYTLNvBK5UVZwW9JoUGx/ZYvtOQw=
X-Received: by 2002:a05:6512:108a:: with SMTP id
 j10mr2585989lfg.38.1588338950886; 
 Fri, 01 May 2020 06:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <1588278413-21682-1-git-send-email-jrdr.linux@gmail.com>
 <CAKb7UvhNzfJLS8--5LySAjyzH2bidfZbP7VgzEVfeV2Erva4YQ@mail.gmail.com>
In-Reply-To: <CAKb7UvhNzfJLS8--5LySAjyzH2bidfZbP7VgzEVfeV2Erva4YQ@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 1 May 2020 18:53:43 +0530
Message-ID: <CAFqt6zaRjjJYo3RWjjug4GJFZH7CT=6c0kRf=UjtH3_MeQa5Ew@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dispnv04: Remove dead code
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: inux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 1, 2020 at 2:21 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> Interesting. I do remember seeing some snow on NV5's overlay at high
> resolutions. Wonder if it was because of this missing code...

What was the problem ? Does enabling this dead code will fix the problem ?

>
> On Thu, Apr 30, 2020 at 4:19 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > These are dead code since 3.10. If there is no plan to use
> > it further, these can be removed forever.
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 28 ----------------------------
> >  1 file changed, 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > index 1f08de4..ad0ef7d 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > @@ -269,31 +269,11 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
> >                 horizStart = horizTotal - 5;
> >                 horizEnd = horizTotal - 2;
> >                 horizBlankEnd = horizTotal + 4;
> > -#if 0
> > -               if (dev->overlayAdaptor && drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
> > -                       /* This reportedly works around some video overlay bandwidth problems */
> > -                       horizTotal += 2;
> > -#endif
> >         }
> >
> >         if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> >                 vertTotal |= 1;
> >
> > -#if 0
> > -       ErrorF("horizDisplay: 0x%X \n", horizDisplay);
> > -       ErrorF("horizStart: 0x%X \n", horizStart);
> > -       ErrorF("horizEnd: 0x%X \n", horizEnd);
> > -       ErrorF("horizTotal: 0x%X \n", horizTotal);
> > -       ErrorF("horizBlankStart: 0x%X \n", horizBlankStart);
> > -       ErrorF("horizBlankEnd: 0x%X \n", horizBlankEnd);
> > -       ErrorF("vertDisplay: 0x%X \n", vertDisplay);
> > -       ErrorF("vertStart: 0x%X \n", vertStart);
> > -       ErrorF("vertEnd: 0x%X \n", vertEnd);
> > -       ErrorF("vertTotal: 0x%X \n", vertTotal);
> > -       ErrorF("vertBlankStart: 0x%X \n", vertBlankStart);
> > -       ErrorF("vertBlankEnd: 0x%X \n", vertBlankEnd);
> > -#endif
> > -
> >         /*
> >         * compute correct Hsync & Vsync polarity
> >         */
> > @@ -492,14 +472,6 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
> >         /* Except for rare conditions I2C is enabled on the primary crtc */
> >         if (nv_crtc->index == 0)
> >                 regp->crtc_eng_ctrl |= NV_CRTC_FSEL_I2C;
> > -#if 0
> > -       /* Set overlay to desired crtc. */
> > -       if (dev->overlayAdaptor) {
> > -               NVPortPrivPtr pPriv = GET_OVERLAY_PRIVATE(dev);
> > -               if (pPriv->overlayCRTC == nv_crtc->index)
> > -                       regp->crtc_eng_ctrl |= NV_CRTC_FSEL_OVERLAY;
> > -       }
> > -#endif
> >
> >         /* ADDRESS_SPACE_PNVM is the same as setting HCUR_ASI */
> >         regp->cursor_cfg = NV_PCRTC_CURSOR_CONFIG_CUR_LINES_64 |
> > --
> > 1.9.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
