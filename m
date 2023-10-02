Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B27B5C37
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 22:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A044710E256;
	Mon,  2 Oct 2023 20:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86D10E24E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 20:47:14 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a21c283542so3176977b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696279633; x=1696884433;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8yKHHDWb85n6v2XkxGoEAyWUoF3CUTukuuv66+Rst4M=;
 b=hq/y/YUqAgfuROY/RLsN119Sf2glJhw07Pe7bXas3mcxf9vYcnwYdLSDO5uPtghcPt
 BvLEARjMjOTKQWPZKKTQVen+xCeSPPFxaNHwkfOGA2sML+v8yDN2NYBl3I3HmUASIU1W
 gufepqipfFl8XKL+ecX02mBQ6ggW5UzJHn3XTHBQatOi7COvvT71mp8ZQI4EipqILeRT
 HxJsFuLoFjETBUa50zm/PqQ12OJvpL/jkpWWEnOqa6HKSmVhV6snYBM98jK+JQF7XVCA
 r2mSJbOzE9cvzZ62nurmCQj9lMPsdnH4J6wtkLCPAe/8xpDM8SNn5mYgGGdyRYk3XAMf
 Q6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696279633; x=1696884433;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8yKHHDWb85n6v2XkxGoEAyWUoF3CUTukuuv66+Rst4M=;
 b=RXdCgwKI44f95azhFVAek8Y+g3SMJnMMPGy01lhWKKPz3RAvFe58f19OXhpRZi1CGc
 aAMPEkLsmb6nWXRTiXtZpc5Fq6dORxwDskd5i6A7enQ4SeU7HyckX2kWrkHLF4lBw/LS
 nkvsa3S7z/0DE6ixw6WSaVOjHZiQu2vFPN6b8Ctb/eCTTu1nwjutAzTo3LuMFaUK4qUi
 cpfTqo0WdQD6o6vEo5mQCoryvpEK6qwrP2EWbh9sv7zg/1OKQnzOcEcB+C9TCLsrtCn2
 Ymcd0a4/rL0M23KM2gHWpLWbEsbb3Qma85CFJbaf0TffPW7qZgBPVgBwnGEdnjE6Xkj/
 dwqg==
X-Gm-Message-State: AOJu0YwTo/gNOcqF8IfNvtowu0pCtSLAuVxz4zOnEaILuCK1PdJglOu3
 qYYsiNcA6fKyzmxWs7nhiEd8gdhdTrLki++y/Whr1UPxZ0YySsKEocdo/FHxkFqLuaRivNmFFAa
 5AWebwUjLGgpCjcEyso4EsUWxk4av1g3f8hBAskr7UE/TdUDTm6ZW9WagNKnjXeE/r/9N+QSdll
 zl8ElPKg==
X-Google-Smtp-Source: AGHT+IEvotb0E5ph3Ae7fHDCFXWdTosepd+2CVLjv2QWi7FncyHFSks+fQ+kxfdvHpMiWSy9mCLY5F/W7D1bF3k=
X-Received: from ntsirakis-x.c.googlers.com
 ([fda3:e722:ac3:cc00:dc:567e:c0a8:d4])
 (user=ntsirakis job=sendgmr) by 2002:a81:b612:0:b0:59b:edd3:fdab with SMTP id
 u18-20020a81b612000000b0059bedd3fdabmr214716ywh.4.1696279633135; Mon, 02 Oct
 2023 13:47:13 -0700 (PDT)
Date: Mon,  2 Oct 2023 20:47:09 +0000
In-Reply-To: <20230816045654.833973-1-pceballos@google.com>
Mime-Version: 1.0
References: <20230816045654.833973-1-pceballos@google.com>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20231002204709.761089-1-ntsirakis@google.com>
Subject: [PATCH v4] drm/i915/display/lspcon: Increase LSPCON mode settle
 timeout
From: Niko Tsirakis <ntsirakis@google.com>
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Niko Tsirakis <ntsirakis@google.com>, Pablo Ceballos <pceballos@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is to eliminate all cases of "*ERROR* LSPCON mode hasn't settled",
followed by link training errors. Intel engineers recommended increasing
this timeout and that does resolve the issue.

On some CometLake-based device designs the Parade PS175 takes more than
400ms to settle in PCON mode. 100 reboot trials on one device resulted
in a median settle time of 440ms and a maximum of 444ms. Even after
increasing the timeout to 500ms, 2% of devices still had this error. So
this increases the timeout to 800ms.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9443
Signed-off-by: Pablo Ceballos <pceballos@google.com>
Signed-off-by: Niko Tsirakis <ntsirakis@google.com>
---
 drivers/gpu/drm/i915/display/intel_lspcon.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index dc1b35559afd..92536482e657 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -116,6 +116,18 @@ static enum drm_lspcon_mode lspcon_get_current_mode(struct intel_lspcon *lspcon)
 	return current_mode;
 }
 
+static int lspcon_get_mode_settle_timeout(struct intel_lspcon *lspcon)
+{
+	/*
+	 * On some CometLake-based device designs the Parade PS175 takes more
+	 * than 400ms to settle in PCON mode. 100 reboot trials on one device
+	 * resulted in a median settle time of 440ms and a maximum of 444ms.
+	 * Even after increasing the timeout to 500ms, 2% of devices still had
+	 * this error. So this sets the timeout to 800ms.
+	 */
+	return lspcon->vendor == LSPCON_VENDOR_PARADE ? 800 : 400;
+}
+
 static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
 					     enum drm_lspcon_mode mode)
 {
@@ -128,7 +140,8 @@ static enum drm_lspcon_mode lspcon_wait_mode(struct intel_lspcon *lspcon,
 	DRM_DEBUG_KMS("Waiting for LSPCON mode %s to settle\n",
 		      lspcon_mode_name(mode));
 
-	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode, 400);
+	wait_for((current_mode = lspcon_get_current_mode(lspcon)) == mode,
+		lspcon_get_mode_settle_timeout(lspcon));
 	if (current_mode != mode)
 		DRM_ERROR("LSPCON mode hasn't settled\n");
 
-- 
2.42.0.582.g8ccd20d70d-goog

