Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC878374E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 03:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA27010E2BE;
	Tue, 22 Aug 2023 01:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A810E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 01:19:45 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxVugvDeRkfMIaAA--.19188S3;
 Tue, 22 Aug 2023 09:19:43 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxvM4gDeRkSe1fAA--.37428S3; 
 Tue, 22 Aug 2023 09:19:43 +0800 (CST)
Message-ID: <bc1e31ca-eb54-9696-792c-9749c0582167@loongson.cn>
Date: Tue, 22 Aug 2023 09:19:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230821173320.GA362442@bhelgaas>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230821173320.GA362442@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxvM4gDeRkSe1fAA--.37428S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1xAw1ruFy8ury3uFWfWFX_yoW8CFWxpa
 yfWFn8Cr4DAwnrArn2v3W8XF9avayrXrWUGrs8tr1rAF98uryF9r1rJw15Cwn3Z39rJa1j
 vrs8Jw1kGrs0qagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
 4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUU
 UUU==
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
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/8/22 01:33, Bjorn Helgaas wrote:
> On Fri, Aug 18, 2023 at 09:48:46AM +0800, suijingfeng wrote:
>> On 2023/8/18 06:08, Bjorn Helgaas wrote:
>>>> +		if (resource_type(res) != IORESOURCE_MEM)
>>>> +			continue;
>>>> +
>>>> +		if (!res->start || !res->end)
>>>> +			continue;
>>>> +
>>>> +		if (res->start <= fb_start && fb_end <= res->end) {
>>>> +			pdev_boot_vga = pdev;
>>>> +
>>>> +			vgaarb_info(&pdev->dev,
>>>> +				    "BAR %d contains firmware FB\n", i);
>>> Print the BAR with %pR and include the framebuffer region from
>>> screen_info in the same format.
>> I do remember that you already told me to do this in V3, sorry for not
>> replying to you at V3. Most of the time, what you tell me is right.But here,
>> I think I need to explain. Because doing it that way will make the code line
>> too long,and it will exceed 80 characters in the column if we print too
>> much.
>> I believe that the vgaarb_info() at here is already the most compact and
>> simplest form. Printing the BAR with %pR is not absolute necessary, because
>> we can get the additional information by: $ lspci | grep VGA
>>
>> $ dmesg | grep 05:00.0
>> $ dmesg | grep 0000:03:00.0
>> $ dmesg | grep PCI
> Fair enough.  The BAR info is already there.  But I don't think the
> screen_info framebuffer data is in the dmesg log anywhere, and I think
> that would be useful.
>
> It's fine if dmesg lines or kernel printk lines exceed 80 columns.
>
>> Actually, I only add something that is absolute necessary.
>> Printing BAR with %pR and/or Printing the framebuffer region
>> is consider to only for *debugging* purpose.
> I think printing the framebuffer region is important because it makes
> it clear *why* we're selecting the device as the default VGA device.
> It's more than just debugging; it helps make the system more
> transparent and more understandable.

OK, I'm clear what to do next.
The printing will be added at the next version.

> Bjorn

