Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D055223F4
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7306B88FD4;
	Tue, 10 May 2022 18:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91C510E491
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 18:28:20 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id p4so14182032qtq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xXStdS/6Ecb3QM+NfwKwg0qrP8dEo54D+TLTJCNtQU=;
 b=oSTgF171IFOwfEXynDmFNdUOlkACxoWv+6GMKX9CSWUKgxxAGgiWWEImQB8LktpivY
 AmRbQ3VoyHMAJoumcQJa4GQGnWzoatgBvdWKP2i9auMTZcYOQ9BIcBZzxGgjr1Rn/3OK
 LdyM+NOco9xY7Ydsenb8gtmkmwLPh9ySNRY94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/xXStdS/6Ecb3QM+NfwKwg0qrP8dEo54D+TLTJCNtQU=;
 b=iAIbNR6SgA44/O8g9C9urzNCVkF/Cm/G0nFGoBP16K0QE1eeR/ka2JCtUc1jBT5mWw
 TSBy2hc7Amk2WRSZOHJx99zi+95a/x0+oEy12/rY1VuGLswpChkaRo5OBH9uZJxDWLPs
 BD7hxMCWtp0wv16FVPtFlfObsGnYCQDy5WZLa0ZXepJqAnF25TIMLAJR+o9/1n15pk+9
 9XX+r4JZbh8eJEdhXJLtzuicM3qA2+JTM1BOE5ydFYt9XheaOKqrflHPHmBwX0ynlseE
 Oh4R6rGttYqHusjSb5gLXkXmNoKJOFeRVe6YYsAyxiDbYc5+Ph1ZGxJ0bvLm3fNXyJuR
 kOKQ==
X-Gm-Message-State: AOAM531jY/oL67XkaAK7gzNWckHjODqfrmNncU7oUpX64fDUJzDEvA/Q
 g33E5Wrueg5NvixjYNC9CwkftQ==
X-Google-Smtp-Source: ABdhPJwh5JavPhYpKz08mTjksCjblRKzyYKZLVzoqxjqLQzYJy+qhKbbe4mJH+/vvFqtue9Asub9yQ==
X-Received: by 2002:a05:622a:50e:b0:2f3:9a86:6e3 with SMTP id
 l14-20020a05622a050e00b002f39a8606e3mr21035101qtx.374.1652207299802; 
 Tue, 10 May 2022 11:28:19 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:314:141d:f589:29f6:2a25])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a05620a109900b0069fc13ce1e3sm8815496qkk.20.2022.05.10.11.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 11:28:19 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: 
Subject: [PATCH] drm: Add a debug message when getting a prop is missing
Date: Tue, 10 May 2022 14:28:03 -0400
Message-Id: <20220510182810.1223574-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
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
Cc: David Airlie <airlied@linux.ie>, markyacoub@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
If a connector property is attached but
drm_atomic_connector_get_property doesn't handle a case for it,
modeteset will crash with a segfault without.

[How]
Add a debug message indicating that a connector property is not handled
when user space is trying to read it.

TEST=modetest

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index acb1ee93d206..36b0f664dd80 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -884,6 +884,12 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		return connector->funcs->atomic_get_property(connector,
 				state, property, val);
 	} else {
+		// LOG that the kernel is missing handling this property as a case here.
+		drm_dbg_atomic(
+			dev,
+			"[CONNECTOR:%d:%s] Get Property [PROP:%d:%s] is not handled\n",
+			connector->base.id, connector->name, property->base.id,
+			property->name);
 		return -EINVAL;
 	}
 
-- 
2.36.0.512.ge40c2bad7a-goog

