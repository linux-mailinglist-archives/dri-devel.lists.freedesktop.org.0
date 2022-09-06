Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF15AEEDA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 17:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200F410E6DE;
	Tue,  6 Sep 2022 15:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB34E10E6D9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 15:30:40 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id bz13so12614236wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
 b=G1z6RtYS4iEJ22psOaMaQE8+oWOg2j5Y9DvwtqNGc2mxRnXdrnKjzbDDwsi1XOqs3u
 xCA7f0i1vFUdiwAvNJBs7vOW3OzYBYcLQ3zdvjSq+fCAzXd6xHLCWep5vEPfapdH6yoR
 dZRiKmgypproeCw3VicU1D9DM3CP7n6xjPU2X05/OM6wgAnkJaiO3wib1Lx5gKI6YJ2P
 Q/xn34rJW5DgahH0BbGkfPfjGhGhhS4mpDPBnjBRwXq0RIckXs9eiHxxbusCVKMteVlv
 OO2qhBR1hXqVWzp9LYAtzMJrco4RupWBfPsHprVLdUpq6zB5idOiwd6QsB3i4OliAcJZ
 Nd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TzfY9hsKE+/NMaAr86KQtgckRDntIH8+oY7tsTfeowI=;
 b=wTvxvQfvbC009AQZoe34LCRVhhSeJLGX95EfLiqtvPm9x1hmlCNUIb42sjAx4rNEEF
 4XoEH9RSpn8UFRIShkhkYP/Lyodkf6OZBuHYVX970zSJhOlxZ4N3MEH/dgushMsfhQsb
 lnvd0WqUUCUiM/I0Oz/5O3zkIjP6zNAY0kJLOBKz9xG2wRBxSsisNiZTSdOFEup8cWwj
 Gz14nfUZKhAqOY6LYNnmqPP8gOWIXCQLHhXVs2dUwA+qdgiG7b0stfx6AUDUEvhTlLpR
 uXw41F7Ru83NGWWvvyHcVBcF6oe7uVmwG1EHDxc20gU9ibDXDLuoV9MFA/BGrtc+F0je
 g2Rg==
X-Gm-Message-State: ACgBeo3BhZWliui/MQrKxyGqKU2FAS4ndfpprA9UdAQqFTD3zN/xVvjc
 ZdngA/JMMDQT2a/4CTshOpw=
X-Google-Smtp-Source: AA6agR4fDTUAPj150MWqbk6q/AO0tVAXOO+fiKS6HJfjSQzIqcMzESayHrNPSB2h99kexJGm0WHKrA==
X-Received: by 2002:adf:e706:0:b0:228:61dc:3dfa with SMTP id
 c6-20020adfe706000000b0022861dc3dfamr8410720wrm.265.1662478238552; 
 Tue, 06 Sep 2022 08:30:38 -0700 (PDT)
Received: from Clement-Blade14.outsight.local
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id
 24-20020a05600c22d800b003a6125562e1sm14922731wmg.46.2022.09.06.08.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 08:30:37 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v4 1/5] arm64: defconfig: Enable devfreq cooling device
Date: Tue,  6 Sep 2022 17:30:30 +0200
Message-Id: <20220906153034.153321-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906153034.153321-1-peron.clem@gmail.com>
References: <20220906153034.153321-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Devfreq cooling device framework is used in Panfrost
to throttle GPU in order to regulate its temperature.

Enable this driver for ARM64 SoC.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 91e58cf59c99..e557ccac8d9c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -582,6 +582,7 @@ CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
+CONFIG_DEVFREQ_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_IMX_SC_THERMAL=m
 CONFIG_IMX8MM_THERMAL=m
-- 
2.34.1

