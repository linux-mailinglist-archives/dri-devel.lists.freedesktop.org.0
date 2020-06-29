Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E745220E958
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 01:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4166E89AAE;
	Mon, 29 Jun 2020 23:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09C989AAE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:33:29 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0EE4299;
 Tue, 30 Jun 2020 01:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593473607;
 bh=ZGM40xdl+FMYrBph60+J1WkDt3/CICMvSeWg4yoO478=;
 h=From:To:Cc:Subject:Date:From;
 b=OHUs5quk4MR6/Q1RGkSFDHtM1Qv8VxDkZDLponE50v1hkocBImwKg+0vsI2pBqp6i
 XBqkRGIjNGMtKFSqudBsJTp4Y9XhDfjx4heu1g+W4xhqwIahjzfagALKk5/zdYBsYl
 088hya2oHvIEeRreHxIkVr8LuSkt2qD4AgXbWFyk=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm: panel: simple: Fix mistakes in panel descriptions
Date: Tue, 30 Jun 2020 02:33:16 +0300
Message-Id: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Liu Ying <victor.liu@nxp.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series is the second version of what has been
previously submitted as "[PATCH] drm: panel: simple: Drop drive/sample
bus flags for LVDS panels". It fixes incorrect bus format and connector
type in the description of two panels (patches 1/4 and 2/4), drop
invalid bus flags for LVDS panels (patch 3/4), and add a warning to
catch invalid bus formats for future LVDS panels.

Laurent Pinchart (4):
  drm: panel: simple: Correct connector type for Starry KR070PE2T
  drm: panel: simple: Correct bus format for Satoz SAT050AT40H12R2
  drm: panel: simple: Drop drive/sample bus flags for LVDS panels
  drm: panel: simple: Warn in case of incorrect bus format for LVDS
    panels

 drivers/gpu/drm/panel/panel-simple.c | 41 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 13 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
