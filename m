Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37455654317
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C2510E502;
	Thu, 22 Dec 2022 14:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56C910E502
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:31:25 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id a1so3155678edf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bW6Hd9ovFsWCrzyECcvTbdEVVhvmMqsQBtWMpTHrRQw=;
 b=UmrBHX+ITAjCTD/jraE2nPoYqi2kuyYlYfiftb7UsxEAzRved4jYSoN7MtzbLKlQ7q
 3r53gXkAk2BWdao1WBouYq2dGLCwiPVivXB2b2w5mYlcCbVF/h1p2/VuCPmwbYNDTQP+
 h21Tk3n1RBmFMl3w/jJO6robuO6aJPcmb1Fzzov8vVF34+DfxTTMm7XPZWJBpQNtqvzO
 M/sUL9BdGiOAJFiHoWfrMZ5Gz/632NoFvw4gTUEhJCYiwVMnoAJjbPrjxaW1022PXZJv
 +H8HUyTXy660waa7WqWynKpwzT2G4bqMvmg8jeGlBLqt32JkkUgjFK70+h6Dfxqqe4jD
 a0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bW6Hd9ovFsWCrzyECcvTbdEVVhvmMqsQBtWMpTHrRQw=;
 b=LiZfuNnlBKgR/XeNSoFFSaBpbArOd6Nl/Ay/LfPB0oeI4f6QMI7EG1BqwzAAe4VkhB
 +/IPUA2F0MsvTMCy/yH+VTLkdCYCI8AOGHQPxj6tAELCEOlbsvQOnXPJMNzGBAN2Rt6A
 01uJIALiNbopmasP2v2/jEhdj3bPWnyT/xF6/AjTzs2mnOULeOguETgFTq/2rv2f0HrG
 iQcm7/GDwQxyENCwnCGLV5zliXl14cg5mON5Q/PFJk/3UJdeJ5RBRleSsBaxZV+85QgO
 FCO9qqwJ7N3p1SoQPjEuUEBI1PV+P6f0BQUVWshGtxLKD5c5O1vMtWedSPrWGN6R+twC
 M1EA==
X-Gm-Message-State: AFqh2kpW5CQQ2rQZowAPsk/D7MuFwCB4U0hkDumSsREwLHsWOe2fH9ZS
 K6Lm8aI5jvlmk+ron6SvHsI=
X-Google-Smtp-Source: AMrXdXtxHQQvzCNkSik7yX/z0ueyYewn5n5Af67lZrnJ1cWnklfdFv33LN/MI7hUA3CP1NUEgPRCSg==
X-Received: by 2002:a05:6402:2a04:b0:461:de81:d194 with SMTP id
 ey4-20020a0564022a0400b00461de81d194mr9671100edb.31.1671719484507; 
 Thu, 22 Dec 2022 06:31:24 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a05640200c500b00463c5c32c6esm417648edu.89.2022.12.22.06.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:31:24 -0800 (PST)
Message-ID: <99895a4b-25c4-4b64-42ac-6f70940ab56e@gmail.com>
Date: Thu, 22 Dec 2022 15:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 12/17] arm64: dts: rockchip: px30: fix lvds node
To: heiko@sntech.de
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Language: en-US
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, linux-samsung-soc@vger.kernel.org,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com, hjc@rock-chips.com,
 robert.foss@linaro.org, kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the conversion of rockchip,lvds.yaml a port@1 node
is required, so add a node with label lvds_out.
Also add label lvds_in to port@0.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V5:
  rename title
  add label lvds_in
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index bfa358042..e34d81f29 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -453,7 +453,7 @@
 				#address-cells = <1>;
 				#size-cells = <0>;

-				port@0 {
+				lvds_in: port@0 {
 					reg = <0>;
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -468,6 +468,10 @@
 						remote-endpoint = <&vopl_out_lvds>;
 					};
 				};
+
+				lvds_out: port@1 {
+					reg = <1>;
+				};
 			};
 		};
 	};
--
2.20.1

