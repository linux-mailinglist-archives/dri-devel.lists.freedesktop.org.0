Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903067E8A53
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:43:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C1510E26E;
	Sat, 11 Nov 2023 10:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670D710E26E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:44 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9e62f903e88so214900466b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699363; x=1700304163;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VfR080tdra7BLhUIWSvcaEDMSQNVyZv5MjwAaJaquw0=;
 b=eZvzzadLwSEMIMCeOPt7YlZEu8btTIblcLv81fK/SdJM0LQCudisfNlYixJPdHCaB1
 DeDLz3diSiq2nTfsjG0fDMwkgAK6jRMXCdEFSxoHxJ7IqmqlM6kCLUgZbTm3Pj1a6wse
 pGCCg4LO3UOYcaI/BZijQ8Wrhaz/A3+mhap4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699363; x=1700304163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfR080tdra7BLhUIWSvcaEDMSQNVyZv5MjwAaJaquw0=;
 b=KwmtfbyT74OKVIXTmcnNe9VAS5aQoG+P32e9f+fCWaLDNkewhFj5BQL6YqRBoE7lw6
 UfRZVIuvdPufukggw6lKe/ZRkJCto2+lp2P0hcw6xNeNjxodCqnHRTEj1uTEdJcxrBQi
 ui1YiGr2t1svRsrwpSgFlk1U/rLxFf4aKIH5Wxntbwy5FGTkcszwsWUPbN6KQ2JDHC0M
 8lyxWF7C+YJABFCNsXnNI9ZJ2kHuwEVL5vLAdRaoyzLY/JWJPkVjFibu8F3zoojw6FAT
 xoWg+bq103ElR4LNkBVfeQUG54Qfk4/WSMJLexWM0dYGZAcekYcr4e4BTFhPiOBlXG30
 Xlug==
X-Gm-Message-State: AOJu0YxiFAxDUND0M8Wk/4dPxlhuKmXILt39/L8mKktXTheuaMut/1tA
 Hs4s+3Db9kmrGhDme3XHq9VatA==
X-Google-Smtp-Source: AGHT+IERVItiW0QNcc7Itc1tQ63vCmzWRiYW8aKUXkxzrDZclJWRXQE4ZuhMCcTgFOSgvNri9tEQNA==
X-Received: by 2002:a17:906:32d9:b0:9cc:97b:5a15 with SMTP id
 k25-20020a17090632d900b009cc097b5a15mr963727ejk.64.1699699362713; 
 Sat, 11 Nov 2023 02:42:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] fbdev: imxfb: add missing SPDX tag
Date: Sat, 11 Nov 2023 11:41:54 +0100
Message-ID: <20231111104225.136512-6-dario.binacchi@amarulasolutions.com>
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

Resolve the following warning reported by checkpatch.pl:

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1

The patch also removes some license info made redundant by the addition
of the SPDX tag.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 485e57fa9389..de1434069530 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  *  Freescale i.MX Frame Buffer device driver
  *
  *  Copyright (C) 2004 Sascha Hauer, Pengutronix
  *   Based on acornfb.c Copyright (C) Russell King.
  *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive for
- * more details.
- *
  * Please direct your questions and comments on this driver to the following
  * email address:
  *
-- 
2.42.0

