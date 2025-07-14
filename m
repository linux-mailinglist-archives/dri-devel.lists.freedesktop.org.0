Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B28DB052FD
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A305110E542;
	Tue, 15 Jul 2025 07:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="E4urQ3qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15B910E02C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:06:40 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4ab6b3e8386so13979171cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752530799; x=1753135599;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bicc2T70eUQn+v9Rm46SJ7eTL1E2LQcLxKao4VEfqfQ=;
 b=E4urQ3qifp5ftktSEdLJEjGVEzYf+Mt70iupzu39miY9t9oBGmaDj4CaAfcr4qk0LX
 98NKbjIctR6K6sgV1rcAEoebDw8b/rmIPtievgDHjE8muChhwmPhEnY8ZJ9hRItZwBeB
 b/YF7FYbNyTC9x++KauVa19nUZRYTsucMJis2Ky0DEpbwOOuSLBpMR2xib3+2sRn6x68
 B+EL7VA8MD5JwYTmC8UNHJwaYtBRjhC+Py2fm0WYtaiBIqCzvL3RN93oSFSlItHs4rDG
 Z/UBNZS0NyEe3ag5sT4ltnZAte0n5kFbNUY89DnHut0BIl8NekiMl8gy7s1+ZNKTxFxl
 Tkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752530799; x=1753135599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bicc2T70eUQn+v9Rm46SJ7eTL1E2LQcLxKao4VEfqfQ=;
 b=Cp//BVwW9aa0pjytkhJyy8tpL6jWxu6N8WF57AtXj6VSx8V8QOhLOLibiQBdG4lr/b
 3Kh31vWnDEx8AgsdZDgzQYRr+vuC1MTzSQKI2RXvMIAiyyDIhU0excByMuNTlfbeCfpo
 W4WvfU5c+ah9lBFRr01CyjdHyLBix8DsAnprzhRKNPJFl95NeEDxmhbi3Fgu9VyRuO0R
 dinyna42xzj1cJHwNNYyb1ie9V6Bt4CRpCFeXGLked0IViOP/utKCcLaGgwWkyrHJgT6
 DlYmkfND+vh/iRcxHnGKzj+W5sUSL3u4C527W34SNFQyMOAx0jyfbrNY7uwfGHxEw06e
 tcjg==
X-Gm-Message-State: AOJu0YxLJ09GkjK744SjE/sU1vvWG/kk1abds9w0wzevjAwQIRJOQbWH
 rPJs4xjv7edemjPvaSErjdOhwN29TdNgQ0FftdcIxXt0j2bbEgtM+AULHXTgqW8U+fPMJIC+vHA
 ovUzZRtk=
X-Gm-Gg: ASbGncs3vcrRkZtUxcpEUzkEbWH9VOUjp1lPo+KkHLC/ZqrZ58/mhhI8AIx7a32d/Wb
 uffGGu1JtiAcSoJxdJHLqPvRa83BGjTq6OHRia65qorkMRFJ+K29t5wTUQoT03Rh7nc+uQi5dfP
 YIS+toDuXFbAY0tLt9WoPlEyhsy2Vo1PerXj7RTTIKF339jV67oe11ULWQBAYc7zauGRCTXPkAL
 9GlBQDuhfKPm3a37u/0Sd83zNHWM3ZlBNk0n5z5xP+P8bH3dMDXpk9DukJQ3+A/i266XAV6KYrr
 Xvc83uK/7ORlJDa0WYgb7TAv0F8W9TZAPuaWn03e3qY7AD7yGqqrzJ8CJwNBsTPPMrSWw5kGFyo
 OHLHIL+Yegv1YWlmAM5hkmKg7ox5V7lNx/+opEAU7pEugTa2o
X-Google-Smtp-Source: AGHT+IFTrQejhLhE/HVK8GSZBMeQlErabsYqF2mPYQArLkbYRXhIipEGZvMOz5ruCJ/1YhUzbGYRzw==
X-Received: by 2002:a05:622a:1649:b0:4ab:6ef8:87f with SMTP id
 d75a77b69052e-4ab824a61f9mr5521611cf.19.1752530799341; 
 Mon, 14 Jul 2025 15:06:39 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab6fdc7731sm13137311cf.40.2025.07.14.15.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:06:38 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Richard Yao <richard@ryao.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 3/3] drm/panel: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
Date: Mon, 14 Jul 2025 18:06:24 -0400
Message-ID: <20250714220627.23585-4-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714220627.23585-1-richard@scandent.com>
References: <20250714220627.23585-1-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Add support for the Tianxianwei TWX700100S0 panel.

