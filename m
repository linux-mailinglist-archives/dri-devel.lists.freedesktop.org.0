Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C91CA4E392
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3EE10E2D0;
	Tue,  4 Mar 2025 15:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Uq/vYyDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50C110E1CD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:35:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67C6744327;
 Tue,  4 Mar 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1741102551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=v5eDZmBWe7K26EFzulkfQB+TGvAIpuPH7bySSym5Amk=;
 b=Uq/vYyDCA7A1KK9Ur1ueQxbrt//Qng+F1vDlaoG5TrVAafU/yGEHpP92EsEKxQL+ft3tdE
 W22KoHiNvla0fTenbxWzZNl/dlaUfSavpiF3FHwGeCfJXBHgPiWB9zHeLcht6WMRP//OVq
 1YtYM0ol5bwYaetACS+fMCWwieo5/wLwjWCObRTVCFTjcMef9AaVXqmQMmER/BMrHn/bYg
 DdZrboSr+kkloD8tNzg1WZQ/FTdwq5QQyMDknpxmRAaFebPjY3D/veRLAw6i922rMUEI3C
 7db2YcCLEcFPmioOwGv/URDXnGLod4Am//mlXH/u+rAEdlkm0K2hdX8o1Mwsjw==
Message-ID: <fa4f4d3d-6a3e-4659-8a59-4928c2285d55@bootlin.com>
Date: Tue, 4 Mar 2025 16:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250225175936.7223-1-jose.exposito89@gmail.com>
 <20250225175936.7223-4-jose.exposito89@gmail.com>
 <52bc3f15-28da-4b40-917f-981f1f10d9b8@bootlin.com> <Z8VtPMzuZOYqjraQ@fedora>
 <e813ac5b-298c-4863-b0b6-e9ac7fec1da0@bootlin.com> <Z8cUN8Q4L0VE-bVm@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <Z8cUN8Q4L0VE-bVm@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffveejueevtdfhffekvdelfefhvedtgeduudfhvedtvdejveejhfeukeehhfdvueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmr
 ggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 04/03/2025 à 15:54, José Expósito a écrit :
> Hi Louis,
> 
> On Mon, Mar 03, 2025 at 11:34:50AM +0100, Louis Chauvet wrote:
>>
>>
>> Le 03/03/2025 à 09:50, José Expósito a écrit :
>>> Hi Louis,
>>>
>>> On Fri, Feb 28, 2025 at 03:43:25PM +0100, Louis Chauvet wrote:
>>>>
>>>>
>>>> Le 25/02/2025 à 18:59, José Expósito a écrit :
>>>>> Create a default subgroup at /config/vkms/planes to allow to create as
>>>>> many planes as required.
>>>>>
>>>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>> Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>>>> [...]
>>>>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>>>>> index 92512d52ddae..4f9d3341e6c0 100644
>>>>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>>>>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>>>>> [...]
>>>>> +static void plane_release(struct config_item *item)
>>>>> +{
>>>>> +	struct vkms_configfs_plane *plane;
>>>>> +	struct mutex *lock;
>>>>> +
>>>>> +	plane = plane_item_to_vkms_configfs_plane(item);
>>>>> +	lock = &plane->dev->lock;
>>>>> +
>>>>> +	guard(mutex)(lock);
>>>>> +	vkms_config_destroy_plane(plane->config);
>>>>> +	kfree(plane);
>>>>> +}
>>>>
>>>> I just found a flaw in our work: there is currently no way to forbid the
>>>> deletion of item/symlinks...
>>>>
>>>> If you do:
>>>>
>>>> modprobe vkms
>>>> cd /sys/kernel/config/vkms/
>>>> mkdir DEV
>>>> mkdir DEV/connectors/CON
>>>> mkdir DEV/planes/PLA
>>>> mkdir DEV/crtcs/CRT
>>>> mkdir DEV/encoders/ENC
>>>> ln -s DEV/crtcs/CRT DEV/planes/PLA/possible_crtcs/
>>>> ln -s DEV/crtcs/CRT DEV/encoders/ENC/possible_crtcs
>>>> ln -s DEV/encoders/ENC DEV/connectors/CON/possible_encoders
>>>> echo 1 > DEV/planes/PLA/type
>>>> tree
>>>> echo 1 > DEV/enabled
>>>> modetest -M vkms
>>>> => everything fine
>>>>
>>>> rm DEV/connectors/CON/possible_encoders/ENC
>>>> rmdir DEV/connectors/CON
>>>> modetest -M vkms
>>>> => BUG: KASAN: slab-use-after-free
> 
> I'm trying to reproduce this issue, but those commands don't show any BUG
> in dmesg. This is my Kasan .config:
> 
>      CONFIG_HAVE_ARCH_KASAN=y
>      CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
>      CONFIG_CC_HAS_KASAN_GENERIC=y
>      CONFIG_CC_HAS_KASAN_SW_TAGS=y
>      CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
>      CONFIG_KASAN=y
>      CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
>      CONFIG_KASAN_GENERIC=y
>      # CONFIG_KASAN_OUTLINE is not set
>      CONFIG_KASAN_INLINE=y
>      CONFIG_KASAN_STACK=y
>      CONFIG_KASAN_VMALLOC=y
>      # CONFIG_KASAN_KUNIT_TEST is not set
>      CONFIG_KASAN_EXTRA_INFO=y
> 
> I tryed to delete even more items:
> 
>      root@kernel-dev:/sys/kernel/config/vkms# tree
>      .
>      └── DEV
>          ├── connectors
>          ├── crtcs
>          ├── enabled
>          ├── encoders
>          └── planes
> 
>      root@kernel-dev:/sys/kernel/config/vkms# cat DEV/enabled
>      1
> 
> And I still don't see any errors. Is it possible that we are running different
> branches? Asking because of the failing IGT tests you reported. There seems to
> be a difference in our code or setup that is creating these differences.

