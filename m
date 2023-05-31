Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4038A717C60
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 11:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554C710E194;
	Wed, 31 May 2023 09:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83EC910E194
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 09:48:32 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxY_DuF3dkP+wCAA--.6312S3;
 Wed, 31 May 2023 17:48:30 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxKL3tF3dk3y+CAA--.15015S3; 
 Wed, 31 May 2023 17:48:29 +0800 (CST)
Message-ID: <7b09da4e-1fe7-4610-6fc4-3fc39b81d55e@loongson.cn>
Date: Wed, 31 May 2023 17:48:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pci/vgaarb: make vga_is_firmware_default() arch
 independent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <ZHZZ1qETtCOlmkXU@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <ZHZZ1qETtCOlmkXU@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxKL3tF3dk3y+CAA--.15015S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WFyrtw45Zw17Kw18Xr4fXwb_yoW3WF4kp3
 yrKa13Gr4kGF1FkrW2vF1UurWY9a9Yya98Jr1ftw18CFZ8Cr10qF93tw4Yg347JrZ7Xw4a
 vF1UKw18tF1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bIkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
 kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWxJVW8Jr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
 xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
 GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
 8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
 MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcV
 C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07Uimi_UUUUU=
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
Cc: Qian Dongyan <qiandongyan@loongson.cn>, Li Chao <lichao@loongson.cn>,
 Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

CCing loogson EFI co-workers:


On 2023/5/31 04:17, Bjorn Helgaas wrote:
> On Mon, May 29, 2023 at 11:45:04PM +0800, Sui Jingfeng wrote:
>> The vga_is_firmware_default() function will work on non-x86 architectures
>> as long as the arch has UEFI GOP support, which passes the firmware
>> framebuffer base address and size.
>>
>> This patch makes the vga_is_firmware_default() function arch-independent.
>> This could help the VGAARB subsystem make the right choice for multiple
>> GPU systems. Usually an integrated one and a discrete one for desktop
>> computers. Depending on the firmware framebuffer being put into which
>> GPU's VRAM, VGAARB could inherit the firmware's choice, which in turn,
>> is the exact choice of the user.
> Is there a system that needs this change?  If so, the commit log
> should mention it.

We omit the architectures-specific//deliberately in the commit message.

When I create this patch, I'm also wondering whether we should enumerate 
the usage cases.

But as far as I can see it, vgaarb is more about the PCI peripherals.

It's more about the video adapter, firmware framebuffer, etc.

It seems that there is no good reason why this function should be

monopolized by X86 and IA64.


Loongson LoongArch is one of the architectures with EFIFB support, which

could utilize this function to implement something fun.

But it's OK, we could improve the commit message in the next version of 
this patch.

> It's definitely nice to remove #ifdefs, but it's better if we have an
> actual reason and some testing of another arch that makes use of this.

As far as I know, Arm and Arm64 also have EFIFB support.

while this patch is not relevant to firmware (efi, uboot, pmon, etc.).

It is only relevant to the global screen_info.

As long as the firmware passes screen_info to the kernel.

On one of my LoongArch machines with AMDGPU mounted,

The UEFI firmware puts its firmware framebuffer at the amdgpu's vram BAR.

With this patch applied, it works as expected. see below:


AMD RX550:


[    0.358155] pci 0000:03:00.0: BAR 0: assigned [mem 
0xe0020000000-0xe002fffffff 64bit pref]
[    0.358165] pci 0000:03:00.0: BAR 2: assigned [mem 
0xe0030000000-0xe00301fffff 64bit pref]
[    0.358175] pci 0000:03:00.0: BAR 5: assigned [mem 
0xe0039200000-0xe003923ffff]
[    0.358180] pci 0000:03:00.0: BAR 6: assigned [mem 
0xe0039240000-0xe003925ffff pref]
[    0.358182] pci 0000:03:00.1: BAR 0: assigned [mem 
0xe0039260000-0xe0039263fff 64bit]
[    0.358192] pci 0000:03:00.0: BAR 4: assigned [io 0x5000-0x50ff]


Loongson integrated graphics:

[    0.355740] pci 0000:00:06.0: [0014:7a15] type 00 class 0x040000
[    0.355747] pci 0000:00:06.0: reg 0x10: [mem 
0xe0035300000-0xe003533ffff 64bit]
[    0.355753] pci 0000:00:06.0: reg 0x18: [mem 
0xe00353c6000-0xe00353c6fff 64bit]
[    0.355758] pci 0000:00:06.0: reg 0x20: [mem 
0xe0035360000-0xe003536ffff 64bit]
[    0.355797] pci 0000:00:06.1: [0014:7a06] type 00 class 0x030000
[    0.355805] pci 0000:00:06.1: reg 0x10: [mem 
0xe0035370000-0xe003537ffff 64bit]


