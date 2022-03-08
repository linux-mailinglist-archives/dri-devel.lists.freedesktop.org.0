Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780034D20F1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:07:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C18310E307;
	Tue,  8 Mar 2022 19:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0712C10E3A8
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:07:29 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o23so17243604pgk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 11:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dlYDY5S/XDx5NW4Fv9JuxYnsAy3lZY4PrUFXc2DC20E=;
 b=fbl/m/GJ9RguZxpwlYSV73iVjMMe4SNgYzjYZ5vr6QXELRkv49Lq/0CjCTiaoKpMrL
 ByovFxAKsvcuYQPlFu1itELof6n05qGzselHpuASh5uqu7+ATfdTNeZH4fSXDxSoxa9E
 nBCwhki8tMKxh0hgxSop2a6K+DEHC7CN4FKgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dlYDY5S/XDx5NW4Fv9JuxYnsAy3lZY4PrUFXc2DC20E=;
 b=gfIKEyDhM0o+t3hgW6+nMR5KwOlu/0WlP7K/J/J95K4ESUWT09llJWULXprwBhmVdj
 vHLHv1djzFYOU3rkfgcx8eOdt+SxUxVvXvaxa03k1pjG64qA4kJq/ND4svVDPHN1Ixqn
 fMzAMQLk1nFDbm1LyIIcA1/U3Bzm7tOqPx1uYAZwyrb9qCUw0xs7IC6CCahviyX1MMSf
 FBYBagRi5Ccboh+hqdBgT/zRZI5SBBhZLFRia7rM7f/pwfhE17fqMY/OtGkiIHRxI40+
 +cgMkuKqQZi0cMyS9XcdUld3LWMD8HkNKs2dkkK86wvUofHKNoRJ0dw00fxQwZNtNrPT
 AarA==
X-Gm-Message-State: AOAM5325G2Pb/NMJjomIiDmsDK+y5QRfXvHOtsYjM2zv+TPXCq18hJSY
 7el1Il7oztJ76M1+RX9mexgjHUOODMCBdqKa
X-Google-Smtp-Source: ABdhPJxmf8ha/2Xk+EbD6Ae2W0oV8AzDmOjRY6EupaurEZd7CYN60GSz9SGpInxlogA+DjR1c7faMw==
X-Received: by 2002:a63:6949:0:b0:380:94ab:9333 with SMTP id
 e70-20020a636949000000b0038094ab9333mr3176468pgc.199.1646766449359; 
 Tue, 08 Mar 2022 11:07:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:3cfa:63e6:3098:9d0])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a63b101000000b00380989bcb1bsm2270762pgf.5.2022.03.08.11.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 11:07:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/bridge: Add myself as a reviewer for the Parade
 PS8640 bridge chip
Date: Tue,  8 Mar 2022 11:06:59 -0800
Message-Id: <20220308110615.3.I04f99fbcc14b8c09610b4b18f0696c992a44d2b7@changeid>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Though the parade bridge chip is a little bit of a black box, I'm at
least interested in hearing about changes to the driver since this
bridge chip is used on some Chromebooks that I'm involved with.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d25d0b4dccc..db7fe53643c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6171,6 +6171,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 
+DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
+R:	Douglas Anderson <dianders@chromium.org>
+F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+F:	drivers/gpu/drm/bridge/parade-ps8640.c
+
 DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
 M:	Noralf Trønnes <noralf@tronnes.org>
 S:	Maintained
-- 
2.35.1.616.g0bdcbb4464-goog

