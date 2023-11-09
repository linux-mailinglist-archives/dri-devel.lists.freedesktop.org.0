Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99737E71A1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 19:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA0E897F0;
	Thu,  9 Nov 2023 18:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444FB89070
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 18:38:38 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d9beb865a40so1266366276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 10:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1699555117; x=1700159917;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fV5sHyyi4ZI7an57R+Z6oVQVBfOrZWTuZkLTMllw8oA=;
 b=VQpE0YUtSF+FjRZZm5+Wsv2qoAMqf9s4uCbZ7DbFpWhva6m/PWvfzTvcfpO8cLSn72
 nnDE1Zmsw/4Q93Vu7U9ulnVFPy/HLxc3WELu5LcAE3dTGAZsimyz+FhOx+gX/GhbFu0/
 uB+in/bB1YFs/oBWozF2HBcKS2++aa+FCqC66ZhoBYclzh/aEZilOugtEiqcxPpjqaMn
 gm09BLP+84Jj3fJTrnE3Kab1FTKOqWmeg568MCql00db5Ye6QS3QXPqmweeP2njRbL6r
 xntW/m3XbjkeRW/LJ8jYdFLsaBoHFdf4cs7okSBMcnq7b10HqPxaRuZd+MF+ocTY1w/5
 c2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699555117; x=1700159917;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fV5sHyyi4ZI7an57R+Z6oVQVBfOrZWTuZkLTMllw8oA=;
 b=nv6At3TPI2pcgQHcpclOs7TaP8NuNNvm4HjKUgdGzaVhCmLvBHfkYC4jw0k9b8snX+
 KZ+nO0X+HeSQzRNQ6i0yu1b5qoD1izF1zw4w+e/8e5iO+4xnKvoGK0mx3MqNWJL+6gPc
 yjzCAt8jbJFd2cZRMcxzy0XAdIEnf3RJAAe/dsZpcH1ibueO5ve8D/gbyrcmb+rSyEdp
 1fAz3KiwRr7/BMivCP8ySIF818AicuJeUN5rPyQrMbawrnV881ZZZWHeTaRpeRZYoUF5
 1fu5z7l/vLn+8Slgd2zB2vZdR821zF01uThuFp2d55bxyIa8Bay+OpqVz7onM6Zon+C6
 sGhQ==
X-Gm-Message-State: AOJu0YyDNAfkD7d0DBZm3rnhF1hPGYJinzGragJxYNHibFUrm1yezvbs
 S7Vmgrnm6c0vmHnMTzySzhVgI4z9eZFPi8H4C8Zf4g==
X-Google-Smtp-Source: AGHT+IGxG/yaQJNvwmPN3A4blt1ZJB1lI2uckaVXrn8M4Cd9g9bF1BXxrIiC8bda//14sYOtImyRM/aEVU6oOAJtxMg=
X-Received: by 2002:a25:df83:0:b0:d99:de67:c3dc with SMTP id
 w125-20020a25df83000000b00d99de67c3dcmr6645965ybg.2.1699555117408; Thu, 09
 Nov 2023 10:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
 <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
 <n_evglPOy869LKjnmZvX3Ka8Bh6P5NPJkoV7I-yGW9A-YZFl70d4dMuitHkUaPiNyX_o2-DZA31-hR6mp6tShKhGlNC_UWdnpL7OoGrZ52Y=@emersion.fr>
In-Reply-To: <n_evglPOy869LKjnmZvX3Ka8Bh6P5NPJkoV7I-yGW9A-YZFl70d4dMuitHkUaPiNyX_o2-DZA31-hR6mp6tShKhGlNC_UWdnpL7OoGrZ52Y=@emersion.fr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 9 Nov 2023 18:38:20 +0000
Message-ID: <CAPY8ntCjN8Hdam=r2i2-EePjhZZFQxn9zEm0Soz-W5WwKGO8Hg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
To: Simon Ser <contact@emersion.fr>
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
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon

