Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA3463BB1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 17:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA22F6E4DD;
	Tue, 30 Nov 2021 16:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7A6E4B1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 16:25:22 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E80DF2FD;
 Tue, 30 Nov 2021 17:25:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638289521;
 bh=0XHkeRFapeCOWan2bCvkB9iBYpLGmbZv1/tVwNZxkzo=;
 h=From:To:Cc:Subject:Date:From;
 b=UBRoRp/Zgwx4NfphfSo5hnUMVmoC0aLXRkelQdtmtL8aomm4OboLQTcgrbEFC4xSS
 XOEFGUT3dnjhWV0JTHsrCiCkclLTFNjNxHz6YJkhUiwynrm27gVL8VhPWCMoR+Sdrl
 ehgQsIm9SOP28NKAzm0kYViqmcdfsE2pscOavxXw=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2]  drm: rcar-du: mipi-dsi: Cleanup and Fixes
Date: Tue, 30 Nov 2021 16:25:11 +0000
Message-Id: <20211130162513.2898302-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following on from the earlier version of this series, is an updated
patch to move the bridge registration from rcar_mipi_dsi_probe() to
rcar_mipi_dsi_host_attach() followed by an immediate update to that code
to refactor it to use the new devm_drm_of_get_bridge helper.

These two patches are kept distinct to support review, and are both
expected to be squashed directly into the still-to-be-posted update of
the DSI driver by Laurent [0].

[0] https://lore.kernel.org/all/20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com/

The previous patches 1/4, 2/4 and 3/4 from the v1 of this series have
already been accepted by Laurent and squashed into his tree, so are not
reposted.

Kieran Bingham (2):
  drm: rcar-du: mipi-dsi: Support bridge probe ordering
  drm: rcar-du: mipi-dsi: Use devm_drm_of_get_bridge helper

 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 38 ++++++++++---------------
 1 file changed, 15 insertions(+), 23 deletions(-)

-- 
2.30.2

