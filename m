Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE611827B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609B36E82A;
	Tue, 10 Dec 2019 08:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E666E433
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:20:34 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id ep17so5834359pjb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 04:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14NsRbqvK8Ly4ZGyXxprE+o0uGGyUabr+uKcGJngRc4=;
 b=KIUFYWsWooBe3edZNIIK7RXwJ6wb5f00cg24QfqUtdtz/nDGBq8wF0lINT2oj/lltn
 qGuR66Y8XZcShHtXczD8K/WpgbVd7OyG4FNPuhveaOYNufHdlbpLAShWQaII1Q+g8Ham
 3NYkNFbWFYmHJBjUFVtJfFEOXZXteK3znBRew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=14NsRbqvK8Ly4ZGyXxprE+o0uGGyUabr+uKcGJngRc4=;
 b=lE+/+Bew8amENYFUmuI/qsFIDQ34bkhGHESlcyZ7c94+1ohhoQOasw+LyRtNH0kfjh
 TnRg7Okjq5HqEIFrmk3K4PvzFVk2hebkLlBvRVSDNr/OevH2mawtOYKFKPIOGnKFF15c
 Ovq5yuOE/52ZJCus+NEYJQQiYQZ35ELUBSTcFRrNCffBf4T4D8hyykuUE1k03ZgC2xCt
 h+XcXjWWn4hqYSjHc3Bwu+2MIBEYL3lz+RfWt06naq5VgnpEy5c6d5TvATymtGYNGb0r
 3TyLlj4yBRx1gp5HpPpar5CTd631Xhd+6FsdpD6IbCYGbq0g7CYU+gPvYXhLiV2ffU10
 I6+g==
X-Gm-Message-State: APjAAAWW4iUkXTgjR43Jj9WL08HpNPlHn1zqVD3MuJaN8teONYTv5zGs
 FlPFXK1M0M71mA2Vo27mnH4x35yD3axoAg==
X-Google-Smtp-Source: APXvYqxMY0xvW14ePmqad7uZDMT0lAjkHermkSqJ1BHmnyUjnmY0Z8cUIEjYN76Ys5I89pUGIXVcHQ==
X-Received: by 2002:a17:902:9a04:: with SMTP id
 v4mr29561894plp.192.1575894033251; 
 Mon, 09 Dec 2019 04:20:33 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p21sm26733813pfn.103.2019.12.09.04.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 04:20:32 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/4] drm: bridge: anx7688 and an optional feature
Date: Mon,  9 Dec 2019 20:20:09 +0800
Message-Id: <20191209122013.178564-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series is to add anx7688 bridge driver. It is extended from
previous work[1].

The first 2 patches are same as previous version, with some modification
due to drm core function changes and use regmap abstraction.

We add an optional feature bypass-gpios so that driver can decide if it serves
as simple pass-thru by reading GPIO values, which is controlled by
hardware.

[1] https://lore.kernel.org/lkml/1467013727-11482-1-git-send-email-drinkcat@chromium.org/

Hsin-Yi Wang (2):
  dt-bindings: drm/bridge: analogix-anx78xx: support bypass GPIO
  drm: bridge: anx7688: Support bypass GPIO feature

Nicolas Boichat (2):
  dt-bindings: drm/bridge: analogix-anx7688: Add ANX7688 transmitter
    binding
  drm: bridge: anx7688: Add anx7688 bridge driver support.

 .../bindings/display/bridge/anx7688.txt       |  70 +++++
 drivers/gpu/drm/bridge/Kconfig                |   9 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/analogix-anx7688.c     | 260 ++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.txt
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c

-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
