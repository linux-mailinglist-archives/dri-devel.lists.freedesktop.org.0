Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F0312D8AE
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBD489BB0;
	Tue, 31 Dec 2019 13:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC7689BB0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:05:41 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id d5so1171067pjz.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8ue1C52c6GMFo3Ro49/gUAlsKHzYRxfbPWqTGCIbyw=;
 b=JNRNyjPnuWa3Uwbq0Q5tiy7txraP03SundwCX4/YlAxMeSUJ4lClB9jb44eLtO6iRF
 HrhyZr5cz1P8LDTX+KBc7DI8GMWWZ3FX2v3iPLpHt1LvH4grZql1KQkDA45kcp8pSkdK
 TBDBQ2HMrNmRsko3h5ah/l328CIQUspldKC0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G8ue1C52c6GMFo3Ro49/gUAlsKHzYRxfbPWqTGCIbyw=;
 b=TB4K4IAl7uNYKiGMZZ99OzBjVB8X3wPDJOdA5uYnGT5II3ONMmVqSAMfJmUJDOaAHZ
 1CpAJq9o9MIqDciGKaDRzmMZeCMqbu9ARtssoBQNtntmoaIGj9AxLTrGIxhmgBECnsUn
 9QLYQe5nayElHrax4XoFaTz8VreBa3AEy2AeSj8mHrz9KulEr2zfvmyDpX+iUYmqnvfq
 Gvt1rYDecJJd0ERYdIO4qDIuHVl3MoCLmCRekKdmZP+uc6PsOhBznjA5NKpMut4HRsV9
 Q7sNlt7YCLt2gbWyhQQN8tXubwWk68UJorH6dYr1PROIZ9ra7uEdzwU7fboxQbagIGzC
 lbRQ==
X-Gm-Message-State: APjAAAXJAlmdcpege9uHSZnl1wUXJt5AwoPwKly/NTCg1zTQnsk/xpJv
 do6BX/Ds14+oSj0MX8rbmdY9dA==
X-Google-Smtp-Source: APXvYqxXkYxsyd0ZyZlBKsAKlLynOFIBkeSMyKHk4J7/GJzGsj4UxrrFoX57Z2SFZ8ziy3NWHt7NsA==
X-Received: by 2002:a17:902:bf0c:: with SMTP id
 bi12mr47277055plb.208.1577797541340; 
 Tue, 31 Dec 2019 05:05:41 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.115])
 by smtp.gmail.com with ESMTPSA id i3sm55204089pfg.94.2019.12.31.05.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 05:05:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/9] drm/sun4i: Allwinner R40 MIPI-DSI support
Date: Tue, 31 Dec 2019 18:35:19 +0530
Message-Id: <20191231130528.20669-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is v3 version for supporting MIPI-DSI on Allwinner R40 from
initial version[1].

The controller look similar like, Allwinner A64 but with associated
R40 TCON TOP for DSI pipeline.

Changes for v3:
- collect Rob, Chen-Yu r-b, a-b tags
- move tcon top reset control methods into probe
- rebase on drm-misc
Changes for v2:
- drop tcon top lcd clock patch
- add TODO text while adding tcon lcd support
- add patch for registering tcon top clock gates in probe
- change tcon-ch0 in tcon_lcd0 to CLK_TCON_LCD0
- change mod clock in dphy to tcon_top with index 3 

[1] https://patchwork.freedesktop.org/series/62062/

Any inputs?
Jagan.

Jagan Teki (9):
  dt-bindings: display: Add TCON LCD compatible for R40
  drm/sun4i: tcon: Add TCON LCD support for R40
  ARM: dts: sun8i: r40: Use tcon top clock index macros
  drm/sun4i: tcon_top: Use clock name index macros
  drm/sun4i: tcon_top: Register reset, clock gates in probe
  dt-bindings: sun6i-dsi: Add R40 DPHY compatible (w/ A31 fallback)
  dt-bindings: sun6i-dsi: Document R40 MIPI-DSI controller (w/ A64
    fallback)
  ARM: dts: sun8i: r40: Add MIPI DSI pipeline
  [DO NOT MERGE] ARM: dts: sun8i-r40: bananapi-m2-ultra: Enable Bananapi S070WV20-CT16

 .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  8 +-
 .../bindings/display/sunxi/sun4i-drm.txt      |  1 +
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |  1 +
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 37 +++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 77 ++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun4i_tcon.c            |  8 ++
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c        | 50 ++++++------
 7 files changed, 154 insertions(+), 28 deletions(-)

-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
