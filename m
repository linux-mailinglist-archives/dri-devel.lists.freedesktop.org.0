Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F32C78CA92
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 19:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EEF10E44D;
	Tue, 29 Aug 2023 17:17:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EA010E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 17:17:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c136ee106so606566666b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693329455; x=1693934255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QBQAx86WvaOm9XdYlFOZiKDZLABoSR2aNslGbzHlpgw=;
 b=YjhSA4kQm+ny80r016Dc472pNmS42pS1nmBOqM6oVPhNBKNJlGfLb1VzG6ozVtCF6x
 Mlyk33197iTKYGWOJtecIgwjpqlPxkQGfI/pRAOpXj485zDfiV/PQZgJDdgUDsifpH6W
 LVPXNmebt4tPML8gXvgpBgcI6wjLHgTdw+3WflobmCdqdL1TbtTLMeahRuWF8LxtlATr
 IKqdPLOqNzQALqccixO4n4ZLiVXScDyHxok1Foj+nS8E2ValnPtuN4jUWiEOK7qKTwIW
 2H4UL/qePX62A4CF+Z9Lw3aAxUzhqpesyFt7Q4G+715YvpCqNSDPku8LQs0jlfjZU5Cx
 fEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693329455; x=1693934255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QBQAx86WvaOm9XdYlFOZiKDZLABoSR2aNslGbzHlpgw=;
 b=c6S/17/fhzgf+ZQc5Losa7ZbzLwzQC8D8tRVMFwjjc4kxg23HvfjIJ0eG5YqyU9hAx
 n3fKZYHPhg+QcgXXOWCnfjXv/VEWpYrHaIONdi7+275hOHFUJp+SC0QuEmwnk153TKaU
 exBdcEYjW2EG9UXtq+SBN5nkTNSZ2j23FLFE7tSEgPG0bpL3M3OSSj1gHbfdM7Mqc+2T
 GgGA9SBoCUxe01gJlik5RxJbX7iuKVcFe4jfE4zPHUcWUvcFwyyc+9L9G2KqUwFGq4HT
 ftxvrId8/g6OXU1o4cLSVYkpfKnqf8JaYYRf87MC/4koZ0j2g0LajmbWdj5uULtiQPGo
 ffiQ==
X-Gm-Message-State: AOJu0YxutHO8QaVA3fKviaAqhr8WTrPG27TVRuCxKgfS3YkKs/v6Exy1
 bYVpGrrg+qSxouBVyDw/JQ==
X-Google-Smtp-Source: AGHT+IGriq1g6SBECfoMzn6NHKe8g9e4THTgJ8Zp6YWeIKJEJrAB+LeVhbZzVDvMc9306PK2d3bxNw==
X-Received: by 2002:a17:906:150:b0:9a1:d7cd:602d with SMTP id
 16-20020a170906015000b009a1d7cd602dmr14195595ejh.45.1693329455250; 
 Tue, 29 Aug 2023 10:17:35 -0700 (PDT)
Received: from U4.lan ([2001:9e8:b958:3410:8e0c:ed68:cd6c:7cb8])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a1709062b1500b00993cc1242d4sm6115834ejg.151.2023.08.29.10.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 10:17:34 -0700 (PDT)
From: Alex Bee <knaerzche@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Subject: [PATCH 11/31] ARM: dts: rockchip: Add missing arm timer interrupt for
 RK3128
Date: Tue, 29 Aug 2023 19:16:27 +0200
Message-ID: <20230829171647.187787-12-knaerzche@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829171647.187787-1-knaerzche@gmail.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 Johan Jonker <jbx6244@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Cortex-A7 timer has 4 interrupts.
Add the mssing one.

Fixes: a0201bff6259 ("ARM: dts: rockchip: add rk3128 soc dtsi")
Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3128.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3128.dtsi b/arch/arm/boot/dts/rockchip/rk3128.dtsi
index 2e345097b9bd..bf55d4575311 100644
--- a/arch/arm/boot/dts/rockchip/rk3128.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3128.dtsi
@@ -64,7 +64,8 @@ timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		arm,cpu-registers-not-fw-configured;
 		clock-frequency = <24000000>;
 	};
-- 
2.42.0

