Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F9403AA4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 15:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB286E1B3;
	Wed,  8 Sep 2021 13:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C236E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 13:29:43 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m9so3349132wrb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XjrP9ZzhQJ+e+hcJu1FOzffiGL+wQHhjOtJ+irWXxqA=;
 b=CW9Fxmw/0iFWRvrRvoG64Krkwl/CAcVVOjCCwYAoQ6ZXk0ySycwm093jClabXj0hO7
 Gqfc2zqpStLrStfff9tzTsaR9LSF2PBEufUQ9d4JXHtMxGpaBGEQo3qOHH/wvfBxaiQU
 zVA77YKhXreJtfoxo4JV3M12WIMDLW//qbCyeUkevVg9C1KBjZ05GlbkLH4CFAI/k6mA
 O0+vC2e1YKlSeAhMJKdY6s9/QGMHmTMPO11/OKv/0dFMbbNr/onEXykEsCjraZaKHdDl
 71krkeYALZOVXQ6jC2pqJzQWVN+tVq/dbtDBa2jUHw10nd8LZrO8y2uQ+aFTI1J/fViS
 9C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XjrP9ZzhQJ+e+hcJu1FOzffiGL+wQHhjOtJ+irWXxqA=;
 b=LYnRlgBcIbBOZzKWbVIEhw6ZsDrsp1yWI07u4PtRHTKI4vxdp3jKficz1vbjln/52x
 EigCTefxGrD1MgcJzOMRwvRk8f5zVIi4o7Qax94oKMuzIPfmKImEY4XZKACdHV2Uvhwn
 xeb9TU+d8n0KtamdL0RM38X4thiotfML2Q03QfuqAcF4YTcQsT7lNMQVccbJUu1xjJ+7
 7kKkDnDf+CWIH76jNF8okEv2LoM++r8oju5TSSfsNs3far9VHXoPjesXc3xzURyVta7e
 orEAx4ejhIv+Fqqtrk5XfKjfa9ZNoksbjOCG4SS8Y3rcRAlfsMvM/h3U3ZPOA2+uaFgg
 E4BQ==
X-Gm-Message-State: AOAM532W4WrSMZwH/ei9DU8774edGkUM+wxqV3kcxclbWFa09Q5Wqy7f
 MOqAQrfAkEqN+xDtncJKz3KCManp/45ePIUB
X-Google-Smtp-Source: ABdhPJzPOcPiRsxOpfiJom5uQHyWEv/RvT9x5//vh7vyehIZmhTlaR9sHNEEyyf3gEZFEBBCLz5xYQ==
X-Received: by 2002:a5d:58e2:: with SMTP id f2mr4106867wrd.272.1631107782381; 
 Wed, 08 Sep 2021 06:29:42 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 k18sm2138959wmi.25.2021.09.08.06.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:29:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com,
	daniel@ffwll.ch,
	alexdeucher@gmail.com
Subject: [PATCH 6/8] drm/ttm: enable TTM placement kerneldoc
Date: Wed,  8 Sep 2021 15:29:31 +0200
Message-Id: <20210908132933.3269-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908132933.3269-1-christian.koenig@amd.com>
References: <20210908132933.3269-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the last remaining warning and finally enable this.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/drm-mm.rst    | 6 ++++++
 include/drm/ttm/ttm_placement.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 66d24b745c62..1c9930fb5e7d 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -43,6 +43,12 @@ TTM device object reference
 .. kernel-doc:: drivers/gpu/drm/ttm/ttm_device.c
    :export:
 
+TTM resource placement reference
+--------------------------------
+
+.. kernel-doc:: include/drm/ttm/ttm_placement.h
+   :internal:
+
 TTM resource object reference
 -----------------------------
 
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 8995c9e4ec1b..76d1b9119a2b 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -58,6 +58,7 @@
  *
  * @fpfn:	first valid page frame number to put the object
  * @lpfn:	last valid page frame number to put the object
+ * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
  * @flags:	memory domain and caching flags for the object
  *
  * Structure indicating a possible place to put an object.
-- 
2.25.1

