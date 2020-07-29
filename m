Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8B2320E5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406846E527;
	Wed, 29 Jul 2020 14:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CA56E527
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:47:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q7so25355768ljm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WV5ZXoPZEGD0VEKJU9OPmCbMIj8i/rWmAVK1gvkCqz8=;
 b=akTfjE5uzwBBzn4lLVdZ+pXWUZ8nwH/Duf/qa3HyS//dd7O1bfrLqIY3AfYYtl0UfQ
 rY1vzpH3seiaZItwWpkQjZYxSOyhRYPYW8R6vyTcoYAPKnv7kX/Z3mmMKZ96OrM3GM5C
 RXIyRC/J/TXhuwyqSz2axojb6CgK+WuTFqvmQl6tMPbMIxqWUkXVdNUVj1TLjTAPX/Mo
 Smu7NMsCQbNEd0lwK0/cbFZrjlNOqXaji9A4iUm7D4KnsYADHoCCfZyky0oo8G3texsV
 u5b3enuxufR/bFHxbE/HoIudei3VpaizopCsVr2oEnQuYnlHWMbRcS9TZMibYtbCYIcO
 Hg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WV5ZXoPZEGD0VEKJU9OPmCbMIj8i/rWmAVK1gvkCqz8=;
 b=fBrZzjJVuiLkb4a2Tp990paw0Jz7ViiI+PmkFjxg8LSOjMNm9vaeOlfToAjecDrv9h
 gG/V3X6Sw31Se7co21dKho7aoe1kUyDvEu3Gt8YXO6rIrwe4QzoKtIW+IS1DnvQT4pq7
 L0LHI5slcGJLg8O84s8a/pSGIjjXPEvcSWCpRbTp/IzgRM5GhPrCeJSryIT95qPS/hAk
 KWPt7MFN0i7Pz+lHhIUgMfpOhKN0C6MAPiDqYsRHdtWGWseReB2mxLan6PtwjmHtXwyO
 qDLjUpJ8BYclZcqq2m8yrgbTuGNSxMPrq7BnxCpC/HZyMUIgtpp1LVOHDgA7k5YpCdUX
 LtMQ==
X-Gm-Message-State: AOAM533ESSoXUdb91uXHV5wKwvBBw6yrZiliRO4GUO75KYjJ8ECKa/Ui
 E3TsS3zljlCMFNtO8q1fq5dXcw==
X-Google-Smtp-Source: ABdhPJy4xS4rHy/0y//fV/x57vJD3nHEApyzVAjSAqXTYRlRv/UxoHgITGURv4JfwtLH2Ridk6lsgQ==
X-Received: by 2002:a2e:8690:: with SMTP id l16mr2794886lji.7.1596034063867;
 Wed, 29 Jul 2020 07:47:43 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id b26sm527982lji.36.2020.07.29.07.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 07:47:42 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 1D071102089; Wed, 29 Jul 2020 17:47:46 +0300 (+03)
Date: Wed, 29 Jul 2020 17:47:46 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
Message-ID: <20200729144746.jwyhwnp2fwat34hc@box>
References: <20200718033352.1810-1-jajones@nvidia.com>
 <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
 <561f3a10-82af-cff5-b771-2e56b6eb973a@nvidia.com>
 <CAPM=9twQfg6QiiL2fn=qaBRrWCsnoByoch+1vAN94ZwqzYDFxg@mail.gmail.com>
 <CACAvsv6_h95a-Gpd-=YxW0d8CoOHvO2OLCsoDpJvUx=MWzdFzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv6_h95a-Gpd-=YxW0d8CoOHvO2OLCsoDpJvUx=MWzdFzw@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 01:40:13PM +1000, Ben Skeggs wrote:
> On Wed, 29 Jul 2020 at 12:48, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Tue, 28 Jul 2020 at 04:51, James Jones <jajones@nvidia.com> wrote:
> > >
> > > On 7/23/20 9:06 PM, Ben Skeggs wrote:
> > > > On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
> > > >>
> > > >> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> > > >> family of modifiers to handle broken userspace
> > > >> Xorg modesetting and Mesa drivers. Existing Mesa
> > > >> drivers are still aware of only these older
> > > >> format modifiers which do not differentiate
> > > >> between different variations of the block linear
> > > >> layout. When the format modifier support flag was
> > > >> flipped in the nouveau kernel driver, the X.org
> > > >> modesetting driver began attempting to use its
> > > >> format modifier-enabled framebuffer path. Because
> > > >> the set of format modifiers advertised by the
> > > >> kernel prior to this change do not intersect with
> > > >> the set of format modifiers advertised by Mesa,
> > > >> allocating GBM buffers using format modifiers
> > > >> fails and the modesetting driver falls back to
> > > >> non-modifier allocation. However, it still later
> > > >> queries the modifier of the GBM buffer when
> > > >> creating its DRM-KMS framebuffer object, receives
> > > >> the old-format modifier from Mesa, and attempts
> > > >> to create a framebuffer with it. Since the kernel
> > > >> is still not aware of these formats, this fails.
> > > >>
> > > >> Userspace should not be attempting to query format
> > > >> modifiers of GBM buffers allocated with a non-
> > > >> format-modifier-aware allocation path, but to
> > > >> avoid breaking existing userspace behavior, this
> > > >> change accepts the old-style format modifiers when
> > > >> creating framebuffers and applying them to planes
> > > >> by translating them to the equivalent new-style
> > > >> modifier. To accomplish this, some layout
> > > >> parameters must be assumed to match properties of
> > > >> the device targeted by the relevant ioctls. To
> > > >> avoid perpetuating misuse of the old-style
> > > >> modifiers, this change does not advertise support
> > > >> for them. Doing so would imply compatibility
> > > >> between devices with incompatible memory layouts.
> > > >>
> > > >> Tested with Xorg 1.20 modesetting driver,
> > > >> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> > > >> gnome & KDE wayland desktops from Ubuntu 18.04,
> > > >> and sway 1.5
> > > >>
> > > >> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
> > > >> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> > > >> Link: https://lkml.org/lkml/2020/6/30/1251
> > > >> Signed-off-by: James Jones <jajones@nvidia.com>
> > > >> ---
> > > >>   drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
> > > >>   1 file changed, 24 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > >> index 496c4621cc78..31543086254b 100644
> > > >> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> > > >> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> > > >> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
> > > >>                     uint32_t *tile_mode,
> > > >>                     uint8_t *kind)
> > > >>   {
> > > >> +       struct nouveau_display *disp = nouveau_display(drm->dev);
> > > >>          BUG_ON(!tile_mode || !kind);
> > > >>
> > > >> +       if ((modifier & (0xffull << 12)) == 0ull) {
> > > >> +               /* Legacy modifier.  Translate to this device's 'kind.' */
> > > >> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
> > > >> +       }
> > > > I believe this should be moved into the != MOD_LINEAR case.
> > >
> > > Yes, of course, thanks.  I need to re-evaluate my testing yet again to
> > > make sure I hit that case too.  Preparing a v3...
> >
> > Going to need something here in the next day, two max.
> >
> > Linus may wait for another week, but it's not guaranteed.
> I tested a whole bunch of GPUs before sending nouveau's -next tree,
> and with the change I suggested to this patch + the other stuff I sent
> through -fixes already, things seemed to be in OK shape.

JFYI, the adjusted (moved into != MOD_LINEAR case) patch works fine for me
on top of drm-fixes-2020-07-29.

-- 
 Kirill A. Shutemov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
