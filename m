Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368778A704E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6550610F983;
	Tue, 16 Apr 2024 15:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OOBaeOzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E1E10F193
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:27 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so6696919a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282806; x=1713887606;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aAexrd/46uwMAH6jYKwN+uUc2aBRy9RedyqD/mSslIk=;
 b=OOBaeOzJCk2mKNMTU/UvvJytQj6DTK+Z1Oz08zE/TmQNrCSJxX4tKqGucGEzHxxQeI
 DG1J9JdRzMmvplFYWlUYCfu99WBycG8NnYfhubOZ2ENYc6Ps/qs4QlIr1Hx+6IHCzC60
 dSUYdTS+3QC0mN9IRrzCLy2RNAyG59XUYpdvuWhYOpNB7xZgi2nBs40j8e+slHPbccK1
 7v3fO3k3zBkFA/KUAIdlbdtp92NQslNsU7E2cHew4mchWhq7oqQ2fnhU95SX1cw6mMZw
 ECdeIIvBAaGsw7R/i/qEB52bcxiAuMtuX53r0BSZxds5+q6zeOuXDUawZZo0xc4wWP9Q
 INSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282806; x=1713887606;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAexrd/46uwMAH6jYKwN+uUc2aBRy9RedyqD/mSslIk=;
 b=WkHNXB2WgOb000+50Zmbs8V1xyhA0kTGDAnPYYoxPIgmfsblqFPMe9nSz5nEUCjOjc
 CydDdpesKdhc1gQ46LBsUp/NVUaJAaX31yZWxTHEfm0g/Urv4Sx9MBWeWx83F4/7vc4d
 W66bNFvKg00LUNWXdDRe1m8fFyXzDf3mjTzFUINT1oEhWZVznchXuJjVbZztpl1/rAF2
 KdOZRakRcOSOpK14MV5pls3vV8+uFYCw5o/OnawJ1X3U8IYx38gP5cwTp4Pt80lUJ1kM
 r6hShS00pPF/Nt+Viivw2eXwCblZFsuXm7blyBOG/atkeNtbhiqjPLRYlhAT/8YmgqgS
 ThIg==
X-Gm-Message-State: AOJu0Yyf5AKf7MU5dwgo8zoWh29cTAon7tz5+HyJ/L0Kg/6keQ6CwuH3
 E38YRHpfR0Fd7Qdy3PFcuhoj6GL+TI2+l+xRdzri42aHnkrPJePp8r6k+GYhPZo=
X-Google-Smtp-Source: AGHT+IEX7zZn5a5jXK0yRc4ZNU3IRQE4xFEasuu6yFOPXdGGPigbQkHsv8LLTaPDrzx9MEJkztjv7A==
X-Received: by 2002:a17:906:eb43:b0:a52:6d2b:e8f7 with SMTP id
 mc3-20020a170906eb4300b00a526d2be8f7mr3458529ejb.12.1713282805879; 
 Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:25 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:06 +0200
Subject: [PATCH v2 05/18] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-5-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=v9vBdfSwmyDVuprDi5U3tWTSEMiU4Zfz1GYaXHrP9lk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qDH7y69korfmHarmHqyVoW084RPRM+0dGorYb
 06qx0OqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURZZbEA
 CFurBeZ8JWkQD63WKANfDU4sh9fFHov3vdAImDiE4y/61UBSlQJNDs4OGQopcGv3OhX6HNSpHCMSdt
 6jEbw1fR7SC2uO2Nzs6CeAsPJ2MvqMxdf8d4yuWQN6sSlFmGmeqWHugXb5LA7rZS/4hJEYIELYyT8E
 nXS6YXndtuypD2mCILIoW+tIMnzAx9ingmIu7m4tBuQ4l7wCzluY7C1g1enC/+ixeHXh+1yq+SKync
 Npx576SQ90X9YKgun1RZPSBPvWVrSDKF80VPxLw0S6f/KSMl03mIwULooPbo1bcX1UsmzNCkC//UAc
 vM6Lea5Srbr2hyen079yzpKzVR1a7KfosMKldpe0WUEW8XN6sYt/2rcMQyguwqpNb1jbd4pdWk4Ixi
 ykXFSkbdXziarDQhgWe6MInH869cD7xYasnAvtWyuxryZidSYx68CbbUnF/GGsome2AvewfrGD43Md
 MvyFso9OT4nXlPoJ6C2SUACtRyIuM6SvyWEylq0BRTjgaOO9atDRdoSynMK8vfT1b59Hytjg/C4RWy
 7+pfwqHi1fomk0+KMxL7XOxYEhNWkAfUawM5akvEoIqHX0UCuBSGc01ueRmyqX2n/EKO3sOWHFPiqb
 rA4zwq3KgSyIpiR/rAyZUI1wG1236xykviUnWQ6styY5xP2kLozze+jaYV2g==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 8611319bed2e..a7aa8fcb0dd1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1

