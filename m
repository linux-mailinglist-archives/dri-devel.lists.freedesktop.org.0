Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EFFD24C3B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0007B10E75A;
	Thu, 15 Jan 2026 13:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="GQ2qcCsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 80511 seconds by postgrey-1.36 at gabe;
 Thu, 15 Jan 2026 11:44:44 UTC
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60EA10E74E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1768477481; bh=y6VrF4Za0raEZ52PTPyePgXcUH9BKajjpCng6MfGweE=;
 h=From:To:Cc:Subject:Date;
 b=GQ2qcCsDoNeRvYAyDI4fZg50HAibWK7gAeQ9BL1jhLlTpDw32fV2IL7dslbRALuc5
 AvBfIq7JDCv1ZH8eQMtAgzS02ycTen/wiDKFK0GdGwP33URgpsNTR/F5LJnDYt6MSV
 A/+C2T2sw/M1Rc+n17yIvMTB8zjvvGGhBjo83gqA=
Received: from p920-station ([36.112.3.233])
 by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
 id AE21F2AA; Thu, 15 Jan 2026 19:43:34 +0800
X-QQ-mid: xmsmtpt1768477414t0581ev2q
Message-ID: <tencent_61DE7E67353314A9E6D9235E496274A19108@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznG9y1WXflpakRLhPEdJM6CC24k1K8pKPbzx83qnI1wUIBKPRtUX
 8HtcxhmjFckby+jXHXZYtqKS9k8PNRCuCzuMGf7x4xVJ57Ccrt5rDT2TxP+vCjU41BGzOPLBtdVM
 IYfe3qO+OIyYlr5jnPQkACCW8FthNiAms9SksMvwspUTc19vTG7j+ceReaMuIv1AWlWKlxUerx/6
 my+mWaM/YREw+8Q7SXVXR2ju4e+tL/j50NcZrZCwYSJxbwWAjquOqzrqOAAvg4My9qoR00+k3NI8
 hKZjemtW2zkAjnGpJwfqinExEFmwOFrzgx6lpddxjwKzpp5WV79SgUFl55+KhmzdO9vbOl/t+Ryq
 Y7S/UgFGh3qSPIge4y+7yRod/Ag3a+CLtzUbOukqffI0qdgT3w/WBiUbKIe2nN0TuMGU2RSS5vW/
 EEhYl9DxagUoTZRYWvej70KGIMTfNcmpP29ND8Sg97+SF6HC0H8Oks+0/GwmH6onmqMEjtUb3unL
 auU/A3+xxGmqXta8lzt63SOUrqJ/fXK4sbhGmSxMeqCXiTw7oqididWs72RHeLYj+4vuY5qjxlry
 dhfjB4OnliIbPgrOwqqeI4cg0PoMYctA3feJqUqsFRdE5lpd4GjHPLtJ3EugjpMLNjIH2gZ6PAcS
 561PGN3P87xV5wLbC8Qca2ryyAtCHTscNBn2vfVQlFYnp2p1X+46mb9ZoIULoIC+qEjN2ZE4/j41
 qzMnf/NVSqsCXLYaUL6qT10uA7DFnBwfmoUH5ulIjFz7j/QJegsmvi7ijNh3QjKrCMX6kbDk1IP6
 LKrEXKOf0HWMiUnvKpvZp639DiRv4LacCzenPSsH6sl4xIPlYRc0q5f3TadctQA4gvv6x9gPnJBf
 4a/NY8KMTYD1Orx5k63daT8MuPcnqPJ2u2eki0JvDN2XM8fcB1u7G3pdxsPp/7JHZ9PZkdX7eikZ
 ITOe1BQGp/YdKrg9AHG7wKONAvjh7BiU69NVzwdVCn9RpPc6KKdeBI7AljS2Z8p/3npN30P/DqwP
 wFoYFdHlroOWO8VwFGF90C+bXV87g3xo4OTijt+Kfn4mOxLCOGqoS1lzLfRZ+Pu6vZ5DHFQ9JpMn
 rdhIoB3+GgyEq9EbUNY801t52ml1K2gdxcmqadQjIJOzovebg=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Yang Zi <2959243019@qq.com>
To: alexander.deucher@amd.com
Cc: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Yang Zi <2959243019@qq.com>
Subject: [PATCH] drm/amdgpu: Fix NULL pointer dereference in
 amdgpu_gmc_flush_gpu_tlb_pasid
