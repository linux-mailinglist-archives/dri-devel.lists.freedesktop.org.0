Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CFB0A9B4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 19:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075E610E08C;
	Fri, 18 Jul 2025 17:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z245fCB9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866310E08C
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 17:44:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97F4A5C5F65;
 Fri, 18 Jul 2025 17:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD085C4CEEB;
 Fri, 18 Jul 2025 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752860655;
 bh=r7jzzhhlqvE5ku5kcAd5OqB3Um/2DvWTLMCOzwioi2M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z245fCB9/rRmVPyLP3CMTiyxp/kG4PUS/3ZaQvUeMnPl90TQbxHR9ZNMC9q2nF9V0
 +h0ytwAO4Ap8NxHPSh1gEmY5tK9vY0pmmKZFkzFyp0EuCx3ZhhSHPfNo89NV16949g
 EZ3ZaEEKCQ/nYQ7pvRhJZBe4AhYIfX38YVClKddAmxi+k23nvQ6li+93+BHGh3ADsl
 4S1dslmUTDXqJ5gGTNmFT0/e3y8hKxPUiQ4T0+aWiy9TXJkDivZq/G7HMeef8cPPG5
 ENBTaAtIZQ3xxgwwWPSDdzVN+EQIFkgCmJQurv/GU6ZzB3mByqkYwOHbgvERWMxm4W
 dxVhSgHUVmFkA==
Message-ID: <c7c8b0bf-8602-4030-acbe-ac56678b633c@kernel.org>
Date: Fri, 18 Jul 2025 12:44:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 9/9] PCI: Add a new 'boot_display' attribute
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
References: <20250718173648.GA2704349@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20250718173648.GA2704349@bhelgaas>
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

On 7/18/2025 12:36 PM, Bjorn Helgaas wrote:
> On Fri, Jul 18, 2025 at 12:29:05PM -0500, Mario Limonciello wrote:
>> On 7/18/2025 12:25 PM, Bjorn Helgaas wrote:
>>> On Thu, Jul 17, 2025 at 12:38:12PM -0500, Mario Limonciello wrote:
>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>
>>>> On systems with multiple GPUs there can be uncertainty which GPU is the
>>>> primary one used to drive the display at bootup. In some desktop
>>>> environments this can lead to increased power consumption because
>>>> secondary GPUs may be used for rendering and never go to a low power
>>>> state. In order to disambiguate this add a new sysfs attribute
>>>> 'boot_display' that uses the output of video_is_primary_device() to
>>>> populate whether a PCI device was used for driving the display.
>>>
>>>> +What:		/sys/bus/pci/devices/.../boot_display
>>>> +Date:		October 2025
>>>> +Contact:	Linux PCI developers <linux-pci@vger.kernel.org>
>>>> +Description:
>>>> +		This file indicates that displays connected to the device were
>>>> +		used to display the boot sequence.  If a display connected to
>>>> +		the device was used to display the boot sequence the file will
>>>> +		be present and contain "1".
>>>
>>>>    int __must_check pci_create_sysfs_dev_files(struct pci_dev *pdev)
>>>>    {
>>>> +	int retval;
>>>> +
>>>>    	if (!sysfs_initialized)
>>>>    		return -EACCES;
>>>> +	retval = pci_create_boot_display_file(pdev);
>>>
>>> In addition to Mani's question about whether /sys/bus/pci/ is the
>>> right place for this (which is a very good question), it's also been
>>> pointed out to me that we've been trying to get rid of
>>> pci_create_sysfs_dev_files() for years.
>>>
>>> If it's possible to make this a static attribute that would be much,
>>> much cleaner.
>>
>> Right - I tried to do this, but the problem is at the time the PCI device is
>> created the information needed to make the judgement isn't ready.  The
>> options end up being:
>> * a sysfs file for every display device with 0/1
>> * a sysfs file that is not accurate until later in the boot
> 
> What's missing?  The specifics might be helpful if someone has another
> crack at getting rid of pci_create_sysfs_dev_files() in the future.

The underlying SCREEN_INFO code tries to walk through all the PCI 
devices in a loop, but at the time all the devices are walked the memory 
regions associated with the device weren't populated.

So my earlier hack was to re-run the screen info check, and it was awful.

> 
>> So IMO it /needs/ to come later.
>>
>>>
>>>> +	if (retval)
>>>> +		return retval;
>>>> +
>>>>    	return pci_create_resource_files(pdev);
>>>>    }
>>>> @@ -1671,6 +1716,7 @@ void pci_remove_sysfs_dev_files(struct pci_dev *pdev)
>>>>    	if (!sysfs_initialized)
>>>>    		return;
>>>> +	pci_remove_boot_display_file(pdev);
>>>>    	pci_remove_resource_files(pdev);
>>>>    }
>>>> -- 
>>>> 2.43.0
>>>>
>>

