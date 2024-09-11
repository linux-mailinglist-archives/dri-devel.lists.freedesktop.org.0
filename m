Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BE1975A56
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BAD10E555;
	Wed, 11 Sep 2024 18:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m+3W095t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEAE10E555
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:25:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42cbb08a1a5so414665e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726079121; x=1726683921; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TxR+vNB93ufPg0Y1ZRk8v4VwhhNXPxM1gxuKsa+d6/0=;
 b=m+3W095tKCWwLQq8POb7EVDN0Ukgjmta+DD4uAG4ZTnmSDootOEpn0afRYFicMLVck
 Ifl39bXLRgmNL2E96nvj+uvl+X7gpt/A//Qmzh0Nb2EzOJTorfScxi6ei/PbmHQlAi5U
 clxnibgIiJX3u4/aL8fRSBPiQo2d4kQdw/UBrXXDfDTH8VI6DEvIpMdH+oaK40BhY36H
 bycJiDLA4/nBYUXFP0qetQ+zLa0QbgLvb68lg81O3L0sEn7DFxT4/f0O5qA9wmhhTFpB
 5uMyChdbUOEiLuu2a62+c//kvvqiUg4hggfEm73/9bpy3acdyRWPeEZw6xWlUC3Y8tK3
 rVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726079121; x=1726683921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TxR+vNB93ufPg0Y1ZRk8v4VwhhNXPxM1gxuKsa+d6/0=;
 b=bozhbExKaxTxY6y9kDemnNm1uxkmoiEk9NfnnbOwrZ9UD2AZbrv7ObkcPGzzdSn/4u
 gc//GoKOS8sHFnkaD0y45oR4YsD6CJPpp0lyZrdLNHNqTu8aCRLpLzwFIgW8D5x231vN
 jDck3g0+STpK6fQbezsFL8If327q/fHnou1lNoKR3eXQeGFwcH0QwfdcgSiWGDE4hSzh
 uWwttscivAJDL11ELgGkRCWN69X3zNOFmphZrvSo1yz0sTuWDFNiw+u5UC0U97ar4ZH6
 sUCj5MvmWeBCIithIg0KPFGwzy8IgTCenI63mAVdoLm0L18MQ5Dz+Vdza7YfvCEzp9aO
 yYQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAuEJXXIPUttYF+q005QzCpC6Sn6RTJ+G+KS0jniZDUmi8LoMWjxQSUxd67OUP+pGN2bBxvITnNKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6B+G0Gz+5hbEFDO6OORQgYnrkfiIssM0mCG0hII8UkD8PfYPU
 PbeeSNOfFIo7zVlwVcw6QdYYRkFZhN90jlZZfEdLesTh83WZaCfB
X-Google-Smtp-Source: AGHT+IG6EBJS+D/O14RGqyVdq3Z1OqN0oOzz6xJGseNGrMXdlv0fn7sOAFcf/NaC2Z7Gh++8z1XETA==
X-Received: by 2002:a05:600c:45cf:b0:42c:a802:540a with SMTP id
 5b1f17b1804b1-42cdb511f33mr3768055e9.7.1726079119903; 
 Wed, 11 Sep 2024 11:25:19 -0700 (PDT)
Received: from void.void ([141.226.10.46]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cb099acf6sm146736855e9.9.2024.09.11.11.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 11:25:19 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Andrew Kreimer <algonell@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] video: fbdev: Fix a typo
Date: Wed, 11 Sep 2024 21:24:37 +0300
Message-ID: <20240911182503.3600-1-algonell@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Fix a typo in comments.

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
index 9a7253355f6d..cdb1dedca492 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi.h
@@ -351,7 +351,7 @@ struct omap_hdmi {
 	bool audio_configured;
 	struct omap_dss_audio audio_config;
 
-	/* This lock should be taken when booleans bellow are touched. */
+	/* This lock should be taken when booleans below are touched. */
 	spinlock_t audio_playing_lock;
 	bool audio_playing;
 	bool display_enabled;
-- 
2.46.0

