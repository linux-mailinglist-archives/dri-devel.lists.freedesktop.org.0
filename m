Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB03094CF
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488546ECA9;
	Sat, 30 Jan 2021 11:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DE76EB48
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 13:56:44 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id w14so6287981pfi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=CeHvwYUb7eHwgxHis6xbKk3bNUrOi7lZ6qQSZZLcAX4=;
 b=CPYLJ9qmKPDuOsRlcAA2kdC+8QReYZargwIArHQVS/lFduGrC63Ud5njOjnib05M1R
 EfAOEt1fuxn57d+d2wHE6iLNVwzjSTE+/IES3zVhPDYrYUtxPD4VbYYV40w7AHNnyaGL
 F/CFJBGkFqSZa3xTGjDcmyBB2/hvrxLmGCfK9ozQyY93WZd1oOf8Xk/sq0x+XAKHP2Fm
 sr9nXm5CK7eRI7b9Lr8wAR6B8ZLJYYbVIyFGpLIh7wIWo8hIrDUb8GpicxkxYy5ZgdKl
 ck4uja6BENibT5a31YMeZz3Qq21eOdRCORMhSiJ+/oPDIYYeWsnPxJyYW5qWDL6NycM4
 7lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=CeHvwYUb7eHwgxHis6xbKk3bNUrOi7lZ6qQSZZLcAX4=;
 b=tPA4zKZuP7Gf7WYnjGX/nFfqezdhdxy0l7NKyZgyS1aOOznakNH93FlGdUHoondftH
 mfXWmono8hWoL9+N3PaaLTYsyR2Bwt4eeScX41DcDwZmzRYtQA++I651Hur7dV11PtIZ
 2t0JIYuDjv9wNdloL2WXNJeZptxPT5P/RMYHPRzXryX1IfOzTdIyP21FQzOuXFJA7K9u
 KEXWa4km5ydH44wCU/Qe+LH9RHAgwgoKoK2Z0xf8lMVWBHzTUVRFkkSs9URPU/4qumRx
 cKirribIm2JFsa0bWabiGvkMNwowa5ZFt3Mj4gpvVqCJRLrTmXn2A5NKZUqSGuAV8hyi
 ZWpQ==
X-Gm-Message-State: AOAM530OdvN/EKaKtoi47TZgdPVQsvEqyJsEaGwcfkrB0QILpP/vYp4o
 W8L9PHPyYMffKWi77/++UK0kFA8HFZXU6tRZ
X-Google-Smtp-Source: ABdhPJwDr69b44kEpqtnhdn2iJg3542IyKPOimazNhwWU8PssD8aa3mzwDHVOTq4LD5Ye7+PTG1UfQ==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr5046479pgm.135.1611928604050; 
 Fri, 29 Jan 2021 05:56:44 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id d4sm9240800pgq.32.2021.01.29.05.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 05:56:43 -0800 (PST)
