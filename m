Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC93D448C
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 05:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE296F5F5;
	Sat, 24 Jul 2021 03:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991B26F5F5
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 03:44:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so6435573pjd.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 20:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SJz83ejABGMbQ2Eo9CZm9YSYODNjLXFLcuNMYaINnuE=;
 b=iFe8DxMo9KoTmBPe+SHB9albjxjUiD/wzCtv1hzbQsxPtYkKy0gdZxiIix2NyHralt
 8OU76Er2NVYEyqpt9OiH6K14mFhyEsGB3s6MvcJIXTRUb97VfkALnk9fCP4XmAdkvXTy
 1Y0KR3GX69z+5uxVGUAG3B9yCf8RshUCKUrK0qL3BMx+uhTGP8mQgdcFbsL8HfgJYi+m
 B/TudAFAcUFaaWIagLjFSduRriA8RVL2Q5n5FEw12SSNArEfms+WTSnBJkK+Um2kxAi1
 lA25N9NG0tZXH8BG9KGxp9UoeDguUoAhNpJwCLH8Nwx9j9T0akVEv5mqt9gxzoaDGpOw
 RmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SJz83ejABGMbQ2Eo9CZm9YSYODNjLXFLcuNMYaINnuE=;
 b=hwn17TQNSiDBO+CqZfqGPU0gl1wW7hmmiHFj2P8lqzQK/HB08hGsPFxJhq8u6IuZTg
 OjaCM6GAqhbOPhqfXf9EFjv93yTVef/YXEB/Rw+Fp63rqnEQs8FES7pqwwUksms98zMe
 Cmob79QfE1DNj+2pHQoKT62JuY6ImezkyD3U5AHHGXiQg2tt0gLKATP4sZi6JcAmK1MT
 SlEBa/IreJ2KqSxKZGUyfG5LKW/Kq9zGvKPzK3MpWkQxCUSUZNRIhCXmIBAE3A+Nn1pG
 rwc7MtArt7cuASPCx8LE16ZvsJg2Yi7YjzOf9bYhTrcS5zVLmPema+rgG67WiXsNQ3Qp
 eRbg==
X-Gm-Message-State: AOAM533Srv3wCqXIEWrAFLKZGM651uGFQv9ep1K2zhYIMDTifZ3nLG09
 q6kNvisWP/RhrYhbGSBlvWE=
X-Google-Smtp-Source: ABdhPJxCVwwsBuIPEgilZ54pQuKM4Kct1PiMGYn4+2ejYooVZncuhDWJo8bl5S5Id+St+Ycz5XBTpQ==
X-Received: by 2002:a17:90a:f02:: with SMTP id 2mr7326015pjy.75.1627098264318; 
 Fri, 23 Jul 2021 20:44:24 -0700 (PDT)
Received: from localhost.localdomain ([23.228.102.68])
 by smtp.gmail.com with ESMTPSA id c17sm35118733pfv.68.2021.07.23.20.44.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jul 2021 20:44:23 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, noralf@tronnes.org
Subject: [PATCH v4 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341 dts
 binding
Date: Sat, 24 Jul 2021 11:44:02 +0800
Message-Id: <1627098243-2742-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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
v4: no change.

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
1.9.1

