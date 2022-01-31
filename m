Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082C4A50CB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5BB10E482;
	Mon, 31 Jan 2022 21:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED9F10E451
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w11so27876469wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5jm2tqChG+6Cl2msdB52h1xzbJ+oW9+NC/C42g3ib0k=;
 b=V36rEEp+ouYAUNQ82bxdkn5P3ZwQiqH7dskiUsOLGI+nChuOAiU1LKuyDpurK3LEf0
 e5/Y8vrIorBlvVcS6pRAaIymj3OXuaa5pr3tcxbawteVa54wRbCrtFTofJ/mCLnXSLJY
 8YIDLEgovB750ZktGu8IC9tQWaJXDtpdUOZFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5jm2tqChG+6Cl2msdB52h1xzbJ+oW9+NC/C42g3ib0k=;
 b=f6d7KuyWeO4ST5dvyp1fbIteS87qwy6XsPx8p9ssF8Xn7Ubp1ds9ju/4OUMnt9bU5m
 U7BHJw2A6EXxkn/J4JOy06pA2mOcDLiKKK1lxzgS2Dr6fHSgmAre9g5fjZ1UYjFdn8L1
 Rsx8KGI8/hCNonRHZF7Pmg4lv2mfQ5KumOiotTaofssocv/o5H64MzUioNi3LkGXmss5
 B95DIwEbwD5t633NZBw2TPBZekHDVNu4tFV40mrNCBrdzANCKe73gs8ZOyD9ZVsaQR2E
 6VqJlBsg7unQDq0/q9x+PKEJMvw8trY4rHsg1HaTCzGNBHkWNUouFVwMCLgideaUA7Dl
 tg4Q==
X-Gm-Message-State: AOAM532bq6U62U8gmKNs3/1QdlFoomTo1THy//fR67Q2/df1cMgiJ43W
 PfqULANAByIeRplrFMHLyUAQGsnN/6u2Rw==
X-Google-Smtp-Source: ABdhPJzE6MxfkQjvT5nGD4ugcetBmrXO6zOc6yI6XQCT4PSLXqTsNaSQryY0J+V6FA5cpi73SBd1Dg==
X-Received: by 2002:a5d:64ad:: with SMTP id m13mr19468526wrp.671.1643663195774; 
 Mon, 31 Jan 2022 13:06:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
Date: Mon, 31 Jan 2022 22:05:32 +0100
Message-Id: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ever since Tomi extracted the core code in 2014 it's been defacto me
maintaining this, with help from others from dri-devel and sometimes
Linus (but those are mostly merge conflicts):

$ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
    35  Daniel Vetter
    23  Linus Torvalds
    10  Hans de Goede
     9  Dave Airlie
     6  Peter Rosin

I think ideally we'd also record that the various firmware fb drivers
(efifb, vesafb, ...) are also maintained in drm-misc because for the
past few years the patches have either been to fix handover issues
with drm drivers, or caused handover issues with drm drivers. So any
other tree just doesn't make sense. But also, there's plenty of
outdated MAINTAINER entries for these with people and git trees that
haven't been active in years, so maybe let's just leave them alone.
And furthermore distros are now adopting simpledrm as the firmware fb
driver, so hopefully the need to care about the fbdev firmware drivers
will go down going forward.

Note that drm-misc is group maintained, I expect that to continue like
we've done before, so no new expectations that patches all go through
my hands. That would be silly. This also means I'm happy to put any
other volunteer's name in the M: line, but otherwise git log says I'm
the one who's stuck with this.

Cc: Dave Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sven Schnelle <svens@stackframe.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ea3e6c914384..49809eaa3096 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7573,6 +7573,12 @@ S:	Maintained
 W:	http://floatingpoint.sourceforge.net/emulator/index.html
 F:	arch/x86/math-emu/
 
+FRAMEBUFFER CORE
+M:	Daniel Vetter <daniel@ffwll.ch>
+F:	drivers/video/fbdev/core/
+S:	Odd Fixes
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+
 FRAMEBUFFER LAYER
 M:	Helge Deller <deller@gmx.de>
 L:	linux-fbdev@vger.kernel.org
-- 
2.33.0

