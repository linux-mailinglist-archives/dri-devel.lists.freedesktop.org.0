Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5648B8A4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B21210EEF1;
	Tue, 11 Jan 2022 20:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3C10EEFB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 20:27:21 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id q25so1064482edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JA9Co5U2tIE6KwVr/0iXV99rXhug6KMSYVn4Rxf2Thw=;
 b=A/2cnQov6Gdngxwo9bKxJjpTLtVJu9ilr8iCaS/5wyBVItvfYCB8JJ9ahGHVyf6Nve
 L5GMmFs5vc+eJbk/s5cWnPYeL6D8pgJIDUSdVICh1bIJSsHSY5A9oD10YhWWIYIPjs9u
 qKEGxg58t91GoZOyyluqnGrfFg9tjDxWWaBRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JA9Co5U2tIE6KwVr/0iXV99rXhug6KMSYVn4Rxf2Thw=;
 b=1ZtpZMCnfleUuTSDy3bQdgG7Tbbh+nNffdwgnB4SkWkOZ7ty1b4/lMLFBomqRvs3KA
 TZ09LAsn3j3B5Kk7tsjM2Rbe1CaihPTpbzlyWz5fd45XJGap+D26W60ZmrKHTofSn8vN
 OfKCKgzmISz5/CrnbV0cKs8LZTijCvAhcHsuSS7BGueHOekPoL4gDj8IZ5xGX8TAxD9h
 iuGDZYwkIG3Q2ZF8zwGsROPN/ylsWA9/z+GJh7XrlbLL+TpUrc0OENx+WkAwC+a50wKo
 6YeNeSm7pJOw0DfejcBPFS9RlcY2YaI48sFzSQHJqz94griBeuQzsz0cxkjJ7i9i3mKe
 bTSQ==
X-Gm-Message-State: AOAM530POZ/sY/fKuZ6HN/ZJVxF0NH8U1GrwWLxTNFLxnwg4Ge9JZ/eU
 d0aqFsGHnS1h4JS2nTX1sPWN9HSY6w3dqw==
X-Google-Smtp-Source: ABdhPJw/4AXWgKJZp9Fu3TN/Fv7VV+l6kjYze3o0jUO6Dyo3V+IKkJgXH7gkJo2sCO4Q4KNI4nZGXw==
X-Received: by 2002:a05:6402:b58:: with SMTP id
 bx24mr5896278edb.414.1641932840413; 
 Tue, 11 Jan 2022 12:27:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hd16sm1322475ejc.62.2022.01.11.12.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:27:19 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/doc: overview before functions for drm_writeback.c
Date: Tue, 11 Jan 2022 21:27:14 +0100
Message-Id: <20220111202714.1128406-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Otherwise it's really hard to link to that, which I realized when I
wanted to link to the property definitions for a question on irc.

Fix it.

Fixes: e2d7fc20b3e2 ("drm/writeback: wire drm_writeback.h to kernel-doc")
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/drm-kms.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index d14bf1c35d7e..6f9c064fd323 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -423,12 +423,12 @@ Connector Functions Reference
 Writeback Connectors
 --------------------
 
-.. kernel-doc:: include/drm/drm_writeback.h
-  :internal:
-
 .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
   :doc: overview
 
+.. kernel-doc:: include/drm/drm_writeback.h
+  :internal:
+
 .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
   :export:
 
-- 
2.33.0

