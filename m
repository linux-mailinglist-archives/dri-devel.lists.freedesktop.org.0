Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC6739819
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9621910E4DF;
	Thu, 22 Jun 2023 07:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A4A10E430
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 10:02:53 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-54f75f85a17so3030717a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687341773; x=1689933773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZflBfdXsCT719NMmNIjOCzP0A2DIyEtya42eY1OGEo=;
 b=LIM8WAYtMAwzuzuGYZgGNe8fuUQDKH5JyQoKSYbRSFA9qO2IxGXthnqQ9tVHIjxUJx
 wY9vWobbISdK2h5t+7pmfuu5tEVuNpqIjIRZzbsbc5c22rGxs4/uu7yx5/RvXTjhy8st
 doqr89ffYPQag707v04IgwEBsn8qO1y5qcM4bPYjKsQ9oCSk8TGfqDzBtsjSz2rTeluh
 a35wVAH+o9p9DNJM1tlueIus+jd9shRKuBY0P1OcRKb7goawu8SuxtYs6oF3uhHlaFyG
 eNEOWerOmieWl5HVs0cOV6Zv8dSSEE0Ip1Yfi8JIeFYjSjDP1oBVSqojSP10NLnMB6/r
 /Fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687341773; x=1689933773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZflBfdXsCT719NMmNIjOCzP0A2DIyEtya42eY1OGEo=;
 b=DP3U/urIquLx0QF7g21C91A5RQm4VetbsvRRoWLQX7DkMU+hBD2Zv8aCvkkX3EkiwS
 4XjF3GH4cnWj+jqcfdCW6jalxbb4437sYoAPt0W8O1/y0cWIDVeuq1W8UsVdsrX6yPYd
 SCjYf29iHBKK2ey1xSj75yple2pX/5NsTpNiLJZM48wktANQG22EpKx03mDFijVOb+AA
 daU5mvEFESSjhQS8/YRuXfIADEBjYbsV1cbgZFskovvvyetEUqEnkROA0JOAMRMzL62Z
 1y+btey98C7VQzwozrZzThUCqMpjiVQQfjThfs3HfTsry+V4Uj+SAX+DSi0nUM1zdQ9M
 Zghg==
X-Gm-Message-State: AC+VfDzfUGX/jZmY9Xn72mNusyc3pLvIs0H5pp9r87ne+vdSL7wHvSAC
 aUihDkwCNKh6Pix60vcTh0A=
X-Google-Smtp-Source: ACHHUZ6Jide6SYJli/+K018flPuCPAUmmuBzu3FBCXntLGd88XlfvR9AkNjIVe6FEEeZXQe8zIa9/Q==
X-Received: by 2002:a17:90a:72c4:b0:25e:9d27:40d4 with SMTP id
 l4-20020a17090a72c400b0025e9d2740d4mr8865263pjk.40.1687341772783; 
 Wed, 21 Jun 2023 03:02:52 -0700 (PDT)
Received: from anyang.. ([106.250.177.234])
 by smtp.googlemail.com with ESMTPSA id
 e4-20020a17090a280400b0025c09577ce1sm9402937pjd.7.2023.06.21.03.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 03:02:52 -0700 (PDT)
From: Dongjin Kim <tobetter@gmail.com>
To: tobetter@gmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panel: ilitek-ili9881c: add support for Elida
 HJ080BE31IA1 panel
Date: Wed, 21 Jun 2023 19:02:44 +0900
Message-Id: <20230621100244.1325638-2-tobetter@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621100244.1325638-1-tobetter@gmail.com>
References: <20230621100244.1325638-1-tobetter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jun 2023 07:32:28 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HJ080BE31IA1 is a panel by Elida and utilizes the Ilitek ILI9881C
controller.

