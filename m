Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC14985C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 18:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233B10E381;
	Mon, 24 Jan 2022 17:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DC010E381
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:05:43 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4JjGRD3RtVz9vKMb
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3yqIdwGn-Cev for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jan 2022 10:59:04 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4JjGRD1Ll7z9vKMJ
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 10:59:04 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4JjGRD1Ll7z9vKMJ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4JjGRD1Ll7z9vKMJ
Received: by mail-pj1-f69.google.com with SMTP id
 x1-20020a17090ab00100b001b380b8ed35so217617pjq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBdR4mgm88fr12HVo/ewep9TPqR0vTSvkIZJUoqDnV8=;
 b=i9gwll8Lj0xIystAPGKZPE6qavOR9ipRhN3UOjJAZBL0zM3KdFOuYScCsxjIL5KW72
 mnmvOoi35XlwgkX90lC/GVK8Y5bsuSZXi65LxGsHvNcgieXe0Cnn0I9HugOK75K/Ap40
 +I3jYOQxsiMstiLOooqtHxjBlOXnOw9fzWuqctJCRUEyjHwCC6/nM2vn6wjoN1FuIqQO
 pFXTUxn6gXYd7rcEdP+irCKVGkHe78RM23O4Z9t6421BLl7GpcjJ9aofu/nNpRn5qdYF
 nQSbPgd/GcRvK/eWVUGTpW4vXI7zPkbqp3+BWwcEA2aGlBlOoKL4tX9E6RsEGIpdozLO
 jFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JBdR4mgm88fr12HVo/ewep9TPqR0vTSvkIZJUoqDnV8=;
 b=H6lV/OXvvzkkxPU4Jk2QMalB1+yCUVaU+DA4ZstoXIlZ2D1HO+W9TxexZ5Yc3uxV3M
 p0VN4lA8yYgHnnQhUtgSVMkBsOU16CJgNITwI3MS5h8N9XQWlXAiTjEdGGeW9MlTTc0o
 a0LhOHux96kzKegmFf+gkih+Z6TkNN/mYQLcWdaTzXFquxyjDy2mXsvoR/cDSfJgrEW/
 6nXn0qn/w5Qvx+Ng3xdolLBjkS8kEt7rCabzARNmSCI9s5aABVqDmVCgQHH/VzyODbJW
 WsjAAyRvA5qT/ax435IBYZAmTSSBSuI8GhJggSJYiHVikexi93BiiTZcKeQzDDjdZmA+
 ZmZg==
X-Gm-Message-State: AOAM53301OcF2DJlsbOSK0/YZBWWtqJTqHjJaCCCUDDnjKq1CaITJ3u0
 Hvs2xIlGscTTYLcpNP0t7Cce/mqsLzoC1PLTWznBgdPiT1T3F+FpsXpBTgvXVxKX8LOr526s46C
 1AR2/IT6+jqtpB6Ct9e/+Ypn8wylSydww
X-Received: by 2002:a17:902:a502:b0:149:c5a5:5329 with SMTP id
 s2-20020a170902a50200b00149c5a55329mr15059191plq.164.1643043543447; 
 Mon, 24 Jan 2022 08:59:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx153Lwqmcm3ClgP1FVJyLtTuU1uOlM4S9H5l1vuihVakSp4Vk8HYPmRXyyQQ13l5bkmxsCkA==
X-Received: by 2002:a17:902:a502:b0:149:c5a5:5329 with SMTP id
 s2-20020a170902a50200b00149c5a55329mr15059179plq.164.1643043543198; 
 Mon, 24 Jan 2022 08:59:03 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
 by smtp.gmail.com with ESMTPSA id c17sm17289913pfc.171.2022.01.24.08.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:59:02 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/nouveau/acr: Fix undefined behavior in
 nvkm_acr_hsfw_load_bl()
Date: Tue, 25 Jan 2022 00:58:55 +0800
Message-Id: <20220124165856.57022-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In nvkm_acr_hsfw_load_bl(), the return value of kmalloc() is directly
passed to memcpy(), which could lead to undefined behavior on failure
of kmalloc().

Fix this bug by using kmemdup() instead of kmalloc()+memcpy().

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
index 667fa016496e..a6ea89a5d51a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
@@ -142,11 +142,12 @@ nvkm_acr_hsfw_load_bl(struct nvkm_acr *acr, const char *name, int ver,
 
 	hsfw->imem_size = desc->code_size;
 	hsfw->imem_tag = desc->start_tag;
-	hsfw->imem = kmalloc(desc->code_size, GFP_KERNEL);
-	memcpy(hsfw->imem, data + desc->code_off, desc->code_size);
-
+	hsfw->imem = kmemdup(data + desc->code_off, desc->code_size, GFP_KERNEL);
 	nvkm_firmware_put(fw);
-	return 0;
+	if (!hsfw->imem)
+		return -ENOMEM;
+	else
+		return 0;
 }
 
 int
-- 
2.25.1

