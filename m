Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDD54D20EF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B8310E2B2;
	Tue,  8 Mar 2022 19:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C408710E2DE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:07:28 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so189837pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 11:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5rO1oO6v5AYtlUIb5c5k5sSAJxVe6/hFwowLpNFVz8=;
 b=a5FYsP3lRV8nsb6SRNtyoS9NpKLoe+GwCurekXFoQoLg+sq/JtVsNwZubbdkHnUDME
 Fmty33ZKNRRMDCAzrMb+Lti8+qMPUwtbcLU5rMAeDEpExmdgLiGJRZzYgr9oSS7Y5YEK
 xUQCi4pJW7nOcpSOfGoucudIXQHscZYR09WH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5rO1oO6v5AYtlUIb5c5k5sSAJxVe6/hFwowLpNFVz8=;
 b=GrTnKrmlQ/BZMr+EBq0xTfaZqgU9e1sEwI2DxfUZSeDYZ7mJn8gAoQuP01OXl5Fy2e
 dJnDN5I8lUEynZAOozQmNdGnVx+5NwEQsyNNQUl5fN57oVSUHLSqou7K52LZdPd1V+0X
 38jpBT5WB3/SlNNVm3kKbOxoVlgZQw0ch52ovWX5JgND7o+ZgXzC4ITtwawRxj0TArIn
 4Je/BG0gbppXvve/LP5ih1xcQtnyoyUUHav842HXFlYkLJ+nt+MvliRAButMDnY7jbxm
 1xwxtg6OFjAWzXNrsVkWn7/JdTGZoZCkZMNFsE5789d2Prkdt8Qz9q7PF28Mlouz10I1
 I4Yg==
X-Gm-Message-State: AOAM532FO/4ZZEGJgibtQjeBqDNDDroWKxaYU7dHvvBUCRwk30SF2hO0
 ermPR2SxtooGBgmQO+SPBzAo4YHLszsea6bV
X-Google-Smtp-Source: ABdhPJzQLapgtK0EmHqlzuH9s6sGWfyMEf6/zWeN6bjRhqQp0pLIeBLU1GnaNTaKVDIckb/AOeqQLw==
X-Received: by 2002:a17:902:9681:b0:150:288:7440 with SMTP id
 n1-20020a170902968100b0015002887440mr18466980plp.166.1646766448080; 
 Tue, 08 Mar 2022 11:07:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3cfa:63e6:3098:9d0])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm2270762pgf.5.2022.03.08.11.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 11:07:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: Add myself as a reviewer for the TI SN65DSI86
 bridge chip
Date: Tue,  8 Mar 2022 11:06:58 -0800
Message-Id: <20220308110615.2.I4485769d5b25a8096508e839b8fea12ce7b836d3@changeid>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
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

I've spent quite a bit of time poking at this driver and it's used on
several Chromebooks I'm involved with. I'd like to get notified about
patches. Add myself as a reviewer. It's expected that changes will
still be landed through drm-misc as they always have been.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a73179d55d00..7d25d0b4dccc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6284,6 +6284,11 @@ DRM DRIVER FOR TDFX VIDEO CARDS
 S:	Orphan / Obsolete
 F:	drivers/gpu/drm/tdfx/
 
+DRM DRIVER FOR TI SN65DSI86 BRIDGE CHIP
+R:	Douglas Anderson <dianders@chromium.org>
+F:	Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+F:	drivers/gpu/drm/bridge/ti-sn65dsi86.c
+
 DRM DRIVER FOR TPO TPG110 PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
-- 
2.35.1.616.g0bdcbb4464-goog

