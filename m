Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E779738F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 17:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8EE10E809;
	Thu,  7 Sep 2023 15:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id C78EF10E7F8;
 Thu,  7 Sep 2023 15:27:20 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxh+jV6_lk2HwhAA--.31173S3;
 Thu, 07 Sep 2023 23:27:17 +0800 (CST)
Received: from [0.0.0.0] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxzyO_6_lkAtlwAA--.32479S3; 
 Thu, 07 Sep 2023 23:27:12 +0800 (CST)
Message-ID: <d3c38433-a23e-56b3-634a-9bb4c492245d@loongson.cn>
Date: Thu, 7 Sep 2023 23:26:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [Nouveau] [RFC, drm-misc-next v4 0/9] PCI/VGA: Allowing the user
 to select the primary video adapter at boot time
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <44ec8549-dc36-287e-4359-abd3ec8d22d6@suse.de>
 <5afd2efb-f838-f9b7-02a9-2cf4d4fd2382@loongson.cn>
 <2adfa653-ac35-d560-be52-c92848a1eef5@gmail.com>
 <b51d49f3-e3de-6b8d-9cb4-df5c03f3cdc0@loongson.cn>
 <10509692-ce04-e225-5a27-abc955554bdc@gmail.com>
 <a9af88c5-4509-96ff-a7fd-a0f72d2f1e6a@linux.dev>
 <127fab21-bc5c-f782-e42b-1092fbb8df34@amd.com>
 <5d9f9780-995f-33dc-e3db-3112aa085062@loongson.cn>
 <714d5ecf-f0dd-c099-0970-9ee765d35161@amd.com>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <714d5ecf-f0dd-c099-0970-9ee765d35161@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxzyO_6_lkAtlwAA--.32479S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3XFy5KFWUCFW7Gw4xXF47trc_yoWxKw48pF
 WfW39IgrW8ur48J34IvF1UWw4agF4rJF45AryFkwn0k3WUWFn0vwnagw4Iga4UArs7uF4j
 vry0q3yFyw1UCagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
 Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
 Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
 CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
 MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
 U==
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/7 20:43, Christian König wrote:
> Am 07.09.23 um 14:32 schrieb suijingfeng:
>> Hi,
>>
>>
>> On 2023/9/7 17:08, Christian König wrote:
>>> Well, I have over 25 years of experience with display hardware and 
>>> what you describe here was never an issue. 
>>
>> I want to give you an example to let you know more.
>>
>> I have a ASRock AD2550B-ITX board[1],
>> When another discrete video card is mounted into it mini PCIe slot or 
>> PCI slot,
>> The IGD cannot be the primary display adapter anymore. The display is 
>> totally black.
>> I have try to draft a few trivial patch to help fix this[2].
>>
>> And I want to use the IGD as primary, does this count as an issue?
>
> No, this is completely expected behavior and a limitation of the 
> hardware design.
>
> As far as I know both AMD and Intel GPUs work the same here.
>
> Regards,
> Christian.
>
>>
>> [1] https://www.asrock.com/mb/Intel/AD2550-ITX/
>> [2] https://patchwork.freedesktop.org/series/123073/
>>

Then, I'll give you another example, see below for elaborate description.
I have one AMD BC160 GPU, see[1] to get what it looks like.

The GPU don't has a display connector interface exported.
It actually can be seen as a render-only GPU or compute class GPU for bitcoin.
But the firmware of it still acclaim this GPU as VGA compatible.
When mount this GPU onto motherboard, the system always select this GPU as primary.
But this GPU can't be able to connect with a monitor.

Under such a situation, modprobe.blacklist=amdgpu don't works either,
because vgaarb always select this GPU as primary, this is a device-level decision.

$ dmesg | grep vgaarb:

[    3.541405] pci 0000:0c:00.0: vgaarb: BAR 0: [mem 0xa0000000-0xafffffff 64bit pref] contains firmware FB [0xa0000000-0xa02fffff]
[    3.901448] pci 0000:05:00.0: vgaarb: setting as boot VGA device
[    3.905375] pci 0000:05:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    3.905382] pci 0000:0c:00.0: vgaarb: setting as boot VGA device (overriding previous)
[    3.909375] pci 0000:0c:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    3.913375] pci 0000:0d:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
[    3.913377] vgaarb: loaded
[   13.513760] amdgpu 0000:0c:00.0: vgaarb: deactivate vga console
[   19.020992] amdgpu 0000:0c:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem

I'm using ubuntu 22.04 system, with ast.modeset=10 passed on the cmd line,
I still be able to enter the graphics system. And views this GPU as a render-only GPU.
Probably continue to examine what's wrong, except this, drm/amdgpu report
" *ERROR* IB test failed on sdma0 (-110)" to me.

Does this count as problem?

Before I could find solution, I have keep this de-fact render only GPU mounted.
Because I need recompile kennel module, install the kernel module and testing.

All I need is a 2D video card to display something, ast drm is OK, despite simple.
It suit the need for my daily usage with VIM, that's enough for me.

