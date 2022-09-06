Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA415AF308
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 19:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C0F10E0DD;
	Tue,  6 Sep 2022 17:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0941210E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 17:48:29 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-127dca21a7dso2727811fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=V+Mmbr5yPt+hzlxY76gjjX8n/7WZsL2sfwWOuEEeXvE=;
 b=QqhEVMt8kblJwysbyUcRBMnek45NF0eS6ZcED+xizTm/mIQ4SMEdit2M7Wm9C6ek0q
 LM1rMLUak2/pOfeVfHYsEGe68lV++x9DJL6IUQLKoVflrokh+91pnBXt5s1Gbi8sjdvJ
 +NCwvh+mfWPIOiR4XlhhTRxduBER5LYDLsoYzqfj+FPTQt2T4o9M6DAqyDCKPOaZe8z3
 E41w2F+iySUatH36XEBYA004nEmRUumvQqRvaMQyWdytpcO4iHxNeCqQohWZN8JT9YqR
 qgo30y8D0nvNd0YkezKUmHLDjkD10TcMjNp1Rjw1IvZleYn7cShcN5dTOqL+jPi8kvOI
 QGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=V+Mmbr5yPt+hzlxY76gjjX8n/7WZsL2sfwWOuEEeXvE=;
 b=hrGwomqAlBCqdLLQJAsjczt1lKl8hCnoLVPHpy7NPPLVGiMbmtkT3LZbdop/Px3uY+
 F0x0ztWfzZUm8wNAj6W1izxXN4DmgdYp7ghymslaSa/p2TQ077C350fjzkCxKeR+NDwe
 iggW1aEpE3kQqT3x0c4zaCkU4bTUIHOgfZjswLB5uVsF5W6zaB8U2U7xm2sAp4lzyYIu
 jUubZKEArRmy8yPt7RmZuerPdzuc7/XyoCCrDUYdkcHjoshfYo2ZzG77SHwDFETu75d4
 DUtH9CSBu/O0zqOvybPGOCC8J9rPdj71lzPo2MnSjde1TH3biOdhJjAFCTJO6fyUdqVM
 LxIw==
X-Gm-Message-State: ACgBeo114Vh3HVb2Tb8mZTXYEZyJXwqVJngMaeScADT4Kq4DtJsvMwLD
 lRbO+UFKLcvTcaB/DNcLoILYl63L24Y=
X-Google-Smtp-Source: AA6agR6HtjFhOOV4l9cuIu//XrbRVuTn//iCK4t2CYBvn25ACKq2aILTOYUKNNymd0pNMDltxtxwnw==
X-Received: by 2002:a05:6870:89a1:b0:10e:4357:45b3 with SMTP id
 f33-20020a05687089a100b0010e435745b3mr12123039oaq.127.1662486508233; 
 Tue, 06 Sep 2022 10:48:28 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 o186-20020aca41c3000000b00344afa2b08bsm5568065oia.26.2022.09.06.10.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:48:27 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/5] rockchip-dsi for rk3568
Date: Tue,  6 Sep 2022 12:48:18 -0500
Message-Id: <20220906174823.28561-1-macroalpha82@gmail.com>
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
 airlied@linux.ie, s.hauer@pengutronix.de,
 Chris Morgan <macromorgan@hotmail.com>, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 robh+dt@kernel.org, pgwipeout@gmail.com, linux-phy@lists.infradead.org,
 cl@rock-chips.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This series adds support for the dsi and dphy controllers on the
Rockchip RK3568. I can confirm that for the Rockchip RK3568 this
current series DOES WORK now, but it requires rolling back clk changes
made for the HDMI driver. If the clock changes are not rolled back, the
image on the screen is shifted about 100 pixels to the right.

Clk changes in question:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/rockchip/clk-rk3568.c?id=ff3187eabb5ce478d15b6ed62eb286756adefac3
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clk/rockchip/clk-rk3568.c?id=6e69052f01d9131388cfcfaee929120118a267f4

Tested on an Anbernic RG503 and RG353P with clock changes rolled back,
the hardware works correctly on both devices.

Changes since RFCv1:
 - Identified cause of image shift (clock changes).
 - Noted that driver works now.
 - Added devicetree nodes for rk356x.dtsi.

Chris Morgan (5):
  dt-bindings: display: rockchip-dsi: add rk3568 compatible
  dt-bindings: phy-rockchip-inno-dsidphy: add compatible for rk3568
  drm/rockchip: dsi: add rk3568 support
  phy/rockchip: inno-dsidphy: Add support for rk3568
  arm64: dts: rockchip: Add DSI and DSI-DPHY nodes to rk356x

 .../display/rockchip/dw_mipi_dsi_rockchip.txt |   1 +
 .../bindings/phy/rockchip,px30-dsi-dphy.yaml  |   1 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi      |  72 +++++++
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  51 ++++-
 .../phy/rockchip/phy-rockchip-inno-dsidphy.c  | 204 ++++++++++++++----
 5 files changed, 281 insertions(+), 48 deletions(-)

-- 
2.25.1

