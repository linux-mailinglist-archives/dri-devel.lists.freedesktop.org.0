Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D64B5580
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188910E147;
	Mon, 14 Feb 2022 16:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Mon, 14 Feb 2022 16:03:14 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FB810E147;
 Mon, 14 Feb 2022 16:03:14 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id ADAAD203CE;
 Mon, 14 Feb 2022 15:55:45 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com
 [217.182.113.132])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 79F52267CF;
 Mon, 14 Feb 2022 15:55:42 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id DAE5D3EDEC;
 Mon, 14 Feb 2022 16:55:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 3D7CD2A35B;
 Mon, 14 Feb 2022 15:55:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eU2a3EGzd8VZ; Mon, 14 Feb 2022 15:55:38 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon, 14 Feb 2022 15:55:38 +0000 (UTC)
Received: from ice-e5v2.lan (unknown [59.41.163.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 25D67424E6;
 Mon, 14 Feb 2022 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1644854137; bh=1GTF2NsHj3ZBXPclibNh2/lJMbhULqnyJD2XKSlxgps=;
 h=From:To:Cc:Subject:Date:From;
 b=MEnyUJ7Nm3KnigPQI7oVCwI98sdJmq0MHRKMeTZ8mVcFZzeQWQ6e0CCzXAvhEtmt+
 uqKSIXH1zqBWApUv9R6O+wtSdXfdxHm8QaGL3cXh7xqNtMe19pTAuLoaa+Hz1qKgJi
 Ma11SBIxtadPwNA8athuskRw8rP4x96XO3TrroKI=
From: Icenowy Zheng <icenowy@aosc.io>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau/bios: Use HWSQ entry 1 for PowerBook6,1
Date: Mon, 14 Feb 2022 23:55:18 +0800
Message-Id: <20220214155518.2980270-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Icenowy Zheng <icenowy@aosc.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On PowerBook6,1 (PowerBook G4 867 12") HWSQ entry 0 (which is currently
always used by nouveau) fails, but the BIOS declares 2 HWSQ entries and
entry 1 works.

Add a quirk to use HWSQ entry 1.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index e8c445eb11004..2691d0e0cf9f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -1977,6 +1977,13 @@ static int load_nv17_hw_sequencer_ucode(struct drm_device *dev,
 	if (!hwsq_offset)
 		return 0;
 
+#ifdef __powerpc__
+	/* HWSQ entry 0 fails on PowerBook G4 867 12" (Al) */
+	if (of_machine_is_compatible("PowerBook6,1"))
+		return load_nv17_hwsq_ucode_entry(dev, bios,
+						  hwsq_offset + sz, 1);
+#endif
+
 	/* always use entry 0? */
 	return load_nv17_hwsq_ucode_entry(dev, bios, hwsq_offset + sz, 0);
 }
-- 
2.30.2

