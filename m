Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2987AD383
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 10:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42E810E1CF;
	Mon, 25 Sep 2023 08:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB8810E1CF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 08:38:58 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-564b6276941so4275115a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1695631137; x=1696235937; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
 b=GUwate0ixTL85JKMY86T3EuwD/J1J/pw+BygfvLWKtyPrhONlefumIe6YzPFQCYa3G
 GE210wSThk3oMnkHSpHVU/FoSgMMARafkp6thBcNQMOBLh1G6+vwSF9eTbiKx+6lWGMZ
 Dwo89OuwLsQflTwKrkMPCu9WAiC3N7FPfkD+Z8wAALOZtJrzUUHOGr6O+5pXxtru/Nll
 KOnPF/EymkpGd2VZ0z2UYzhj7I88XuSoLpaCqJF5HELdcVcWUJdtttR1t3dyyhSPpL1a
 +hZ4StRe7fLHeA1AdkPITmvvcsqXmwz8XjyVx7J0TOnckmRWU6d2ejm23AZxV8xklWJA
 xwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695631137; x=1696235937;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDlQRlGUPTfJlUUMPRtJLma/aq2eNwYNR02CUUOI7A8=;
 b=nSwvUg2tEWRN9ExdeYX8fM+3YybRXQQKwkM6sQ+MfcZ0yCRv5rIzeabSB7dcZ63APX
 Y49uvE+/MqvRX6Hl006hIRcoumrT4bzu9w01Ui6GVMKAc5oXs2LmaJxalGyLABDO8ZJa
 seGBkz3SzRO6ilZP7bbHEUDp5THywT02bVTDhB+g7TrwNPSA1qPeoj4jjUZOuk9YXCI3
 9uG3pY45nQzweh+w63gruNpCe/Vvdz8Zlt5ff2nLoVHJp5LVSZm5jOGjnlNW2qh1l9pw
 DL9gU3YWOMyRTDV4rSEOsqitvmZhPMtQYvKgtIFNtMN34Z7nXsPXlVLT8KI2ddUTJq86
 NuBA==
X-Gm-Message-State: AOJu0Yx/1CUlQ84hYGJGB92eVzmLMA2i0yejnj/pe+xE3QZG4NFzArCY
 M5FRIHb+UAHOpp+tCuYqfLnAdA==
X-Google-Smtp-Source: AGHT+IGRzWUFKvAXUdW7P/gM1pTcDYhfc2VIx4gXPNUiXkY34HMjyU1m/YIX7/WbQhw3zmUkXjMlHQ==
X-Received: by 2002:a17:90a:2a4a:b0:26d:2bac:a0bb with SMTP id
 d10-20020a17090a2a4a00b0026d2baca0bbmr5300954pjg.6.1695631137400; 
 Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
 by smtp.gmail.com with ESMTPSA id
 14-20020a17090a004e00b0025dc5749b4csm10141132pjb.21.2023.09.25.01.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 01:38:57 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com, perex@perex.cz, trevor.wu@mediatek.com,
 broonie@kernel.org
Subject: [v1 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Mon, 25 Sep 2023 16:38:45 +0800
Message-Id: <20230925083847.1496-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682.

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 154 +++++++++++++++++-
 3 files changed, 155 insertions(+), 1 deletion(-)

-- 
2.17.1

