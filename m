Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F7591243
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 16:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FE4B54FD;
	Fri, 12 Aug 2022 14:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5AD995D9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 14:32:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 53-20020a9d0838000000b006371d896343so663809oty.10
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=hTos8OHgwFshY7dxk6YkVaVl45UAbrAfHyN2eZ+ZjUc=;
 b=DFtvGARmm+GsyUAA3dGxfVZOL3HaJlJjuzo5fkGeRjK1IBhyqZxNK5MsHPZE5TnCeP
 5pgK0WZF1wEJkfwf5fn1OU4cw+/d/vzFq69g3cJyiD2j1G3TnSoBFzAhQ27pMSxIuhnH
 h0PWCibH5HVdSPe0lVy8LSIebmlgHfrejSDkZ6+s1XM41mUcxzHXEWbK9l/M9Sgf6WiX
 EGNjXA4RTdEbcf9jBrj9SiUBRZXTfnjdl42M/HAvezBVX+soLPsn6XGIfiLI5AkmK+eK
 f3ITY+y53bC0R86QHqgvXVmog0yBpLFSxZ9s9QFTJiI86/m4xpsXlBhOpCb+thM11kju
 iLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=hTos8OHgwFshY7dxk6YkVaVl45UAbrAfHyN2eZ+ZjUc=;
 b=OSQg+w3t3OpeYV4RcuGqKLW+gpnAN9YXxcR+Z5N3ywb2nCFGq103j4RVX4pMOtnGU9
 bKpny+k0Eql2a/gBLukUTaGEOrZzgN3p9dBICdK+vLXq1mvjcq/c0KUDOlSddxwRTsAI
 7rnYJQzc5aJvYSL9eXQFGvs0Q7sT/SatNcG+Zsof4GDSDOlovOTEFb7SeIwvovSdaDBJ
 6lK3bh4WcLzevQevzRTV/7LAynrMoxCwEiYHLXHhPgiNj4LHF1DJy9HuGV142lLYcQ4D
 gAwy5FY+J+YTxytESrPYkstC5YPCPvLE2/gA5gLWGGXT03sDil7C676Wh9ZYD2cgqGB7
 Bceg==
X-Gm-Message-State: ACgBeo2r4YbTYvj7CAv6PaJdtFlSZPvJnY/Zn6fsqMPZ8agxLm95u0sQ
 +M/2hO5+hIHpSravtPsvF1M=
X-Google-Smtp-Source: AA6agR4gGe3vsOcQQhWRpqOHohyJTInaQR4HayXakB9KjD3urVkHTl1NNhMiBgegZArCRWUv7LE8FQ==
X-Received: by 2002:a05:6830:1699:b0:637:1f6c:f9eb with SMTP id
 k25-20020a056830169900b006371f6cf9ebmr1555004otr.17.1660314771414; 
 Fri, 12 Aug 2022 07:32:51 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n28-20020a0568080a1c00b003436fa2c23bsm282879oij.7.2022.08.12.07.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 07:32:50 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [RFC 0/4] rockchip-dsi for rk3568
Date: Fri, 12 Aug 2022 09:32:43 -0500
Message-Id: <20220812143247.25825-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This series adds support for the dsi and dphy controllers on the
Rockchip RK3568. I can confirm that for the Rockchip RK3568 this
current series DOES NOT WORK properly yet. The image on the screen
is shifted about 100 pixels to the right and does not appear to be
a timing issue. This behavior was observed on both the Anbernic RG503
and RG353 portable gaming devices with different screens. These changes
were also tested on an RK3326 based device (an Odroid Go Advance) with
no noticeable regressions.

An example of the issue on multiple devices:
https://media.discordapp.net/attachments/973914035890290718/1007407064647221299/IMG_1999.jpg
https://media.discordapp.net/attachments/995430498677571604/1003754966932008960/AB25898E-73EC-40A9-BD47-3FB970DDFB31.jpg


Given the fact that the DSI controller is identical on the PX30 and
RK3568 aside from different grf registers I am assuming the PHY is
likely where the bugs are currently. I'm posting this as an RFC in the
hopes that someone more knowledgeable than I can help identify the
problem.

Chris Morgan (4):
  dt-bindings: display: rockchip-dsi: add rk3568 compatible
  dt-bindings: phy: phy-rockchip-inno-dsidphy: add compatible for rk3568
  drm/rockchip: dsi: add rk3568 support
  phy/rockchip: inno-dsidphy: Add support for rk3568

 .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
 .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  51 ++++-
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
 4 files changed, 209 insertions(+), 48 deletions(-)

-- 
2.25.1