The init table was provided by Tianxianwei. Their comments have been
preserved.

Signed-off-by: Richard Yao <richard@scandent.com>

fixme

Signed-off-by: Richard Yao <richard@ryao.dev>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 242 ++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 28cd7560e5db..53ef40832f28 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -1223,6 +1223,223 @@ static const struct ili9881c_instr am8001280g_init[] = {
 	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
 };
 
+static const struct ili9881c_instr txw700100s0_init[] = {
+	ILI9881C_SWITCH_PAGE_INSTR(3),
+	/* GIP_1 */
+	ILI9881C_COMMAND_INSTR(0x01, 0x00),
+	ILI9881C_COMMAND_INSTR(0x02, 0x00),
+	ILI9881C_COMMAND_INSTR(0x03, 0x72), /* STVA 3H */
+	ILI9881C_COMMAND_INSTR(0x04, 0x00), /* STVB */
+	ILI9881C_COMMAND_INSTR(0x05, 0x00), /* STVC */
+	ILI9881C_COMMAND_INSTR(0x06, 0x09), /* STVA_Rise */
+	ILI9881C_COMMAND_INSTR(0x07, 0x00), /* STVB_Rise */
+	ILI9881C_COMMAND_INSTR(0x08, 0x00), /* STVC_Rise */
+	ILI9881C_COMMAND_INSTR(0x09, 0x00), /* STVA_non overlap 2.5us=14 */
+	ILI9881C_COMMAND_INSTR(0x0a, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0b, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0c, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0d, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x0f, 0x00), /* CLKA_non overlap 2.5us=14 */
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
+	ILI9881C_COMMAND_INSTR(0x1e, 0x40), /* CLKA 40自動反 C0手動反(X8參考CLKB) */
+	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
+	ILI9881C_COMMAND_INSTR(0x20, 0x05), /* CLKA_Rise */
+	ILI9881C_COMMAND_INSTR(0x21, 0x02), /* CLKA_Fall */
+	ILI9881C_COMMAND_INSTR(0x22, 0x00),
+	ILI9881C_COMMAND_INSTR(0x23, 0x00),
+	ILI9881C_COMMAND_INSTR(0x24, 0x00),
+	ILI9881C_COMMAND_INSTR(0x25, 0x00),
+	ILI9881C_COMMAND_INSTR(0x26, 0x00),
+	ILI9881C_COMMAND_INSTR(0x27, 0x00),
+	ILI9881C_COMMAND_INSTR(0x28, 0x33), /* CLK Phase_NUM=8 */
+	ILI9881C_COMMAND_INSTR(0x29, 0x22), /* CLK overlap 3H */
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
+	ILI9881C_COMMAND_INSTR(0x34, 0x04), /* VDD1&2 non-overlap 04:2.62us */
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
+	/* GIP_2 */
+	ILI9881C_COMMAND_INSTR(0x50, 0x10), /* STV_1, 0x2 */
+	ILI9881C_COMMAND_INSTR(0x51, 0x32), /* STV_3, 0x4 */
+	ILI9881C_COMMAND_INSTR(0x52, 0x54), /* STV_5, 0x6 */
+	ILI9881C_COMMAND_INSTR(0x53, 0x76), /* STV_7, 0x8 */
+	ILI9881C_COMMAND_INSTR(0x54, 0x98), /* STV_9, 0x10 */
+	ILI9881C_COMMAND_INSTR(0x55, 0xba), /* STV_11, 0x12 */
+	ILI9881C_COMMAND_INSTR(0x56, 0x10), /* CLK_1.2 */
+	ILI9881C_COMMAND_INSTR(0x57, 0x32), /* CLK_3, 0x4 */
+	ILI9881C_COMMAND_INSTR(0x58, 0x54), /* CLK_5, 0x6 */
+	ILI9881C_COMMAND_INSTR(0x59, 0x76), /* CLK_7, 0x8 */
+	ILI9881C_COMMAND_INSTR(0x5a, 0x98), /* CLK_9, 0x10 */
+	ILI9881C_COMMAND_INSTR(0x5b, 0xba), /* CLK_11, 0x12 */
+	ILI9881C_COMMAND_INSTR(0x5c, 0xdc), /* CLK_13, 0x14 */
+	ILI9881C_COMMAND_INSTR(0x5d, 0xfe), /* CLK_15, 0x16 */
+
+	/* GIP_3 */
+	ILI9881C_COMMAND_INSTR(0x5e, 0x00),
+	ILI9881C_COMMAND_INSTR(0x5f, 0x01), /* FW_CGOUT_L[1]    FW */
+	ILI9881C_COMMAND_INSTR(0x60, 0x00), /* FW_CGOUT_L[2]    BW */
+	ILI9881C_COMMAND_INSTR(0x61, 0x15), /* FW_CGOUT_L[3]    GPWR1 */
+	ILI9881C_COMMAND_INSTR(0x62, 0x14), /* FW_CGOUT_L[4]    GPWR2 */
+	ILI9881C_COMMAND_INSTR(0x63, 0x0E), /* FW_CGOUT_L[5]    CLK1_R */
+	ILI9881C_COMMAND_INSTR(0x64, 0x0F), /* FW_CGOUT_L[6]    CLK2_R */
+	ILI9881C_COMMAND_INSTR(0x65, 0x0C), /* FW_CGOUT_L[7]    CLK3_R */
+	ILI9881C_COMMAND_INSTR(0x66, 0x0D), /* FW_CGOUT_L[8]    CLK4_R */
+	ILI9881C_COMMAND_INSTR(0x67, 0x06), /* FW_CGOUT_L[9]    iSTV1_R (STVA_1) */
+	ILI9881C_COMMAND_INSTR(0x68, 0x02), /* FW_CGOUT_L[10] */
+	ILI9881C_COMMAND_INSTR(0x69, 0x02), /* FW_CGOUT_L[11] */
+	ILI9881C_COMMAND_INSTR(0x6a, 0x02), /* FW_CGOUT_L[12] */
+	ILI9881C_COMMAND_INSTR(0x6b, 0x02), /* FW_CGOUT_L[13] */
+	ILI9881C_COMMAND_INSTR(0x6c, 0x02), /* FW_CGOUT_L[14] */
+	ILI9881C_COMMAND_INSTR(0x6d, 0x02), /* FW_CGOUT_L[15] */
+	ILI9881C_COMMAND_INSTR(0x6e, 0x07), /* FW_CGOUT_L[16]  STV2_R (STVA_3) */
+	ILI9881C_COMMAND_INSTR(0x6f, 0x02), /* FW_CGOUT_L[17]   VGL */
+	ILI9881C_COMMAND_INSTR(0x70, 0x02), /* FW_CGOUT_L[18]   VGL */
+	ILI9881C_COMMAND_INSTR(0x71, 0x02), /* FW_CGOUT_L[19]   VGL */
+	ILI9881C_COMMAND_INSTR(0x72, 0x02), /* FW_CGOUT_L[20] */
+	ILI9881C_COMMAND_INSTR(0x73, 0x02), /* FW_CGOUT_L[21] */
+	ILI9881C_COMMAND_INSTR(0x74, 0x02), /* FW_CGOUT_L[22] */
+
+	ILI9881C_COMMAND_INSTR(0x75, 0x01), /* BW_CGOUT_L[1]    FW */
+	ILI9881C_COMMAND_INSTR(0x76, 0x00), /* BW_CGOUT_L[2]    BW */
+	ILI9881C_COMMAND_INSTR(0x77, 0x14), /* BW_CGOUT_L[3]    GPWR1 */
+	ILI9881C_COMMAND_INSTR(0x78, 0x15), /* BW_CGOUT_L[4]    GPWR2 */
+	ILI9881C_COMMAND_INSTR(0x79, 0x0E), /* BW_CGOUT_L[5]    CLK1_R */
+	ILI9881C_COMMAND_INSTR(0x7a, 0x0F), /* BW_CGOUT_L[6]    CLK2_R */
+	ILI9881C_COMMAND_INSTR(0x7b, 0x0C), /* BW_CGOUT_L[7]    CLK3_R */
+	ILI9881C_COMMAND_INSTR(0x7c, 0x0D), /* BW_CGOUT_L[8]    CLK4_R */
+	ILI9881C_COMMAND_INSTR(0x7d, 0x06), /* BW_CGOUT_L[9]    STV1_R */
+	ILI9881C_COMMAND_INSTR(0x7e, 0x02), /* BW_CGOUT_L[10] */
+	ILI9881C_COMMAND_INSTR(0x7f, 0x02), /* BW_CGOUT_L[11] */
+	ILI9881C_COMMAND_INSTR(0x80, 0x02), /* BW_CGOUT_L[12] */
+	ILI9881C_COMMAND_INSTR(0x81, 0x02), /* BW_CGOUT_L[13] */
+	ILI9881C_COMMAND_INSTR(0x82, 0x02), /* BW_CGOUT_L[14] */
+	ILI9881C_COMMAND_INSTR(0x83, 0x02), /* BW_CGOUT_L[15] */
+	ILI9881C_COMMAND_INSTR(0x84, 0x07), /* BW_CGOUT_L[16]   STV2_R */
+	ILI9881C_COMMAND_INSTR(0x85, 0x02), /* BW_CGOUT_L[17]   VGL */
+	ILI9881C_COMMAND_INSTR(0x86, 0x02), /* BW_CGOUT_L[18]   VGL */
+	ILI9881C_COMMAND_INSTR(0x87, 0x02), /* BW_CGOUT_L[19]   VGL */
+	ILI9881C_COMMAND_INSTR(0x88, 0x02), /* BW_CGOUT_L[20] */
+	ILI9881C_COMMAND_INSTR(0x89, 0x02), /* BW_CGOUT_L[21] */
+	ILI9881C_COMMAND_INSTR(0x8A, 0x02), /* BW_CGOUT_L[22] */
+
+	ILI9881C_SWITCH_PAGE_INSTR(4),
+	ILI9881C_COMMAND_INSTR(0x6E, 0x2A), /* di_pwr_reg=0 for power mode 2A //VGH clamp 15V */
+	ILI9881C_COMMAND_INSTR(0x6F, 0x35), /* reg vcl + pumping ratio VGH=3x VGL=-3x */
+	ILI9881C_COMMAND_INSTR(0x3A, 0x24), /* POWER SAVING */
+	ILI9881C_COMMAND_INSTR(0x8D, 0x14), /* VGL clamp -10V */
+	ILI9881C_COMMAND_INSTR(0x87, 0xBA), /* ESD */
+	ILI9881C_COMMAND_INSTR(0x26, 0x76),
+	ILI9881C_COMMAND_INSTR(0xB2, 0xD1),
+	ILI9881C_COMMAND_INSTR(0xB5, 0x27), /* GMA BIAS */
+	ILI9881C_COMMAND_INSTR(0x31, 0x75), /* SRC BIAS */
+	ILI9881C_COMMAND_INSTR(0x30, 0x03), /* SRC OUTPUT BIAS */
+	ILI9881C_COMMAND_INSTR(0x3B, 0x98), /* PUMP SHIFT CLK */
+	ILI9881C_COMMAND_INSTR(0x35, 0x1F), /* HZ_opt */
+	ILI9881C_COMMAND_INSTR(0x33, 0x14), /* Blanking frame 設定為GND */
+	ILI9881C_COMMAND_INSTR(0x7A, 0x0F),
+	ILI9881C_COMMAND_INSTR(0x38, 0x01),
+	ILI9881C_COMMAND_INSTR(0x39, 0x00),
+
+	ILI9881C_SWITCH_PAGE_INSTR(1),
+	ILI9881C_COMMAND_INSTR(0x22, 0x0A), /* BGR, 0x SS */
+	ILI9881C_COMMAND_INSTR(0x31, 0x00), /* Column inversion */
+	ILI9881C_COMMAND_INSTR(0x53, 0x45), /* VCOM1 41  44  45  4A */
+	ILI9881C_COMMAND_INSTR(0x55, 0x4E), /* VCOM2 4E */
+	ILI9881C_COMMAND_INSTR(0x50, 0xC7), /* VREG1OUT=5.1V */
+	ILI9881C_COMMAND_INSTR(0x51, 0xC2), /* VREG2OUT=-5.1V */
+	ILI9881C_COMMAND_INSTR(0x60, 0x25), /* SDT=2.5us 蚕22蜊傖25 */
+	ILI9881C_COMMAND_INSTR(0x63, 0x00),
+
+	/* ============Gamma START============= */
+	/* Pos Register */
+	ILI9881C_COMMAND_INSTR(0xA0, 0x00),
+	ILI9881C_COMMAND_INSTR(0xA1, 0x16),
+	ILI9881C_COMMAND_INSTR(0xA2, 0x26),
+	ILI9881C_COMMAND_INSTR(0xA3, 0x16),
+	ILI9881C_COMMAND_INSTR(0xA4, 0x19),
+	ILI9881C_COMMAND_INSTR(0xA5, 0x2B),
+	ILI9881C_COMMAND_INSTR(0xA6, 0x1E),
+	ILI9881C_COMMAND_INSTR(0xA7, 0x20),
+	ILI9881C_COMMAND_INSTR(0xA8, 0x93),
+	ILI9881C_COMMAND_INSTR(0xA9, 0x20),
+	ILI9881C_COMMAND_INSTR(0xAA, 0x2C),
+	ILI9881C_COMMAND_INSTR(0xAB, 0x87),
+	ILI9881C_COMMAND_INSTR(0xAC, 0x1F),
+	ILI9881C_COMMAND_INSTR(0xAD, 0x1F),
+	ILI9881C_COMMAND_INSTR(0xAE, 0x53),
+	ILI9881C_COMMAND_INSTR(0xAF, 0x27),
+	ILI9881C_COMMAND_INSTR(0xB0, 0x2A),
+	ILI9881C_COMMAND_INSTR(0xB1, 0x52),
+	ILI9881C_COMMAND_INSTR(0xB2, 0x5B),
+	ILI9881C_COMMAND_INSTR(0xB3, 0x23),
+
+	/* Neg Register */
+	ILI9881C_COMMAND_INSTR(0xC0, 0x00),
+	ILI9881C_COMMAND_INSTR(0xC1, 0x11),
+	ILI9881C_COMMAND_INSTR(0xC2, 0x1E),
+	ILI9881C_COMMAND_INSTR(0xC3, 0x0F),
+	ILI9881C_COMMAND_INSTR(0xC4, 0x12),
+	ILI9881C_COMMAND_INSTR(0xC5, 0x26),
+	ILI9881C_COMMAND_INSTR(0xC6, 0x1C),
+	ILI9881C_COMMAND_INSTR(0xC7, 0x1E),
+	ILI9881C_COMMAND_INSTR(0xC8, 0x87),
+	ILI9881C_COMMAND_INSTR(0xC9, 0x19),
+	ILI9881C_COMMAND_INSTR(0xCA, 0x26),
+	ILI9881C_COMMAND_INSTR(0xCB, 0x7F),
+	ILI9881C_COMMAND_INSTR(0xCC, 0x20),
+	ILI9881C_COMMAND_INSTR(0xCD, 0x22),
+	ILI9881C_COMMAND_INSTR(0xCE, 0x58),
+	ILI9881C_COMMAND_INSTR(0xCF, 0x2A),
+	ILI9881C_COMMAND_INSTR(0xD0, 0x2E),
+	ILI9881C_COMMAND_INSTR(0xD1, 0x50),
+	ILI9881C_COMMAND_INSTR(0xD2, 0x5D),
+	ILI9881C_COMMAND_INSTR(0xD3, 0x23),
+
+	/* ============ Gamma END=========== */
+
+	ILI9881C_SWITCH_PAGE_INSTR(0),
+	ILI9881C_COMMAND_INSTR(0x35, 0x00),
+	ILI9881C_COMMAND_INSTR(0x11, 0x00),
+	ILI9881C_COMMAND_INSTR(0x29, 0x00),
+};
+
 static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9881c, panel);
