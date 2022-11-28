Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898F263A6F7
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:18:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A0210E2D4;
	Mon, 28 Nov 2022 11:18:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2E010E203;
 Mon, 28 Nov 2022 11:17:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v1so16200311wrt.11;
 Mon, 28 Nov 2022 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=xi6pBFQ2Iy9JcIpqhAKb8IIPjJ3///r7Dh4vpWsLSDI=;
 b=Afqs52V6ygFs3v3SzJpElSKc8n8lhgdoNoJoZh8moM1X7PpFmU1sIZnqdJWIW0T+8o
 IjrgAsMN/2zOlpN4w1GjijMH/r6PP2NJMtpPq3pRzaCiV7AQ6eLN6pOMsB7pgaZJWTqB
 T+v+2Dhd+g2EcmUwPza5x3GkMfh7hA1ZGCR6UA6U9lVWLI1mYC00Cs+4OteWMpR2Du9p
 kHv0ITGPXKP05U8RAS8REcRtBAzSwu+ikWpAG2rJh1y8XMQVWQ+fTSlsKaydSt/uTwhX
 0RaJth+7+or+j0k+fnceSzvDSREhrEhTCZYY+biGdfsQ2HhH7Pg2fDisgf5qk43wb+uz
 GD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xi6pBFQ2Iy9JcIpqhAKb8IIPjJ3///r7Dh4vpWsLSDI=;
 b=getrS5GdqBak8qUNyOXSzerMQV4Zi31MTdiiCr9Ce1Qhbd1LnZWsvk70/Lp1t8fvZK
 iLkM6tF4Y8/rO5qVMCKnYABmByFOOOskJGjat8mrA+zo86JXJQeJZPdUpvAHUgiLA4gi
 pJijo+EsIv5Yd+IfCf722v0uX7o1yxWi9zMz/dFb3DShsnQPwDrxvgV3NpVVjZT3uVqn
 4+9NDeeOco+u1ojhbbGD15NuNWPtc8hT51JtzNkyR6jPeHiCI/HndIyG3O8JnRJA3hJH
 vTlD+fj5NSzn8h5D6KG0hQnKwEOcwpf4tuelkzr3m4kzARluPQK/V7DxxTobpIkoHGwR
 vDow==
X-Gm-Message-State: ANoB5pkO8hzXELItFF45NNvern1W0W6zCj3ZnbDoRgZro+S7Lk60WFa/
 UMlSy6GPsB/IQVO1UvwBcuk=
X-Google-Smtp-Source: AA0mqf4GXJ9ZPIdgGqed8M0XM3SA8kk373G85PorjEdJ2qU7LCAoGh5UUBa4ygk+8Y0CVY8ueeVo8Q==
X-Received: by 2002:a5d:688c:0:b0:242:1059:2118 with SMTP id
 h12-20020a5d688c000000b0024210592118mr4869395wru.245.1669634275707; 
 Mon, 28 Nov 2022 03:17:55 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 g3-20020adffc83000000b0024207ed4ce0sm7711817wrr.58.2022.11.28.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 03:17:54 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v2 0/5] Support for the NPU in Vim3
Date: Mon, 28 Nov 2022 12:17:33 +0100
Message-Id: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
as in the VIM3 board.

The IP is very closeley based on previous Vivante GPUs, so the etnaviv
kernel driver works basically unchanged.

The userspace part of the driver is being reviewed at:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18986

Regards,

Tomeu

Tomeu Vizoso (5):
  dt-bindings: reset: meson-g12a: Add missing NNA reset
  dt-bindings: power: Add NNA power domain
  soc: amlogic: meson-pwrc: Add NNA power domain for A311D
  arm64: dts: Add DT node for the VIPNano-QI on the A311D
  drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 11 +++++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c        | 31 +++++++++++++++++++
 drivers/soc/amlogic/meson-ee-pwrc.c           | 17 ++++++++++
 include/dt-bindings/power/meson-g12a-power.h  |  1 +
 .../reset/amlogic,meson-g12a-reset.h          |  4 ++-
 6 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.38.1

