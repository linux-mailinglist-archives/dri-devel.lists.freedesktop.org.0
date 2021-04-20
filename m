Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E59365478
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF616E12C;
	Tue, 20 Apr 2021 08:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816046E12C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:46:51 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id w3so57090570ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vuclwn4vyYALU0qWvo6KCdEtoH/58AhLvrs6PmwRMkU=;
 b=d6k/+pMNRaJAPmCwZIx46LdCjEclIZQZIiqmt5R+9oE2HbK/SUZCyy9PgG7R/SdRV5
 +qqmMuLhWyBlELzXKxtTUWe/a/F923nSFKxOiKEcHGTTAXjjfYZKxixldu4HVwNbjrvS
 goh8h0wa7opFwUTqajn0mk7R0ka7M8qA/THy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vuclwn4vyYALU0qWvo6KCdEtoH/58AhLvrs6PmwRMkU=;
 b=bFiaSUcFLdv1VF1KGKTdndsBrCamcbAfkoUY4DjZ2LAdk96E6Zk77vxt+n+y9EzRBP
 GwqkfUQkiBRwtQweSQSxHV1y9GGuAjIggToW9rZDMqnImqAUSd0fyWvUpNKQJLEF/fJV
 bmsAj4PhrBNEhWg5bykFhpvjLKUsOczeTIpAGXR0OaONSlq/YhV5OPrwu1S8o5NYLb/M
 yunaAeYrX+0/mEzfobMYYx4udX4jJ7q53PiXyy7mJuoC/kDX3E9+GLpUOFtN2rcAV48C
 5YLxtYjPf0tgazasgZ4DYZ1IInMDEzWxI3tUjvI9jSCt4HTNRCY644YOFQ6AQHi5vQ27
 jpoQ==
X-Gm-Message-State: AOAM530PMdwne9+8TDR9ASCdz9JjiCxWPP7y8GWDMFhfVoWx07JTRqXF
 Hf/PYfXp8PH7kmSk7E9huP59cg==
X-Google-Smtp-Source: ABdhPJyhF872h1aJTtsSGthH1G/y01DLyqPuLLT/uw2mQIUL7MPcOuFmVGGTl/E/UJzUQ97XvDsuxw==
X-Received: by 2002:a17:906:53cd:: with SMTP id
 p13mr26254640ejo.379.1618908410246; 
 Tue, 20 Apr 2021 01:46:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n14sm11973365ejy.90.2021.04.20.01.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:46:49 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:46:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: bluescreen_avenger@verizon.net, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg KH <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > This patchset adds support for simple-framebuffer platform devices and
> > a handover mechanism for native drivers to take-over control of the
> > hardware.
> >
> > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > device. The kernel's boot code creates such devices for firmware-provided
> > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > loader sets up the framebuffers. Description via device tree is also an
> > option.
> 
> I guess this can be used as a replacement for offb, too...
> 
> > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> 
> .... if support for 8-bit frame buffers would be added?

Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
shouldn't be a big thing, but the latter is only really supported by the
overall drm ecosystem in theory. Most userspace assumes that xrgb8888
works, and we keep that illusion up by emulating it in kernel for hw which
just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
best. The uapis are all there for setting the palette, and C8 is a defined
format even with atomic kms interface, but really there's not much
userspace for it. In other words, it would work as well as current offb
would, but that's at least that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
