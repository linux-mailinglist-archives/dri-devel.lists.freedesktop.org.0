Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410252F0DDD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 09:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5832989DCF;
	Mon, 11 Jan 2021 08:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs7.siol.net [185.57.226.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14FC897E7
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jan 2021 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 828A55210C8;
 Sun, 10 Jan 2021 21:19:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id NtujHtSMxWPr; Sun, 10 Jan 2021 21:19:55 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 4919F520E9D;
 Sun, 10 Jan 2021 21:19:55 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net
 [86.58.58.53]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 8F50B5210C8;
 Sun, 10 Jan 2021 21:19:52 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org
Subject: [PATCH 0/3] drm/sun4i: de2/de3: CSC improvements
Date: Sun, 10 Jan 2021 21:19:44 +0100
Message-Id: <20210110201947.3611649-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Jan 2021 08:20:05 +0000
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
Cc: jernej.skrabec@siol.net, irlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This short series reworks CSC handling to remove duplicated constants
(patch 1 and 2) and adds BT2020 encoding to DE3 (patch 3).

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  drm/sun4i: csc: Rework DE3 CSC macros
  drm/sun4i: de2/de3: Remove redundant CSC matrices
  drm/sun4i: Add support for BT2020 to DE3

 drivers/gpu/drm/sun4i/sun8i_csc.c      | 109 ++++++++++---------------
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |   6 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |   2 +
 3 files changed, 48 insertions(+), 69 deletions(-)

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
