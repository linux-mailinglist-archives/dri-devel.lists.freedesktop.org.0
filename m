Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F06EFA5F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 20:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738E10EA03;
	Wed, 26 Apr 2023 18:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877FC10E9F8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 18:54:58 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b35789313so5413140b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682535298; x=1685127298;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7om461OI/LjhPCQ00bZ+IVTvWddH+7Li64Kb9mQvwjY=;
 b=dA2viRZxkPIUj46GrtvdWPfEcRLj5gNItAOQt2nFpcWWZb593LOxICm+e2NZcnINp8
 tLHnRlqcrhQ6Yi8KlbiAUHXGemOz1qWCTyb+E1WgedrCtksEJrgJtdElwM66z2Tx71Jp
 oXl8fRRB2YbnxyJJKPHSJADm9jxr7IeWY/vxYYjYFcOg+GgCaBBhDiTyn6Frhb6XbGEh
 TeMeTDuS3HpHZJikOBWp5f9JwJJQLx2Yx2OLd8209GUzfd8Zwe4ANHJv0bM98Du+lKmE
 iVCpDmjC8Lxh5IvWVsJt7BmDdw2Os/z2qnBXDoiaxnojJUB5z7z/1xQqYEN0z+WU9gD9
 xR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682535298; x=1685127298;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7om461OI/LjhPCQ00bZ+IVTvWddH+7Li64Kb9mQvwjY=;
 b=kYDA26oD9J2vKUvAtp6jwRr2Cz+ZN/m/3CQcD4zuz6hHgM5CDtbDj0/c2DLyPNQ8Dy
 yaC0LPMyAXY62lrWGqESevxKuU4sO5DsKqXB/egQuyloSTgmM+6SOLIX/d9Z45YrDkMS
 C9VMo6mgDtgCNvEUJhCYoZBqDE+NPAPnyynUJyXOaLfDbya0onmvfKGQqoMMG5GEK6Uo
 4yeVnmRFlGTKJ1bJUMGnBvsSiwzfpbIQ+dFspuzvpQvLJY1EIo/KvE3e6AtQKM7qBBg7
 IvT0culGWdgJeJP+MbRRl2H6aR9qYRJV6v1w7r5C0dlNcM1hqEkreWUcvmyWr1LaFi5t
 3qcA==
X-Gm-Message-State: AAQBX9enpFswXX1RsexYC5xxw/BM7Z2pnsa8Rr64sKI30+bOflyR5jDQ
 QMb/G8YqzVx4sX5Xpe6QxZA=
X-Google-Smtp-Source: AKy350bRV2U7foEPKMVz9+6QLCQge6e6/2YXskUnlLN8kzLZHv83HvAMhBi4nTETHHBaeN5Nufb5nQ==
X-Received: by 2002:a05:6a00:23c5:b0:63a:8f4c:8be1 with SMTP id
 g5-20020a056a0023c500b0063a8f4c8be1mr30303575pfc.10.1682535297914; 
 Wed, 26 Apr 2023 11:54:57 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a62644b000000b006372791d708sm11639254pfb.104.2023.04.26.11.54.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Apr 2023 11:54:57 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2 net-next 5/6] net: phy: bcm7xxx: Add EPHY entry for 74165
Date: Wed, 26 Apr 2023 11:54:31 -0700
Message-Id: <1682535272-32249-6-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
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
 justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Florian Fainelli <f.fainelli@gmail.com>

74165 is a 16nm process SoC with a 10/100 integrated Ethernet PHY,
utilize the recently defined 16nm EPHY macro to configure that PHY.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

