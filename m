Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3BA3B2428
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 02:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AA16E994;
	Thu, 24 Jun 2021 00:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB34A6E993
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 00:03:40 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A83D087F;
 Thu, 24 Jun 2021 02:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624493019;
 bh=o4A7rz7rZoYsx099yX5YSknU3/LXn07VWHPMapBxwNc=;
 h=From:To:Cc:Subject:Date:From;
 b=fcJBJegdDFu3Lba+IrpBjotJsbB6liCfSxflXt+t0i8t8YqYuEpfAMvU2XG3WQues
 vs12sQ9hq4bWrxxJY/5KMudZZQoLaMXwQGiV6oaaFRM7qwXpcnce483wtoD8Ln9aSE
 8V1a7WGUFjwOCAeU042iGE3mpVJcjhAFvXsgUdW4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/bridge: ti-sn65dsi86: Misc improvements
Date: Thu, 24 Jun 2021 03:02:58 +0300
Message-Id: <20210624000304.16281-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series contains miscellaneous improvements to the
ti-sn65dsi86 driver, and prepares it for optional connector creation and
DisplayPort (non-eDP) support.

The patches have been posted previously as part of the "[RFC PATCH
00/11] drm/bridge: ti-sn65dsi86: Support DisplayPort mode" series. The
last four patches have been left out as discussions are ongoing, this
series focusses on the base work that has mostly been approved during
the review of the RFC.

The code has been rebased on top of the latest drm-misc-next, and while
some changes to the ti-sn65dsi86 driver made conflict resolution
painful in patch 5/6, there was no big functional conflict.

Laurent Pinchart (6):
  dt-bindings: drm/bridge: ti-sn65dsi8: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Make enable GPIO optional
  drm/bridge: ti-sn65dsi86: Use bitmask to store valid rates
  drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge
  drm/bridge: ti-sn65dsi86: Group code in sections
  drm/bridge: ti-sn65dsi86: Split connector creation to a function

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   1 -
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 703 ++++++++++--------
 2 files changed, 374 insertions(+), 330 deletions(-)


base-commit: 7601d53c2c49e3a7e8150e8cf332b3c17943f75a
-- 
Regards,

Laurent Pinchart

