Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B941367394
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4656E9E1;
	Wed, 21 Apr 2021 19:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0CF6E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:42:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w4so38786347wrt.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=prbsc0FyNObzI+Wvj3P6FznlVAvE0zjRobacKBhitVA=;
 b=TA1TfJKHBEZIrBxpR53G5eOoISpEKxuSiMYvlHmHfvOn4KpnIsZBkWt5u5KBadT55G
 emnfZBDEEgeVmcit93tfkq3uOvwyIJreSWA0P4Y2NIJtZqiNbchrNomB+73rdUxKUwJD
 igfT4UVzD3jPXClgg/1jrNpgORohlP3faxxKubgEUa69hKZw9ptqE8SBB0z3KnZvJrbG
 GXSTFs2NAHSZ1+zE85j4+sqo63rTL2JmFsoyGdDiTnSE+1zawQe91Ivnqfn4S2jFMdxp
 cepJ1VAnZk4MBzvN3JOAOVJhZ77zsDUFPl8i5QXdEdzCDRA90HU4+kYWcJeEq/vrDpvL
 jb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=prbsc0FyNObzI+Wvj3P6FznlVAvE0zjRobacKBhitVA=;
 b=lD8PswgxCC7lBIs+YtjUMw266fE1Z4Ig/ndESwnjHbhLndqhxaJzPemlM/Jkm1r665
 3iI5HWTS3IpHkFjBoZx4HBiG5sYayX3pkbx3tl3PRKtmzXnTDv5vWXuyh4z7WASowdNu
 WzPMrhJAu6fYwLzVD0tYC9iNmVsa4yBEYIp8vJ1B3VofinJ1mw6ctxraqM1wa82DLGU+
 QT/09ZD9mLCoOzahcBsQIexHu3YtYDLtos4EFB9+qki/dpXghMaIxjGiQG1PVgHMwcOs
 jjIRiRdAQlpYo9dfH/Qa2WsKztPuXIpPRn7tdCfBDcIKSSxLiY5f+2a9WJbid20IhavW
 jPPA==
X-Gm-Message-State: AOAM532gpMiIaTJvZbUFntpSglXnkqO57hIuqxTpC8JdEajUHiQaP0cv
 UMznvy/PVZTNX9nql9Zi3r4=
X-Google-Smtp-Source: ABdhPJx6yLbiq5abH25qv20sKnGJQ9F1yfiFlHebIXRV8dHW84eJQOMVJKyF3fMyuhKVZ9695EzjGQ==
X-Received: by 2002:adf:d0c8:: with SMTP id z8mr29435342wrh.68.1619034173663; 
 Wed, 21 Apr 2021 12:42:53 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 o4sm484163wrn.81.2021.04.21.12.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:42:53 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/3] drm: drm_atomic_uapi.c: Use tabs for code indents
Date: Wed, 21 Apr 2021 20:42:47 +0100
Message-Id: <dc8286f5590fff609f924845fb622dd5f962a11b.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove space and use tabs for indent the code to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 268bb69c2e2f..438e9585b225 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -78,8 +78,8 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 		drm_mode_convert_to_umode(&umode, mode);
 		state->mode_blob =
 			drm_property_create_blob(state->crtc->dev,
-		                                 sizeof(umode),
-		                                 &umode);
+						 sizeof(umode),
+						 &umode);
 		if (IS_ERR(state->mode_blob))
 			return PTR_ERR(state->mode_blob);
 
@@ -114,7 +114,7 @@ EXPORT_SYMBOL(drm_atomic_set_mode_for_crtc);
  * Zero on success, error code on failure. Cannot return -EDEADLK.
  */
 int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
-                                      struct drm_property_blob *blob)
+				      struct drm_property_blob *blob)
 {
 	struct drm_crtc *crtc = state->crtc;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
