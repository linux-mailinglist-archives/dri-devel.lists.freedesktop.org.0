Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B0C6542D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 15:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7699E10E163;
	Thu, 22 Dec 2022 14:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C56710E163
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:24:55 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id vv4so5310476ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HdAXRp18Yhl+PSUnXtbvxR+DNOmBhpNB7mLZxnFGxfA=;
 b=Ak5UOvazOKQI4voJRBbw/aBCbllxV6iZfxLX5kvr7a5k5+402RTMNX9ttsPTN8xVOn
 jT6T0+rXU62S82MDgMd+aQlPOOz/nfCu0pq1ZLDkC8fIZcYV/qrF/bpFwM8yAWQ0x7EQ
 q9HcoG9P5F+9jZje1fi5sgQoaWHo7hmbgbgOJE7cM//3AeuvYbrpdL0Sl9FsN+43sM41
 8MexiDyS2m+RHro68c2blvLTjRBbFlnQ4ynqfyt4QdPsL54m7KwwZe765Cl5pAO+TBLQ
 kh0a1doC6s6qxvb+rN0CUV2+qE2y3WmNyNet3Vn2IghdsPmFXjRJdFOalNe3uBpXFpbA
 /VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HdAXRp18Yhl+PSUnXtbvxR+DNOmBhpNB7mLZxnFGxfA=;
 b=3LP2EGuQ/Qr4ok2gSclV1Iai8Oz0netIMXI0RcXlMSzZKNTEVgXo2NT9aNyQSJsrmu
 186uMyKuN0g26YQXgMjeWbx6mE0RWMuuu8TKJ8L32Pys66pCnWVb3o+mZnL2iCCmgbMF
 rBqq7Ok3opwVc0YY3OtCCq8I6nwyyeNvD1OoOMet5z5G9SW/x6a34bYp9BnoxvruRGVy
 jryJqOWP+9QGGLBDc3yB+sY0hhCK3Wtltxsovy3l/3X0qTR58oAioggqQNLHK++nhLne
 JTdParGBFtO35r3twGwU7MjejuvYwSHx0sDn1WAWNEz/qtnwqmNjF/ZLrXz6gLOgI3RH
 GNDg==
X-Gm-Message-State: AFqh2kp3gHNHLJnYv0sgseyzxyCV1muvM6iahzhlztWvxE8K9Vlc2Hk7
 lXJP2afKVJNGhxAMN009JFk=
X-Google-Smtp-Source: AMrXdXt45+koOLdg7WkWVuXyCH9JMIXYsbmfdjeRv0hUdjOfPc/eqO1XzGfCc9tGBAYRQkxdVQZgQA==
X-Received: by 2002:a17:907:1b0b:b0:7c1:6344:84a with SMTP id
 mp11-20020a1709071b0b00b007c16344084amr7096364ejc.5.1671719093335; 
 Thu, 22 Dec 2022 06:24:53 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a17090649ce00b00835dababb9fsm283580ejv.214.2022.12.22.06.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:24:53 -0800 (PST)
Message-ID: <1c3b18ad-350f-e862-de98-a775e11e132c@gmail.com>
Date: Thu, 22 Dec 2022 15:24:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v6 03/17] dt-bindings: display: dsi-controller: move
 clock-master property
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

The clock-master property is used for the controller and not in the panel,
so move it there.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../bindings/display/dsi-controller.yaml       | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
index ca21671f6..67ce10307 100644
--- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
+++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
@@ -30,6 +30,15 @@ properties:
   $nodename:
     pattern: "^dsi(@.*)?$"

+  clock-master:
+    type: boolean
+    description:
+      Should be enabled if the host is being used in conjunction with
+      another DSI host to drive the same peripheral. Hardware supporting
+      such a configuration generally requires the data on both the busses
+      to be driven by the same clock. Only the DSI host instance
+      controlling this clock should contain this property.
+
   "#address-cells":
     const: 1

@@ -52,15 +61,6 @@ patternProperties:
           case the reg property can take multiple entries, one for each virtual
           channel that the peripheral responds to.

-      clock-master:
-        type: boolean
-        description:
-          Should be enabled if the host is being used in conjunction with
-          another DSI host to drive the same peripheral. Hardware supporting
-          such a configuration generally requires the data on both the busses
-          to be driven by the same clock. Only the DSI host instance
-          controlling this clock should contain this property.
-
       enforce-video-mode:
         type: boolean
         description:
--
2.20.1

