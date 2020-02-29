Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA61317555B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5976E0D2;
	Mon,  2 Mar 2020 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs13.siol.net [185.57.226.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F62C6E09E
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Feb 2020 16:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id 5554A5234DF;
 Sat, 29 Feb 2020 17:31:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id LRxk0qdFBi8A; Sat, 29 Feb 2020 17:31:01 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id F2C455235D9;
 Sat, 29 Feb 2020 17:31:00 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Zimbra) with ESMTPSA id 37AEE5234DF;
 Sat, 29 Feb 2020 17:30:59 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH 0/4] drm/bridge: dw-hdmi: Various updates
Date: Sat, 29 Feb 2020 17:30:39 +0100
Message-Id: <20200229163043.158262-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Mar 2020 08:17:47 +0000
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes multiple issues I found out.
Patch 1 fixes reporting colorimetry in AVI frame.
Patch 2 fixes color space conversion detection. At the moment it doesn't
change anything, but it would needlessly enable CSC unit when conversion
is not needed.
Patch 3 sets scan mode to underscan which is in line with most other hdmi
drivers.
Patch 4 aligns RGB quantization to CEA 861 standard.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  drm/bridge: dw-hdmi: fix AVI frame colorimetry
  drm/bridge: dw-hdmi: Fix color space conversion detection
  drm/bridge: dw-hdmi: Add support for RGB limited range

Jonas Karlman (1):
  drm/bridge: dw-hdmi: do not force "none" scan mode

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 87 ++++++++++++++++-------
 1 file changed, 62 insertions(+), 25 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
