Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A063CB0FED8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 04:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCC10E1B9;
	Thu, 24 Jul 2025 02:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j2j8Ehqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC6910E1B9;
 Thu, 24 Jul 2025 02:36:45 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6facebcd4f0so1103196d6.0; 
 Wed, 23 Jul 2025 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753324604; x=1753929404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rpafgB7TM97IiAPA4skXOQOxYZsSA7fW1d8osuC8fBc=;
 b=j2j8EhqmQZJOW3KR1l5oFaavdzWnr9wGINpT3U6HGde/+1g5G8omv/jVgM1VMG5zpj
 FjuhlW9AjNbxeZEwfzVhMJQPQMEnK5sTcIXwDXkVnSu76ukwP8JJ637MynAPplUDYLWN
 I+dd2oW7yVnhh++HZL1SyGmkwvhsdOGtKnMIYRqeWA0Iw0nVhAI5BFj5CggAu1vUlq+r
 pdupu7x1OEWzVEMdd8VNTMBrwg45v/JjnPKaQ5tvPwx3emfjAPeEIgcX1uWuoyDNqIYO
 0+dtdMdqxJmFfASkKkk5ZapfDWf+AM0saYZGxf05qJxDkGf0KaEkthZ3IIOIOkRjT7wP
 tu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753324604; x=1753929404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rpafgB7TM97IiAPA4skXOQOxYZsSA7fW1d8osuC8fBc=;
 b=dbhIQDdY6bASbwN2xWIM2Zb+vOzy8qaunKctpqgHtlzLl67gxBue2LEHIVJg3LHKsk
 SXj9S0QcZR7Be9mtd0x4zm4n6eLxhPGmb93NCx05rqU2edfJsHXpp2wYzZW2IjEEIJay
 jdGzWVjNhu1VrR2dvMSe0Qfhv1wIc+jUEn00/hcuIRteB0vH1UqW6EfZSx8Sq+YdSUfx
 6oJqXhcQ3uE5/R+uqXFh85doUmpHT13lSZNkIElt0AG6c8S5KftNQQZ8Nn7PY1vbWAmR
 ESABNGUa4Vsq5qjJacyBwrSOSPKw+VLKcVY4e7aZxA9+sua/fByBkoQ0+K6IzQCGoPeS
 WM1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ/lBhRmn+BMQzgb80b6QuIUt+PisM68aiypufcg/bmvWZjSQzOm+6BXn4sRczbRP1AwiUkQLh@lists.freedesktop.org,
 AJvYcCVWSPDKHmMHjdV+Dh9Ixcn3AkzWOE25r6mG4aRZOxlBh7t36wtyqIP5p0xRmUe694CAg5X7oGjsk94K@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynQOWHC84EFvU1JUmSIOQSWXtyQC9iwCt1aEroOoODRaQYvYiQ
 is0Gy/TVx7eGpanLzj6Y+gQEM6qFF7V6pPenqUWXAqXptAFS1WTHV8I=
X-Gm-Gg: ASbGncuE1YF6q9CtwvbFlB0ZMyHTY2dXDvIt3UymIGYjThFKvmWygnz6pOzlgN1wfpx
 exgHEEaTd4erGSaLsFuaAFwEZazNtTmYZOgWY2R369f3FX/TVtMWufe1SHLL7w170SsgoOGs/6b
 yoCz6Gdkf25eaB9eHBliEbXtlen1bHA6HLMejdrpUidzU12VHWWnWx+K/91ZyFRyt+zlpKelDrD
 tIjGW70VQ8R6NNTvhfXlC629ARM+5oO8D3WR0/j82hlsuIJCSPO3GPj/8wZw9qQ1JGeUtbAPV0z
 Bs5ILejiaKWHtk+n94IT7xE51aBtw/vFb2mhkM/ys+WEBCeJVADxW8oBEq5UhNmpok6yWJSreb8
 6B7IoeIWoEldZZHmZ+wc=
X-Google-Smtp-Source: AGHT+IH+P0BUAZebqc5VI30I/89y9eCXqsFCURy/3jl+T3nPNtyKbqO+NJxSPIfO3MLZIv+k6oDqOg==
X-Received: by 2002:ac8:5ac9:0:b0:4a9:e326:277a with SMTP id
 d75a77b69052e-4ae6de519c0mr32351221cf.5.1753324604423; 
 Wed, 23 Jul 2025 19:36:44 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ae7e355017sm4641551cf.27.2025.07.23.19.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 19:36:44 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, alex.hung@amd.com, vulab@iscas.ac.cn,
 Wenjing.Liu@amd.com, isabel.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] drm/amd/display: Add null pointer check in
 mod_hdcp_hdcp1_create_session()
Date: Wed, 23 Jul 2025 21:36:41 -0500
Message-Id: <20250724023641.1258831-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The function mod_hdcp_hdcp1_create_session() calls the function
get_first_active_display(), but does not check its return value.
The return value is a null pointer if the display list is empty.
This will lead to a null pointer dereference.

Add a null pointer check for get_first_active_display() and return
MOD_HDCP_STATUS_DISPLAY_NOT_FOUND if the function return null.

This is similar to the commit c3e9826a2202
("drm/amd/display: Add null pointer check for get_first_active_display()").

Fixes: 2deade5ede56 ("drm/amd/display: Remove hdcp display state with mst fix")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
index e58e7b93810b..6b7db8ec9a53 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
@@ -260,6 +260,9 @@ enum mod_hdcp_status mod_hdcp_hdcp1_create_session(struct mod_hdcp *hdcp)
 		return MOD_HDCP_STATUS_FAILURE;
 	}
 
+	if (!display)
+		return MOD_HDCP_STATUS_DISPLAY_NOT_FOUND;
+
 	hdcp_cmd = (struct ta_hdcp_shared_memory *)psp->hdcp_context.context.mem_context.shared_buf;
 
 	mutex_lock(&psp->hdcp_context.mutex);
-- 
2.34.1

