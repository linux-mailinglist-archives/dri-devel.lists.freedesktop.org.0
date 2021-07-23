Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667973D3375
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 06:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5746FA37;
	Fri, 23 Jul 2021 04:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48E86FA38
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:06:57 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so2096803pjh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IILYi2BBED19uarLK77YF9MGNtXI5Hu+8bpBHATAL0I=;
 b=kXr7wvE1n7/TKCY9W0ROVKU8LnS+Q14q61PeYSiAkwkZvmRJeFrRuyI2AkNv+A9Nqy
 8xm5Eo/qWe1mk49oAvJk8NggYhPEfliRN4N65Bnt2b+ZV8Lqdq7cpXk5i9XQpZ0blmQ7
 9V/UJ7vBzQLiubZ17ZPkF4g7JiEpx02olOoW0uXusgWr0r6Otguvq+f8gTh4QafrBabD
 r2TnHHeQBg9ztK6H5LRCUiOTUg8vvFCVpViM68F1o2S6PkfaUov/DMAVNKAaSwocFksU
 Uhp4MfE+Kf9OE3GAzr5+vfDSLuoi5aCG4iq2sdQpXg8Y0Tu1MHvLPIWBg3HFTOYdRvs3
 DEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IILYi2BBED19uarLK77YF9MGNtXI5Hu+8bpBHATAL0I=;
 b=NX5RKZ14qyKjZ4K0VgK6aIK/GHnGp5ClCZujSG1ExVDGDpiAjO/J2gDTE2W3JDUH+j
 mo2Q2QoNonC0TDCkqyoqcNhItDzoyWhz/Z300uV91s2VE/C9K8f1CdgUetVAHyt+c84A
 Rhc19AAruvHWaeeCTPKFot1b9Z2yoqZ0IkwTdpB6+kfSmxvbpXXes8TqH8gxW48OnMor
 btQzcmDVjVZ1AoIuXOPbZ2Q1aJiMKn5C79a3nqnE0IAzz5/lhKlK4EjkUTYkvbouxMPg
 YSVYvK52hUyZ0xdG/+ToPV5KFH+HrgbmEVJoRiVhnMVymeMYh98+L+IcdAm8rSYVolsD
 Zt7A==
X-Gm-Message-State: AOAM533QFRfVMILnzzOQf7AyIl9i/JMDagg1Rc5IVm8GmCGJ9nGU0GdD
 viu+QU5f4y67NGaMwJpA5yI=
X-Google-Smtp-Source: ABdhPJzfAN4Dm2094Oc4AXpBDrI+S93x0ZGuxtrf0rg65AiTzxOdCaPAA6zHF0nhMV4hySjMhRpNjQ==
X-Received: by 2002:aa7:9115:0:b029:359:69db:bc89 with SMTP id
 21-20020aa791150000b029035969dbbc89mr2809512pfh.32.1627013217619; 
 Thu, 22 Jul 2021 21:06:57 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:57 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Subject: [PATCH v3 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341 dts
 binding
Date: Fri, 23 Jul 2021 12:06:42 +0800
Message-Id: <1627013203-23099-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
References: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

Since the compatible string defined from ilitek,ili9341.yaml is
"st,sf-tc240t-9370-t", "ilitek,ili9341"

so, append "ilitek,ili9341" to avoid the below dtbs_check warning.

arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
['st,sf-tc240t-9370-t'] is too short

Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with ili9341, gyro l3gd20 on stm32429-disco board")
Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
v3:
- add Fixes tags.

 arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index 075ac57d0bf4..6435e099c632 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -192,7 +192,7 @@
 
 	display: display@1{
 		/* Connect panel-ilitek-9341 to ltdc */
-		compatible = "st,sf-tc240t-9370-t";
+		compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
 		reg = <1>;
 		spi-3wire;
 		spi-max-frequency = <10000000>;
-- 
2.7.4

