Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760219FBB1A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 10:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C4B10E2D1;
	Tue, 24 Dec 2024 09:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="HN1GkHY4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC31A10E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 09:23:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241224092327euoutp012d3dc1deb0413b732d7d4fb725ad8324~UEpmExe0J0972309723euoutp01R
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 09:23:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241224092327euoutp012d3dc1deb0413b732d7d4fb725ad8324~UEpmExe0J0972309723euoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1735032207;
 bh=CT2LjMsvQK3WeyDfvFPXgtfccMOoBoYCxpw/ibKFJpo=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=HN1GkHY4p8oH+1ybH6mEMXkSiQB67tfNPyRL1zdM2I/QvGp28V+jzvfAEfoUt/ekW
 fqY3t2M66s3bG+p5hP2cxzPMZ1YsJKYcnPB0DIyPFj+WoBp7lTFq/3dZUNreZ8vNLy
 adkAOnOTl9Eg90ZbMmoFERELUfzJguao8m24ZJ1k=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20241224092326eucas1p1f4f75608b215db9b334d5565da46c897~UEplaSOUC2771027710eucas1p1G;
 Tue, 24 Dec 2024 09:23:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 2E.0E.20409.E8D7A676; Tue, 24
 Dec 2024 09:23:26 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241224092325eucas1p26ee00a131762a9f84e9e664825badeb2~UEpk8g0gZ1296012960eucas1p2F;
 Tue, 24 Dec 2024 09:23:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20241224092325eusmtrp24c38df110972e48c124839503473da55~UEpk6vi7l2656126561eusmtrp2A;
 Tue, 24 Dec 2024 09:23:25 +0000 (GMT)
X-AuditID: cbfec7f4-c39fa70000004fb9-55-676a7d8ed08f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 68.BA.19920.D8D7A676; Tue, 24
 Dec 2024 09:23:25 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241224092324eusmtip2ab49005b6b39ee6c5c0dcce8544a43bc~UEpjl3rZ-0443004430eusmtip2I;
 Tue, 24 Dec 2024 09:23:24 +0000 (GMT)
Message-ID: <c17c75c0-ef13-48df-9095-67fbf31bb817@samsung.com>
Date: Tue, 24 Dec 2024 10:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/19] dt-bindings: clock: Add VO subsystem
 clocks and update address requirements
To: Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org,
 jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org,
 m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
 matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com,
 p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 ulf.hansson@linaro.org, wefu@redhat.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzeub29t5RVbquGE9mGkumcyQCbZTmKYU6HuRIzWeLGYNlmJzeV
 jYdpRRi4zA3GChaYFLdRkIcW2qDIZluklUcslaJzrSi0gPKYUbY2KKmwOmXAaC9u/Pfle/x+
 3+/k8DgiC7GGl5pxmJFlSNIiCD7e2vPE8Vrpl59Jo12+YNTrOo0h46yaROc67Biqtdq5aPSm
 AUP9f00R6Pz9GyT6s+NrHDl1p0iU39NCILd6lEAOx88k8ipHueiWuZpA0yVWgFqnCwjUbB0h
 Ub3XiCNNmxmgwqJGLuq7FodGRntx5L6l5KBCdQhaaG8j0bzzFxxVPewikWHyBBfZmhNRQVcF
 vv0lemrwW5KedLtxulsxQ9IdvjqcNqlHSFppug7oC01FBH3H2U7QNVffpceO2zBar/mKLmju
 weiyuWh6qnOAoEsNTYC+me8iE0TJ/G0pTFrqEUYWFbuff/C36afEoTNUzvnvnmDHQIOgGATx
 IPU6nBuYw4sBnyeidADWNlbhfkFEzQBY3ghZYRpAvfk0+SwxWOkgWUEL4B9mxVL8AYCTl1yB
 uICKhbcrF7h+jFPrYbXpPsnyQni18l7As5oKh2PDPwX4lVQmHKpTEX68ioqHPcMVhH8oh2ri
 QqPGFTBxqFA4fK8W82OCEsNxbW1gQRD1DrQXDOGsJxzmG6s4/jCk+vhQdc3EZXu/DX3z+qUb
 VkKPzbCEX4ALJnYoXGwxbnzEYfFRaFLalnAMvGN/utiIt7jgVdhijmLpt6BSlQ/8NKRWwMEH
 QrbCClje+iOHpQVQUShi3RvgSWXJf0vtulbsexChXvYq6mVHqpcdo/5/bx3Am0AokyVPlzJy
 cQaTHSmXpMuzMqSRBzLTL4DFb/7rvG2mDWg93kgLwHjAAiCPE7FKYBGlSkWCFMkXuYws8xNZ
 Vhojt4AwHh4RKlifEs6IKKnkMPM5wxxiZM9UjBe05hj2PravL2r7XaHTobYkOCdi+Tu9zUTN
 ur36vJzHow1S5cvn3F292cHwdkZ4b+euLfHJx3e/90pkLFORvPBhpi44JNmx1uvTJJcL6n0l
 /4ROhBd7ijeGJe1ijN4K4YatP4gTTmx78fmaveID9ugwX5r3sfZj8am+3UWhZybtezau/Sjx
 zb8pxdbsSzR0csf3fJCkMXhLW7o6rujO7ujMUU0EhXjqErXjA2+sG5qyttX3KxI8Dd5vcjsv
 f/pcfbuwuvvkjSuzm+3x7os7r+9rsHp23BVPuceOXp480j2bNJK3//e8RIGqrH91XLUmF6U4
 YwqoqosPY/RlW5JUZ+O6zaZNj7AIXH5QsnkTRyaX/AtkeGD+VQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xe7q9tVnpBms/qFucuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLM6f38Bu
 8bHnHqvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLOPv5F1vBYoGKde0/mRoYl/J2MXJySAiYSNyYeZ69i5GLQ0hgKaPEyofL
 WSASMhLXul9C2cISf651sUEUvWaUmHxgGjNIglfATuL2zP+sIDaLgKrEnJ1P2SHighInZz4B
 axYVkJe4f2sGWFxYIF9i7e6ZYPUiAl4Sx25NARvKLLCKVeL82kWsEBsOM0nsW7QBrIpZQFzi
 1pP5TCA2m4CRxIPl88HinAJ+EudabgJt4ACqUZdYP08IolxeonnrbOYJjEKzkNwxC8mkWQgd
 s5B0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iRGYvrYd+7l5B+O8Vx/1DjEycTAeYpTg
 YFYS4T0klJkuxJuSWFmVWpQfX1Sak1p8iNEUGBYTmaVEk/OBCTSvJN7QzMDU0MTM0sDU0sxY
 SZzX7fL5NCGB9MSS1OzU1ILUIpg+Jg5OqQYmsy2SX/ee3/V36nJ1t0U9Lydk9QvJ73/NO1vb
 dNmdsLkeO3gvSTz+HZsv4nVy6/qfAo84WVdqSEnsMNL2i1Q87zhxh7/7wTspj90vSXI9YGiV
 srq4j+2Gwk/xI4knJ2pLLczj1Jj19OnRCKMKAY/M5FqZJmXjKp6Z9etslN6b76qz/JS6s+Bk
 0ZK80N76OZ+urQh8/TbPJHXuQf691osWrW0+cbj9dYJKVlRJ6Y95Lm9Of/kuYx2roVGpmXBF
 +ffLGROZ/z2e6yOcKlR/IdT29sIlL0IV0j+8zjhSfeWA1jOj2bq7Pkdabdhs8UyTax5jrIuK
 S+bVm4ZdlrMOhS86Ycv7f8ud90vZ+Wq2rLl2T4mlOCPRUIu5qDgRAIEEWcXoAwAA
