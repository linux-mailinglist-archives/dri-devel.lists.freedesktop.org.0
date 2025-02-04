Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA659A2798F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3E210E37B;
	Tue,  4 Feb 2025 18:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uLYad3aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6510E079
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:15:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B9DB35C4D75;
 Tue,  4 Feb 2025 18:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C32C4CEDF;
 Tue,  4 Feb 2025 18:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738692904;
 bh=ypcqCxprScut0ydXE5KxVsZk5Nb4qkAKY7m4SvTj0Gc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uLYad3aBSlBFcJQHvvzOn8HA/FXnikgWa4YX0hJ49Ef/I0lmfLrXTvDk4QTVnx2Iz
 iVZsVHoEX/UgqsqH0HbHgcLvUH7++MvM1aC97ZdiJ0vXhWsryUImQFoeFtN2TWQ7GM
 HULAuasxBUmBqLKSzJaH7oLIjm1RmWLWJJ89qR2mBZSDhPz2WV50E08QZHDnrOKhRl
 W8sOaFkHBVK6q1PltnX9eXl4KrXBuXTfu8q1yNSsAzrC6aip8/boDXS85DH6swTMJt
 Mv1JWhPIoH+MfWmohDL44zPy8g286rz1h2Ie8eEAQcAA6yGcvxPn6rWsgPJw5tFbbM
 /2nFA37pzdAww==
Message-ID: <f99dc854-536c-4d89-9355-b457fbb0422f@kernel.org>
Date: Tue, 4 Feb 2025 12:15:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Add MODULE_FIRMWARE() declarations
To: Lizhi Hou <lizhi.hou@amd.com>, mario.limonciello@amd.com, min.ma@amd.com, 
 ogabbay@kernel.org
Cc: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20250204174031.3425762-1-superm1@kernel.org>
 <f26de849-0805-75fd-7234-3c2116be14f8@amd.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <f26de849-0805-75fd-7234-3c2116be14f8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 2/4/2025 11:46, Lizhi Hou wrote:
> 
> On 2/4/25 09:40, Mario Limonciello wrote:
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Initramfs building tools such as dracut will look for a MODULE_FIRMWARE()
>> declaration to determine which firmware to include in the initramfs
>> when a driver is included in the initramfs.
>>
>> As amdxdna doesn't declare any firmware this causes the driver to fail
>> to load with -ENOENT when in the initramfs.  Add the missing declaration
>> for possible firmware.
>>
>> Reported-by: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>
>> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/ 
>> amdxdna/amdxdna_pci_drv.c
>> index 97d4a032171f1..f5b8497cf5ad6 100644
>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>> @@ -21,6 +21,11 @@
>>   #define AMDXDNA_AUTOSUSPEND_DELAY    5000 /* milliseconds */
>> +MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>> +MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>> +MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
>> +MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>> +
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

Thanks.

I also forgot to add a Fixes tag.
I'll add this when adding to drm-misc-fixes.

Fixes: 8c9ff1b181ba3 ("accel/amdxdna: Add a new driver for AMD AI Engine")

>>   /*
>>    * Bind the driver base on (vendor_id, device_id) pair and later use 
>> the
>>    * (device_id, rev_id) pair as a key to select the devices. The 
>> devices with

