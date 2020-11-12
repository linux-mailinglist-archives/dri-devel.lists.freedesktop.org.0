Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16EC2B04CC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:15:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB776E215;
	Thu, 12 Nov 2020 12:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7846E215
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:14:57 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c66so4371823pfa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ji+otFl/WkNW1j02CrZ/ivgsssCDblUPej71NkGlu3o=;
 b=VAmHGapXMocqcjRZS1SlTPSyIL91R0FKwosP3HJ0EzX8ZCW0Vapjr+mTSHwWi4H2Hx
 nmYgcEsRbatUB9qIPOrObI7lrBsImUMUhbDgb2sSa8pBgzMK7qC4jlKXSgfdpv2p9Vvt
 CaLjIjo84AOJyk4jquop1y0edQUm4GdzLOz+QckbMb2Gw8mK9E/HJ6bOzPJyjTlXeE6H
 3yd7+KsSn8tw56tLESaCPsBWWOSTwuwfQljPyzY3QCpASQZzE423pBVzFQZNI/dpcprB
 0XPgfxSNR8KWyrdssDM2HF03+n7wSmJDrGy8M/bPuXQLPPBIID8ctqRlOCMQJoXYrxP6
 8hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ji+otFl/WkNW1j02CrZ/ivgsssCDblUPej71NkGlu3o=;
 b=OY++ytMZXB+NTVlLJY/4Ef+kK+sFpdvRU/XFUlUpPBHhNkVKSsOikEFAT5F9t5OzNA
 FLTCOGFfFMwWiZsnXOIxbXbdC39QCGBQ1vBrUeYpcYzv011IBULvdAbxQpTCIFbbFxPG
 t5bxThCsRskA3MMNQ/34YinT2+6qXtgiB7W+e2KV7oRa3w+nxKdjEBLLXZe00CWg5jZV
 7XPcMbWoWO1uaiODj+5PmXwOU9K4A5t69YGU7e54uStHoM3lXlV891LMDjm5tlrgYzxm
 Zl6W8F4COJgzcgyVRvbhqC3Lq0G0Iqu3NdDq3tqZtb6m7EoEZmBFP2VJcoSc+ZpcnSMd
 gDKA==
X-Gm-Message-State: AOAM533oFNmDeakQkKoDYyiWDtQtzuhI/moHPhxKhRC/RoPFAi8B7W8K
 EKaqy53zpCoiQhniV8Yo7g==
X-Google-Smtp-Source: ABdhPJyxx19WWls1VMlKeNllLZ/re1JCrpPUArBW0x9CN4NVZKyR+t+YJw14Unb5U6Oq00zSvevmAg==
X-Received: by 2002:a17:90a:4a0f:: with SMTP id
 e15mr8953328pjh.182.1605183297641; 
 Thu, 12 Nov 2020 04:14:57 -0800 (PST)
Received: from localhost.localdomain ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id d145sm6785736pfd.136.2020.11.12.04.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 04:14:57 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 4/5] parisc/sticore: Avoid hard-coding built-in font
 charcount
Date: Thu, 12 Nov 2020 07:14:21 -0500
Message-Id: <037186fb50cf3d17bb7bc9482357635b9df6076e.1605169912.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1605169912.git.yepeilin.cs@gmail.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sti_select_fbfont() and sti_cook_fonts() are hard-coding the number of
characters of our built-in fonts as 256. Recently, we included that
information in our kernel font descriptor `struct font_desc`, so use
`fbfont->charcount` instead of hard-coded values.

Depends on patch "Fonts: Add charcount field to font_desc".

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
v2: https://lore.kernel.org/lkml/c38042bbf5c9777c84900d56c09f3c156b32af48.1603788512.git.yepeilin.cs@gmail.com/

Changes since v1:
  - Slightly improved commit message.
  - Rebased onto linux-next.

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
