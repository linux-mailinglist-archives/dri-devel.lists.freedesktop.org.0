Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893B4D20EE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27D10E2DE;
	Tue,  8 Mar 2022 19:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B5410E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:07:27 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id b8so193509pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 11:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxqL9uKmwzsq/dutI/kTwhTRbcQ6LXFSO3B46a+2dh8=;
 b=KDz7sqB/GOy3Rek5x0OSzxb1oJOCtV2TqHyquKOV6tpzO8h03nrC1PoXf0KT6tUcyH
 Z+cjtXV9PZDwwsxVDR3KVKYwtkLCI7vGwl/EwNmG83I+oBuDxEIlZ5mjbrEUMxrUHNJv
 p7g3/JzdIlEcmi16YbX0tUkKP1jX2ExZdmzG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RxqL9uKmwzsq/dutI/kTwhTRbcQ6LXFSO3B46a+2dh8=;
 b=uxUyQUCKvenfTsqB1/Ihl1NPyRJWtn0j/1UYqz1PfEL9UwOsJeYAjljg6kdTY7hwT3
 2wQoPqyLkximacLcmob64hTFS/6enuX7Wk1svv+UoTigyMyfQUzQsItEdO8SpAXra9vj
 x84DphNgjYWiJwlEzSCmkwcRs2WV57PuFPXhmlLmbxH/dzuCUEVW3KUKv8/xkZkqeLPm
 ptTMFJnxf/dkMiRIjK45qpssL9sRy++2OzVbZAcaxBxS+PC6BxcM0YwSEwj7FXGKRB9s
 EHR+dyHoUx+lkCNtzHyGnicSy66V6j90r9LGB2lOGAfFiGJ2NLDf8FRlO/l/jN4Bg4Sm
 2JjQ==
X-Gm-Message-State: AOAM532rUPXpyAreNyntztiM7HHfzCtyx/vjsxxI1owaAps7M7vz4qnN
 8VS1ZPWZSZNvU72xvpee5Sm/cg+yBFsWGP3Q
X-Google-Smtp-Source: ABdhPJxA+5oPyDld/G3OlX7XBq5wkvOiVZlmJJeMLXsbKMgRocJxqbOlw2Tt9xYtPdnzlagw18TATw==
X-Received: by 2002:a17:90a:4612:b0:1bc:d7c2:b2e7 with SMTP id
 w18-20020a17090a461200b001bcd7c2b2e7mr6220103pjg.154.1646766446578; 
 Tue, 08 Mar 2022 11:07:26 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3cfa:63e6:3098:9d0])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm2270762pgf.5.2022.03.08.11.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 11:07:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/bridge: Add MAINTAINERS entry for DRM drivers for
 bridge chip bindings
Date: Tue,  8 Mar 2022 11:06:57 -0800
Message-Id: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bindings for bridge chips should also get the same maintainers
entry so the right people get notified about bindings changes.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0216d2ffe728..a73179d55d00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6403,6 +6403,7 @@ R:	Jonas Karlman <jonas@kwiboo.se>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/bridge/
 F:	drivers/gpu/drm/bridge/
 
 DRM DRIVERS FOR EXYNOS
-- 
2.35.1.616.g0bdcbb4464-goog

