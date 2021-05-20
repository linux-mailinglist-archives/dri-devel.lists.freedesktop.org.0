Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA938ADFA
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD1C86E252;
	Thu, 20 May 2021 12:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5896E0D5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:19:48 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBDE0D41;
 Thu, 20 May 2021 14:19:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621513187;
 bh=VY42HxSKGIYiibjWaT7Yzm4mL9PWiio2eRTcJ2StC44=;
 h=From:To:Cc:Subject:Date:From;
 b=pei/N+CeG1HK3ijGa24s55Xi2QO4txm75OYX8dPdWPNgLbTVj3qCMLasdzYQlCsqB
 sMROW/iV+60rNaJ7hvrMy0uOfzuQaCUDJPBd7BxIjFs3OMigfy4azefmUezlJ0dUht
 TDK00V+U9/jDKRpbW1GuFDbnTRSjPWSOKVP10Fho=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm: xlnx: zynqmp_dpsub: Fix plane handling
Date: Thu, 20 May 2021 15:19:39 +0300
Message-Id: <20210520121942.26686-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
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
Cc: linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@xilinx.com>, Rohit Visavalia <RVISAVAL@xilinx.com>,
 Quanyang Wang <quanyang.wang@windriver.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series fixes an issue related to plane blending (patch
1/3), add global alpha support to the overlay plane (patch 2/3) and
exposes plane ordering to userspace (patch 3/3). There isn't much to say
here, please refer to individual patches for details.

Compared to v1, I've dropped making the video plane primary, as that
seems to cause issues with existing userspace, and I've been told in the
meantime that the DRM/KMS API doesn't require the overlay planes to be
on top of the primary plane (even if not doing so is somehow
counterintuitive, given the name "overlay").

Laurent Pinchart (3):
  drm: xlnx: zynqmp_dpsub: Fix graphics layer blending
  drm: xlnx: zynqmp_dpsub: Add global alpha support
  drm: xlnx: zynqmp_dpsub: Expose plane ordering to userspace

 drivers/gpu/drm/xlnx/zynqmp_disp.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart

