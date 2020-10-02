Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F6280FF6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 11:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C696E6E25A;
	Fri,  2 Oct 2020 09:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3566E25A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 09:35:13 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id m6so1050870wrn.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 02:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=BpK88C7pHVfm7Xd/YUZRAsUp3EAae6LbRjsv8dXA5cw=;
 b=gQQEDT2273zbnMI2K24GO8wWvlqW3PZ1C69DxD3QXe13a8vepyBWPq91HKvGAUtIGb
 TfIFxI8tFBj49Vq+1JGBekM/EcVXfEe59Xz7jBfiqoy5W908ZY36o7Lo3BEIdoGFl+9G
 Ka+rpz38Ga5EZEKxwD2urFUg/D1mRPbHLczHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=BpK88C7pHVfm7Xd/YUZRAsUp3EAae6LbRjsv8dXA5cw=;
 b=Wm7lhT/sOXH3C8d6NPYvexqtEJD67xzplmmCdktsVbXDMBCwp3S/s7IDA2D2Ch6446
 dnkrXlM4KU8D7G+xby7AwUATrbIGCqPhrK7AcTwqcIAPTq3MyiKE1UlIp+04OF5u+Ti3
 j2rDE64mJOeTpKioJkBQ38gt69iMmiy7tizlP/llgTpkft/n/yyYdmalhR4O8EVlcRKA
 Sr0ob/Qcy2HWEANA9zBECGLX0riOm/BEm1Z7vAwqG3Hdgb0f7CC+/W09EaHj6g0pPmk+
 MD8BG53GnXpCZ+x5YPVpDznoUuDwIiPlMRs/Xn+Tw5YdOuOKF6NnZYddlFScDsaHc6JF
 gGuA==
X-Gm-Message-State: AOAM531DQ1LebHcVxoaDpZUlNlNQbByvQyNiNPqORb5JtrI2E9fQnZ8M
 CH1CuFYrZM3roadRmhfxx9B/gA==
X-Google-Smtp-Source: ABdhPJykrhwgDQ+Cfh4cqZgcNZxoClfD6BLD+KFpVIbHeTXbxtjIEdx893xAoQyqCspb1vNoEtkdFA==
X-Received: by 2002:adf:8285:: with SMTP id 5mr1892288wrc.97.1601631312192;
 Fri, 02 Oct 2020 02:35:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u66sm1121105wme.12.2020.10.02.02.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 02:35:10 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:35:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [RFC PATCH 0/4] Add a RPMsg driver to support AI Processing Unit
 (APU)
Message-ID: <20201002093508.GF438822@phenom.ffwll.local>
Mail-Followup-To: Alexandre Bailon <abailon@baylibre.com>,
 linux-remoteproc@vger.kernel.org, ohad@wizery.com,
 gpain@baylibre.com, stephane.leprovost@mediatek.com,
 jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 mturquette@baylibre.com, bjorn.andersson@linaro.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
References: <20200930115350.5272-1-abailon@baylibre.com>
 <20201001084856.GC438822@phenom.ffwll.local>
 <8e4bb739-c3b3-d790-e8e3-dd5df2d6f869@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e4bb739-c3b3-d790-e8e3-dd5df2d6f869@baylibre.com>
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
Cc: ohad@wizery.com, linaro-mm-sig@lists.linaro.org,
 stephane.leprovost@mediatek.com, christian.koenig@amd.com,
 mturquette@baylibre.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, gpain@baylibre.com, jstephan@baylibre.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 07:28:27PM +0200, Alexandre Bailon wrote:
> Hi Daniel,
> 
> On 10/1/20 10:48 AM, Daniel Vetter wrote:
> > On Wed, Sep 30, 2020 at 01:53:46PM +0200, Alexandre Bailon wrote:
> > > This adds a RPMsg driver that implements communication between the CPU and an
> > > APU.
> > > This uses VirtIO buffer to exchange messages but for sharing data, this uses
> > > a dmabuf, mapped to be shared between CPU (userspace) and APU.
> > > The driver is relatively generic, and should work with any SoC implementing
> > > hardware accelerator for AI if they use support remoteproc and VirtIO.
> > > 
> > > For the people interested by the firmware or userspace library,
> > > the sources are available here:
> > > https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu
> > Since this has open userspace (from a very cursory look), and smells very
> > much like an acceleration driver, and seems to use dma-buf for memory
> > management: Why is this not just a drm driver?
> 
> I have never though to DRM since for me it was only a RPMsg driver.
> I don't know well DRM. Could you tell me how you would do it so I could have
> a look ?

Well internally it would still be an rpmsg driver ... I'm assuming that's
kinda similar to how most gpu drivers sit on top of a pci_device or a
platform_device, it's just a means to get at your "device"?

The part I'm talking about here is the userspace api. You're creating an
entirely new chardev interface, which at least from a quick look seems to
be based on dma-buf buffers and used to submit commands to your device to
do some kind of computing/processing. That's exactly what drivers/gpu/drm
does (if you ignore the display/modeset side of things) - at the kernel
level gpus have nothing to do with graphics, but all with handling buffer
objects and throwing workloads at some kind of accelerator thing.

Of course that's just my guess of what's going on, after scrolling through
your driver and userspace a bit, I might be completely off. But if my
guess is roughly right, then your driver is internally an rpmsg
driver, but towards userspace it should be a drm driver.

Cheers, Daniel

> 
> Thanks,
> Alexandre
> 
> > -Daniel
> > 
> > > Alexandre Bailon (3):
> > >    Add a RPMSG driver for the APU in the mt8183
> > >    rpmsg: apu_rpmsg: update the way to store IOMMU mapping
> > >    rpmsg: apu_rpmsg: Add an IOCTL to request IOMMU mapping
> > > 
> > > Julien STEPHAN (1):
> > >    rpmsg: apu_rpmsg: Add support for async apu request
> > > 
> > >   drivers/rpmsg/Kconfig          |   9 +
> > >   drivers/rpmsg/Makefile         |   1 +
> > >   drivers/rpmsg/apu_rpmsg.c      | 752 +++++++++++++++++++++++++++++++++
> > >   drivers/rpmsg/apu_rpmsg.h      |  52 +++
> > >   include/uapi/linux/apu_rpmsg.h |  47 +++
> > >   5 files changed, 861 insertions(+)
> > >   create mode 100644 drivers/rpmsg/apu_rpmsg.c
> > >   create mode 100644 drivers/rpmsg/apu_rpmsg.h
> > >   create mode 100644 include/uapi/linux/apu_rpmsg.h
> > > 
> > > -- 
> > > 2.26.2
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
