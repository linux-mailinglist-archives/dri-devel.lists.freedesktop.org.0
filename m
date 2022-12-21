Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8212665363A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 19:25:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B23E10E473;
	Wed, 21 Dec 2022 18:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C9510E473
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 18:24:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fc4so38715610ejc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Mj8JvHtlFXNgsizQJkT37AcYJIDfVlJOqhJ0wEsXlLA=;
 b=iJb3ola/qEjyOWpzkP8dM1EAuZT5yhuF3+T4qFfi646wXhG86WZsUz4jbRQp5aZ+0n
 nI4u+qMUvzQQeEbm0ptRpBvIMqu90KSqeVxsyNzG/hRZEOJ23kyiRroVkLSnG2STD6zr
 ivNck3b/aka/OOV+1aN3ljYfbmtVKu3P8olwsncCoTbnrwqevO5w4nCI0uI/FICcv592
 Byq2V8pwSTgBBUJBkjjTPRb2sQ6LXnE1U8y5Bj8v9+WcHWJuyDyizfVFEQ7rpILsx06o
 wc0L0RIGphT+VSR0wR5RyO88tPhwdwDqnFhhuwNwtPiJ2XzU24oRWB37v3o00DfjWBZu
 QnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mj8JvHtlFXNgsizQJkT37AcYJIDfVlJOqhJ0wEsXlLA=;
 b=g74IS3yc+jdDiIZjr3IaOIu9NaotLfWwCRDMabTRBKEsjVUd0+1hvuJ6aIHXuJ7wIz
 It0Xaoy8oO8hYgHPNCggawBsZXszo4enDbkTGXVHUgll294tJDE16SQFYB3gmMgsE2WK
 fnpVS7A4RgfTqy/7HyHd8DMEnyk6BAcD40GD4FjjKsBXpWRsiJewtmMm6yv1JLycgrb8
 dVgbI6syqHTfzrGfqMi68+A2qQBu+h5xL39shA4dxxPh/8Nv21chZ+uvI1WTOpFLCYsM
 AyIDcpP8Q887MiUUtOu5/vI5qofr0mktiEFZ6UeQDvgri1gY5szrEiGy9OxBn80aUJXp
 UMXw==
X-Gm-Message-State: AFqh2krXEdF/EWjdxIJwkEro/U/fqWCrQBwOFGmQxlg1NQm5VctMG5Wm
 jeA1nNAvipg2Hx6h6f5B0Fw=
X-Google-Smtp-Source: AMrXdXtM88dtxlfmxBgWts0v5ArGwbTEWnL/kV0EPA93J2FfNjRKV/Xs4K2kE/BXvkonB0Tr8/i+2A==
X-Received: by 2002:a17:906:700f:b0:7c0:d1cb:2165 with SMTP id
 n15-20020a170906700f00b007c0d1cb2165mr2028252ejj.56.1671647092517; 
 Wed, 21 Dec 2022 10:24:52 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a170906769a00b0073d71792c8dsm7435482ejm.180.2022.12.21.10.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 10:24:52 -0800 (PST)
Message-ID: <4f0a828a-a933-24fa-c97e-ca29eac9c881@gmail.com>
Date: Wed, 21 Dec 2022 19:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 07/12] ARM: dts: rockchip: rk3288: fix lvds node
To: heiko@sntech.de
References: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Language: en-US
In-Reply-To: <7f883643-c796-029f-ba38-73532325632d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-usb@vger.kernel.org, hjc@rock-chips.com, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 andrzej.hajda@intel.com, robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 devicetree@vger.kernel.org, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V5:
  rename title
---
 arch/arm/boot/dts/rk3288.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index c22f90e53..cedaa633d 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -1174,6 +1174,10 @@
 					remote-endpoint = <&vopl_out_lvds>;
 				};
 			};
+
+			lvds_out: port@1 {
+				reg = <1>;
+			};
 		};
 	};

--
2.20.1

