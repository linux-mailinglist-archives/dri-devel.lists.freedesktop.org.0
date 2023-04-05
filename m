Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CCC6D82C9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90AB10E103;
	Wed,  5 Apr 2023 16:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736610E103
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 16:02:07 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso75190a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680710525; x=1683302525;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Z4x/60Nfen4S79vqKv7uwBT/fWu0hDg/Eg+9CWLyjFk=;
 b=Dqd3L1Xdwkxqr7IDWVyV+aWpVbJbw6SVVHTDJS8LpNwDAozSdfNFbteqNXntMZt4bI
 qyUoEI9Wc3WILeqjJn06Dt0wtVStQyWXLGQhYEfPu6c/NZi8ICUHUuVmLWENr517uHUl
 XKqlZU8h+mphpeASbiSciDjYoAAMVpBKc2Aaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710525; x=1683302525;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4x/60Nfen4S79vqKv7uwBT/fWu0hDg/Eg+9CWLyjFk=;
 b=DQpU0jXuVvMNQO7zQwhPz3J0soIIKxM8VUKxVMEGU6e/NvGvtNaP+IuXZuN3W3iwpz
 Vw9k8WPffOL6mAG9hAiVcPq4eI9CTCyxlr61h2/pk40W5tIpXUmkYvfa/kVjh6+4HgjQ
 G0jqRFd9xEIDhSJEhZZngoiv1U6uMth/vtPHCPGBesRUrmll1Fq2ZWgVZfNSUbBU0YLU
 grN5QQ9d+NYGSk3QRlRMDW+rKg56bqzxvCGbNtLJ5Y6O/cF8+uLb8elfSlmpTcxvJ4WU
 gWDJH6xu80fkJmgTJRyQPUXwgRoa7n7lFvOmhaGLWT2VuEoQn17NoMpVsA/MlTuAiB3F
 2KLA==
X-Gm-Message-State: AAQBX9ePGveqysEN3yVXcp+eyVlxahhzBwKAkfG8CE+c4ozc1ggmMv0V
 yyi6xRQE4iq9/FLkrsPW/dpk6L7rsLjHANXZGRA=
X-Google-Smtp-Source: AKy350axAiditkitqHBHfxhnykeiw70VksvAELgtkC6G2UnJycWyMNLJTz8jnmRhGGMr5w2xM9dfJA==
X-Received: by 2002:a05:6402:34c8:b0:502:367:d5b8 with SMTP id
 w8-20020a05640234c800b005020367d5b8mr2652687edc.4.1680710525418; 
 Wed, 05 Apr 2023 09:02:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 t23-20020a1709060c5700b0093e23d03d72sm7670826ejf.177.2023.04.05.09.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:02:04 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:02:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Message-ID: <ZC2beu/9inolwIlr@phenom.ffwll.local>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
 <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.04.23 um 15:18 schrieb Daniel Vetter:
