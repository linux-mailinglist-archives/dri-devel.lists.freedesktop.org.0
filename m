Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D2FB079AE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 17:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09B210E74D;
	Wed, 16 Jul 2025 15:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eXV0vx9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8431410E74D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 15:24:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 655935C661F;
 Wed, 16 Jul 2025 15:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5741BC4CEF0;
 Wed, 16 Jul 2025 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752679467;
 bh=LAicS+pihtv9EEihexoFYLo1L3pM9ZqAXYRukX438Nw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eXV0vx9qsPrkBBLAYy4/BJFyqFKY7mfLVIIl/hUHZBRcBi1p1i6xoMoDMgFTiDcsV
 MVBJDfF+6g2FvAvMAt0V8p0+SxYErYjU4HcK2UM0oiqt4PSzCpPNxGIZVYqIx0ivDs
 c0huQIb6tjN3KkM2uKjEqN7BVSSZoHZIaZonZbGPViwBo9SG6hayKuMuS+LSyuhFvM
 bOYzJWOWLGEspFmpulKbFJoyvEkfovtHTDN4qRg3zoNLQuNwJ4hyqMzUvs7GLBL49Z
 rR2DpPB6jo2d1Dew+8bEJ6F4aQ8FtryO+uO3Xb+jgh380PaOaULW6g5H0RVSmHdK9P
 Szcu9EgUZpT9w==
Message-ID: <051e5c07-f012-44b1-8e6b-ef9c13ee7177@kernel.org>
Date: Wed, 16 Jul 2025 10:24:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] PCI: Add a new 'boot_display' attribute
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
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
References: <20250714212147.2248039-1-superm1@kernel.org>
 <20250714212147.2248039-10-superm1@kernel.org>
 <20250716-upbeat-tody-of-psychology-93e2a2@houat>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250716-upbeat-tody-of-psychology-93e2a2@houat>
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

On 7/16/25 3:22 AM, Maxime Ripard wrote:
> Hi Mario,
> 
> On Mon, Jul 14, 2025 at 04:21:46PM -0500, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> On systems with multiple GPUs there can be uncertainty which GPU is the
>> primary one used to drive the display at bootup. In order to disambiguate
>> this add a new sysfs attribute 'boot_display' that uses the output of
>> video_is_primary_device() to populate whether a PCI device was used for
>> driving the display.
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> v7:
>>   * fix lkp failure
>>   * Add tag
>> v6:
>>   * Only show for the device that is boot display
>>   * Only create after PCI device sysfs files are initialized to ensure
>>     that resources are ready.
>> v4:
>>   * new patch
>> ---
>>   Documentation/ABI/testing/sysfs-bus-pci |  8 +++++
>>   drivers/pci/pci-sysfs.c                 | 46 +++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-pci b/Documentation/ABI/testing/sysfs-bus-pci
>> index 69f952fffec72..8b455b1a58852 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-pci
>> +++ b/Documentation/ABI/testing/sysfs-bus-pci
>> @@ -612,3 +612,11 @@ Description:
>>   
>>   		  # ls doe_features
>>   		  0001:01        0001:02        doe_discovery
>> +
>> +What:		/sys/bus/pci/devices/.../boot_display
>> +Date:		October 2025
>> +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
>> +Description:
>> +		This file indicates the device was used as a boot
>> +		display. If the device was used as the boot display, the file
>> +		will be present and contain "1".
> 
> It would probably be a good idea to define what a "boot display" here
> is. I get what you mean, but it's pretty vague and could easily be
> misunderstood.
> 
> Maxime

Here's my proposal for updated text, can you please bikeshed or propose 
an alternative?

This file indicates that displays connected to the device were used to 
display the boot sequence.  If a display connected to the device was
used to display the boot sequence the file will be present and contain "1".


