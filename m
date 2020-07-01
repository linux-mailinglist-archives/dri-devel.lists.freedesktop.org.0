Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2721052D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF73D6E7EF;
	Wed,  1 Jul 2020 07:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A5E6E7EF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:40:10 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200701074006euoutp015973aad8d9c3001d4e7f01fa34f0a370~dkPCcc4P61778517785euoutp01l
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:40:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200701074006euoutp015973aad8d9c3001d4e7f01fa34f0a370~dkPCcc4P61778517785euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593589206;
 bh=khJe9VZxWQguO3k8EDSriz4PGxf0dg3rXvVhSt1TV+s=;
 h=From:To:Cc:Subject:Date:References:From;
 b=ERjV7yJLnd5jkHfIhG6zVF9xrqJ9isRC3jzCJ91Q42rFgDQ+Ba1xoSYkWaCkPWZDN
 GTVqJmMQEdgqYzuV9dY2Obhb65mW8SHpY0m6DHE4x5+j+tIiZGt5DkCj77xopIXpv8
 /v6Ck8Q3J7181v8fxFOBq4TYKUNME5MTJH+RZ0SQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200701074005eucas1p148c38f80d0a1cfa4cac2ca2e1dc1f807~dkPCCHhQA3079230792eucas1p1G;
 Wed,  1 Jul 2020 07:40:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BB.06.06318.5DD3CFE5; Wed,  1
 Jul 2020 08:40:05 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba~dkPBXrBg83072030720eucas1p1D;
 Wed,  1 Jul 2020 07:40:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200701074005eusmtrp250748701f048c08492cd9ac215b9a279~dkPBW8Bdl1308413084eusmtrp24;
 Wed,  1 Jul 2020 07:40:05 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-a7-5efc3dd571a0
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 53.96.06314.4DD3CFE5; Wed,  1
 Jul 2020 08:40:05 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200701074004eusmtip26d2a5d8c831ce0b0ecd5219e84646045~dkPA59MVZ1412114121eusmtip2j;
 Wed,  1 Jul 2020 07:40:04 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, linux-rpi-kernel
 <linux-rpi-kernel@lists.infradead.org>
Subject: [PATCH] drm/vc4/vc4_hdmi: fill ASoC card owner
Date: Wed,  1 Jul 2020 09:39:49 +0200
Message-Id: <20200701073949.28941-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd2rtn/iDPY261r0njvJZHHl4iEm
 i//bJjJbXPn6ns3iQONlRouJtzewW6w9cpfdYtus5WwWLze/YXLg9NjwuYnNo+n9MTaPvd8W
 sHhs//aA1eN+93Emj81L6j36tqxi9Nh8ujqAI4rLJiU1J7MstUjfLoEr4+qrbawFG2Qqeq9v
 ZG9g3CLZxcjJISFgInH87g12EFtIYAWjRMv3yi5GLiD7C6PEohmLWCGcz4wSj9fvYYPpuHuu
 mx0isZxRYlbnAza4lrazT1hBqtgEDCW63naBdYgIxEmc3tPCCFLELNDEJNF9qJcJJCEsYC6x
 5fdVsCIWAVWJ76+7wJp5BWwl3n7czw6xTl5i9YYDzCDNEgK/2SQudMxghki4SFzohbGFJV4d
 3wLVICPxf+d8JoiGZkaJh+fWskM4PYwSl5tmMEJUWUvcOfcLaDUH0E2aEut36UOEHSXuLLjG
 CBKWEOCTuPFWECTMDGRO2jadGSLMK9HRJgRRrSYx6/g6uLUHL1yCOsdDom/mOyZIoMZKdD9s
 ZZzAKDcLYdcCRsZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgenj9L/jX3cw7vuTdIhR
 gINRiYe3Q/Z3nBBrYllxZe4hRgkOZiURXqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xov
 ehkrJJCeWJKanZpakFoEk2Xi4JRqYOwPeLeEW/GRRaL45vfH8mdJu103UG5/c+GyxoO17yps
 r9u7L1u2rM68JP5cuYRGj/rnc+G7NxxYEqyfuUvdoygt49W3t7/O9U6xYBZzd6523DdXfWvY
 uvkmLWJXg99fnnbdInL30RRBk83dG7MMF+3VPxF3xy/imv7i9KoJc8Vv1k1iKvvC8kOJpTgj
 0VCLuag4EQAgsUUxGwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsVy+t/xe7pXbf/EGbzfymjRe+4kk8WVi4eY
 LP5vm8hsceXrezaLA42XGS0m3t7AbrH2yF12i22zlrNZvNz8hsmB02PD5yY2j6b3x9g89n5b
 wOKx/dsDVo/73ceZPDYvqffo27KK0WPz6eoAjig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMT
 Sz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jKuvtrEWbJCp6L2+kb2BcYtkFyMnh4SAicTdc93s
 XYxcHEICSxklVlx6wQKRkJE4Oa2BFcIWlvhzrYsNxBYS+MQocXp/CIjNJmAo0fUWJM7BISIQ
 J9GyOABkDrNAB5PE43/TGUFqhAXMJbb8vgrWyyKgKvH9dRfYTF4BW4m3H/ezQ8yXl1i94QDz
 BEaeBYwMqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJDdtuxn5t3MF7aGHyIUYCDUYmHt0P2
 d5wQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAi2fyCwlmpwPjKe8knhD
 U0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2MU396vTt3irFt4/6GNenR
 h+UVRd7MSHc1kFnyN2Wm7lRR74/Rp0zO5i+NXyYTr8aV+afS5Zn/7/CFShu1BFaGt2lLO0/V
 UhJ1lWuv79AIuuZ8NXE/vxzzGukdZnnSwiplSixpJ7zXuPBuE4vpmjDP1aeUp8bqf6fO06dt
 E9d/Xqu9tT0s2laJpTgj0VCLuag4EQDUJ4LzbwIAAA==