> > On Wed, Apr 05, 2023 at 01:16:27PM +0200, Javier Martinez Canillas wrote:
> > > Thomas Zimmermann <tzimmermann@suse.de> writes:
> > > 
> > > [...]
> > > 
> > > > 
> > > > Your comment says that it calls a PCI function to clean up to vgacon.
> > > > That comment explains what is happening, not why. And how the PCI and
> > > > vgacon code work together is non-obvious.
> > 
> > Would a better comment help then:
> > 
> > 	/*
> > 	 * gma500 is a strange hybrid device, which both acts as a pci
> > 	 * device (for legacy vga functionality) but also more like an
> > 	 * integrated display on a SoC where the framebuffer simply
> > 	 * resides in main memory and not in a special pci bar (that
> > 	 * internally redirects to a stolen range of main memory) like all
> > 	 * other integrated pci display devices have.
> > 	 *
> > 	 * To catch all cases we need to both remove conflicting fw
> > 	 * drivers for the pci device and main memory.
> > 	 */
> 
> Together with the existing comment, this should be the comment to describe
> gma_remove_conflicting_framebuffers().
> 
> > > > 
> > > > Again, here's my proposal for gma500:
> > > > 
> > > > // call this from psb_pci_probe()
> > > > int gma_remove_conflicting_framebuffers(struct pci_dev *pdev, const
> > > > 					struct drm_driver *req_driver)
> > > > {
> > > > 	resource_size_t base = 0;
> > > > 	resource_size_t size = (resource_size_t)-1;
> > > > 	const char *name = req_driver->name;
> > > > 	int ret;
> > > > 
> > > > 	/*
> > > > 	 * We cannot yet easily find the framebuffer's location in
> > > > 	 * memory. So remove all framebuffers here.
> > > > 	 *
> > > > 	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then
> > > > 	 *       we might be able to read the framebuffer range from the
> > > > 	 *       device.
> > > > 	 */
> > > > 	ret = aperture_remove_conflicting_devices(base, size, name);
> > 
> > Why can't this be a call to drm_aperture_remove_framebuffers? At least as
> > long as we don't implement the "read out actual fb base and size" code,
> > which also none of the other soc drivers bother with?
> 
> It can. Feel free to use it.
> 
> But I have to say that those DRM helpers are somewhat empty and obsolete
> after the aperture code has been moved to drivers/video/. They exist mostly
> for convenience. As with other DRM helpers, if a driver needs something
> special, it can ignore them.
> 
> > 
> > > > 	if (ret)
> > > > 		return ret;
> > > > 
> > > > 	/*
> > > > 	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > > > 	 * otherwise the vga fbdev driver falls over.
> > > > 	 */
> > > > 	ret = vga_remove_vgacon(pdev);
> > 
> > This isn't enough, we also nuke stuff that's mapping the vga fb range.
> > Which is really the reason I don't want to open code random stuff, pci is
> > self-describing, if it's decoding legacy vga it can figure this out and we
> > only have to implement the "how do I nuke legacy vga fw drivers from a pci
> > driver" once.
> 
> Sure, but it's really just one additional line:
> 
>   aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> 
> as you mention below, this and vgacon can be exported in a single VGA
> aperture helper.
> 
> > 
> > Not twice like this would result in, with the gma500 version being only
> > half the thing.
> > 
> > If it absolutely has to be a separate function for the gma500 pci legacy
> > vga (I still don't get why, it's just a pci vga device, there's absolutely
> > nothing special about that part at all) then I think it needs to be at
> > least a common "nuke a legacy vga device for me pls" function, which
> > shares the implementation with the pci one.
> 
> Sure
> 
> /**
>  * kerneldoc goes here
>  *
>  * WARNING: Apparently we must remove graphics drivers before calling
>  *          this helper. Otherwise the vga fbdev driver falls over if
>  *          we have vgacon configured.
>  */
> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> {
> 	aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> 
> 	return vga_remove_vgacon(pdev);
> }
> 
> And that can be called from gma500 and the pci aperture helper.

But you still pass a pci_dev to that helper. Which just doesn't make any
sense to me (assuming your entire point is that this isn't just a normal
pci device but some special legacy vga thing), but if we go with (void)
then there's more refactoring to do because the vga_remove_vgacon also
wants a pdev.

All so that we don't call aperture_detach_devices() on a bunch of pci
bars, which apparently is not problem for any other driver, but absolutely
is a huge problem for gma500 somehow.

I don't understand why.

Consider this me throwing in the towel. If you&Javier are convinced this
makes sense please type it up and merge it, but I'm not going to type
something that just doesn't make sense to me.
-Daniel

> Best regards
> Thomas
> 
> > 
> > But not open-coding just half of it only.
> > 
> > > > 	if (ret)
> > > > 		return ret;
> > > > 
> > > > 	return 0;
> > > > }
> > > > 
> > > 
> > > If this is enough I agree that is much more easier code to understand.
> > 
> > It's still two calls and more code with more bugs? I'm not seeing the
> > point.
> > -Daniel
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
