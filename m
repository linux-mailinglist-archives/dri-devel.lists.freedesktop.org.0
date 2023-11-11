Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D7B7E8A5A
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B896210E275;
	Sat, 11 Nov 2023 10:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0130F10E269
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso4683318a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699369; x=1700304169;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57XfclRA1DPTjEGTeta8gbvZTvGhPeSww56J1vwZoGA=;
 b=JTfBInpgfiQiT0vICG0u+J7aKBs6cipmIuYmqBue9l7x8zsRJWOcvCOiMXQol2+QbM
 kxxtvszCkOlcKF91bE/xl1esLxJTVLKb3orNPPnshdgdhcv0Ah0tSLGhTloevUlq/7N7
 BcfsQy7hEV6jnWH/1t5sM5g+PKYhRkuJsu8JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699369; x=1700304169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57XfclRA1DPTjEGTeta8gbvZTvGhPeSww56J1vwZoGA=;
 b=VgtxOK1fm1at2EYrzz9x7TJjXGol7cyPihNe6RAdZKfmKEX9E5dRAaHONrJIX0HcRQ
 9jkQ+k7ntU9LVwTG74cZy7rQZcmPxnufuW0z1KFFjjrHh4ujcU3PP/BJIDb5ax+DERI4
 RZLaog5DFlQMJ78jEdjKR6xLwJ9fZmKTA6sdv2GAY7JfjW7j0lVCNorJLMgd2qwaS/Gq
 ljeMLav7YEiTysuWbjYfl1816RDiAKKgYPydJOvUbnxtj21rYkpJWbIBOJWvZC25y2SN
 64pOIAyR/y0MuMgznid/Ja/VMGAa6LBGdQ9k9gugIfX6CRkJlZi3ES1TojPNqJe3gTyh
 WzLw==
X-Gm-Message-State: AOJu0YzK3J3StjXixscL4nz3qUyxN4/0WVj50oQ9Um29qI8lm480h33u
 WHbaxdMXu1qzLzCzMbJqy+lX0w==
X-Google-Smtp-Source: AGHT+IF51sz/9Eym2oiwu4zOU3bpJ1pg92NvUM3b8/mDpd88MUL1wczf210dAwnnzyMpQ5H7XMHxcg==
X-Received: by 2002:a17:906:361a:b0:9dd:bd42:4ec2 with SMTP id
 q26-20020a170906361a00b009ddbd424ec2mr908050ejb.10.1699699369457; 
 Sat, 11 Nov 2023 02:42:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] fbdev: imxfb: add '*/' on a separate line in block
 comment
Date: Sat, 11 Nov 2023 11:41:59 +0100
Message-ID: <20231111104225.136512-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux kernel coding style uses '*/' on a separate line at the end of
multi line comments.

Fix block comments by moving '*/' at the end of block comments on a
separate line as reported by checkpatch:

WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/video/fbdev/imxfb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 8d6943f0bfca..a4dbc72f93c3 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -946,8 +946,10 @@ static int imxfb_probe(struct platform_device *pdev)
 	if (ret)
 		goto failed_init;
 
-	/* Calculate maximum bytes used per pixel. In most cases this should
-	 * be the same as m->bpp/8 */
+	/*
+	 * Calculate maximum bytes used per pixel. In most cases this should
+	 * be the same as m->bpp/8
+	 */
 	m = &fbi->mode[0];
 	bytes_per_pixel = (m->bpp + 7) / 8;
 	for (i = 0; i < fbi->num_modes; i++, m++)
-- 
2.42.0

