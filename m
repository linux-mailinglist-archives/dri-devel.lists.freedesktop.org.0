Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EC06D7D87
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6384310E95A;
	Wed,  5 Apr 2023 13:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F8610E95A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:18:35 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-930bc91df7bso115450866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680700714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=owIcXkaALEakCsyYCvhuFxjZnRn3/iobnF0iaYiSOmA=;
 b=LUnCVrDHAXqWz7PAde65XvA6dVydLSE5W+URJKD7F9q/SBrCxWxUMvydfNro3bEswG
 sLLsmnu4nTYjB0yEWGgecLSfuX9ueLmNLR9XY6AlP88wSLkSpuN9tvFDxsmpUVARgzpv
 OUT7Ca8Zk47aUW24s1xwt815wzpgMEDYuefjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680700714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=owIcXkaALEakCsyYCvhuFxjZnRn3/iobnF0iaYiSOmA=;
 b=t1bEFlTyOFufuQfQpJcfxVrwZC/AH3jF84ntt8wamFcGIjQylPws7PKIEVnGi6YUjz
 zyvPzlRbHXpKpJ9fdfSY/0G0G1Ux6HX160LsbI/bFgj1S46slkdXHpQm/iKvRtdAkQNv
 8Ya8wy5KrQnr5gPcQgo5ISwbu2GIIoew6iYMOlDYVrEDrvEC61BhEkxdj7V1+KOngIBm
 UO4PtiAqeCZTTj/hW7NDi5UUN5NKOgSoyfDlJyQnWnwxrDNQUlPL5y4smZiE6eqaoJ7S
 VYzGP4wtiq48MHefl91piPx7QzM4yWdp8jL/xdxSaMSg+t1yabIcuYOi/qTriIBUEDzk
 uxiw==
X-Gm-Message-State: AAQBX9fAx5qobsMOydh5sHgZVLV/aEOLRj4EuX+WIs1fdcdprYO3bRrn
 dnB1WdRJo+urNuiS58vILHRhYfrtz86xaUqv2tw=
X-Google-Smtp-Source: AKy350YtWekditYKvim982wRyxu6n6a6gkGscXRmZ+d/XmSbYzIOqG91UqVuUW+6cgA848mLo+sjmQ==
X-Received: by 2002:a17:906:114:b0:947:f415:db23 with SMTP id
 20-20020a170906011400b00947f415db23mr2935923eje.1.1680700713794; 
 Wed, 05 Apr 2023 06:18:33 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 11-20020a170906010b00b0093344ef3764sm7292273eje.57.2023.04.05.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:18:33 -0700 (PDT)
Date: Wed, 5 Apr 2023 15:18:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Message-ID: <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 01:16:27PM +0200, Javier Martinez Canillas wrote:
> Thomas Zimmermann <tzimmermann@suse.de> writes:
> 
> [...]
> 
> >
> > Your comment says that it calls a PCI function to clean up to vgacon. 
> > That comment explains what is happening, not why. And how the PCI and 
> > vgacon code work together is non-obvious.

Would a better comment help then:

	/*
	 * gma500 is a strange hybrid device, which both acts as a pci
	 * device (for legacy vga functionality) but also more like an
	 * integrated display on a SoC where the framebuffer simply
	 * resides in main memory and not in a special pci bar (that
	 * internally redirects to a stolen range of main memory) like all
	 * other integrated pci display devices have.
	 *
	 * To catch all cases we need to both remove conflicting fw
	 * drivers for the pci device and main memory.
	 */
> >
> > Again, here's my proposal for gma500:
> >
> > // call this from psb_pci_probe()
> > int gma_remove_conflicting_framebuffers(struct pci_dev *pdev, const
> > 					struct drm_driver *req_driver)
> > {
> > 	resource_size_t base = 0;
> > 	resource_size_t size = (resource_size_t)-1;
> > 	const char *name = req_driver->name;
> > 	int ret;
> >
> > 	/*
> > 	 * We cannot yet easily find the framebuffer's location in
> > 	 * memory. So remove all framebuffers here.
> > 	 *
> > 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
> > 	 *       we might be able to read the framebuffer range from the
> > 	 *       device.
> > 	 */
> > 	ret = aperture_remove_conflicting_devices(base, size, name);

Why can't this be a call to drm_aperture_remove_framebuffers? At least as
long as we don't implement the "read out actual fb base and size" code,
which also none of the other soc drivers bother with?

> > 	if (ret)
> > 		return ret;
> >
> > 	/*
> > 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > 	 * otherwise the vga fbdev driver falls over.
> > 	 */
> > 	ret = vga_remove_vgacon(pdev);

This isn't enough, we also nuke stuff that's mapping the vga fb range.
Which is really the reason I don't want to open code random stuff, pci is
self-describing, if it's decoding legacy vga it can figure this out and we
only have to implement the "how do I nuke legacy vga fw drivers from a pci
driver" once.

Not twice like this would result in, with the gma500 version being only
half the thing.

If it absolutely has to be a separate function for the gma500 pci legacy
vga (I still don't get why, it's just a pci vga device, there's absolutely
nothing special about that part at all) then I think it needs to be at
least a common "nuke a legacy vga device for me pls" function, which
shares the implementation with the pci one.

But not open-coding just half of it only.

> > 	if (ret)
> > 		return ret;
> >
> > 	return 0;
> > }
> >
> 
> If this is enough I agree that is much more easier code to understand.

It's still two calls and more code with more bugs? I'm not seeing the
point.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
