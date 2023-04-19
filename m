Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30706E7040
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE06C10E81F;
	Wed, 19 Apr 2023 00:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4EA10E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:48 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id fg9so10690650qtb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863047; x=1684455047;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/2vIzbLiLymfxf2AgDpir16B8+TkBntySAPe1DAnU4w=;
 b=B7j563x3k3sFbQ8tcPKuW1KI8WAmt2BvMWhtVVwnSgSFmZLSng25KrLtgS22jcSMef
 f9ETGGwIUFO1nXdLmgnrrHrspOuMVWgFIfyhI7uMZarwU+XSoxl/LmlD9qDWbw0gaYbl
 +Pz6WVhv2rdPPNokLIcZ0MwlJDh7/Kyl3I3Opk+wD31KjOxFxlPjmtVYne6PJ71KXGco
 FK4dxm3Iid9PYfyrWuZpHvXqUJ5eWydwW4k49AgT7Hb/9fim64sqTjHltl/CFI/dXBkM
 5TVoYG2mEDgwQu2YyJpcYwAyP4HczGii417hwg1vE2jHvRNTvURD8UrVjE0TStsmjKJs
 xWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863047; x=1684455047;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/2vIzbLiLymfxf2AgDpir16B8+TkBntySAPe1DAnU4w=;
 b=KlMsV//g7uINkJjRCbBLyT/lFV9qePKjTLJuUXNWJmEtFja3/E/c39dfq0io3Vh8WR
 G5U39OxyK2f56JLRdCTssWlyIDpAkNU6LW3MudGTP8Q1Mg1QWbu+OG5I4nw5El7lZAHq
 HhuQcYIegma3qKHJWOJ3VaCHGf8Dy+pgQl2xQLKUTLfPn80UOBaQD2HgIdHqN9xJzByJ
 nauBhnJb1IohWbfVl5wbQm3x+4ihkPmcziLdacGpiNkBqHFr5Cqq9p653WzFgL1P5OHh
 b9vQnIlxHU7v6aZBQgdoqDAF+OxeWMawPlVwAOfARxnthkW/kuuTUWu91IJt0wlaLyD3
 WO2w==
X-Gm-Message-State: AAQBX9eLKA8bzx1f+G78NOPBy9TAb5mJTx89KFrip2jsF1VEl2I4okQ1
 sGGLnhRDTuXPpuvM+tICdy8=
X-Google-Smtp-Source: AKy350YYX3xkMc3JUvVz099jJkT0BT8lDoC1lOhDKEvkClJkM1OMCPtW2W7AMXymPuhTaYfQABlMzg==
X-Received: by 2002:a05:622a:44c:b0:3e6:454f:9a89 with SMTP id
 o12-20020a05622a044c00b003e6454f9a89mr2958425qtx.14.1681863046793; 
 Tue, 18 Apr 2023 17:10:46 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:46 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 5/6] net: phy: bcm7xxx: Add EPHY entry for 74165
Date: Tue, 18 Apr 2023 17:10:17 -0700
Message-Id: <1681863018-28006-6-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Florian Fainelli <f.fainelli@gmail.com>

74165 is a 16nm process SoC with a 10/100 integrated Ethernet PHY,
utilize the recently defined 16nm EPHY macro to configure that PHY.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
---
 drivers/net/phy/bcm7xxx.c | 1 +
 include/linux/brcmphy.h   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/phy/bcm7xxx.c b/drivers/net/phy/bcm7xxx.c
index 06be71ecd2f8..5c03c379cb5e 100644
--- a/drivers/net/phy/bcm7xxx.c
+++ b/drivers/net/phy/bcm7xxx.c
@@ -913,6 +913,7 @@ static struct phy_driver bcm7xxx_driver[] = {
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7278, "Broadcom BCM7278"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7364, "Broadcom BCM7364"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7366, "Broadcom BCM7366"),
+	BCM7XXX_16NM_EPHY(PHY_ID_BCM74165, "Broadcom BCM74165"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM74371, "Broadcom BCM74371"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7439, "Broadcom BCM7439"),
 	BCM7XXX_28NM_GPHY(PHY_ID_BCM7439_2, "Broadcom BCM7439 (2)"),
diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
index 9e77165f3ef6..e11c2e9a5398 100644
--- a/include/linux/brcmphy.h
+++ b/include/linux/brcmphy.h
@@ -44,6 +44,7 @@
 #define PHY_ID_BCM7366			0x600d8490
 #define PHY_ID_BCM7346			0x600d8650
 #define PHY_ID_BCM7362			0x600d84b0
+#define PHY_ID_BCM74165			0x359052c0
 #define PHY_ID_BCM7425			0x600d86b0
 #define PHY_ID_BCM7429			0x600d8730
 #define PHY_ID_BCM7435			0x600d8750
-- 
2.7.4

