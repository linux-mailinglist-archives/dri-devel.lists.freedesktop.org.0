Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D494227A83E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F276E311;
	Mon, 28 Sep 2020 07:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1626E0F6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601139908; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=kXsmVIEyF09DDOALmG2G0CJL3flbnplebaqT/U8aoTw=;
 b=C+lnivDr7Enp2bKqnFAXdhQMPXxKZV7hoolH/+McifTHbKrTrP13M0HhfZTc5unwWK1YAb
 fMkxdyOGZoDxPrDY9PIM59bztuuE0x4D4CcaeN+hPdEBdEZ/+iEKNuKK3N9zgrPq+w4Dl6
 c+s+womc3BXuwTwQWU4TxTNIIIolDv0=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/7] Ingenic-drm improvements + new pixel formats
Date: Sat, 26 Sep 2020 19:04:54 +0200
Message-Id: <20200926170501.1109197-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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

This is a V2 of my small patchset "Small improvements to ingenic-drm"
that I sent about two weeks ago. In that time, I worked on new
improvements, so I thought I'd just add them to the patchset, since
I needed a V2 anyway.

Sam: the patches you acked have been all slightly modified, I kept your
acked-by on them, please tell me if that's OK.

Cheers,
-Paul

Paul Cercueil (7):
  drm/ingenic: Reset pixclock rate when parent clock rate changes
  drm/ingenic: Add support for reserved memory
  drm/ingenic: Alloc F0 and F1 DMA descriptors at once
  drm/ingenic: Support handling different pixel formats in F0/F1 planes
  drm/ingenic: Add support for paletted 8bpp
  drm/ingenic: Add support for 30-bit modes
  drm/ingenic: Add support for 24-bit modes

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 262 +++++++++++++++++++---
 drivers/gpu/drm/ingenic/ingenic-drm.h     |   3 +
 2 files changed, 228 insertions(+), 37 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
