Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6988467FF8E
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 15:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB1510E069;
	Sun, 29 Jan 2023 14:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6337210E062
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 14:31:59 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so25257214ejc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 06:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SIsYvjDlZhXseIBbB+cVw5ndep5LtZPlaWmi5dbOsTU=;
 b=MG0zYJDEuwdAIPlKTrUz/tAIjgDecO7da5aOjlPCt7ezTnZ3WgOceJliclMU9Pazqn
 L5dGHo3y0fEB15rgAiisrsMFa+3jXGtLedc0ONf9sBkC0778amcL2vHCDKkUxC4jdhMT
 L0rdAhvn8wVieQsB1oAkRsDJ3Nm+CF1BtUuyHf7VPOdNSRzLqHzgv/SclP4Frd+cOG6i
 X2ENBpIDZWQgCSXsc7QISY2Rh49PaEbED3Zf2tNTKbt5TzReV7RmffSXlgodgbATqjEb
 MHDIrbXq6HkYyWVfAE2XkUFSTeoREPo5WWPDuDI6ENlcV3w93U76jE0ms0yYIo2l/e8u
 a3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SIsYvjDlZhXseIBbB+cVw5ndep5LtZPlaWmi5dbOsTU=;
 b=ANwFngsLrpJmUGWvuTNovvxVT8d9+6svVsl6E/ERUggusVmepYq9kbD28rlB6+TurH
 HQAsFoooMjEZl9h+LTHJFvRQHzVEfUeA3XvNaDThRt+PMq0x9WyFMQWki86enOCUegRg
 UUld/R2dBltSrunJ68cImpYomSEMHjwAYH+Y5DlgHZhi2Y/9FP32byRLmnhQe4LrKgfM
 5NYiU1eWcyIn8OYwulI+VQOTMwgrveY/PnLhVyWlvUAeO4IX8e4XzQpQjrQ4dR9vUWNr
 7Rzw6nS0MYfhRQnyr8tFI9OXvEA+KVTc8QDi+GSzHhGIrRtl+PE081B26KP5J3s/HqOc
 hejg==
X-Gm-Message-State: AO0yUKUjiIqgMEGmN92q36QF76MiJjPna6nw7Zv3PpE3AXIiXrpFbO5Q
 xg2C9YvCPZ8QEBKl323DzRU=
X-Google-Smtp-Source: AK7set9Opdxx1Q5nZgj4I7SG11bJhP2LKEKpWGGYInJD7QBsb0eZzG8RWYkwDjUBL0J/cY+nvl432Q==
X-Received: by 2002:a17:907:6e90:b0:887:915d:7502 with SMTP id
 sh16-20020a1709076e9000b00887915d7502mr2229039ejc.31.1675002717970; 
 Sun, 29 Jan 2023 06:31:57 -0800 (PST)
Received: from localhost.localdomain (83.6.123.74.ipv4.supernova.orange.pl.
 [83.6.123.74]) by smtp.gmail.com with ESMTPSA id
 jr23-20020a170906515700b0086f4b8f9e42sm5410128ejc.65.2023.01.29.06.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 06:31:57 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add display support to Odroid Go
 Super
Date: Sun, 29 Jan 2023 15:31:41 +0100
Message-Id: <20230129143141.173413-4-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230129143141.173413-1-maccraft123mc@gmail.com>
References: <20230129143141.173413-1-maccraft123mc@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note that orientation property in ST7701 driver is currently missing,
And that ST7701 panel driver uses different regulator names compared to
driver for Elida KD35T133 driver.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
index 842efbaf1a6a..1b9769ccfdeb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
@@ -142,7 +142,9 @@ button-sw22 {
 };
 
 &internal_display {
-	status = "disabled";
+	compatible = "elida,kd50t048a", "sitronix,st7701";
+	reset-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
+	VCC-supply = <&vcc_lcd>;
 };
 
 &rk817_charger {
-- 
2.39.1

