Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 157035A17BA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0510E046;
	Thu, 25 Aug 2022 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2826D10E02F;
 Thu, 25 Aug 2022 17:09:44 +0000 (UTC)
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220825170941epoutp022ef87e36375dbc9e68a6f53ea997101e~OpZdUlmoR0296902969epoutp02T;
 Thu, 25 Aug 2022 17:09:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220825170941epoutp022ef87e36375dbc9e68a6f53ea997101e~OpZdUlmoR0296902969epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1661447382;
 bh=OacBpmGRDqsNjkrx2u5xaY8W1MLNzX6d37+yYizJPCI=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=uXqtI2W2s25AmQbJ4MeNVTwPooY2Id2ZRsVk9fFw9hvQ3EqPADorksjOxVcODcBwX
 zVEoB4ltySlgc19FjOF+Sr8vXfQa34n1baOXYxzbxIQJ8bEP5Iw5UVMJY7mN0V0n77
 2Jz2DmcSXORvGEhQI/PrrprxOgAbKrFVCe3zeKMg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220825170941epcas5p27799c73d198bc31b76e49f8aa058262e~OpZci6KVr0999909999epcas5p23;
 Thu, 25 Aug 2022 17:09:41 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4MD8b64t1Pz4x9Pp; Thu, 25 Aug
 2022 17:09:38 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.26.59633.2DCA7036; Fri, 26 Aug 2022 02:09:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20220825170937epcas5p282c40d4031c94c7642eb3cdf65c5af81~OpZZK4XT20999909999epcas5p2x;
 Thu, 25 Aug 2022 17:09:37 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220825170937epsmtrp1897666625f3833353acce0e58953342a~OpZZEMusp1369413694epsmtrp1D;
 Thu, 25 Aug 2022 17:09:37 +0000 (GMT)
