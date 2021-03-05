Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 871FC32F6D3
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 00:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897FA6EC9E;
	Fri,  5 Mar 2021 23:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpcmd15177.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id E24A66EC9A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 23:51:40 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.168.111])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IK7Ql1dnx4WhhIK7bloTJ6; Sat, 06 Mar 2021 00:44:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1614987879; bh=g/9Jp2oVczzvdKn+dGvl9Bn5g+LLkkEVjTF5RaMYZnk=;
 h=From:To:Subject:Date:MIME-Version;
 b=csX9S3jMvFqpgRQanb1oiazdC/+MEqdLmaD3QeXL7/an5yGE0woUv9By4f+PhpzOz
 reaVfzbxXwG7sZrMgW1sUv+EMf8HKRzYGAeay/8CS1iv1CAcCZ+/wbz0FjdS6Tad9t
 Pnd/vuRJRr0UqTcoJIeHxs5uWkjduwYnrRPDHL6j0pvmkwJbWekxLTl+FB3aGqOUdt
 KlmKR+FK4gNHSIAkbJ41j9HPSvUpEkAIUwrqXPVNNt1d3uWXb1WHre19pV3T81OqUD
 c5m2QYGTEq9gfbUq5UbSyZdFHy1carLymGa1dO2tFaLWomroxtYHYPdh6OiuTMgIZb
 R3DByX+k45XYA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/9] dt-bindings: display/panel: add Jenson JT60249-01
Date: Sat,  6 Mar 2021 00:44:21 +0100
Message-Id: <20210305234427.572114-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
References: <20210305225444.GA792026@robh.at.kernel.org>
 <20210305234427.572114-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHxsbX5aOZd/fJk9/zmrUoTl5zVu1P7dQ81+Mh8ypJLK+KsU96L9GpuNFxo37uF8yMvMJTJIm8cyEdeL7r6TOZWekbqQWEdv12O18PElNZZmbPH/Esjo
 cqBgrcrMt7m/YiFu4CzOAdHILW6Jc+pbMKrGKPuSUr13AqJeUSBAKEKDcjhFLzooezF2u3g9QUkObm3JzQzdTfLeFqgSfMZ0U+ERIcBTpR34rKwviVs+v1vK
 fwerPg9kb50kRFaeq1CaOa72WMpDlosUxbuTetQiUznsld4he9sZ6x6lF8HFBUEsrzLaWEN688LtgxmMwmLPNsfHcXtTgUqE7bmdoq+qwrWffKJa31sSbh/W
 GF7cM7tzWwZ3qwUb5TQ7ZKcY+sZES8DLCqnNwq/0JfOqyqAURbuLWasM4n3TjHhZpie+FEMtbAxNgMsz7PehcSqpwtu4vyyusYAhV4Tz//mDDMc5Bkpoy3Ia
 kBMEKBl39s0OES2skJOyyLb3dh/2nEBlSkEa0fTxwlMAcXFiDf/oy8arseNIABuohRFsU65e+5o0Wq9L7P5vEVQWA2aBbwlN+spmzf3duQ+xyhy9x6zCxyx5
 3h2vRofhAyupKxWBKkvK8MAtJpqJa4iTQ/8Em9GUzpR1JYguBGVh8LdTobCAb/W/F9+onAWeq6foOd7Z1heNULYUpDSMeDqoe5+rKvrEX78Bj+JZZ+ws006o
 hsYc0kpdnUUNPtFPq20TdOb+wSafSeBs43gAYQLhWDQwDF/1KDb7SQ==
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

Add DT binding for "jenson,jt60249-01".

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 35c335aa085e..68eaa353be0d 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -172,6 +172,8 @@ properties:
       - jenson,jt60245-01
         # Jenson Display JT60248-01 4,3" (480x272) TFT LCD panel
       - jenson,jt60248-01
+        # Jenson Display JT60249-01 5" (800x480) TFT LCD panel
+      - jenson,jt60249-01
         # King & Display KD116N21-30NV-A010 eDP TFT LCD panel
       - kingdisplay,kd116n21-30nv-a010
         # Kaohsiung Opto-Electronics Inc. 5.7" QVGA (320 x 240) TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
