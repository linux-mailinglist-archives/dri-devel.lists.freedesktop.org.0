Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F4928C525
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 01:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E576E839;
	Mon, 12 Oct 2020 23:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FE46E84D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 23:29:32 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B08F519EF;
 Tue, 13 Oct 2020 01:29:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602545370;
 bh=CkBBN4fu/wcuhFa1HR3o/rZY0Ba/e9uLO1KInzv4Zao=;
 h=From:To:Cc:Subject:Date:From;
 b=iTr9ELdJzT3uV0+T2ukvj4Veageaf/AyS/SCXPfemPYJrdskAjrCgsU1S/Qrjqnun
 lNqMeMeSyBZDbZxGY8zsBBBSEO9N1bwrfiAUQcSzYUcM88Q2NGkNdS942G0V9LACQC
 Iu4xstuc4FjqsE0Y9zg1uu6EEpH7xEfy3C3NUVDU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: mxsfb: Primary plane format fix and enhancement
Date: Tue, 13 Oct 2020 02:28:38 +0300
Message-Id: <20201012232840.15680-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series fixes format switching for the primary plane,
and adds support for the RGB888 format. There's not much else to tell,
please see individual patches for details.

Laurent Pinchart (2):
  drm: mxsfb: Fix format changes for primary plane
  drm: mxsfb: Add RGB888 support on the primary plane

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  5 +++++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 29 +++++++++++++++++++++++++----
 2 files changed, 30 insertions(+), 4 deletions(-)

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
