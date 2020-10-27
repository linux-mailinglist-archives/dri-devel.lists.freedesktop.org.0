Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5EE29BCFF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90016E12D;
	Tue, 27 Oct 2020 16:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776426E12D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:41:55 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id p21so1078903pju.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ebBfe6g+xIwA0Tw7T7ptAhswGHI+h9atRQ+wtk5eLJM=;
 b=vFw9A52vUPt+Z6azESaiWaj6f6RnK6WmgcZfmCdqg30ygptQfXqoaWHeScuoNsMUcL
 LFBrxcc3UK6ZrcRlK5yMWQydC4uSY8bXOQANfqwRP1eXlykw3jV58ZyR58sIXBm+HRfy
 vYQZ8hSojiimEwm6a2/Jpl+5twHC88GdAmxu3wHGuRHWue5fVcJY1DPUHhnpeRigSGZc
 VrPVUTeS6NGaTlPe7onOvCg10lX1FXx8QdW4QCJZ8DwsAcTcxh7dq+42zHm6DOHOPN6X
 Fkze0CaGWSHSGRhOa+UQSIkAV+OUv4T06N/Yptxodpi2pNzEzDFOn+8yW6ly7Lth7XwK
 QnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ebBfe6g+xIwA0Tw7T7ptAhswGHI+h9atRQ+wtk5eLJM=;
 b=bMrgzAVDD+LCvcAcNbKV0kK6BCboPo1mb6XF9isVbEWMf4/5zUZEkFimVdug1I89G3
 caUVK6lBTWaisLu4PQJm2tLfU9Q5vlEyw4o6ldlXOQ7+VJIHa1IC2L5xa5ZByV84LeZe
 n64/anrfJYbIX+HOXQ7/Y1BdjrMspRoYfpGChDnM19V/IipzM1kySTaeJjxYCHoQomZi
 pA8hDnqezjr/XrRRNgdIqZw4HtL5aCXsUH6LI+V1jn6Iq7Pt7ltTMiFzwjFz9qmATBbU
 wkGa5SzklB+u+u3xNne/4XlTjxUSofD0EZ4IxzQ4M5wUFk0XWlX5hYjhE41RBQIjL2zk
 LxGA==
X-Gm-Message-State: AOAM532qW78RZOMtimVXd9w5cozVAusUf6unpNNAVqtGKW+ngwBjI+du
 qBoPA7KbZf1UuTmyygXo2w==
X-Google-Smtp-Source: ABdhPJxLkLvUsLuiUeeggrviMsdPesWsRrw2oB2fz/mRoiv9z7/Da38zY8teYsS2tEKx7sc/DwEgDg==
X-Received: by 2002:a17:902:b488:b029:d4:dbdf:c6a5 with SMTP id
 y8-20020a170902b488b02900d4dbdfc6a5mr3312027plr.42.1603816915108; 
 Tue, 27 Oct 2020 09:41:55 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id gx20sm2459230pjb.1.2020.10.27.09.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:41:54 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 5/5] parisc/sticore: Avoid hard-coding built-in font charcount
Date: Tue, 27 Oct 2020 12:41:02 -0400
Message-Id: <c38042bbf5c9777c84900d56c09f3c156b32af48.1603788512.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
 <a3b1b3cdc160fb9aef389c366f387fb27f0aef38.1603788512.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sti_select_fbfont() and sti_cook_fonts() are hard-coding the number of
characters of our built-in fonts as 256. Recently, we included that
information in our kernel font descriptor `struct font_desc`, so use
`fbfont->charcount` instead of hard-coded values.

This patch depends on patch "Fonts: Add charcount field to font_desc".

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
$ # Build-tested (Ubuntu 20.04)
$ sudo apt-get install binutils-hppa64-linux-gnu gcc-7-hppa64-linux-gnu
$ cp arch/parisc/configs/generic-64bit_defconfig .config
$ make -j`nproc` ARCH=parisc CROSS_COMPILE=hppa64-linux-gnu- all

 drivers/video/console/sticore.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/console/sticore.c b/drivers/video/console/sticore.c
index d1bb5915082b..f869b723494f 100644
--- a/drivers/video/console/sticore.c
+++ b/drivers/video/console/sticore.c
@@ -506,7 +506,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 			fbfont->width, fbfont->height, fbfont->name);
 			
 	bpc = ((fbfont->width+7)/8) * fbfont->height; 
-	size = bpc * 256;
+	size = bpc * fbfont->charcount;
 	size += sizeof(struct sti_rom_font);
 
 	nf = kzalloc(size, STI_LOWMEM);
@@ -514,7 +514,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 		return NULL;
 
 	nf->first_char = 0;
-	nf->last_char = 255;
+	nf->last_char = fbfont->charcount - 1;
 	nf->width = fbfont->width;
 	nf->height = fbfont->height;
 	nf->font_type = STI_FONT_HPROMAN8;
@@ -525,7 +525,7 @@ sti_select_fbfont(struct sti_cooked_rom *cooked_rom, const char *fbfont_name)
 
 	dest = nf;
 	dest += sizeof(struct sti_rom_font);
-	memcpy(dest, fbfont->data, bpc*256);
+	memcpy(dest, fbfont->data, bpc * fbfont->charcount);
 
 	cooked_font = kzalloc(sizeof(*cooked_font), GFP_KERNEL);
 	if (!cooked_font) {
@@ -660,7 +660,7 @@ static int sti_cook_fonts(struct sti_cooked_rom *cooked_rom,
 void sti_font_convert_bytemode(struct sti_struct *sti, struct sti_cooked_font *f)
 {
 	unsigned char *n, *p, *q;
-	int size = f->raw->bytes_per_char * 256 + sizeof(struct sti_rom_font);
+	int size = f->raw->bytes_per_char * (f->raw->last_char + 1) + sizeof(struct sti_rom_font);
 	struct sti_rom_font *old_font;
 
 	if (sti->wordmode)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
