Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869049ADA59
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 05:18:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D0E10E1CA;
	Thu, 24 Oct 2024 03:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="MH8qn/RU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-19.consmr.mail.ir2.yahoo.com
 (sonic302-19.consmr.mail.ir2.yahoo.com [87.248.110.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C85B10E89A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729739919; bh=blNveK3/qTop4tO3NKwtrpZ40Njgq9iaYrZB8t0ZO5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=MH8qn/RUkDnnPCxle5uSLGmU2LVnrHwXCSVdwrORuzHuYp9rM3BuzMWvgFxuUDLv27300ASavizK3LopX3xnLmkeKz9T9n9cYEVq2nrmpJEM7+5rz5uILNSKTg8fyovUUN9He4ETLk07hqRB2z0tg6QueyPn8pr2mdzKZDvCaY+cS4o20Tq9Ei+pBCn8W7zrbsvDH0+Tw/QRW+TPHyCChk/hii2qQg8MsGL0GS/Ug25THfPCM+6dpCz55Ssd/Atb8480gCxBCSxt9epZCP0SfwQbFSs6m6Z0W7az4hoR5+uDVF31pfXAOMvJomARp4ijT21Ok0GIC+E2bze2MOLCSw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729739919; bh=4XhhIMpE7TXM6w8LLv2QqEFqXBlBkwC/+vrWjHebZkh=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=AX2/UxzrTlefNPkNy/1w0CF2aPDMCI0izlAbn1VyicCoydPPKk8J3938kgW8yXP4iycLpp406HxcWfejrZlQ+votL0wblrg+jSMkuLt4hdw6NVd8Mv5/DIoLTkj4giE9N8JOpxuh0GWVZeD0YGmi1HAQ3Srj/zs1vomaN8zXXCJz87YHrymeNTyY8ARXlyysfFZtVVF6VQ8Wgp9PJa8BP3dxoopn6pSNw5+rx6bnGeO/iz9rDLSfCuLYXsR43wkTAuck+zCxS5ddz1ilNOco/GEmC6o4acv8FXlrpynwvmU6kc/iJ50TAcn3f/4e9JLmqK44TxOa/jz33Q3dTyrHfg==
X-YMail-OSG: Fwoh5.AVM1kyqmD473fMZFb_GhGkEqiC2XlEEWDAj3TmKxo59whHirWdV06Kdej
 BoJopSgxKD_BhFuWhmgqpA8CGA6Kx.jgHBftTzm7PKcmQkZxkjdRIkEeTtOu6GTogTBfVnVkZmcX
 L.DTBOnIwpPASBLtk6Ulf6sV7IfwVHkwL6IiF4_fmdmCY9cAXxYPI5qnFclRUtOlNoz8S0_gHWMs
 EQr5GR6hh80pqg3j1to9j3cXyxnfosh5VhkcKlH4MgoU7qOGXIxGo_oNhPk2stI4tS5ZIQTxwE6y
 aWto3IVe9_QVcAfHpHt_U_WJuduDD2N0ztxSf0S_yHLWiPwF8FhuxrdqRKW6h_oVLAIfuzAEdvxS
 w_7EZqXQYNJT_pbQnUwQ4NkTH83_poK3sqADWVTlIfP16rWuQLbIAv9fiYU9HGQbdCOdMxi6DIGv
 g1wcKn7gGfuTChJa76h1ifDEfWhqUMT7tOX2pUqeQrRnJfdOcHNIEzIoLaV7vEr01_Th.rB0is23
 a4maDIHsqcbG_.J6aIrPlwLQ8petCrdbLlvuOZ9go69TSEOQTZPTly8kzkTfAX4LfnYDklq7Z2I.
 2._4EMrAYESqBjv_0F_mB4Yse_gZtcLppDkY_JLJPytdD5JvLF9rEQTzfb1KPUQTVh8wenpjiYz0
 m4CNn_ZY9J.B54tWobSNSelragO9ZlOhaho0pXrAkXKI0Ee0_MZjEvHTbRmYMn5RPpTeyGvtOeCW
 gx_qMSQFSCSXnxFxFKarha5a66NhIVB_sMgBpI6FXkGwOwBcTZSpOPRomxCLObO6AzfOnkUr0m5Q
 DGLwtQE0fdBeU8NpAVu85oVPjMhF1tEUNdWURfiZDRa9e.uKgcLWrZDPdMuXQA76DS0PIs1U6O_h
 J9p8NoYksWU8CGlaTd3Vap5zisVkcqFIymvgS0Se0Rz3Toa3G0NaGmP6SDUW3gXvR6WVM2_KUMq0
 cy_XwdE6EcdnnNAnJXj11A22PKjUw2eleass5RVLLxcAsKwWGOEv9Sl4qUFpMK3WMq6mIG5Us4LY
 xsmg92TyUkg2V9mybmYU9YrNechDpFHlD3.gxgp4A6J7AGMY3AMGlmdVmDpTloM_qUfXHPpLzZjS
 RjNQPGPqfn2pRK0QcLjoCIzlR7ab4HjODps.kCz9kpkTnswuFNgQch20bQJ.B9WBVLmeZNAvVmD1
 Xjgi1HGdm_Oz4nAHLi25QThImTwDR6TD9EBHiSKKRS_isvK_YqLCAT6wMaZ29HNfRtM9mjijyPre
 Gea08r9DPLgd6.RQM9pwKBV.lsiiFoeq2CenpDQnR1Jidks2TXmcnmL8q4ABzddOjCkeg.QVdtL.
 l8_U5K5RmiJ4dkSW04mIl.lFpdmsjxdO0.07y6lyzbYT4s2KP8W_tNDQ3P6n4n4fgBaDW0YZ.Ej7
 7.loL4U1L8HdwQ04ybfZHr8IIKXgKuqzb6PeI6lT_tTXgGApGkJI7i7S09nds8pci1fOybgZ2cgD
 6laRM_Dy94oD6FVjCgD7yUnBGKrmS1USbrvcVVH9Q11nzecLyz3e4QJVZvrdaAEvzxHCZzDmK_V2
 qX8qzrCT_sOpYavf336QXNoMyUDuWocFaGjf6pAeptjaKjdrb8CRnLm8hT4DKQf_hzOrEIzHBHAx
 jNFaMmnd_Htsk_eSfoAbIWmsgAxAybrKifE7sQMxbQnxLS783Ci9ltacQQfcwZxQLUpST5aELdjr
 wM77bFxFcUnU2yRBAJ5RlqiyzBXOpfD44KPfCxIEDZJOKimJ56lc3Vday13cwfainLvirkwrpVCv
 wnofvq5ZYgm1zncy_N.p4Zu0WWFfyRCvQ8NnIzYlFlTYN4N_PUJ5y4q_mfW_aofg3G3Ho4nZVugd
 tPVLzY3ivqcRzBebcZxCOLfU8AOhGgrexmeFITMslbZoSqW4xQj8yYKMby9N18j7RU.qtdYbVIml
 Hy0eClL037bS0y8waQ3Jo3cFSl4HhTyp6t4sbuYrb7Ot8vfHpt4c6ON.mAg5uNpd3R.7Lsun.awm
 GqlgEl4y7T7uydfAAetGvqpO1kxzBWFPtd.4udHRCZaI11JUlkYWOaZfKs7yidGiigoLLGO9Gokm
 yUuP8xqyRhwyQbqBTHDRRUQwjnI_xgY4EmvO7vde5OVGZ7FrPzc2V.E7Ml0WV.wECg3DvcKRiMX5
 R616QJdl8CTW0Np_UwSC4zC85h6GrqmQK7SZsZAxKFRIoTqzS.qVEkwGtk_kP_BD0R1T3ZgZAh0E
 m5GCC7s9EkvotuCerv2dIABys.LJq18zW1OiaXC3JQiInSQ35Qf7hO2ksnNm1kIGdYQ2In6C1T4N
 wV2s1qVUHdRvBM72Pu7ZzABkS7X.i1PUB.qvV9.tv.pSDM7jX.KmvYw--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: a4d9475d-7c35-4bad-9cf4-39867f92fed6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Oct 2024 03:18:39 +0000
Received: by hermes--production-ir2-c694d79d9-2zgj2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 26d1652bc1703d2ade3e89c3cd33808b; 
 Thu, 24 Oct 2024 03:18:38 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: display: panel: Move flip properties to
 panel-common
Date: Thu, 24 Oct 2024 05:18:23 +0200
Message-Id: <a899d5f0525a76efeab6f734b75e1eb95d9a2ca3.1729738189.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729738189.git.jahau@rocketmail.com>
References: <cover.1729738189.git.jahau@rocketmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flip properties were used by "samsung,s6e8aa0.yaml" only so far. By
introducing "samsung,s6e88a0-ams427ap24.yaml" they become more common.

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Patch is based on current branch drm-misc-next.
---
 .../bindings/display/panel/panel-common.yaml           |  8 ++++++++
 .../bindings/display/panel/samsung,s6e8aa0.yaml        | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 0a57a31f4f3d..087415753d60 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -51,6 +51,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [0, 90, 180, 270]
 
+  flip-horizontal:
+    description: boolean to flip image horizontally
+    type: boolean
+
+  flip-vertical:
+    description: boolean to flip image vertically
+    type: boolean
+
   # Display Timings
   panel-timing:
     description:
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
index 4601fa460680..19c8cc83db97 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -21,6 +21,8 @@ properties:
 
   reset-gpios: true
   display-timings: true
+  flip-horizontal: true
+  flip-vertical: true
 
   vdd3-supply:
     description: core voltage supply
@@ -46,14 +48,6 @@ properties:
   panel-height-mm:
     description: physical panel height [mm]
 
-  flip-horizontal:
-    description: boolean to flip image horizontally
-    type: boolean
-
-  flip-vertical:
-    description: boolean to flip image vertically
-    type: boolean
-
 required:
   - compatible
   - reg
-- 
2.39.5

