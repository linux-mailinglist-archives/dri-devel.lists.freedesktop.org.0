Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6D3897FC
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 22:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5C56EE86;
	Wed, 19 May 2021 20:35:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0526C6EE86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 20:35:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id y14so13272706wrm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eCG6g9vnsV5mVrNbPu9Aj3xE5jJrcF1SJW4LgqoH9w=;
 b=Y5DGmtFFbz3Ryg2DZyMzNdfcry+XnVGFtjQSW4+r3SxbzZjgcd79hV607ejaeCWVM+
 nbgAZMJOL3xe2lgv3dwjHYjiq5zosKyng8KPkf86xsAlbCXnUciQfayX/wY7SEG1Os9i
 qotEYn2MPNdjsOFOxBWydl6rhGxpSeXS4DqA/Iw8odbE/NPxclZ5r6VBmSHvzAOFjlfF
 5jpWOXQKVLnOrU7FpYsCua++XmPPpzhav4NyVDKlY8XQqf9B1hXTU31i+4MQ8xrWQdcX
 2j1riyzqbNR+ABkfZkDm8YxPm1JF+8d7eb7gmyVHL+kjTGvUSRsPwAOQ/6tCwhpTVlvJ
 EwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eCG6g9vnsV5mVrNbPu9Aj3xE5jJrcF1SJW4LgqoH9w=;
 b=at/NypIArY9quEzY9FwQEVABl4aupkgP+NIvbk93tLXXFN4L6CtVgAEr3xeRSi5LpF
 XY6xHepLE53OMgaieVloOslTmm45CLu6KYbqN6nc2aXltmyu+WT5Q/buLiXBbhu8EX8t
 +qfdRan2R24bz/ZD8GTEi4+mKbsO66ZDH2jO9w9yQJ56GI0nGLHEu95eDQsNIp+DkqeC
 oz9eOWwHgXO5r+brk4S+j7gTLQujRlj8FCd5Rvm3CcO3rOO1Xi5TqndA40eTB+C/bbhw
 nGFQ/tldDErtNaNSGetKcbuW8MCuHnRh3TCn/sCbcaVvkXWG5zwO1EXBD2q9sLCL9byL
 PqIA==
X-Gm-Message-State: AOAM5330LTOJ0y5qM41+0l6y1eqfsUufqCgINZFYNsy9Bl/zVabdWTj6
 VOkYNIbIMrFXR7VdCxIzKRAYjA==
X-Google-Smtp-Source: ABdhPJzESLwfBMc9nNVsU47ZKg8uSf8qzju6eU94c/V4fey4BkTdnKjPMoNoe9J6EvDojjlNgjjc3A==
X-Received: by 2002:a5d:45c6:: with SMTP id b6mr727972wrs.333.1621456554751;
 Wed, 19 May 2021 13:35:54 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id y20sm7531918wmi.0.2021.05.19.13.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:35:54 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, linus.walleij@linaro.org,
 robh+dt@kernel.org, ulli.kroll@googlemail.com
Subject: [PATCH v2 2/3] ARM: dts: gemini-dlink-dir-685: Remove address from
 display port
Date: Wed, 19 May 2021 20:35:46 +0000
Message-Id: <20210519203547.837237-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519203547.837237-1-clabbe@baylibre.com>
References: <20210519203547.837237-1-clabbe@baylibre.com>
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
Cc: devicetree@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The address and reg adds no value to the port node, remove them.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini-dlink-dir-685.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini-dlink-dir-685.dts b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
index cc39289e99dd..2eeb142b5464 100644
--- a/arch/arm/boot/dts/gemini-dlink-dir-685.dts
+++ b/arch/arm/boot/dts/gemini-dlink-dir-685.dts
@@ -492,8 +492,7 @@ drive0: ide-port@0 {
 		display-controller@6a000000 {
 			status = "okay";
 
-			port@0 {
-				reg = <0>;
+			port {
 				display_out: endpoint {
 					remote-endpoint = <&panel_in>;
 				};
-- 
2.26.3

