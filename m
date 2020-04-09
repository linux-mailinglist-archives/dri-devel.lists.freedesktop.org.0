Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72A1A4494
	for <lists+dri-devel@lfdr.de>; Fri, 10 Apr 2020 11:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139446ECA1;
	Fri, 10 Apr 2020 09:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21156EB94
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 09:34:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f13so4536634wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vFKY58EHDI35uWqTXFRcYlKrXpE9AmTqUd0lTuoZycc=;
 b=Vluwa6jv99EFa0y3quZjb49M0cgeiVocOWBa7QIiBKYvYGJY7V0w2GjxOzU0DvqBB2
 Nb+5jY6WzMvAFVr7+8Ys8cs/E8W+eSH7gVqp9SXwjXmeXK/fsM9P8X0pxGVa8CRje2WC
 g3y3AHexyE7aae+UXl275caZKdGy3bXMWW3dOX0pxx/kD46g0wwTIx60fxsbAA7dgI1x
 3xFzJ3zU4lMTfDFv0mkxtk/La2DIonGAbNbfo5hjR4wtvI44ZywsUdkq4FmMJmN3jx1p
 DfoQ6ycgEdCR5XR/YjooLFM2As21WdGwPk7QuF5UpUfyNAWu7GlOOrJdpnAnF0PHtHfj
 JPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vFKY58EHDI35uWqTXFRcYlKrXpE9AmTqUd0lTuoZycc=;
 b=VaeJGOxF4TPqSEki6yrFLiu8JdHU+uef67BTAY0zZYyU1tpWi9VsHy8wC7M8JLz6S/
 0H7mXY91KIoJOIhKyCgFtjzwiVhTyvs8BVq0d/L8LvLcmivObHnKNYLUE3PTkAe5wrVB
 3a8qaqKOB1608c37JEh04B+CzJQhf1CJlEqDG/7KvKxjF2AWoU1lkoPkgOd55PwFqjIQ
 jHFX+kDR9NTuxfNrvZD6jxd4eMnpH34pivHfWfwzUE/P1z1aDCUOnP5aMypJqo6BCDtH
 kNj7ylR4lR+3IP0F4nwGEz2tDTRf5V5k0q6UiMXpSrpxfMQ52XTVC1xadwnlhrch3MFP
 dZjw==
X-Gm-Message-State: AGi0Puam37VeohOVMPQZoacJDfjM0FKh/2jfYBz/Llus93/j59HDBiZF
 YkF2TW9m4KACAZSblk7qM60=
X-Google-Smtp-Source: APiQypKHK/kvsaEcZ/Cmzl/YN983+vE0TBvst1peF9mlnQUhbLlkLuwefhysx3YSl6P6fBAQtjQu9w==
X-Received: by 2002:adf:904e:: with SMTP id h72mr12881868wrh.367.1586424848253; 
 Thu, 09 Apr 2020 02:34:08 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de.
 [31.17.95.22])
 by smtp.gmail.com with ESMTPSA id h2sm1916942wmf.34.2020.04.09.02.34.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Apr 2020 02:34:07 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
To: gregkh@linuxfoundation.org
Subject: [PATCH v1] staging: fbtft: fb_st7789v: enabled inversion
Date: Thu,  9 Apr 2020 11:24:05 +0200
Message-Id: <1586424250-25897-1-git-send-email-oliver.graute@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 10 Apr 2020 09:45:19 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Oliver Graute <oliver.graute@kococonnector.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oliver.graute@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Oliver Graute <oliver.graute@kococonnector.com>

Enable inversion mode

Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 3c3f387936e8..84c5af2dc9a0 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -120,6 +120,10 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, PWCTRL1, 0xA4, 0xA1);
 
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
+
+	/* enable inversion mode */
+	write_reg(par, 0x21);
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
