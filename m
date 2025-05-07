Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3420DAAECEB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76B10E8B2;
	Wed,  7 May 2025 20:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZvdBau0U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82D10E8AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:45 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-72c173211feso67568a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649365; x=1747254165; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjhJjaIvcnDBaUHu5Cl0khV6aJlrP78s/O1dFNpl7CI=;
 b=ZvdBau0UFdvxwzGTBDMowjiwVmwBuqqM5vWiPScsGjX2iPHrvT8AL2gBe8kxX7UdMt
 EctxaXWgtFwkGLzobZTitHzzwd0PElWGuAFZ7dR1aX4k3HvP53pgj33Of2VJ9hqFojmC
 SJllu3aHTAZ7qWVuXwAA4Z4ZnmvU9cD2heXzN82w6KM0fjsNXCdSj9i0xY1L+xe9Jnnp
 /VWndfLm+xl3IYWqOU5F8jIOHyBikTVnN4XZL5r+RDEaF6rMoWcyofqrVl9NIB3N22vh
 +a712okDptrwHW5FRA0NrlZAIW7pzRmtYeasKQQ/2aqbLptYNAvZGAwl4AaJUWICn7mi
 4F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649365; x=1747254165;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjhJjaIvcnDBaUHu5Cl0khV6aJlrP78s/O1dFNpl7CI=;
 b=KgukkIhwGoLx6wGIqYpLMKeXGn6xBLMwDS3p8OK8SMLU2N2MdOB9JcFP3VXJ8H5Ac1
 xA22QtyKjJdcsy2cwo1CWrv4G9iHguYmSxh1j00PAbWUnrTjQ511jd5vsGqK2c7hhyOv
 GiaRnKnM1Uu2Wk0+plr6B2JPGTAO5EEFBlfhfZfE6RY2HpnIct/gclYQbf/10lpZAkB4
 /cPYdpwixFgHjK1zai1mCoEWuk/wuO5Pn0lzMBbJFFAqRyQPvtahuwHxp1VaTOMdkEgh
 kd0TtDWgWq8/zkZ0GPhAN4MHy49ulIubHo9/fwboTAgSjMdQRnhGp0uiJo5rRvvFTSB2
 +krA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPD6Ue/JZL9YMzhR8SEH85428RHJLzo0D2HCx0mAQf2THXj2JYoyfK66lDPt53ODY/9lPoGO7eDos=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybj5tsLMKoBW1nnq7joJpid8NBEzjVt69vO7F/EC2OAcA42W2d
 SX+3s9Def17DosFsOeFkKjQpDe9qoSyYts+Q7Y+CMrdMDBozHYnM
X-Gm-Gg: ASbGnctEswSl44IjlKovORN0CYVxndB9rghpE5LJoixY42/ekVJwoQzqkr4Cqu40r91
 chE5DgMOZ1ykmmQ28Xq/4zJyhWAElA2mwXkrYCTWYTXLN95PKJUvbgtsaH6WzC6sTYZwmOQI9rn
 ljbDqN4WyJZygoDEvZvQCv/7IAmEjxZFp/OfmdhlkEu1lxSPjsiskdp42ypKbNbWH2TqxQeglg/
 nalelj5w1M8GWDeLx+Iix7TkLl8lHesMnfRzTpQDNKwE4pB3WiRFxnAadTSlqlBdEF3YtrVnDbS
 77nM+9bkwX/srXQToTTy836AYfRliz0AP28E7jnqCmZSK+01ehkZmnxP14eM
X-Google-Smtp-Source: AGHT+IG4VEv+ll1E+etIO/RyZfeFwZQSA+7FeaHNtj2wtpn38UfCsWG5LnoVjjBVpMiy/mgpRspIwg==
X-Received: by 2002:a05:6830:3985:b0:727:423c:95d5 with SMTP id
 46e09a7af769-73210a6eba3mr3371615a34.3.1746649364822; 
 Wed, 07 May 2025 13:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 23/24] arm64: dts: allwinner: rg35xx: Add GPIO backlight
 control
Date: Wed,  7 May 2025 15:19:42 -0500
Message-ID: <20250507201943.330111-24-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The LCD backlight for this device can be exposed as a simple GPIO-
controlled device. It would be more accurately modelled using PWM to
enable brightness control, however the PWM driver design for the H616 is
not yet upstreamed.

Add a GPIO backlight node to the DTS.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 7e17ca07892d..95f2ae04bd95 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
+		default-on;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		constant-charge-current-max-microamp = <1024000>;
-- 
2.43.0

