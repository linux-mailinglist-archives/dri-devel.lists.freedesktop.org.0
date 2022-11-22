Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B981363315D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 01:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3910E1BC;
	Tue, 22 Nov 2022 00:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532B10E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:32:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A53FD01;
 Tue, 22 Nov 2022 01:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669077154;
 bh=5JdASL/CiE4rTDsi9shcG4mSG6gPhLGkF4tCrZJmgkY=;
 h=Date:From:To:Cc:Subject:From;
 b=RiXTm6jep5pZyBZqMVN0az13h077ntpSJLw+QQo9C/LeoslKmCzJvNg37EgWId3Ql
 3owTXI6G2HUO6mofICPNAmiEWBoPuhsbWa07mn6aE1riDoHbjryvEPo6nSQAGllKS6
 JTJDhZEzqWzYAOUhMul0YGm8/A+ZcdsVoRH53KIg=
Date: Tue, 22 Nov 2022 02:32:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [GIT PULL FOR v6.2] RZ/G2L DSI Kconfig fix
Message-ID: <Y3wYk/Bn/qVa9ha0@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

The following changes since commit 4e291f2f585313efa5200cce655e17c94906e50a:

  Merge tag 'drm-misc-next-2022-11-10-1' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2022-11-16 07:17:32 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/drm-next-20221122

for you to fetch changes up to ff6d979454ee21bf2d21040c8f2996b8f66726f2:

  drm: rcar-du: Fix Kconfig dependency between DRM and RZG2L_MIPI_DSI (2022-11-22 02:20:23 +0200)

This commit fixes a Kconfig issue that is in the drm-next branch for
v6.2.

----------------------------------------------------------------
Kconfig fix for RZ/G2L DSI

----------------------------------------------------------------
Biju Das (1):
      drm: rcar-du: Fix Kconfig dependency between DRM and RZG2L_MIPI_DSI

 drivers/gpu/drm/rcar-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Regards,

Laurent Pinchart
