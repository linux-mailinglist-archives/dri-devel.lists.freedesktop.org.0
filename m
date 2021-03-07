Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C80732FE9A
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 05:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2436E0DE;
	Sun,  7 Mar 2021 04:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E794B6E0DE
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 04:06:49 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9660693;
 Sun,  7 Mar 2021 05:06:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615090008;
 bh=7A6B5xoqECrHknhKo44/oCqlc3LfEJES7ndsaoYxQME=;
 h=From:To:Cc:Subject:Date:From;
 b=D9nirF8LXFA/SG6C286xVOQUGzsZPm8csb9ydsgxsMpGp8qTohfwftxId9HzHAJM0
 C8z1zdWXSHipSTjyunwQnWLRzBKLJjwz/B60Qagwe2STVaRlNOPiXmkjBskaBpAsTe
 HNDRUJww9qf9DVxHJe8jL203U2p2wFLdN1yqbC4A=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: xlnx: zynqmp_dpsub: Fix plane handling
Date: Sun,  7 Mar 2021 06:06:08 +0200
Message-Id: <20210307040611.29246-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
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
Cc: Rohit Visavalia <RVISAVAL@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series fixes two issues related to plane handling and
blending, and add global alpha support to the overlay plane. There isn't
much to say here, please refer to individual patches for details.

Laurent Pinchart (3):
  drm: xlnx: zynqmp_dpsub: Fix plane ordering
  drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
  drm: xlnx: zynqmp_dpsub: Add global alpha support

 drivers/gpu/drm/xlnx/zynqmp_disp.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
