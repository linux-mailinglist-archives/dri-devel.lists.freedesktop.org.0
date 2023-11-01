Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490977DDD68
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 08:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5BF10E648;
	Wed,  1 Nov 2023 07:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-22.consmr.mail.gq1.yahoo.com
 (sonic317-22.consmr.mail.gq1.yahoo.com [98.137.66.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028F10E648
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 07:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048;
 t=1698824925; bh=xKBheuOBg56iTeLPHfHXNouyg3Ht2h5EDwz+FbIlwr8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To;
 b=kpmSQmjx7q5HVw9nkbo1sAYvkQeIpGxdHDALGeR9f10JJvT0MKfVedFY/AU1fkyDF79iF6HiH7Txv688F2gV9sv90sXM/odt3IAm+6T6z68119k/Zcv39D2VCNaWcNKzg1QslyMEts2bNTQCTOX90e2JAhejwhhCMkX3MiGJFaZP6Q51Ep8wocXZQpo5Sgtt/6DeVzt3ZwynXwUag1ZN/V/IDo0LcMlL3gRd8ZwUXrZ4rXI0FWjxIE/hMIP2Mo8LF2Nr7tWU4ZqgfXQwIM6bdgyjbPJr5xVBz8MlyET7fJALHSBe5pULTe6Fdq6aSSi2oIx30jZdJaOpqzaLUz7VMQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1698824925; bh=KBcQlUsbSW0o/+Q5qV7NaP2xyReocxv2++FVpzAvgGb=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=AH85USvYZhllu0oWj664rHINRnPCfJhos+SBKtVT/QtY7//Vf64lf7bKLijUudExc9dOTNPqqwBVYx7FG2t7v2l5eSa6QgQIlrMHgr6xJO+E1bb6cBe/zRXpEqAdYCzL7LOO8ElBqbgHjea6G7u1ZhkMZh0BKEyj8oKIsstD4Kbr8wv8vamxDLKbl95qgSqwWb95Ic1AO/P9Ob5/G707IhRZ58EqnVwQd49ySxMWqZk3OzpgMm+nCOaJNiCLq/J8wHWzD+q/x/TU19Sm7Ttt3WTYq7ygMX8lTM3+T7NOTyUf1mUz7dbp27s+hYf7KBWJVUWtOpQBqC9T5a9skZ32dw==
X-YMail-OSG: 4uQd9MEVM1k9N8JQbYzyGKDJHgGxfGoOTf0XevNXG95olCRKmwHGtQzJNxXn_m5
 3OKTeQ1f5GXspHVEvDdod8_Vr.d8kyzDb8.hnwyJ8bUZmU5UoAlyODYVOlPxCoMA0qrEZGqfeVUO
 X_zAiLp_bJkSB4aKS0D0w8KZrLevEB_HBmXxjVRkEDz.oDcNgIbGAX8fjsig7e7oK5YYHzWXTBbk
 FTlZB2R._yyo5MjGpEGNcfiaO.m_agNj8LNpk00g0HeGYV9iB3rLorWzvEDyahtpygaajXvX9F7n
 eSW4_ApTgHje.vUD4Tkdw6K0yExuxr51S7Fv3vB7l7hVc3aYvPfKLZLRln.JrK..O2k5xWVZaSgg
 az48AU36j05G.z7rri45f8.rUlEwY.979iQ10ajYfT8XLesPpmWkQggW94uKNAb1z3enDo8mz9Nb
 Kyi.23wDgQ8K1n8FOK6XbLj5uVzQ0e6Aj9U_9_lXErjcOs7uh8nwykYynnIbeWAB7pxnyLy.F58H
 PLrLE4G1jDM9VpnPU4nhJEjQNNbPhlMEQFdOxa3b0rJwkeQW3fkmiii05Eo565MPYo7UkOauv3su
 jaI3RCnrHxhK_vEIyS0m2tUBh0Fw3BLW.0yo0D05VZDUDqAS2Rrj4PgNIlyy4GxFZ88Qv6.BRbQo
 lZPW3kM7sZn50QrIpnPfs.acoLZTAXMgnFuNh09dTpeXwNov1j_viKVl0cltJGdPDcqvoV85f.Ov
 f_k3AqESlXCzEjpPDuQpdzL11eIwyiWwkzxcLpwjQr6wgN3aG6L_nsmjiic2cMv0aclfBhpByQtV
 nmH9V8BHMcxgYG5GzVEDZHXdEWDzhcVW58CqeJDTkcVSxEP_FSrwW0iKdw5rnzhTxzK_odbijWu2
 pZVlV0Nd4LnfCtjSZX2aZovSgIGpWViJ5FoGWZFP_0y7WLplNoGgYwhSWhpjH4s.rEjUBXT568ns
 yKLmparfjgeVJRvuO2nV7FsD9aQMqq8M6HmglWnl06jGttEwDsUqBP8v3wdvOGg4n6dwCKCXKrAQ
 ti.3yL_kpSnKLG7vv0b55oUgHj3iNwVwdHxEToCenBidBVwM_bSD5UjHDwfHb7KMxI80qp.GEmMK
 AY3lBkf7FvUTscFGV3mnhhPMBHLH.975kTrKSAj_p.mvrrCSfcdJrC8ttsNIgGO0s4R6DqCwBeRf
 nsvIsSsa.9ER6siJSxrufS39oHmG.uxVXPBenPRaE3rbaGTCEBYY2EhTOTX62xeZXK_9dPRCySS_
 AesIEcYC2RJf5pSbMxi3EgYL2_G4M5_e7f7p1ZxEQy4Nx0zf2gKMvuw.l6BnfRyEuRUQyODoFdTs
 N.Vy8ytAqA5VPYJu8CUE4qfs.WxFrsvTj4w1EntRfkbYziITCuEK63LQ_MfBp4xiZL2WUuvseprv
 r8rA5wJJlNYFkd_3QqxGVKPNxvGIaAtr3B4mYTypfm08JbdSuQxhHuNsVKdjL8.LJGScXF4SoPj0
 h6rt_0xFxxIptiiDE_Bfu4odYiwcSrWglWfJjSRWRL2FWZS0KU71mF3kefiWbw0pzdRXZl_0P3Ad
 MRhCvjMezY4aoVRhU_kg_fuxILJEWgjEVIEHUxrwdiYn_cklqQbYUhoVr.MaNCCIHe9OAlrZzTgD
 1hJxSUi8CHaF.CgJDzYqb1dAvhd0yUGF05u7YXpFEv9vJ7MDOps680p_7vY8qqYuqBTlrmr7CfKB
 84G3pggJDlLfRmQU9I6I8NQoC6DglYrvEwda.Uf4lM6rr99vYy7lS_HBS1cx9jBD7YVdNFQOEOvG
 AlxVyxJ5hGkIUVhjWoaD1HMVY.AWwWD.VlSgbsubAoFl7aS_977XUIyECWCv9vfO3Rll08NcdtmC
 fgRS7A92fLuVNUCTZR2OUuUuI.XdiRCWN2RL7GrRkeyqzphsJahdi.qQDTVdTsHdI0ed.tjFa_XE
 ZGMEciqgMOBxeCBv2Nr59pYbqKQCCVRcE1FR2NKnldm799KU8BMR2e5Q3GyvNFTDPInlnqZCR1Fk
 B5zsGSxQuJq4Gc.aF91MVAW8YMU9khdT3ITn8i9MonudDBdyZ.3XYp5nsVtwBPHg8TQWBv0S25VY
 47Ep.gSWDYpdYVU.SgPq.1P.vQeuPmtYYHRS1sb263o8zk05yYNhJkQmFYIqyR9umxTmW_2WlYu9
 8srzIFoyix6f_O4Z84l2PzGE1Om2RBjTjevyZc.CLOSLkxmpCU6e8jMkS7f7chLNTUzbWTn_pD72
 sOVb9_fbAcgVny6j8icmi1FfE9jXMywsX
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 63301ed7-b9b1-4b84-8e42-16fdf7f93e04
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 1 Nov 2023 07:48:45 +0000
Received: by hermes--production-ne1-56df75844-8k4lp (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 22a0194c371a9e8852fd76321ea5d484; 
 Wed, 01 Nov 2023 07:48:40 +0000 (UTC)
Message-ID: <f441508b-736d-4bb4-a7d5-ce2fc2c58fc7@netscape.net>
Date: Wed, 1 Nov 2023 03:48:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mario Marietto <marietto2008@gmail.com>
References: <CGME20231030230413eucas1p1c061adf636a7e8a58270a00725e1d0a2@eucas1p1.samsung.com>
 <CA+1FSign611=47=xLRucFhDjvs7A_TeFE9b8qO63WXDU8Pnkjg@mail.gmail.com>
 <7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.21890
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Julien Grall <julien@xen.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stefano Stabellini <sstabellini@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/2023 8:08 AM, Marek Szyprowski wrote:
> Hi,
> 
> On 31.10.2023 00:03, Mario Marietto wrote:
>> We are a team of linux enthusiasts who are trying to boot Xen on a 
>> Samsung XE303C12 Chromebook aka "snow" following the suggestions in 
>> the slide show presentation here: 
>> https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm 
>> This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it 
>> is a Samsung armv7 chip with virtualization extensions. In particular, 
>> we have it working fairly well both on the bare metal with a recent 
>> 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS kernel with 
>> KVM, the older LTS kernel version is used to test KVM because support 
>> for KVM on arm v7 was removed from Linux around kernel version 5.7. So 
>> we know we have the hypervisor mode enabled because we were able to 
>> use it with KVM. For Xen, we are using the latest Debian build of Xen 
>> 4.17 for the Debian armhf architecture: (XEN) Xen version 4.17.2-pre 
>> (Debian 4.17.1+2-gb773c48e36-1) 
>> (pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc 
>> (Debian 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023 The 
>> Linux kernel is a custom build that adds the Xen config kernel options 
>> (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the same 
>> Chromebook model on the bare metal. I can provide the config options 
>> of the kernel that was used if that is helpful. Our method of booting 
>> is to have u-boot boot the Xen hypervisor and load the device tree 
>> after adding the dom0 to the otherwise unaltered device tree from the 
>> Linux kernel using u-boot fdt commands to add a /chosen node, as 
>> described on the Xen wiki and in the pages linked from there. We have 
>> also tried adding and loading an initrd.img using the device tree 
>> /chosen node but that made no difference in our tests. We actually 
>> have the Linux LTS kernel version 6.1.59 working as dom0 with Xen 
>> using the same version of u-boot that we used for KVM, but with a big 
>> problem. The problem we see is that when booting the 6.1.59 kernel 
>> version as dom0 with Xen, the screen is totally dark and the only way 
>> to access the system is remotely through ssh. Logs indicate most 
>> everything else is working, such as the wifi card so we can access it 
>> remotely via ssh and a USB optical mouse lights up when connected so 
>> USB is also working. Obviously, the disk is also working. The 
>> Chromebook is configured to boot from the device's SD card slot by 
>> turning on Chrome OS developer mode options to enable booting from the 
>> SD card slot. The mystery is that when booting the exact same 6.1.59 
>> kernel on the bare metal instead of booting it as dom0 on Xen, it 
>> boots up with full access to the screen and we can interact with the 
>> system using the X.org windows system. But booting as dom0 with Xen, 
>> the screen is totally dark and the only access we have to the system 
>> is through the network via ssh. Also, when booting the 5.4.257 kernel 
>> with KVM in hypervisor mode, the screen works and we can interact with 
>> the system through the X.org windows system. Exploring the log file,we 
>> have seen the errors below :
>>
>> Without Xen (or in bare metal):
>>
>> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for 
>> DMA mapping operations
>> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 
>> 0xc0d96354)
>> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops 
>> 0xc0d97554)
>> devuan-bunsen kernel: exynos-drm exynos-drm: bound 
>> 145b0000.dp-controller (ops 0xc0d97278)
>> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops 
>> 0xc0d97bd0)
>> ...
>> devuan-bunsen kernel: Console: switching to colour frame buffer device 
>> 170x48
>> devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb 
>> frame buffer device
>> devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for 
>> exynos-drm on minor 0
>>
>> In this case,the kernel is able to use the exynos-drm kernel to start 
>> the fb0 device. But with Xen we get this error with exynos-drm:
>>
>> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for 
>> DMA mapping operations
>> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 
>> 0xc0d96354)
>> devuan-bunsen kernel: exynos-mixer 14450000.mixer: 
>> [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks 
>> support for IOMMU
>> devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind 
>> 14450000.mixer (ops 0xc0d97554): -22
>> devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
>> devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller 
>> failed with error -22
>>
>> I'm trying to find for a solution and I've googled a little bit and I 
>> found this web site : 
>> https://lore.kernel.org/linux-arm-kernel/20220208171823.226211-8-krzysztof.kozlowski@canonical.com/ 
>> with your email address and I tried to ask for some help for fixing 
>> the bug. Any ideas why booting the same Linux kernel that results in a 
>> working X.org display on the bare metal instead as dom0 on Xen would 
>> cause the display to remain dark, but most other basic functions would 
>> work, such as network, disk, and USB ? thanks.
> 
> 
> Thanks for the detailed description! Good to hear that those boards are 
> still being used for various projects. I also have Snow Chromebook and 
> use it for daily tests of linux-next branch.

Adding Julien Grall and Stefano Stabellini

Hi Marek,

Thanks for responding to Mario's question. I also have been doing these
experiments with a Chromebook Snow, and I am the one who reported this
problem on the xen-users ML here:

https://lists.xenproject.org/archives/html/xen-users/2023-10/msg00021.html

You might find that thread interesting, especially here with some additional
log messages from the exynos_drm driver (exynos_drm_dma.c, I believe):

https://lists.xenproject.org/archives/html/xen-users/2023-10/msg00032.html

This issue is also discussed some on the xen-devel ML here:

https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg00003.html

> 
> Frankly speaking I have no idea what might happen wrong. There have been 
> some changes recently in the Exynos IOMMU driver related to 
> initialization, maybe your changes related to Xen enabling changed 
> somehow the order of device initialization during boot. I assume that 
> the device-tree you use for the bare metal run and Xen enabled run 
> doesn't differ in the areas describing the hardware blocks.
> 
> Please check if cherry-picking the commit 
> https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d51489c0506547f 
> to your v6.1.59 based kernel helps anyhow.

I tried adding that fix of the exynos IOMMU initialization from
Linux > 6.2 on top of the 6.1.59 kernel I used for the original report,
but that made no difference on Xen - it still failed with the mixer lacks
support for IOMMU message and the screen is totally dark.

> 
> If not, then as a temporary workaround please disable 
> CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel config 
> and check what will happen (You will lose the HDMI output, but maybe 
> this won't a big issue).

This change causes the GPU to work fairly well AFAICS. Removing the mixer
and HDMI allowed the GPU to initialize, and the display manager started
normally and enabled logging into an ordinary X11 session. Based on the log
messages I was seeing, this was an obvious thing to try. Thanks for
suggesting it.

But I have a question:

How are the mixer and HDMI devices related to the main drm device? The problem
in the exynos_drm_dma driver was that on Xen, the main drm device wanted to
use IOMMU version of dma_ops, but the mixer (and probably also the HDMI if
it wouldn't have exited first) wanted to use the Xen swiotlb version of dma_ops,
but on bare metal all three devices want to use the IOMMU version of dma_ops.

The problem obviously has something to do with the fact that Xen does not
expose the same IOMMU capability to Linux as is available when running on
the bare metal.

Cheers,

> 
> 
> Best regards

