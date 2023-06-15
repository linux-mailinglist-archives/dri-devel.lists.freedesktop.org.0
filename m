Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55A730FDD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 08:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA3D10E485;
	Thu, 15 Jun 2023 06:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3524910E11A;
 Thu, 15 Jun 2023 06:51:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx7eoGtYpkb3YFAA--.11707S3;
 Thu, 15 Jun 2023 14:51:50 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxhuQFtYpkQKEbAA--.13222S3; 
 Thu, 15 Jun 2023 14:51:49 +0800 (CST)
Message-ID: <1b5e3b60-28dc-60f1-b963-2eab2c787244@loongson.cn>
Date: Thu, 15 Jun 2023 14:51:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 7/8] drm/amdgpu: Implement the is_boot_device callback
 function
To: Sui Jingfeng <15330273260@189.cn>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-8-15330273260@189.cn>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230613030151.216625-8-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhuQFtYpkQKEbAA--.13222S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxArWUWw17ZFWDCrWDuF4rJFc_yoWrurW5pw
 48Ga13Wr48Jr1Skryj9Fn8GF1Y9F95AayDArn7tw18Cr47Ka10qF9Iqa1Yg3ZxAr4IvrnI
 qrn2y340y34DZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
 AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 XVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
 8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vI
 r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU43xhDU
 UUU
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
Cc: Mario Limonciello <mario.limonciello@amd.com>, linux-fbdev@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Pan Xinhui <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 YiPeng Chai <YiPeng.Chai@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Does anyone has the bandwidth to review this?

I provide more additional information here, hope it helps.


On a non-x86 multiple platform, the discrete AMDGPU fails to override 
the integrated one.

because the PCI BAR 0 of the AMDGPU gets moved.

Below is the log of 'dmesg | grep vgaarb'.

So relaying on screen_info is not always reliable.


[    0.361928] pci 0000:00:06.1: vgaarb: setting as boot VGA device
[    0.361932] pci 0000:00:06.1: vgaarb: bridge control possible
[    0.361933] pci 0000:00:06.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.361940] pci 0000:05:00.0: vgaarb: bridge control possible
[    0.361941] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    0.361943] vgaarb: loaded
[   11.352087] amdgpu 0000:05:00.0: vgaarb: Set as boot device (dictated by driver)
[   11.575505] loongson 0000:00:06.1: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
[   11.585100] amdgpu 0000:05:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none


dmesg | grep efifb:


[    0.356355] pci 0000:05:00.0: BAR 0: assigned to efifb
[    0.375793] efifb: probing for efifb
[    0.375795] pci 0000:05:00.0: BAR has moved, updating efifb address
[    0.375803] efifb: framebuffer at 0xe0030000000, using 976k, total 975k
[    0.375805] efifb: mode is 800x600x16, linelength=1664, pages=1
[    0.375806] efifb: scrolling: redraw
[    0.375808] efifb: Truecolor: size=0:5:6:5, shift=0:11:5:0


efifb can also prove that "BAR has been moved"


 From dmesg |  grep "pci 0000:05:00.0":


[    0.356286] pci 0000:05:00.0: [1002:699f] type 00 class 0x030000
[    0.356303] pci 0000:05:00.0: reg 0x10: [mem 
0xe0020000000-0xe002fffffff 64bit pref]
[    0.356315] pci 0000:05:00.0: reg 0x18: [mem 
0xe0030000000-0xe00301fffff 64bit pref]
[    0.356323] pci 0000:05:00.0: reg 0x20: [io  0x40000-0x400ff]
[    0.356331] pci 0000:05:00.0: reg 0x24: [mem 0xe0053100000-0xe005313ffff]
[    0.356339] pci 0000:05:00.0: reg 0x30: [mem 0xfffe0000-0xffffffff pref]
[    0.356346] pci 0000:05:00.0: enabling Extended Tags
[    0.356355] pci 0000:05:00.0: BAR 0: assigned to efifb
[    0.356421] pci 0000:05:00.0: supports D1 D2
[    0.356422] pci 0000:05:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.356858] pci 0000:05:00.0: BAR 0: assigned [mem 
0xe0030000000-0xe003fffffff 64bit pref]
[    0.356866] pci 0000:05:00.0: BAR 2: assigned [mem 
0xe0040000000-0xe00401fffff 64bit pref]
[    0.356875] pci 0000:05:00.0: BAR 5: assigned [mem 
0xe0049000000-0xe004903ffff]
[    0.356878] pci 0000:05:00.0: BAR 6: assigned [mem 
0xe0049040000-0xe004905ffff pref]
[    0.356889] pci 0000:05:00.0: BAR 4: assigned [io 0x4000-0x40ff]
[    0.361940] pci 0000:05:00.0: vgaarb: bridge control possible
[    0.361941] pci 0000:05:00.0: vgaarb: VGA device added: 
decodes=io+mem,owns=none,locks=none
[    0.375795] pci 0000:05:00.0: BAR has moved, updating efifb address

We can see that the Bar 0 of AMDGPU

moved from '0xe0020000000-0xe002fffffff'  to '0xe0030000000-0xe003fffffff'

while the fb location information recorded by the screen_info still 
belong to '0xe0020000000-0xe002fffffff'


I suspect this is also the reason that video/aperture don't relay on the 
information provided by screen_info

in the contrast, it require the firmware framebuffer driver(efifb) to call

devm_aperture_acquire_from_firmware() function, only in this way 
video/aperture

could record the correct information about the aperture being used the 
by the firmware framebuffe.


While vgaarb is loaded too early, even before efifb.

so that we can only relay on the pci_notifier call back to us.


On 2023/6/13 11:01, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> [why]
>
> The vga_is_firmware_default() defined in drivers/pci/vgaarb.c is
> arch-dependent, it's a dummy on non-x86 architectures currently.
> This made VGAARB lost an important condition for the arbitration.
> It could still be wrong even if we remove the #ifdef and #endif guards.
> because the PCI bar will move (resource re-allocation).
>
> [how]
>
> The device that owns the firmware framebuffer should be the default boot
> device. This patch adds an arch-independent function to enforce this rule

-- 
Jingfeng