This patch is to add the initialization sequence and timing to ILI9881C
driver, tested on Hardkernel ODROID-M1.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 1ec696adf9de..eac81724cede 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -662,6 +662,216 @@ static const struct ili9881c_instr w552946ab_init[] = {
 	ILI9881C_SWITCH_PAGE_INSTR(0),
 };
 
+static const struct ili9881c_instr hj080be31ia1_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x53),
+	ILI9881C_COMMAND_INSTR(0x04, 0x53),
+	ILI9881C_COMMAND_INSTR(0x05, 0x13),
+	ILI9881C_COMMAND_INSTR(0x06, 0x04),
+	ILI9881C_COMMAND_INSTR(0x07, 0x02),
+	ILI9881C_COMMAND_INSTR(0x08, 0x02),
+	ILI9881C_COMMAND_INSTR(0x09, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x10, 0x00),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x12, 0x00),
+	ILI9881C_COMMAND_INSTR(0x13, 0x00),
+	ILI9881C_COMMAND_INSTR(0x14, 0x00),
+	ILI9881C_COMMAND_INSTR(0x15, 0x00),
+	ILI9881C_COMMAND_INSTR(0x16, 0x00),
+	ILI9881C_COMMAND_INSTR(0x17, 0x00),
+	ILI9881C_COMMAND_INSTR(0x18, 0x00),
+	ILI9881C_COMMAND_INSTR(0x19, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x02),
+	ILI9881C_COMMAND_INSTR(0x21, 0x09),
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x55),
+	ILI9881C_COMMAND_INSTR(0x29, 0x03),
+	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x30, 0x00),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00),
+	ILI9881C_COMMAND_INSTR(0x32, 0x00),
+	ILI9881C_COMMAND_INSTR(0x33, 0x00),
+	ILI9881C_COMMAND_INSTR(0x34, 0x00),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x36, 0x00),
+	ILI9881C_COMMAND_INSTR(0x37, 0x00),
+	ILI9881C_COMMAND_INSTR(0x38, 0x3C), /* VDD1&2 toggle 1sec */
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
+	ILI9881C_COMMAND_INSTR(0x40, 0x00),
+	ILI9881C_COMMAND_INSTR(0x41, 0x00),
+	ILI9881C_COMMAND_INSTR(0x42, 0x00),
+	ILI9881C_COMMAND_INSTR(0x43, 0x00),
+	ILI9881C_COMMAND_INSTR(0x44, 0x00),
+
+	ILI9881C_COMMAND_INSTR(0x50, 0x01),
+	ILI9881C_COMMAND_INSTR(0x51, 0x23),
+	ILI9881C_COMMAND_INSTR(0x52, 0x45),
+	ILI9881C_COMMAND_INSTR(0x53, 0x67),
+	ILI9881C_COMMAND_INSTR(0x54, 0x89),
+	ILI9881C_COMMAND_INSTR(0x55, 0xab),
+	ILI9881C_COMMAND_INSTR(0x56, 0x01),
+	ILI9881C_COMMAND_INSTR(0x57, 0x23),
+	ILI9881C_COMMAND_INSTR(0x58, 0x45),
+	ILI9881C_COMMAND_INSTR(0x59, 0x67),
+	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
+	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
+	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
+	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
+
+	ILI9881C_COMMAND_INSTR(0x5e, 0x01),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x08), /* FW_GOUT_L1   STV2_ODD */
+	ILI9881C_COMMAND_INSTR(0x60, 0x02), /* FW_GOUT_L2 */
+	ILI9881C_COMMAND_INSTR(0x61, 0x02), /* FW_GOUT_L3 */
+	ILI9881C_COMMAND_INSTR(0x62, 0x0A), /* FW_GOUT_L4   RESET_ODD */
+	ILI9881C_COMMAND_INSTR(0x63, 0x15), /* FW_GOUT_L5 */
+	ILI9881C_COMMAND_INSTR(0x64, 0x14), /* FW_GOUT_L6 */
+	ILI9881C_COMMAND_INSTR(0x65, 0x02), /* FW_GOUT_L7 */
+	ILI9881C_COMMAND_INSTR(0x66, 0x11), /* FW_GOUT_L8    CK11 */
+	ILI9881C_COMMAND_INSTR(0x67, 0x10), /* FW_GOUT_L9    CK9 */
+	ILI9881C_COMMAND_INSTR(0x68, 0x02), /* FW_GOUT_L10 */
+	ILI9881C_COMMAND_INSTR(0x69, 0x0F), /* FW_GOUT_L11   CK7 */
+	ILI9881C_COMMAND_INSTR(0x6a, 0x0E), /* FW_GOUT_L12   CK5 */
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02), /* FW_GOUT_L13 */
+	ILI9881C_COMMAND_INSTR(0x6c, 0x0D), /* FW_GOUT_L14   CK3 */
+	ILI9881C_COMMAND_INSTR(0x6d, 0x0C), /* FW_GOUT_L15   CK1 */
+	ILI9881C_COMMAND_INSTR(0x6e, 0x06), /* FW_GOUT_L16   STV1_ODD */
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02), /* FW_GOUT_L17 */
+	ILI9881C_COMMAND_INSTR(0x70, 0x02), /* FW_GOUT_L18 */
+	ILI9881C_COMMAND_INSTR(0x71, 0x02), /* FW_GOUT_L19 */
+	ILI9881C_COMMAND_INSTR(0x72, 0x02), /* FW_GOUT_L20 */
+	ILI9881C_COMMAND_INSTR(0x73, 0x02), /* FW_GOUT_L21 */
+	ILI9881C_COMMAND_INSTR(0x74, 0x02), /* FW_GOUT_L22 */
+
+	ILI9881C_COMMAND_INSTR(0x75, 0x06), /* BW_GOUT_L1   STV2_ODD */
+	ILI9881C_COMMAND_INSTR(0x76, 0x02), /* BW_GOUT_L2 */
+	ILI9881C_COMMAND_INSTR(0x77, 0x02), /* BW_GOUT_L3 */
+	ILI9881C_COMMAND_INSTR(0x78, 0x0A), /* BW_GOUT_L4   RESET_ODD */
+	ILI9881C_COMMAND_INSTR(0x79, 0x15), /* BW_GOUT_L5 */
+	ILI9881C_COMMAND_INSTR(0x7a, 0x14), /* BW_GOUT_L6 */
+	ILI9881C_COMMAND_INSTR(0x7b, 0x02), /* BW_GOUT_L7 */
+	ILI9881C_COMMAND_INSTR(0x7c, 0x10), /* BW_GOUT_L8  CK11 */
+	ILI9881C_COMMAND_INSTR(0x7d, 0x11), /* BW_GOUT_L9  CK9 */
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02), /* BW_GOUT_L10 */
+	ILI9881C_COMMAND_INSTR(0x7f, 0x0C), /* BW_GOUT_L11 CK7 */
+	ILI9881C_COMMAND_INSTR(0x80, 0x0D), /* BW_GOUT_L12 CK5 */
+	ILI9881C_COMMAND_INSTR(0x81, 0x02), /* BW_GOUT_L13 */
+	ILI9881C_COMMAND_INSTR(0x82, 0x0E), /* BW_GOUT_L14 CK3 */
+	ILI9881C_COMMAND_INSTR(0x83, 0x0F), /* BW_GOUT_L15 CK1 */
+	ILI9881C_COMMAND_INSTR(0x84, 0x08), /* BW_GOUT_L16 STV1_ODD */
+	ILI9881C_COMMAND_INSTR(0x85, 0x02), /* BW_GOUT_L17 */
+	ILI9881C_COMMAND_INSTR(0x86, 0x02), /* BW_GOUT_L18 */
+	ILI9881C_COMMAND_INSTR(0x87, 0x02), /* BW_GOUT_L19 */
+	ILI9881C_COMMAND_INSTR(0x88, 0x02), /* BW_GOUT_L20 */
+	ILI9881C_COMMAND_INSTR(0x89, 0x02), /* BW_GOUT_L21 */
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02), /* BW_GOUT_L22 */
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6C, 0x15),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x30), /* VGH clamp 16.08V */
+	ILI9881C_COMMAND_INSTR(0x6F, 0x37), /* reg vcl + pumping ratio VGH=3x VGL=-3x */
+	ILI9881C_COMMAND_INSTR(0x8D, 0x1F), /* VGL clamp -12.03V */
+	ILI9881C_COMMAND_INSTR(0x87, 0xBA),
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
+	ILI9881C_COMMAND_INSTR(0xB5, 0x07),
+	ILI9881C_COMMAND_INSTR(0x35, 0x17),
+	ILI9881C_COMMAND_INSTR(0x33, 0x14),
+	ILI9881C_COMMAND_INSTR(0x31, 0x75),
+	ILI9881C_COMMAND_INSTR(0x3A, 0x85),
+	ILI9881C_COMMAND_INSTR(0x3B, 0x98),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+	ILI9881C_COMMAND_INSTR(0x7A, 0x10), /* VREG1/2 out */
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x40, 0x53),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0A),
+	ILI9881C_COMMAND_INSTR(0x31, 0x00), /* column inversion */
+	ILI9881C_COMMAND_INSTR(0x50, 0xE9), /* VREG1OUT=5.508V */
+	ILI9881C_COMMAND_INSTR(0x51, 0xE4), /* VREG2OUT=-5.508V */
+	ILI9881C_COMMAND_INSTR(0x53, 0x48), /* VCOM1 */
+	ILI9881C_COMMAND_INSTR(0x55, 0x48), /* VCOM2 */
+	ILI9881C_COMMAND_INSTR(0x60, 0x28), /* SDT */
+	ILI9881C_COMMAND_INSTR(0x2E, 0xC8), /* 1280 GATE NL SEL */
+	ILI9881C_COMMAND_INSTR(0x34, 0x01),
+	ILI9881C_COMMAND_INSTR(0xA0, 0x00), /* VP255 */
+	ILI9881C_COMMAND_INSTR(0xA1, 0x13), /* VP251 */
+	ILI9881C_COMMAND_INSTR(0xA2, 0x24), /* VP247 */
+	ILI9881C_COMMAND_INSTR(0xA3, 0x15), /* VP243 */
+	ILI9881C_COMMAND_INSTR(0xA4, 0x18), /* VP239 */
+	ILI9881C_COMMAND_INSTR(0xA5, 0x2F), /* VP231 */
+	ILI9881C_COMMAND_INSTR(0xA6, 0x22), /* VP219 */
+	ILI9881C_COMMAND_INSTR(0xA7, 0x21), /* VP203 */
+	ILI9881C_COMMAND_INSTR(0xA8, 0x89), /* VP175 */
+	ILI9881C_COMMAND_INSTR(0xA9, 0x1B), /* VP144 */
+	ILI9881C_COMMAND_INSTR(0xAA, 0x27), /* VP111 */
+	ILI9881C_COMMAND_INSTR(0xAB, 0x7D), /* VP80 */
+	ILI9881C_COMMAND_INSTR(0xAC, 0x1B), /* VP52 */
+	ILI9881C_COMMAND_INSTR(0xAD, 0x1B), /* VP36 */
+	ILI9881C_COMMAND_INSTR(0xAE, 0x50), /* VP24 */
+	ILI9881C_COMMAND_INSTR(0xAF, 0x24), /* VP16 */
+	ILI9881C_COMMAND_INSTR(0xB0, 0x2A), /* VP12 */
+	ILI9881C_COMMAND_INSTR(0xB1, 0x51), /* VP8 */
+	ILI9881C_COMMAND_INSTR(0xB2, 0x5A), /* VP4 */
+	ILI9881C_COMMAND_INSTR(0xB3, 0x1B), /* VP0 */
+	ILI9881C_COMMAND_INSTR(0xC0, 0x00), /* VN255 GAMMA N */
+	ILI9881C_COMMAND_INSTR(0xC1, 0x16), /* VN251 */
+	ILI9881C_COMMAND_INSTR(0xC2, 0x24), /* VN247 */
+	ILI9881C_COMMAND_INSTR(0xC3, 0x13), /* VN243 */
+	ILI9881C_COMMAND_INSTR(0xC4, 0x18), /* VN239 */
+	ILI9881C_COMMAND_INSTR(0xC5, 0x2A), /* VN231 */
+	ILI9881C_COMMAND_INSTR(0xC6, 0x20), /* VN219 */
+	ILI9881C_COMMAND_INSTR(0xC7, 0x22), /* VN203 */
+	ILI9881C_COMMAND_INSTR(0xC8, 0x80), /* VN175 */
+	ILI9881C_COMMAND_INSTR(0xC9, 0x1C), /* VN144 */
+	ILI9881C_COMMAND_INSTR(0xCA, 0x28), /* VN111 */
+	ILI9881C_COMMAND_INSTR(0xCB, 0x71), /* VN80 */
+	ILI9881C_COMMAND_INSTR(0xCC, 0x1D), /* VN52 */
+	ILI9881C_COMMAND_INSTR(0xCD, 0x1B), /* VN36 */
+	ILI9881C_COMMAND_INSTR(0xCE, 0x51), /* VN24 */
+	ILI9881C_COMMAND_INSTR(0xCF, 0x24), /* VN16 */
+	ILI9881C_COMMAND_INSTR(0xD0, 0x2A), /* VN12 */
+	ILI9881C_COMMAND_INSTR(0xD1, 0x4C), /* VN8 */
+	ILI9881C_COMMAND_INSTR(0xD2, 0x5A), /* VN4 */
+	ILI9881C_COMMAND_INSTR(0xD3, 0x32), /* VN0 */
+	ILI9881C_SWITCH_PAGE_INSTR(2),
+	ILI9881C_COMMAND_INSTR(0x04, 0x17),
+	ILI9881C_COMMAND_INSTR(0x05, 0x12),
+	ILI9881C_COMMAND_INSTR(0x06, 0x40),
+	ILI9881C_COMMAND_INSTR(0x07, 0x0B),
+
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -812,6 +1022,23 @@ static const struct drm_display_mode k101_im2byl02_default_mode = {
 	.height_mm	= 217,
 };
 
+static const struct drm_display_mode hj080be31ia1_default_mode = {
+	.clock		= 66000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 32,
+	.hsync_end	= 800 + 32 + 24,
+	.htotal		= 800 + 32 + 24 + 24,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 8,
+	.vsync_end	= 1280 + 8 + 4,
+	.vtotal		= 1280 + 8 + 4 + 8,
+
+	.width_mm	= 108,
+	.height_mm	= 172,
+};
+
 static const struct drm_display_mode w552946aba_default_mode = {
 	.clock		= 64000,
 
@@ -944,6 +1171,14 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
 };
 
+static const struct ili9881c_desc hj080be31ia1_desc = {
+	.init = hj080be31ia1_init,
+	.init_length = ARRAY_SIZE(hj080be31ia1_init),
+	.mode = &hj080be31ia1_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_MODE_NO_EOT_PACKET,
+};
+
 static const struct ili9881c_desc w552946aba_desc = {
 	.init = w552946ab_init,
 	.init_length = ARRAY_SIZE(w552946ab_init),
@@ -954,6 +1189,7 @@ static const struct ili9881c_desc w552946aba_desc = {
 
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
+	{ .compatible = "elida,hj080be31ia1", .data = &hj080be31ia1_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ }
-- 
2.34.1

