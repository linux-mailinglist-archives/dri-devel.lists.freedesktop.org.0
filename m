Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78A95A17BD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADE610E08E;
	Thu, 25 Aug 2022 17:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555F310E08E;
 Thu, 25 Aug 2022 17:12:08 +0000 (UTC)
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20220825170226epoutp01ad573e1536cf96d15bbbc08b41eb34a0~OpTHvzmH81804018040epoutp01H;
 Thu, 25 Aug 2022 17:02:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20220825170226epoutp01ad573e1536cf96d15bbbc08b41eb34a0~OpTHvzmH81804018040epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1661446946;
 bh=H5qjmEkhNHav4UEfCYN/tXJsmhsEJ9ZrOC8yerWZxiM=;
 h=From:To:In-Reply-To:Subject:Date:References:From;
 b=IR09c4x5VYICQ+mM6pOdU+zuMzGpE+yrpWmLL40j4tUR/HvMc7gShH9AdFvtxZa1B
 KMR33orKINdS5ibJXzKYSkCPIv4yhye3j6+LFEvJvpZw1NajP70tCYb/IAUhvKypbo
 y0l09AhLdvZSgwJJ+ZXVVfMt5vLyenryl/IVnFkA=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20220825170226epcas5p359d20b67550925eb38120a69678e3f49~OpTHdQio_0865908659epcas5p31;
 Thu, 25 Aug 2022 17:02:26 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4MD8Ql5BdJz4x9Pt; Thu, 25 Aug
 2022 17:02:23 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A1.75.53458.F1BA7036; Fri, 26 Aug 2022 02:02:23 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
 20220825170223epcas5p2844759c75c0a43f34867b5d9eeb9b51f~OpTEnzZaG0123701237epcas5p2_;
 Thu, 25 Aug 2022 17:02:23 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220825170223epsmtrp1ac0a7b4fcf006a6bbb7fa953fa6db6fa~OpTEl6LCG0859108591epsmtrp18;
 Thu, 25 Aug 2022 17:02:23 +0000 (GMT)
