Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72BB48365A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1326389ED6;
	Mon,  3 Jan 2022 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81C289ED6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:14 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id j124so56009143oih.12
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VZ4pKJgHsszMmcqxTz1e+5J5GZb7zq4y2dI8h4ugrSY=;
 b=YqgRNy3e/LDUOv8XRjOC5UCx/aMjg8XEFlch8mDRHtVonQ0ZV8/jgNeUhfCGanH6Yo
 PolYxAhADfVX5zn+L85oXP59jRHEH3OWIw0ra72++3eNKCE5loKqmsGcSJskgE/gEkdB
 y0xq40RazAiQZkwllA3+Z2UsswfVL7W+LDSVEkuaoPhhBvZM0dVi+3AgZCwQBD9V6Jb8
 obDSQuc9G2neTlnpkfLf40Zh0/pg59s5SDjvWMmBA8rlr+bgJvBbX8z/m72Gw91BMxIQ
 qONRiHNhAEwXx6f1qtoPyRR4/kVh5pohN4of1ICA4zT+wmu75SrDOVSmPB1kG+ANKahv
 uGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VZ4pKJgHsszMmcqxTz1e+5J5GZb7zq4y2dI8h4ugrSY=;
 b=Z7l4mf7g7h2YluGTSH+zUKwzP8lrBvt45w6uU3BOedyHkFkWznwnQxVTj7ZDeWZStR
 rpFxxQgTJdBunRyfLLPBx0AqR7QjfKtFMyu04oagCADAU/cfcCH1x6iqfqipbV6hPPJ0
 FwpCH1q7j89vleFAVNOfqwGSzc+NZxilWinU27gIUImQGoNbULYkqadAj/JP/GaEYL4f
 FjDyPNmoUYxE0dobMfnp0ekM/Kxt9y5AC8LXvnHwjQa4Te5xV4vVDY/HSHr4XBJ1VBEG
 sqmE8s412yWJLPsnBPmvL8EmXTwK2vJCQHdkVa1hYD9oPYCP2QuJguGLD0XrMrClZ6T9
 u0og==
X-Gm-Message-State: AOAM530z+0ZjVsQ7eWhRRW1GtmkePEAkrN1pQclpbnmB8v+faL4dRwTF
 rHG7ovoB4Us7ftBGYAMg6O8+97pzkC4=
X-Google-Smtp-Source: ABdhPJzeYvLlwXl15IEw/VEUtGL2Fa1RxgEybGYDznRop7dqPJrIOeGezTOjoXD8KXTfOj0biVEzOQ==
X-Received: by 2002:a54:4710:: with SMTP id k16mr34933036oik.32.1641231673843; 
 Mon, 03 Jan 2022 09:41:13 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:13 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
Date: Mon,  3 Jan 2022 11:41:03 -0600
Message-Id: <20220103174106.907-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103174106.907-1-macroalpha82@gmail.com>
References: <20220103174106.907-1-macroalpha82@gmail.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 include/uapi/linux/media-bus-format.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..a7b7654985ee 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x101e */
+/* RGB - next is	0x101f */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x101e
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
-- 
2.25.1

