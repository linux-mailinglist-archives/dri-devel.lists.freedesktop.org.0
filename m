Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB156D00F0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8C210ED9B;
	Thu, 30 Mar 2023 10:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1094 seconds by postgrey-1.36 at gabe;
 Thu, 30 Mar 2023 10:18:03 UTC
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E465010ED97
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 10:18:03 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id EC9E120755;
 Thu, 30 Mar 2023 12:18:01 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
Subject: [PATCH v1 0/2] drm/bridge: ti-sn65dsi83: Add DSI video mode
 configuration
Date: Thu, 30 Mar 2023 12:17:50 +0200
Message-Id: <20230330101752.429804-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

SN65DSI8[34] device supports burst video mode and non-burst video mode with
sync events or with sync pulses packet transmission as described in the DSI
specification.

Enable configuration of the DSI video mode instead of hard-coding
MIPI_DSI_MODE_VIDEO_BURST.

Francesco Dolcini (2):
  dt-bindings: display: bridge: sn65dsi83: Add DSI video mode
  drm/bridge: ti-sn65dsi83: Add DSI video mode configuration

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  8 +++++++
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 24 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.25.1

