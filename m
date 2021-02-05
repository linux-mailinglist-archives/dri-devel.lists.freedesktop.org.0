Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E7310B76
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 14:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FEA6E081;
	Fri,  5 Feb 2021 13:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4586E081;
 Fri,  5 Feb 2021 13:00:34 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id k193so6697236qke.6;
 Fri, 05 Feb 2021 05:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBV1D6Ulmmeg0XD410dqPaIFfUR1ad9jwk0fJwumF/4=;
 b=UYtLnPaRPURQD2DV0MRGsjizexD0di8ASLpoteP2KvUtIa3WtJkzw+uDkUpdlNI+kq
 +X7UpeuknA84xI9v6BUp87wROVah7IGgRlHubZk+wnFfTpzeuxiOHyKIcKsriAt1uGFH
 X4nkvLhYNqllZGeFXQReMtjWS6/L7gQMXhiQv1hKdgnLmZQLK3gjfv8V6QYbmkssXMfW
 4MPf+vSDbkkhsG2lFij1yoIc0/7G7xHu1Qpvv/aesnC1S6l2lrcDL2gjqW4PADahL2tg
 WoBmA0kZARzwHjKyEgMMqlgLkPlihCRv9RKlQjswMZMIrXRz/qMWTXIRBrCT47kSlqjb
 71dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DBV1D6Ulmmeg0XD410dqPaIFfUR1ad9jwk0fJwumF/4=;
 b=Qy3f52E85inltVsCXgvAW97NLVnvB6zobSq76KtmX7Npil9mJHKTXUxyP0suz5LQjo
 +ZjffHLZ0omLhsWRRDi3p5gEvb+LQjN0fFm9Ke6F+r0+ZT2r5jR0zE5Ynj61xey+PjB8
 7DQBKiUhFEPszItEOZckjAF7CtRq8IlsGTUFCiOa7Sdojz+8+jZgtIi9U2fbxbuiTkbO
 /rEOGhk5fA7ZFsjUFu7rtD5aMUlkZdh+hM8eBbzePht7JziI3Hh2BHJm/T1DDcLOVoIL
 9aojzwNk5kAboxhfiMTxatFSV46gdwqh4VGvUzxIg+z/yXPADsIrnWz0jNQkgOFCx+K0
 kIqA==
X-Gm-Message-State: AOAM5319A9YCKxIRjJcc14LHDW22UOEmUOJyKcNUEsyijxGBcbM83XRs
 b+2Zwv52WUtulUspUT0nq+4=
X-Google-Smtp-Source: ABdhPJxrie2UTeqqCE3Vg2D6+dzvEjZzeCzQ3MZFPzh0FksJ4UhzYpjj+t7cqcWPQCb8/suSjM8GHQ==
X-Received: by 2002:a37:8cd:: with SMTP id 196mr3940194qki.434.1612530032227; 
 Fri, 05 Feb 2021 05:00:32 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id 17sm9481367qtu.23.2021.02.05.05.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 05:00:31 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: drm: nouveau: Change not good word with a good
 one in the file init.c
Date: Fri,  5 Feb 2021 18:30:17 +0530
Message-Id: <20210205130017.1429442-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



s/fucking/messing/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index 9de74f41dcd2..bc2a55a82171 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -446,7 +446,7 @@ init_ram_restrict(struct nvbios_init *init)
 {
 	/* This appears to be the behaviour of the VBIOS parser, and *is*
 	 * important to cache the NV_PEXTDEV_BOOT0 on later chipsets to
-	 * avoid fucking up the memory controller (somehow) by reading it
+	 * avoid messing up the memory controller (somehow) by reading it
 	 * on every INIT_RAM_RESTRICT_ZM_GROUP opcode.
 	 *
 	 * Preserving the non-caching behaviour on earlier chipsets just
--
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