On Thu, 9 Nov 2023 at 17:46, Simon Ser <contact@emersion.fr> wrote:
>
> On Thursday, November 9th, 2023 at 16:42, Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>
> > > > - What would be a good name for the heap? "vc4" is maybe a bit naive and
> > > >   not precise enough. Something with "cma"? Do we need to plan a naming
> > > >   scheme to accomodate for multiple vc4 devices?
> > >
> > > That's a general issue though that happens with pretty much all devices
> > > with a separate node for modesetting and rendering, so I don't think
> > > addressing it only for vc4 make sense, we should make it generic.
> > >
> > > So maybe something like "scanout"?
> > >
> > > One thing we need to consider too is that the Pi5 will have multiple
> > > display nodes (4(?) iirc) with different capabilities, vc4 being only
> > > one of them. This will impact that solution too.
> >
> > It does need to scale.
> >
> > Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
> > Video), and just this last week I've been running Wayfire with TinyDRM
> > drivers for SPI displays and UDL (DisplayLink) outputs as well.
> > Presumably all of those drivers need to have appropriate hooks added
> > so they each expose a dma-heap to enable scanout buffers to be
> > allocated.
>
> I'm not sure this makes sense necessarily for all of these devices. For vc4 and
> the 4 additional RPi 5 DRM devices, probably. For the rest, e.g. UDL, I'm not
> sure it makes sense to expose scanout memory allocation via DMA heaps: AFAIK
> UDL needs CPU access to the buffers, it can't "scanout", and thus directly
> rendering via v3d to a "scanout-capable" buffer doesn't make sense. There will
> be a copy (CPU download) either way, and allocating via v3d wouldn't make a
> difference.

You as a developer may know that UDL is going to need CPU access, but
how does a generic userspace app know? Is it a case of falling back to
allocating via the renderer if there is no suitably named heap?

> > Can we add another function pointer to the struct drm_driver (or
> > similar) to do the allocation, and move the actual dmabuf handling
> > code into the core?
>
> Do you mean that the new logic introduced in this patch should be in DRM core
> to allow other drivers to more easily re-use it? Or do you mean something else?

Yes, make it easy to reuse between drivers.

> Indeed, there is nothing vc4-specific in this patch, the only requirement is
> that the driver uses drm_gem_dma_helper. So this code could be moved into (or
> alongside) that helper in DRM core. However, maybe it would be best to wait to
> have a second user for this infrastructure before we move into core.

Upstreaming of the DSI / DPI / composite drivers for Pi5 should only
be a few months away, and they can all directly scanout.

I expect the Rockchip platforms to also fall into the same category as
the Pi, with Mali as the 3D IP, and the VOP block as the scanout
engine. Have I missed some detail that means that they aren't a second
user for this?

> > > > - Need to add !vc5 support.
> > >
> > > If by !vc5 you mean RPi0-3, then it's probably not needed there at all
> > > since it has a single node for both modesetting and rendering?
> >
> > That is true, but potentially vc4 could be rendering for scanout via UDL or SPI.
> > Is it easier to always have the dma-heap allocator for every DRM card
> > rather than making userspace mix and match depending on whether it is
> > all in one vs split?
>
> I don't think it's realistic to try to always make DMA heaps available for each
> and every driver which might need it from day one. It's too big of a task. And
> it's an even bigger task to try to design a fully generic heap compatibility
> uAPI from day one. I'd much rather add the heaps one by one, if and when we
> figure that it makes sense, and incrementally work our way through.

Is it really that massive a task? We have the dma heap UAPI for
handling the allocations, so what new UAPI is required?

If it's a new function pointer in struct drm_driver, then the heap is
only created by the core if that function is defined using the driver
name. The function returns a struct dma_buf *.
Any driver using drm_gem_dma_helper can use the new helper function
that is basically your vc4_dma_heap_allocate. The "if
(WARN_ON_ONCE(!vc4->is_vc5))" could be handled by not setting the
function pointer on those platforms.

Sorry, I feel I must be missing some critical piece of information here.

  Dave
