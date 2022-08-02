Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8914587F6A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08126904C8;
	Tue,  2 Aug 2022 15:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B138C10F41D;
 Tue,  2 Aug 2022 15:51:34 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id u133so7275112pfc.10;
 Tue, 02 Aug 2022 08:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=UyEXg/3ai9YzpZukbK9CvD9ZVPgJH40NoiJi5Axn4y3jSqW1cVHKtbMxI8kAGkz53D
 LMuhDKxpOjOcozuAxu+omHCrBQapma1xG9OjqziQIEQJILB8Gb7HXpr30omM4CR9PTjh
 OUM6SRhfgVFlyYvmuj936u8lIRPUO4RVMF8ZzsOR/6lZYLqNWfUfIarEO9KAS2j2r7S2
 lzFxOHbEfqRkfSpHCsRrLtSkCip/4uEAHYkz1CdsFmnTGG+WpWu6ZSKAZ6BTIpBkUE+c
 5pP5pupwqxkUO6Xy1sGGZe0DzvJf0+Li27xCWpeeyhTrfOTz2dzkZVjUTyN1WTRNKZw9
 2f0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=4TbOfcqFkaHon89dsPDId7NNakdXJT5mDYYEM5ZbQu4=;
 b=6rGfQZAghUOHtJ8gyhG+FjpzGjobfdYzvjHvQ83kfeDTaTcuyo1QQM1fkXwFWAjeVb
 soUOgHZSTB44rLXIjDKFghxwBBe/bV1UAkgtxXbpLu1QDm+GIFPdhyzO7Jtb+K54m5OH
 iAxTq9VsmavtFQW9bI6w0I8uCP+WOK3IepNfUunO9QTgbcHdplbMFF3oZk43HRkhkbuS
 nvm2tSnw1ZzMJaSBSgvkrLiIp3n6TtsVeq9uE3Zb4PgiBVikDYEsFC/8KYvwAjZDt3vY
 07kYnF471MQr8cmjNozRpQ60HZSdcbG5kfiyy/q34mQ+YLBtwdy2pun8CERyeBFE/BRm
 vV4w==
X-Gm-Message-State: ACgBeo2h8hujPRKK0l/YnIDPiWdYxRWg4i8tGUjzHAA4xstp2LUZ2AXD
 XMhOlxsa958JEuqlJvUUwXTpu2SDTEI=
X-Google-Smtp-Source: AGRyM1s0NU+nmxXJRj8gxCaZl5yCJjQc3jGxLXaMIsICaXH6zKfyNT1ow1l63tJAMkwWopfrltWwkg==
X-Received: by 2002:a05:6a00:10c1:b0:52a:d621:138a with SMTP id
 d1-20020a056a0010c100b0052ad621138amr21568328pfu.67.1659455493900; 
 Tue, 02 Aug 2022 08:51:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a170902e88c00b0016bff65d5cbsm12146299plg.194.2022.08.02.08.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 08:51:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/15] drm/msm/gem: Rename to pin/unpin_pages
Date: Tue,  2 Aug 2022 08:51:39 -0700
Message-Id: <20220802155152.1727594-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220802155152.1727594-1-robdclark@gmail.com>
References: <20220802155152.1727594-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since that is what these fxns actually do.. they are getting *pinned*
pages (as opposed to cases where we need pages, but don't need them
pinned, like CPU mappings).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c       | 18 +++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h       |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c |  4 ++--
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 97467364dc0a..3da64c7f65a2 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -177,30 +177,38 @@ static void put_pages(struct drm_gem_object *obj)
 	}
 }
 
-struct page **msm_gem_get_pages(struct drm_gem_object *obj)
+static struct page **msm_gem_pin_pages_locked(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct page **p;
 
-	msm_gem_lock(obj);
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 
 	if (GEM_WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED)) {
-		msm_gem_unlock(obj);
 		return ERR_PTR(-EBUSY);
 	}
 
 	p = get_pages(obj);
-
 	if (!IS_ERR(p)) {
 		msm_obj->pin_count++;
 		update_lru(obj);
 	}
 
+	return p;
+}
+
+struct page **msm_gem_pin_pages(struct drm_gem_object *obj)
+{
+	struct page **p;
+
+	msm_gem_lock(obj);
+	p = msm_gem_pin_pages_locked(obj);
 	msm_gem_unlock(obj);
+
 	return p;
 }
 
-void msm_gem_put_pages(struct drm_gem_object *obj)
+void msm_gem_unpin_pages(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 0ab0dc4f8c25..6fe521ccda45 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -159,8 +159,8 @@ int msm_gem_get_and_pin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova);
 void msm_gem_unpin_iova(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace);
-struct page **msm_gem_get_pages(struct drm_gem_object *obj);
-void msm_gem_put_pages(struct drm_gem_object *obj);
+struct page **msm_gem_pin_pages(struct drm_gem_object *obj);
+void msm_gem_unpin_pages(struct drm_gem_object *obj);
 int msm_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 		struct drm_mode_create_dumb *args);
 int msm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index dcc8a573bc76..c1d91863df05 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -63,12 +63,12 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach)
-		msm_gem_get_pages(obj);
+		msm_gem_pin_pages(obj);
 	return 0;
 }
 
 void msm_gem_prime_unpin(struct drm_gem_object *obj)
 {
 	if (!obj->import_attach)
-		msm_gem_put_pages(obj);
+		msm_gem_unpin_pages(obj);
 }
-- 
2.36.1