Date: Thu, 15 Jan 2026 19:32:09 +0800
X-OQ-MSGID: <20260115113209.937726-1-2959243019@qq.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Jan 2026 13:39:10 +0000
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

The function amdgpu_gmc_flush_gpu_tlb_pasid() can be called before
adev->gmc.gmc_funcs or adev->gmc.gmc_funcs->flush_gpu_tlb_pasid is
properly initialized. Check it before calling to avoid NULL pointer
dereference.

[   41.700098] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   41.701028] #PF: supervisor instruction fetch in kernel mode
[   41.701875] #PF: error_code(0x0010) - not-present page
[   41.702534] PGD 15a62067 P4D 15a62067 PUD 0
[   41.703135] Oops: Oops: 0010 [#1] SMP KASAN NOPTI
[   41.703767] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.18.0 #3 PREEMPT(voluntary)
[   41.704869] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.17.0-2-2 04/01/2014
[   41.705962] Workqueue: events amdgpu_tlb_fence_work
[   41.706635] RIP: 0010:0x0
[   41.706975] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   41.708155] RSP: 0000:ffff88800bd9fb68 EFLAGS: 00010246
[   41.708768] RAX: 0000000000000000 RBX: 1ffff110017b3f76 RCX: 0000000000000001
[   41.710007] RDX: 0000000000000002 RSI: 0000000000008000 RDI: ffff888015a80000
[   41.710920] RBP: ffff888015a80000 R08: 0000000000000000 R09: 0000000000000231
[   41.711817] R10: 0000000000000200 R11: ffff88800bd8a4e8 R12: ffffffff86e05be0
[   41.712630] R13: 0000000000000000 R14: 0000000000008000 R15: 0000000000000002
[   41.713475] FS:  0000000000000000(0000) GS:ffff8880df7ce000(0000) knlGS:0000000000000000
[   41.714425] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   41.715128] CR2: ffffffffffffffd6 CR3: 0000000015cdc000 CR4: 00000000000006f0
[   41.715994] Call Trace:
[   41.716297]  <TASK>
[   41.716571]  amdgpu_gmc_flush_gpu_tlb_pasid+0x226/0xa80
[   41.717204]  ? __pfx_dma_fence_default_wait+0x10/0x10
[   41.717867]  ? __pfx_amdgpu_gmc_flush_gpu_tlb_pasid+0x10/0x10
[   41.718555]  amdgpu_tlb_fence_work+0x12b/0x200
[   41.719117]  process_one_work+0x934/0x1740
[   41.719616]  ? __pfx_process_one_work+0x10/0x10
[   41.720179]  ? lock_acquire+0x14e/0x2d0
[   41.720649]  ? move_linked_works+0x1a6/0x270
[   41.721203]  ? assign_work+0x196/0x240
[   41.721688]  worker_thread+0x5d6/0xe30
[   41.722172]  ? __pfx_worker_thread+0x10/0x10
[   41.722711]  ? kthread+0x17c/0x6e0
[   41.723160]  ? __pfx_worker_thread+0x10/0x10
[   41.723691]  kthread+0x3a8/0x6e0
[   41.724121]  ? __pfx_kthread+0x10/0x10
[   41.724602]  ? ret_from_fork+0x25/0x470
[   41.725115]  ? lock_release+0xd4/0x2f0
[   41.725590]  ? __pfx_kthread+0x10/0x10
[   41.726072]  ret_from_fork+0x382/0x470
[   41.726541]  ? __pfx_kthread+0x10/0x10
[   41.727027]  ret_from_fork_asm+0x1a/0x30
[   41.727526]  </TASK>
[   41.727813] Modules linked in:
[   41.728225] CR2: 0000000000000000
[   41.728652] ---[ end trace 0000000000000000 ]---

Signed-off-by: Yang Zi <2959243019@qq.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 869bceb0fe2c..138f9dd1eac8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -732,6 +732,12 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 		return 0;
 
 	if (!adev->gmc.flush_pasid_uses_kiq || !ring->sched.ready) {
+		if (!adev->gmc.gmc_funcs ||
+		    !adev->gmc.gmc_funcs->flush_gpu_tlb_pasid) {
+			r = -EINVAL;
+			goto error_unlock_reset;
+		}
+
 		if (adev->gmc.flush_tlb_needs_extra_type_2)
 			adev->gmc.gmc_funcs->flush_gpu_tlb_pasid(adev, pasid,
 								 2, all_hub,
-- 
2.52.0

