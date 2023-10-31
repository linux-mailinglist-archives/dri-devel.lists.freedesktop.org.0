Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898D7DCC95
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F22410E48E;
	Tue, 31 Oct 2023 12:08:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145E110E4AB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:08:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231031120812euoutp022367d3d17c1dbb0be6eb31f0d1793267~TL9jeLG-z1054410544euoutp02f
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 12:08:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231031120812euoutp022367d3d17c1dbb0be6eb31f0d1793267~TL9jeLG-z1054410544euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1698754092;
 bh=7R+We3/ZotRkN0zNzo4bcBqBdOETuS0p31VdG/ZiSD4=;
 h=Date:Subject:To:From:Cc:In-Reply-To:References:From;
 b=Na2R3VBkKye01omh0MTd2uw1FcDuqp/ltJLwgs0QMyeKAHSe/U52ExY/0sqI8R22I
 oG2jk+C4+/K9s3b0ZABZzqT/nY8c77lf5RBYhrrRbevY7LgsKh9kS8vVrqRm9fU+4Z
 +KcyF8o2I0sDpWeoz0z3aAjVRgdakAhiyr+p3Qww=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231031120812eucas1p2925bf2ac67e8e654accd6e4260b8119f~TL9jQLEJr2837828378eucas1p2d;
 Tue, 31 Oct 2023 12:08:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id ED.B1.52736.C2EE0456; Tue, 31
 Oct 2023 12:08:12 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20231031120812eucas1p23817b869678ec45bd83f9e7f21ff92a7~TL9i6Bxxq2838328383eucas1p2K;
 Tue, 31 Oct 2023 12:08:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231031120812eusmtrp2de2419fa7c68219ec49cf891b251225b~TL9i5YOh90258902589eusmtrp2s;
 Tue, 31 Oct 2023 12:08:12 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000ce00-54-6540ee2c18b8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C9.4E.25043.C2EE0456; Tue, 31
 Oct 2023 12:08:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231031120811eusmtip13c34f44540513f450b5edf34a31d673a~TL9iHyOlN2503025030eusmtip1n;
 Tue, 31 Oct 2023 12:08:11 +0000 (GMT)
