Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B3B28ABA3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 04:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781006E1CD;
	Mon, 12 Oct 2020 02:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836CA6E1AA;
 Mon, 12 Oct 2020 02:08:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id g29so12844802pgl.2;
 Sun, 11 Oct 2020 19:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
 b=NKTH6nfrwZXolxNsr19xp4xLaMqJC9vl+SkxxuIj08xFTOkA5Qzo1bMHZREAQhziwj
 v3GoO3qOzxhzJpMo+RT52XP04Yzt73SClT+zSy5b00dhFiI0orS0GmnMqfQlZXoVuD4K
 BqSFzsE60W4zzHrDPGmRkxr+2iQbb3XD8ZVwYMM7GDzBqX04G+FqqIL7m4kDnZGnFQyF
 sU+Qse6hVRV2LdDDKtVtnZEaljK85fZZE3+tBsQGWlvXRUD3+Un6muUEi3VzGjZ6Y2AN
 sGce+NHz+W9mysNXl+iowGg8PE5uz7h17bm5/OOCLkre7pXLggjBqy1gXNaaqIjMqpc9
 LmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
 b=mA2ziJoHubCmbTXSqrP1oC+jh8UPSDtvMJyobdFOxRgP0ceCvXcJ/tsYVdxEG03GNU
 BHvF8quypBKA02pxK2ekI+RDM157RvxV+2YQPu9jRTjPvjwhyleQHXenal8DlKJYBcsL
 stwQaf2qY+h/5MRUjl98pQ/2xPgfYGRqOvOIcxaVFH1kRO3uaAWpRuXPI8rEHOYplXRt
 EAhZgQ2eGEAC4jgUHEIgyFMJ/SI50GxQxYLJE3JaO9V6P/vpjH6jRMJnZwafh3SaCp4I
 BAK3g9MZE6U4tQaLQrE3QRjiG2jTRUybXq1+b84yF7yEULPtFnPTY/mblfiCQyrvXh4R
 Ekaw==
X-Gm-Message-State: AOAM533B1/npM/stqpX4sxWpEw2CoWGUOXmc0bu0l43rv2jTtzjwUrqE
 QN3dhCRfvOhXoPxfvS1f7I4v/1v+iJmOoxAG
X-Google-Smtp-Source: ABdhPJxWDZBEXxg+flabuSNdCK2BFFN1TFGw0NEt/TJwJynQmkjv4qLbFrPiFSZDYIJnIb1rtnWTiQ==
X-Received: by 2002:aa7:8d4c:0:b029:13f:e666:8f05 with SMTP id
 s12-20020aa78d4c0000b029013fe6668f05mr22358227pfe.0.1602468527481; 
 Sun, 11 Oct 2020 19:08:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 ne16sm21118476pjb.11.2020.10.11.19.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 19:08:46 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/22] drm/msm/gem: Rename internal get_iova_locked helper
Date: Sun, 11 Oct 2020 19:09:29 -0700
Message-Id: <20201012020958.229288-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We'll need to introduce a _locked() version of msm_gem_get_iova(), so we
need to make that name available.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index afef9c6b1a1c..dec89fe79025 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,7 +376,7 @@ put_iova(struct drm_gem_object *obj)
 	}
 }
 
-static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
+static int get_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
@@ -448,7 +448,7 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 
-	ret = msm_gem_get_iova_locked(obj, aspace, &local,
+	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
 
 	if (!ret)
@@ -478,7 +478,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	int ret;
 
 	msm_gem_lock(obj);
-	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
+	ret = get_iova_locked(obj, aspace, iova, 0, U64_MAX);
 	msm_gem_unlock(obj);
 
 	return ret;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