Date: Fri, 29 Jan 2021 21:56:38 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210129215638.000047b0@gmail.com>
In-Reply-To: <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
Organization: Tyzmig-ryrjum-8kedto
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Jan 2021 12:23:08 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > On Thu, 28 Jan 2021 16:33:02 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> > > On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com>
> > > wrote:
> > >
> > > Thanks for your contribution, my comments below.
> > >  
> > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>  
> > >
> > > You probably have to configure your Git to use the same account
> > > for author and committer.  
> >
> > hi,you mean like below:
> >         Carlis <zhangxuezhi1@yulong.com>
> > ?  
> 
> I meant that you shouldn't probably have a From: line in the commit
> message.
> 
> ...
> 
> > hi, i have modified it according to your suggestion like below:  
> 
> Please, go again thru my comments and comments from others and
> carefully address all of them everywhere in your contribution. If you
> have questions, ask them in reply in the corresponding context.
> 
> ...
> 
> > /**
> >  * init_tearing_effect_line() - init tearing effect line  
> 
> >  *  
> 
> For example, above was commented on and hasn't been addressed here.
> 
> >  * @par: FBTFT parameter object
> >  *
> >  * Return: 0 on success, < 0 if error occurred.
> >  */
> > static int init_tearing_effect_line(struct fbtft_par *par)
> > {
> >         struct device *dev = par->info->device;
> >         struct gpio_desc *te;
> >         int rc;
> >
> >         te = gpiod_get_optional(dev, "te", GPIOD_IN);
> >         if (IS_ERR(te))
> >                 return dev_err_probe(dev, PTR_ERR(te), "Failed to
> >         request te GPIO\n");
> >  
> 
> >         if (te) {  
> 
> This one is not like I suggested.
> 
> >                 par->irq_te = gpiod_to_irq(te);
> >                 gpiod_put(te);
> >  
> 
> >                 if (par->irq_te) {  
> 
> This is wrong.
> 
> >                         rc = devm_request_irq(dev,
> >                                               par->irq_te,
> >                 panel_te_handler,
> >                                               IRQF_TRIGGER_RISING,
> >                 "TE_GPIO", par);  
> 
> Try to use less LOCs.
> 
> >                         if (rc)
> >                                 return dev_err_probe(dev, rc, "TE
> > IRQ request failed.\n");
> >
> >                         disable_irq_nosync(par->irq_te);
> >                         init_completion(&par->panel_te);  
> 
> >                 } else {
> >                         return dev_err_probe(dev, par->irq_te,
> > "gpiod to TE IRQ failed.\n");
> >                 }  
> 
> Again, it is not what had been suggested.
> 
> >         }
> >
> >         return 0;
> > }  
> 
> The rest is better, but we will see later on when you submit a new
> version (And I feel it won't be last).
> 

Hi, I apologize for what I said in the previous two emails. I missed
one email you sent before, and now I probably understand what you
meant. Here is a version I modified according to your suggestion:

From 399e7fb91d1dcba4924cd38cc8283393c80b97e4 Mon Sep 17 00:00:00 2001
From: Carlis <zhangxuezhi1@yulong.com>
Date: Sun, 24 Jan 2021 22:43:21 +0800
Subject: [PATCH v13] staging: fbtft: add tearing signal detect

For st7789v IC,when we need continuous full screen refresh, it is best
to wait for the tearing effect line signal arrive to avoid screen
tearing.

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
v13: change te completion to par data struct member and add a new
     function to deal te gpio request.
v12: change dev_err to dev_err_probe and add space in comments start,
and delete te_mutex, change te wait logic.
v11: remove devm_gpio_put and change a dev_err to dev_info.
v10: additional notes.
v9: change pr_* to dev_*.
v8: delete a log line.
v7: return error value when request fail.
v6: add te gpio request fail deal logic.
v5: fix log print.
v4: modify some code style and change te irq set function name.
v3: modify author and signed-off-by name.
v2: add release te gpio after irq request fail.
---
 drivers/staging/fbtft/fb_st7789v.c | 138
+++++++++++++++++++++++++++++++++++++ drivers/staging/fbtft/fbtft.h
 |   5 ++ 2 files changed, 143 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c
b/drivers/staging/fbtft/fb_st7789v.c index 3a280cc..8faae7a 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -7,9 +7,13 @@
 
 #include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
 #include <linux/module.h>
+
 #include <video/mipi_display.h>
 
 #include "fbtft.h"
@@ -66,6 +70,55 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+#define PANEL_TE_TIMEOUT_MS  34 /* 60Hz for 16.6ms, configured as
2*16.6ms */ +
+static irqreturn_t panel_te_handler(int irq, void *data)
+{
+	struct fbtft_par *par = (struct fbtft_par *)data;
+
+	complete(&par->panel_te);
+	return IRQ_HANDLED;
+}
+
+/**
+ * init_tearing_effect_line() - init tearing effect line
+ *
+ * @par: FBTFT parameter object
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+static int init_tearing_effect_line(struct fbtft_par *par)
+{
+	struct device *dev = par->info->device;
+	struct gpio_desc *te;
+	int rc;
+
+	te = gpiod_get_optional(dev, "te", GPIOD_IN);
+	if (IS_ERR(te))
+		return dev_err_probe(dev, PTR_ERR(te), "Failed to
request te GPIO\n"); +
+	if (!te)
+		return 0;
+
+	par->irq_te = gpiod_to_irq(te);
+
+	/* GPIO is locked as an IRQ, we may drop the reference */
+	gpiod_put(te);
+
+	if (par->irq_te < 0)
+		return par->irq_te;
+
+	init_completion(&par->panel_te);
+	rc = devm_request_irq(dev, par->irq_te, panel_te_handler,
+			      IRQF_TRIGGER_RISING, "TE_GPIO", par);
+	if (rc)
+		return dev_err_probe(dev, rc, "TE IRQ request
failed.\n"); +
+	disable_irq_nosync(par->irq_te);
+
+	return 0;
+}
+
 /**
  * init_display() - initialize the display controller
  *
@@ -82,6 +135,12 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+
+	rc = init_tearing_effect_line(par);
+	if (rc < 0)
+		return rc;
+
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +196,9 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+	if (par->irq_te)
+		write_reg(par, MIPI_DCS_SET_TEAR_ON, 0x00);
+
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
@@ -146,6 +208,81 @@ static int init_display(struct fbtft_par *par)
 }
 
 /**
+ * st7789v_write_vmem16_bus8() - write data to display
+ *
+ * @par: FBTFT parameter object
+ * @offset: offset from screen_buffer
+ * @len: the length of data to be written
+ *
+ * 16 bit pixel over 8-bit databus
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+static int st7789v_write_vmem16_bus8(struct fbtft_par *par, size_t
offset, size_t len) +{
+	struct device *dev = par->info->device;
+	__be16 *txbuf16 = par->txbuf.buf;
+	size_t startbyte_size = 0;
+	size_t tx_array_size;
+	size_t to_copy;
+	size_t remain;
+	u16 *vmem16;
+	int ret = 0;
+	int i;
+
+	fbtft_par_dbg(DEBUG_WRITE_VMEM, par, "st7789v
---%s(offset=%zu, len=%zu)\n",
+		      __func__, offset, len);
+
+	remain = len / 2;
+	vmem16 = (u16 *)(par->info->screen_buffer + offset);
+
+	gpiod_set_value(par->gpio.dc, 1);
+
+	if (par->irq_te) {
+		enable_irq(par->irq_te);
+		reinit_completion(&par->panel_te);
+		ret = wait_for_completion_timeout(&par->panel_te,
+
msecs_to_jiffies(PANEL_TE_TIMEOUT_MS));
+		if (ret == 0)
+			dev_err(dev, "wait panel TE time out\n");
+
+		disable_irq(par->irq_te);
+	}
+
+	/* non buffered write */
+	if (!par->txbuf.buf)
+		return par->fbtftops.write(par, vmem16, len);
+
+	/* buffered write */
+	tx_array_size = par->txbuf.len / 2;
+
+	if (par->startbyte) {
+		txbuf16 = par->txbuf.buf + 1;
+		tx_array_size -= 2;
+		*(u8 *)(par->txbuf.buf) = par->startbyte | 0x2;
+		startbyte_size = 1;
+	}
+
+	while (remain) {
+		to_copy = min(tx_array_size, remain);
+		dev_dbg(dev, "    to_copy=%zu, remain=%zu\n",
+			to_copy, remain - to_copy);
+
+		for (i = 0; i < to_copy; i++)
+			txbuf16[i] = cpu_to_be16(vmem16[i]);
+
+		vmem16 = vmem16 + to_copy;
+		ret = par->fbtftops.write(par, par->txbuf.buf,
+					 startbyte_size + to_copy * 2);
+		if (ret < 0)
+			return ret;
+		remain -= to_copy;
+	}
+
+	return ret;
+}
+
+/**
  * set_var() - apply LCD properties like rotation and BGR mode
  *
  * @par: FBTFT parameter object
@@ -259,6 +396,7 @@ static int blank(struct fbtft_par *par, bool on)
 	.gamma = HSD20_IPS_GAMMA,
 	.fbtftops = {
 		.init_display = init_display,
+		.write_vmem = st7789v_write_vmem16_bus8,
 		.set_var = set_var,
 		.set_gamma = set_gamma,
 		.blank = blank,
diff --git a/drivers/staging/fbtft/fbtft.h
b/drivers/staging/fbtft/fbtft.h index 76f8c09..cf8d83f 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -8,6 +8,7 @@
 #include <linux/spinlock.h>
 #include <linux/spi/spi.h>
 #include <linux/platform_device.h>
+#include <linux/completion.h>
 
 #define FBTFT_ONBOARD_BACKLIGHT 2
 
@@ -165,6 +166,8 @@ struct fbtft_platform_data {
  *             Format: 6 bit Device id + RS bit + RW bit
  * @fbtftops: FBTFT operations provided by driver or device
(platform_data)
  * @dirty_lock: Protects dirty_lines_start and dirty_lines_end
+ * @panel_te: completion for panel te line
+ * @irq_te: LCD Chip tearing effect line
  * @dirty_lines_start: Where to begin updating display
  * @dirty_lines_end: Where to end updating display
  * @gpio.reset: GPIO used to reset display
@@ -203,6 +206,8 @@ struct fbtft_par {
 	u8 startbyte;
 	struct fbtft_ops fbtftops;
 	spinlock_t dirty_lock;
+	struct completion panel_te;
+	int irq_te;
 	unsigned int dirty_lines_start;
 	unsigned int dirty_lines_end;
 	struct {
-- 
1.9.1


regards,
Carlis

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