I just re-applied your last vkms-config version and this series on top 
of drm-misc-next. See [1] for the exact commits.

Argg sorry, I just noticed something: you need to disable the default 
vkms device (I had this option in my kernel command line...), otherwise 
modetest only use the first vkms gpu...

I will check again the igt tests, but I don't think this is the same 
issue (it should not use the default device to test)

So, with [1] and the defconfig below, I have this:


     1  modprobe vkms create_default_dev=0
     2  cd /sys/kernel/config/vkms/
     3  mkdir DEV
     4  mkdir DEV/connectors/CON
     5  mkdir DEV/planes/PLA
     6  mkdir DEV/crtcs/CRT
     7  mkdir DEV/encoders/ENC
     8  ln -s DEV/crtcs/CRT DEV/planes/PLA/possible_crtcs/
     9  ln -s DEV/crtcs/CRT DEV/encoders/ENC/possible_crtcs
    10  ln -s DEV/encoders/ENC DEV/connectors/CON/possible_encoders
    11  echo 1 > DEV/planes/PLA/type
    12  tree
    13  echo 1 > DEV/enabled
    14  modetest -M vkms
    15  rm DEV/connectors/CON/possible_encoders/ENC
    16  rmdir DEV/connectors/CON
    17  modetest -M vkms
KASAN: slab-use-after-free


[1]:https://github.com/Fomys/linux/tree/20250225175936.7223-1-jose.exposito89%40gmail.com


===== defconfig =====

CONFIG_SYSVIPC=y
CONFIG_CGROUPS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_SMP=y
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
# CONFIG_VIRTUALIZATION is not set
CONFIG_JUMP_LABEL=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_NET=y
CONFIG_PACKET=y
# CONFIG_WIRELESS is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_VIRTIO=y
CONFIG_PCI=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_VIRTIO_BLK=y
# CONFIG_INTEL_MEI is not set
CONFIG_NETDEVICES=y
CONFIG_VIRTIO_NET=y
# CONFIG_ETHERNET is not set
# CONFIG_WLAN is not set
CONFIG_INPUT_EVDEV=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_VIRTIO_CONSOLE=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_PTP_1588_CLOCK=y
# CONFIG_HWMON is not set
CONFIG_THERMAL_GOV_USER_SPACE=y
CONFIG_DRM=y
CONFIG_DRM_KUNIT_TEST=m
CONFIG_DRM_VKMS=m
CONFIG_DRM_VKMS_KUNIT_TEST=m
# CONFIG_USB_SUPPORT is not set
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_INPUT=y
CONFIG_VIRTIO_MMIO=y
CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_EXT4_FS=y
CONFIG_FUSE_FS=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_CONFIGFS_FS=y
CONFIG_9P_FS=y
CONFIG_CRYPTO=y
CONFIG_CRYPTO_CRC32C=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_INFO_DWARF5=y
CONFIG_MAGIC_SYSRQ=y
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_KASAN=y
CONFIG_KASAN_VMALLOC=y
CONFIG_KASAN_EXTRA_INFO=y
CONFIG_KFENCE=y
# CONFIG_FTRACE is not set
CONFIG_UNWINDER_FRAME_POINTER=y
CONFIG_KUNIT=y
CONFIG_TEST_DYNAMIC_DEBUG=m

