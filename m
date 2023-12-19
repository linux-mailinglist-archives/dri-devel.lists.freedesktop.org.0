Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE478192E2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7C010E525;
	Tue, 19 Dec 2023 22:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DDE10E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B56CCCE1A49;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0E10C433CD;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=PvOL9owNF2Ng6LxW7GH7pqhSC0pz/LAIOTcjgaK0OH4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tk3vhMhvqHmOnXWItGr8nAQvwmYbUhB3feES7BPxAn8Hcie4cRM1hYReHXfQjXaKT
 tEOhRGzwg8CS8+PTABIuRcFS1AxYb2J0YA0frp/bH1Fi7VK/LnTSX/VgDTErEkgy0h
 uIc8Usem7yKoHIMfSdZYIh4JdGhT06fj3wEpJffC2zPN/F5kAieNgB/qaYeJANEfwH
 JuV3tTk1XWyf1vlVbpqsPBrDsDWuNJMGpEB93ZxdgbrHgJLaVM56thLRNBFFHzTcZY
 8dMzLa9dhpKpYgvqLNDmRUO0dajPof1OmPIUbKVRGM4Hr5lM+IoAZQ4g65ZaiUf45n
 tjeX79QI4MuoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8A399C46CD7;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:09 +0100
Subject: [PATCH 04/27] sparc32: Drop sun4m specific led driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-4-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=5266;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=w/RBrmmZ8Yg5ZhjQjAlbJAmo7mwa0rCWWJGIHV2crps=; =?utf-8?q?b=3DTeV6xXOFygK5?=
 =?utf-8?q?5e17IwhpcZDv8UodKRmHjUsOo5OdOB31c5kiG9eX2d59myzar3EODv/zPQnrG0Nr?=
 easM3BasDDyIMfs3BRDC5uRzyD9VOZoN+HRnA+lB7XfHNrrOW/MI
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The led driver is only relevant for the sun4m machines.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/Kconfig         |   9 ---
 arch/sparc/kernel/Makefile |   1 -
 arch/sparc/kernel/led.c    | 146 ---------------------------------------------
 3 files changed, 156 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 54c91431724b..1520f68e944a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -331,15 +331,6 @@ config SUN_PM
 	  Enable power management and CPU standby features on supported
 	  SPARC platforms.
 
-config SPARC_LED
-	tristate "Sun4m LED driver"
-	depends on SPARC32
-	help
-	  This driver toggles the front-panel LED on sun4m systems
-	  in a user-specifiable manner.  Its state can be probed
-	  by reading /proc/led and its blinking mode can be changed
-	  via writes to /proc/led
-
 config SERIAL_CONSOLE
 	bool
 	depends on SPARC32
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index 0984bb6f0f17..95687af45d20 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -90,7 +90,6 @@ obj-y                     += termios.o
 
 obj-$(CONFIG_MODULES)     += module.o
 obj-$(CONFIG_MODULES)     += sparc_ksyms.o
-obj-$(CONFIG_SPARC_LED)   += led.o
 obj-$(CONFIG_KGDB)        += kgdb_$(BITS).o
 
 obj-$(CONFIG_DYNAMIC_FTRACE) += ftrace.o
diff --git a/arch/sparc/kernel/led.c b/arch/sparc/kernel/led.c
deleted file mode 100644
index ab657b359789..000000000000
--- a/arch/sparc/kernel/led.c
+++ /dev/null
@@ -1,146 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/jiffies.h>
-#include <linux/timer.h>
-#include <linux/uaccess.h>
-#include <linux/sched/loadavg.h>
-
-#include <asm/auxio.h>
-
-#define LED_MAX_LENGTH 8 /* maximum chars written to proc file */
-
-static inline void led_toggle(void)
-{
-	unsigned char val = get_auxio();
-	unsigned char on, off;
-
-	if (val & AUXIO_LED) {
-		on = 0;
-		off = AUXIO_LED;
-	} else {
-		on = AUXIO_LED;
-		off = 0;
-	}
-
-	set_auxio(on, off);
-}
-
-static struct timer_list led_blink_timer;
-static unsigned long led_blink_timer_timeout;
-
-static void led_blink(struct timer_list *unused)
-{
-	unsigned long timeout = led_blink_timer_timeout;
-
-	led_toggle();
-
-	/* reschedule */
-	if (!timeout) { /* blink according to load */
-		led_blink_timer.expires = jiffies +
-			((1 + (avenrun[0] >> FSHIFT)) * HZ);
-	} else { /* blink at user specified interval */
-		led_blink_timer.expires = jiffies + (timeout * HZ);
-	}
-	add_timer(&led_blink_timer);
-}
-
-#ifdef CONFIG_PROC_FS
-static int led_proc_show(struct seq_file *m, void *v)
-{
-	if (get_auxio() & AUXIO_LED)
-		seq_puts(m, "on\n");
-	else
-		seq_puts(m, "off\n");
-	return 0;
-}
-
-static int led_proc_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, led_proc_show, NULL);
-}
-
-static ssize_t led_proc_write(struct file *file, const char __user *buffer,
-			      size_t count, loff_t *ppos)
-{
-	char *buf = NULL;
-
-	if (count > LED_MAX_LENGTH)
-		count = LED_MAX_LENGTH;
-
-	buf = memdup_user_nul(buffer, count);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	/* work around \n when echo'ing into proc */
-	if (buf[count - 1] == '\n')
-		buf[count - 1] = '\0';
-
-	/* before we change anything we want to stop any running timers,
-	 * otherwise calls such as on will have no persistent effect
-	 */
-	del_timer_sync(&led_blink_timer);
-
-	if (!strcmp(buf, "on")) {
-		auxio_set_led(AUXIO_LED_ON);
-	} else if (!strcmp(buf, "toggle")) {
-		led_toggle();
-	} else if ((*buf > '0') && (*buf <= '9')) {
-		led_blink_timer_timeout = simple_strtoul(buf, NULL, 10);
-		led_blink(&led_blink_timer);
-	} else if (!strcmp(buf, "load")) {
-		led_blink_timer_timeout = 0;
-		led_blink(&led_blink_timer);
-	} else {
-		auxio_set_led(AUXIO_LED_OFF);
-	}
-
-	kfree(buf);
-
-	return count;
-}
-
-static const struct proc_ops led_proc_ops = {
-	.proc_open	= led_proc_open,
-	.proc_read	= seq_read,
-	.proc_lseek	= seq_lseek,
-	.proc_release	= single_release,
-	.proc_write	= led_proc_write,
-};
-#endif
-
-#define LED_VERSION	"0.1"
-
-static int __init led_init(void)
-{
-	timer_setup(&led_blink_timer, led_blink, 0);
-
-#ifdef CONFIG_PROC_FS
-	if (!proc_create("led", 0, NULL, &led_proc_ops))
-		return -ENOMEM;
-#endif
-	printk(KERN_INFO
-	       "led: version %s, Lars Kotthoff <metalhead@metalhead.ws>\n",
-	       LED_VERSION);
-
-	return 0;
-}
-
-static void __exit led_exit(void)
-{
-	remove_proc_entry("led", NULL);
-	del_timer_sync(&led_blink_timer);
-}
-
-module_init(led_init);
-module_exit(led_exit);
-
-MODULE_AUTHOR("Lars Kotthoff <metalhead@metalhead.ws>");
-MODULE_DESCRIPTION("Provides control of the front LED on SPARC systems.");
-MODULE_LICENSE("GPL");
-MODULE_VERSION(LED_VERSION);

-- 
2.34.1

