Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FEF8A7D10
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 09:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B01D11323A;
	Wed, 17 Apr 2024 07:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.b="B4EKl7sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic310-24.consmr.mail.ne1.yahoo.com
 (sonic310-24.consmr.mail.ne1.yahoo.com [66.163.186.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD6F112E39
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 20:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713298495; bh=iZgtGGZ+o2qQOMTF6tCLpgz1PmbtD2vBGZSP/gGVln0=;
 h=Subject:From:To:Date:References:From:Subject:Reply-To;
 b=B4EKl7sKCyiEi7IfleyQbwq/fvyU7ZcHZ9WO/LLg4B3Hxlx1Zsl4GxAcZwbOW8YTiUWWLRZ3uMrZQxSiFVkhW2N8YdNVcxNV5eNx77/3I3OrQE6Bzn9ZNZz7iTab1sxwD9VpD6B8BmVXJIm7Ye0obhXL562MU+GL0HsJkrUb9TGHzuMue/mjZARgjsjSL+YhRQBKHX4CyCAsQkQmgTQzZcPeoEO+Efw1FQ6EV5O7PXaffl00+l1nO7Y2QsjDhYPN8zNonBIurrTViPhblXvZnrRq0fxEb9UneDQ9GYw/CncdjOTALXBudRDTNjNzNgkk2JmNurW7+ggMfwIpbJiWOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1713298495; bh=PW1mmMDFh3DNKfOKZFou1Dz2YeRrclHmgXlImryPW7v=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=MQD9A6H/llQn2sxcvGLKqiuBN+a6wyeW8TdbwAQDCHUZIn3rb23u88tqVMa0zAEt1LkN+N4kiricxrvCfDzl64NiK7EcdmZqGDvINyaW0Xo30PEmk57tSEQ4Mmrqf4tKyTzbZe1RNEnepZSWZ6BTm6CnCn/fBhuoL4MV9dqbxmifIcs9Djo2CQ37/Jl4wvc4ZMHR9Z8688qhzymzFCVTvZhaFg0CNxkX4Q5naXIB7TBtI8mZgtNyH9e/WUyu4gzIAJr1rr/6Agcjjew0xRrF/i7QHF9BaB+HENRpRwuDMdUdC7QGe2xsjNzDOSfhIL0v81J7268NhuWiB1KigJ6uOg==
X-YMail-OSG: 3uyJAa4VM1mFnDbn1AszT5Z1T1FdAIgJd.uGwonq0dv90Dg8qZefmyMR4a5crzo
 zcDOcXPMX.p7eotL0mX7GLOokG9NbbF3B28QJujXy9dN3C_Dkl6nkdA6QL_iE9eY5FpqtwuPFZDI
 fhGiER0shB_H7wHWBfDSJ6w77BEqjUFK9o.1ykVOZNhZx2Pfr4Ww9Azq363FI6lDZHqWwFDtkhkM
 yPhvwP1IKon5OCMJqoP2hYe8nJ9NJPwRNIKTP.fRUbbAKYZm_zjorQ7yA_9jwe5xtEWyBgOCtYJT
 i_aaL90r.va8vMBmVx0WIYvu_YB1HGg98zVgJiv6mDpLEu8MQiGRPWB4q8gppxmJXcwgf.hTNLTL
 xzw__3MLrAQHUvrV.zmftIzyMiipYvqowzrUouAxDE1vZt7T.OIui3vhB_wS24RW32PxLGYeMrVr
 xO0Y1QRqTTWBK13BdCeQlcCAx6vXG6d1Zm5OnQEDw1mkhsPQiEo5uioCeK.kajMz39OZuZn3daUU
 k8b.CDb8z3WUH7XHHb3Qs07V.AXNObu4ZbFo7sNJadF1Po4TzoH9W8Swbr_7zp0TyAV3u_e79BPH
 _e.allV.wohi6C5lhtlN8V.G3BUDpd01UZE9GxxQFu9iKRKijmzAdG6f6YC51pDXJbw9vuMIA.4t
 HGZONj0wYtFyYCaVGLFCokrqdOICEyBVcHoxFUIlZ9nLgX.q91dGr2I81gzEf0YEH1Dd.7cVzo.9
 34MkwDyZW8tKD8qozG1S30uNx1Hh1GH1uzRgLiUDRmjs8cjhZxAlDMja2BqrBEeXuzuPPucujw7i
 w.tgSiBrvrI67h40UcjaXxqwHTTHAigSMZiXGrgbU8tF61EdEhCbzJaF0YwKbk2in5KLLt0d185D
 dkRMI0FmKTlreXMsc.0Y3bDK.j.LFrNonJmlKzmk.DQyxH75b8GzYL7O_01xzaourOkdB8YDeUDC
 r9vV9ZOdudx27osU7fQ.HOVgQFvaLmaBovHN3NqhFzya5TYW_R4fpjUwfwYLVqP2vmxycsfFaiu1
 BAYAxYBHtnj3pXOytGzKuS9lpa.s9NnOBnLTj0xJcorXXhr.pW1mzDpY.q9pcEfiWdiKP3TifdZj
 IS2Dpxcuq07f_WE9WDsoLFyR7GJ3vk0mcquYOb.wbnxT1y.gmJnEyprfRVCetXXtemeAg7B7v2vF
 Ifxi41YX.5lg1d0vmXEsjIVvTiEq2aqZjlIt5dQiM44SXfQ6RL1A0vFs2EXLcvsRc0EeO8gASWCL
 uwPbPQXbkZY5ZTQt0_ihB3FaHqBq.6C0pINcWN25VIWzbYy.ufGhL6gzrIW4c2sN3uarPiLTwGfl
 Dq1Au9gy9VLqd_L_cwnjQWlaNnhTlengvsbvFoES21LPvAoN7zqC0PZggZ52s.jd1ZeqdKGItZbf
 G5L3LrVEhDd8PECPtVw2CSvEjKXjI8PbbKL2dpptERsq3TVXxke_ua5dh6ErB5m5xQ2PkoE6YJXX
 Gfjw.94560LxkNW8ldvRJCE4x4yiDGHYJviI5XfGKEnojtxfkqm0e.XKjiIobAhvRGl2XtDO66BW
 Mx9lB1hpfD_fBiiwJLWtyoWWlSBCFNLrJva_0SLJlsLNYRmxzKYqmSa7Bt2CvOkfyc0iMkemJjNa
 1lkAP8lUQ1fQqr3.PhnoUZUbjVUC4npjZfs15fs28XlSLCisv6FXttsN_HaIcq8sUIyHJu5dF2Z8
 bLmyWS6Vyebf04YcrKch4Y.oIU2BuwRkkBkTAYxqk9RQGXy_YxDLYWX_H846XemuJN.n_o4OUms2
 7FGiJXyHVElXLCK0LunJkd7ceB3V6BrbqfPGDkSgRiHmKgWhmEqUQeJNcu1khve3wSyYHDL.67a5
 7VfJYBC2.xRxtkytCLklkot6CVG_wF4J.1dpvIvXc25qqgB4imuM8oZ_lj954BnASTQ9yuFeZoCe
 Ff6llHlg3HbRYZZuPl82XfHLvzsxeAyqnlMmlS9JF1y6jBM_nlIEKkbZhGIeGbrJA57l785YmX3F
 uydyli9mhcSxDFmWC0vPxLwEm.nZHaNhWxAMCBwZXUQWxVqF2KG_RhNFSkK2qrPcjmLW0KmU.mf5
 ZgVj_UwpZLsMPWYrpFaXw0OtMH733LsTEjwJ5YnmXM6wMM1BYcshi5he_b1jaNYSk8FERob4DyYk
 Id1f3BbcpEAKvn2HWQIR7fsXclAsGS7BTn8OXNJd9UznMlOj1UyndHhEFZ_igewkxBp37VLV0Kxt
 sKfH0dTYNIDsTprxqbNFp8JQsXZKsgp4.F09Aml7az1OzJSrvbECuojGf5oBPsadvgmST.Lgd_gz
 GARoauBtmLG7Nas_mzVIYWZRweWo43xFkeXRtTKAknig-
X-Sonic-MF: <ashokemailat@yahoo.com>
X-Sonic-ID: e776ce5b-2ecd-4172-a11d-16b719dd513e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Tue, 16 Apr 2024 20:14:55 +0000
Received: by hermes--production-bf1-5cc9fc94c8-tmzjr (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f7cd3a3627d699b4c5bb0c83112631a2; 
 Tue, 16 Apr 2024 20:14:54 +0000 (UTC)
Message-ID: <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel@yahoo.com>
Subject: [PATCH] staging: fbtft Removed redundant parentheses
From: A <ashokemailat@yahoo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 outreachy@lists.linux.dev
Date: Tue, 16 Apr 2024 13:14:52 -0700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
References: <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel.ref@yahoo.com>
X-Mailer: WebService/1.1.22205
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Approved-At: Wed, 17 Apr 2024 07:31:22 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 6dbcb120581fc7cb45812193227b0a197abd8ba4 Mon Sep 17 00:00:00 2001
From: Ashok Kumar <ashokemailat@yahoo.com>
Date: Tue, 16 Apr 2024 09:19:32 -0700
Subject: [PATCH] [PATCH] staging: fbtft Removed redundant parentheses on
 logical expr

Adhere to Linux Kernel coding style removed redundant parentheses,
multiple blank lines and indentation alignment.

Reported by checkpatch.pl

------
fb_ili9320.c

+       if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))

------
fb_ra8875.c

CHECK: Unnecessary parentheses around 'par->info->var.xres =3D=3D 320'
+      if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=3D
240)) {

------
fb_ssd1325.c

CHECK: Please don't use multiple blank lines
------

fb_tinylcd.c    - indentation adjustment

-----
fbtft-bus.c

CHECK: Unnecessary parentheses around 'par->spi->bits_per_word =3D=3D 8'

------
fbtft-core.c

CHECK: Please don't use multiple blank lines

CHECK: Unnecessary parentheses around '!txbuflen'

CHECK: Please don't use multiple blank lines
------

Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
---
 drivers/staging/fbtft/fb_ili9320.c | 2 +-
 drivers/staging/fbtft/fb_ra8875.c  | 8 ++++----
 drivers/staging/fbtft/fb_ssd1325.c | 2 --
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
 drivers/staging/fbtft/fbtft-core.c | 7 +------
 6 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ili9320.c
b/drivers/staging/fbtft/fb_ili9320.c
index 0be7c2d51548..409b54cc562e 100644
--- a/drivers/staging/fbtft/fb_ili9320.c
+++ b/drivers/staging/fbtft/fb_ili9320.c
@@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
 	devcode =3D read_devicecode(par);
 	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code:
0x%04X\n",
 		      devcode);
