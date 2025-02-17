Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAA9A38EFB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 23:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B1510E5E7;
	Mon, 17 Feb 2025 22:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="yDc/cM2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="zJIiaIQh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jiaxyga.com header.i=@jiaxyga.com header.b="TbjVCYpa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fallback13.i.mail.ru (fallback13.i.mail.ru [79.137.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6989610E158;
 Mon, 17 Feb 2025 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com;
 s=mailru; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=0d2G7/thj1mhPNwVgmmovSdo1poBro1A7mFVdgv97VI=; 
 t=1739831117;x=1739921117; 
 b=yDc/cM2oWYtEFUp2Q7YejSnv9qcmoZrZzjZrhrVrle2+vcrv1FUEJ0zzLuIWeruBUffxs5s4ExXGoH0MiWq+5w9BERLIIbZjRRW4DEZ1zwX0pYya/2GwQ0SMdR0otmui8EmngGfLWj41nzXB5htAul8O4AA4G6ngYH5t40szBPw=;
Received: from [10.113.154.12] (port=48924 helo=send147.i.mail.ru)
 by fallback13.i.mail.ru with esmtp (envelope-from <danila@jiaxyga.com>)
 id 1tk9YB-002rqK-9O; Tue, 18 Feb 2025 01:25:15 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive:X-Cloud-Ids;
 bh=0d2G7/thj1mhPNwVgmmovSdo1poBro1A7mFVdgv97VI=; t=1739831115; x=1739921115; 
 b=zJIiaIQhfUEctS6yk0zdluW0LgGD2h+FQbw0unmLq3R0LrZoe1LSspIKntCh+2m1ou3TL4HlVwQ
 puuAzO3k3g0zfd3RRfXNLjawwRPtceOxE+UnRFOh2cGF8jGXmm9+BwhfFavu5qZV+aqBPahNdCg0j
 dc1Okf7v6AKonEMlxSs=;
Received: from [10.113.81.18] (port=33572 helo=send106.i.mail.ru)
 by exim-fallback-c85fcfddd-rsjwh with esmtp (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9Xz-00000000Wsr-3sU0; Tue, 18 Feb 2025 01:25:04 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
 ; s=mailru;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
 X-Cloud-Ids:Disposition-Notification-To;
 bh=0d2G7/thj1mhPNwVgmmovSdo1poBro1A7mFVdgv97VI=; t=1739831103; x=1739921103; 
 b=TbjVCYpaM534spx+1Xu25w+QFYCyUHZLOekqp0xScRn/NltJ6s2NwwD69ZmmFrno/ohezqHQsw7
 8/GE/qbKPxknTgcGjkaRuk2XZf5+ikglmN+fxWotSl7sP6UK4JS3+47x0uwIY7lW+0FzSbs9yuds2
 tpQeWMyr+lImleikEYo=;
Received: by exim-smtp-844687bc8-889bz with esmtpa (envelope-from
 <danila@jiaxyga.com>)
 id 1tk9Xj-00000000D2z-2cMT; Tue, 18 Feb 2025 01:24:48 +0300
From: Danila Tikhonov <danila@jiaxyga.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, jonathan@marek.ca, fekz115@gmail.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht, Danila Tikhonov <danila@jiaxyga.com>
Subject: [PATCH v2 1/4] dt-bindings: display: panel: Add Visionox RM692E5
Date: Tue, 18 Feb 2025 01:24:28 +0300
Message-ID: <20250217222431.82522-2-danila@jiaxyga.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9406649C3D4E54DC82B89FD3A6F761A19D7C1D52EFCBED7341313CFAB8367EF908E2BE116634AD74D73F3F04DBB70022EAC8EDD30083ED68E076F7D68112E02997C3A5315927CE1C54C6784DEA8096F07
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE751BC6685BC61E6BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637D7F1BE85E7B0CA818638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80212B92B7F666F046C30ED7C9CE1861299848ABEFA63B15DCC7F00164DA146DAFE8445B8C89999728AA50765F79006370D9A29B7FD16D1239FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C3A333A05395E4745B117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFFF9AE5E544BDEAB7BA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B627A44A7985839C7B76E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE52E467C461EF0E943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A534E669CAFA5053E55002B1117B3ED696981ECB07D2993D44484B8D70797403F6823CB91A9FED034534781492E4B8EEAD0AA277257C6A5E3DC79554A2A72441328621D336A7BC284946AD531847A6065A535571D14F44ED41
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF266882FF5CA278C1604DCABCFBBC961753C9221FC477B103AD2CD56E0D895C4AD9E67331CBA3B6E40526A8B1FD8BF66B355E42E152094C94F965E601AD7A576DCE47D8B7205FA9048FC4A39FA5EEE4B702C26D483E81D6BE72B480F99247062FEE42F474E8A1C6FD34D382445848F2F3
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXMZebaIdHP2ghjoIc/363UZI6Kf1ptIMVWiyXSWEEqdrpcUSGCkFrEc=
X-Mailru-Sender: 9EB879F2C80682A0D0AE6A344B45275F9233EC877BA2ACDA0841F56765D88C403C8858AADF15DAD04CE4B8CC49776FA52C62728BC403A049225EC17F3711B6CF1A6F2E8989E84EC137BFB0221605B344978139F6FA5A77F05FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
X-Mailru-Src: fallback
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B71052A0F16B60AFC0049FFFDB7839CE9E3D3BB30DB6F99D60B0AB94EEC5658157B7D5E62DE32EE3DB82FD0EBD19D71CB3AD5400E2A2963896
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX4DTUlqABwyBw==
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4BA09097AEF4FF40FD82BE83A5A2F87B71BD043AAAB014344049FFFDB7839CE9E3D3BB30DB6F99D60A7270B46D1BAC7B45388845A5448C5B563F73CAC0D80AD8D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+OYcBso8Zm+oliTz8oZwnDrFsY77LZRcHyw5ht0smWrfSeTW5FiI8avd9v29gUBslpEZ9wIMwqVP4jLQVQ+dVm7x9BpDHadBV9RMjI809PraZ2sfrh64bjX4WGrzP+psfrQ==
X-Mailru-MI: 20000000000000800
X-Mras: Ok
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Visionox RM692E5 is a 6.55" AMOLED panel used in Nothing Phone (1)
(sm7325-nothing-spacewar).

Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../display/panel/visionox,rm692e5.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
new file mode 100644
index 000000000000..d4b4672815fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm692e5.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm692e5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox RM692E5 6.55" 2400x1080 120Hz MIPI-DSI Panel
+
+maintainers:
+  - Danila Tikhonov <danila@jiaxyga.com>
+
+description:
+  The Visionox RM692E5 is a generic DSI Panel IC used to control
+  AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - visionox,rm692e5
+      - items:
+          - enum:
+              - nothing,rm692e5-spacewar
+          - const: visionox,rm692e5
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: 1.8V I/O source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vddio-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "nothing,rm692e5-spacewar",
+                         "visionox,rm692e5";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 44 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_oled>;
+            vddio-supply = <&vdd_io_oled>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.48.1

