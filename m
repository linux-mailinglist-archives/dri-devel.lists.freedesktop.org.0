Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E624CEAD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A116EAB3;
	Fri, 21 Aug 2020 07:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32536E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597925582; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=fVj37TIG+mvs7lftpVXU13Q2HOoYZx+9DhCxLihuqvk=;
 b=t5eSugjJtimK8UxX9PPKhP8StyA8sWuspF56PdTYS/PHVZyzzhQk+gvYt4UW6rMfm76mMy
 zwm971CP9BE+LS6Y8dgwSS0umu4TwFKt9Fj5h7owDW6/CPBSN78twzl+lVNX1u3szGDBvV
 OpAo74M0rVPa5CE/0WSMVumKxYQ+aZc=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 0/2] NT39016 cleanup
Date: Thu, 20 Aug 2020 14:12:54 +0200
Message-Id: <20200820121256.32037-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few cleanups to the Novatek NT39016 panel driver:

- Reorder function calls in probe, so that drm_panel_of_backlight() is
  called after drm_panel_init(), as requested by the function's
  documentation;
- Use the 'dev' field inside the drm_panel structure, instead of using a
  separate field in the driver's private structure.

Cheers,
-Paul

Paul Cercueil (2):
  drm/panel: novatek,nt39016: Reorder calls in probe
  drm/panel: novatek,nt39016: Remove 'dev' field in priv struct

 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