VGAARB:


[    0.362180] pci 0000:00:06.1: vgaarb: base: 0xe0020000000 size: 0xf3c00
[    0.362184] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.362186] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.362188] pci 0000:00:06.1: vgaarb: VGA device added: 
decodes=io+mem,owns=io+mem,locks=none

[    0.362199] pci 0000:03:00.0: vgaarb: base: 0xe0020000000 size: 0xf3c00
[    0.362202] pci 0000:03:00.0: vgaarb: is firmware default
[    0.362204] pci 0000:03:00.0: vgaarb: setting as boot VGA device 
(overriding previous)
[    0.362206] pci 0000:03:00.0: vgaarb: bridge control possible
[    0.362208] pci 0000:03:00.0: vgaarb: VGA device added: 
decodes=io+mem,owns=none,locks=none
[    0.362211] vgaarb: loaded
[   16.758480] loongson 0000:00:06.1: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=io+mem

[   16.768075] amdgpu 0000:03:00.0: vgaarb: changed VGA decodes: 
olddecodes=io+mem,decodes=none:owns=none


The above log is extracted from the dmesg log;

This log can prove that the discrete GPU finally overrides the 
integrated one.

In this case, the discrete GPU will be the default boot device.

This meets normal users' expectations.


But what if we want to use the integrated one as the default boot device 
and have it opened by the X server as the primary GPU by default?

Without opening the computer's machine box, unmount the discrete GPU 
every time.

On a multi-GPU system, this function gives us a chance to mandate which 
card to use by default.

There is no need to invent a complex parameter-passing strategy between 
the firmware and the kernel.

The UEFI firmware could simply place the firmware framebuffer at the 
desired GPU's vram bar.

vgaarb could decode the user's setting by comparing address ranges.

But still, this is more about PCI peripherals and/or firmware framebuffers.

An arch that can't use this machinism should jump in here and explain 
why their arch can't support it. Am I right?

This is also the reason I'm CCing my co-workers who make the Loongson 
UEFI firmware,

There are early-stage UEFI firmwares for Loongson machines released,

which either put the EFIFB in the wrong bar or don't have UEFI GOP 
support at all.

Which causes the kernel space (GPU/DC) device driver to have to pay for it.

no more please. I hope they can do the right thing.

> Also, take a look at the git history and match the subject line and
> commit log style (prefix, capitalization, imperative voice).

Ok, nice comments.

I'm not native English speaker, sometimes I can't sense the subtle 
differences of similar word.

But I will improve it at next version, please give more tolerance, thanks.

>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/pci/vgaarb.c | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 5a696078b382..f81b6c54e327 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -61,7 +61,6 @@ static bool vga_arbiter_used;
>>   static DEFINE_SPINLOCK(vga_lock);
>>   static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>>   
>> -
>>   static const char *vga_iostate_to_str(unsigned int iostate)
>>   {
>>   	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
>> @@ -545,7 +544,6 @@ EXPORT_SYMBOL(vga_put);
>>   
>>   static bool vga_is_firmware_default(struct pci_dev *pdev)
>>   {
>> -#if defined(CONFIG_X86) || defined(CONFIG_IA64)
>>   	u64 base = screen_info.lfb_base;
>>   	u64 size = screen_info.lfb_size;
>>   	struct resource *r;
>> @@ -571,7 +569,7 @@ static bool vga_is_firmware_default(struct pci_dev *pdev)
>>   
>>   		return true;
>>   	}
>> -#endif
>> +
>>   	return false;
>>   }
>>   
>> @@ -865,8 +863,7 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
>>   }
>>   
>>   /* this is called with the lock */
>> -static inline void vga_update_device_decodes(struct vga_device *vgadev,
>> -					     int new_decodes)
>> +static void vga_update_device_decodes(struct vga_device *vgadev, int new_decodes)
> I don't mind removing the "inline" here, but it shouldn't be combined
> with the rest of the patch.  When it's combined, I can't tell whether
> there's a reason we need this change or if it's just a cleanup.

Previously,  make a single patch is for convenient.

OK, I split it into two patch at the next version.

>>   {
>>   	struct device *dev = &vgadev->pdev->dev;
>>   	int old_decodes, decodes_removed, decodes_unlocked;
>> -- 
>> 2.25.1
>>
-- 
Jingfeng

