Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD711A6D6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257B6EAC2;
	Wed, 11 Dec 2019 09:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA256E167
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 06:19:37 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id x13so988391plr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRavSC33ZtK/7zUsAUhvwvnYf94ej0Wa3q2MGL/7bjE=;
 b=G1irwZRtD6I4pLurc23D+bW7EdIavtCQy5pnDmv2sZKR3/O+cZhA7VkC/0TGO6lA+B
 VhX8LuaIMGiSRxxTbduglep2ElbyfqkuWpYeYldOa9suu+nvv76Z7HLGqTgfMJH/VoqJ
 /jArc5qR+n+7P1pFQZiI63+xOzBPv904pg8q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YRavSC33ZtK/7zUsAUhvwvnYf94ej0Wa3q2MGL/7bjE=;
 b=bk0qVjGWVCvaVZinVniGuKLu3dSJSRPubQS2YKMqkHCtanlMajbxbb+c/xjB1+yEKK
 /xSGo6h5jqAI304/8x76RmmMxiNepE3MFEraMHQ+4v7OdbqXwZvhKtGzfqebYv5TzxoI
 c/xLjucxbNO1fiEhRJno6masgDiuSAzBY5jiXkJ2GYIM6GqH2Jrkguw4n1x1cQr2/nt2
 k6WJ9v/768yt6ZGSvh22+kmDdv5aZWuEtEFhHBxF4ESnWzLBLrMDFTlIEoft8342bSRA
 ORjaFDtmyTCqy5twY4gi/d8Kz9iBVj13/DWsMNMak6zDv6Lm5Z2CvPeZVL2REC6x1ICN
 YGNg==
X-Gm-Message-State: APjAAAVmJcNABkjGLHceTv0MBZYTOqtVQq/kckfSiIMF6fOiF9Nr/Jml
 8wwTu6//OP8QxElj+ygKCSvjXT4NbqL7Og==
X-Google-Smtp-Source: APXvYqyyzVU6PmkPeOeBgKV6jY3bzTZPDmSqYSbUHfdlOt8oTvxIuNEEYVxyU8HYqS26xWZXbgMPvw==
X-Received: by 2002:a17:90b:124a:: with SMTP id
 gx10mr1680582pjb.118.1576045176977; 
 Tue, 10 Dec 2019 22:19:36 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id h5sm1225579pfk.30.2019.12.10.22.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 22:19:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 0/4] drm: bridge: anx7688 and mux drivers
Date: Wed, 11 Dec 2019 14:19:07 +0800
Message-Id: <20191211061911.238393-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a resend of [1] with a few modification due to drm core function
changes and use regmap abstraction.

The gpio mux driver is required for MT8173 board layout:

                                  /-- anx7688
-- MT8173 HDMI bridge -- GPIO mux
                                  \-- native HDMI

[1] https://lore.kernel.org/lkml/1467013727-11482-1-git-send-email-drinkcat@chromium.org/

Nicolas Boichat (4):
  dt-bindings: drm/bridge: analogix-anx7688: Add ANX7688 transmitter
    binding
  drm: bridge: anx7688: Add anx7688 bridge driver support.
  dt-bindings: drm/bridge: Add GPIO display mux binding
  drm: bridge: Generic GPIO mux driver

 .../bindings/display/bridge/anx7688.yaml      |  60 ++++
 .../bindings/display/bridge/gpio-mux.yaml     |  89 +++++
 drivers/gpu/drm/bridge/Kconfig                |  19 ++
 drivers/gpu/drm/bridge/Makefile               |   2 +
 drivers/gpu/drm/bridge/analogix-anx7688.c     | 202 ++++++++++++
 drivers/gpu/drm/bridge/generic-gpio-mux.c     | 306 ++++++++++++++++++
 6 files changed, 678 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml
 create mode 100644 Documentation/devicetree/bindings/display/bridge/gpio-mux.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c
 create mode 100644 drivers/gpu/drm/bridge/generic-gpio-mux.c

-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
