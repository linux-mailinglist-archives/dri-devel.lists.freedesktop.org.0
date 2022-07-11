Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0657079F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB19A8F466;
	Mon, 11 Jul 2022 15:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967DB8F451
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:39 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by xavier.telenet-ops.be with bizsmtp
 id trqd2700a4C55Sk01rqd49; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-0036ww-8s; Mon, 11 Jul 2022 17:50:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgC-006sh5-QN; Mon, 11 Jul 2022 17:50:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 00/10] video: fbdev: atari: Miscellaneous fixes and cleanups
Date: Mon, 11 Jul 2022 17:50:24 +0200
Message-Id: <cover.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series contains miscellaneous fixes and cleanups for the
Atari frame buffer device driver, which were identified while working on
the Atari DRM driver.

Most of them have been tested on ARAnyM, and should be safe to apply,
except perhaps for the last one, which is marked RFC.

Thanks for your comments!

Geert Uytterhoeven (10):
  video: fbdev: atari: Simplify atafb_pan_display()
  video: fbdev: atari: Remove bogus FB_VMODE_YWRAP flags
  video: fbdev: atari: Fix inverse handling
  video: fbdev: atari: Fix ext_setcolreg()
  video: fbdev: atari: Remove unneeded casts from void *
  video: fbdev: atari: Remove unneeded casts to void *
  video: fbdev: atari: Fix TT High video mode vertical refresh
  video: fbdev: atari: Fix VGA modes
  video: fbdev: atari: Remove unused definitions and variables
  [RFC] video: fbdev: atari: Remove backward bug-compatibility

 Documentation/m68k/kernel-options.rst |   4 +-
 drivers/video/fbdev/atafb.c           | 101 +++++++-------------------
 2 files changed, 29 insertions(+), 76 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
