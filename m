Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD0361CCE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A531D6EB4E;
	Fri, 16 Apr 2021 09:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B325E6EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:27:42 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so2081021wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2sUAYapV9tNRdpyx4eKitq/eIA5rKVYEe/d9xJHfMIo=;
 b=O2ZXiCFmleQhG+6wTRzwjgcjsqsqUwRMoVXJCVR3MP6HhYcABYi085jjBpr0eAm5iY
 cyzN0S01yEtnSwdsDSI4UY0CumhvSWEsvjE/U2ZuqsLVS57yuY6+gRSHl5rGTb9t4JuG
 sssbwhVwNEkmKUl0cR6/Ce5Tz75KWGdR2YLRkq+b2goWzDqdpQo7MUYG0onpazmpXh7P
 EqGvTO9tt62tGrnXZqXLhQ9ZWkMayuoyc2oHnkMJ7ELOUpE2zKSC+7RcujR8MQ2/H1IU
 y167+jLmKk9VWHTlxacjHCa8EkSc6RNsUEfIcjOjk1b1cl5ATdaKCkEOS3KfngBuojTH
 jBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2sUAYapV9tNRdpyx4eKitq/eIA5rKVYEe/d9xJHfMIo=;
 b=naVHIwzoI1v6+xu0CK6S0uU/MP/aZAPIixA/M8fB3E1t9yR9PKBjuHvBjslumJfQow
 +Ck2YYEBnZu000cu5HKMldMzuG3EL1zO47v/U9eqmCzd4+KQrF3VthUBGVKRE1j7FalT
 XEezS23RRq2XwGNL4pLYu7+PjoJD77y+RkvFh5D6My7FnB34eyLbtifCV6TuGPFlimvP
 ptQ2+yNSia4FbqpJdaNj1keGS3OZ/BpLrJdfnCorSUosceNpn5ygUZaHNdxQv7HC7JIi
 QwDux9pR7ZP3AiGiYIVmtoMGJhddyEzSjkILZP3GRng6lKR6p2celQz6nXmBvgLLH/gT
 uY5g==
X-Gm-Message-State: AOAM531Ncui4Q0xaiIJlqcMbsuL05iyedyUoRA73zUTLyr4TvSpCFCou
 IBkfEe3CmyXmN1BBZB4nO9sSRMhLU1HvvAYw
X-Google-Smtp-Source: ABdhPJyie/neP71DZoVh0xkkR/lSSw/WmzGCmPnhCr1wnRoY5kDS4wX57Io+5eFW0xZoEepPi9JQvg==
X-Received: by 2002:a7b:c7d6:: with SMTP id z22mr4774993wmk.25.1618565261256; 
 Fri, 16 Apr 2021 02:27:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id
 h8sm8805156wrt.94.2021.04.16.02.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 02:27:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jonas@kwiboo.se, jernej.skrabec@siol.net, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/2] drm/bridge: dw-hdmi: disable loading of DW-HDMI CEC
 sub-driver
Date: Fri, 16 Apr 2021 11:27:35 +0200
Message-Id: <20210416092737.1971876-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds DW-HDMI driver a glue option to disable loading of the CEC sub-driver.

On some SoCs, the CEC functionality is enabled in the IP config bits, but the
CEC bus is non-functional like on Amlogic SoCs, where the CEC config bit is set
but the DW-HDMI CEC signal is not connected to a physical pin, leading to some
confusion when the DW-HDMI CEC controller can't communicate on the bus.

Jernej Skrabec (1):
  drm/bridge/synopsys: dw-hdmi: Add an option to suppress loading CEC
    driver

Neil Armstrong (1):
  drm/meson: dw-hdmi: disable DW-HDMI CEC sub-driver

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 1 +
 include/drm/bridge/dw_hdmi.h              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