X-CMS-MailID: 20241224092325eucas1p26ee00a131762a9f84e9e664825badeb2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125601eucas1p1d274193122638075dc65310a22616bae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125601eucas1p1d274193122638075dc65310a22616bae
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125601eucas1p1d274193122638075dc65310a22616bae@eucas1p1.samsung.com>
 <20241223125553.3527812-2-m.wilczynski@samsung.com>
 <2cd0c34fbd14a0d69e689d04c2241938.sboyd@kernel.org>
 <wjet4yvtcobjaf7c4u7to6rm3ppkvmgyitp6evoqjpndtno6qg@h5xxyukph6y6>
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



On 12/24/24 09:53, Krzysztof Kozlowski wrote:
> On Mon, Dec 23, 2024 at 12:50:59PM -0800, Stephen Boyd wrote:
>> Quoting Michal Wilczynski (2024-12-23 04:55:35)
>>> The T-Head TH1520 SoC’s AP clock controller now needs two address ranges
>>> to manage both the Application Processor (AP) and Video Output (VO)
>>> subsystem clocks. Update the device tree bindings to require two `reg`
>>> entries, one for the AP clocks and one for the VO clocks.
>>>
>>> Additionally, introduce new VO subsystem clock constants in the header
>>> file. These constants will be used by the driver to control VO-related
>>> components such as display and graphics units.
>>>
>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>> ---
>> [...]
>>> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> index 0129bd0ba4b3..f0df97a450ef 100644
>>> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
>>> @@ -47,7 +54,9 @@ examples:
>>>      #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>>>      clock-controller@ef010000 {
>>>          compatible = "thead,th1520-clk-ap";
>>> -        reg = <0xef010000 0x1000>;
>>> +        reg = <0xef010000 0x1000>,
>>> +              <0xff010000 0x1000>;
>>
>> I don't get it. Why not have two nodes and two devices? They have
>> different register regions so likely they're different devices on the
>> internal SoC bus. They may have the same input clks, but otherwise I
>> don't see how they're the same node.
> 
> That's a good point. Aren't here simply two different clock controllers?

Yeah there are two clock controllers, based on the review comments I was
trying to re-use the driver, but the driver can also be re-used to serve
multiple nodes and multiple compatible and .data properties, if that's
fine with you that's how it will look like in v3.

Thanks,
Michał
> 
> Best regards,
> Krzysztof
> 
> 