Now, the real questions that I want ask is:

1)

Does the fact that when the kernel driver module got blocked (by modprobe.blacklist=amdgpu),
while the vgaarb still select it as primary which leave the X server crash there (because no kennel space driver loaded)
count as a problem?


2)

Does my approach that mounting another GPU as the primary display adapter,
while its real purpose is to solving bugs and development for another GPU,
count as a use case?


$ cat demsg.txt | grep drm

[   10.099888] ACPI: bus type drm_connector registered
[   11.083920] etnaviv 0000:0d:00.0: [drm] bind etnaviv-display, master 
name: 0000:0d:00.0
[   11.084106] [drm] Initialized etnaviv 1.3.0 20151214 for 0000:0d:00.0 
on minor 0
[   13.301702] [drm] amdgpu kernel modesetting enabled.
[   13.359820] [drm] initializing kernel modesetting (NAVI12 
0x1002:0x7360 0x1002:0x0A34 0xC7).
[   13.368246] [drm] register mmio base: 0xEB100000
[   13.372861] [drm] register mmio size: 524288
[   13.380788] [drm] add ip block number 0 <nv_common>
[   13.385661] [drm] add ip block number 1 <gmc_v10_0>
[   13.390531] [drm] add ip block number 2 <navi10_ih>
[   13.395405] [drm] add ip block number 3 <psp>
[   13.399760] [drm] add ip block number 4 <smu>
[   13.404111] [drm] add ip block number 5 <dm>
[   13.408378] [drm] add ip block number 6 <gfx_v10_0>
[   13.413249] [drm] add ip block number 7 <sdma_v5_0>
[   13.433546] [drm] add ip block number 8 <vcn_v2_0>
[   13.433547] [drm] add ip block number 9 <jpeg_v2_0>
[   13.497757] [drm] VCN decode is enabled in VM mode
[   13.502540] [drm] VCN encode is enabled in VM mode
[   13.508785] [drm] JPEG decode is enabled in VM mode
[   13.529596] [drm] vm size is 262144 GB, 4 levels, block size is 
9-bit, fragment size is 9-bit
[   13.564762] [drm] Detected VRAM RAM=8176M, BAR=256M
[   13.569628] [drm] RAM width 2048bits HBM
[   13.574167] [drm] amdgpu: 8176M of VRAM memory ready
[   13.579125] [drm] amdgpu: 15998M of GTT memory ready.
[   13.584184] [drm] GART: num cpu pages 131072, num gpu pages 131072
[   13.590505] [drm] PCIE GART of 512M enabled (table at 
0x0000008000300000).
[   13.598749] [drm] Found VCN firmware Version ENC: 1.16 DEC: 5 VEP: 0 
Revision: 4
[   13.671786] [drm] reserve 0xe00000 from 0x81fd000000 for PSP TMR
[   13.801235] [drm] Display Core v3.2.247 initialized on DCN 2.0
[   13.807061] [drm] DP-HDMI FRL PCON supported
[   13.832382] [drm] kiq ring mec 2 pipe 1 q 0
[   13.838131] [drm] VCN decode and encode initialized 
successfully(under DPG Mode).
[   13.845877] [drm] JPEG decode initialized successfully.
[   14.072508] [drm] Initialized amdgpu 3.54.0 20150101 for 0000:0c:00.0 
on minor 1
[   14.080976] amdgpu 0000:0c:00.0: [drm] Cannot find any crtc or sizes
[   14.087341] [drm] DSC precompute is not needed.
[   16.487330] systemd[1]: Starting Load Kernel Module drm...
[  619.901873] [drm] PCIE GART of 512M enabled (table at 
0x0000008000300000).
[  619.901898] [drm] PSP is resuming...
[  619.925307] [drm] reserve 0xe00000 from 0x81fd000000 for PSP TMR
[  619.991034] [drm] psp gfx command AUTOLOAD_RLC(0x21) failed and 
response status is (0xFFFF000D)
[  620.294366] [drm] kiq ring mec 2 pipe 1 q 0
[  620.298953] [drm] VCN decode and encode initialized 
successfully(under DPG Mode).
[  620.299103] [drm] JPEG decode initialized successfully.
[  621.309543] [drm:sdma_v5_0_ring_test_ib [amdgpu]] *ERROR* amdgpu: IB 
test timed out
[  621.317577] amdgpu 0000:0c:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] 
*ERROR* IB test failed on sdma0 (-110).
[  622.333548] [drm:sdma_v5_0_ring_test_ib [amdgpu]] *ERROR* amdgpu: IB 
test timed out
[  622.341587] amdgpu 0000:0c:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] 
*ERROR* IB test failed on sdma1 (-110).
[  622.354071] [drm:amdgpu_device_delayed_init_work_handler [amdgpu]] 
*ERROR* ib ring test failed (-110).
[  622.363721] amdgpu 0000:0c:00.0: [drm] Cannot find any crtc or sizes

[1] https://www.techpowerup.com/gpu-specs/xfx-bc-160.b9346


