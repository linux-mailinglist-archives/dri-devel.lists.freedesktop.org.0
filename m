Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A9A790D82
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 20:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE4710E1C5;
	Sun,  3 Sep 2023 18:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE2910E181;
 Sun,  3 Sep 2023 18:46:21 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-77acb04309dso37719439f.2; 
 Sun, 03 Sep 2023 11:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693766780; x=1694371580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A7euIhAUxsBgqAycWxnasjxETI8zYNC1RLZ3qD73WsM=;
 b=enwkai3t/rnjxv6OiAhe+NzNvbQ0abppn5KbHTT2Fb7VUMxvxR1qmf/d9NRntx4uyz
 s+hlxSuE/w3X4gEP+Y/zClA0io5G3iYL4CEdbAcVXjYISufpudQORggvqxAmSEFzP2hf
 0AbmlPYXPWBrEuVTSfvY3wqCICxvp/AGwROddGTvEtvYOjekkZMvuGYnVR3QB48tjPqT
 bnvRxgTEMZvKweTkv575EhZahX1ltLdEXJICripIYD4i9hgocTmUmpijAp7oFeQk1DvL
 fIawQlyGG98ccNMppXRm6ya61Nl+YffwtdlfNph7j56p+12ZxH4rfxlsbyrow709L/wC
 WBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693766780; x=1694371580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A7euIhAUxsBgqAycWxnasjxETI8zYNC1RLZ3qD73WsM=;
 b=Y4fDiSKZavQkdPcRrG9V8+gX1wyPhGphmckgFkAAfzDxsBbwzuSwVuymcPDmddJypw
 ULj4KjNcHXkkDUHbUDpTY7wtc9DAre1DnjmsOGb82wA6sb1NNeHidL7S/ZY2+rTQ0wVd
 g+BoGQUkmZ7uq7ppInGlTc5Z0/+69oruHHBkZUR+/wyiYjQRZaopygvLE2l6ojQ9WjBw
 kotLet7MHm5LatqOiLUvUU2ZlgVHvvuOJZrI+y5pZzUhehiWDuf431aBM4eeyx7Wdppt
 M5HzyifRoyyLLU8XFsmFQgDjHVoxxQzl3ywZ5TlMFMo+5dxfs6MLs0yXHM9oDqsijroO
 H04w==
X-Gm-Message-State: AOJu0Yzq1p7YQ1BbCsbxcv6/4fhognwItkyqdZYkh5egfZjy+TSqvd7H
 04ktxEX30yfmMtNC/+Kjmg3K42O+jx7eYA==
X-Google-Smtp-Source: AGHT+IFezAhzBe8bHNafQV2ls3Rrm07SEuvb9e6ZJAhZmonaPCE5ktQ5RYLT+3Q1JAWulfB2inkf2w==
X-Received: by 2002:a6b:5103:0:b0:792:9333:2cbf with SMTP id
 f3-20020a6b5103000000b0079293332cbfmr9837914iob.6.1693766780607; 
 Sun, 03 Sep 2023 11:46:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 u9-20020a02cb89000000b0042b37dda71asm2519968jap.136.2023.09.03.11.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 11:46:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm_dbg: add trailing newlines to msgs
Date: Sun,  3 Sep 2023 12:46:02 -0600
Message-ID: <20230903184607.272198-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903184607.272198-1-jim.cromie@gmail.com>
References: <20230903184607.272198-1-jim.cromie@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, Maxime Ripard <mripard@kernel.org>,
 seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By at least strong convention, a print-buffer's trailing newline says
"message complete, send it".  The exception (no TNL, followed by a call
to pr_cont) proves the general rule.

Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.

No functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index bef9d45ef1df..959123759711 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -592,7 +592,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, old_state);
 	struct drm_device *dev = crtc->dev;
 
-	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Disabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	require_hvs_enabled(dev);
@@ -620,7 +620,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 	int idx;
 
-	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
+	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)\n",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
 	if (!drm_dev_enter(dev, &idx))
-- 
2.41.0

