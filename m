Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2255B6D84A8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAD610E22B;
	Wed,  5 Apr 2023 17:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C47910E226
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:14:57 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-177ca271cb8so39282222fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680714896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8RpaBHYQHQlUz8gzTyOfx2Akoi5V+UhYtNZbrEqY4yY=;
 b=R5oEuHq4jmuDFHswm+Dm1Nyd38pEfZ3bhW7Ezqo+WXcMQPl7ObsHHKFbg472OH6m75
 uVlITwoIA/ZwVdsS3RT9+P86sZy5s3nG19kxYbb5mM+7u39eP/7V2WFHQuy5hWNM1hys
 N/7N45B5jr81rabHBpkmpS6wLUx4afgqgM5+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680714896;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RpaBHYQHQlUz8gzTyOfx2Akoi5V+UhYtNZbrEqY4yY=;
 b=YLhDigHLLqIgLNax75JsC5pIQQd+EidfZ8KvGB+Bif/zPAhQXSjNYk23pAYoarq8vR
 u2UpLXv2dnUdH29s1EbYRSQgPVslC7YIe14rC17LcT+qftdftcF5sLnD4PEO65sYyu7h
 Afb4HvHs79X03nhu9s/cXw3y6nP73NCNyQMHhCdNLLxiXVl62DaG82w9Z9h7IwoWalza
 QeV14/OnhE2OToJoLbK07z0HdsGuV+OUkeUn8NmLvWVHYSgoxObgCpc/zSxdHvn0qqWP
 fp9OJl/xvL/xT+AruEFoYAoUL6PE5uNFcmQtrtwQhI9DyhV1Fs6Zwz91TR+kcx45b7oN
 hgfw==
X-Gm-Message-State: AAQBX9fnEf+n0I5q+QJTrlG4ailpn0gkAI9jyUSsA+117KX+GfV4kCCb
 e15zKvcnegIXxauqSTKbbrYAGcqnPhwRnX/7aV3pQQ==
X-Google-Smtp-Source: AKy350Yd3LVO+u/SGwGZK2+t1UQglBKW38h7x3bStfv3RPOc0JZGbAHPW4IlHFuu4cUpmfDjRcFUdh9MnqHxwswXNfc=
X-Received: by 2002:a05:6870:e747:b0:17e:d863:a5c0 with SMTP id
 t7-20020a056870e74700b0017ed863a5c0mr3471458oak.8.1680714896082; Wed, 05 Apr
 2023 10:14:56 -0700 (PDT)
MIME-Version: 1.0
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
 <ZC2beu/9inolwIlr@phenom.ffwll.local>
 <87bkk29smu.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87bkk29smu.fsf@minerva.mail-host-address-is-not-set>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Apr 2023 19:14:44 +0200
Message-ID: <CAKMK7uGbPWE5mg2+ojxxEdfknDzmjDr+5n_y-t-nYNzDFE21EA@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 18:54, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Daniel Vetter <daniel@ffwll.ch> writes:
>
> > On Wed, Apr 05, 2023 at 04:32:19PM +0200, Thomas Zimmermann wrote:
>
> [...]
>
> >> > > >        /*
> >> > > >         * WARNING: Apparently we must kick fbdev drivers before vgacon,
> >> > > >         * otherwise the vga fbdev driver falls over.
> >> > > >         */
> >> > > >        ret = vga_remove_vgacon(pdev);
> >> >
> >> > This isn't enough, we also nuke stuff that's mapping the vga fb range.
>
> Ah, also need aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE) then.
>
> [...]
>
> >> int aperture_remove_legacy_vga_devices(struct pci_dev *pdev)
> >> {
> >>      aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
> >>
> >>      return vga_remove_vgacon(pdev);
> >> }
> >>
> >> And that can be called from gma500 and the pci aperture helper.
> >
> > But you still pass a pci_dev to that helper. Which just doesn't make any
> > sense to me (assuming your entire point is that this isn't just a normal
> > pci device but some special legacy vga thing), but if we go with (void)
> > then there's more refactoring to do because the vga_remove_vgacon also
> > wants a pdev.
> >
> > All so that we don't call aperture_detach_devices() on a bunch of pci
> > bars, which apparently is not problem for any other driver, but absolutely
> > is a huge problem for gma500 somehow.
> >
> > I don't understand why.
> >
>
> Yeah, agreed that if vga_remove_vgacon() isn't enough and another helper
> is needed then starts to get a little silly. Maybe one option is to add a
> 3rd param to aperture_remove_conflicting_pci_devices() and skip the logic
> to iterate over PCI bars and call aperture_remove_conflicting_devices() ?

The thing I don't get: Why does this matter for gma500 and not any of
the other pci devices? Look at your gpu, realize there's a lot more
than the one pci bar for vram or stolen memory, realize that we're
nuking bars that cannot possible contain the framebuffer for everyone
else too. Like the entire "gpus have a lot of bars" thing is the
reason why I pulled the sysfb_disable one level up, because we've been
doing that quite a few times before this patch (yes it's not the main
thing, but the side-effect cleanup is why I've gone down this rabbit
hole and wrote the entire series here):

https://lore.kernel.org/dri-devel/20230404201842.567344-7-daniel.vetter@ffwll.ch/

But somehow for gma500 it's a problem, while for everyone else it's
fine. That's the part I dont get, or Thomas&me have been talking past
each another and there's another issue that I'm missing.
-Daniel

> > Consider this me throwing in the towel. If you&Javier are convinced this
> > makes sense please type it up and merge it, but I'm not going to type
> > something that just doesn't make sense to me.
>
> Honestly, I would just go with the double drm_aperture_remove_*() helper
> calls (your original patch) unless that causes real issues. There is no
> point on blocking all your series just for this IMO.
>
> Then latter if Thomas has strong opinions can send a follow-up patch for
> the gma500 driver and the aperture helpers.
>
> > -Daniel
> >
>
> --
> Best regards,
>
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
