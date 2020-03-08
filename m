Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC4D17D47F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Mar 2020 16:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E1C6E2AF;
	Sun,  8 Mar 2020 15:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [176.9.38.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82B96E2AF
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 15:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.manjaro.org (Postfix) with ESMTP id 98ED437A1C4E;
 Sun,  8 Mar 2020 16:22:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
 by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tXGCKXIUL-q; Sun,  8 Mar 2020 16:22:47 +0100 (CET)
From: Tobias Schramm <t.schramm@manjaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/1] Regression in analogix_anx78xx
Date: Sun,  8 Mar 2020 16:22:37 +0100
Message-Id: <20200308152238.1294229-1-t.schramm@manjaro.org>
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
Cc: Thierry Reding <treding@nvidia.com>, Tobias Schramm <t.schramm@manjaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Masney <masneyb@onstation.org>, Sam Ravnborg <sam@ravnborg.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit ff1e8fb68ea0 ("drm/bridge: analogix-anx78xx: Avoid drm_dp_link helpers")
stores the max link rate in a u8, overflowing it.
This will probably prevent the link training from working.

I've not tested this patch beyond a simple compile test since I do not own
any devices containing an anx78xx. So please test!


Best regards,

Tobias

Changelog:
 v2: Skip forward and back conversion to/from link rate

Tobias Schramm (1):
  drm/bridge: anx78xx: fix calculation of dp link rate

 drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
