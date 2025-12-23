Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0066CCDBF79
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 11:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122E610EA74;
	Wed, 24 Dec 2025 10:22:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 455 seconds by postgrey-1.36 at gabe;
 Tue, 23 Dec 2025 15:39:38 UTC
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3343A10E14C;
 Tue, 23 Dec 2025 15:39:38 +0000 (UTC)
Received: from [192.168.0.114] (unknown [114.241.82.59])
 by APP-03 (Coremail) with SMTP id rQCowABnhdzstUppR2S4AQ--.711S2;
 Tue, 23 Dec 2025 23:31:57 +0800 (CST)
Message-ID: <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
Date: Tue, 23 Dec 2025 23:31:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
 <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
 <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnhdzstUppR2S4AQ--.711S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1ftFyUZF18KFWDCw1UAwb_yoW8urWkpa
 y5CFWagrn7tr47K39rZa1xXF1fZw4IgayrXFn0kryfC3y5Ar17KFW7Ar4ak3W8Xr1vkr4I
 v34Ig34xuFn0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
 1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Mailman-Approved-At: Wed, 24 Dec 2025 10:21:59 +0000
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

Hi Christian,

I have a question about this 40-bit restriction.

On 12/23/25 22:55, Christian König wrote:
> On 12/22/25 22:32, Arnd Bergmann wrote:
>> On Sat, Dec 20, 2025, at 17:33, Han Gao wrote:
>> [...]
>>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c 
>>> b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> index 9961251b44ba..62eb5a6968ff 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>>> @@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device 
>>> *rdev)
>>>  	 * of address for "64-bit" MSIs which breaks on some platforms, 
>>> notably
>>>  	 * IBM POWER servers, so we limit them
>>>  	 */
>>> -	if (rdev->family < CHIP_BONAIRE) {
>>> +	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
>>>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>>>  		rdev->pdev->no_64bit_msi = 1;
>> According to the comment above it, the device can apparently
>> do 40-bit addressing but not use the entire 64-bit space.
>>
>> I assume the SG2042 chip has the irqchip somewhere above the
>> 32-bit line but below the 40-bit line, so it ends up working.
>>
>> I wonder if the msi_verify_entries() function should check
>> against dev->coherent_dma_mask instead of checking the
>> upper 32 bits for being nonzero, that probably gives you
>> the desired behavior.
> Again completely agree, that sounds like a plan to me.
>
> IIRC the modified code here is basically just a workaround because the MSI control dword on older radeon HW was not setup correctly.

Does this mean that on Bonaire and onwards, MSI can reach full 64-bit
space, while DMA still only does 40-bit?
(drivers/gpu/drm/radeon/radeon_device.c sets DMA mask to at most 40 bits.)

If so, checking coherent_dma_mask would be wrong for those devices.

Do you think maybe it would be safer to introduce a msi_addr_mask for
occasions like these? We can have msi_addr_mask = DMA_BIT_MASK(40) for
pre-Bonaire, and then the ppc PCI stuff can check the mask and see if
it's usable. Probably something similar for hda.

Vivian "dramforever" Wang

