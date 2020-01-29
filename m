Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C4414CF35
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 18:07:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE6B6F5F2;
	Wed, 29 Jan 2020 17:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jan 2020 17:07:06 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D68AC6F5F2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 17:07:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,378,1574089200"; d="scan'208";a="37927960"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Jan 2020 02:02:02 +0900
Received: from marian-VirtualBox.ree.adwin.renesas.com (unknown
 [10.226.36.164])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id C51E04008567;
 Thu, 30 Jan 2020 02:02:01 +0900 (JST)
From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Add support for EDT ETM043080DH6-GP
Date: Wed, 29 Jan 2020 17:01:56 +0000
Message-Id: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
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

This small patch-set adds support for EDT ETM043080DH6-GP. This is a
480x272 TFT Display with capacitive touchscreen and it is compatible with
simple panel driver.

We have tested it with our iWave-G22D Generic SODIMM Development Board.

Marian-Cristian Rotariu (2):
  dt-bindings: display: Add bindings for EDT panel
  drm/panel: simple: Add EDT panel support

 .../bindings/display/panel/edt,et-series.txt       |  3 ++
 drivers/gpu/drm/panel/panel-simple.c               | 33 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
