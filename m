Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4B6F2450
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 12:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CFC10E100;
	Sat, 29 Apr 2023 10:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E4E10E0DD
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 10:46:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5066ce4f725so961431a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682765161; x=1685357161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MF33tdMj9iVHCsjXUVoEa1ZEru2AhDHukTYWsA8encE=;
 b=GzY0hb9ZJ7kqcVA7IpKup7QloI+q7itlRzF8oDh4ZKLP+PVssTD1iBnizxj1qDsVZw
 DYy5JYtT3a4Kv/CEpAS1SwZKwtkgJfg1apgqRHbSqfUe9q2Rq4O8tGi8UZElslfhHPRp
 DFhGGo/MCEno4f8wRkQSyG5+sNBMBlpwkxk/AwE+oFJNm9NqrDO+aiJpCdkL15Rh9sI/
 MC9fzIb9h3xrA1GkQ682kgP8TVt0kIQCBZwS9NXsfRsaZa4pKPbyJEwyAGUYOwrphM9C
 mT0LEdpUXC9wLuN8A3VZG3tRFQ+xOZYfpHvdEFjjApyfZhe/vR1ZTFdLXZhQqlDU/MFb
 Agew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682765161; x=1685357161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MF33tdMj9iVHCsjXUVoEa1ZEru2AhDHukTYWsA8encE=;
 b=XmdCKKXoUdZ3/g51Uo8pa7Fu56HoC+4iGCG1xTMl8A98B/AOTjWQQzMdyFnKkK8Cau
 0GjmOKR2phmjldMNWRCWWYTk660rIbF5CK/mA7mUell1MjS3/w5GKYN/90Dk9QwLEVck
 jajgl7czKL2Qdix3gdGDJOsgOGb8RlK0P05+gP/rhRq4ap0fxNuiJmk93RFTmhg3QtJW
 a9tZ23UTMEm8vXcM85N3HvFtpx8oT8mrNltHUenP9HXEHLvzj2KRPwAXF+bNwORWwNpI
 H68ACDRuXQByV5U2Sm0+wvAqARHz2uwy/RLBfh0DZX+eR5kGi58AzRdv+9GDUKmAJrvj
 PDUQ==
X-Gm-Message-State: AC+VfDzhvYFb/WtnSi+cpRn+PK6Ri3rYbmOhMegLuOHg8ddiwfQ/QdrS
 Ub31VzJzJSBWuBuaSIujK2Wol59t/fZnLg==
X-Google-Smtp-Source: ACHHUZ4htWkiNf32PrNqaTd4pbSLyAPiCrak2mmu7yE7zpf3xoPvebX7GQiQEr92CjDQD1rqMPYpfQ==
X-Received: by 2002:aa7:d641:0:b0:505:48c:3266 with SMTP id
 v1-20020aa7d641000000b00505048c3266mr1040474edr.20.1682765160956; 
 Sat, 29 Apr 2023 03:46:00 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm9952522edv.86.2023.04.29.03.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 03:46:00 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/4] arm64: dts: adapt to LP855X bindings changes
Date: Sat, 29 Apr 2023 12:45:34 +0200
Message-Id: <20230429104534.28943-5-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230429104534.28943-1-aweber.kernel@gmail.com>
References: <20230429104534.28943-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change underscores in ROM node names to dashes, and remove deprecated
pwm-period property.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 38f4ff229bef..a6a58e51822d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -58,19 +58,17 @@ backlight: backlight@2c {
 			dev-ctrl = /bits/ 8 <0x80>;
 			init-brt = /bits/ 8 <0xff>;
 
-			pwm-period = <29334>;
-
 			pwms = <&pwm 0 29334>;
 			pwm-names = "lp8557";
 
 			/* boost frequency 1 MHz */
-			rom_13h {
+			rom-13h {
 				rom-addr = /bits/ 8 <0x13>;
 				rom-val = /bits/ 8 <0x01>;
 			};
 
 			/* 3 LED string */
-			rom_14h {
+			rom-14h {
 				rom-addr = /bits/ 8 <0x14>;
 				rom-val = /bits/ 8 <0x87>;
 			};
-- 
2.40.1

