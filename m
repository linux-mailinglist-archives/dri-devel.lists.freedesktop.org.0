Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1178BAF0F0
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 05:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFB410E0F0;
	Wed,  1 Oct 2025 03:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="DQPRGQO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F6110E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759289322; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mMXZXQ8uX3/mw+c5wFHTd4t/jr8JWePxOtQn2+m7/AYPZKqrcSJ986a4VRd9R50FoGVF5B+BQtoRjX3bt1pLMeskbtLqMz/ZDydMZ/ojtflRpWmb8yMYMi2NF5iRi4FgAz/Wg6HDJHGfdX3awt5jBH5D05j9AFuwnU2Um96ARoY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759289322;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=oWWzoVJeUJH2Vl2rNeYNom/Wlqw5e0legIz9Ivl8Ja8=; 
 b=iqmj5gj7axOPaoUl4CnYuFxQZ6K2GLOLsu0VWm8UdlTEqSD2TK5dWd1H3lrIfeSbsyGl46WK+8AJNyELNQDVFVR+PyGuMY+wY1wtu0K40hVtLuIdIohYfvSZCTuM3pV4HVdi0u9khtD0+hr5wNuMEssR6dZ6bd6UqK7sFw1XZjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759289322; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=oWWzoVJeUJH2Vl2rNeYNom/Wlqw5e0legIz9Ivl8Ja8=;
 b=DQPRGQO0joE7usiCT/bstuQoKY/GfkZ+XhZ5qHNq72lXNqZBDY1xlWdmlwkyP8LT
 fpZbMPZb3GLbDJ3GMT8R8vUC9/29Nb1AkFXYslU8Ri+OMnfpDukaZNf+S+10cRbevMj
 0vXV9cG5zQYzPKeN1Hhny5npPhzADjIXHMtWGoAY=
Received: by mx.zohomail.com with SMTPS id 1759289319057868.3710780313959;
 Tue, 30 Sep 2025 20:28:39 -0700 (PDT)
Message-ID: <7ca14fc0-c58c-4e32-9fb1-c7bdac58b835@collabora.com>
Date: Wed, 1 Oct 2025 06:28:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Virtio-GPU S4 support
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <2bbe0b9a-b0bb-4dbc-901e-1162791eb437@collabora.com>
 <PH0PR11MB51120592EE7474A289D98970FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
 <PH0PR11MB51124DBAAC54C2AFAA94B5E4FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH0PR11MB51124DBAAC54C2AFAA94B5E4FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 10/1/25 06:11, Kim, Dongwon wrote:
> Dmitry,
> 
> I had an assumption that you are using -machine q35 already but
> If not, you will need this too for enabling PCIE bus.
> 
>> -----Original Message-----
>> From: Kim, Dongwon
>> Sent: Tuesday, September 30, 2025 8:09 PM
>> To: 'Dmitry Osipenko' <dmitry.osipenko@collabora.com>; dri-
>> devel@lists.freedesktop.org
>> Subject: RE: [PATCH v4 0/3] Virtio-GPU S4 support
>>
>> Hi Dmitry,
>>
>>> Subject: Re: [PATCH v4 0/3] Virtio-GPU S4 support
>>>
>>> On 9/24/25 22:47, dongwon.kim@intel.com wrote:
>>>> From: Dongwon Kim <dongwon.kim@intel.com>
>>>>
>>>> This patch series introduces support for handling hibernation (S4)
>>>> in the virtio-gpu driver by implementing .freeze and .restore hooks,
>>>> along with a PM notifier to restore GPU resources upon resume.
>>>>
>>>> Patch 1 adds virtgpu_freeze and virtgpu_restore functions, which
>>>> manage virtio queue teardown before suspend/hibernation and
>>>> reinitialization during resume.
>>>>
>>>> Patch 2 implements a mechanism to track and restore
>>>> virtio_gpu_object instances, addressing the issue where QEMU
>>>> discards resources during virtio-gpu-reset triggered by hibernation.
>>>>
>>>> Patch 3 adds a PM notifier that triggers resubmission of GPU objects
>>>> to QEMU when the guest resumes from hibernation.
>>>>
>>>> These changes ensure that the virtio-gpu driver can reliably restore
>>>> virtio-gpu resources after hibernation, preventing resource loss
>>>> that leads to system's instability.
>>>>
>>>> v2: 10ms sleep is added in virtgpu_freeze to avoid the situation
>>>>     the driver is locked up during resumption.
>>>>
>>>> v3: Plain 10ms delay (v2) is replaced with wait calls which wait until
>>>>     the virtio queue is empty.
>>>>     (Dmitry Osipenko)
>>>>
>>>> v4: New version of patchset only covers S4 case because loss of resources
>>>>     in S3 case can be avoided by skipping virtio-gpu-reset in QEMU
>>>>     (hw/display/virtio-gpu.c). For this, virtio-gpu-pci device should be
>>>>     attached to PCIE bus AND a PCIE option, 'x-pcie-pm-no-soft-reset'
>> needs
>>>>     to be enabled when launching QEMU
>>>>     (e.g. -device
>>>> virtio-gpu-pci,bus=port,x-pcie-pm-no-soft-reset=true)
>>>>
>>>> Dongwon Kim (3):
>>>>   drm/virtio: Freeze and restore hooks to support suspend and resume
>>>>   drm/virtio: Add support for saving and restoring virtio_gpu_objects
>>>>   drm/virtio: Restore Virt-GPU res on hibernation resume via PM
>>>> notifier
>>>>
>>>>  drivers/gpu/drm/virtio/virtgpu_drv.c    | 60 ++++++++++++++++++++-
>>>>  drivers/gpu/drm/virtio/virtgpu_drv.h    | 13 +++++
>>>>  drivers/gpu/drm/virtio/virtgpu_kms.c    | 49 ++++++++++++++---
>>>>  drivers/gpu/drm/virtio/virtgpu_object.c | 71
>>>> +++++++++++++++++++++++++
>>>>  4 files changed, 186 insertions(+), 7 deletions(-)
>>>>
>>>
>>> Hi,
>>>
>>> Hibernation works well for me with v4, going to apply patches soon.
>>>
>>> Re `x-pcie-pm-no-soft-reset=true`, apparently it's not enough to have it for
>> S3.
>>> I'm still seeing virtio-gpu being reset with S3 and this reset comes
>>> from a guest kernel writing PCI reg, resetting PCI device on kernel
>>> resume. Will look further into it.
>>
>> [Kim, Dongwon] That option only works when you set up virtio-gpu as a PCIE
>> device.
>> I am wondering if you set up your PCIE bus. This are params I added for it.
>> -device pcie-root-port,id=root_port1,bus=pcie.0 \ -device virtio-
>> vga,bus=root_port1,x-pcie-pm-no-soft-reset=true \

Indeed, adding PCIE bus makes it work. There is no reset in S3 and virgl
continues to work after resume. Thanks a lot for the clarification.

Though, adding hostmem to virtio-vga-gl, needed for venus and native
contexts, doesn't work with a PCIE bus - VM hangs on boot. Perhaps more
config options needed.

-- 
Best regards,
Dmitry
