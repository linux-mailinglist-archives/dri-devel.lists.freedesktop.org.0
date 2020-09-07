Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D648725F3D3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE0C76E12D;
	Mon,  7 Sep 2020 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AC089B97
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 07:04:33 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id 67so7577468pgd.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 00:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=YQTXqB70FOxoYbplD1RyiH/vGAqYc+eq5To12NwEwkCENc6+zHRu7a+LrGAIrDvBw0
 1RzYjqvjIXebbVeyrXzS1RkVhAv4EeTZo/jUY3/2mDvpGAE7hTSoXSb+7a3pF/2qGCJ9
 FQ0l53OKgDEJL+paMUH3zuNfh4jlZ9s/daOMF3LRGLPiUNBTPPhjP/m11bQ6DNPvM2aT
 33w7AsCd5YCOU00n5BbvyhrPK26KVvlbAiTs/3KuT9B4R/mZFViVvZaRXPw5DbNAlc8d
 pGjEZz08S5EuTr7+X/ZO8pRJFcA977W2yhK+TnWQxEwhPWEFBjhZR7Nv6iv1Ya5jEOZA
 /vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FqAG9igPFBIm5I71RECWWlWkVlr9xLx/8DgDVT5uKZw=;
 b=OxQha0gd2lSk90cxIQf1cCKjVbBNhRtuCpnFzo1XSuIzrDe50TAnWDWDaSz+3fvF73
 siec511EY1/rLUxJ0fIrkctgku6ywMELER14sXIrxhf679wzrEoYafwJaesKovrLDd0M
 xzoN32oki8uThCczqLzOlbFhpO4IfYlRszyKHLPmTNpSwW1aRfDNgio9H7ZuMOl8/vjR
 AR77Mb3JUdQbTzX/P5zm6yhyHMb5mlx2dH/AroRZc41b//KnAMTLlBz1F1802c6sxs4U
 OEwSB5XO4gEYRvqgJGpSadUjrsY2zM/nOXrgCPw1OQ3yv43H4yXXfW8SdnXrExHFkAoK
 rlKg==
X-Gm-Message-State: AOAM5312qBMmzc+VtNViYL/5FMm0rAFSZM9VEDt6qX3ro+IAq4Wl+s+O
 mPDfL3Gm8ORsXf1SS1AcMUA=
X-Google-Smtp-Source: ABdhPJyD3ea1SKxV0y/fkOts7IPF7fAry7BYAtFdP95oJdb+n9w9Ob7nfkX1K7RX16sJHgCqyTyFTQ==
X-Received: by 2002:a63:8ac8:: with SMTP id
 y191mr15696084pgd.159.1599462273169; 
 Mon, 07 Sep 2020 00:04:33 -0700 (PDT)
Received: from varodek.localdomain ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id 204sm6804733pfc.200.2020.09.07.00.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:04:32 -0700 (PDT)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Subject: [PATCH v1 1/2] video: fbdev: aty: radeon_pm: remove redundant
 CONFIG_PM container
Date: Mon,  7 Sep 2020 12:32:20 +0530
Message-Id: <20200907070221.29938-2-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
References: <20200907070221.29938-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Sep 2020 07:22:17 +0000
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes commit 42ddb453a0cd ("radeon: Conditionally compile PM code")

Before the above mentioned patch, codes between the line number 547 and
2803 were already inside "#ifdef CONFIG_PM" container. Thus, addition of
"#if defined(CONFIG_PM)" was not required in the patch. It also affected
the "#ifdef CONFIG_PPC_OF" container (line 1943-2510).

From the current snapshot of radeon_pm.c, remove:
    1434 | #if defined(CONFIG_PM)
and,
    2213 | #endif

This removes the redundant CONFIG_PM directive as well as fixes the
CONFIG_PPC (earlier CONFIG_PPC_OF) container.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
 drivers/video/fbdev/aty/radeon_pm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_pm.c b/drivers/video/fbdev/aty/radeon_pm.c
index 7c4483c7f313..b9af70bd656a 100644
--- a/drivers/video/fbdev/aty/radeon_pm.c
+++ b/drivers/video/fbdev/aty/radeon_pm.c
@@ -1431,7 +1431,6 @@ static void radeon_pm_full_reset_sdram(struct radeonfb_info *rinfo)
 	mdelay( 15);
 }
 
-#if defined(CONFIG_PM)
 #if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
 static void radeon_pm_reset_pad_ctlr_strength(struct radeonfb_info *rinfo)
 {
@@ -2210,7 +2209,6 @@ static void radeon_reinitialize_M9P(struct radeonfb_info *rinfo)
 	radeon_pm_m10_enable_lvds_spread_spectrum(rinfo);
 }
 #endif
-#endif
 
 #if 0 /* Not ready yet */
 static void radeon_reinitialize_QW(struct radeonfb_info *rinfo)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
