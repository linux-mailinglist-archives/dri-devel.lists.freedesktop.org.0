Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A903CB6CC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 13:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289F6E970;
	Fri, 16 Jul 2021 11:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9670589F63;
 Fri, 16 Jul 2021 11:40:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="190397773"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="190397773"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 04:40:06 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="496363853"
Received: from ooderhoh-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.212.81.13])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2021 04:40:03 -0700
Date: Fri, 16 Jul 2021 07:40:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: misc vgaarb cleanups
Message-ID: <YPFwEiztEUVFcdCh@intel.com>
References: <20210716061634.2446357-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716061634.2446357-1-hch@lst.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 08:16:27AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series cleans up a bunch of lose ends in the vgaarb code.
> 
> Diffstat:
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   11 +-
>  drivers/gpu/drm/drm_irq.c                  |    4 
>  drivers/gpu/drm/i915/display/intel_vga.c   |    9 +-

The parts touching i915 looks clean to me

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  drivers/gpu/drm/nouveau/nouveau_vga.c      |    8 -
>  drivers/gpu/drm/radeon/radeon_device.c     |   11 +-
>  drivers/gpu/vga/vgaarb.c                   |   67 +++++-----------
>  drivers/vfio/pci/vfio_pci.c                |   11 +-
>  include/linux/vgaarb.h                     |  118 ++++++++++-------------------
>  8 files changed, 93 insertions(+), 146 deletions(-)
