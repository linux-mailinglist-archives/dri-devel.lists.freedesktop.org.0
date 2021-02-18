Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AB31F582
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 08:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD8C6EABA;
	Fri, 19 Feb 2021 07:55:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93DC46E88C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 22:55:23 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CsCZl9zcdJFRNCsCalTfMz; Thu, 18 Feb 2021 23:55:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1613688920; bh=cevDCnH9VgTnWHFn0Q8N7lYnLdT+VIm0JJfZ3nBgEkA=;
 h=From:To:Subject:Date:MIME-Version;
 b=GmhH8h4osOTVrBGEanmklTNAiDz/bXn+5Kjb01kIDZb9xDrAVjeX04wsdWjR8JlJK
 tv/uldsWA/7HPMfUOgz46max9zaqu39phsqC3PSypkoDrElodT3y8iPh6jj6Z55Wyk
 s2TsZreCsI72uospadRyHGWs/oSBDERl34Y5JEOXe3wzDcrLlCzrWEdOS0uaray3lc
 cwP1wPd7K56wwmn1q09fQI2+S8gT5zDIXzarWervXyMDIiYKbXJjfAfPX/1JqO0vFh
 3ebhvN+Y0XooxjYkVzgaJti6xeEm22lwVPZWPcnD3ItIi67DvkhI2DwoW/djQhy18g
 mYmFYocAdMcBQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: 
Subject: [PATCH 0/9] Add 4 Jenson simple panels
Date: Thu, 18 Feb 2021 23:54:48 +0100
Message-Id: <20210218225458.823773-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHdTWRd/78jkjtTGxaOvGm216CUVCexgY1rAYoipYeZeePYwjHoa0MDE5TcPNsDNMYXxq5yM0D7VG9j8tDYN+1EK8MboyFpH7wskSZDONqmVhVMQ5Hex
 MMpciBIsw14BgjHLgWZ0E7+thx/Fnv8054SGE8H1FiV36E+9KbJ+THv5QVdlrnkuM9OOxAn69NValpuC9IrZI8Y2Edle+7V/VdKhGpDQnvu2XIjNfNwdmgRr
 mQjmUTovZ2W37RPlKJud7caCSfbxp+rgzUJFu0LROvRtx5kORFPxh1lyW3Q7liq/M4ilZxcWkWhDXcSRUdAWckuL6i2bRXJmW77pTYB6e1Vv8jmbCAYpZ/Q7
 16uGm+CVe190vUtElH7H6iZCZ4qteXd3Wdx/rBFaSZNKpUnLpZQh1ktKQ53UfZ7o/aXtIT8UMcCfVMJeMZ+Wj9pRbR/mW2wcJ2ss3YAhmBNuUSpNXGhjRSKA
 UnFjPbiosfxMTFqz/yPBqIPeWALIEPgiDbx/tImJpYkHKY7ov3JL8ch1dbNiwD358ix6p/ZPLOM2olPQSaVEqXZtzvl+kHNFUfnvd3PvQq9TZXw0PCTMImeG
 1CgYD/gzF9Q8ERvnQWYN5Dr95OuBEnLotI1WYqGzbpeGLPZpslgWJS7yH7KMre6mEb4bDwF4UvM3OgtkJX3PR7OTqxBTkB7eE2MVxRBHhr9IWUdBkYArIm3/
 HhyBauWt5ohCeQ8h99kfDeTyfWOzLUw6h/LIsDuwutotVIfl8vx501q1QnXZKyCBRNXv7sjm4js=
X-Mailman-Approved-At: Fri, 19 Feb 2021 07:54:58 +0000
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
Cc: devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 allen <allen.chen@ite.com.tw>, Max Merchel <Max.Merchel@tq-group.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset introduce Jenson vendor and add 4 of its panels to
panel-simple driver.

Giulio Benetti (9):
  dt-bindings: Add Jenson Display vendor prefix
  dt-bindings: display/panel: add Jenson JT60248-01
  dt-bindings: display/panel: add Jenson JT60249-01
  dt-bindings: display/panel: add Jenson JT60245-01
  dt-bindings: display/panel: add Jenson JT60250-02
  drm/panel: simple: add Jenson JT60245-01
  drm/panel: simple: add Jenson JT60248-01
  drm/panel: simple: add Jenson JT60249-01
  drm/panel: simple: add Jenson JT60250-02

 .../bindings/display/panel/panel-simple.yaml  |   8 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/panel-simple.c          | 108 ++++++++++++++++++
 3 files changed, 118 insertions(+)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
