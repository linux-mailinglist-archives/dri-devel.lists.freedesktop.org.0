Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986A4024CF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 10:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9089D64;
	Tue,  7 Sep 2021 08:01:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26F6899D6
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 08:01:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v10so13088909wrd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6xAjT90CZ5Ae8CXjzPpr92uptQoIMBRYC201bpKU4U=;
 b=pQwmlGQBrb6jPG+iRIZg8ENNUVQfNMwKliizJUd0cTkiQ/f+D9w5OS74wKpJU4IwmR
 fyOqUbJCaFgEbZ4s4D0dcDSZAdD42pFKx34oN7MuM8wgF8z8e3DyUrqxpoG2/FHC2IPj
 VeZZATxycRR5CoMy6g/Dm55cixzDqi5EZvJa7f2o+T3w6L2K8Y/6bh+76bif32WyrGP/
 yN4ZMD542/2Q9w5k2oikQNScVGsb9Xi4EMW6+WbTT5hLhFfd4egCXLHAev9HtU1hThyG
 nAs75yEAan68yP28+90kaJXssKcvayWVhiM17RtPNeAe3XhYktsMtkgph+BQSfmYHcgm
 WnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6xAjT90CZ5Ae8CXjzPpr92uptQoIMBRYC201bpKU4U=;
 b=ajI1l7mBdGRKuX/jlcZzokhA4SGV6xNON6nF3BFKj3j7lIPlSXmD08WUm9TUNpkdss
 FI8GJEQFBbV0pjV4yr9xNSnVsGYUuOvAnf5ceSh3fR2LZ9HREiP6GHuwr13clqU2GVNo
 Z8QmJVUzkXUvwnX5hOhiX83KbTeTly4wrEteL3Dz4CiqyGseg3T1t/vd8RkrGMnMPbnD
 XcyKGpY79FgoyI6Mv4tLDmdvsuisMbjMNJAfLfsic97jNH38Qnyi7VSxqPW02dyyiF+e
 h6nbaAq5wBLNEDPzqmTYunLOPDYnWiTndkyge7jEDDcZM0ihwxEhldv97oAmLiU8fhU5
 5/pw==
X-Gm-Message-State: AOAM530Qdf3VKDygvVtiTOmILM0zZTcUHDLDfPNJEW+mPNgNC9sre1e4
 3ztr7Bs7O9eOmz+opApQekgVVXviPVLpM9KO
X-Google-Smtp-Source: ABdhPJzRPre5MdYIvbEQyz/xlKiZ+smS9ANmEqrzj79HPJdGpyj/QIbN2erq5sr0qvX8kWxd2PKLrg==
X-Received: by 2002:a5d:4dce:: with SMTP id f14mr11212697wru.204.1631001701219; 
 Tue, 07 Sep 2021 01:01:41 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 g1sm2248242wmk.2.2021.09.07.01.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:01:40 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Cc: matthew.william.auld@gmail.com
Subject: [PATCH 6/8] drm/ttm: enable TTM placement kerneldoc
Date: Tue,  7 Sep 2021 10:01:33 +0200
Message-Id: <20210907080135.101452-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210907080135.101452-1-christian.koenig@amd.com>
References: <20210907080135.101452-1-christian.koenig@amd.com>
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

