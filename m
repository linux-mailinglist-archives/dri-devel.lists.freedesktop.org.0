Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D87E8A58
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CA810E272;
	Sat, 11 Nov 2023 10:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9110E26E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso4480844a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699368; x=1700304168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fPpjqbZXDXnwfpqh3sU0UKiF5sG/PgBCsBX0KBupbI=;
 b=r06r8F8VwvTJZA60ZhFztUgjoLloN1CnqkN9ZCfboacA2eKlrooCdf+M/pDBqs002M
 Vtlw8DKz9QQu1TuQ98+gF2lnm4/xL/qofU5vMI2jsh4b4cw9d2OtGUHJbhBPVE29bZTu
 GlR2vUSoZZC2ljxp24Q7vw9sV+c6ZPhea+y80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699368; x=1700304168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0fPpjqbZXDXnwfpqh3sU0UKiF5sG/PgBCsBX0KBupbI=;
 b=fVdix9EG6UR+mNaznC+uQeostSYdtTxZo+ELub6LkKNahIpRd7AOypTy6lOHxk92Fz
 mIBctD3b8A9QkM7xkXvmeAi9OPyOORe24/LKbAOAlQxrjBFs/OVQreoXZueW0AFVmMfZ
 2w22o33tLbzKv8bKhVaykz0/e1/QdYrtgMMrkVXyCqvWYjO4n12jvlfj82mCYUlCoSKr
 q/j29hUJFPc96s+i3X36eZDLgMP1NnzHHiZHP6v76jwVGWAKjbetspT6CQxSLra9JUWs
 TyFdKCkfhCpxbhg7sAIJT6fs/7AgW4hw1OvrIWKNhDs3TXpxq0v5F7omqoOJZvP+Rnfa
 aY3w==
X-Gm-Message-State: AOJu0YxBNjL1/wXOhb6zjVKgAj5NLZSFPHlqEM5BYscz6qKmGUYUkK6p
 JYa6snqGNXgAcU1FWeJP9VZw+Q==
X-Google-Smtp-Source: AGHT+IHstjBS6znxzWZl5i2bWmEodHYLi43ulh4NK9b9RQW7CPLRH4hNONaMe+WD/i4AMw1LubUCfA==
X-Received: by 2002:a17:906:f247:b0:9d2:bf19:88aa with SMTP id
 gy7-20020a170906f24700b009d2bf1988aamr1056461ejb.59.1699699368178; 
 Sat, 11 Nov 2023 02:42:48 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] fbdev: imxfb: use __func__ for function name
Date: Sat, 11 Nov 2023 11:41:58 +0100
Message-ID: <20231111104225.136512-10-dario.binacchi@amarulasolutions.com>
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

Resolve the following warning reported by checkpatch:

WARNING: Prefer using '"%s...", __func__' to using 'imxfb_blank', this function's name, in a string

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index a0172ff75c46..8d6943f0bfca 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -576,7 +576,7 @@ static int imxfb_blank(int blank, struct fb_info *info)
 {
 	struct imxfb_info *fbi = info->par;
 
-	pr_debug("imxfb_blank: blank=%d\n", blank);
+	pr_debug("%s: blank=%d\n", __func__, blank);
 
 	switch (blank) {
 	case FB_BLANK_POWERDOWN:
-- 
2.42.0

