Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44C3094CE
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEC26ECA8;
	Sat, 30 Jan 2021 11:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56326EC87
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 06:39:31 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id u11so6648602plg.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 22:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=TANixHB1VghGJvUItmZRy+uLix9/H4aSqcnAzrKjFBE=;
 b=T4CRyO1szRQ0/ybotrnrWq6fV5wBmc5Oa0bouNJ6DA8t+KkTh452zOK4hqN+tAKE+g
 SgECaofNxz3i//yrAFtiQo7qdPEPHRSRJsK0fwSSiGscDYxZ/sDIISz3mHuSjpf0eDdY
 mjay+t0F2sxzBCOwXFC1bg+vTJ90c/TOL/j/ZSPYpv5fZtKz0Np3FfgdjXVFQS4QAJmb
 RlBvbTOjNm3jd8pYvJYdACiSRg0BRtQ9muhClDFdcfKmfT78vxyY/rRVd+OjCctD9dTP
 AT9J9LC6AOr7OSFl0jPhhLHXOhS5kvAV7mahZfnCcKZbV/u8d+XIe99uvtSIx4mazpO/
 Ydug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=TANixHB1VghGJvUItmZRy+uLix9/H4aSqcnAzrKjFBE=;
 b=nMTLICHF1zMoPZetK5Fyz+bVuRWzoPuNxerMB9hHOSqMiUHWaE9rz7Vf1jIiCuA9oE
 xv+HAqDXjfI+dikd7GuKTel66Pgp9QrrvunwrbkdYmiqD+2j3UYpjDdR5Vjegg02Lmmt
 2x/PmWebLwFhbqYYK5wMiQ16Y4tYrGDPDPRGmv+llYrbtJSU2aE2Lon3OdWotxw0YxzM
 P/2Qq6uo1/r/UaaMWjLqWJfLd7I+dIbWmBxcRCW+j8vZkl0pyga2n+h4WkdDTedV5eZs
 gHPDqhiHTgQOpMRUi+jICn9bbrJTjvKV7hBgEBtywrNfYHH8sqtRC/Rxi2ok7qpYmngv
 RoJQ==
X-Gm-Message-State: AOAM530E3A2/LyxZvttJylcGBMLTi5XhOMUs8jvFbAXhchOcW26i3vW0
 zDsDq/pbLWnb+ZEDg9mG3I0=
X-Google-Smtp-Source: ABdhPJznlhJCt2LNVfTUGyGHmkAifzTWGztAOXlfqCmGbmi3wonXDaAJr5lCg8Q1B9X5uB6Z8XvqGQ==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr8089143plh.38.1611988771137; 
 Fri, 29 Jan 2021 22:39:31 -0800 (PST)
Received: from localhost ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id j14sm9083885pjl.35.2021.01.29.22.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 22:39:30 -0800 (PST)
Date: Sat, 30 Jan 2021 14:39:24 +0800
From: carlis <zhangxuezhi3@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <20210130143924.00005432@gmail.com>
In-Reply-To: <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129215638.000047b0@gmail.com>
 <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
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

