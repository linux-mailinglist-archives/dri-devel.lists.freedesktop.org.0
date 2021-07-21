Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C23D09E0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE926E8A7;
	Wed, 21 Jul 2021 07:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB706E8A7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 07:41:44 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 70so1103201pgh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 00:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+x+f7PVXVcjHLEa5oy45MfmPR9ugBPOg1ZaiimxyB3U=;
 b=jKVLhLjvLVl7Wec2cQKnTeigp+0iVu7nuEaJ3MBEjV0ohly6Ehi639hu0Qzu7aIPX8
 W79uGjJptJZvaf0LJitfBFQ4RnohYxegnaJF/NzoG9Y/1UNyv9/5Xrt1CZ27UsnQgZUN
 mSHLOtDCUqR4gofeY6zRttrvLlhbyMrDd03QrDmOE//F3MAjiHmMxBkmwnUHdM3ieHXi
 31szerUxwpEAPWRlIWcbcWBwJygCfuuJmiKvDO7yXbaLdqIPqOr2XTdwpZNivaMyoBvV
 IVuSS3Sfa0UEyTycIjqQOimgcjHbbC9jJp5LJrN775RLr9u3CCSXCneF+lAJM14miNHp
 DGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+x+f7PVXVcjHLEa5oy45MfmPR9ugBPOg1ZaiimxyB3U=;
 b=hqInPfUiCbucU/0CbUGTAU0FRm5UNPOyql9+3849lf4yVY1Ed2uN7VAADaT7WqC3/F
 yZkyOWZ62ZqEKlT/SHfaS9eAZngJugqiKbZ51xxiiaYgFWGdd8JMN9UIHWhC5H1+neNt
 wPzS2IlgVa7IZ5tRtGEs0nV0MWEtwDE1nQ4FJrqONOq5C3A4GUYQluJ/qEQY2+KSkl0V
 /mfKRG+VKNkeCvlE5jkTGXUBWy3ZXdve2uqk+P5nSjyiHuQXsY1ylQgvp2IBFniyf7e8
 WH/xGVfHToFNKbpkz06xmfbLbCEyhArev8VXcwEwbv9+/Eo14tECvQVMGj+AzTNAdabQ
 KQBA==
X-Gm-Message-State: AOAM531688FaOmM2QAj3DH5Lp6WQdWVWuJNWGIzF+Dn3FspXihUYXAw+
 CVqtTdTO6NaJvr9BYuVB43M=
X-Google-Smtp-Source: ABdhPJwm/gorGk3PKzcSSUiK20jrDXjD35yudvyAPAcVMS7CyY9Wf44Ly7TLgQ6i2zj1IskD7/4ubA==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr34409484pgb.127.1626853303934; 
 Wed, 21 Jul 2021 00:41:43 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i8sm4841867pjh.36.2021.07.21.00.41.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Jul 2021 00:41:42 -0700 (PDT)
From: dillon.minfei@gmail.com
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, linus.walleij@linaro.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com
Subject: [PATCH v2 2/3] ARM: dts: stm32: fix dtbs_check warning on ili9341 dts
 binding
Date: Wed, 21 Jul 2021 15:41:27 +0800
Message-Id: <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
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

so, append "ilitek,ili9341" to avoid below dtbs_check warning.

arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
['st,sf-tc240t-9370-t'] is too short

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
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

