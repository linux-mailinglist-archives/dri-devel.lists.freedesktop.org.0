Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C400C419826
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 17:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8921789DA3;
	Mon, 27 Sep 2021 15:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA1B89DA3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 15:45:10 +0000 (UTC)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7623A4019D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632757508;
 bh=QblA15uiwZ7l+Ibk9gNFwOO+GmQVJrKRAtlqWocjIZ8=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=N92Z5vyx4awUm1LnPpyRFAgETxSD2VepiMB0Va3uvTyDZZX2IzI+9um3kdby4ke+G
 rEr34TsV5y5p2Eu1rusKVk4fPsoJbDAbFgYphNuKT5nVqznO4F8hN6mWvnhhxJdcwo
 +xmL9DW4Xgdz1wa18rRGw3dKKfhV5YPpI5H1i6OYtb71RZwMozb3udL+SPHYlybhSF
 lL+NbKXuJGl5YyFxDUgg7EAyzzJbtoMe4wcC4YVfdPLIV+pv4R3e8xvBWIOQecwphA
 8eS2hsFktIwQ8sW7DoiD7TRqMyxLZ4CBNQeOUkiE5ICJu5LjCJmsuUNayV9aUjzdXs
 f78PkfQwNWmrg==
Received: by mail-pf1-f200.google.com with SMTP id
 z24-20020aa79f98000000b004463f2f0277so11834497pfr.23
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QblA15uiwZ7l+Ibk9gNFwOO+GmQVJrKRAtlqWocjIZ8=;
 b=ItRFWTTkWW5TE6FcBHy5kTpEdFOPWHGO6WncRIUZNSv0eTbG6b0Sx/eDkeD2dmMNS0
 NLvLwpO7E9DP3t0QAI1t7lVr/PeAdSUT3xVpYtoaUl8kWTikJQ48B1+wZGIpl44Zp05P
 ZpSs2jmLgZo3g8iC79u0XRshlDvhtPJ0UCYaY2w3G1NokTT+4gb4Q9dE1ijo1iO6kG3q
 HWFPLeNu2EZkjaBTHlKnd2Oa64yP5fuL77HJI8h+WW72zB21C5WH8PiIuytZATfzHdl4
 aA5HA/IkQ5hSs42Qm2eKjsgzzueMRV6AZDlOkZMwEAGO7QuaXci1rZFBDhb+XTrOkLEz
 8WcA==
X-Gm-Message-State: AOAM531TmUEDZCxtF79QJoBQ2R9xOe3Vbmzz2x6QUuapQAXis5UZVsAH
 WxIM/bpf+d+5SxNP+GrVsJaIlpcKPdyHNI80zV/1fbMrUYYegKRVOOU8eOnrH2V32jMMag2YH0M
 ff4t8k1wVunuDRDzWD/10z1VzupkM1SIMxiNACjrM2Bd5Ig==
X-Received: by 2002:a62:7e55:0:b0:441:c7a6:fcd2 with SMTP id
 z82-20020a627e55000000b00441c7a6fcd2mr383212pfc.6.1632757507044; 
 Mon, 27 Sep 2021 08:45:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIcXtn44DVJ7kkF5B6wBQHYvxY4BnpmGkvMYNq6WMkWLzHV8KuCCeAXC9apx+oB2TD0uA2Gw==
X-Received: by 2002:a62:7e55:0:b0:441:c7a6:fcd2 with SMTP id
 z82-20020a627e55000000b00441c7a6fcd2mr383191pfc.6.1632757506705; 
 Mon, 27 Sep 2021 08:45:06 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id y2sm15987228pjl.6.2021.09.27.08.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 08:45:06 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: linux-fbdev@vger.kernel.org
Cc: tim.gardner@canonical.com, Antonino Daplas <adaplas@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] nvidiafb: Use strscpy() to prevent buffer overflow.
Date: Mon, 27 Sep 2021 09:45:02 -0600
Message-Id: <20210927154502.21026-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Coverity complains of a possible buffer overflow. However,
given the 'static' scope of nvidia_setup_i2c_bus() it looks
like that can't happen after examiniing the call sites.

CID 19036 (#1 of 1): Copy into fixed size buffer (STRING_OVERFLOW)
1. fixed_size_dest: You might overrun the 48-character fixed-size string
  chan->adapter.name by copying name without checking the length.
2. parameter_as_source: Note: This defect has an elevated risk because the
  source argument is a parameter of the current function.
 89        strcpy(chan->adapter.name, name);

Fix this warning by using strscpy() which will silence the warning and
prevent any future buffer overflows should the names used to identify the
channel become much longer.

Cc: Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 drivers/video/fbdev/nvidia/nv_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/nvidia/nv_i2c.c b/drivers/video/fbdev/nvidia/nv_i2c.c
index d7994a173245..0b48965a6420 100644
--- a/drivers/video/fbdev/nvidia/nv_i2c.c
+++ b/drivers/video/fbdev/nvidia/nv_i2c.c
@@ -86,7 +86,7 @@ static int nvidia_setup_i2c_bus(struct nvidia_i2c_chan *chan, const char *name,
 {
 	int rc;
 
-	strcpy(chan->adapter.name, name);
+	strscpy(chan->adapter.name, name, sizeof(chan->adapter.name));
 	chan->adapter.owner = THIS_MODULE;
 	chan->adapter.class = i2c_class;
 	chan->adapter.algo_data = &chan->algo;
-- 
2.33.0

