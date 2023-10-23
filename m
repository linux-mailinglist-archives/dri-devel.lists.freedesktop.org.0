Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA397D2D79
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC51D10E198;
	Mon, 23 Oct 2023 08:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2EF10E198
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 08:59:38 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99357737980so479535966b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 01:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698051577; x=1698656377;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VbdXqKvA2Y0zCIBWONAIVfrMXAjxSoe95dhuJargRKw=;
 b=RVdVv9I/h9/To3apHlRSNt7yc6coEKIHqLvRaj63eReRiGz2m4r+YyF+R0Y7xUlV2U
 0mVCxzA6k+kIh5T/XVQ2EGZh34noiedJlQ5kQuRzNACcgjMnKnsZJ8qLkc6pf4GQ6ZQY
 iGEPo7LCB6SBuJlmds0d5aHRmJVYYPXcBJ1lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698051577; x=1698656377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VbdXqKvA2Y0zCIBWONAIVfrMXAjxSoe95dhuJargRKw=;
 b=uS9w5uXUk/PI/hfW8kLZk1W3MzhjGl89ZC6kFlq3DE2vdtR1CWo11N1nvBHCj09zyj
 tx3pzjxIw6xFtWXaooRgLNEY3zzurxO4XixbJ6w4nVbJUQdYX7wI01lvZpgwZlv4G3/t
 NVBIxJekcAM3rftpjKp+xenPjNZzffMVnbocwQdWvn9mTwLXToR2rTLTIC8ZOJ0zTRXA
 wSTSrsVrMZxtUGPdhcWj7H2a9PAaGq/m45tBWt9sDm2NK82HUyWaRlHymATJ/kxb3VC3
 XVJIpByEM++Ed1aLh78G+mxyTVbwHdeq25y+h4jNwRtHdlh41PnPKM68DzDi0hMkg42I
 fpgQ==
X-Gm-Message-State: AOJu0YzqELHYxzwPXfea2iwNj9xKKfQchBxQJITTANb/Ps8vbH2+UTgj
 Ql7kY6Ki2Ov1IjrUS5rEVbO96Q==
X-Google-Smtp-Source: AGHT+IGbg5QcU0DjrvPCObdFUlShdpICf56Kh9iholS/vlhdNv1ZfG7Ejps4qYeKELnBRssKzwAjVw==
X-Received: by 2002:a17:907:1b0a:b0:9a6:1446:852c with SMTP id
 mp10-20020a1709071b0a00b009a61446852cmr8053693ejc.27.1698051576727; 
 Mon, 23 Oct 2023 01:59:36 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-79-45-223-184.retail.telecomitalia.it. [79.45.223.184])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a1709066bcb00b009be14e5cd54sm6268332ejs.57.2023.10.23.01.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 01:59:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: fix typo
Date: Mon, 23 Oct 2023 10:59:20 +0200
Message-ID: <20231023085929.1445594-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace 'pack' with 'back'.

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/vc4/vc4_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index f3763bd600f6..8ac9515554f8 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -588,7 +588,7 @@ enum {
 # define VC4_HDMI_HORZA_HAP_MASK		VC4_MASK(12, 0)
 # define VC4_HDMI_HORZA_HAP_SHIFT		0
 
-/* Horizontal pack porch (htotal - hsync_end). */
+/* Horizontal back porch (htotal - hsync_end). */
 # define VC4_HDMI_HORZB_HBP_MASK		VC4_MASK(29, 20)
 # define VC4_HDMI_HORZB_HBP_SHIFT		20
 /* Horizontal sync pulse (hsync_end - hsync_start). */
-- 
2.42.0

