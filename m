Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A222B8D2A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF4F6E524;
	Thu, 19 Nov 2020 08:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381F26E425
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:58:37 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id oq3so2877956ejb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 05:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=ItuNwInc2MBwj4FPc/vi8+RT3PaxeSvrL0xAoc2Um/9NAI/K/r5esaAf8vYLZvfi2N
 Gn5FdFm8AcWSkuEj0mecew0gSpzUcKx2bY5Ys2T/SRcbCzEslZloWfRO9hpVGkfPdAUN
 e4812uni4BzgCCh4xGpbNRXbyq9JcguzIWoNBt+64GLcVPlTtcMixYIZyjl4x64n2LhW
 t5ygd/OxZWeGUFR8o+rwptKuSqP+1/EAkhuhHNw0Jz3yVtNr1I78EelRvf4MTthuMFaU
 Susaq2zd7AYwogwUmtCBT0TwDkRMqBHNpGjG58LoW+PDY4Nf9gt7ECy3xXxAXeb4KMEw
 DRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XzfD+8x/gl2vij+zxF0vgPJlMvOnmt8qPR/mutEO1AU=;
 b=Vhq20zmdko8g8WZhCX9BWpstZO/Cm2C4GnHAjvGJS4NPEZz/3BxjipMgy9w2flF5kD
 k332yOPgBEqhbVMXi56HsAHfQt1u6Z7uhxykWoO1kBJAGMFEu7s/y1NkKcMVaWcSzs3l
 pxZIEZjtoo0xM7C1CP3qD8ioLa4DWclAjmN9psny92xIYOE41E1OHlrxhDv6uGi/klKD
 o4jkYPXLMQHM5LAXm3GfmVmuebD0uAfuiwWM4UmXQIbua4XkZYVmUQT04RVDH5EEKvWG
 11DzhrMI/qFbz4APX+s4ic0XG0MzLYXYqbwWDl2yKY8dPk1gWFxyfUAxXm6g23uvHCju
 tzaA==
X-Gm-Message-State: AOAM532JzsioNtj36rDzm+jNX8+wtm+hGxJXLLeAaWgfQSlJsP1hK3Cg
 2IumuVnpkww4AU/MAU0UVB4=
X-Google-Smtp-Source: ABdhPJy6FxHe0EbiFMLb69ag6/AE/2uHZ1fKsTWtsbK6CS3f8YZgjTZfbNAGLYo8ILiVxlTQhXgfRQ==
X-Received: by 2002:a17:906:6b86:: with SMTP id
 l6mr24155838ejr.524.1605707915976; 
 Wed, 18 Nov 2020 05:58:35 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:35 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 5/7] ARM: dts: rockchip: rk3066a: add #sound-dai-cells to
 hdmi node
Date: Wed, 18 Nov 2020 14:58:20 +0100
Message-Id: <20201118135822.9582-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118135822.9582-1-jbx6244@gmail.com>
References: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'#sound-dai-cells' is required to properly interpret
the list of DAI specified in the 'sound-dai' property,
so add them to the 'hdmi' node for 'rk3066a.dtsi'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3066a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3066a.dtsi b/arch/arm/boot/dts/rk3066a.dtsi
index 252750c97..67fcb0dc9 100644
--- a/arch/arm/boot/dts/rk3066a.dtsi
+++ b/arch/arm/boot/dts/rk3066a.dtsi
@@ -124,6 +124,7 @@
 		pinctrl-0 = <&hdmii2c_xfer>, <&hdmi_hpd>;
 		power-domains = <&power RK3066_PD_VIO>;
 		rockchip,grf = <&grf>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 
 		ports {
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
