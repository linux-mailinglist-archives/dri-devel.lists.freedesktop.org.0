Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC41A2CFB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 02:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E0D6EB1B;
	Thu,  9 Apr 2020 00:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C956EB1D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 00:43:13 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0F9C2DC;
 Thu,  9 Apr 2020 02:36:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586392610;
 bh=llMVLB099oOYeZ3D8OnWk599VQrLiuIALgpwEDkkeHs=;
 h=From:To:Cc:Subject:Date:From;
 b=fcAu+wjBiZNy1Xbk7Au1SYIMai5D3Wp2nuVdDRxk1ZJSAJpNhC83AJQw0RwHuM7/i
 8JHgbx2dzkqoEvBSa5dCqUlrfTp4iYlqfcV3ajhjZs+7+ZwathJzmYzErI/0tqIEDb
 +Lz1oRldCZHSpKSxkfJxh3H27wnJCgY5M/irk06c=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM bridge
 connector helper
Date: Thu,  9 Apr 2020 03:36:34 +0300
Message-Id: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series enables usage of the simple-bridge driver with
the DRM bridge connector helper (drm_bridge_connector.c). Patch 1/2
starts by simplifying the driver by delegating DDC handling to the next
bridge in the chain, and patch 2/2 makes the connector creation
optional.

I will continue converting existing bridge drivers to this new model,
starting with the adv7511, rcar-lvds and dw-hdmi bridges. Anyone willing
to give a and converting additional bridge drivers is more than welcome
:-)

Laurent Pinchart (2):
  drm: bridge: simple-bridge: Delegate operations to next bridge
  drm: bridge: simple-bridge: Make connector creation optional

 drivers/gpu/drm/bridge/simple-bridge.c | 107 +++++++++----------------
 1 file changed, 36 insertions(+), 71 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
