Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049029BC20
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AD96E1E8;
	Tue, 27 Oct 2020 16:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D166E1CF
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 16:31:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id x13so1209474pfa.9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nUeg+KxMLxDKpdFvHBE7A01n74AzfVei6UlOMkqKwCo=;
 b=eJd5hFTofb9nO3xoRiSpfTlcid9glOapJOgmYsVfMyHHvMSOJrs4pSTEHyGbbow16A
 ylY6G8NsY4Rp2W3YRR23uTBIjPOT6NLyB31lgklY3LxgRJ/jXQHmWYolJMwNMykAU31L
 omCPGFyX2TlmPysrnXjSmUBT8KEmMLUW+VC7XCS+IyXKHgQxUeuMo1eHvIeFGwJm1BcP
 vk75vFLvPAzsd9ZmvJaT58BJu7ihx6Ek0p7WWMCQA59LU+F79ktZMZugsSsvx14EMtQ7
 0mfZo1CtrJq1SA460eQflL/mteTWCpWJlAEewb/I7nJcuLWBv8+OdRm8fXsBjW5Y/XB4
 qKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nUeg+KxMLxDKpdFvHBE7A01n74AzfVei6UlOMkqKwCo=;
 b=eFaJfdnHFUUuSR0RCPebsQS8SRBmAhO4PjnMebPXHU40u/1Q6wEHTSMxPs04byZN3o
 Zl9faNWEj/5NIFBAoSPYW5PajJDJo4yEsRmqT3kuOp8IbIF2n/ZwjX75734vkV5ZmIbT
 YYNHExTphuJFD4ulQEtviR53N0VkoQdRo2vDeFTxI3fSPn4WBPaGHkiqy2nzI1v/macj
 4O7Czn7BUI7Ja5deQKnOEYyqNZYBGQ/Klpik46P7/JiFTxhyyVl0p+f2RlFBSp9nN7D4
 sLMT1HhgNcdRR4jH+E1/cSQcNA1zDPdXjMCVaZT3yW1XXo/PXUVQwOQ17H5W+BvYHQyU
 UPCg==
X-Gm-Message-State: AOAM533yInB25Dlrd+ZLWtMoyQFpHJnbUpWDKgzQlUzcIKRQaftcKj/9
 q/qfgq9ePC/s6BlvChNkhA==
X-Google-Smtp-Source: ABdhPJzXlpA9p0YQjtHIKX03TX1A/bHiqf2YTkdJxUi2MkxnIAQILYuosDzjXEQDPdnA50zJo6DPEA==
X-Received: by 2002:a63:fe49:: with SMTP id x9mr2496134pgj.192.1603816310574; 
 Tue, 27 Oct 2020 09:31:50 -0700 (PDT)
Received: from localhost.localdomain (n11212042025.netvigator.com.
 [112.120.42.25])
 by smtp.gmail.com with ESMTPSA id y8sm2771710pfg.104.2020.10.27.09.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:31:49 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/5] fbdev/atafb: Remove unused extern variables
Date: Tue, 27 Oct 2020 12:31:08 -0400
Message-Id: <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1603788511.git.yepeilin.cs@gmail.com>
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove 6 unused extern variables to reduce confusion. It is worth
mentioning that lib/fonts/font_8x8.c and lib/fonts/font_8x16.c also
declare `fontdata_8x8` and `fontdata_8x16` respectively, and this file
has nothing to do with them.

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
$ # Build-tested (Ubuntu 20.04)
$ sudo apt install gcc-m68k-linux-gnu
$ cp arch/m68k/configs/atari_defconfig .config
$ make ARCH=m68k menuconfig
$ make ARCH=m68k CROSS_COMPILE=m68k-linux-gnu- -j`nproc` all

 drivers/video/fbdev/atafb.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index f253daa05d9d..e3812a8ff55a 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -240,14 +240,6 @@ static int *MV300_reg = MV300_reg_8bit;
 
 static int inverse;
 
-extern int fontheight_8x8;
-extern int fontwidth_8x8;
-extern unsigned char fontdata_8x8[];
-
-extern int fontheight_8x16;
-extern int fontwidth_8x16;
-extern unsigned char fontdata_8x16[];
-
 /*
  * struct fb_ops {
  *	* open/release and usage marking
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
