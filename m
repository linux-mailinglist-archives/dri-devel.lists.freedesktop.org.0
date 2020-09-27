Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7FA27A849
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5C6E42E;
	Mon, 28 Sep 2020 07:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB126E084
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 19:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601235412; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=pavLK66rhjuKcvqnQT7C0OY+j32Kq1CGYnAD9KagotU=;
 b=Jj/gSxqdoFuSPtt00AcnTahEMQfhDEpggOzgqfre4KdDqaD9hzZbRk7XmWWPitC9ymKHA4
 I7CXNSZrsP7hCpNK7Xo3We9dHeweg04PjKvBHmH99xICiclnUJF3rzpKipRJOC1TzwGpcM
 aaScW39ArvUYdbNckYmBFE8WOYnGAzU=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/1] 8bpp support for Ingenic-drm
Date: Sun, 27 Sep 2020 21:36:44 +0200
Message-Id: <20200927193645.262612-1-paul@crapouillou.net>
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

Final (?) version of my "small improvements to ingenic-drm" patchset.

Most of the patches of V2 have been merged to drm-misc-next, except this
one which required some more work.

In the CRTC's .atomic_check callback, the size of the gamma LUT property
is now checked, so that only a complete 256-entry palette is accepted.

Cheers,
-Paul

Paul Cercueil (1):
  drm/ingenic: Add support for paletted 8bpp

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 66 +++++++++++++++++++++--
 1 file changed, 62 insertions(+), 4 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
