Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF25418046
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D667B6E3C1;
	Sat, 25 Sep 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014EE6EE8A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 21:45:14 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 gj8-20020a17090b108800b0019e8deab37bso2150300pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 14:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=epToM7rTUgDt/oPY5JZMe7Kk98e+irfzzBER4/Xpfp4=;
 b=dNDP3CaQeEGsblNafyCxRaIg4lRVSpTrYzue0XIllqggvAnzdlv559QOJO0lvLTtFp
 DDMLhIPUU+JyOBYfjDhzcOEAi38XzXa7FWe7mkiYNoViB2zs40m1giQvfXWWFjAoAVHi
 ERMQA2ZvtsrqhBZRtebFeWZy5ogX+xaKQB9voyxze9P61RIx9oQ6PTd4r2Jjn3c6qKrz
 rYkqQGApSjwgV3HZREPXzkHvdP2FQxVzLZUiB7WBL29M/C8z0/wc2WpRdTMBCwSyH80a
 NLEYpw/qy+Vvng2IBNzVH/hSn8/SXkNBoN/SIucAs2D9DOqrpa5f1RT6jDxrcSPX63zS
 ZXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=epToM7rTUgDt/oPY5JZMe7Kk98e+irfzzBER4/Xpfp4=;
 b=MYkfDm/DgF90XkXtnXBc0Wj0GTNjL0uX3VIeOJaOZHabpesHC9A3glXUshLmgjZlj4
 I6fvJuPIcTYL+t0rCXzaIZSROwMt6VjevSwhF6g1Jy6Pfyy1Ic9HmlqU5G9OGtYi+uzw
 tLDmGOk/nhwNB1k/M0tsmZ9dY9+yKsTd0AIQoQqmIurAeZV51b8ItfvKVpISNgA9fLVP
 nw4oCoINzpBBw0S9s1a06H1h0rDjubRYKd048AKPMmYDEl7/z+WF0wWUNH7+IHsGo05u
 8t18VapCGB+HLpbapYetiHH0ir4Gc2AJ1yEsRP0dEs0vXTItVsDnKi8yFoUEAhJAZtF6
 9/VQ==
X-Gm-Message-State: AOAM5312AXVr0iW+52iN2cgukq1Z0TXIsaRNMePXhmtWDQ+PPaIKGaLM
 gowNjS7VB8S4xr3f6Jp4jII=
X-Google-Smtp-Source: ABdhPJxMxy7rARwSn89e5tP/HM6c8wUUMpshXQGMXqQ/qMpXAyOnYrBp6Qn+w4L9nJqji48KkTj6uQ==
X-Received: by 2002:a17:902:aa02:b0:13a:6c8f:407f with SMTP id
 be2-20020a170902aa0200b0013a6c8f407fmr11130485plb.59.1632519914540; 
 Fri, 24 Sep 2021 14:45:14 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n66sm9842029pfn.142.2021.09.24.14.45.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Sep 2021 14:45:14 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, Justin Chen <justinpopo6@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Doug Berger <opendmb@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Michael Chan <michael.chan@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list),
 linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
 dri-devel@lists.freedesktop.org (open list:DMA BUFFER SHARING FRAMEWORK),
 linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK)
Subject: [PATCH net-next 4/5] net: phy: mdio-bcm-unimac: Add asp v2.0 support
Date: Fri, 24 Sep 2021 14:44:50 -0700
Message-Id: <1632519891-26510-5-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index bfc9be2..14202a1 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -334,6 +334,7 @@ static SIMPLE_DEV_PM_OPS(unimac_mdio_pm_ops,
 			 unimac_mdio_suspend, unimac_mdio_resume);
 
 static const struct of_device_id unimac_mdio_ids[] = {
+	{ .compatible = "brcm,asp-v2.0-mdio", },
 	{ .compatible = "brcm,genet-mdio-v5", },
 	{ .compatible = "brcm,genet-mdio-v4", },
 	{ .compatible = "brcm,genet-mdio-v3", },
-- 
2.7.4

