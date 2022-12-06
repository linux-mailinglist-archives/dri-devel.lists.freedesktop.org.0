Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F62645535
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 09:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D117D10E373;
	Wed,  7 Dec 2022 08:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D113810E302
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 08:34:09 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qk9so4427056ejc.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Dec 2022 00:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=Ca42HDnAzaNif+afl629upfFjzp/uhKchk5gezZGNys=;
 b=WkyZ7rqxOey/vVPB1CJ2VdlljdAI5pGla1R9B/A3vystAGfhB74ZSGseennRhlzGHD
 CH7tTPGdr1KWnymVVEdJwxMxmSRZK+DY/mF8VdOwU2ddopQhlYRJmhf6YAWNFmYf7tmT
 Ii7Ct6hITejF3eOweUPoEUU4mef9Tn3DAnI5PXZt8fjSjBL/EJh85Uw/Y89AQvgwa3ON
 Cg7VrRTNRC/xHQpoGjRRODNVdjTMeR7ezTiv1kxEusc0RPkS0+H3IRnOAX1MmrxUr8Zs
 3NzeZGvNUwRUMLt4O3l+GokBFxSIAUWN1QLEk/NLLyAgfn6iuQu5Dx92xFYmcik6i4HO
 0sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ca42HDnAzaNif+afl629upfFjzp/uhKchk5gezZGNys=;
 b=fVAnfXmqHku0dM9A3E9Ar9ARgP6qiBqyLItXBTt1lKy5dcmBmF4ffNuEJgZfkI6DAM
 EbnUNU3LvzvqPmfsX58OeRQ10fdxnawVxyYEyMTBSetg9cgNrSBhmPNMtZRCvD2jglWD
 LwvcG3Ibt8eAy6pfeJs/ozmIH1OlCjcloSWAXawUzrYRxbRBLcZqrym5OVp62AJrq9Oc
 buDYSXl+lf5JFRJK7Fl8Fl/hznoi0zRgL2Wna3CUUF2UY6f9wEwCwD0KU0CP7sPadDwh
 fWoHH9BxKhN/pZFTJZhg5Ml/8hIY6hCPquplcJDNxCJLfSo44Yu/P6f9y3xNRrPTDTUy
 TNFw==
X-Gm-Message-State: ANoB5pkmDvykeIhYpOB4hRrTdSAutEP/76SnH3HAeM9/NkGi93zB1QUa
 MtFjbdPBGo4fL91SnznyC0x6jQ==
X-Google-Smtp-Source: AA0mqf5JJQz8h87aHVLqA619Gb7k/7pjbk6XcCV4nl5pWXDqNhBKQ6pGjnWf/cu/qaBdHS2ZZQi3eQ==
X-Received: by 2002:a17:906:f0da:b0:7c0:d609:4120 with SMTP id
 dk26-20020a170906f0da00b007c0d6094120mr11095894ejb.320.1670315648363; 
 Tue, 06 Dec 2022 00:34:08 -0800 (PST)
Received: from [127.0.1.1] ([2a0e:41a:894f:0:2017:359e:18ef:1c49])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a17090604d200b0078d9b967962sm7019390eja.65.2022.12.06.00.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 00:34:07 -0800 (PST)
Subject: [PATCH v3 0/3] Make ILI9486 driver working with 16-bits SPI
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAHj+jmMC/4XNywrCMBAF0F+RrI3k1dC68j9ESh5TOxBbSTRYSv/dwaULXQ33wj2zsgIZobDjbm
 UZKhacJwp6v2NhdNMVOEbKTAmlpJSWl040r77csceEnWktdxAbMww6eCUZ7bwrwH12UxhpOT1TonLE
 8pjz8vlTJZ3zL7JKLrjVwggZvFWxOXm3JPQZDmG+sQuBVf1FFCGiNcGCDrHT4gvZtu0N6P88jP8AAA
 A=
From: Carlo Caione <ccaione@baylibre.com>
Date: Tue, 06 Dec 2022 09:34:00 +0100
Message-Id: <20221116-s905x_spi_ili9486-v3-0-59c6b58cbfe3@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>, 
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Mailman-Approved-At: Wed, 07 Dec 2022 08:08:47 +0000
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <ccaione@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset is trying to fix problems seen on S905X boards when interfacing
with an ILI9486 equipped SPI panel.

To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v3:
- Added trailers
- Added new patch to use drm_aperture_remove_framebuffers()
- Link to v2: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v2-0-084c6e3cd930@baylibre.com

Changes in v2:
- Removed SPICC patch
- Reworked commit message
- Link to v1: https://lore.kernel.org/r/20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com

---
Carlo Caione (3):
      drm/tiny: ili9486: Enable driver module autoloading
      drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
      drm/tiny: ili9486: remove conflicting framebuffers

 drivers/gpu/drm/tiny/ili9486.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)
---
base-commit: bce9332220bd677d83b19d21502776ad555a0e73
change-id: 20221116-s905x_spi_ili9486-aed54ff3cb21

Best regards,
-- 
Carlo Caione

