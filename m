Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96158B708
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CF113074;
	Sat,  6 Aug 2022 16:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F50C112019
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:34:34 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id j20so2734816ila.6
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=lQzsDSHH/Bii36GW148CpzzSSa0PYzrLw0cKTC8v8kk=;
 b=hFobmJQK6P0zU3BwVaJVOeRfR8NjKJd0BpCBeJV8Sv60LNy1tvgi4Hk8og/34srU3k
 eS7VOeHEv8DM21kQAlThdmquREUGhJWZIyHuXcQUhNBP8e3T/jfREWt/ZUs9Sdj+qkhy
 yjHhdJWbGEyKadKAP6Vj44sBZ1bKbCRmBpgFJQJ08E7tnf8Wpemw7VNHbFdYMJ48ONFC
 5Gwj275ZOjz3goTKvLPQeA0Zl8IcMLk4Xyup5NmFma3pkWx1ufB41aMDkMZ6e49PvTqv
 EMW90DQQTQb8XDvEwxbzO6THMs1tNkoVIUE0GiZ8y8XKZXMdsGRMgftZH9K+eq1QpXK1
 assw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=lQzsDSHH/Bii36GW148CpzzSSa0PYzrLw0cKTC8v8kk=;
 b=Y4RL8si3/aCSYzAsEiF7nJkDZJKdjCiamfTnJ+tMSDGv58wBZaL/VhWDNeNG+EmsvJ
 j7NNFPr1Qx2tIvONlUOKkBDyGzyA4xctzWTt+5Pw+P6sVgtYRaMIgztDYX+RkoJtWCjD
 fU7RsGItrb5omdo4b1NBIamNJjB0m+7wcc7NRp4Hlgj2qdhEx9KXTePnpIXLA6LplTZY
 K2JmZSWehPL7qAUaLDbuXeDm4/CzHM4eCfP/kDIOxA8gx5eTyeVd2Jubc6yjEGikXLpc
 yDBzpsaCbRFYdKoNrqqcH+ZGQtAqCyzmEPMkJBaRUSlPHWwzLDn3ME5YGKs4tdjH2VJX
 F5eg==
X-Gm-Message-State: ACgBeo2vlKMQAA4+dDm6UDtuytITUcLN/q517LoC6G5jSsu2sgRLVwsK
 C+KakejCDwQJkpj6nGKKAF8=
X-Google-Smtp-Source: AA6agR5CMSPTnUTrWYTukW0U5sy4javWSpA0m81oq3pZpfkjgXKOFa2aByaa4rMOqVFbgga7cPkFag==
X-Received: by 2002:a05:6e02:1a81:b0:2de:a8d7:de0c with SMTP id
 k1-20020a056e021a8100b002dea8d7de0cmr5324479ilv.309.1659803673460; 
 Sat, 06 Aug 2022 09:34:33 -0700 (PDT)
Received: from nergzd-desktop.localdomain (tor-exit-50.for-privacy.net.
 [185.220.101.50]) by smtp.gmail.com with ESMTPSA id
 a20-20020a056e020e1400b002de6fa0d0c0sm2908009ilk.63.2022.08.06.09.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 09:34:33 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drivers: serial: earlycon: Pass device-tree node
Date: Sat,  6 Aug 2022 19:32:23 +0300
Message-Id: <20220806163255.10404-3-markuss.broks@gmail.com>
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

Pass a pointer to device-tree node in case the driver probed from
OF. This makes early console drivers able to fetch options from
device-tree node properties.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/tty/serial/earlycon.c | 3 +++
 include/linux/serial_core.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/tty/serial/earlycon.c b/drivers/tty/serial/earlycon.c
index bc210ae8173d97d5ef422468acf2755a853cb943..be2f01520f6608f6ece725dd83d2526e30477b47 100644
--- a/drivers/tty/serial/earlycon.c
+++ b/drivers/tty/serial/earlycon.c
@@ -304,6 +304,9 @@ int __init of_setup_earlycon(const struct earlycon_id *match,
 		strlcpy(early_console_dev.options, options,
 			sizeof(early_console_dev.options));
 	}
+
+	early_console_dev.offset = offset;
+
 	earlycon_init(&early_console_dev, match->name);
 	err = match->setup(&early_console_dev, options);
 	earlycon_print_info(&early_console_dev);
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index cbd5070bc87f42aa450c4ca7af8a9b59fbe88574..e65b9aba4e5fdaedb560d2cbbf326a11cfecbcac 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -349,6 +349,7 @@ struct earlycon_device {
 	struct uart_port port;
 	char options[16];		/* e.g., 115200n8 */
 	unsigned int baud;
+	int offset;
 };
 
 struct earlycon_id {
-- 
2.37.0

