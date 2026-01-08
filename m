Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7C1D023BD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984510E6EC;
	Thu,  8 Jan 2026 10:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB3F10E699;
 Thu,  8 Jan 2026 06:41:40 +0000 (UTC)
Received: from [192.168.0.105] (unknown [114.241.82.145])
 by APP-03 (Coremail) with SMTP id rQCowACXtt2SUV9pJAwYBA--.18933S2;
 Thu, 08 Jan 2026 14:41:23 +0800 (CST)
Message-ID: <8c16931b-8637-43c3-a2db-5c66d8865124@iscas.ac.cn>
Date: Thu, 8 Jan 2026 14:41:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/radeon: Raise msi_addr_mask to 40 bits for
 pre-Bonaire
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Brett Creeley <brett.creeley@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-3-05a6fcb4b4c0@iscas.ac.cn>
 <15ec03f3-f0cf-45f7-b7f6-98b075533d3e@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <15ec03f3-f0cf-45f7-b7f6-98b075533d3e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXtt2SUV9pJAwYBA--.18933S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5KrWUGFyUtw18Jr1rCrg_yoW8Cw4Upa
 y8Ga98KrZIy34jkay7u39rZF1Yya10kayrWrZrK343u34Yvry2gFZIv3WUJa4kXr1ktw4j
 vFyUG3W8ZFn5CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjTRNJ5oDUUUU
X-Originating-IP: [114.241.82.145]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Mailman-Approved-At: Thu, 08 Jan 2026 10:56:33 +0000
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

On 1/7/26 23:20, Christian König wrote:
> On 12/24/25 04:10, Vivian Wang wrote:
>> The code was originally written using no_64bit_msi, which restricts the
>> device to 32-bit MSI addresses.
>>
>> Since msi_addr_mask is introduced, use DMA_BIT_MASK(40) instead of
>> DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
>> precisely and allowing these devices to work on platforms with MSI
>> doorbell address above 32-bit space, as long as it is within the
>> hardware restriction of 40-bit space.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> index d550554a6f3f..ea519d43348b 100644
>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> @@ -251,8 +251,8 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>>  	 * IBM POWER servers, so we limit them
>>  	 */
>>  	if (rdev->family < CHIP_BONAIRE) {
>> -		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>> -		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>> +		dev_info(rdev->dev, "radeon: MSI limited to 40-bit\n");
>> +		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(40);
> Well, that is not even remotely correct.
>
> Please move that close to the dma_set_mask_and_coherent() call in radeon_device_init() (file radeon_device.c).
>
> The check there is most likely already what you need. Should be pretty straight forward.

Thanks. In that case, maybe this msi_addr_mask thing was overcomplicated
after all. Maybe coherent_dma_mask is just the right thing to check anyway.

I'll see if I can figure something out. Of course I need to keep the
logic for Power still working...

Vivian "dramforever" Wang

