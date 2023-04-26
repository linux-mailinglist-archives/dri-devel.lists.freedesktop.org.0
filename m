Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF126EF67A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 16:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5B510E4BD;
	Wed, 26 Apr 2023 14:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8558210E101
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 14:32:27 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a64b5bc7aaso4424275a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682519546; x=1685111546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=340VE8yyciE0VVNXRcAMeTlRfiO46LMQpmeQ1hUKh7g=;
 b=UJrS7ew6Y5c+2wzJDLja6RehbZbiME1vU2/NLKU5WkoLvX6WRcRycGBOfeDt3CSQdn
 Iq4XxcehcrfdoDJSALuQ0esDZ70xwkJge67LXUIuXtan1eipJ1XhbLso+Dkx61SwlCYk
 +CG105rYwicn9YAGSyH+GqhY3tcy1uMFB7jCtFkLORF9Yur/jLfaD9GEKXhOW3Ts3EZd
 sG3qPHTWUfktSOkVlzSaNzlfsrX6OdX6A/K8ZvvP7WHbvaGTnrsds126gaKmlOrt1BSX
 fqhgAtOsGWPMF18QIn9bfrYNEPTnFsLv68eXfc1RB1rEPMjGeQLbatcN7jNgJZ9JoxbQ
 Ckbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682519546; x=1685111546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=340VE8yyciE0VVNXRcAMeTlRfiO46LMQpmeQ1hUKh7g=;
 b=ipwisdfDkoDFuf9kfKUB8CMbdNTUe2qcE/8IEMQTqRuw2WYzAeJ1oMo52SCFGBGXzE
 QUcr//2Tla4df4h/fFd2ap57fvPwjHavucIADyIb9JhOsxXVgsCgsISr2/AUkkDfvd3q
 Gb0DFot27eMeZUxu3xpsrLavFFwzKeHl4C00CONvErDD+gamFVF0TBI7F9WuxvlDGb3O
 4+FWPQdvBd31BzSM2fccB6rZxIdhqEJQFrl/fp1B3s0GuKA3Pb9oEfK/2l6bsoOsUuxq
 q7ay2+wSYl1L3m1igWrRyZAMxGYaW4OtV0Z1zt0i4hLwStCU1AybVHYTazYNpvfLSFvd
 bJUg==
X-Gm-Message-State: AAQBX9dKjF8PI1HasqcvGu1g0TJXHM2Qnwm4fl8+OdfkClfKBOVYeKeW
 75vdZUwnY+QQ8tXC2u4JN/Zj5618x1k=
X-Google-Smtp-Source: AKy350Z1kM6FryOxsjjecboR7nQFlr53tk49FDbyoz6TRIZdc7AgHCX6l/VN3HYhWClMsv1CORwxWQ==
X-Received: by 2002:a9d:7cca:0:b0:6a6:52a4:5e49 with SMTP id
 r10-20020a9d7cca000000b006a652a45e49mr6231046otn.12.1682519546144; 
 Wed, 26 Apr 2023 07:32:26 -0700 (PDT)
Received: from localhost.localdomain ([76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05683010d200b006a32ba92994sm2613502oto.23.2023.04.26.07.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 07:32:25 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 2/3] drm/panel: st7703: Rename CMD_UNKNOWN_C6 to CMD_SETECO
Date: Wed, 26 Apr 2023 09:32:12 -0500
Message-Id: <20230426143213.4178586-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426143213.4178586-1-macroalpha82@gmail.com>
References: <20230426143213.4178586-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: megous@megous.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, agx@sigxcpu.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org, sam@ravnborg.org,
 kernel@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

A later revision of the datasheet for the ST7703 refers to this command
as "SETECO".

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
index 6747ca237ced..fc55b5fbb67f 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
@@ -41,8 +41,8 @@
 #define ST7703_CMD_UNKNOWN_BF	 0xBF
 #define ST7703_CMD_SETSCR	 0xC0
 #define ST7703_CMD_SETPOWER	 0xC1
+#define ST7703_CMD_SETECO	 0xC6
 #define ST7703_CMD_SETPANEL	 0xCC
-#define ST7703_CMD_UNKNOWN_C6	 0xC6
 #define ST7703_CMD_SETGAMMA	 0xE0
 #define ST7703_CMD_SETEQ	 0xE3
 #define ST7703_CMD_SETGIP1	 0xE9
@@ -249,8 +249,7 @@ static int xbd599_init_sequence(struct st7703 *ctx)
 				      * ESD_DET_TIME_SEL = 0 frames
 				      */);
 
-	/* Undocumented command. */
-	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETECO, 0x01, 0x00, 0xFF, 0xFF, 0x00);
 
 	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
 			       0x74, /* VBTHS, VBTLS: VGH = 17V, VBL = -11V */
-- 
2.34.1

