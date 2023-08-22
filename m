Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49623783807
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 04:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7186010E2C6;
	Tue, 22 Aug 2023 02:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A59910E2C6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 02:37:59 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxXOqFH+RkNccaAA--.27583S3;
 Tue, 22 Aug 2023 10:37:57 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxX8+EH+RkBPhfAA--.37065S3; 
 Tue, 22 Aug 2023 10:37:56 +0800 (CST)
Message-ID: <79c3b66a-61b0-aafb-0935-975b0ce1ecb3@loongson.cn>
Date: Tue, 22 Aug 2023 10:37:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20230821173819.GA362570@bhelgaas>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230821173819.GA362570@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxX8+EH+RkBPhfAA--.37065S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFy8Cr13Cw1rGw17Gw4rJFc_yoW5WF4xpr
 WrJFs5KF4kJr4Syrs7Gw1kXF1Fyw4rXas0kFn0vwn8A345urnaqFW0yrZ09FnrWrs7J3W2
 vF4Fg34rWFWYvagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uuWJUUUUU==
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
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-riscv@lists.infradead.org, Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/8/22 01:38, Bjorn Helgaas wrote:
> On Fri, Aug 18, 2023 at 12:09:29PM +0800, suijingfeng wrote:
>> On 2023/8/18 06:08, Bjorn Helgaas wrote:
>>> On Wed, Aug 16, 2023 at 06:05:27AM +0800, Sui Jingfeng wrote:
>>>> Currently, the vga_is_firmware_default() function only works on x86 and
>>>> ia64, it is a no-op on ARM, ARM64, PPC, RISC-V, etc. This patch completes
>>>> the implementation for the rest of the architectures. The added code tries
>>>> to identify the PCI(e) VGA device that owns the firmware framebuffer
>>>> before PCI resource reallocation happens.
>>> As far as I can tell, this is basically identical to the existing
>>> vga_is_firmware_default(), except that this patch funs that code as a
>>> header fixup, so it happens before any PCI BAR reallocations happen.
>> Yes, what you said is right in overall.
>> But I think I should mention a few tiny points that make a difference.
>>
>> 1) My version is *less arch-dependent*
> Of course.  If we make the patch simple and the commit log simple by
> removing extraneous details, this will all be obvious.
>
>> 2) My version focus on the address in ranges, weaken the size parameter.
>>
>> Which make the code easy to read and follow the canonical convention to
>> express the address range. while the vga_is_firmware_default() is not.
> Whether it's start/size or start/end is a trivial question.  We don't
> need to waste time on it now.
>
>> 3) A tiny change make a big difference.
>>
>> The original vga_is_firmware_default() only works with the assumption
>> that the PCI resource reallocation won't happens. While I see no clue
>> that why this is true even on X86 and IA64. The original patch[1] not
>> mention this assumption explicitly.
>> [1] 86fd887b7fe3 ('vgaarb: Don't default exclusively to first video device with mem+io')
>>
>>> That sounds like a good idea, because this is all based on the
>>> framebuffer in screen_info, and screen_info was initialized before PCI
>>> enumeration, and it certainly doesn't account for any BAR changes done
>>> by the PCI core.
>> Yes.
>>
>>> So why would we keep vga_is_firmware_default() at all?  If the header
>>> fixup has already identified the firmware framebuffer, it seems
>>> pointless to look again later.
>> It need another patch to do the cleanup work, while my patch just
>> add code to solve the real problem.  It focus on provide a solution
>> for the architectures which have a decent way set up the
>> screen_info.  Other things except that is secondary.
> I don't want both mechanisms when only one of them is useful.  PCI BAR
> reassignment is completely fine, and keeping the assumption in
> vga_is_firmware_default() that we can compare reassigned BAR values to
> the pre-reassignment screen_info range is a trap that we should
> remove.


OK,it's clear now.  I know what to do next.
Thanks.


> Bjorn

