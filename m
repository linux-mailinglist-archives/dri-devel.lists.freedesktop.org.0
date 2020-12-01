Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A62D2CB6AE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEF86EA19;
	Wed,  2 Dec 2020 08:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE026E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 16:06:36 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z7so3464199wrn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 08:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i0Ly3AyPwRSgdImxMRiJvKPZQgtpObwO+Bsm+GrcHAk=;
 b=L80O96zmRbNY9ns+OCs4fZxA4XcF4tHVHCmBfhoA3JEqu/hkIStIpQBSGCtgVt044b
 xURf2z4gpUezN10Lzoyt2fQk6CKNOgbxXQJfHm5C3vjcvWFO2wC9cGZuH7q1Mi7acpvN
 3jZK/Gu/bRrtVlYh3z4+xo6dd4sXK6kuEEGO7A3i9dxYlwHTUWZ3F/HqdIjHThMJsDQS
 tm5RRpE/FankH0CDnZHrPLzFw6YveoNzP9skl1Zy9W4ih6XMMXXVlwnl8cnMpLWzE3rQ
 M560Rj1SNPfcRkJOPrdQ4bQgxoTlLz8KGD1ftNiP7ERJrJuqSfb5K+Ndw2wV1gf6DkeP
 VuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i0Ly3AyPwRSgdImxMRiJvKPZQgtpObwO+Bsm+GrcHAk=;
 b=SeilKxrNV6E0QTcWf3hVYadsRWqJ0IBMjWrzUpnaFAwKzbR3/nqWynKRPNsxN+6QIg
 uspEAhsLLvNMFeK5WDSM0QVLRa6H+2euWiqgdK+xSCjXlghv/iLlHZ8/jahtBRhdM31T
 Xo72pZPWD1+Xr9kIuu8UIv23E69Ozy7dMzyXsLic1cE/szgaanoSW28tOGUMp5yixzil
 unBn4lIvqM3Rh69jKzLijZsA4cwtFnpXVDxhKytgReJ7xzhh1pBSq0F3Lt/RdZrkA9b/
 nTEeUApGS17Vj5sKS5+UR9G0iaESea80n1BYhAp0cptSCjVJB/SlF+rbsmHYb1+n10OU
 uTCw==
X-Gm-Message-State: AOAM5326FoJ0BLmiUyq5cO+IhOtxI1RlxfXGY3EhbuxGraqqdA6G8w0m
 GRDy8uYO5L/Gc6llhW0G6I0=
X-Google-Smtp-Source: ABdhPJxIorEeXg4QWzKZfUXDhKNBgK/gpBwQfoPPRP3R+5XLR5k+6iaUZcXlu66EPchU7SnGne6rUQ==
X-Received: by 2002:adf:ecd0:: with SMTP id s16mr4616537wro.415.1606838795155; 
 Tue, 01 Dec 2020 08:06:35 -0800 (PST)
Received: from localhost.localdomain ([170.253.51.27])
 by smtp.gmail.com with ESMTPSA id w186sm450467wmb.26.2020.12.01.08.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 08:06:34 -0800 (PST)
From: Vicente Bergas <vicencb@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v3] drm: rockchip: hdmi: enable higher resolutions than FHD
Date: Tue,  1 Dec 2020 17:06:13 +0100
Message-Id: <20201201160613.1419-1-vicencb@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch enables a QHD HDMI monitor to work at native resolution.
Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60

Messages like
dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 148501000)
and like
dwhdmi-rockchip ff940000.hdmi: PHY configuration failed (clock 241501000)
were present and still are because of vop_crtc_mode_fixup in
drivers/gpu/drm/rockchip/rockchip_drm_vop.c
but this time the display ends up working fine, just after an extra delay
of a few seconds.

Changes since v2:
Just add the strictly required frequency for backwards compatibility.

Changes since v1:
Use alternative clock rounding code proposed by Doug Anderson

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 23de359a1..e1515d55b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -148,6 +148,10 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 			{ 0x214c, 0x0003},
 			{ 0x4064, 0x0003}
 		},
+	}, {
+		241500000, {
+			{ 0x0040, 0x0003},
+		},
 	}, {
 		~0UL, {
 			{ 0x00a0, 0x000a },
@@ -173,6 +177,8 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 		146250000, { 0x0038, 0x0038, 0x0038 },
 	}, {
 		148500000, { 0x0000, 0x0038, 0x0038 },
+	}, {
+		241500000, { 0x0000,                },
 	}, {
 		~0UL,      { 0x0000, 0x0000, 0x0000},
 	}
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
