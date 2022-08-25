Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C735A17AE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266DC10E034;
	Thu, 25 Aug 2022 17:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 489 seconds by postgrey-1.36 at gabe;
 Thu, 25 Aug 2022 17:07:05 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B655F10E034;
 Thu, 25 Aug 2022 17:07:05 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20220825165853epoutp0376c7fc9145c4cbd0e89f42de1de29f31~OpQBu3S_U0527805278epoutp03q;
 Thu, 25 Aug 2022 16:58:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20220825165853epoutp0376c7fc9145c4cbd0e89f42de1de29f31~OpQBu3S_U0527805278epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1661446733;
 bh=OMyDqczPCjBQ5hZ5/u7crpFO3U2v0uzdYp2Hee2GiXE=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=KLlmvA6iBkGaJfHVkjrgAiOmx/cbbjRu6KeNG232POEwMC1hoCtkLAolisykmbpfQ
 pvew6z9R3GTwPxfPKOG3ZB9G1uVXi97IA2XTGcEmvcjcgbAQnVpH112N5r+HL0GXBr
 d+cHIU4FokBlYPqzrKdPDimeevqpPEiFx1sMb3M4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20220825165853epcas5p433396725314642f23d47ce218efe29f5~OpQBdbDvd1748817488epcas5p47;
 Thu, 25 Aug 2022 16:58:53 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.179]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4MD8Lf4Lmlz4x9Pt; Thu, 25 Aug
 2022 16:58:50 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 94.45.53458.A4AA7036; Fri, 26 Aug 2022 01:58:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20220825165849epcas5p2a0a1aac7792d9381224c80115b4b7964~OpP9utYva0308503085epcas5p2e;
 Thu, 25 Aug 2022 16:58:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220825165849epsmtrp259aa9e06d50ff43e8719ed90427ff89e~OpP9p0Dk-0656806568epsmtrp2E;
 Thu, 25 Aug 2022 16:58:49 +0000 (GMT)
X-AuditID: b6c32a4a-a5bff7000000d0d2-a5-6307aa4a428d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 23.04.14392.94AA7036; Fri, 26 Aug 2022 01:58:49 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220825165839epsmtip200d6a12a7d79ea5649d0edd621977dbe~OpP0i7oRW0488104881epsmtip22;
 Thu, 25 Aug 2022 16:58:39 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Rob
 Herring'" <robh+dt@kernel.org>, "'Krzysztof Kozlowski'"
 <krzysztof.kozlowski+dt@linaro.org>, "'Kunihiko Hayashi'"
 <hayashi.kunihiko@socionext.com>, "'Masami Hiramatsu'"
 <mhiramat@kernel.org>, "'Damien Le Moal'"
 <damien.lemoal@opensource.wdc.com>, "'Michael Turquette'"
 <mturquette@baylibre.com>, "'Stephen Boyd'" <sboyd@kernel.org>, "'Geert
 Uytterhoeven'" <geert+renesas@glider.be>, "'Sylwester Nawrocki'"
 <s.nawrocki@samsung.com>, "'Tomasz Figa'" <tomasz.figa@gmail.com>, "'Chanwoo
 Choi'" <cw00.choi@samsung.com>, "'Vladimir	Zapolskiy'" <vz@mleia.com>,
 "'Herbert Xu'" <herbert@gondor.apana.org.au>, "'David S. Miller'"
 <davem@davemloft.net>, "'Andrzej Hajda'" <andrzej.hajda@intel.com>, "'Neil
 Armstrong'" <neil.armstrong@linaro.org>, "'Robert Foss'"
 <robert.foss@linaro.org>, "'Laurent Pinchart'"
 <Laurent.pinchart@ideasonboard.com>, "'Jonas Karlman'" <jonas@kwiboo.se>,
 "'Jernej	Skrabec'" <jernej.skrabec@gmail.com>, "'David Airlie'"
 <airlied@linux.ie>, "'Daniel	Vetter'" <daniel@ffwll.ch>, "'Rob Clark'"
 <robdclark@gmail.com>, "'Abhinav Kumar'" <quic_abhinavk@quicinc.com>,
 "'Dmitry Baryshkov'" <dmitry.baryshkov@linaro.org>, "'Sean Paul'"
 <sean@poorly.run>, "'Inki Dae'" <inki.dae@samsung.com>, "'Seung-Woo Kim'"
 <sw0312.kim@samsung.com>, "'Kyungmin Park'" <kyungmin.park@samsung.com>,
 "'Thierry	Reding'" <thierry.reding@gmail.com>, "'Jonathan Hunter'"
 <jonathanh@nvidia.com>, "'Masahiro Yamada'" <yamada.masahiro@socionext.com>,
 "'Florian Fainelli'" <f.fainelli@gmail.com>, "'Linus Walleij'"
 <linus.walleij@linaro.org>, "'Andre	Przywara'" <andre.przywara@arm.com>,
 "'Kuninori Morimoto'" <kuninori.morimoto.gx@renesas.com>, "'Yoshihiro
 Shimoda'" <yoshihiro.shimoda.uh@renesas.com>, "'Marek Vasut'"
 <marex@denx.de>, "'Krishna	Manikandan'" <quic_mkrishn@quicinc.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-ide@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
