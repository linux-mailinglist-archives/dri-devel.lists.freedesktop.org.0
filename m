Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF314731134
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 09:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA9A10E48D;
	Thu, 15 Jun 2023 07:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A210E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 19:09:01 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f7fcdc7f7fso118075e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 12:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686769739; x=1689361739;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RavBw/beXNuiIwbQf5+ADzUkWI8HXmt0ibMWsiTo/kg=;
 b=TVPeiuttZZZiOfNszeMva/RqEkNV9mLkPCjfWkzGE55N43P6Kqkhi8UfLFK2YfNhSh
 Zxg7vQKs0QyzrlWsmPOeBqt2A9qnO+x39f4MymaczaiKYztI+DO2OISf6CyOuBw6hFlK
 Gszp/ppT6jRseFLlYmGh9Lp9EuqqAL4z/3y4jhf2Zr07j05Hwq7S+Qe48IgYlH8yR7VM
 ZWrSdgHY1FkeA40c/YuO+TLcFlrj3xnAAIbcSIz1MC6L/BmI7x2k23tATKgw/aC6qVcK
 tmePyDCJihbOMIO2is40QTj4iO0rhIHsG+myXhyGnT6FZAJov1Gc7/EUXMU0awqqBgZL
 K/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686769739; x=1689361739;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RavBw/beXNuiIwbQf5+ADzUkWI8HXmt0ibMWsiTo/kg=;
 b=IjO5QcKyQtyHwmXRJVJ3UapAq60alWKA0LjsSg+rPeukubEavNURsglg1rsq6OAIHB
 JLpGzEnzCmxbPVg/tDzxN2BKwCdjzIZbfjSybEP4USv2L2joeOBdMfCGXdhKs9c4ByFu
 aKvX17TG/i1lSG/cf8ha2qtAyOlOKc57FFGo/bs2KjKAC6Y5oDN7Wjf27IyYUKXkzw0S
 SSY5Ap7TVTkwZcf3shpCfy1dir/pp479/adjc7LSe1EtocXf0vrvGq7sLTBEL/V1v7W0
 uBPOZ1X5pRAp+SYlhkw6dSgsq76UHrg/CsXva6tXLHTF3hC/P7EM+m/n/Djr9lyBBzDQ
 Fqkw==
X-Gm-Message-State: AC+VfDxnd4ITsT4vEYNeNK7H66hJ7zvBS7BIzF/Q49lgqeWAbTVPkEUK
 29CSqknnKyZlr0YXrdtsLk4=
X-Google-Smtp-Source: ACHHUZ4Gf34RQgRIjH2O/wFqMFU3nYMzpDUcaKJHfSZgyW6i9coP7PRFYh1VcfEHkOeoJxEh9vw36A==
X-Received: by 2002:a5d:5507:0:b0:30e:56b3:60fe with SMTP id
 b7-20020a5d5507000000b0030e56b360femr2092719wrv.4.1686769739485; 
 Wed, 14 Jun 2023 12:08:59 -0700 (PDT)
Received: from [127.0.1.1]
 (2001-4dd6-393b-ff-f59e-4402-63f8-7ff5.ipv6dyn.netcologne.de.
 [2001:4dd6:393b:ff:f59e:4402:63f8:7ff5])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a5d5306000000b003110ab70a4fsm2341094wrv.83.2023.06.14.12.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 12:08:58 -0700 (PDT)
From: Maximilian Weigand <mweigand2017@gmail.com>
Subject: [PATCH 0/3] backlight: lm3630a: add functionality to change boost
 converter frequency
Date: Wed, 14 Jun 2023 21:08:51 +0200
Message-Id: <20230602-lm3630a_boost_frequency-v1-0-076472036d1a@mweigand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMQimQC/x2N0QrCMAwAf2Xk2UJtWWX+ishIa+YCrtVkE2Xs3
 +18PI7jVlASJoVzs4LQm5VLrnA8NJBGzHcyfKsMzjpvg3XmMfngLfaxFJ37Qei1UE5fE5G60AZ
 Kp7aDWkdUMlEwp3HvJ9SZZBdPoYE//+Xlum0/AtvEh4IAAAA=
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686769738; l=2088;
 i=mweigand@mweigand.net; s=20230601; h=from:subject:message-id;
 bh=EEQE3qlxnzvPdxyG2oGt17X4etiM2QkOKRdSulvTDt8=;
 b=QDW3TR3W/883zra37WNEzh+EauPKNzzRyQ0jUD+mJkih625wuoYVOam6dW69idKvEE8TnOpGi
 voO1JiSbRG6CGLieSDFKFKTLpGGwPABCsKlTwIlwrEUtY7qvyzobyJx
X-Developer-Key: i=mweigand@mweigand.net; a=ed25519;
 pk=Tjuj6PXmCCxzGTRw+9suZuZ41q/etgDHrIbPdkAaTpM=
X-Mailman-Approved-At: Thu, 15 Jun 2023 07:46:51 +0000
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Maximilian Weigand <mweigand@mweigand.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For certain brightness settings the Pine64 PineNote exhibits quite
visible flickering of the led backlights, leading to an unpleasant user
experience. It is understood that flickering is caused by certain power
line ripples interacting with the led driver, inherent to the
specific hardware. The lm3630a led driver is able to change the boost
converter switching frequency. Among other things, changing the boost
frequency can also greatly improve visible flickering issues.

This patchset enables dts control of two frequency modifications that the
hardware is capable of: Switch from a base frequency of 500 kHz to 1
MHz, and activate a frequency shift to 560 kHz or 1.12 MHz,
respectively.

As flickering characteristics are mainly hardware dependent, this should
warrant the inclusion of two dts entries for the lm3630a led driver to
control the boost frequency of the chip on a per-device basis.

Changes were tested on a Pine64 PineNote. The following brightness
settings were found to exhibit serious flickering without either the
frequency shift or the higher boost frequency:

echo 186 > /sys/class/backlight/backlight_warm/brightness
echo 255 > /sys/class/backlight/backlight_cool/brightness

Signed-off-by: Maximilian Weigand <mweigand@mweigand.net>
---
Maximilian Weigand (3):
      backlight: lm3630a: add support for changing the boost frequency
      dt-bindings: backlight: lm3630a: add entries to control boost frequency
      arm64: dts: rockchip: shift boost frequency for rk3566-pinenote backlight

 .../bindings/leds/backlight/lm3630a-backlight.yaml           | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi            |  1 +
 drivers/video/backlight/lm3630a_bl.c                         |  9 ++++++++-
 include/linux/platform_data/lm3630a_bl.h                     |  5 +++++
 4 files changed, 26 insertions(+), 1 deletion(-)
---
base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
change-id: 20230602-lm3630a_boost_frequency-bae9656ec759

Best regards,
-- 
Maximilian Weigand <mweigand@mweigand.net>

