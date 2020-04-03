Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9771E19E501
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:46:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1C6E1F5;
	Sat,  4 Apr 2020 12:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EB36E161
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 16:05:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so9165910wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWqKdCVyF/z0Jc9mD3yRP7UIaHgfLawKN8WXGvn4s4c=;
 b=GfnGlLgUcYQIhYNkEieLbOd0BRlWORaqkq+5m0qgwVo5hzUcRhv8tTxl1be5jb/9KC
 FBBtRRg9JRTJegE9didYrrlZ+eV7nagVkB//sCytQSRNLF7Jg6PSwoC//w/26ZBJUTDm
 qXHvr4l+mvZfQalJct1p/EDlLHXqXABIPVPu9GYAwcU/ZHj5aTWHSvXbpAa1/2p+Kdhs
 y9V2XGB/sZsCbWmjr3Rw8xwBATsq+00Qc/SsPalm1TGo7lAkc4THILYVGwNI9sq6JTRs
 W7XzrPbwy9iDU5ooIxt3yiDlNCfSgZ1GDq2SgRJKtwPJCEbfjJx38P45StiCQff5HFge
 hwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWqKdCVyF/z0Jc9mD3yRP7UIaHgfLawKN8WXGvn4s4c=;
 b=KVRCAqfArariCtjJYHnGpOTGIC6jDrKqv9VxSj4vk5QJhh9yFZimRE/CdzPG5fHOBJ
 RtMmgW4QzH3Th8HaRA4ChED1KoheqQT4UGSPWpBYw0bfNo3E7RK08fQrkl8wMJdWUR75
 KLrSHBzQgJFm3pCHyLvWBFd299dfQcznRJhGOpsMpHQfl+akrFCsqrI/yq1x5WzUPRwl
 d7z2yzoZVmtzhOBXsiiL59OsjzyNI9Oj+n39HVGZO2l0nf+GnTHvRiRtyfd0/SHA4heO
 Wr0yqrKfitRKEUNKxlUUo1IN48MPQynRlBHXFVbKBS9Ddp5UVGlXBN2ph+yxYBzE7MJi
 nYZA==
X-Gm-Message-State: AGi0PuaXFyc5/WTeHOMQoPPGeJ6q65OfYi12qBPdMckHCKhe0kzI5+pG
 z/mpcfvplo0guZ11pF9NdA==
X-Google-Smtp-Source: APiQypLlwCkpYa4n/r1Dl73HpNAoUEjQYzF0myq5wOhev5KOXnIYY8OsFiBS/1oEbMxa6ypryajfqw==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr9412066wro.399.1585929958228; 
 Fri, 03 Apr 2020 09:05:58 -0700 (PDT)
Received: from ninjahost.lan (host-92-23-85-227.as13285.net. [92.23.85.227])
 by smtp.gmail.com with ESMTPSA id l12sm12351426wrt.73.2020.04.03.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 09:05:57 -0700 (PDT)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] video: Add missing annotation for
 cyber2000fb_enable_ddc() and cyber2000fb_disable_ddc()
Date: Fri,  3 Apr 2020 17:05:02 +0100
Message-Id: <20200403160505.2832-3-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403160505.2832-1-jbi.octave@gmail.com>
References: <0/5>
 <20200403160505.2832-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, boqun.feng@gmail.com,
 Russell King <linux@armlinux.org.uk>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 "moderated list:CYBERPRO FB DRIVER" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports warnings at cyber2000fb_enable_ddc()
	and cyber2000fb_disable_ddc()

warning: context imbalance in cyber2000fb_enable_ddc()
	- wrong count at exit

warning: context imbalance in cyber2000fb_disable_ddc()
	- unexpected unlock

The root cause is the missing annotation at cyber2000fb_enable_ddc()
	and cyber2000fb_disable_ddc()

Add the missing __acquires(&cfb->reg_b0_lock) annotation
Add the missing __releases(&cfb->reg_b0_lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/video/fbdev/cyber2000fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index 460826a7ad55..513f58f28b0f 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1160,12 +1160,14 @@ EXPORT_SYMBOL(cyber2000fb_detach);
 #define DDC_SDA_IN	(1 << 6)
 
 static void cyber2000fb_enable_ddc(struct cfb_info *cfb)
+	__acquires(&cfb->reg_b0_lock)
 {
 	spin_lock(&cfb->reg_b0_lock);
 	cyber2000fb_writew(0x1bf, 0x3ce, cfb);
 }
 
 static void cyber2000fb_disable_ddc(struct cfb_info *cfb)
+	__releases(&cfb->reg_b0_lock)
 {
 	cyber2000fb_writew(0x0bf, 0x3ce, cfb);
 	spin_unlock(&cfb->reg_b0_lock);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
