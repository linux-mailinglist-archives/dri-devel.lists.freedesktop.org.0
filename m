Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3621E517481
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EDF210F0C8;
	Mon,  2 May 2022 16:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80E810F0BE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 16:37:44 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d5so20239622wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjkQ0JRQZyD+wsFR0t4oPn4rUlqhN8HCr5sJCzpjRmE=;
 b=XRFyPBX826gX+6Sf6EdgjzVcDAEC57cWAnpTUJSiNbTAuYlcDJqotYTXcL4OCIZhKK
 rGrruKwqySetpI5UYY3c8MrVsrYSkCQLOpxEzdboo9Q3r0Nlqe0Xu6KecryhvSGhaa53
 /ALxzRnKwxCTsSUwi/t+VQAtFWy5YxseyD5HM/82srioDn+fYu6wEihksTJo4ja5Ahyt
 5aTJtt+xiPZ1jQwB/Z137YFORgQkslcu+pdrKfbC5AEvSmvA5ShFJfsbwdOD6aix9GVg
 9jwEfBxqiry31YlDKCDDNUjfPrZyXALr1nE9yv5ntYzzHvYbRz3QDLkMwnTv7gCUSx6V
 q1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjkQ0JRQZyD+wsFR0t4oPn4rUlqhN8HCr5sJCzpjRmE=;
 b=udWK8LGZ3vCMXzDLzqb0CqwCvV1YxhiLJtB8ZZcz5zR3ME5ILkkgAduxNLhWKWaV+/
 v61hQvBhN9d8Ws4gdA0bwP9poPFJz6l6qXhn4UjTdIreifaz+mBeKZiyIqIbdxdZRMHp
 RKPgW+8cL+ZkdH49/SlulDq5nRSmfCxETM1XaleG3Dj7Hav7RrTNDfqUCdX5zZm9W/Dg
 oOSclPIOnoFWEHdTQN7vd2SSLM1DHhHFRVOf2Wgoo+ZMP86KMoImAsccyZEpDI7MBwUF
 JdL5oqqMfWNMksyZRLrwhKpCTqUa2yWnh9aTE6bphqc9OYtfQZ5mqfKmGigPrzdDLHTv
 t7Yw==
X-Gm-Message-State: AOAM5331pHMLWBeicZX98eSDR9fmC//7rTd1zE4GKibtgIiW5BTiW2on
 7CywgnY7DB7wZdwDumglzDc=
X-Google-Smtp-Source: ABdhPJwIO4JMf3a/FHinF4NCDxZum5bVjIfSGJInrAQPVDJEyndnzfd420zGEtBXfAqSUovvsyyOEg==
X-Received: by 2002:a05:6000:2c9:b0:20c:64c9:4b7a with SMTP id
 o9-20020a05600002c900b0020c64c94b7amr3727596wry.325.1651509463426; 
 Mon, 02 May 2022 09:37:43 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfaa0e000000b0020c5253d8f6sm7294694wrd.66.2022.05.02.09.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 09:37:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, jason@jlekstrand.net, daniels@collabora.com,
 skhawaja@google.com, maad.aldabagh@amd.com, sergemetral@google.com,
 sumit.semwal@linaro.org, gustavo@padovan.org, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, tzimmermann@suse.de,
 tvrtko.ursulin@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 11/15] drm: add user fence support for atomic in fences
Date: Mon,  2 May 2022 18:37:18 +0200
Message-Id: <20220502163722.3957-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502163722.3957-1-christian.koenig@amd.com>
References: <20220502163722.3957-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the DRIVER_USER_FENCE flag is set we grab the user fence from the
sync file instead of the normal one.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index e2112c10569b..d1b13657e2ae 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -517,7 +517,10 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		if (U642I64(val) == -1)
 			return 0;
 
-		state->fence = sync_file_get_fence(val);
+		if (drm_core_check_feature(dev, DRIVER_USER_FENCE))
+			state->fence = sync_file_get_user_fence(val);
+		else
+			state->fence = sync_file_get_fence(val);
 		if (!state->fence)
 			return -EINVAL;
 
-- 
2.25.1

