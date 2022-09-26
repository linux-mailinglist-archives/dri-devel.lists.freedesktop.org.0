Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE165EB10E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 21:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718B10E781;
	Mon, 26 Sep 2022 19:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C22410E776
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 19:14:35 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 m11-20020a4aab8b000000b00476743c0743so516752oon.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=7KxY3avbixQcgHiEb3Qe54qq280GeoSmhKwdxxL4B6s=;
 b=PsgO+GNg5FTlP6tjZwP6ewG65Py1dYEPJ14LoSCQZF5gU43GHiuYFmX9oOXH2QDk7t
 k48nOMQ5nrMpwlRW7nG7HEJM2OlJg09CPM82i2o73yPpBKo0lxtcBUhSVddDCXCRCYMJ
 iV363w26eg055w+aGbkrUxbMYTp8SLFhtMoojMOsyRGqXGY670OHlfwK188rsfMkKlDB
 lp++cqCRXhRecRZsKf/oMXW/tcX0DrZLK+cPoHaL2ZaWcpA3QsMKZOph6PenDlC8hUQW
 /5JoybgjPl+sroZuw2HJz0a1i2o3A7A8khzhOMf1duIXKc37bqsQvhL7D3WsuoBbaelX
 6w7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7KxY3avbixQcgHiEb3Qe54qq280GeoSmhKwdxxL4B6s=;
 b=b1CUJf6+coTqFE2Cpoal94kQiiDVMDzccaGhKiKUq22UFnVMrzM7WxIH+SjpKh+8TR
 Lntp4MfLO51UnVsNim+engTGC8Y1le4TEKMKc9DWM5ukhnYMM7iNheAZ4dsWDyv/lofo
 p45azEiODSNNiqN6tnGT+sdWAQTaqyoS6HQ849TunkKeyRnMqIzbn7YaiLB3M8q/YPRO
 cEvZ38ZT2RWhxXvW+n8j3geZXCiQdPOmBgTwidoEwoc/say4XHryhXaJL+vJK3Y/wE8Q
 IIsRz0oC+NZYOtWf4Aobmpo0PLaLtAOMuPfHmsU28AyDXhjymTxIUifHsO2WEeek/l8z
 3j1Q==
X-Gm-Message-State: ACrzQf0dRYB07DKv6t9nj6X0nUKUPZHRZDEagvG+7UEz/6Ei19StWaSc
 9hQu7DuKMJ3tF3uKwOE2t/SjwgtnHuQ=
X-Google-Smtp-Source: AMsMyM6m5+WKtXRp43xGjWEfTh3vEyjeTFRvwCSenHU/DNf2L11GoufgGCp6PXkTIFYTF/y20m/2NA==
X-Received: by 2002:a4a:80cd:0:b0:44a:dce5:bbc3 with SMTP id
 a13-20020a4a80cd000000b0044adce5bbc3mr9377089oog.26.1664219673956; 
 Mon, 26 Sep 2022 12:14:33 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 p130-20020aca4288000000b00350c5d946casm7278131oia.4.2022.09.26.12.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 12:14:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 0/3] drm/panel: Add NewVision NV3051D Panels
Date: Mon, 26 Sep 2022 14:14:25 -0500
Message-Id: <20220926191428.4801-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the Anbernic RG353P and
RG353V. The underlying LCD panel itself is unknown (the NV3051D is
the controller), so the device name is used for the panel with a
fallback to the driver IC.

Changes from V2:
 - Ensured dt_binding_check and dtbs_check successfully passed.
 - Corrected some minor formatting issues in documentation.
 - Added another mode per userspace request for 100hz. I was unable
   to find a supported 50hz mode that would also work, so for now
   only 60hz, 100hz, and 120hz are supported.

Changes from V1:
 - Changed compatible string to the driver IC.
 - Updated documentation to use new compatible string with board
   name.
 - Refactored somewhat to make it easier to support other LCD panels
   with this kernel module.
 - Added support for 60hz mode. Adjusted pixel clock to ensure proper
   60hz and 120hz (previously was running at 124hz).
 - Added vendor prefix for NewVision. Anbernic vendor prefix added in
   https://lore.kernel.org/linux-devicetree/20220906210324.28986-2-macroalpha82@gmail.com

Chris Morgan (3):
  dt-bindings: vendor-prefixes: add NewVision vendor prefix
  dt-bindings: display: panel: Add NewVision NV3051D bindings
  drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

 .../display/panel/newvision,nv3051d.yaml      |  63 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 525 ++++++++++++++++++
 5 files changed, 600 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

-- 
2.25.1

