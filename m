Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAD7816C0
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 04:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C9A10E57D;
	Sat, 19 Aug 2023 02:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4284410E581
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 02:40:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Ax1fCdK+Bkcg0aAA--.53312S3;
 Sat, 19 Aug 2023 10:40:29 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax8uScK+BksBReAA--.33767S3; 
 Sat, 19 Aug 2023 10:40:29 +0800 (CST)
Message-ID: <ed87b8de-9fb6-fbee-2c6d-cebf712ccda5@loongson.cn>
Date: Sat, 19 Aug 2023 10:40:28 +0800
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
X-CM-TRANSID: AQAAf8Ax8uScK+BksBReAA--.33767S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr48uw4xGw17Zr43Xry3WrX_yoW8CF48pr
 4YganrGF4kG3Z7A3sxAws5XF45uayvyFZ8Gry5Ar18ur45Gr1aqrnrKrZ0gwnrCrnxt3WS
 krn8Kr4IkFyDZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
 xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
 xVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
 IF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
 xhVjvjDU0xZFpf9x07jnUUUUUUUU=
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
> I guess the point here is that:
>
>    - 03:00.0 BAR 0 is [mem 0xe0050000000-0xe005fffffff]
>
>    - screen_info says the framebuffer is
>      [mem 0xe0050000000-0xe005fffffff] (or part of it)
>
>    - Therefore, we want 03:00.0 to be the default VGA
>
>    - PCI core reassigns 03:00.0 BAR 0 to
>      [mem 0xe0030000000-0xe003fffffff]
>
>    - PCI core assigns a 00:06.1 BAR to contain
>      [mem 0xe0050000000-0xe005fffffff]
>
>    - vga_is_firmware_default() incorrectly decides 00:06.1 should be
>      the default VGA because it has a BAR that contains the screen_info
>      address range
>
> Is that right?

Yes, The 00:06.1 is loongson integrated display controller, integrated in LS7A1000 North bridge.


On loongarch, before apply apply any patch, VGAARB always select 00:06.1 as the default boot device.
because it is enumerated first. It is always the first VGA compatible device found on our system.
Because its PCI domain, bus, function number is smallest. And it own IO and MEM, so the 00:06.1 will
always be selected as the default boot device. Even you plug a discrete GPU on the mother board.


Therefore we need help the vga_is_firmware_default() to overriding previous.
On a multiple GPU co-exist case (on loongson platform), if no "overriding previous" being printed.
then there something wrong. On normal case, we need the discrete GPU overriding the integrated one.
Because the discrete GPU is more powerful than the platform integrated.

But what we want is let the VGAARB determine the primary GPU by referencing the firmware.

If firmware put the firmware framebuffer in the VRAM of the integrated display card(00:06.1).
then the integrated display card should be the primary GPU.

If firmware put the firmware framebuffer in the VRAM of the discrete display card,
then the discrete display card should be the primary GPU.