X-AuditID: b6c32a4a-a5bff7000000d0d2-fd-6307ab1fedac
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 76.65.18644.E1BA7036; Fri, 26 Aug 2022 02:02:22 +0900 (KST)
Received: from alimakhtar03 (unknown [107.122.12.5]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20220825170215epsmtip16b88d77908034382fc3eb32dec10aaa6~OpS9Q1sgP0329403294epsmtip1f;
 Thu, 25 Aug 2022 17:02:15 +0000 (GMT)
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
In-Reply-To: <20220825113334.196908-4-krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH 4/5] dt-bindings: crypto: drop minItems equal to maxItems
Date: Thu, 25 Aug 2022 22:32:14 +0530
Message-ID: <065201d8b8a4$71a33ba0$54e9b2e0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGXYWyYQPva3C8wcpr5uE47k6l8qAKDRA/jAjBsF4quHOeLwA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxTefe/1vQrBPRDlii42FcxAQeoKXgTUKZoXMJFEtyW4BBt4oyi0
 TV/ZxuY2BGRQECkYlVJAwehAmRMUsAJTYGKVigqCghb8sUARxVlAQacrfW7zv++c+53zne+c
 XCHuVi30FCYoNKxaIUsUk05EXauPr9+iE1RsQH3XIrT3mglDv5ROATRQYSNQ7/iQAL0yd+Lo
 bZ0OR4bODAKVtV0TIF3nFIm6J8ZINP20jUKGITNAJcUFALXeTgMoZ2QhKhjIJ9BQ2a8AmUZv
 EShDX06gvOH7OGp6fJZCI61GgMxpoxTK1h2l0P7XxzFU87DH3vh3M4X+yrUI0IBlCkOXGh5g
 qMtoINFZ61MMHepsxlD2uJ5Eo5m7Aao4vgTduLIBjZ3rA2j0Yr4A5Y4/oNDQkZc4eq63a+1p
 sg/XOvqzAL3pOU2ge4VtAB0qtJJoylhKoCrja4DeTqfbZ7LYAJpospFrpczJ0pOAGbu9h2LO
 VN7BmFL9ZYJpmjxMMDqzH3NOf49i6i54M8VZRQKmotGKMTVV2SRzOf8mxtztaSSZ+slBATOQ
 044xtUd/ipofvTNUzsriWLWIVcQq4xIU8WHiyC0x62MCgwIkfpJgtFIsUsiS2DBx+KYov40J
 ifbLiEVfyxKT7akoGceJl68OVSuTNaxIruQ0YWJWFZeokqr8OVkSl6yI91ewmlWSgIAVgXbi
 9p3y4Y67QFUy/9t7aelUKuiYpwWzhJCWwsK8KkoLnIRu9HkAbdUZJB88B7C/T0vwgQ3AGm2J
 QAuEjpIB6w4+bwTwRFXBO5IVwMqqXmKmL0n7wYaKTEcrd/qtKzx3PVcw8zCL3gCLHo6QM3gO
 vRnm3Wx0YIL2hv3VzxzFLnQwzL6ajvPYFZqKHjnyOL0I1j8x4PzgIjj15zHHRO70OtjRsJqn
 eEDrH20OP5DOcoZd0wff8cPhscLTAh7PgSPtZygee0LrvkyKd8bA8teefFoOnxw/BXi8Bl7o
 NhAzFJz2gaeMy3mp2XDvq0cYX+kCszLdeLY3TH96i+DxAqjLyXknykCTwYzzq+oCMOtgD5kP
 RPr3TOrfM6l/z43+f+XDgKgC81kVlxTPcoGqFQr2m//uHatMqgGOf+sb0QDuDz7zbwGYELQA
 KMTF7i6rLhGxbi5xspTvWLUyRp2cyHItINC+eR3uOTdWaf/4Ck2MRBocIA0KCpIGfxIkEXu4
 7F8KYt3oeJmG3cmyKlb9bx0mnOWZijUP7lrT7B9HWw5sccqLjty6zSt+tDV0W6Pt80jRy4jr
 YUs/Cyh4w232LF85/Pe0OuvFAtfAr3rfRFo8Ij6yFFdmzPVQlS5r3hFyO6LMR7P74oH9wRlH
 vJxWS09lXHeuzQlvCnucW1/SPbRybNhdv/1GZ4jkx0+5oSsp6+TzSNUPI0F1k1vaC3q+rzYu
 NFeo+32fXJu7z/bx4CqTdmKToTXLQ/aijO39LUW++Iu2i2s1jZtbfBtrU3VrVId3pSwmu513
 t3+554Ox9dxW57v92b5REQlepnGfyg9TQ8ofK/senB/Y0GvR3plNTG68arKqpkJuTGb3LXNL
 yz/R6xXa35FTOKGIXnBGTHBymcQXV3OyfwBemvMEQAUAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa1BUZRjHe8+ePeewSp0WipdLosyoIw2bFDZPZYg2NKeyscuMJE0jG5xB
 i0XYlSw/EHINBFyE4XJAEBdTV2yGlctCiwhs6AYrqbECCptgsywsYoDUCoOxME18+83z/N7/
 8//wMiJpJuXDHIw/zCvj5XEBlIRs7AxYF7TuIh29tXj6dci7YSLgfKUTgVUzQ8KdWZsY5s29
 InjaWCCCit50EqqMN8RQ0Ouk4PfHUxQ8eWikocJmRnCq/CSCzv5UBMfH/eCkVU2CreonBCZH
 HwnpwhkS8sfui6B1ooGG8c4WBOZUBw3ZBTU0FC2cI0A3alkKbjPT8FfusBisw04CuvQjBNxu
 qaCgwf6QgNLeKwRkzwoUODKPIdCc2wQ3fw2HqeZBBI52tRhyZ0dosFX/I4JpYelWRutSuU5H
 lhgWLXUkDBUaEZQW2ilwtlSSoG1ZQPD0SdpSp+EZBI9bZ6iwEK62shZxU/0ZNFd/YYDgKoXr
 JNc6d5rkCsxBXLMwRHONVzdy5T+UiTmNwU5wOm02xV1X3yK4exYDxTXN/SHmrMevEdzlmu8/
 8o6UbI/h4w5+wytfCY2SHBjruYcSTnl/O5SaRqegnhdzEMNgNgRb7V/lIAkjZfUIay8Oohzk
 tjT3xXfq1PQKe+ALizZ6RbIhbBkxLEsUG4T1mkzKxZ6sRooLq5JcLGV7ES6ZjHKxGxuOy0bH
 lx0P9kNsuT2xzCS7Ed+99Ih0sTv7Bs7uThOt8PPYVPaAdJUTsTKcWbd8SsT646bJCtFKn/XY
 +eePYpfiye7CPfrQFcUL238x0mokFVYFCf8HCauChFUvTiNSi7z5BJUiVqEKTng1nj8iU8kV
 qqT4WFn0IYUOLX/VwEA9MmgfyToQwaAOhBlRgKf7m11ktNQ9Rv7dUV55aL8yKY5XdSBfhgzw
 cv8tx7RfysbKD/Nf83wCr/xvSzBuPinEpqifzSVtiUUNipvBazKw3I08FpFe1A6BR2tiiv3O
 2t8L/zxiZ5jKpH1NEVldlFLSPn7W69a2jPrnsqAq5ISN0QVn5QiWPKdMn5mncYQmb3/m/ZH4
 tfn54oXFLfvGDEyE0dGyXkh6a3DrqPPdsImQkiPr/G1Xw97+RLl581y3ZCQtROmbWJ515YOd
 EpM0+7OXtdf+fjayYhc/MDBb2dxE4/N7kvuqShP21t7f17e7K9j8aX7sGb8N+kl9uYfkks+2
 ItXH9erYtfXeOpOR9G/zM3yRPjRp757eHbNjPtcq1RQ/cKMbwxKTDZd1Wzasuds8T5r39n+5
 x1P20gtR7zTsUFcHkKoD8uBAkVIl/xdrSmadGQQAAA==
X-CMS-MailID: 20220825170223epcas5p2844759c75c0a43f34867b5d9eeb9b51f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220825113347epcas5p3af15bfc91e659e5188a4392f9ff0a640
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <CGME20220825113347epcas5p3af15bfc91e659e5188a4392f9ff0a640@epcas5p3.samsung.com>
 <20220825113334.196908-4-krzysztof.kozlowski@linaro.org>
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
>Subject: [PATCH 4/5] dt-bindings: crypto: drop minItems equal to maxItems
>
>minItems, if missing, are implicitly equal to maxItems, so drop redundant
>piece to reduce size of code.
>
>Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>


> Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
>b/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
>index 676950bb7b37..5b31891c97fe 100644
>--- a/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
>+++ b/Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml
>@@ -24,7 +24,6 @@ properties:
>     maxItems: 1
>
>   clocks:
>-    minItems: 2
>     maxItems: 2
>
>   clock-names:
>--
>2.34.1


