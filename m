Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0B70DB9F
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 13:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D1910E055;
	Tue, 23 May 2023 11:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1124710E055
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 11:41:57 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-253520adb30so4429888a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 04:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684842116; x=1687434116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+j86HLJnwKJp0madpdX3iC6l+B59gE8KR/+G/vjgAU=;
 b=aysqnpS8h9b9AyGcXLWEUM8/Y/dGJxbm+pFa4CBnesmrMDUWhgg2JZDQJfBk3GVCYw
 iZnrtmubvk1JDVHLe8utjTSkflW4+F9g21cdf5KqamUv88rgMjqepQf4oYAG+KvuW7De
 zxJopFhjm9zk4LvQvdz3Jjt9FxQ3NoN4yOFYTZzgGcm5hz0wisXqFeSIKnGVgWuG91Xa
 kkHqm4GhN2c82B2Ehp4tySzU+MbYk3juct5PmS7a7rl3lnzmxYhBl1M9xsr5VEdPblLO
 oa9uoCwH+Dpo2IU0zzsQhhskx3/M4G6ZiNboaIar7gRSMCrr+O1AEp8kvd1Zo+a24EZa
 gjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684842116; x=1687434116;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O+j86HLJnwKJp0madpdX3iC6l+B59gE8KR/+G/vjgAU=;
 b=FPSaReiYrlKjUX3M3R4ZQwp90yZTIpqAU63REYkO8m4vwgu+vzwfqxoJh1/QWCZzyC
 ZZHJVScLFhHEBf/KvtCAeEMygthICNprmmUOgJdrLKicrO/7U9EL98kdVRIKRIWiUBpP
 6wI6Somcz+E5fcKTNya0OP0LwOux577h463Ey/GzPToB73XJLyxFwS0eGO20LBYLhuAH
 tntOYeYjxICkkSIeAV3BgQjbJ+WxeXfKN6oA/FKoaj4BVSvQxpF4bmiAYTXbLSCMKYAD
 E+jbAq/BPdaeuTA+3YeC/gN9OI7m+ZBUD/Z6dHh8oGUIOgnieJjW0I14Qyz+ELWH9dMB
 bMNA==
X-Gm-Message-State: AC+VfDy69NqBdDKI/HJMOYR2RAyrPabZ6COE0cU2oegUDfFi7ayCpzdc
 /PiGZcjR5KesVC/2yc0e4g45WZ+PqkFPuOA1l8g=
X-Google-Smtp-Source: ACHHUZ7WZvLP0oSaKdeSLzHVJgoo6pg/HBDScAXX6R0/5Afsf0ycw8X2yQ6Ws9MRa5ABrUcSjK14MlTPafcn+5aBThI=
X-Received: by 2002:a17:90a:17ec:b0:253:45e5:af5c with SMTP id
 q99-20020a17090a17ec00b0025345e5af5cmr13418249pja.32.1684842115687; Tue, 23
 May 2023 04:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230522190637.7039-1-tzimmermann@suse.de>
 <2x56vhkpjegqgjydnjji4xmvp3w4js66myw5kwngjsdpax7uma@x3fzwdbmrrny>
 <7c0b5d62-36d5-edae-ba50-b171538a488a@suse.de>
In-Reply-To: <7c0b5d62-36d5-edae-ba50-b171538a488a@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 23 May 2023 13:41:44 +0200
Message-ID: <CAMeQTsYX4o2yWsCmA1xEKKEM1=SxwVC1+fhDwN26P-LDLtmGEA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Clear fbdev framebuffer with fb_memset_io()
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 1:29=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 23.05.23 um 09:00 schrieb Patrik Jakobsson:
> > On Mon, May 22, 2023 at 09:06:37PM +0200, Thomas Zimmermann wrote:
> >> The fbdev framebuffer is I/O memory, so clear it with fb_memset_io().
> >> Fixes the following sparse warning:
> >>
> >> ../drivers/gpu/drm/gma500/fbdev.c:234:20: warning: incorrect type in a=
rgument 1 (different address spaces)
> >> ../drivers/gpu/drm/gma500/fbdev.c:234:20:    expected void *s
> >> ../drivers/gpu/drm/gma500/fbdev.c:234:20:    got char [noderef] __iome=
m *screen_base
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > Looks good but I don't see the fb_mem*() helper change being merged yet=
.
> > Or am I looking in the wrong place?
>
> It's here, in drm-misc-next:
>
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D20d54e48d9c705091a=
025afff5839da2ea606f6b
>
> The patch would go there as well.

Hmm I must have grepped for something else.

Looks good!

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Best regards
> Thomas
>
> >
> >> ---
> >>   drivers/gpu/drm/gma500/fbdev.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/f=
bdev.c
> >> index 62287407e717..4f0309548b2b 100644
> >> --- a/drivers/gpu/drm/gma500/fbdev.c
> >> +++ b/drivers/gpu/drm/gma500/fbdev.c
> >> @@ -231,7 +231,7 @@ static int psb_fbdev_fb_probe(struct drm_fb_helper=
 *fb_helper,
> >>      info->fix.mmio_start =3D pci_resource_start(pdev, 0);
> >>      info->fix.mmio_len =3D pci_resource_len(pdev, 0);
> >>
> >> -    memset(info->screen_base, 0, info->screen_size);
> >> +    fb_memset_io(info->screen_base, 0, info->screen_size);
> >>
> >>      /* Use default scratch pixmap (info->pixmap.flags =3D FB_PIXMAP_S=
YSTEM) */
> >>
> >> --
> >> 2.40.1
> >>
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
