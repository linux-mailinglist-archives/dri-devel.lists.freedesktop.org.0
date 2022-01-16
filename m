Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7148FEAD
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 20:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C7310E462;
	Sun, 16 Jan 2022 19:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5859C10E462
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jan 2022 19:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642361535;
 bh=0lgPWAbt9wOLUClznnUlT4W6Xyol8p86VUEX681jDz0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=AXr2o4a/HwGqR1XYEHO0Y4GOGLohPYB7LaeoKMRC9WTWmKeSYj9xUAeUDVltRfO6U
 0wt/Wpa3JEvtQR2bQq0nRbyocjXD4DY42p+V1XDvnu+64xaVUYFzPA8doQe+gGeiVa
 21mRD2tlWwphSONUyJ/7DK8qk6IIDAEnbK+p7WiE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530 ([92.116.184.40]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWRVb-1mq5tU0aOR-00XpKO; Sun, 16
 Jan 2022 20:32:15 +0100
Date: Sun, 16 Jan 2022 20:31:09 +0100
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev updates for v5.17-rc1
Message-ID: <YeRyfaesC2kxkgZC@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:f7Q6R91YqaJfAxtW+FAUMmAE+C1iuEWECRoMWYaHWzpPRA/qdH8
 /skZ1uaTcZ0KJOqYHIXot03jiY246ME3PHXwIVd1PqU2iLrEguRMlBzojIen1ZI0/w5pyAg
 kyyN0B88uM83Pj70PI+t/fWn14Eu6BKIVBDEeyqRd14htKWBca3QDE5dYw7zphxCutx3lUC
 64c/ucvhg6M/Rn7ufFBdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kVqA4J89UW8=:1gtLHusprgEfqH+hokOQvF
 Er/Jr1YMrFsfxHcvFBxWWE3N1ZHXiAt3Jp/ERvwxMo3YDllssP35hJsU47ZzMBTPJzkGZGW2p
 xZkVlCYCMmkZDdLky/JcXA+CgA7W/P8+w+/xG6+FZlOyM12kwaNnrw8YEM3pBrZ8vWU+t1q3V
 ffWV90eovqJnmkNJgI7qWMZDzvYe/t2d+hnQpM0eF3CDFGttiMC9KajD0Amrmg1Mg2ObnX3jp
 29jRXAnF0ylEDDJjBCCqFAzUtNA3LajzlyTaF921FjJsPNSMYwZ/ZoWuL1Uc/mJBP5J5roACW
 02zHUKsDGbmPb3lUV6CyAuuuhXMbx+xI4QkSQxXSkmmd9TBb1ab8IfspaaaC0LVlY+/kg8LpP
 tiGEpvsO30wWi4jp/ExpLnJgCRVesCD28HDKewZ+tIYSXyAyWFgMuE6GIF182cO6xNAWauP2D
 gch5R6mfjF9BD6pZpNCVYiLQgYHHslVUQ1DPo0OqT09HwOFSZ8X1nf1XyXx32OjsWlBzhbPCa
 IdaN96JhXAdmGEN1Oeudj4day7x/SzP0WsRi9z6ssjBMrT0cjjiNpJDvV9Sm38drIobqvebO3
 xrAPAfH6ir+mBdI9anb1DJmGXti70Gqs+/vPHeDngJw4XRW08Q0NXVHh7odo3sPXwRwoR7Vos
 klMuygjGU4m9WUsU9LWWuK2+xqlNEKp/85kWOhFDGcx1FyNRtMilY0lrCPO+Vmgnm0Eoah1Xt
 717PtEimnh3P86H9R70U0yJsxHkLar3Cop9Kiqe/j1vNpJ1SI8dv66i2RguJGGwLNKbQmYDOY
 2hw/tX6EA9Q0i6tdsbLtIcLRGCAanyn8c39M+7ywIS7y0NNHQ69wmp+mUpwbNWoCsh5G/IJB4
 tDswurnGe8ImiSfvCVutuoHMgwJYsf4xCPAaf1NXLwTMPovDbnppwNTClQc0Zc9/7PJYrHj2Y
 PlSohW7BSeVwxa0iBnlYz2W/dWJRJ833k/KvecfZgN9tWSZwXcbIwQwtUK1GXc861XX5U1po9
 YkkOMAfcu13K1GJvM4M9pX1uUmCcLYRJc4PhA3DnMvckWDwTHNkcvFJGw4SNOTUozA==
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

The fbdev layer is orphaned, but seems to need some care.
So I'd like to step up as new maintainer.

This pull request contains only one single initial patch which adds
myself to the MAINTAINERS file for the FRAMBUFFER LAYER.

This was
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks,
Helge
--------

The following changes since commit df0cc57e057f18e44dac8e6c18aba47ab53202f9:

  Linux 5.16 (2022-01-09 14:55:34 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-5.17-1

for you to fetch changes up to f346f32701ebacf6fe397f6f1d254256f73da321:

  MAINTAINERS: Add Helge as fbdev maintainer (2022-01-14 21:49:23 +0100)

----------------------------------------------------------------
fbdev updates for v5.17-rc1

Add me as maintainer for the framebuffer code.

----------------------------------------------------------------
Helge Deller (1):
      MAINTAINERS: Add Helge as fbdev maintainer

 MAINTAINERS | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
