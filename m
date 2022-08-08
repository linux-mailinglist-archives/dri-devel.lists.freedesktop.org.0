Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410CE58CD3C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 19:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24801122A8;
	Mon,  8 Aug 2022 17:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B7597634
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659970164; x=1691506164;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1o+gR0tJEwoLex3RbwD64D6DOKMgfWUgOl3cVmA2tW0=;
 b=AxeZ6Jx004iCZYIoHsXMAe3AMDVCPC9/XGEwJMyj1W/Za5crEiLOknlq
 pxoDL6qUsIX3cjs4NEbpfKf5lqfDE+4jNYVwF3XVCHWdljBt68OTzQqtG
 kKCXrTuqORoKUD/AZ7whczNLwa0gFCwLiRVQfgrD20W8dX9ywS6TkbhWm
 bk3oznF/rMzm2abIMoWtIH8ylDZUMKAIadDo+wKGfVcNfg+X/QbPQVk+Q
 rrfgwiL+OUROJK+qZ+WGGvTKBgV0Za3+BFd3dh5JS5pI22LTvI8ENWbot
 U7Xrp2bNt72219dzh6Yag6zPpsqgEQaJW9zO5EgwU9TqYQj9pGpqXYOLB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="277542406"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="277542406"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 07:49:22 -0700
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; d="scan'208";a="663976883"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 07:49:20 -0700
Date: Mon, 8 Aug 2022 16:49:18 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1 0/7] New DRM driver for Intel VPU
Message-ID: <20220808144918.GA2666787@linux.intel.com>
References: <20220728131709.1087188-1-jacek.lawrynowicz@linux.intel.com>
 <CAPM=9tyqsK3X_+s53Xy5jUs+cq3+aSkYne-E4NLLJ+NBnRqjNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9tyqsK3X_+s53Xy5jUs+cq3+aSkYne-E4NLLJ+NBnRqjNg@mail.gmail.com>
X-Mailman-Approved-At: Mon, 08 Aug 2022 17:54:33 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 andrzej.kacprowski@linux.intel.com, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 12:34:59PM +1000, Dave Airlie wrote:
> On Thu, 28 Jul 2022 at 23:17, Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
> >
> > Hi,
> >
> > This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
> >
> > VPU stands for Versatile Processing Unit and it is an AI inference accelerator
> > integrated with Intel non-server CPUs starting from 14th generation.
> > VPU enables efficient execution of Deep Learning applications
> > like object detection, classification etc.
> >
> > Driver is part of gpu/drm subsystem because VPU is similar in operation to
> > an integrated GPU. Reusing drm driver init, ioctl handling, gem and prime
> > helpers and drm_mm allows to minimize code duplication in the kernel.
> >
> > The whole driver is licensed under GPL-2.0-only except for two headers imported
> > from the firmware that are MIT licensed.
> >
> > User mode driver stack consists of Level Zero API driver and OpenVINO plugin.
> > Both should be open-sourced by the end of Q3.
> > The firmware for the VPU will be distributed as a closed source binary.
> 
> 
> Thanks for the submission, this looks pretty good and well layed out,
> 
> just a few higher level things, I think I'd like this name intel-vpu
> or ivpu or something, VPU is a pretty generic namespace usage.

Thanks for the comments, we will consider renaming. 

> I think adding some sort of TODO file with what is missing and what
> future things need to happen would be useful to know when merging this
> might be a good idea.
> 
> I'm kinda thinking with a rename we could merge this sooner into a
> staging-lite model.

I'm not sure what we can add to TODO file, from driver perspective
I think it's pretty much ready for merging (except renaming), just
other components: F/W and user-space are not yet released.

> I think I'd like Christian/Maarten to maybe review the fencing/uapi,
> to make sure nothing too much is wrong there. The submit/waitbo model
> is getting a bit old, and using syncobjs might be useful to make it
> more modern. Is this device meant to be used by multiple users at
> once? Maybe we'd want scheduler integration for it as well (which I
> think I saw mentioned somewhere in passing).

The current approach with submit/wait_bo is simplistic but sufficient
for basic use case. In the future we are planning to add support for
HW based scheduling (we are also looking at SW scheduler) and we will
likely revisit submit/sync APIs at that time.

Regards
Stanislaw
