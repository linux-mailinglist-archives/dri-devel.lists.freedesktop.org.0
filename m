Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E498EC56
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 11:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378110E160;
	Thu,  3 Oct 2024 09:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="KYr21Ci6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2024 09:35:45 UTC
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7CD10E160
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:35:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241003092859euoutp0191f3450b17461c8237577179e050ccfe~651B6aZsx2187821878euoutp012
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241003092859euoutp0191f3450b17461c8237577179e050ccfe~651B6aZsx2187821878euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1727947739;
 bh=D2m+RfF3IsRIv+KXj3sdVoM2DfIZDEO442OjqiLAywE=;
 h=From:To:Cc:Subject:Date:References:From;
 b=KYr21Ci6/LbjDM9A4vLyy05lrp/+JTR9fFukat7wwZ56PlpqOYSX0pmI8mvDH466e
 ECznFY6XP2y5VJ3mAy0v9PpUdwJWxxP9lrck/pp5TtGgmpBmXU7BdRsMagyuJru+HC
 POgEBW7UV9rc9Q/ExDgZP2edlUsHfqchNnxeTtzI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241003092859eucas1p1881a1405079c8c8b06d3095e44d5e328~651Bon6kW2408324083eucas1p1h;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id CF.C7.09620.BD36EF66; Thu,  3
 Oct 2024 10:28:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d~651BO-AWX2405624056eucas1p1i;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20241003092859eusmtrp236720b91c258206292d8dfeede2ccdc4~651BOPjgC0060000600eusmtrp20;
 Thu,  3 Oct 2024 09:28:59 +0000 (GMT)
X-AuditID: cbfec7f5-d31ff70000002594-04-66fe63dbdecc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 87.E4.14621.BD36EF66; Thu,  3
 Oct 2024 10:28:59 +0100 (BST)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241003092858eusmtip28749e8296b98518877704b653d30695e~651Alyhj21503515035eusmtip2h;
 Thu,  3 Oct 2024 09:28:58 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: [PATCH 0/2] drm: Two fixes for the 'Provide client setup helper and
 convert drivers' patchset
Date: Thu,  3 Oct 2024 11:28:24 +0200
Message-Id: <20241003092826.1942901-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djPc7q3k/+lGfT/k7M4cX0Rk8XbuYtZ
 LK58fc9msXDackaL9zMnMFtc3jWHzWLtkbvsFgs/bmWxaOtcxmox+91+dostbyayOnB77P22
 gMVj56y77B6bVnWyecw7Gehxv/s4k0fr0V8sHu/3XWXz6NuyitFj8+lqj8+b5AK4orhsUlJz
 MstSi/TtErgy3k2cwV7wTqxi5YcZ7A2MPcJdjJwcEgImEj82X2fpYuTiEBJYwSix7exGRgjn
 C6PEiec3mCGcz4wSv/8tYu9i5ABrufusECK+nFHi2MsWZriOFVPusYDMZRMwlOh628UGkhAR
 aGKUOLuymRXEYRZ4wCTxZOpDRpAqYYEMifXv7jCDjGURUJW4Oc0bJMwrYC8x68RDNogD5SX2
 HzzLDBEXlDg58wnYAmagePPW2WCbJQSecEgc6prGBNHgInFq/TUoW1ji1fEt7BC2jMT/nfOZ
 IBraGSUW/L4P5UxglGh4fosRospa4s65X2wgFzELaEqs36UPEXaUmDlpASPE/3wSN94KQhzB
 JzFp23RmiDCvREebEES1msSs4+vg1h68cIkZwvaQWLWqAewvIYFYiYNHLrNMYFSYheS1WUhe
 m4VwwwJG5lWM4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBSez0v+NfdzCuePVR7xAjEwfj
 IUYJDmYlEd552/+mCfGmJFZWpRblxxeV5qQWH2KU5mBREudVTZFPFRJITyxJzU5NLUgtgsky
 cXBKNTB5zO85LGD5xLy2gtWG59bKs5K/v+RfOuBSxfnb1EC6qiDgB+9vM/81p2L2/LqrUtgw
 2+iAjPN5qwz5K0wTpL3kMqqdtyh/fTG7Li332mRB1pmzCj16FhV96Zn1LqHLIKXaMZxla4LL
 fDPdzw5fon98MYy2W33MTE7r8NYHUz1E/AVeJHzT+D1jyr2475qdiw+5TbatPmp4vbdybvI1
 7qJApel3w6auffCANbOjzN00+Zf+8idLqwIU9CuTXy7JMG+MDr5fdKli9cyv/wW+zpkyx1SI
 S6Ky41ZSZJPmA8tg810PmpWc+2ft3qyjXPsrTO7a0RvyybGdqrecw5jm1Foanld0FFVW/3L3
 p2eohRJLcUaioRZzUXEiALlZze3RAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEIsWRmVeSWpSXmKPExsVy+t/xe7q3k/+lGbw8zWJx4voiJou3cxez
 WFz5+p7NYuG05YwW72dOYLa4vGsOm8XaI3fZLRZ+3Mpi0da5jNVi9rv97BZb3kxkdeD22Ptt
 AYvHzll32T02repk85h3MtDjfvdxJo/Wo79YPN7vu8rm0bdlFaPH5tPVHp83yQVwRenZFOWX
 lqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunbJehlvJs4g73gnVjF
 yg8z2BsYe4S7GDk4JARMJO4+K+xi5OQQEljKKHH8ix+ILSEgI3FyWgMrhC0s8edaF1sXIxdQ
 zSdGiZ8TVrCAJNgEDCW63kIkRARaGCWObvzNCOIwCzxhklj6bSsjSJWwQJrE7IfT2UG2sQio
 Styc5g0S5hWwl5h14iEbxAZ5if0HzzJDxAUlTs58AraAGSjevHU28wRGvllIUrOQpBYwMq1i
 FEktLc5Nzy021CtOzC0uzUvXS87P3cQIjJxtx35u3sE479VHvUOMTByMhxglOJiVRHjnbf+b
 JsSbklhZlVqUH19UmpNafIjRFOi8icxSosn5wNjNK4k3NDMwNTQxszQwtTQzVhLndbt8Pk1I
 ID2xJDU7NbUgtQimj4mDU6qBaU7YDa7gLe0avs5T9S01FNyv+p7z/rSP0dl9d21Y0yf366fP
 xNYs8PxZcNGnOefSQSMXv89FbT5Tv9tcnyK5S/FHwXHFjfUNc3afj/V6+/i5iwHTgwNT29cZ
 hRmVJlwNuxX/oVjxaqbyyVTxonqDWb1e3xQDOzeFR/f+mxQikrnuAO/2yPmqLu9mGkYd0zP1
 tYvaY8q38HKAps1ilYc65fIbhKTf6J6b4B3yUnZJt8qTd7x+TFzeqs1ede/jk2x3Jz+Z90w2
 /V3XocxitfNORQVl4b+UCqTPBPuYFKmo8hgbtsgsPN6yoaqQn0u6znLxZLMFri/OHRf5dPi+
 fzebpIJ3GseK7seSxel/1iixFGckGmoxFxUnAgBKSPnlJQMAAA==