In-Reply-To: <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
Date: Thu, 25 Aug 2022 22:28:38 +0530
Message-ID: <065101d8b8a3$f25534c0$d6ff9e40$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXYWyYQPva3C8wcpr5uE47k6l8qAEvQs6pAVXFqBGuLlvmkA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHd25vbyuueq0yj/jW1WGCDqRYugcnviDO69tSmcmWZQlrypUy
 Stu14HRfhoJARR1VY7AgChhBwjQyQUU6y6uiQ+YQFIOAwoatBRSQUURd4eLmt/9znt//PC8n
 R8gTnxP6CGN08axRp9JKKS+yrNrPz39TkUAdWOGeCwdv1xNQmONG0JE/SMK9oR4+vGxo5MGb
 MgsPshuTSThZc5sPlkY3BXdf9FMw2lcjgOyeBgQnsg4jqL6/F0G6cx4c7sggoefkOQT1rmYS
 kq15JBx68ogHtqelAnBWlyNo2OsSgNlyWgBHxwoIKOlq8Vx8rUEAzw+086Gj3U1A3eXHBDSV
 Z1NQ6ugjILPxNwLMQ1YKXCl7EOQXLIY7N9dD/5UHCFyVGXw4MPRYAD25IzwYsHpq7bN5mqt2
 pfLhdcsFEh4eqUGQecRBgbs8h4Si8jEEb0aTPD21DyJ4YRuk1siZ4pxixPTf3ydgLp5tJZgc
 6w2SsQ2fIhlLgz9zxfpQwJTZfZmstON8Jr/CQTAlRWaKuZHxJ8G0tVRQzKXhTj7TkX6dYH49
 /ZNyztexKzWsKoo1SlidWh8Vo4sOlW7+InJdZLAiUOYvC4FPpBKdKo4NlYZvUfp/FqP1vIxU
 slOlTfAcKVUmk3TZqpVGfUI8K9HoTfGhUtYQpTXIDQEmVZwpQRcdoGPjV8gCA4OCPeC3sZo9
 lXl8Q9miXfZrhVQiyl24H00RYlqO25qdvP3ISyimryL8j31sMhhA2NXbJOCCYYQHbqYSby0H
 R12TCRvCd1rvTgYOhNuSnk5QFO2PL+enUOOJWfSbGfjKHwf444kp9Hr8t6VzQs+kt2Bn9diE
 gaR9sWOEY0R0CB44fXRSz8D1x7vJcc2jF+JLvdk8rg0Jdv91ZoKZRYfh4v5WimNmY0dtjYBj
 Eqdi96UwTofjyqEixOmZ2Hn94iTjgwf7bB6v0KMZnDfmwx1rcG/B+Ul8NbbfzSbHER7th8+X
 L+MqTcMHX3YTnFOE01LEHO2Lk/qaSU7PxZb0dD6nGdydZeZzq2pCuOlxOcpAEus7Q1rfGdL6
 zjDW/yufQmQRmsMaTHHRrCnYEKRjf/jvwdX6uBI08XGXbLqMHnU+C6hChBBVISzkSWeJVtSR
 arEoSrX7R9aojzQmaFlTFQr2bN7C8/FW6z0/XxcfKZOHBMoVCoU8ZLlCJp0tOroUqcV0tCqe
 jWVZA2t86yOEU3wSiY120/a2D96L7p938ZVeoTwRcXb+q+alUb8wle9D6+6PnD8/mJ90XbzO
 qyT0jmF6dJctjV+2YKZ5jXyqLjyo1vnNvEDv9DFDrqT0tmJ7i70w4ssjg7F1ibU3d9WHGfSf
 31L+vvyMd2RXKml96mf4vvXjkSHzVUrbl9aVXCd/1TXityHzw+T2J4YZKZ8WdHducw7QayoC
 XnfFlKQe29YS8exE0VrJhu6s3vNTF6hH98dOz5ftUIoVdrAMPB/WnDvmW6xZfW1x354drsKt
 mZYq1LLX7NWzsXHRoYpbDr9tO+O+K/mqobQxYrP3etGocrhsU5gWpa0ipj2ff29r7YVIzbHw
 oELRVilp0qhkS3hGk+pf6qEjq0EFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se1BUdRTH+903zFC31dy76Ay2RY00LBBYx6LHWOrN0YacsdSmdIM7YC4P
 d4UoNZCEZAFhXWeUFRdhGYUNHUF5JsHyEmxgy1wEBllds2VxleQVu/KIVxP/fed8v+dzvn8c
 BhelU97M3pgDgjJGrpBSnkRlk9TH/yMjHR6oaRNBVmc7BsV6FwKrYYSA26N2Ep52mHGYqdTg
 kGc+SkB+cycJGrOLgltjQxS4HzfTkGfvQHD2zAkETd0pCDIGV8EJaw4B9vxLCNqdFgKO6goJ
 OD5wD4e6hxU0DDbVIuhIcdKQrimi4eTkBQzK73fNgus7aHiS2U+Ctd+FQWu1DYM/avMoqHA8
 xuC0+RcM0kd1FDjTjiAwXHgFfr+xAYZqehE4TTkkZI7aaLAXTOAwrJu9lVo3W67J+SMJ011l
 BNzRNiM4rXVQ4KrVE2CsnUQw4/5htlP/CIKxuhHq/RC+VF+K+KHuVJq/WtKD8XpdG8HXjZ8j
 eE2HP1+ju0PzlQ2+/JljuSRvuObA+HJjOsW35dzE+L6uaxRfNX6X5K0Z1zH+SlFSmGSXZ2iE
 oNibICgD3t3jGXXEVEjGVb6U2FBfTCWjAh818mA4NoTLcjtpNfJkROzPiEuZqMAXjJXc7bIc
 ekEv40qm7YshO+LOD02iOYNi/blqQxo1p5ezBhGnzY9fCJkRN3XWNh/yYDdwf2nuknN6GbuF
 G2yaxOY0wfpyjonM+bkXu44bLjq5qJ/n2nP/JNSIYXBWxqWVzWNw1oerepS3WG4153pwnly4
 u54rHeqhFjJiztHSTOcgkW4JSfc/SbeEpFuycQ4RRiQR4lTRkdGqoLigGOEbmUoerYqPiZSF
 x0aXo/lv9VtTjaqMf8saEcagRsQxuHS511utRLjIK0L+7XeCMna3Ml4hqBrRSoaQir1+U7fv
 FrGR8gPCPkGIE5T/uRjj4Z2MtTy8sv6F7Fc3iddad7FVM7KLhCqJLM5VUtXW1e5AanpfZtVA
 7GduS5RYbpR9EWN+5nt3fO+aG//05X2V25JhORg8lfJpyZf73QEE+/HUdoeCv0lrj7l2hFV7
 Pxvek2o7eGh76HhWiOnSG/UKS6rpTW3Uh2GKnS9GvLPftuKiwbLOEKBsiP0g2yzr85XUX06s
 77aJX1t7VevXKj/MDDR73N/69eSDwGTpqdeDJMOHtv6a1hp8vHWV4afLuhTpxudaYsMLPe8J
 vcHbkvS0YuOW8c7QFYlPbr0syQ5JV2/TH35bLZrakVBQLg7YU5MQmbq51rbz87Hr/uJPcJOF
 lhS/F/oo7KmUUEXJg/xwpUr+LzHx7rgcBAAA