X-CMS-MailID: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
X-Msg-Generator: CA
X-RootMTR: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba
References: <CGME20200701074005eucas1p1f5a363d894929ec10a73bd2da54e85ba@eucas1p1.samsung.com>
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

card->owner is a required property and since commit 81033c6b584b ("ALSA:
core: Warn on empty module") a warning is issued if it is empty. Fix lack
of it. This fixes following warning observed on RaspberryPi 3B board
with ARM 32bit kernel and multi_v7_defconfig:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 210 at sound/core/init.c:207 snd_card_new+0x378/0x398 [snd]
Modules linked in: vc4(+) snd_soc_core ac97_bus snd_pcm_dmaengine bluetooth snd_pcm snd_timer crc32_arm_ce raspberrypi_hwmon snd soundcore ecdh_generic ecc bcm2835_thermal phy_generic
CPU: 1 PID: 210 Comm: systemd-udevd Not tainted 5.8.0-rc1-00027-g81033c6b584b #1087
Hardware name: BCM2835
[<c03113c0>] (unwind_backtrace) from [<c030bcb4>] (show_stack+0x10/0x14)
[<c030bcb4>] (show_stack) from [<c071cef8>] (dump_stack+0xd4/0xe8)
[<c071cef8>] (dump_stack) from [<c0345bfc>] (__warn+0xdc/0xf4)
[<c0345bfc>] (__warn) from [<c0345cc4>] (warn_slowpath_fmt+0xb0/0xb8)
[<c0345cc4>] (warn_slowpath_fmt) from [<bf02ff74>] (snd_card_new+0x378/0x398 [snd])
[<bf02ff74>] (snd_card_new [snd]) from [<bf11f0b4>] (snd_soc_bind_card+0x280/0x99c [snd_soc_core])
[<bf11f0b4>] (snd_soc_bind_card [snd_soc_core]) from [<bf12f000>] (devm_snd_soc_register_card+0x34/0x6c [snd_soc_core])
[<bf12f000>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf165654>] (vc4_hdmi_bind+0x43c/0x5f4 [vc4])
[<bf165654>] (vc4_hdmi_bind [vc4]) from [<c09d660c>] (component_bind_all+0xec/0x24c)
[<c09d660c>] (component_bind_all) from [<bf15c44c>] (vc4_drm_bind+0xd4/0x174 [vc4])
[<bf15c44c>] (vc4_drm_bind [vc4]) from [<c09d6ac0>] (try_to_bring_up_master+0x160/0x1b0)
[<c09d6ac0>] (try_to_bring_up_master) from [<c09d6f38>] (component_master_add_with_match+0xd0/0x104)
[<c09d6f38>] (component_master_add_with_match) from [<bf15c588>] (vc4_platform_drm_probe+0x9c/0xbc [vc4])
[<bf15c588>] (vc4_platform_drm_probe [vc4]) from [<c09df740>] (platform_drv_probe+0x6c/0xa4)
[<c09df740>] (platform_drv_probe) from [<c09dd6f0>] (really_probe+0x210/0x350)
[<c09dd6f0>] (really_probe) from [<c09dd940>] (driver_probe_device+0x5c/0xb4)
[<c09dd940>] (driver_probe_device) from [<c09ddb38>] (device_driver_attach+0x58/0x60)
[<c09ddb38>] (device_driver_attach) from [<c09ddbc0>] (__driver_attach+0x80/0xbc)
[<c09ddbc0>] (__driver_attach) from [<c09db820>] (bus_for_each_dev+0x68/0xb4)
[<c09db820>] (bus_for_each_dev) from [<c09dc9f8>] (bus_add_driver+0x130/0x1e8)
[<c09dc9f8>] (bus_add_driver) from [<c09de648>] (driver_register+0x78/0x110)
[<c09de648>] (driver_register) from [<c0302038>] (do_one_initcall+0x50/0x220)
[<c0302038>] (do_one_initcall) from [<c03db544>] (do_init_module+0x60/0x210)
[<c03db544>] (do_init_module) from [<c03da4f8>] (load_module+0x1e34/0x2338)
[<c03da4f8>] (load_module) from [<c03dac00>] (sys_finit_module+0xac/0xbc)
[<c03dac00>] (sys_finit_module) from [<c03000c0>] (ret_fast_syscall+0x0/0x54)
Exception stack(0xeded9fa8 to 0xeded9ff0)
...
---[ end trace 6414689569c2bc08 ]---

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 625bfcf52dc4..bdcc54c87d7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1117,6 +1117,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *hdmi)
 	card->num_links = 1;
 	card->name = "vc4-hdmi";
 	card->dev = dev;
+	card->owner = THIS_MODULE;
 
 	/*
 	 * Be careful, snd_soc_register_card() calls dev_set_drvdata() and
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
