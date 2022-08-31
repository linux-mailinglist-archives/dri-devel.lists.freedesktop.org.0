Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CD25A7908
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 10:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AD410E258;
	Wed, 31 Aug 2022 08:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 557F110E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 08:27:11 +0000 (UTC)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C43F7481;
 Wed, 31 Aug 2022 10:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661934429;
 bh=P4B4DCvFz9xvhJaQDYi4kcFnEh/OgWv3FNgOhXgnyl0=;
 h=From:To:Cc:Subject:Date:From;
 b=qRqG4cE6gh9YL1huTijpJaIzhgjsMah2YA4KRP8xd12ZRuOT48CeUkSGSnVaJaY5r
 AxiaBYpAd/solkEPZTIa5AExG/gqmAiCn57gxyqwuwLivSIAWoYo3wFF2J6egRM7Ob
 rn7tLDkC+82JKpnup3qCcu3crcWWZWO/MkXIOkDA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/3] drm/bridge: ti-sn65dsi86: Basic DP support
Date: Wed, 31 Aug 2022 11:26:50 +0300
Message-Id: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

v5 of the series can be found from:

https://lore.kernel.org/all/20220824130034.196041-1-tomi.valkeinen@ideasonboard.com/

Changes to v5:
- Drop the broken "check AUX errors better" patch
- Fix sync pulse widths in "Reject modes with too large blanking"
- Drop the text about eDP, detect and get_edid from the desc of
  "Implement bridge connector operations"

 Tomi

Laurent Pinchart (2):
  drm/bridge: ti-sn65dsi86: Support DisplayPort (non-eDP) mode
  drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP

Tomi Valkeinen (1):
  drm/bridge: ti-sn65dsi86: Reject modes with too large blanking

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 72 +++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

-- 
2.34.1

