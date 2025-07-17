Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E40B08136
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 02:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E89710E3CE;
	Thu, 17 Jul 2025 00:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TpKbkaFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543D510E3CE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 00:02:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 64D36601D3;
 Thu, 17 Jul 2025 00:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C389FC4CEE7;
 Thu, 17 Jul 2025 00:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752710552;
 bh=aN8uGrdQ9GV2sZ0Iao19m2r7XXJCyuraNegypk978EA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TpKbkaFzYgX/5qfdQm54MccCJUjNP5Qj0DcD2O38AWFj2+pTRdbWhgEzA9AQo9ot5
 rexTigbjuSCoxjiNrb0mEv9hRZNX8Zg3lyFx7he0pF/C0RAUykq6RYUAWcXC5Nzt0B
 N4ZrThShdXtJX6ONccFRB+hL6qVZltMIPKdh5g0BwQ5dyLTQP9tRP7qMHkNqYKlW4b
 WXZsxQK57wmkozzFZ+eErhaTo2en3ChRSFKBlLcRjDsuvYrXSyhECT5FtMJiQG0vz2
 9wTBPjiOXhhHd73EB102b+YGCon4uDFeRX4S0ZxJkqnypYCzo1ssC9oAHdggE2B3ge
 plfcEUOWRAj/g==
Message-ID: <e9b331d1-d175-4e5a-ae08-445a8a8e1f45@kernel.org>
Date: Wed, 16 Jul 2025 19:02:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/9] Adjust fbcon console device detection
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:INTEL IOMMU (VT-d)" <iommu@lists.linux.dev>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:VFIO DRIVER" <kvm@vger.kernel.org>,
 "open list:SOUND" <linux-sound@vger.kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20250716232300.GA2565283@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250716232300.GA2565283@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/16/25 6:23 PM, Bjorn Helgaas wrote:
> On Mon, Jul 14, 2025 at 04:21:37PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> This series started out as changes to VGA arbiter to try to handle a case
>> of a system with 2 GPUs that are not VGA devices.  This was discussed
>> but decided not to overload the VGA arbiter for non VGA devices.
>>
>> Instead move the x86 specific detection of framebuffer resources into x86
>> specific code that the fbcon can use to properly identify the primary
>> device. This code is still called from the VGA arbiter, and the logic does
>> not change there. To avoid regression default to VGA arbiter and only fall
>> back to looking up with x86 specific detection method.
>>
>> In order for userspace to also be able to discover which device was the
>> primary video display device create a new sysfs file 'boot_display'.
>>
>> A matching userspace implementation for this file is available here:
>> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/39
>> Link: https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2038
>>
>> Dave Airlie has been pinged for a comment on this approach.
>> Dave had suggested in the past [1]:
>>
>> "
>>   But yes if that doesn't work, then maybe we need to make the boot_vga
>>   flag mean boot_display_gpu, and fix it in the kernel
>> "
>>
>> This was one of the approached tried in earlier revisions and it was
>> rejected in favor of creating a new sysfs file (which is what this
>> version does).
>>
>> It is suggested that this series merge entirely through the PCI tree.
>>
>> Link: https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/37#note_2938602 [1]
> 
> There's an underlying bug that we're trying to fix with this series
> and the related libpciaccess and xserver changes, isn't there?  Can we
> include that somewhere to help motivate this?  (I guess it's really
> only the last two or three patches that are strictly related, right?)

Do you mean in the cover letter of another spin of the series or just 
inline here?

The issue is that on systems with more than one GPU userspace doesn't 
know which one to be used to treat as primary.  The concept of primary 
is important to be able to decide which GPU is used for display and 
which is used for rendering.  If it's guessed wrong then both GPUs will 
be kept awake burning a lot of power.

Historically it would use the "boot_vga" attribute but this isn't 
present on modern GPUs.  So this series introduces a new attribute to 
give a hint to userspace which was used for display at bootup.  The 
matching patches to libpciaccess and xorg-server utilize this new sysfs 
file to set things up as intended.

And yes, the last few ones are the only ones strictly related to this 
issue. The other patches were just cleanups to use the same new helper 
from these patches elsewhere in the kernel too.

> 
>> v8 fixes an LKP robot reported issue
>>
>> Mario Limonciello (9):
>>    PCI: Add helper for checking if a PCI device is a display controller
>>    vfio/pci: Use pci_is_display()
>>    vga_switcheroo: Use pci_is_display()
>>    iommu/vt-d: Use pci_is_display()
>>    ALSA: hda: Use pci_is_display()
>>    Fix access to video_is_primary_device() when compiled without
>>      CONFIG_VIDEO
>>    PCI/VGA: Replace vga_is_firmware_default() with a screen info check
>>    fbcon: Use screen info to find primary device
>>    PCI: Add a new 'boot_display' attribute
>>
>>   Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>>   arch/parisc/include/asm/video.h         |  2 +-
>>   arch/sparc/include/asm/video.h          |  2 ++
>>   arch/x86/include/asm/video.h            |  2 ++
>>   arch/x86/video/video-common.c           | 17 ++++++++-
>>   drivers/gpu/vga/vga_switcheroo.c        |  2 +-
>>   drivers/iommu/intel/iommu.c             |  2 +-
>>   drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
>>   drivers/pci/vgaarb.c                    | 31 +++--------------
>>   drivers/vfio/pci/vfio_pci_igd.c         |  3 +-
>>   include/linux/pci.h                     | 15 ++++++++
>>   sound/hda/hdac_i915.c                   |  2 +-
>>   sound/pci/hda/hda_intel.c               |  4 +--
>>   13 files changed, 101 insertions(+), 35 deletions(-)
>>
>> -- 
>> 2.43.0
>>

