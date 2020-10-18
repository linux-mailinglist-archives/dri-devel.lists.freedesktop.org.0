Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8193F292005
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA4C6E8A9;
	Sun, 18 Oct 2020 20:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F056E8A9
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 20:54:59 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id b23so4792129pgb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40tXI37pHlk3TtzN2k44HneDIZz4amkAP9vv7Yjmryo=;
 b=qBvzINNoyd0ePJlIBr9XRAf5uj3vpv4Qr+DUgP5kyRA85wMxV7ztzWw/LBsHwefrly
 sC8tCYADiC/eld+Xed1K6diTdNz9H7dLztWAN9bo+udAPBB/icdea1Cxf4FSwz+xsn/v
 Mad2slFqH8totbokNDgWI4nPLDjNj9bII5uqpwwafuxag1BtPvGimntlBJFHCfS4YN3p
 /R5+kcJtS1Ul+ukoozoudfqCgW+k+CuBasqd1yW1FYTM+fj6dRhhPEEkawWv/4lvQCfB
 a4czKI1Yo20AMM87Wtis1+Y4oC+bW/vtvrrZAKeAkWzmCBwXWrAxFAjuJj3+AflXP14p
 E9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40tXI37pHlk3TtzN2k44HneDIZz4amkAP9vv7Yjmryo=;
 b=BQ5dDqlSZ3WIpz8Z7hAz2sIYcvapO8Gvc5CeVJlXlymuiFTv7HreOT4XBygylWrauR
 fQvmbJQR7z6eGd0VlQmSB1t7E7WHl9nvPp2x7LCBvPuevv4tcgHYN++1vgVjOMR/Nird
 0spiPR7h7gTApqxuY/3OK3PKkll1AlxIM2UpQwkf0D5ZXCgSKQaDXU7dktyuYC4CcDVp
 ReUjjbXKxKtvAYG2A5l7iTWLXDCaZ+OAgrIj6WfzoxXZq76wTZhFrgk/tOfgUkoCBpIt
 OzQxaTKn7iJ9Bgy0AQToxHR3B7O8G34TWU9FQevttX/0+ARaNUii0brSGAPfz2Ckccsy
 Ya2w==
X-Gm-Message-State: AOAM531pcLRMWouVRnGua52xqH/sFghEzV6gsGci7pyIuu/J3heWxgQU
 F8p4GOja201+B7HwLK+VnA==
X-Google-Smtp-Source: ABdhPJwJrUu0DW+lj02llJjiJVooeTj2lO5SI0doIdiPIzmOVKhr10VEfVZiynEkgJxjWHlTLcM1ig==
X-Received: by 2002:a63:3115:: with SMTP id x21mr12018067pgx.416.1603054499615; 
 Sun, 18 Oct 2020 13:54:59 -0700 (PDT)
Received: from localhost.localdomain ([161.117.41.183])
 by smtp.gmail.com with ESMTPSA id ck21sm9517430pjb.56.2020.10.18.13.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:54:58 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2 RESEND] docs: fb: Add font_6x8 to available built-in fonts
Date: Sun, 18 Oct 2020 16:54:01 -0400
Message-Id: <20201018205401.698242-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com>
References: <717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently we added a new 6x8 font in commit e2028c8e6bf9 ("lib/fonts: add
font 6x8 for OLED display"). Add its name to the "compiled-in fonts"
list.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Resending +Cc: dri-devel, sorry if I spammed.

 Documentation/fb/fbcon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index 9aad964b767c..57f66de2f7e1 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -81,7 +81,7 @@ C. Boot options
 1. fbcon=font:<name>
 
 	Select the initial font to use. The value 'name' can be any of the
-	compiled-in fonts: 10x18, 6x10, 7x14, Acorn8x8, MINI4x6,
+	compiled-in fonts: 10x18, 6x10, 6x8, 7x14, Acorn8x8, MINI4x6,
 	PEARL8x8, ProFont6x11, SUN12x22, SUN8x16, TER16x32, VGA8x16, VGA8x8.
 
 	Note, not all drivers can handle font with widths not divisible by 8,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
