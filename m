Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFAC61FE3D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1ED10E32C;
	Mon,  7 Nov 2022 19:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F3D10E328
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:09:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 21so19175030edv.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+MffkppYHkSmSA4nl8Gy3Sm8YdjWT2EfbeL1flmpsRE=;
 b=U2TvWf1eWDra2MfZ+i8lC78pWGO43Ex9x9Nhhkp3mJGxq7FYSb8QdJEJk9AwklEanV
 ah9AFd26lvf2X0QXg7NYqYjrN3mQ1THhO9zOwuRbeq7dAvDHq6W5jx0wY+lPha+eONtk
 3hGROwi0EfXOHjPK/qCcLqgqlMdbN09gOzyBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+MffkppYHkSmSA4nl8Gy3Sm8YdjWT2EfbeL1flmpsRE=;
 b=SyjnMjqfGgPTkLvHmqMYWyt2biTi+Bfa2ZcQRgd0etB6C99AoX3FtpbpLHNFqtLqd8
 GX4wovKB8uaqjGQm6zLuG2hpWpw4fIgXv2GZV4mH5aEM5+WGNXaDvcoGFIolfczCKU2M
 hLA2csXZZDP81m5ZFPAEqWLL3HKeebpTBBIfACNOkTCPyrjojLsLmIIt758V7cXQRZG/
 C6xC+M4A9lJnUc0CijbyKz0qk9Ml7AdVke1drC4cGe3wJ9c//kffIRGWL/wN1lBT+Yfe
 vcje0TLwLYvZYTpwWVvuoW3FhIir+s/lWzFOjrQWlC63AhSR9Ikv1YURB1lytdGHAzNF
 vYUw==
X-Gm-Message-State: ACrzQf0Hkvxv0dCP83H1h3THfheCXvd+jKGn/EMGMdn5SmOoOMISe8KR
 zcvl0/LCSJDqPvSFHc0MoIszHu655KfB2g==
X-Google-Smtp-Source: AMsMyM6aAGEJ57fDOZuS8VWjEgk4N5S7Jazlwjrm4fZTd9uohSYBpaqXo85dtoShfxa4LLQpAjSZPw==
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr52085376edb.46.1667848173711; 
 Mon, 07 Nov 2022 11:09:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 cm21-20020a0564020c9500b00461a6997c5dsm4551201edb.83.2022.11.07.11.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 11:09:33 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/fb-helper: Fix missing kerneldoc include
Date: Mon,  7 Nov 2022 20:09:28 +0100
Message-Id: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was lost in the code movement done in 8ab59da26bc0
("drm/fb-helper: Move generic fbdev emulation into separate source
file").

Fixes: 8ab59da26bc0 ("drm/fb-helper: Move generic fbdev emulation into separate source file")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/drm-kms-helpers.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index dbc85fd7a971..a4860ffd6e86 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -116,6 +116,9 @@ fbdev Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
    :export:
 
+.. kernel-doc:: drivers/gpu/drm/drm_fbdev_generic.c
+   :export:
+
 format Helper Functions Reference
 =================================
 
-- 
2.37.2

