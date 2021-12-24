Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB9C47ED2D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE49710E41B;
	Fri, 24 Dec 2021 08:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D508510E3E9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 05:23:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id x21so16901207lfa.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 21:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8p5cAhIlsS0RVNWJwJlMF76TH5CwTtvB0RF/Dz+Mi38=;
 b=baDEms+uzCHi3HYHok74MXuUK46KTsfuP+YqAZsGbvywpwmxu85G64pCns3LNg5DMj
 KvYpjVmlpfJIVLW+YVLOUBXNMPFfjT+Mso/TSTweOI7XL4chwg7e5beZKzLhRebQsfel
 MeMg5iU6Kt6QLWm9UIruT5H32QK0aZ5y6Fqa51RxIi4hH4zr9zn514OqyJR/2TQJy0Mp
 F1Wei/sB1BvZe7YoM5YxUqL47A9uZ+/T6vrw9VXwjVTweXHkyF9v6sqEGfjg7cVGlDmI
 L8SlMVzOCw+M6puwGUckor6tOuzmGewZ9wwWJdOl7fIgfoqCJ+FkloY386QdSKQupmOg
 QkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8p5cAhIlsS0RVNWJwJlMF76TH5CwTtvB0RF/Dz+Mi38=;
 b=WP+T3Hieqg0zmoRgs1aC1XpW01H53oHHlK+nQl7bEvti5PMocf4MKvMWBCwl/J8+Io
 sQ4+QH9b7vNeqgk709hxrLggbiwN+LR52IrZ0mgig9vjuf8um0NKprm70bo3Cq0b5AxY
 EUs2JSuPEEPFk60geuvMTicvd04eBGNs5pVvpQeRKzpdwCMKCrKlOvTnBbYB3dIGrQWn
 2f5/tLTSWbqxwiKN8kxCCmps2RGZ/8qz9vQY3By6Js13BuKX3Ecm12UVFmND4hdM2hsk
 xwVCZklUsD375Ldbl1grTo8EVycw9hwAM+1Gj3tVtAPyjixz7OsRYhNVBLDzLctP2XHO
 +w7Q==
X-Gm-Message-State: AOAM530qyTU9YZiJDuKLZCKqewKsj1rsNigdMjdk1Jkf1x0587EASm9v
 QgQsHr1ONwGSJ0RqR6pTn1vkNw==
X-Google-Smtp-Source: ABdhPJy+HN9Nf9T96QkeX0cpn8ucbeHE1l2R9SUX2XR+Qg6BdgeJDGp6k+PB5axfuBITIXZDhvTjTA==
X-Received: by 2002:a05:6512:15a7:: with SMTP id
 bp39mr2903128lfb.363.1640323421226; 
 Thu, 23 Dec 2021 21:23:41 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:23:40 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
Date: Fri, 24 Dec 2021 08:23:08 +0300
Message-Id: <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the missing lvds0 node for the R-Car M3-W+ SoC.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 27 +++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 86d59e7e1a87..a34d5b1d6431 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2718,6 +2718,33 @@ du_out_hdmi0: endpoint {
 				port@2 {
 					reg = <2>;
 					du_out_lvds0: endpoint {
+						remote-endpoint = <&lvds0_in>;
+					};
+				};
+			};
+		};
+
+		lvds0: lvds@feb90000 {
+			compatible = "renesas,r8a77961-lvds";
+			reg = <0 0xfeb90000 0 0x14>;
+			clocks = <&cpg CPG_MOD 727>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 727>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					lvds0_in: endpoint {
+						remote-endpoint = <&du_out_lvds0>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					lvds0_out: endpoint {
 					};
 				};
 			};
-- 
2.30.2

