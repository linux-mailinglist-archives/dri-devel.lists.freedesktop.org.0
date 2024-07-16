Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED3933141
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D2110E868;
	Tue, 16 Jul 2024 19:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ET9UCIJl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567E010E845;
 Tue, 16 Jul 2024 18:59:32 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f99d50c1a6so8672639f.0; 
 Tue, 16 Jul 2024 11:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156371; x=1721761171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gp+X7P7M2G0wGzmEuARHD4YdNz5MLe60OdfLiwoM2pk=;
 b=ET9UCIJl5QUa40vE1g4O7e/yrVSKC3yjAy/HF6GcFr4/dmZluPxi7saTX3qYo+2tSh
 giHUKTa9xO0d6ChAXE3evKCNSttdeA/Gl2LD7Vn63ZLyFn71A4rgtlr/Lrc/G/HobHZt
 7ja0l1A135YSgcX00GJuSi6mJDKMO45p4TUvu9EiGbQeCvrCLjSu2v659DFrizat5FXX
 BY92f7Q+/gnooa121N/k2Q3j9WUvZFh6DZBY/an47qApMnaeUaLA7xdEhJUywWJNhIQT
 gc2FNzQS/yyIRriukZ0hQ0aKBNEWMX8APB2jRmZ4FmDlubwOh80eqG/k10+25dGV2bbM
 WNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156371; x=1721761171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gp+X7P7M2G0wGzmEuARHD4YdNz5MLe60OdfLiwoM2pk=;
 b=RHbQ3ZEOqWpgjov7UtBgRp8pdT7tXeXZ0+nnPEpizruqis7wsRKgUiJ7b7Us5Z1m+a
 F+nxYA7ouYa1cX0QJ2rIgu8HRi4eQts53neUJAddL1PIB7DOUrD/ZY5/MZDKYQCtTzwH
 cAbaZowfeGwKczlG0Es1gcHxe1iTUeUWgGsInNYgoOfqS3NEli17UJ9B5gVtjdnP0u9/
 oDmcSnKZWpTrcQBd9FuKQI4f52PVsh7NamLmIWFs0qYDK3ufzGI8ur+nd0NC9TGxZ9cy
 gnrjF80tbGEb86DmmOK+ZbBQZVL13y9xdGe3kxSIfV0LnVcujVXUVUk8WvR6bTRiE0EY
 Yz9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMHDc5O4qwKi9sY+8qY0R513fVD1LdF6d+/b6LgHfS9IfXrqtF/ThIaGnEzi02Ypq/yv6KGSmYKpGmWQ0zMtmV6h5k7cR/E4s+ZIBiZ54TlgY935Vjh5mWKDgTmeAtlY4s83KGAVHA/Jo2H8Sl0cF9dXydebp3iDQ0N3nb/vfvmM3MlZbZJFoMKlR7KMEBA87xyMVKVxKCo6iEsAJLhycBGFZIAOgd86661MYjvpXcSlFbCm0=
X-Gm-Message-State: AOJu0YyOvgpWJ+rvMyrjq/+OU5BlUjAkm26G6PmDVlX+KbblsMF9vug9
 41jU9hK0br9KBxm9ZGBkXimHbt9skmHZxrsXzHNqWeGrieDeR+dm
X-Google-Smtp-Source: AGHT+IECS3LE4CQlGR6D3c9f2we0UYXUMv74VI2oB5R/1GanbhvcHcS5G4efhI9oRo+zYRzuj4p1RA==
X-Received: by 2002:a05:6602:14c6:b0:813:f74:e6df with SMTP id
 ca18e2360f4ac-816c51c790bmr46646439f.15.1721156371575; 
 Tue, 16 Jul 2024 11:59:31 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 52/54] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG
 un-BROKEN
Date: Tue, 16 Jul 2024 12:58:04 -0600
Message-ID: <20240716185806.1572048-53-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

end of official submission.

Time for some quality CI

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index d0aa277fc3bf..c508c0834641 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -56,8 +56,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.45.2