@@ -1449,6 +1666,22 @@ static const struct drm_display_mode am8001280g_default_mode = {
 	.height_mm	= 151,
 };
 
+static const struct drm_display_mode txw700100s0_default_mode = {
+	.clock          = 78086,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 80,
+	.hsync_end	= 800 + 80 + 80,
+	.htotal		= 800 + 80 + 80 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 16,
+	.vsync_end	= 1280 + 16 + 24,
+	.vtotal		= 1280 + 16 + 24 + 8,
+
+	.width_mm	= 90,
+	.height_mm	= 151,
+};
 static int ili9881c_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -1609,6 +1842,14 @@ static const struct ili9881c_desc am8001280g_desc = {
 		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
 };
 
+static const struct ili9881c_desc txw700100s0_desc = {
+	.init = txw700100s0_init,
+	.init_length = ARRAY_SIZE(txw700100s0_init),
+	.mode = &txw700100s0_default_mode,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO,
+	.lanes = 4,
+};
+
 static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "bananapi,lhr050h41", .data = &lhr050h41_desc },
 	{ .compatible = "feixin,k101-im2byl02", .data = &k101_im2byl02_desc },
@@ -1616,6 +1857,7 @@ static const struct of_device_id ili9881c_of_match[] = {
 	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
 	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
 	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
+	{ .compatible = "tianxianwei,txw700100s0", &txw700100s0_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9881c_of_match);
-- 
2.50.0

