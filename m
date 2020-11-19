Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7179B2B9C03
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65686E80B;
	Thu, 19 Nov 2020 20:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26926E536
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 15:56:11 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/3] drm/ingenic: Add support for delta-RGB panels
Date: Thu, 19 Nov 2020 15:55:56 +0000
Message-Id: <20201119155559.14112-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset adds support for delta-RGB panels to the ingenic-drm
driver. Delta-RGB panels have diamond-pattern subpixel layout, and
expect odd lines to have RGB subpixel ordering, and even lines to have
GBR subpixel ordering.

Such panel is used in the YLM (aka. Anbernic) RG-99, RG-300, RG-280M
and RG-280V handheld gaming consoles.

Cheers,
-Paul

Paul Cercueil (3):
  drm/ingenic: Compute timings according to adjusted_mode->crtc_*
  drm/ingenic: Properly compute timings when using a 3x8-bit panel
  drm/ingenic: Add support for serial 8-bit delta-RGB panels

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 40 ++++++++++++++++-------
 drivers/gpu/drm/ingenic/ingenic-drm.h     | 14 ++++++++
 2 files changed, 43 insertions(+), 11 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