Message-ID: <7a71e348-f892-4fd4-8857-b72f35ab5134@samsung.com>
Date: Tue, 31 Oct 2023 13:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
Content-Language: en-US
To: Mario Marietto <marietto2008@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CA+1FSign611=47=xLRucFhDjvs7A_TeFE9b8qO63WXDU8Pnkjg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djP87o67xxSDR6/ULN4MG8bm8X8I+dY
 La58fc9msfHtDyaLTY+vsVpc3jWHzWLG+X1MFoemPGezaH/6ktmB02NWQy+bx85Zd9k9Nq3q
 ZPO4332cyWPzknqPvi2rGD0+b5ILYI/isklJzcksSy3St0vgyth7byV7QY9RRcuSJtYGxh0a
 XYycHBICJhK3zyxn6mLk4hASWMEo0dv/gx3C+cIose1lCytIlZDAZ0aJNTMEuhg5wDo+HxCF
 CC9nlNhxyxqi/iOjxMXN5xlBErwCdhKH905mAbFZBFQlvk68wwYRF5Q4OfMJWFxUQF7i/q0Z
 7CAzhQXqJVrbeEHCzALiEreezGcCsUUEtCXW7ZjPDmKzCRhKdL3tYgPZxSywk0niTPMMsDmc
 AoESa668Y4RolpfY/nYOM0iRhMB/Dolt9zqYII52kbg8TQTiY2GJV8e3sEPYMhL/d85ngqhv
 Z5RY8Ps+lDOBUaLh+S1GiCpriTvnfrGBDGIW0JRYv0sfIuwosfrkR0aI+XwSN94KQtzAJzFp
 23RmiDCvREebEES1msSs4+vg1h68cIl5AqPSLKRQmYXk/VlIvpmFsHcBI8sqRvHU0uLc9NRi
 47zUcr3ixNzi0rx0veT83E2MwCR1+t/xrzsYV7z6qHeIkYmD8RCjBAezkgjvYVOHVCHelMTK
 qtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWpRTBZJg5OqQamyZFHP/06ero0rs3i
 wOuW75yfpyTM1JwzbVm6tFJf+bKiDNavoeGebCGOlUqmBwplo+ctk5n589inWbMP7Kyz6V9s
 Z6Ds7C+jMmuK0N/mUw/yJXPfub3z/jVtn4/RxyX9Xw8sXcZse3na69dHpT5eiNMy+BS39Ms8
 jRsWvjN2NNbGr/A/u8juh5PmsbSvT/cXJJ1XahCP8vEpy76Uwi+70bp5p65Kppnaun2XBZz/
 recIup+k+2r+gY5FLRMSrDd5OVhITXtwO5I13mr5kUeBCld4J717qJ2rvET4t/WL8oqgdf+7
 fK8wHdUSTFu0b6/Kzk/nfMK8vSS2Pf62poY/vH/ZHxvRJye6qjMfP/7wUImlOCPRUIu5qDgR
 AKpk6PTBAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRmVeSWpSXmKPExsVy+t/xu7o67xxSDX7M4rJ4MG8bm8X8I+dY
 La58fc9msfHtDyaLTY+vsVpc3jWHzWLG+X1MFoemPGezaH/6ktmB02NWQy+bx85Zd9k9Nq3q
 ZPO4332cyWPzknqPvi2rGD0+b5ILYI/SsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaP
 tTIyVdK3s0lJzcksSy3St0vQy9h7byV7QY9RRcuSJtYGxh0aXYwcHBICJhKfD4h2MXJxCAks
 ZZQ4sGUWUxcjJ1BcRuLktAZWCFtY4s+1LjaIoveMEntXbWMHSfAK2Ekc3juZBcRmEVCV+Drx
 DhtEXFDi5MwnYHFRAXmJ+7dmsIMsExaol2ht4wUJMwuIS9x6Mh9sl4iAtsS6HfPZIeYvYZS4
 sfEw2Bw2AUOJrrcQi5kFdjNJbPk/CewiToFAiTVX3jFCTDKT6NraBWXLS2x/O4d5AqPQLCR3
 zEKycBaSlllIWhYwsqxiFEktLc5Nzy020itOzC0uzUvXS87P3cQIjM1tx35u2cG48tVHvUOM
 TByMhxglOJiVRHgPmzqkCvGmJFZWpRblxxeV5qQWH2I0BQbGRGYp0eR8YHLIK4k3NDMwNTQx
 szQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpg6jTxvi0yvfD172M313r7Gx8QVDD8
 8+pNuGmeW8f089e6rs1+zesp6Drf49Su091XAyctknvcwMjbwX8vVy01+5v2udJvnppcx85P
 EbgzscZ3V8JO5dzcxap/Xpw4P+/ljuentPkjVA3+5kZcPaVge9CT8Wd67/Fvr1SLy2Ztr3x6
 dvbirWev2sY+EUnzvXwkb4GX3kLG0m/vXk0ztPt8SOfk2mTjW5ezLOSzmtWvS08S+XE6cPJB
 Hvf61xZndshy9kz7N19v7gXdShEh9Q3Fa7RdjpXJHPM0Ofji2JLsGpYenQkCt/0sF01pfmp5
 ahPXlFlzrhc+v/pLzUZhn+OTRpXIif3FUpP+/zic8P2n5AslluKMREMt5qLiRADGmobaVgMA
 AA==
X-CMS-MailID: 20231031120812eucas1p23817b869678ec45bd83f9e7f21ff92a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231030230413eucas1p1c061adf636a7e8a58270a00725e1d0a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231030230413eucas1p1c061adf636a7e8a58270a00725e1d0a2
References: <CGME20231030230413eucas1p1c061adf636a7e8a58270a00725e1d0a2@eucas1p1.samsung.com>
 <CA+1FSign611=47=xLRucFhDjvs7A_TeFE9b8qO63WXDU8Pnkjg@mail.gmail.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <snawrocki@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 31.10.2023 00:03, Mario Marietto wrote:
> We are a team of linux enthusiasts who are trying to boot Xen on a 
> Samsung XE303C12 Chromebook aka "snow" following the suggestions in 
> the slide show presentation here: 
> https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm 
> This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it 
> is a Samsung armv7 chip with virtualization extensions. In particular, 
> we have it working fairly well both on the bare metal with a recent 
> 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS kernel with 
> KVM, the older LTS kernel version is used to test KVM because support 
> for KVM on arm v7 was removed from Linux around kernel version 5.7. So 
> we know we have the hypervisor mode enabled because we were able to 
> use it with KVM. For Xen, we are using the latest Debian build of Xen 
> 4.17 for the Debian armhf architecture: (XEN) Xen version 4.17.2-pre 
> (Debian 4.17.1+2-gb773c48e36-1) 
> (pkg-xen-devel@xxxxxxxxxxxxxxxxxxxxxxx) (arm-linux-gnueabihf-gcc 
> (Debian 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023 The 
> Linux kernel is a custom build that adds the Xen config kernel options 
> (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the same 
> Chromebook model on the bare metal. I can provide the config options 
> of the kernel that was used if that is helpful. Our method of booting 
> is to have u-boot boot the Xen hypervisor and load the device tree 
> after adding the dom0 to the otherwise unaltered device tree from the 
> Linux kernel using u-boot fdt commands to add a /chosen node, as 
> described on the Xen wiki and in the pages linked from there. We have 
> also tried adding and loading an initrd.img using the device tree 
> /chosen node but that made no difference in our tests. We actually 
> have the Linux LTS kernel version 6.1.59 working as dom0 with Xen 
> using the same version of u-boot that we used for KVM, but with a big 
> problem. The problem we see is that when booting the 6.1.59 kernel 
> version as dom0 with Xen, the screen is totally dark and the only way 
> to access the system is remotely through ssh. Logs indicate most 
> everything else is working, such as the wifi card so we can access it 
> remotely via ssh and a USB optical mouse lights up when connected so 
> USB is also working. Obviously, the disk is also working. The 
> Chromebook is configured to boot from the device's SD card slot by 
> turning on Chrome OS developer mode options to enable booting from the 
> SD card slot. The mystery is that when booting the exact same 6.1.59 
> kernel on the bare metal instead of booting it as dom0 on Xen, it 
> boots up with full access to the screen and we can interact with the 
> system using the X.org windows system. But booting as dom0 with Xen, 
> the screen is totally dark and the only access we have to the system 
> is through the network via ssh. Also, when booting the 5.4.257 kernel 
> with KVM in hypervisor mode, the screen works and we can interact with 
> the system through the X.org windows system. Exploring the log file,we 
> have seen the errors below :
>
> With Xen (or in bare metal):
>
> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for 
> DMA mapping operations
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 
> 0xc0d96354)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops 
> 0xc0d97554)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 
> 145b0000.dp-controller (ops 0xc0d97278)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops 
> 0xc0d97bd0)
> ...
> devuan-bunsen kernel: Console: switching to colour frame buffer device 
> 170x48
> devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb 
> frame buffer device
> devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for 
> exynos-drm on minor 0
>
> In this case,the kernel is able to use the exynos-drm kernel to start 
> the fb0 device. But with Xen we get this error with exynos-drm:
>
> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for 
> DMA mapping operations
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops 
> 0xc0d96354)
> devuan-bunsen kernel: exynos-mixer 14450000.mixer: 
> [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks 
> support for IOMMU
> devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind 
> 14450000.mixer (ops 0xc0d97554): -22
> devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
> devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller 
> failed with error -22
>
> I'm trying to find for a solution and I've googled a little bit and I 
> found this web site : 
> https://lore.kernel.org/linux-arm-kernel/20220208171823.226211-8-krzysztof.kozlowski@canonical.com/ 
> with your email address and I tried to ask for some help for fixing 
> the bug. Any ideas why booting the same Linux kernel that results in a 
> working X.org display on the bare metal instead as dom0 on Xen would 
> cause the display to remain dark, but most other basic functions would 
> work, such as network, disk, and USB ? thanks.


Thanks for the detailed description! Good to hear that those boards are 
still being used for various projects. I also have Snow Chromebook and 
use it for daily tests of linux-next branch.

Frankly speaking I have no idea what might happen wrong. There have been 
some changes recently in the Exynos IOMMU driver related to 
initialization, maybe your changes related to Xen enabling changed 
somehow the order of device initialization during boot. I assume that 
the device-tree you use for the bare metal run and Xen enabled run 
doesn't differ in the areas describing the hardware blocks.

Please check if cherry-picking the commit 
https://github.com/torvalds/linux/commit/bbc4d205d93f52ee18dfa7858d51489c0506547f 
to your v6.1.59 based kernel helps anyhow.

If not, then as a temporary workaround please disable 
CONFIG_DRM_EXYNOS_MIXER and CONFIG_DRM_EXYNOS_HDMI in your kernel config 
and check what will happen (You will lose the HDMI output, but maybe 
this won't a big issue).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

