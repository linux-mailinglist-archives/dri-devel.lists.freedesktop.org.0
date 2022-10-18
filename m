Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5D26030F1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 18:45:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBE310E28B;
	Tue, 18 Oct 2022 16:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685710E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 16:45:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so12679845wmq.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 09:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xJHqz/NgmeygQyOjTE1MtbVMgIIcdyJ4beia91UBymk=;
 b=N7a/utxESGarBoQNzWgHerpAID5FzSF2po1uvvRf4SEXBwDpCOzNwq2gfrV+mDIWIH
 5qcdxQD7E0pXC4fxzlNA1i3xTdAck/rGOCvgLjjVbECNfDRu1PX4afMJo5g+2XA12o7t
 zICV8SzSZT8GdfmyKLROUhCPkswwUSdRLiSw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xJHqz/NgmeygQyOjTE1MtbVMgIIcdyJ4beia91UBymk=;
 b=QXeKwPzMj1d39R9SR7HX/sgLtscU8QARE+1tRjB4FfKOA4n/vZfsH1hdKgIzmffgWE
 iRxjCLkNEN/Y4yuu8LgVll68aiCSFpUKtjbjArTauNI2sP31OJ+DvUS8jnJBnT6yh2P0
 NIkR967lNg9nhYRMJnWlnKPPla8MMYOOAgK2vonbV3wl+wmanOySTI0lIk+IpquVRgMZ
 zRmFg62K2Lzy8rv1EmCOhg/q96ILAZHSivevy98fSakzkbXB0ID533A1//1sU5eurIbC
 T8u4AWcdS9/HjWXEx52FDeiXUvC7ZKEUL4NHC/rCZO+ivfGhk2IMy933B0rOlTH7W2To
 gKdA==
X-Gm-Message-State: ACrzQf2NlFSrBwLqORjdkvrWCD2DnxbyUcTUT6gZHTLjq2pixhC0Aevi
 uAB9bzSwsvBaHk9ZNMmD9QvY2g==
X-Google-Smtp-Source: AMsMyM4OpRNEI5gAYmN/Bj5M7BbRi+XiCYYmExrNxQ9ylC+TvRKeZz++TRILLpShYUxZ/HXp1FYhKA==
X-Received: by 2002:a1c:ed11:0:b0:3b4:d3e1:bec with SMTP id
 l17-20020a1ced11000000b003b4d3e10becmr2679777wmh.196.1666111540648; 
 Tue, 18 Oct 2022 09:45:40 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station
 (net-188-217-54-207.cust.vodafonedsl.it. [188.217.54.207])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c4b9a00b003a5537bb2besm13545592wmp.25.2022.10.18.09.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 09:45:38 -0700 (PDT)
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: tommaso.merciai@amarulasolutions.com
Subject: [PATCH 0/2] drm/tiny: add support tft display based on ilitek, ili9488
Date: Tue, 18 Oct 2022 18:45:24 +0200
Message-Id: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: michael@amarulasolutions.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, linuxfancy@googlegroups.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, kamlesh.gurudasani@gmail.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,
This series  support for ilitek,ili9488 based displays like
Waveshare-ResTouch-LCD-3.5 display. Tested on Waveshare-ResTouch-LCD-3.5
connected to px30-evb via SPI.
This series is based on work done by Kamlesh Gurudasani in 2020:

 - "drm/tiny: add support for tft displays based on ilitek, ili9488"

(Thanks Kamlesh for your starting point)

Tests are done using the following tools coming from Yocto fs:

 - modetest -M "ili9488" -s 31:320x480@RG16 -v
 - fb-test
 - fb-rect

References:
 - https://patchwork.kernel.org/project/dri-devel/patch/00719f68aca488a6476b0dda634617606b592823.1592055494.git.kamlesh.gurudasani@gmail.com/
 - https://www.hpinfotech.ro/ILI9488.pdf
 - https://www.waveshare.com/wiki/Pico-ResTouch-LCD-3.5

Regards,
Tommaso

Tommaso Merciai (2):
  dt-bindings: add binding for tft displays based on ilitek,ili9488
  drm/tiny: add support for tft displays based on ilitek,ili9488

 .../bindings/display/ilitek,ili9488.yaml      |  72 +++
 drivers/gpu/drm/tiny/Kconfig                  |  13 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ili9488.c                | 440 ++++++++++++++++++
 4 files changed, 526 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
 create mode 100644 drivers/gpu/drm/tiny/ili9488.c

-- 
2.25.1

