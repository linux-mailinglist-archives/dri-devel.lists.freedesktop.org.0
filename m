Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16BC13DE25
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 15:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E046ED7B;
	Thu, 16 Jan 2020 14:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF76ED7B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:56:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200116145654euoutp011d71c49dcbe98079fa096a3cd6f36dd1~qZdvNdiYZ1195411954euoutp01o
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:56:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200116145654euoutp011d71c49dcbe98079fa096a3cd6f36dd1~qZdvNdiYZ1195411954euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579186614;
 bh=gYFlVr9o/9ffDBMZ9X8ERiwufXV1iHNJKOICXMmjbf8=;
 h=From:Subject:To:Cc:Date:References:From;
 b=F1MtKtSKgKJuwct1s6wIGio/KDar53tCoaN3rDRW71bPR06I2sIzY+ZlbpNIuX5Uf
 dkujl7N/YAV0UJYNrlRhTQAK7AD1VyF2EweCNOhyXfj1rw8oEvrwSMqUs3Zo1Pv07r
 DRww05QuMyTa/G5Z4GMxBbb+gcLPROzXId5hfyog=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200116145653eucas1p1e3e1189b5de9b64ca210a00c788f4796~qZduzuYES2220922209eucas1p1C;
 Thu, 16 Jan 2020 14:56:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 15.D4.60698.5B9702E5; Thu, 16
 Jan 2020 14:56:53 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5~qZdudwj-b1470514705eucas1p2H;
 Thu, 16 Jan 2020 14:56:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200116145653eusmtrp1e452f405ef97ba250cae718242794690~qZdudAc4a1494014940eusmtrp1J;
 Thu, 16 Jan 2020 14:56:53 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-dc-5e2079b53320
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 21.26.08375.5B9702E5; Thu, 16
 Jan 2020 14:56:53 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200116145651eusmtip1054969a694e6110ad67cc935712ce6c6~qZdsknekg0369003690eusmtip1P;
 Thu, 16 Jan 2020 14:56:51 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/2] video: fbdev: wm8505fb: fix sparse warnings about using
 incorrect types
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-ID: <567cba81-5fec-4d91-f711-c0bdbfe5b513@samsung.com>
Date: Thu, 16 Jan 2020 15:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djPc7pbKxXiDCbdlLe4te4cq8XGGetZ
 La58fc9msenxNVaLE30fWC0u75rDZtFyeQWzA7vH/e7jTB6bl9R7nP/fwu7Rt2UVo8fnTXIB
 rFFcNimpOZllqUX6dglcGbO//WIueMJWcWx9A2sD413WLkZODgkBE4muP/+BbC4OIYEVjBLr
 ft1hgnC+MEocPDGTGcL5zCjRcXQjXMus/lZ2iMRyRonDn/ZDVb1llDh/cAFYFZuAlcTE9lWM
 ILawQJzEp02fwIpEBNoYJb6uagBbwizQzCjxe8cLNpAqXgE7iaZzN8E6WARUJdZe6wazRQUi
 JD49OMwKUSMocXLmExYQm1lAXOLWk/lMELa8xPa3c8A2SAgsYpf4NP0/E8SxLhLtd9azQNjC
 Eq+Ob2GHsGUkTk/uYYFoWMco8bfjBVT3dkaJ5ZP/sUFUWUvcOfcLyOYAWqEpsX6XPogpIeAo
 Met6EITJJ3HjrSDEDXwSk7ZNZ4YI80p0tAlBzFCT2LBsAxvM1q6dK5khbA+Jzi0/mCYwKs5C
 8tksJJ/NQvLZLIQTFjCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMQ6f/Hf+6g3Hf
 n6RDjAIcjEo8vB9CFOKEWBPLiitzDzFKcDArifCenCEbJ8SbklhZlVqUH19UmpNafIhRmoNF
 SZzXeNHLWCGB9MSS1OzU1ILUIpgsEwenVANjSEPONAOmDDPrxo7Nn7ovnLOYsD3i8VzniXUT
 t6sz7MuwfbNZ1nj6642s8znlJ7JP+D/lxOE502/Vzjv1PMrKNtjCqopH2uS72+1J5b8c/KTt
 hF44cIfOKip8p3/2QdYek9fe/7Ul9YV4L8+Z5jTnxuErAi2sZ+p4vxubrJjr8KWZX2ZTahW3
 EktxRqKhFnNRcSIA+7aL+z8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xu7pbKxXiDP6c4rS4te4cq8XGGetZ
 La58fc9msenxNVaLE30fWC0u75rDZtFyeQWzA7vH/e7jTB6bl9R7nP/fwu7Rt2UVo8fnTXIB
 rFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GbO/
 /WIueMJWcWx9A2sD413WLkZODgkBE4lZ/a3sXYxcHEICSxklmh+0sXQxcgAlZCSOry+DqBGW
 +HOtiw2i5jWjxOZZm9hBEmwCVhIT21cxgtjCAnESnzZ9YgYpEhFoY5SYv+UFI4jDLNDMKHFn
 3XomkCpeATuJpnM3wTpYBFQl1l7rBrNFBSIkDu+YxQhRIyhxcuYTFhCbWUBd4s+8S8wQtrjE
 rSfzmSBseYntb+cwT2AUmIWkZRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/
 dxMjMIq2Hfu5eQfjpY3BhxgFOBiVeHhnBCnECbEmlhVX5h5ilOBgVhLhPTlDNk6INyWxsiq1
 KD++qDQntfgQoynQQxOZpUST84ERnlcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1
 ILUIpo+Jg1OqgbHq8b4z6/wiudeFce4KTbzVerD97Y7UQ4VaH6Z+2VrjfPtL5yRTGQmPF6bh
 O/Jmf1lqVngzm7WhtO5Sb/GRQ7bfOVo5tmgJ+W3decsp5T5vlUV01IzkA2qnvCJ/a+3MfKnV
 t1hFzOzBiT3GPE9nWal7+5x+Xd8gpvF+roi7b87HtKrVlxaJqCixFGckGmoxFxUnAgDDbEBi
 uAIAAA==
X-CMS-MailID: 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5
X-Msg-Generator: CA
X-RootMTR: 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5
References: <CGME20200116145653eucas1p2222fb48dd6fe1023a4152e687ec577d5@eucas1p2.samsung.com>
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
Cc: Tony Prisk <linux@prisktech.co.nz>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use ->screen_buffer instead of ->screen_base to fix sparse warnings.

[ Please see commit 17a7b0b4d974 ("fb.h: Provide alternate screen_base
  pointer") for details. ]

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
Resend with Tony & linux-arm ML added to Cc:.

 drivers/video/fbdev/wm8505fb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: b/drivers/video/fbdev/wm8505fb.c
===================================================================
--- a/drivers/video/fbdev/wm8505fb.c
+++ b/drivers/video/fbdev/wm8505fb.c
@@ -339,7 +339,7 @@ static int wm8505fb_probe(struct platfor
 
 	fbi->fb.fix.smem_start		= fb_mem_phys;
 	fbi->fb.fix.smem_len		= fb_mem_len;
-	fbi->fb.screen_base		= fb_mem_virt;
+	fbi->fb.screen_buffer		= fb_mem_virt;
 	fbi->fb.screen_size		= fb_mem_len;
 
 	fbi->contrast = 0x10;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