X-CMS-MailID: 20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d
References: <CGME20241003092859eucas1p1b9706a1e0a4ae23b490ae0f1c3c1d32d@eucas1p1.samsung.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

Yesterday the "drm: Provide client setup helper and convert drivers"
patchset [1] landed in linux-next. In my tests I found that it causes kernel
NULL pointer dereference on ARM/ARM64 based Raspberry Pi4B boards. It
turned out that the conversion of the VC4 DRM driver is a bit incomplete,
so I've decided to provide the needed fix. While developping it I've
found that a small fix to generic drm/fbdev-helper helps to avoid NULL
pointer dereference in the future in case of similar problems.

Those patches fixes the following problem observed on Raspberry Pi4B
boards:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000020 when write
[00000020] *pgd=00000000
Internal error: Oops: 805 [#1] SMP ARM
Modules linked in: aes_arm aes_generic cmac brcmfmac_wcc brcmfmac brcmutil sha256_generic libsha256 sha256_arm cfg80211 hci_uart btbcm crc32_arm_ce raspberrypi_hwmon bluetooth ecdh_generic vc4 ecc libaes snd_soc_hdmi_codec snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm v3d bcm2711_thermal snd_timer genet drm_shmem_helper snd gpu_sched soundcore drm_dma_helper
CPU: 1 UID: 0 PID: 21 Comm: kworker/1:0 Not tainted 6.12.0-rc1-next-20241002 #15363
Hardware name: BCM2711
Workqueue: events output_poll_execute
PC is at __drm_fb_helper_initial_config_and_unlock+0x30c/0x518
LR is at __drm_fb_helper_initial_config_and_unlock+0x26c/0x518
pc : [<c0aec770>]    lr : [<c0aec6d0>]    psr: 60000013
...
Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c5383d  Table: 04ef006a  DAC: 00000051
...
Register r12 information: slab task_struct start c213c400 pointer offset 0 size 2176
Process kworker/1:0 (pid: 21, stack limit = 0x98a73703)
Stack: (0xf0879e28 to 0xf087a000)
...
Call trace: 
 __drm_fb_helper_initial_config_and_unlock from drm_client_dev_hotplug+0xac/0x104
 drm_client_dev_hotplug from output_poll_execute+0x298/0x2a0
 output_poll_execute from process_one_work+0x178/0x3c0
 process_one_work from worker_thread+0x270/0x42c
 worker_thread from kthread+0xe0/0xfc
 kthread from ret_from_fork+0x14/0x28
Exception stack(0xf0879fb0 to 0xf0879ff8)
9fa0:                                     00000000 00000000 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e30a3724 e5942038 e34c3186 e8b30003 (e5820020) 
---[ end trace 0000000000000000 ]---

[1] https://patchwork.freedesktop.org/series/137389/

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (2):
  drm/fbdev-helper: fail if driver provides no fbdev/fb probe functions
  drm/vc4: Provides DRM_FBDEV_DMA_DRIVER_OPS also for vc5_drm_driver

 drivers/gpu/drm/drm_fb_helper.c | 3 +++
 drivers/gpu/drm/vc4/vc4_drv.c   | 1 +
 2 files changed, 4 insertions(+)

-- 
2.34.1

