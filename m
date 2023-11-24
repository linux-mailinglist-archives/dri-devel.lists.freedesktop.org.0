Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD07F7041
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 10:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7996A10E7C9;
	Fri, 24 Nov 2023 09:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C36BE10E7C9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 09:42:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5409bc907edso2399716a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700818978; x=1701423778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=to4wr7o29hJLCsI5wEPXc4ZsMUCJc0r7+FdlNSU99fk=;
 b=itS4od9myNjpr5n2y8uMUuBC1ycweLkykkBEZsjxi/3e5GOBQfDTmnuryES0KqqCD+
 SBY/kaRoztFLqdCZL5sdTg7LzeWK61ne1VavXtRFh66l0lOwM9XeOwaqNdpd3FSyQJnQ
 rxnNbUJP+RwRc9YMAh9z6O8YeJTdTKt1ew1e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700818978; x=1701423778;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=to4wr7o29hJLCsI5wEPXc4ZsMUCJc0r7+FdlNSU99fk=;
 b=GrOJpgfDUMF1AMuyX4tSuUYCBRKwvBjR9ORp2sxpOqE075UVx/T5Ak/ykuA88iXgqw
 sniiajGDom8kAEXyUGBkP6dAEtDL/OHdNHKRAG1EgvCy49h4qyk62gMWaetzsg6Pzyiq
 XVdn0660Lnx+F+KXtnpCr8hv5ABhgJP0ULdpdC4FTZDoGFncdkac2L8w0+Xh07SK4QdY
 9eILe8o+LvGJ9mmkT6ThgOZQc1ezWBExel5GvfEGf4TANnQ6qFnRWCMerVKxH20zaspI
 PfB6rMGGSq9CB6tajyOYUWCr0MVBrs/5hhIEMOFzVqtnIrax0RI2/ewv2pAVCCqebike
 f6vw==
X-Gm-Message-State: AOJu0YxOIICyJeDiCT6z0ZiyzsNUtEUHhwVZjK49cL6x7XczLn7OsnS5
 aOdCZ7wE0ECwivsxs4P6EgoT4w==
X-Google-Smtp-Source: AGHT+IH3EXSz81Q3iGLUIaX7f+Td5N1csaSiswyO7wzlBhBwY/rrd8Kphlgy1/Xz60elHfn9o/VmOQ==
X-Received: by 2002:a17:906:2707:b0:a04:c9c4:8fc with SMTP id
 z7-20020a170906270700b00a04c9c408fcmr1544976ejc.18.1700818978131; 
 Fri, 24 Nov 2023 01:42:58 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:7c18:b9c9:f303:f6bb])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170906398400b009fd541851f4sm1847685eje.198.2023.11.24.01.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:42:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix typo in post_disable() description
Date: Fri, 24 Nov 2023 10:42:30 +0100
Message-ID: <20231124094253.658064-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/singals/signals/

Fixes: 199e4e967af4 ("drm: Extract drm_bridge.h")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 include/drm/drm_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cfb7dcdb66c4..9ef461aa9b9e 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -194,7 +194,7 @@ struct drm_bridge_funcs {
 	 * or &drm_encoder_helper_funcs.dpms hook.
 	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * singals) feeding it is no longer running when this callback is
+	 * signals) feeding it is no longer running when this callback is
 	 * called.
 	 *
 	 * The @post_disable callback is optional.
-- 
2.42.0

