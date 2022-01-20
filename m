Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EA5494991
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB4D10E8BF;
	Thu, 20 Jan 2022 08:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26DC10E850
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:34:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so6352528wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 00:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvjXEzwWw5DOsC2FUoSljhwKoxA/3Cn53z/Kd2Lx0u8=;
 b=JU+IO6Cx0jCaHDcsGI7ReJv+X5sha07aDJGj86ypoJpui2OnOD2gyViNsH3Q9ML7PC
 E8gcD/Yn7Csi7VJLFsaPAmDa83lvqz4Rmmh8KP5AYBEekJRvbINH2hv+foTDjQDSV+1W
 FC8E/soVvyoIFwB96X/05YHJGQ7UBB9lm6ujxnjXLCblRtTJ3cA8Duj4TrMBymHyQSWC
 jIthTRsLKRRrzgyFdLP4ojr9lzsqcqLfpYVEeN+FMt8jlK4hbZI+RQLObTF3X0abfGrV
 tmtCdTTFDZ8yrNGeu9higSRugui968uoWCZgq1P5OmIiD09cYOZe5BaXX2B5GHo2T4Zw
 reEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvjXEzwWw5DOsC2FUoSljhwKoxA/3Cn53z/Kd2Lx0u8=;
 b=5ZPXoxxy8I7haymrGyHx6+Z2s9YwwIG0uN7qCenIQGv5SO5rlEAwkfpf5tMub7/qpb
 KCkn9mNqD6uanshk/321sdNC7MXfRvWE5krDbK/0tk9Qkb0g/8sGiaZkeCrnMHRaaDEe
 e7XZAJH3HQnrQvBY7nLap8DbysTbiXjhBaS5LZWmLQHfvTTZakfjTmAdU97cYJtYC+Wv
 fE696ERAo5MaZOintcA82SQDUESal3FC3unOKa/4DFRiDefgc5f7rxfHO/Ddpx+v5iAT
 Aqcx1fDGSE/iWIJZo5ZXzLxciTZXfJi9HCbVF/EIDlGh/nRJxf0YPjPliKqRelFen7xG
 fKsw==
X-Gm-Message-State: AOAM531Z0UrnY1+NtH9D1bEJd+tAS4ylwh7NvML30RWNtf3XWetH9kas
 IuNXZYDfPi90oVfVsALfHLEayQbxzRAclg==
X-Google-Smtp-Source: ABdhPJwHLKU/98zgMK0292ggxvlMh7IrxcozTV7SPl1uJN57B/NU3j/oH1nyXXoI20JwH36XyzMePg==
X-Received: by 2002:a5d:5712:: with SMTP id a18mr11942346wrv.30.1642667655995; 
 Thu, 20 Jan 2022 00:34:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id u16sm1821975wmq.24.2022.01.20.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 00:34:12 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH v2 2/6] dt-bindings: display: meson-vpu: add third DPI output
 port
Date: Thu, 20 Jan 2022 09:33:53 +0100
Message-Id: <20220120083357.1541262-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120083357.1541262-1-narmstrong@baylibre.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; h=from:subject;
 bh=2wZSM1EervZhwHtMBGn08hG3brA9cSnePHawMs4IXC0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBh6R2HtHaHBO8Gcc5g0igET0IHjMAz8H0lZXLXk1xA
 yY8RtBiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYekdhwAKCRB33NvayMhJ0bU+D/
 45LoaRuAytDfAtfN56uznx2Rj7lc4OpHd42sWi6Fb32dnXa/sstxDfZ3S9VHBkcWyIiIWmrFmTOSo/
 P8Ng9Dx1oU4sz/SJyrNaqWtGEWVhtAa/M54zbhpP3Aeuu7uO3XCvIMdgHlh/pbsstE+1yzBjA/ePdW
 dgx11LGFg0C8nssB62wSjfXtis7EizziWpXOJDeZhvmuA2WVz4i/kjmCwmoV3zayeM3tkMUEht3abF
 c4TFr9TFc9DrwTLvRW5p/WBKIu5KqXJqZBxtJ0tHUG1tAt0OwjVlK0pUPWjR4FcI2o+GpnrGtd0Yed
 yyn7c22w2Ezhjj5+GEBn6V82iJAQaYfIzA45ovJtupai6f7DOqGeo+2Pq64DLoWjRW7wdo+ux5lk/k
 GX6iBqzZcveCC+kSjeeIPPmWcVrAzFTLuP/Subdl8u2SdPyoEtBCQU7advcHWlV+i3JcrlQbsNyNxe
 bVX8cI7k5IJ2uEvYi7WlATT0lzh5D3usM1hu4RFbhIWpsPjsGwEnugYeBW1OVnzwB2NwqZ1BHeeBS1
 1980joW3wENyS/o9VbXzhHL3yG+5aEJWC9E8h6VEY2i00dGIqxjEW7Rg3wRsrxgheom9qBfo4WuSh/
 bOlkcPjlMCIikIr99V6MsA30DJc7sncBiRv6RNTdZy5JUxfSp8ivX07U3URg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 851cb0781217..525a01a38568 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -92,6 +92,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1

