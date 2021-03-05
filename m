Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CF632F6D2
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322B96EC99;
	Fri,  5 Mar 2021 23:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF9A06EC99
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:51:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IK7Ql1dnx4WhhIK7ZloTI9; Sat, 06 Mar 2021 00:44:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1614987878; bh=irmXgecv/E1PrGoJ39eNHzojIebA1yNanUGrgnL0GSQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=J8A24Wd404GkKf20DCrgy3lLtq+YdvSQKNOaMq18wHObVSyKc+XeByD/ecV4HuTGs
 QP9YH29WvUzeDIerz4XknHhFuwhPBY5BBRJ3Ul1bKdNtyofwAbzik6XryVSPPa+2Ne
 eAafg+bpWMG32+ykZNm6euz9XkQ4plEapgWony0sQmlxSo37gKWZVBDTjtRclibIKi
 +5ze9d+dnbh7doPpPOB0sUNJ2kL3yfGW34jii/9z0vOhtfJsVtxOZDkF3ASKFn/dqi
 tq847xVL/cTfBYZVg9c/xo8gN5A2+dH4g26du+cgczrDI5zZnEbHhWpJRCHPixLcPr
 BX3klMX5G9omA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/9] dt-bindings: display/panel: add Jenson JT60245-01
Date: Sat,  6 Mar 2021 00:44:19 +0100
Message-Id: <20210305234427.572114-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJAbOqgmHM5eQ0Jo8NDjQJ8yLhhD9mFkkqWh6pYA3XZHYKtWrkfAFJOVWcptc1ccYMeun6Mk3icaS5k0UqzugzSuvvJd1Ro7pG+tmfAbuXjT2N6n+UKe
 pi3vjUMtxHkG32FG62V1Zmt9BOqLxh6FgdgDyE9jPnkuz8DCBC0vQBs5AlzvPrLXtW/Q3qvMlzBVYHuHZv+G8KgCPJ8blZhFnbP42ZIA6mbMfXYZI10Fh3PF
 4DY8by9hFXxHSFfxvAf0Wm9yqvz3xmP3KNKyMb07SwKny5QeucrExtYr9gCIa5S/zMbuS+lfxYJES75cJhXPZ0KfNLazGMKs8IeZj9d7knt/Cn0ldJ3uiK0V
 BXXKBfMv2WGb0tTKwMLazeX4hSEUh82mka2tm+2uo/skqLZw4/VM9b6+BUEftzhrYGFikhDavwtc4Z0N0x41Tt909PqFBDblo4/iUFj4o6uMoRJefwnzeOzD
 xU9hzGD9I72VXQ4yLi0BdP2wNeccP+iqPuQUb6Umkku0KsFGvsTu8HnUMBnadS7jFgx/+HlveRzDnas//0aIZy74UDiOAKlP6CXxBnuFhkrYuPx/n/ehUFZj
 erY+8M6bnsX4ngURcGelxmv1Q+iDydIWZIbOeJkZbN+jXGOXEsEEEoWqyqIWWBSx79W/tIgqjflBmN+Vcu+jF79fqkdiR1W3DsXs7W0sY8oTVMs6n76Zk4TX
 KhjS6iZI1RorlxNTk0QYvH3lH8qPkGYvfWD/cQb7Mrmi2oxCKZk5FA==
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Oleksij Rempel <linux@rempel-privat.de>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 allen <allen.chen@ite.com.tw>, Sam Ravnborg <sam@ravnborg.org>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

Add DT binding for "jenson,jt60245-01".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 62b0d54d87b7..ce41a589a3f4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -168,6 +168,8 @@ properties:
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
       - innolux,zj070na-01p
+        # Jenson Display JT60245-01 7" (800x480) TFT LCD panel
+      - jenson,jt60245-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