On Fri, 29 Jan 2021 16:26:12 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Jan 29, 2021 at 3:56 PM carlis <zhangxuezhi3@gmail.com> wrote:
> > On Fri, 29 Jan 2021 12:23:08 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:  
> 
> We are almost there, I have no idea what Noralf or others are going to
> say though.
> 
> ...
> 
> > Hi, I apologize for what I said in the previous two emails. I missed
> > one email you sent before, and now I probably understand what you
> > meant. Here is a version I modified according to your suggestion:
> >
> > From 399e7fb91d1dcba4924cd38cc8283393c80b97e4 Mon Sep 17 00:00:00
> > 2001 From: Carlis <zhangxuezhi1@yulong.com>
> > Date: Sun, 24 Jan 2021 22:43:21 +0800
> > Subject: [PATCH v13] staging: fbtft: add tearing signal detect
> >
> > For st7789v IC,when we need continuous full screen refresh, it is
> > best  
> 
> Missed space after comma.
> 
> > to wait for the tearing effect line signal arrive to avoid screen  
> 
> to arrive
> 
> > tearing.  
> 
> ...
> 
> > +#define PANEL_TE_TIMEOUT_MS  34 /* 60Hz for 16.6ms, configured as
> > 2*16.6ms */ +  
> 
> Move comment before the definition
> /* comment */
> #define DEFINITION
> 
> Also consider to use 33 ms as closest to what you mentioned in the
> comment. Or leave it with mention that you are using ceil() value.
> 
> ...
> 
> > +/**
> > + * init_tearing_effect_line() - init tearing effect line  
> 
> > + *  
> 
> As per a few previous reviews.
> Okay, I have noticed that the existing kernel-doc is written like
> this, but it doesn't prevent you from avoiding this little mistake.
> 
> > + * @par: FBTFT parameter object
> > + *
> > + * Return: 0 on success, or a negative error code otherwise.
> > + */
> > +static int init_tearing_effect_line(struct fbtft_par *par)
> > +{
> > +       struct device *dev = par->info->device;
> > +       struct gpio_desc *te;
> > +       int rc;
> > +
> > +       te = gpiod_get_optional(dev, "te", GPIOD_IN);
> > +       if (IS_ERR(te))
> > +               return dev_err_probe(dev, PTR_ERR(te), "Failed to
> > request te GPIO\n"); +  
> 
> Below is okay, but needs a comment explaining why we return a success.
> 
> > +       if (!te)
> > +               return 0;
> > +
> > +       par->irq_te = gpiod_to_irq(te);
> > +
> > +       /* GPIO is locked as an IRQ, we may drop the reference */
> > +       gpiod_put(te);
> > +
> > +       if (par->irq_te < 0)
> > +               return par->irq_te;  
> 
> I recommend using a temporary variable. In such a case you won't need
> to specifically check for negative error code. So, something like
> 
> int irq;
> 
> irq = ...
> 
> if (irq < 0)
>   return irq;
> 
> ->irq_te = irq;  
> 
> > +       init_completion(&par->panel_te);
> > +       rc = devm_request_irq(dev, par->irq_te, panel_te_handler,
> > +                             IRQF_TRIGGER_RISING, "TE_GPIO", par);
> >  
> 
> Right. Now it needs a comment explaining the choice of rising edge
> type of IRQ.
> 
> > +       if (rc)
> > +               return dev_err_probe(dev, rc, "TE IRQ request
> > failed.\n"); +
> > +       disable_irq_nosync(par->irq_te);
> > +
> > +       return 0;
> > +}  
> 
> ...
> 
> > +       rc = init_tearing_effect_line(par);  
> 
> > +       if (rc < 0)  
> 
> Here is no need to specifically check against less than 0,
>   if (ret)
> will work nicely.
> 
> > +               return rc;  
> 
> ...
> 
> > +       if (par->irq_te)
> > +               write_reg(par, MIPI_DCS_SET_TEAR_ON, 0x00);  
> 
> Do you need to call MIPI_DCS_SET_TEAR_SCANLINE in this case?
> 
Hi, TE line output is off by default when powering on, and I use
Qualcomm SDX55 chip, SPI top speed is only 50MHz, its data transmission
speed( It takes about 24ms to transmit a frame) is slower than 60Hz
refresh(a frame only need 16.6ms), so i think there is no need to call
MIPI_DCS_SET_TEAR_SCANLINE 

> Alos, when there is no IRQ, shouldn't we explicitly call
>                write_reg(par, MIPI_DCS_SET_TEAR_OFF);
> ?
> 
> ...
> 
> >  /**
> > + * st7789v_write_vmem16_bus8() - write data to display  
> 
> > + *  
> 
> Redundant.
> 
> > + * @par: FBTFT parameter object
> > + * @offset: offset from screen_buffer
> > + * @len: the length of data to be written
> > + *  
> 
> > + * 16 bit pixel over 8-bit databus  
> 
> Write 16-bit pixels over 8-bit data bus.
> 
> > + * Return: 0 on success, or a negative error code otherwise.
> > + */  
> 
> ...
> 
> > +       if (par->irq_te) {
> > +               enable_irq(par->irq_te);
> > +               reinit_completion(&par->panel_te);
> > +               ret = wait_for_completion_timeout(&par->panel_te,
> > +
> > msecs_to_jiffies(PANEL_TE_TIMEOUT_MS));
> > +               if (ret == 0)
> > +                       dev_err(dev, "wait panel TE time out\n");  
> 
> timeout
> 
> > +
> > +               disable_irq(par->irq_te);
> > +       }  
> 
> ...
> 
> > + * @panel_te: completion for panel te line  
> 
> TE line
> 
> > + * @irq_te: LCD Chip tearing effect line  
> 
> "Linux IRQ for LCD..."
> 

hi, i modify new below:

From b65fc2bfbe123defc8ec838601a9c12707f70c53 Mon Sep 17 00:00:00 2001
From: Carlis <zhangxuezhi1@yulong.com>
Date: Sun, 24 Jan 2021 22:43:21 +0800
Subject: [PATCH v13] staging: fbtft: add tearing signal detect

For st7789v IC, when we need continuous full screen refresh, it is best
to wait for the tearing effect line signal to arrive to avoid screen
tearing.

Signed-off-by: Carlis <zhangxuezhi1@yulong.com>
---
v13: change TE completion to par data struct member and add a new
     function to deal te gpio request, move wait logic to
fbtft_write_vmem16_bus8. v12: change dev_err to dev_err_probe and add
space in comments start, and delete te_mutex, change te wait logic.
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
 drivers/staging/fbtft/fb_st7789v.c | 64
++++++++++++++++++++++++++++++++++++++
drivers/staging/fbtft/fbtft-bus.c  | 20 ++++++++++--
drivers/staging/fbtft/fbtft.h      |  5 +++ 3 files changed, 87
insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c
b/drivers/staging/fbtft/fb_st7789v.c index 3a280cc..695dcac 100644
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
@@ -66,6 +70,56 @@ enum st7789v_command {
 #define MADCTL_MX BIT(6) /* bitmask for column address order */
 #define MADCTL_MY BIT(7) /* bitmask for page address order */
 
+static irqreturn_t panel_te_handler(int irq, void *data)
+{
+	struct fbtft_par *par = (struct fbtft_par *)data;
+
+	complete(&par->panel_te);
+	return IRQ_HANDLED;
+}
+
+/*
+ * init_tearing_effect_line() - init tearing effect line.
+ * @par: FBTFT parameter object.
+ *
+ * Return: 0 on success, or a negative error code otherwise.
+ */
+static int init_tearing_effect_line(struct fbtft_par *par)
+{
+	struct device *dev = par->info->device;
+	struct gpio_desc *te;
+	int rc, irq;
+
+	te = gpiod_get_optional(dev, "te", GPIOD_IN);
+	if (IS_ERR(te))
+		return dev_err_probe(dev, PTR_ERR(te), "Failed to
request te GPIO\n"); +
+	/* if te is NULL, indicating no configuration, directly return
success */
+	if (!te)
+		return 0;
+
+	irq = gpiod_to_irq(te);
+
+	/* GPIO is locked as an IRQ, we may drop the reference */
+	gpiod_put(te);
+
+	if (irq < 0)
+		return irq;
+
+	par->irq_te = irq;
+	init_completion(&par->panel_te);
+
+	/* The effective state is high and lasts no more than 1000
microseconds */
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
@@ -82,6 +136,12 @@ enum st7789v_command {
  */
 static int init_display(struct fbtft_par *par)
 {
+	int rc;
+
+	rc = init_tearing_effect_line(par);
+	if (rc)
+		return rc;
+
 	/* turn off sleep mode */
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	mdelay(120);
@@ -137,6 +197,10 @@ static int init_display(struct fbtft_par *par)
 	 */
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
+	/* TE line output is off by default when powering on */
+	if (par->irq_te)
+		write_reg(par, MIPI_DCS_SET_TEAR_ON, 0x00);
+
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	if (HSD20_IPS)
diff --git a/drivers/staging/fbtft/fbtft-bus.c
b/drivers/staging/fbtft/fbtft-bus.c index 63c65dd..5bc2fff 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -2,9 +2,15 @@
 #include <linux/export.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/completion.h>
 #include <linux/spi/spi.h>
+
 #include "fbtft.h"
 
+/* 60Hz for 16.6ms, configured as 2*16.6ms */
+#define PANEL_TE_TIMEOUT_MS  33
+
 /*****************************************************************************
  *
  *   void (*write_reg)(struct fbtft_par *par, int len, ...);
@@ -135,8 +141,18 @@ int fbtft_write_vmem16_bus8(struct fbtft_par *par,
size_t offset, size_t len) remain = len / 2;
 	vmem16 = (u16 *)(par->info->screen_buffer + offset);
 
-	if (par->gpio.dc)
-		gpiod_set_value(par->gpio.dc, 1);
+	gpiod_set_value(par->gpio.dc, 1);
+
+	if (par->irq_te) {
+		enable_irq(par->irq_te);
+		reinit_completion(&par->panel_te);
+		ret = wait_for_completion_timeout(&par->panel_te,
+
msecs_to_jiffies(PANEL_TE_TIMEOUT_MS));
+		if (ret == 0)
+			dev_err(par->info->device, "wait panel TE
timeout\n"); +
+		disable_irq(par->irq_te);
+	}
 
 	/* non buffered write */
 	if (!par->txbuf.buf)
diff --git a/drivers/staging/fbtft/fbtft.h
b/drivers/staging/fbtft/fbtft.h index 76f8c09..61c7207 100644
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
+ * @panel_te: completion for panel TE line
+ * @irq_te: Linux IRQ for LCD TE line
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
