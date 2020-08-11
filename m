Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24C2416A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598C96E15A;
	Tue, 11 Aug 2020 06:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6916E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105370; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=6HpYuenQaNHxSqUID5eIAEraqgAyWkjcmY0PScFv6AU=;
 b=b0kw9AqL7sEZAw2Xo2MLNe4qjsR78FVvun91EhjAYavWPJaID7P91cbGBx7muQK07wjgB+
 T1BOXFtRWCJqZtZ6OspMDoVWxTUSP7M0vdnR/K0qoTqhQDfRgTmdiWhWfqs5Kbr/RLAguu
 twSOPR+FIYm/NawNXz1TyQnuE3Y+Mhs=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 0/5] drm/panel: A few cleanups and improvements
Date: Tue, 11 Aug 2020 02:22:35 +0200
Message-Id: <20200811002240.55194-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi list,

Here's a list of 5 patches that bring some cleanups and improvements.

Patches 1-2 clean up the novatek,nt39016 code to remove custom handling
of the backlight and to add the missing carriage returns on error
messages.

Patches 3-5 updates the modes list of the sharp,ls020b1dd01d panel, to
make it use 'struct drm_display_mode' instead of 'struct
display_timing', modify the timings to get a perfect 60.00 Hz rate, and
add a 50 Hz mode.

Cheers,
-Paul

Paul Cercueil (5):
  drm/panel: novatek,nt39016: Handle backlight the standard way
  drm/panel: novatek,nt39016: Add missing CR to error messages
  drm/panel: simple: Convert sharp,ls020b1dd01d from timings to
    videomode
  drm/panel: simple: Tweak timings of sharp,ls020b1dd01d for perfect
    60Hz
  drm/panel: simple: Add 50Hz mode for sharp,ls020b1dd01d

 drivers/gpu/drm/panel/panel-novatek-nt39016.c | 34 ++++++----------
 drivers/gpu/drm/panel/panel-simple.c          | 40 +++++++++++++------
 2 files changed, 40 insertions(+), 34 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
