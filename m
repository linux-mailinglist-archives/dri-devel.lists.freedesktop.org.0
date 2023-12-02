Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32D801CCB
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 13:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1B110E1E1;
	Sat,  2 Dec 2023 12:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A5210E19A
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 12:52:06 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c67b0da54so1748647a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Dec 2023 04:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701521524; x=1702126324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvqh3YsIrEQFTmWeg+MPEc2rGBC/JrpRd/TYuGzYb50=;
 b=E989+fiSM8vPlzamHZdzCpdjCmdKcG+j8SXRwaIyYEiwBhnFh5adgYz0gSBVBTAxP8
 2mdD1g3vTZq0uqV2n0MHVpCuvGjytz1tftif3ujGBgYfKagq+neup3jzLQ8GkUwSPYOm
 UB6CS7xVT2INy/7JWFBrJxK4gfjfQuFSnIvZCXXtsk+5b0+DvF49b5YLzsa8wkpJ/hcs
 CPg/kXZ7KVsiYW4WHDZrQcxt6jpLGCfzk8th9vXrVNTdxgt7GhewjNqOML5EFKPG5GB0
 6orhlwUwv5HP+gU3x85c1VEPyZnNdiemiY0PrhoOCmmg8017WLPRBZmQigdi75amNG2S
 QFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701521524; x=1702126324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvqh3YsIrEQFTmWeg+MPEc2rGBC/JrpRd/TYuGzYb50=;
 b=buVp52jxyj7cQaVH2bvQisG75QxBQZPJsYqHnDcALedlqv85gRb/aOWBIkryEwzkGT
 sjZSo1YVeO7ZKzfsgkUzp8VYOfM4HLVuEJc+6v78Jfvi+pKPyUmxcodMh1ojPEskaiZ3
 5Qu2i9ZqyANSykWt+vGb80Ls6PJJcIWPdkElZIcyleztvFSn/EYQVzTCgh9EmLS1rU3R
 qz9etIRp8YGuwaQdiycgPGh8UA+F8aEXeDPa8fvljF1AHj3f8ThFdRoSGEU7tJ06EeT/
 zM3GevP9U2SvfJqM0Jq4PLU3eDDGnEiPbVjHhEaFNnHa69jx/FaXXpU0i1p1EXMsN3VM
 S7Mg==
X-Gm-Message-State: AOJu0YxdpwHSMbgUBQfQjpbAHHKtpozBNYaMbzQZdFsfXs174Z6iofah
 J1nfxRtGJJD87VWkGzCFYQ==
X-Google-Smtp-Source: AGHT+IFQ04hd02/k8ts4CI8E4zUUh78rM2JYghUB6DkvNvfM35AgawiZ8im+gUYqpmxxzX2y97BApA==
X-Received: by 2002:a17:907:bb86:b0:a18:f82c:65d2 with SMTP id
 xo6-20020a170907bb8600b00a18f82c65d2mr1932769ejc.34.1701521524226; 
 Sat, 02 Dec 2023 04:52:04 -0800 (PST)
Received: from U4.lan ([2a02:810b:f40:4300:908e:b829:354b:f8ee])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a170906198500b009c5c5c2c5a4sm3018161ejd.219.2023.12.02.04.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 04:52:03 -0800 (PST)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 5/5] ARM: dts: rockchip: Enable GPU for XPI-3128
Date: Sat,  2 Dec 2023 13:51:44 +0100
Message-ID: <20231202125144.66052-6-knaerzche@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231202125144.66052-1-knaerzche@gmail.com>
References: <20231202125144.66052-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Alex Bee <knaerzche@gmail.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the supply and enable gpu node for XPI-3128 board.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
index 61b9f069c8a2..0a8ead0bfe09 100644
--- a/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
+++ b/arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts
@@ -315,6 +315,11 @@ &gpio3 {
 			  "", "", "", "";
 };
 
+&gpu {
+	mali-supply = <&vdd_log>;
+	status = "okay";
+};
+
 &pinctrl {
 	dp83848c {
 		dp83848c_rst: dp83848c-rst {
-- 
2.43.0

