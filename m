Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984217809E3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 12:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73A10E4B2;
	Fri, 18 Aug 2023 10:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F43D10E4B2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 10:20:46 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxPOv8Rd9kKtgZAA--.47958S3;
 Fri, 18 Aug 2023 18:20:44 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxHCP8Rd9kYIpdAA--.13478S3; 
 Fri, 18 Aug 2023 18:20:44 +0800 (CST)
Message-ID: <fb242a7e-b1ee-7be0-cbc4-be710e246279@loongson.cn>
Date: Fri, 18 Aug 2023 18:20:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230817220853.GA328159@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8BxHCP8Rd9kYIpdAA--.13478S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWrGr4fCF15Jr4DCF1xZwc_yoW5XryfpF
 yfua93tF4kWrs8KanFvw18WF47urZ7Aa9xArnxJry0kr43W34FgrZIkr4Yya47JFsaqFyS
 va9Fq348t3WDAagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
 67AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
 8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
 CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBI
 daVFxhVjvjDU0xZFpf9x07jOF4_UUUUU=
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/18 06:08, Bjorn Helgaas wrote:
>> Please note that before apply this patch, vgaarb can not select the
>> right boot vga due to weird logic introduced with the commit
>> 57fc7323a8e7c ("LoongArch: Add PCI controller support")
> If we need this reference to 57fc7323a8e7c, we need more specifics
> about what the "weird logic" is.  pci_fixup_vgadev() is the only
> obvious VGA connection, so I suppose it's related to that.
>
Yes, you are right.

The pci_fixup_vgadev() function will set the last VGA device enumerated as the default boot device.
By "the last" VGA device, I mean that this device has the largest PCI bus, domain, and function triple.
Thus, it is added to vgaarb in the end of all VGA device.
So that logic expresses that the last one added will be the default.
This probably is not what we want.


On the LS3A5000+LS7A1000 platform, the last VGA device is a S3 graphics 
(08:00.0). This GPU has two cores. Say the log below:


$ lspci | grep VGA

  00:06.1 VGA compatible controller: Loongson Technology LLC DC (Display Controller) (rev 01)
  03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Caicos XT [Radeon HD 7470/8470 / R5 235/310 OEM]
  07:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)
  08:00.0 VGA compatible controller: S3 Graphics Ltd. Device 9070 (rev 01)

[    0.361781] vgaarb: loaded
[    0.367838] pci 0000:00:06.1: Overriding boot device as 1002:6778
[    0.367841] pci 0000:00:06.1: Overriding boot device as 5333:9070
[    0.367843] pci 0000:00:06.1: Overriding boot device as 5333:9070

1) The "weird" logic completely overrides whatever decision VGAARB ever made.

It seems to say that the decision ever made by VGAARB is useless.
Well, I think VGAARB shouldn't endure this; VGAARB has to be small.

  

2) The results it gives are not correct either.

In the first testing example in my commit message,
it overrides the S3 graphics as the default boot VGA instead of the AMD/ATI GPU.
Actually, the firmware chooses the AMD/ATI GPU as the "frimware default".

  

3) It tries to make the decision for the end user instead of the firmware.

Therefore, that function is always wrong. Again, it's a policy, not a mechanism.


Since that already have been merge, I'm fine.
Maybe Huacai is busy, he might don't has the time to carry on a deep thinking.
But I think we should correct the mistake ever made,
let's merge this patch to make vgaarb great again ?


Well, that commit is not a dependency, I don't mind delete the referencing
to that commit. After all, I think my patch will be effective on other architectures.
Is additional testing on ARM64 and X86 is needed, if so I have to find the machine to
carry on the testing.

