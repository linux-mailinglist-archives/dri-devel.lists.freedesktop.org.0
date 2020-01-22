Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B0146351
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB866FB2C;
	Thu, 23 Jan 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0576F8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:34:00 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 20so260668wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hl6268zUhL6vsoc755Rban85Ann3f6TE2I9ILOnslGg=;
 b=oucbbEHTYhjCotp2sb6ssDzQbFbvgrjA80hhWxIL7YS25Dr6LHB0jv2c3iYM073u6a
 rLmIgfT7bKkqtZpwOYM5DDT4Xqh5QYIQkkbpM4n98QjKCuDwH8zeL+VBsGJvyxI4KelX
 ZAU48wLgvuWmcPtEjQ217FAV1SIwk6NXCLY962Hz6gVBFEvStGGFwR3iAiBvp12Va12S
 4p5ByEIHGf4H8++XP3QL9c0nEJhP0rt2/tzjzkUx5cGOvPuq9pVlMPjI6Xr3E6cjFzaW
 cMrq1D4lNTGLuZRD4sB3yb+3QoWa77lwWi6GPcOWeh/TSFKynEZgCtnYxEfNo3jv4MhB
 iLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hl6268zUhL6vsoc755Rban85Ann3f6TE2I9ILOnslGg=;
 b=CN9O7NUjQ24ipaT+NikqOdy0IMgPPxIiJRjQZJhu11drhzN6YseFJah4xAvlenpTqL
 dcw91Da0qX9DKOpyepdPiDzqScM/C0hBv4C4fs3ma6VQgQcozOjur5lfWXFlAsKWmd9j
 spMRTnTW+pmUAwfGTm5LWVRQ19Ovy87bkmg2yRu5iQkHyPzjcXPITL84IjVmFMHTfWF+
 fuxlqv1EplsD9mF9D1OQyPjiihn/vgNcSAxjbyajKEBOIm33p+Lxo9tsGeMPcRnfOfTe
 CjTOSkIJmNS/XZniKiv0e+y+Bz/QmvWrdQtC3iiENNwJnkn34ZSpV7wlaIvADr2m88al
 iuyg==
X-Gm-Message-State: APjAAAU28EZLnxEdXSTvBTYuZqOtzDpyO7Qag50XBvih7cRAzu5kOcaD
 8l3xB5amcSiX8c+OAX6XQVI=
X-Google-Smtp-Source: APXvYqxYDmvDyU69o4TjdtM3UV/rvMxrU5zBZcwAOW20EVKAyf2Sy4b1T2lknJ/zStkHla1AsR9EPw==
X-Received: by 2002:a7b:c190:: with SMTP id y16mr191530wmi.107.1579728838954; 
 Wed, 22 Jan 2020 13:33:58 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 13:33:58 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V4 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date: Wed, 22 Jan 2020 16:33:12 -0500
Message-Id: <20200122213313.35820-3-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200122213313.35820-1-kdasu.kdev@gmail.com>
References: <20200122213313.35820-1-kdasu.kdev@gmail.com>
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Burton <paulburton@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 James Hogan <jhogan@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nand controller v5.0 and v6.0 have nand edu blocks that enable
dma nand flash transfers. This allows for faster read and write
access.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Acked-by: Paul Burton <paulburton@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
 			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg-names = "nand";
-			reg = <0x41b800 0x400>;
+			reg-names = "nand", "flash-edu";
+			reg = <0x41b800 0x400>, <0x41bc00 0x24>;
 			interrupt-parent = <&hif_l2_intc>;
 			interrupts = <24>;
 			status = "disabled";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
