Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466914DA68
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 13:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D756F978;
	Thu, 30 Jan 2020 12:08:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2B3F6F978
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 12:08:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,381,1574089200"; d="scan'208";a="37798975"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2020 21:08:42 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown
 [10.226.36.164])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F96640062A5;
 Thu, 30 Jan 2020 21:08:41 +0900 (JST)
From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
To: dri-devel@lists.freedesktop.org,
	sam@ravnborg.org
Subject: [PATCH v2 0/2] Add support for EDT ETM043080DH6-GP
Date: Thu, 30 Jan 2020 12:08:36 +0000
Message-Id: <1580386118-22895-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Second version of patch-set that adds support for EDT ETM043080DH6-GP. This
is a 480x272 TFT Display with capacitive touchscreen and it is compatible
with the simple panel driver.

We have tested it with our iWave-G22D Generic SODIMM Development Board.

In v2, after Sam Ravnborg's review, I've rebased the patches against
drm-misc-next and modified the proper bindings file for the simple panels.

I have also added the mandatory connector-type field and corrected the bus
type as it is a 18bbp, therefore an RGB666.

Unfortunately, we do not have access to the datasheet, therefore we could
not use the display_timings format.

Marian-Cristian Rotariu (2):
  dt-bindings: display: Add bindings for EDT panel
  drm/panel: simple: Add EDT panel support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 34 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
