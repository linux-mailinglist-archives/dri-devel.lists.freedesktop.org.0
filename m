Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE411A4A99
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 21:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394DC6ED3A;
	Fri, 10 Apr 2020 19:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AF46ED3A;
 Fri, 10 Apr 2020 19:38:02 +0000 (UTC)
Received: from localhost (mobile-166-170-220-109.mycingular.net
 [166.170.220.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB1CC20732;
 Fri, 10 Apr 2020 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586547482;
 bh=76FW6bsyi+GvI3cA1295vPvYzfcdLfIdfR/uMK0cqIM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=f5aqyeY5H8P+Dg0VtR5VXhNEaIBxx4R/gGzchOa7w+V/JIMrsYuYNV7aLVSvrZntH
 WWv3dp0kGmlDxfECQgMchX8GExkaXAsoMWQhr1nrjc+24qlq2ngw+8X5Yw7mD9qxHN
 rCJAnLyi2B0qmE9qQBazZ/B4H3+CIp6g7so4MwFk=
Date: Fri, 10 Apr 2020 14:38:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 5/7] PM: sleep: core: Rename DPM_FLAG_NEVER_SKIP
Message-ID: <20200410193800.GA5202@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5092680.jloV5Ae5OO@kreacher>
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
Cc: Hans De Goede <hdegoede@redhat.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-wired-lan@lists.osuosl.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 05:56:13PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Rename DPM_FLAG_NEVER_SKIP to DPM_FLAG_NO_DIRECT_COMPLETE which
> matches its purpose more closely.
> 
> No functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com> # for PCI parts

> ---
>  Documentation/driver-api/pm/devices.rst    |  6 +++---
>  Documentation/power/pci.rst                | 10 +++++-----
>  drivers/base/power/main.c                  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |  2 +-
>  drivers/gpu/drm/i915/intel_runtime_pm.c    |  2 +-
>  drivers/gpu/drm/radeon/radeon_kms.c        |  2 +-
>  drivers/misc/mei/pci-me.c                  |  2 +-
>  drivers/misc/mei/pci-txe.c                 |  2 +-
>  drivers/net/ethernet/intel/e1000e/netdev.c |  2 +-
>  drivers/net/ethernet/intel/igb/igb_main.c  |  2 +-
>  drivers/net/ethernet/intel/igc/igc_main.c  |  2 +-
>  drivers/pci/pcie/portdrv_pci.c             |  2 +-
>  include/linux/pm.h                         |  6 +++---
>  13 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
> index f66c7b9126ea..4ace0eba4506 100644
> --- a/Documentation/driver-api/pm/devices.rst
> +++ b/Documentation/driver-api/pm/devices.rst
> @@ -361,9 +361,9 @@ the phases are: ``prepare``, ``suspend``, ``suspend_late``, ``suspend_noirq``.
>  	runtime PM disabled.

Minor question about a preceding paragraph that ends:

  In that case, the ``->complete`` callback will be invoked directly
  after the ``->prepare`` callback and is entirely responsible for
  putting the device into a consistent state as appropriate.

What does" a consistent state as appropriate" mean?  I know this is
generic documentation at a high level, so maybe there's no good
explanation for "consistent state," but I don't know what to imagine
there.

And what does "as appropriate" mean?  Would it change the meaning to
drop those two words, or are there situations where it's not
appropriate to put the device into a consistent state?  Or maybe it's
just that the type of device determines what the consistent state is?

>  	This feature also can be controlled by device drivers by using the
> -	``DPM_FLAG_NEVER_SKIP`` and ``DPM_FLAG_SMART_PREPARE`` driver power
> -	management flags.  [Typically, they are set at the time the driver is
> -	probed against the device in question by passing them to the
> +	``DPM_FLAG_NO_DIRECT_COMPLETE`` and ``DPM_FLAG_SMART_PREPARE`` driver
> +	power management flags.  [Typically, they are set at the time the driver
> +	is probed against the device in question by passing them to the
>  	:c:func:`dev_pm_set_driver_flags` helper function.]  If the first of
>  	these flags is set, the PM core will not apply the direct-complete
>  	procedure described above to the given device and, consequenty, to any

s/consequenty/consequently/

Drive-by comment: I looked for a definition of "direct-complete".  The
closest I found is a couple paragraphs above this, where it says "Note
that this direct-complete procedure ...," but that leaves me to try to
reconstruct the definition from the preceding text.

AFAICT, going to freeze, standby, or memory sleep includes these
callbacks:

  ->prepare
  ->suspend
  ->suspend_late
  ->suspend_noirq
  ->complete         (not mentioned in the list of phases)

And "direct-complete" means we skip the suspend, suspend_late,
and suspend_noirq callbacks so we only use these:

  ->prepare
  ->complete

And apparently we skip those callbacks for device X if ->prepare() for
X and all its descendents returns a positive value AND they are all
runtime-suspended, except if a driver for X or a descendent sets
DPM_FLAG_NO_DIRECT_COMPLETE.

Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
