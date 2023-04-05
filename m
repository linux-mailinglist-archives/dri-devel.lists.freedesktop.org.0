Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707A6D7642
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A8610E869;
	Wed,  5 Apr 2023 08:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD0110E869;
 Wed,  5 Apr 2023 08:05:59 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id w4so33694421plg.9;
 Wed, 05 Apr 2023 01:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680681959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2nO63yHjmM7KV8jXi9DlquqHoQvjGkN7MPeVvSFMwAI=;
 b=miBKPfKAuWB4Uu423fZqB8x8pgM5mb9Nf2neQLXIUdV3lpoec+ffh3X6LodQlrLyPW
 uAcWIgnWCouL4K8hC8KO2yqa2QWDDoVl4pkzBCDR7lmObsyJEGBkboJCCXg+LCRmbMv7
 rx2LfySz1Z4VJZW+iOjEG6JWZ3hWtXubNKXikM/SMvpDe4D4UEkB8cQM7Yfu+vBzq1Jc
 LQs86jTweXKu7OE+N27Fu77Of6so39CDGP4tatlpwLHA5MajYXLiMvjBphPR1WmRkDCw
 ryvvnXKd7UySWcOfIuIRGi4mmu0qI9vV2fmz1ABr0Vl5W3YINc+xRUrUUCoR//LFmPts
 zUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680681959;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2nO63yHjmM7KV8jXi9DlquqHoQvjGkN7MPeVvSFMwAI=;
 b=V8jq4JKQVOiItfxOyOpPTHAZe+M8mmi+mNf9msH8xluuFBsDeiFJG5PMjteaLQxumJ
 rTXO5VMIEm5a2Uk+TfZIJfWoXrB02iI/Z0U5GoDoVczicVcW99wycRE7mXz/sAnogKtx
 IvyazhOQbkjL2lsFptH4tii3gEgQVDAs/Ly0k0aNuRrSKvcW0nhTDjulv/rWK5tD24wS
 getUderDm+QhUQEH1xNFEYZqNSBvInENsx4qg3pwsfSktztQ/M059oeoNS3CZfTc+6eD
 fJ2ZAyCFL5LHoSmxhL5F3+EXKNee02YE98RJ+SSxDFd9TIBgby9R7r2uGOBYfhTYTIra
 684w==
X-Gm-Message-State: AAQBX9czrRkozARmS4lO6Z0SuHwYCVY0Yqf6p5n2DwGqZij4hNvPek3i
 vG/AcrtZqMS8XjXrGtUDmxebhvrBBpPrRmxrqtuT1LSCBtI=
X-Google-Smtp-Source: AKy350ZeC3GA/KJxa1RYtXUL/lvzBiZh0MF5fy9En0+WNJMO2FTLZfnxofRVOQWaSka/Um3OgGBSzsSm7SuvidqttOY=
X-Received: by 2002:a17:902:f802:b0:1a0:4933:c6ad with SMTP id
 ix2-20020a170902f80200b001a04933c6admr974222plb.3.1680681958588; Wed, 05 Apr
 2023 01:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
In-Reply-To: <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 5 Apr 2023 10:05:47 +0200
Message-ID: <CAMeQTsYH=gMv--qoOpQEc8-ozsW6ocN6zhw=Mjjat3L_xw=vwA@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 5, 2023 at 9:49=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 04.04.23 um 22:18 schrieb Daniel Vetter:
> > This one nukes all framebuffers, which is a bit much. In reality
> > gma500 is igpu and never shipped with anything discrete, so there shoul=
d
> > not be any difference.
> >
> > v2: Unfortunately the framebuffer sits outside of the pci bars for
> > gma500, and so only using the pci helpers won't be enough. Otoh if we
> > only use non-pci helper, then we don't get the vga handling, and
> > subsequent refactoring to untangle these special cases won't work.
> >
> > It's not pretty, but the simplest fix (since gma500 really is the only
> > quirky pci driver like this we have) is to just have both calls.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> >   drivers/gpu/drm/gma500/psb_drv.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/=
psb_drv.c
> > index 2ce96b1b9c74..f1e0eed8fea4 100644
> > --- a/drivers/gpu/drm/gma500/psb_drv.c
> > +++ b/drivers/gpu/drm/gma500/psb_drv.c
> > @@ -422,12 +422,17 @@ static int psb_pci_probe(struct pci_dev *pdev, co=
nst struct pci_device_id *ent)
> >
> >       /*
> >        * We cannot yet easily find the framebuffer's location in memory=
. So
> > -      * remove all framebuffers here.
> > +      * remove all framebuffers here. Note that we still want the pci =
special
> > +      * handling to kick out vgacon.
> >        *
> >        * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then =
we
> >        *       might be able to read the framebuffer range from the dev=
ice.
> >        */
> > -     ret =3D drm_aperture_remove_framebuffers(true, &driver);
> > +     ret =3D drm_aperture_remove_framebuffers(false, &driver);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev, &d=
river);
>
> This simply isn't it. If you have to work around your own API, it's time
> to rethink the API.

Would it help if we figure out the stolen range here? It can
supposedly be found by reading pci config space, so no need to map vdc
regs first.

GBSM is the stolen base and TOLUD - GBSM =3D stolen size. Or read the
size out from GGC. Not sure which one is more reliable.

-Patrik

>
> Best regards
> Thomas
>
> >       if (ret)
> >               return ret;
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