-	if ((devcode !=3D 0x0000) && (devcode !=3D 0x9320))
+	if (devcode !=3D 0x0000 && devcode !=3D 0x9320)
 		dev_warn(par->info->device,
 			 "Unrecognized Device code: 0x%04X (expected
0x9320)\n",
 			devcode);
diff --git a/drivers/staging/fbtft/fb_ra8875.c
b/drivers/staging/fbtft/fb_ra8875.c
index 398bdbf53c9a..4b79fb48c5f0 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
=20
 	par->fbtftops.reset(par);
=20
-	if ((par->info->var.xres =3D=3D 320) && (par->info->var.yres =3D=3D
240)) {
+	if (par->info->var.xres =3D=3D 320 && par->info->var.yres =3D=3D 240)
{
 		/* PLL clock frequency */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -74,8 +74,8 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x1D, 0x0E);
 		write_reg(par, 0x1E, 0x00);
 		write_reg(par, 0x1F, 0x02);
-	} else if ((par->info->var.xres =3D=3D 480) &&
-		   (par->info->var.yres =3D=3D 272)) {
+	} else if (par->info->var.xres =3D=3D 480 &&
+		   par->info->var.yres =3D=3D 272) {
 		/* PLL clock frequency  */
 		write_reg(par, 0x88, 0x0A);
 		write_reg(par, 0x89, 0x02);
@@ -111,7 +111,7 @@ static int init_display(struct fbtft_par *par)
 		write_reg(par, 0x04, 0x01);
 		mdelay(1);
 		/* horizontal settings */
-		write_reg(par, 0x14, 0x4F);
+write_reg(par, 0x14, 0x4F);
 		write_reg(par, 0x15, 0x05);
 		write_reg(par, 0x16, 0x0F);
 		write_reg(par, 0x17, 0x01);
diff --git a/drivers/staging/fbtft/fb_ssd1325.c
b/drivers/staging/fbtft/fb_ssd1325.c
index 796a2ac3e194..69aa808c7e23 100644
--- a/drivers/staging/fbtft/fb_ssd1325.c
+++ b/drivers/staging/fbtft/fb_ssd1325.c
@@ -109,8 +109,6 @@ static int set_gamma(struct fbtft_par *par, u32
*curves)
 {
 	int i;
=20
-	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "%s()\n", __func__);
-
 	for (i =3D 0; i < GAMMA_LEN; i++) {
 		if (i > 0 && curves[i] < 1) {
 			dev_err(par->info->device,
diff --git a/drivers/staging/fbtft/fb_tinylcd.c
b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..60cda57bcb33 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	udelay(250);
diff --git a/drivers/staging/fbtft/fbtft-bus.c
b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..02d7dbd38678 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@
out:									      \
 }                                                                   =20
\
 EXPORT_SYMBOL(func);
=20
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16,
cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
=20
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
@@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int
len, ...)
 	if (len <=3D 0)
 		return;
=20
-	if (par->spi && (par->spi->bits_per_word =3D=3D 8)) {
+	if (par->spi && par->spi->bits_per_word =3D=3D 8) {
 		/* we're emulating 9-bit, pad start of buffer with no-
ops
 		 * (assuming here that zero is a no-op)
 		 */
diff --git a/drivers/staging/fbtft/fbtft-core.c
b/drivers/staging/fbtft/fbtft-core.c
index 38845f23023f..98ffca49df81 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -216,8 +216,6 @@ static void fbtft_reset(struct fbtft_par *par)
 	if (!par->gpio.reset)
 		return;
=20
-	fbtft_par_dbg(DEBUG_RESET, par, "%s()\n", __func__);
-
 	gpiod_set_value_cansleep(par->gpio.reset, 1);
 	usleep_range(20, 40);
 	gpiod_set_value_cansleep(par->gpio.reset, 0);
@@ -667,7 +665,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct
fbtft_display *display,
 		txbuflen =3D 0;
=20
 #ifdef __LITTLE_ENDIAN
-	if ((!txbuflen) && (bpp > 8))
+	if (!txbuflen && bpp > 8)
 		txbuflen =3D PAGE_SIZE; /* need buffer for byteswapping
*/
 #endif
=20
@@ -1053,8 +1051,6 @@ static int fbtft_verify_gpios(struct fbtft_par
*par)
 	struct fbtft_platform_data *pdata =3D par->pdata;
 	int i;
=20
-	fbtft_par_dbg(DEBUG_VERIFY_GPIOS, par, "%s()\n", __func__);
-
 	if (pdata->display.buswidth !=3D 9 &&  par->startbyte =3D=3D 0 &&
 	    !par->gpio.dc) {
 		dev_err(par->info->device,
@@ -1159,7 +1155,6 @@ int fbtft_probe_common(struct fbtft_display
*display,
 		dev =3D &pdev->dev;
=20
 	if (unlikely(display->debug & DEBUG_DRIVER_INIT_FUNCTIONS))
-		dev_info(dev, "%s()\n", __func__);
=20
 	pdata =3D dev->platform_data;
 	if (!pdata) {
--=20
2.34.1