X-AuditID: b6c32a49-06ffe7000000e8f1-66-6307acd2c733
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 44.85.18644.1DCA7036; Fri, 26 Aug 2022 02:09:37 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220825170930epsmtip13f4a6899927070d7a683599d4aa68709~OpZSsHOr81884918849epsmtip1e;
 Thu, 25 Aug 2022 17:09:30 +0000 (GMT)
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
In-Reply-To: <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 5/5] dt-bindings: display: drop minItems equal to maxItems
Date: Thu, 25 Aug 2022 22:39:29 +0530
Message-ID: <065301d8b8a5$747cf310$5d76d930$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXYWyYQPva3C8wcpr5uE47k6l8qAGFGprcAibC4Y6uJSdW0A==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02TeVBTVxTG5773khek2Gek9UrtmKamLh2Q1EAPjmBVKM+20zJ12nEYW5qB
 N8AISZqEikstKlLZWoILGtKggkupiiISiEIVcEEHQkHjMoUgxcZoADW4sFiaEGz973fO+c79
 zrl3roAUHhMECJIVWk6tkKeI+ZOo6sa5cwLbj9DxwZnPRJDf2kzAYeMQAlupi4Lrg3YejLRY
 SBir1pFgsGRSUNLUygOdZYgPVx8P8GG4v4kGg70FwS/FhQgab2xGkHtvBhTaCiiwlxxD0Oy8
 RkGmfj8FP929TULd/VM03Gs0I2jZ7KQhW1dGw47RQwRU/mV1H/x7Cw0P87p4YOsaIuBCTQ8B
 HWYDH045+gnYbaknIHtQzwdn1iYEpYfegT8uR8FA7S0EznMFPMgb7KHBvu8ZCY/0bq+tde7h
 Gp0/8uAf6wkKOrc3Idi93cGHIbORgnLzKIKx4S3umbpcCB7XufgfyNgjxiOIHbixlWarfr1J
 sEb9JYqte7KXYnUtgWytvpNmq89K2OJte3hs6RkHwVaWZ/PZSwXtBPun9QyfNT3p5rG23IsE
 e7Lsh5jpsasXJXHyBE4t4hTxyoRkRWK4+OMVccviQkKDpYHSMHhfLFLIU7lwceQnMYEfJqe4
 X0Ys+k6ekuZOxcg1GvH8iEVqZZqWEyUpNdpwMadKSFHJVEEaeaomTZEYpOC0C6XBwe+FuIXf
 rE7KrrETKgOb3q3LJzNQYUQO8hFgRoadlssoB00SCJnTCBcf+I3yBo8QNjU84XkDlzvQ36Zf
 tFgL9kwUzAhnP+wZLwgZB8JZtiUe5jOBuKY0i+8R+TNjU3BtWx7PU/BhonDWwWHSw1OZGKw/
 Z6U8TDES3O3KG2c/Jgwfd5wgvDwFN+/pHc+TzExs6jOQ3ilEeOjOwfEz/ZmlOMN+mPZqpmHH
 +SbaY4yZDF98se5vytsQiU3mzAmeiu9drJpYJwA7fs5ys8DNLN4/GuBNJ+G+QxXIy4vx2asG
 yiMhmbm4wjzfazUZ54/0Et5OP7wtS+hVS/CW/msTRm9gXW4uz8ssLnmwY+KqOxA+P5yHCpBI
 /9KW+pe21L+0jf5/572IKkfTOZUmNZHThKikCm7Nfw8er0ytROMfd97yGtTZ/SCoAREC1ICw
 gBT7+y28QMUL/RLka9dxamWcOi2F0zSgEPfV68iA1+KV7p+v0MZJZWHBstDQUFnYglCpeJrf
 jndRvJBJlGu51Ryn4tQv+giBT0AGITs5qaJvw6vRC8B26/MxWmXK0ba9cjwprCGoY5blvH12
 cXuLIngg7On1dVGj9UflCv/6FdVxmy6skkztu9VV0rzYXm7b2G7slrS+2cf0+n87li+pjBLO
 Ktsl6BCtWpkPsTb2yhc7j6YPP9/w7HRgWqd/2+trqj5ddd+3vnSmcUkGNYKHIgsjiogvN12Z
 bdmctmX6jP7eGOOUuzmmr+eZ5tyJLto4oC576nzUJ3ne+dWlz9r8XIXKja23376+t3tXa9H6
 lRGTfZfGng3QrAWr/K1tBt/lI47jGVRJ1Kjp8c5oU5W1tuejB7EViWdufq9PP6Bbf63EdTA8
 uUdjPtWbMn9fZHojK6Y0SXLpPFKtkf8LSCD0skEFAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVCTdRy/3/M8e55Bt+tx7PQnmtgO0ygQO+78FuklST3XH0rdWdE/tvAJ
 VoBrExU7Y8mLDME2sJIHBGqksgiDeF2MBCYveoAgIKSMadocDgF5saFCwK6L/z73eft+/viK
 SamO9hUr4w/w6nhFrJz2pqqb5esCu0uZqOBW8zOQ1dlOwPkCN4Jh4yQF16ccInjc0UXCfLWB
 hPyuFAoKrZ0iMHS5aeidHqNh9oGVgXxHB4IzedkImgeOITgxshayh/UUOArLELS7+ihIEX6k
 4OS9WyRY7lcxMNJsRtBxzMWAzlDMwKkn5wio+Kt/ofiPDgYmMm0iGLa5CWipvU3ANXM+DVXO
 BwSc7mogQDcl0OBK+xqB8dwL0H05HMbq/kTgatSLIHPqNgOOH/4h4aGwcCvVsjCu2XVcBHP9
 5RQM5VgRnM5x0uA2F1BgMj9BMD+bvLDJNolg2jJJvxHClRaUIm5sIJXhKksGCa5AaKM4y0wR
 xRk6Ark6YYjhqi9u4PLSc0Wcsd5JcBUmHc216XsI7mZ/Pc3VzNhF3PCJVoL7rTgpYvVH3q/v
 42OVB3n15u0fe8foah2EKp87bDdkkVqUvT0DeYkxG4L79bmiDOQtlrK1CI/Y/qY9whp8vVzP
 eLAPLplzMB6TA+HLlivkokCzgbjWmLYUkLFGKc4pTPCYuhDWDd5bSnux4Tjt7OxSwIfdhU/a
 ppcCFLsB2yczqUUsYV/FvzrLCQ9egdtz7yzwYjHJBuG0crRIk6wfrhnNJz2D1mP33bMiz90w
 rHWcZzyeVdh5ycrokVRY1iT83yQsaxKWJYoQZUKreZUmLjpOs0X1Sjx/KEijiNMkxEcHRe2P
 q0BL3xoQUIvqTeNBTYgQoyaExaRcJnmthYqSSvYpEo/w6v171QmxvKYJrRFT8lWSqxnte6Vs
 tOIA/znPq3j1fyoh9vLVEulXBONbt0zf9Uwk+s9URQIezysZ/qW05bB5fOa+rDLMolVday1y
 SvbMyUKLVGuz1xWv8L2g+awzWZntzv3dus1AZtY1XPgk2Px90tbQXWHJCcjvUe/uHTkXey/5
 hX7VlnhjW5LUNWroS4GnR5tGG40TLe/3qFISLLL6GxtfrnSEWKsHlePM5q0/vcdP72x8N7It
 uebbZ68i5e71R7+QpyeVfRo4YHtIsytf4oZGHcKZmJuS5/2d2rLjEd6K0oY3n7N/mCPq3knG
 tfm19+2YfxyxUdlwKDL4iE9m5dty+5f+m35+yjbdGdf2aV8stq8MNz76ZlP5XfM7WYMFHxwM
 Htpzik2VU5oYxZYAUq1R/Au2jZEwHAQAAA==
X-CMS-MailID: 20220825170937epcas5p282c40d4031c94c7642eb3cdf65c5af81
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220825113350epcas5p3cb0cc2cbf440c7999a160212d9e714f4
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <CGME20220825113350epcas5p3cb0cc2cbf440c7999a160212d9e714f4@epcas5p3.samsung.com>
 <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
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

Hi Krzysztof

