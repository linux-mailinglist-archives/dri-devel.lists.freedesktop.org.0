Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA13CB302
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8726E91C;
	Fri, 16 Jul 2021 07:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F46E8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 01:56:36 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id a127so7493368pfa.10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2McT0l3ZwHsK72Lrfxt3UTYxRxN0nEYR81V1ezUranY=;
 b=ZbP3n2J0qQd3f7hBowB7OyFvD1Tkr5Ji0KJ9SdPWT5RnjBV3KF2bIgi7pKPLJA5cBd
 WPWndEecL5cpPN4c7/tAyLyW8ypzV4CnxtHbK92AOg44CJTQw0hW71ettq8gPEt9+VVd
 p+16hIuFdbj/e9QdZi9GW80qoaAtDY8dSbruq20YoeoZqECxPIMrZPM8a667mJTqxh7f
 bTSYpNvWnjU4wxxY+3w/Qty4hVlKRwYvomKoHIS3U1mt6uqpuYFPN23BgajNvai3TpMz
 iV3Q9xom1WZkTCyKihym4hVpcwIqePytGZl5f/mwxMNzsj+gtD2itMpgfYdY4lyH2L6v
 fzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2McT0l3ZwHsK72Lrfxt3UTYxRxN0nEYR81V1ezUranY=;
 b=KsqvJU+q7SAai8BH1pEYNpw3QAAc8HtAphf9CC+MeilFWaePil8J/rAdo2p838Llfj
 EM9M/fWJ8kYKP8+ir2bqkZdarGuv5Q/xfzlwIqqLKlXFPy1x/i5Lhln/zPAC6JUv8+ks
 9yGZKQL199I0lIX3z0aF8TztyNjKoW7P7SGl7eTuhBgr/amjCeGcaOaKMOLDA28Nt+SL
 o/8GjD+hgTJZvYO9pVhNg7U3gfHlroz9TAKL/3EbK0OKK8V/OjOWOTtHkMF0FqecTa+E
 Ko2Hxnf6vWkgMaIixYAGDAeS5G/JA+KU3ZKJStvtLtX5NThgA7Ru9O6wLseyb/W/kzyz
 3VoA==
X-Gm-Message-State: AOAM531Uu3dVfjvcrp9z2XJQyNWMRU06dJ0gGkYM2HWScBIJlJdT+jEg
 4D5OQ9PQrMzC6qyH0ioBeVQ=
X-Google-Smtp-Source: ABdhPJx73uNbeUzxvkqzK7VLX3g2HdiDbbp1RWhUzTY0m1s27QvLwUNO75sdIEWuMWqbcWlXsdTYUQ==
X-Received: by 2002:a62:830a:0:b029:32b:43a4:10b0 with SMTP id
 h10-20020a62830a0000b029032b43a410b0mr7460786pfe.38.1626400595977; 
 Thu, 15 Jul 2021 18:56:35 -0700 (PDT)
Received: from localhost.localdomain ([52.175.51.83])
 by smtp.gmail.com with ESMTPSA id a5sm7888680pff.143.2021.07.15.18.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 18:56:35 -0700 (PDT)
From: ainux.wang@gmail.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 ainux.wang@gmail.com
Subject: [PATCH] drm/ast: Zero is missing in detect function
Date: Fri, 16 Jul 2021 09:56:15 +0800
Message-Id: <20210716015615.9150-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
X-Mailman-Approved-At: Fri, 16 Jul 2021 07:13:01 +0000
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ainux.Wang" <ainux.wang@gmail.com>

The function ast_get_modes() will also return 0, when it try to get the
edid, but it also do not get the edid.

Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e5996ae03c49..b7dcf7821ec6 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1299,7 +1299,7 @@ static enum drm_connector_status ast_connector_detect(struct drm_connector
 	int r;
 
 	r = ast_get_modes(connector);
-	if (r < 0)
+	if (r <= 0)
 		return connector_status_disconnected;
 
 	return connector_status_connected;
-- 
2.18.1

