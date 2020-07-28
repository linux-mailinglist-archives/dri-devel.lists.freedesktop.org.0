Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D175231293
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4806E364;
	Tue, 28 Jul 2020 19:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2C46E32B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595949408; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=w4oYRintr6C09zqyRCO+Nd06xt5Y8NV9/ZwsT/feY0w=;
 b=EW0ScNjIk/KEALxQPnhcecrCSLlEVsahz77Yp+ATZSDpgpqoQ2QXNm39OKSKsSIAV90Qtk
 mY48JXKZp07qlEYONVhHzLvtdxCuVHbwru1FRbiNHqwkzZMQEtCiHGhydtN7vELiqv2HRp
 rbxY1NtIDh0/x5iZoGwYfa3FTyQcRJw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] Small cleanups to ingenic-drm driver
Date: Tue, 28 Jul 2020 17:16:39 +0200
Message-Id: <20200728151641.26124-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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

Here are a few cleanups to the ingenic-drm driver.
- some error paths were missing and have been added;
- the mode validation has been moved to the .mode_valid helper callback.

Cheers,
-Paul

Paul Cercueil (2):
  drm/ingenic: Handle errors of drm_atomic_get_plane_state
  drm/ingenic: Validate mode in a .mode_valid callback

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