I got below messages when replied to all
"
Your mail to 'linux-arm-kernel' with the subject

    RE: [PATCH 4/5] dt-bindings: crypto: drop minItems equal to
maxItems and for [PATCH 3/5] as well

Is being held until the list moderator can review it for approval.

The reason it is being held:

    Too many recipients to the message
"

Are these many "To" addresses are really needed?


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
>Subject: [PATCH 5/5] dt-bindings: display: drop minItems equal to maxItems
>
>minItems, if missing, are implicitly equal to maxItems, so drop redundant
>piece to reduce size of code.
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---


Feel free to add
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


> Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml   | 1 -
> .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 --
> Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 2 --
> .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 --
> .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 1 -
> .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 1 -
> .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 1 -
> .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml  | 1 -
> .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml   | 2 --
> 9 files changed, 13 deletions(-)
>
>diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>index 2ebaa43eb62e..b19be0804abe 100644
>--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>@@ -25,7 +25,6 @@ properties:
>     const: ldb
>
>   reg:
>-    minItems: 2
>     maxItems: 2
>
>   reg-names:
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-
>main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-
>controller-main.yaml
>index 880bfe930830..3b609c19e0bc 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-
>main.yaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.
>+++ yaml
>@@ -66,13 +66,11 @@ properties:
>       2 DSI links.
>
>   assigned-clocks:
>-    minItems: 2
>     maxItems: 2
>     description: |
>       Parents of "byte" and "pixel" for the given platform.
>
>   assigned-clock-parents:
>-    minItems: 2
>     maxItems: 2
>     description: |
>       The Byte clock and Pixel clock PLL outputs provided by a DSI PHY
block.
>diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-
>10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-
>10nm.yaml
>index 716f921e3532..d9ad8b659f58 100644
>--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>@@ -37,7 +37,6 @@ properties:
>
>   qcom,phy-rescode-offset-top:
>     $ref: /schemas/types.yaml#/definitions/int8-array
>-    minItems: 5
>     maxItems: 5
>     description:
>       Integer array of offset for pull-up legs rescode for all five lanes.
>@@ -49,7 +48,6 @@ properties:
>
>   qcom,phy-rescode-offset-bot:
>     $ref: /schemas/types.yaml#/definitions/int8-array
>-    minItems: 5
>     maxItems: 5
>     description:
>       Integer array of offset for pull-down legs rescode for all five
lanes.
>diff --git
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-decon.yaml
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-decon.yaml
>index 921bfe925cd6..6380eeebb073 100644
>---
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-decon.yaml
>+++
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos54
>+++ 33-decon.yaml
>@@ -24,7 +24,6 @@ properties:
>       - samsung,exynos5433-decon-tv
>
>   clocks:
>-    minItems: 11
>     maxItems: 11
>
>   clock-names:
>@@ -59,7 +58,6 @@ properties:
>       - const: te
>
>   iommus:
>-    minItems: 2
>     maxItems: 2
>
>   iommu-names:
>diff --git
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-mic.yaml
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-mic.yaml
>index 7d405f2febcd..26e5017737a3 100644
>---
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos543
>3-mic.yaml
>+++
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos54
>+++ 33-mic.yaml
>@@ -24,7 +24,6 @@ properties:
>     const: samsung,exynos5433-mic
>
>   clocks:
>-    minItems: 2
>     maxItems: 2
>
>   clock-names:
>diff --git
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-
>decon.yaml
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-
>decon.yaml
>index 969bd8c563a5..c06f306e8d14 100644
>---
>a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-
>decon.yaml
>+++
>b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-
>+++ decon.yaml
>@@ -22,7 +22,6 @@ properties:
>     const: samsung,exynos7-decon
>
>   clocks:
>-    minItems: 4
>     maxItems: 4
>
>   clock-names:
>diff --git
>a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
>b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
>index 5d5cc220f78a..210d856b3b57 100644
>---
>a/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yaml
>+++
>b/Documentation/devicetree/bindings/display/samsung/samsung,fimd.yam
>+++ l
>@@ -27,7 +27,6 @@ properties:
>     const: 1
>
>   clocks:
>-    minItems: 2
>     maxItems: 2
>
>   clock-names:
>diff --git
a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>gr3d.yaml
>b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>gr3d.yaml
>index dbdf0229d9f6..4755a73473c7 100644
>--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>gr3d.yaml
>+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-gr3
>+++ d.yaml
>@@ -59,7 +59,6 @@ properties:
>     maxItems: 2
>
>   power-domain-names:
>-    minItems: 2
>     maxItems: 2
>
> allOf:
>diff --git
a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>mpe.yaml
>b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>mpe.yaml
>index 4154ae01ad13..5f4f0fb4b692 100644
>--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-
>mpe.yaml
>+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-mpe
>+++ .yaml
>@@ -42,11 +42,9 @@ properties:
>     maxItems: 1
>
>   interconnects:
>-    minItems: 6
>     maxItems: 6
>
>   interconnect-names:
>-    minItems: 6
>     maxItems: 6
>
>   operating-points-v2:
>--
>2.34.1


