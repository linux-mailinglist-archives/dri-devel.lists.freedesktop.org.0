Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3175DAFA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jul 2023 10:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108910E04C;
	Sat, 22 Jul 2023 08:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 38E7710E04C
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jul 2023 08:11:13 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx5fAej7tk9y4IAA--.21051S3;
 Sat, 22 Jul 2023 16:11:10 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX88bj7tkOYg2AA--.18356S3; 
 Sat, 22 Jul 2023 16:11:08 +0800 (CST)
Message-ID: <ee44ec4e-df97-c327-b83b-fe56eb2c120b@loongson.cn>
Date: Sat, 22 Jul 2023 16:11:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <sui.jingfeng@linux.dev>
References: <20230719182617.GA509912@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230719182617.GA509912@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxX88bj7tkOYg2AA--.18356S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxCr4xCry3try8ZF4kKry5KFX_yoW5Xr1rpa
 y0kFW5KFyvgFy0kw1xuFW8WFyrKr47JFy3AFyYg34Uu3yDXasI9rZYgrWqga4kCrs7Jr4I
 qFsFqr18uFyDArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWU
 twAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
 k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l
 4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/7/20 02:26, Bjorn Helgaas wrote:
> Optimization is fine, but the most important thing here is to be clear
> about what functional change this patch makes.  As I mentioned at [1],
> if this patch affects the class codes accepted, please make that clear
> here.
>
>> Reviewed-by: Mario Limonciello<mario.limonciello@amd.com>
>> Signed-off-by: Sui Jingfeng<suijingfeng@loongson.cn>
> I do not see Mario's Reviewed-by on the list.  I do see Mario's
> Reviewed-by [2] for a previous version, but that version added this in
> pci_notify():
>
>    + if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
>    +   return 0;
>
> while this version adds:
>
>    + if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>    +   return 0;
>
> It's OK to carry a review to future versions if there are
> insignificant changes, but this is a functional change that seems
> significant to me.  The first matches only 0x030000, while the second
> discards the low eight bits so it matches 0x0300XX.
>
> [1]https://lore.kernel.org/r/20230718231400.GA496927@bhelgaas
> [2]https://lore.kernel.org/all/5b6fdf65-b354-94a9-f883-be820157efad@amd.com/
>
Yes,  you are right. As you already told me at [1]:


According to the "PCI Code and ID Assignment" spec, r1.15, sec 1.4,

only mentions 0x0300 programming interface 0x00 as decoding

the legacy VGA addresses.


If the programming interface is 0x01, then it is a 8514-compatible 
controller.

It is petty old card,  about 30 years old(I think, it is nearly obsolete 
for now).

I never have a chance to see such a card in real life.


Yes, we should adopt first matches method here. That is:

   + if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
   +   return 0;

It seems that we are more rigorous to deal the VGA-compatible devices as 
illustrated by above code here.

But who the still have that card (8514-compatible) and the hardware to 
using such a card today ?


Please consider that the pci_dev_attrs_are_visible() function[3] also 
ignore the

programming interface (the least significant 8 bits).

Therefore, at this version of my vgaarb cleanup patch set.

I choose to keep the original filtering rule,

but do the necessary optimization only which I think is meaningful.


In the future, we may want to expand VGAARB to deal all PCI display 
class devices, with another patch.

  
if (pdev->class >> 16 == PCI_BASE_CLASS_DISPLAY)

          // accept

else

       // return immediately.


Then, we will have a more good chance to clarify the programmer interface.

Is this explanation feasible and reasonable, Bjorn and Mario ?


[3] 
https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-sysfs.c#L1551


