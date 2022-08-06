Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB4958B6FD
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203310F158;
	Sat,  6 Aug 2022 16:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96B112F51
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:34:18 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n207so666821iod.7
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SaUBoqntZ3xpwrUzgeOy0DwQIiOjlZNYBHlnYS80ldA=;
 b=ALOJApgiU1Bu3FBCE6WOR5MxyhMFROfvC2N4q2QgxbdLU8q5Oz6ouEKcxRaLJXRvm2
 u4X1wlQszDadkFj1NVcSc2LBAot93rNmccBTeeZQvnjT5sFyawYLZxOiiFGCx1qHtA9Y
 rt2WpaBNi9ispLb4kU+UPMPeTIV52hJ68eHHc3jHHpnROX/dDCvv3NyGJRDuCmErtkZF
 fM9CZacWKhb8Gdr7qb62NorcVrVZgfgxa/qI5WaUTQLuJ5MoLskJKQO91Zovgdc/LhZJ
 QxyoAryeDy01p1QYDyvYi7bHwzQyCWOQ+/vR82/J9aUf/tInw8ceycHXAF2AV7MJUHM3
 0sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SaUBoqntZ3xpwrUzgeOy0DwQIiOjlZNYBHlnYS80ldA=;
 b=Pmd7SEPJPyvuTYe2EPTCL1l/olXLf7/az8n4iGrE6GQFHQw7/CgFG1PRErsSnmO9Gp
 pbAY4syLsMxfM5up+VPMyLCI9dqyy+aJjop/X/AEI6yt8dNMjcv9K6wxlnizlZuqzr2g
 IUEVQfM2S+ka2FWcphetuDmAbZRPrMcsMXenF/z7MUqAOgA71/9CBXlZrDYu8hf4pAB5
 8mHhKLBEi7tWwLULRZOMe6F4NwlVPjuklQP0BT7LkihkccQYo28Ez2O861xzZyJ9aLi4
 ia8Gnm3PGG92WageYM0GhiiZF9gBVJGUsKeRy+Cluh3BNHn1UedKKQkVRtfikfNBDeMO
 OdUw==
X-Gm-Message-State: ACgBeo1Q78xDcd1cIi58yzSkaThiglPhlINhoMmHcRmzs4qfkfrnKxtd
 sgPQZ+f5zcWRL9uAhJzVzD0=
X-Google-Smtp-Source: AA6agR7DiKfCMvxm+CA/RzSBpZzX9VjXHcm3LmI4qDSBMzjn4WzFx9p3rf/PMs3V8fkzCvhnxs8qUg==
X-Received: by 2002:a05:6602:2c01:b0:65d:d998:680c with SMTP id
 w1-20020a0566022c0100b0065dd998680cmr4791990iov.132.1659803657459; 
 Sat, 06 Aug 2022 09:34:17 -0700 (PDT)
Received: from nergzd-desktop.localdomain (tor-exit-50.for-privacy.net.
 [185.220.101.50]) by smtp.gmail.com with ESMTPSA id
 a20-20020a056e020e1400b002de6fa0d0c0sm2908009ilk.63.2022.08.06.09.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 09:34:17 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] drivers: serial: earlycon: Correct argument name
Date: Sat,  6 Aug 2022 19:32:22 +0300
Message-Id: <20220806163255.10404-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220806163255.10404-1-markuss.broks@gmail.com>
References: <20220806163255.10404-1-markuss.broks@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Markuss Broks <markuss.broks@gmail.com>, linux-doc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "node" argument is actually an offset, and it's also
an "int", and not "unsigned long". Correct the of_setup_earlycon
function.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/tty/serial/earlycon.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index 57c70851f22a0e78805f34d1a7700708104b6f6a..bc210ae8173d97d5ef422468acf2755a853cb943 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -244,7 +244,7 @@ early_param("earlycon", param_setup_earlycon);
 #ifdef CONFIG_OF_EARLY_FLATTREE
 
 int __init of_setup_earlycon(const struct earlycon_id *match,
-			     unsigned long node,
+			     int offset,
 			     const char *options)
 {
 	int err;
@@ -255,25 +255,25 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 
 	spin_lock_init(&port->lock);
 	port->iotype = UPIO_MEM;
-	addr = of_flat_dt_translate_address(node);
+	addr = of_flat_dt_translate_address(offset);
 	if (addr == OF_BAD_ADDR) {
 		pr_warn("[%s] bad address\n", match->name);
 		return -ENXIO;
 	}
 	port->mapbase = addr;
 
-	val = of_get_flat_dt_prop(node, "reg-offset", NULL);
+	val = of_get_flat_dt_prop(offset, "reg-offset", NULL);
 	if (val)
 		port->mapbase += be32_to_cpu(*val);
 	port->membase = earlycon_map(port->mapbase, SZ_4K);
 
-	val = of_get_flat_dt_prop(node, "reg-shift", NULL);
+	val = of_get_flat_dt_prop(offset, "reg-shift", NULL);
 	if (val)
 		port->regshift = be32_to_cpu(*val);
-	big_endian = of_get_flat_dt_prop(node, "big-endian", NULL) != NULL ||
+	big_endian = of_get_flat_dt_prop(offset, "big-endian", NULL) != NULL ||
 		(IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) &&
-		 of_get_flat_dt_prop(node, "native-endian", NULL) != NULL);
-	val = of_get_flat_dt_prop(node, "reg-io-width", NULL);
+		 of_get_flat_dt_prop(offset, "native-endian", NULL) != NULL);
+	val = of_get_flat_dt_prop(offset, "reg-io-width", NULL);
 	if (val) {
 		switch (be32_to_cpu(*val)) {
 		case 1:
@@ -291,11 +291,11 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 		}
 	}
 
-	val = of_get_flat_dt_prop(node, "current-speed", NULL);
+	val = of_get_flat_dt_prop(offset, "current-speed", NULL);
 	if (val)
 		early_console_dev.baud = be32_to_cpu(*val);
 
-	val = of_get_flat_dt_prop(node, "clock-frequency", NULL);
+	val = of_get_flat_dt_prop(offset, "clock-frequency", NULL);
 	if (val)
 		port->uartclk = be32_to_cpu(*val);
 
-- 
2.37.0