X-CMS-MailID: 20220825165849epcas5p2a0a1aac7792d9381224c80115b4b7964
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220825113348epcas5p35a52fd40abce06847a43de45ea156df6
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <CGME20220825113348epcas5p35a52fd40abce06847a43de45ea156df6@epcas5p3.samsung.com>
 <20220825113334.196908-3-krzysztof.kozlowski@linaro.org>
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



>-----Original Message-----
>From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>Sent: Thursday, August 25, 2022 5:04 PM
>To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
><krzysztof.kozlowski+dt@linaro.org>; Kunihiko Hayashi
><hayashi.kunihiko@socionext.com>; Masami Hiramatsu
><mhiramat@kernel.org>; Damien Le Moal
><damien.lemoal@opensource.wdc.com>; Michael Turquette
><mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Geert
>Uytterhoeven <geert+renesas@glider.be>; Sylwester Nawrocki
><s.nawrocki@samsung.com>; Tomasz Figa <tomasz.figa@gmail.com>;
>Chanwoo Choi <cw00.choi@samsung.com>; Alim Akhtar
><alim.akhtar@samsung.com>; Vladimir Zapolskiy <vz@mleia.com>; Herbert
>Xu <herbert@gondor.apana.org.au>; David S. Miller
><davem@davemloft.net>; Andrzej Hajda <andrzej.hajda@intel.com>; Neil
>Armstrong <neil.armstrong@linaro.org>; Robert Foss
><robert.foss@linaro.org>; Laurent Pinchart
><Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
>Jernej Skrabec <jernej.skrabec@gmail.com>; David Airlie <airlied@linux.ie>;
>Daniel Vetter <daniel@ffwll.ch>; Rob Clark <robdclark@gmail.com>; Abhinav
>Kumar <quic_abhinavk@quicinc.com>; Dmitry Baryshkov
><dmitry.baryshkov@linaro.org>; Sean Paul <sean@poorly.run>; Inki Dae
><inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>;
>Kyungmin Park <kyungmin.park@samsung.com>; Thierry Reding
><thierry.reding@gmail.com>; Jonathan Hunter <jonathanh@nvidia.com>;
>Masahiro Yamada <yamada.masahiro@socionext.com>; Florian Fainelli
><f.fainelli@gmail.com>; Linus Walleij <linus.walleij@linaro.org>; Andre
>Przywara <andre.przywara@arm.com>; Kuninori Morimoto
><kuninori.morimoto.gx@renesas.com>; Yoshihiro Shimoda
><yoshihiro.shimoda.uh@renesas.com>; Marek Vasut <marex@denx.de>;
>Krishna Manikandan <quic_mkrishn@quicinc.com>;
>devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>kernel@vger.kernel.org; linux-ide@vger.kernel.org; linux-
>clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-samsung-
>soc@vger.kernel.org; linux-crypto@vger.kernel.org; dri-
>devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>freedreno@lists.freedesktop.org; linux-tegra@vger.kernel.org
>Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>Subject: [PATCH 3/5] dt-bindings: clock: drop minItems equal to maxItems
>
>minItems, if missing, are implicitly equal to maxItems, so drop redundant
>piece to reduce size of code.
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

> Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 1 -
> .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml  | 2 --
> Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml    | 1 -
> 3 files changed, 4 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>index 0abd6ba82dfd..82836086cac1 100644
>--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
>@@ -23,7 +23,6 @@ properties:
>   clocks:
>     description:
>       Common clock binding for CLK_IN, XTI/REF_CLK
>-    minItems: 2
>     maxItems: 2
>
>   clock-names:
>diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-
>clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-
>usb2-clock-sel.yaml
>index 6eaabb4d82ec..81f09df7147e 100644
>--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-
>sel.yaml
>+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-se
>+++ l.yaml
>@@ -47,7 +47,6 @@ properties:
>     maxItems: 1
>
>   clocks:
>-    minItems: 4
>     maxItems: 4
>
>   clock-names:
>@@ -64,7 +63,6 @@ properties:
>     maxItems: 1
>
>   resets:
>-    minItems: 2
>     maxItems: 2
>
>   reset-names:
>diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
>b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
>index 9248bfc16d48..d5296e6053a1 100644
>--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
>+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
>@@ -34,7 +34,6 @@ properties:
>     const: 1
>
>   clock-output-names:
>-    minItems: 3
>     maxItems: 3
>     description: Names for AP, CP and BT clocks.
>
>--
>2.34.1


