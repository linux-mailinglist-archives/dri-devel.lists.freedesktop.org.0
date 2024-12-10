Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FC9EAECB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 11:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8C110E39A;
	Tue, 10 Dec 2024 10:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MEwkVaYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C64410E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 10:57:20 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2161eb95317so34823025ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 02:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733828240; x=1734433040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
 b=MEwkVaYAgdtGn/d0GWyJoTX6AmFMjVq/7UXcuLI89s07zuxc91ASMEDT5C1pGWht68
 aogjl+7r1rftf24uUs8kePrs/04+keNmamExgE7oIrUcWhIUSruBRVmke7RqbQdnGiep
 gsolXauCQElJiFN38CjDsSbKL+/k+hw0SFP8RIstQKoaaYw6dAcCPgfOuTZen+SMLurk
 jcFlET5ArI/cnAfkTxv6MzekO1uZiH8q0atka63+jhgCFU14HDHu54R+zPhxfdrtP0zP
 uKB5XfzO7IiVsePg3ons24DINc7ee4C+CNsmLVexWSZnNf0Ha8OjK6XRC8Fq3QnuwKoV
 J6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733828240; x=1734433040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FAzIOGNvVkOkwBb1FvOdH3YrtXy61Q+UrPzyrwYWppg=;
 b=UBybzPTZWlUY+u8vkjxFhOhkLZMtAb9m+L7vXPrPoxkHCcBy2AvrSV5ZQCvhHovBRR
 oI12kdNktllB97HpCppHL1RRm02v3dmQDcEv253hLryJgAUJ2XAP5esiMF534/bruNb/
 T2YIzJugDXkTnNch4Ayu1GS9zuaV9Q0OuCSNy9cfGH4p2QDflSyhKO6QQ4YoFk4GK0TD
 MTV/GP34oxt1mniGqvU5qZ+u2lbR+8WAHytx0S1aBMkyvnyLl/5I+r8UyU1Cab+k8vGm
 0Hql475hq8ZlQeJlnJjWXSTq3ogFtJ72hPcU/ek1ICpafULc/YknVFb6HphucAeQvSQT
 RzIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhcYXDmLS3VRtXAnnElb3EHfmZkSVp+EVip3OqRAS2el1G8YtDEtfyNqkq3yIF3VeUw8PHjKTMu3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUr07aJOAvFGf4uKmK1upvLCgmdQu5lnYIvaUrg1aOYaARSep1
 lC2uIzb8f+muvlev/hbAoehJk5pNr5lQTcjZEMc0Ehjk3LG4cN2y
X-Gm-Gg: ASbGnctjnm2EdMiPDKrnFBDi2921MfS2ski9mH8L01rmRooHt7L2TmUxcPM/LDr7hgX
 xTE9gt6yGOtWyiyHAf9Lzn3r/5FbBpZV6lqEJ5OqoZS+L4FgxhFM2YevzcU3DXfcns9JbkVfvwP
 NSv1Z6O2bdTinuBB1rL/GlsFFtC0bNYsP9FMfZYhuonntcybw8ACAFFshfgHx+KqWTIh3bs8odq
 dsy8USFxoeX+pnbWKoMz/KC6diLFU1rGTSjNMTgm6eUNnYsMCuOMxFReDSjuIPbA8Fw
X-Google-Smtp-Source: AGHT+IHSsGLpcfdmpEL4Mg999asmKbIgDSP7cOPD03IZvcIVz1bYQgiRC4EJz7gHrP9fENJbgq0a8w==
X-Received: by 2002:a17:902:ce88:b0:215:4a31:47d8 with SMTP id
 d9443c01a7336-21669fa3baamr61082485ad.9.1733828239875; 
 Tue, 10 Dec 2024 02:57:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:23ed:f795:ef82:746f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21615b1e6d6sm71068955ad.104.2024.12.10.02.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 02:57:19 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Date: Tue, 10 Dec 2024 07:57:05 -0300
Message-Id: <20241210105705.116116-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210105705.116116-1-festevam@gmail.com>
References: <20241210105705.116116-1-festevam@gmail.com>
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

From: Fabio Estevam <festevam@denx.de>

The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.

Improve the devicetree description by passing the LVDS compatible
string to fix the following dt-schema warning:

imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Added devicetree@vger.kernel.org on Cc.

 arch/arm64/boot/dts/freescale/imx8mm-phg.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
index 75bbedc6164c..a134b1833649 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phg.dts
@@ -82,7 +82,7 @@ reg_usdhc2_vmmc: regulator-vmmc {
 	};
 
 	panel {
-		compatible = "panel-lvds";
+		compatible = "auo,g084sn05", "panel-lvds";
 		width-mm = <170>;
 		height-mm = <28>;
 		data-mapping = "jeida-18";
-- 
2.34.1

