Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86FF73AF45
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 06:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC73710E5D0;
	Fri, 23 Jun 2023 04:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B599910E5D0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 04:07:42 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-307d20548adso206243f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 21:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687493259; x=1690085259;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jfr4aHtExKCjhX8/rfHVnmOqxjAsOewVsr3RQTrb4Ps=;
 b=PZGIC4e5GlPnSZSwaatuVGl+7FwpRbN7D3kl8h7U/PdQzYuJZ2lfvZvnHezsX45RCY
 Ncv2PlGe8MIK5Y/SgLxIbNIt5sbIimMtFdiKyfmQI0MxvWlXuaxcdLFroNrQZDMuQqUt
 Ae8/EUwr02EsrhZJo2upRM3Xp/ZBXDWvmvGx+KB1eskjb1vIegE6UMOLCnzL0J0MiDaR
 UhKIZ1JhYkJnJ172G0Z3QOzBSQ/brHtGqSUpJQk40Qr+KhAylFeOGyBm8H/7sg7TKFkv
 h0WjtYvg5vP4FyghFdBc+1sGkAqvnzj+mwKGZV+ANz3tRf4UV8yFnqr1SkD0BwmsNf+a
 mEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687493259; x=1690085259;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jfr4aHtExKCjhX8/rfHVnmOqxjAsOewVsr3RQTrb4Ps=;
 b=GomfBAYzmrL+my47wdIxNaOWeJHyvMHCzAHa864uRHUh2ekHi8jp0YPNL4DDvPfTso
 x00rXAADn5wH1c5rJsKO73vKHUxZfwedpoDz7VU9YRECfnrZ9bTQCZYlumDIWBjZYLaP
 8h6WeapOah7eM2OUGYhFvUZF9I/PkZvf5ukaTIe/ikYjTem+7cEZSIwrwRAXI3lTA+Uy
 Fzl94FwvvsKvbZw9BCVk/+uoaidOauFoK9Uac1FV4k4ljSXPMAUYuj49EqnsD8hqowbZ
 I4ZXl9g7AlTAMtjK0wyHPaJZaDbzIcOZz3044DZgxh4vC93l2GFgVDiuAgg7hoKcOvDO
 RL/w==
X-Gm-Message-State: AC+VfDxQHMHxWbd/sk3CxsrLHtusjbp9k/1AzaGz9aaafa8PracAGUoJ
 C0ZuQxM0z/vnzxRRYjn1AQs=
X-Google-Smtp-Source: ACHHUZ4bJ7yS6ZD3ioE6Qng90F9n0ELRAyLZg88+aPuX+QJBSsmH1HUmvPgTqornneVCSn8kwE3pTw==
X-Received: by 2002:adf:d092:0:b0:307:7f38:37f with SMTP id
 y18-20020adfd092000000b003077f38037fmr13245166wrh.66.1687493259449; 
 Thu, 22 Jun 2023 21:07:39 -0700 (PDT)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:851e:d01d:5e81:992f])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d4d8d000000b003048477729asm8445713wru.81.2023.06.22.21.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 21:07:39 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: adjust entry in VIA UNICHROME(PRO)/CHROME9
 FRAMEBUFFER DRIVER
Date: Fri, 23 Jun 2023 06:07:36 +0200
Message-Id: <20230623040736.9026-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit d4313a68ec91 ("fbdev/media: Use GPIO descriptors for VIA GPIO")
moves via-gpio.h from include/linux to drivers/video/fbdev/via, but misses
to adjust the file entry for the VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER
DRIVER section.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Remove the file entry in VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER, as
the new location of the header is already covered by the file entry
drivers/video/fbdev/via/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88954a1c0017..e12ac544aa9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22415,7 +22415,6 @@ L:	linux-fbdev@vger.kernel.org
 S:	Maintained
 F:	drivers/video/fbdev/via/
 F:	include/linux/via-core.h
-F:	include/linux/via-gpio.h
 F:	include/linux/via_i2c.h
 
 VIA VELOCITY NETWORK DRIVER
-- 
2.17.1

