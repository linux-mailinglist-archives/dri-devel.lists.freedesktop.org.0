Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E929FBB30
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 10:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64A110E090;
	Tue, 24 Dec 2024 09:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="I6vW8WMF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A47610E090
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 09:31:48 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241224093147euoutp01dfeaa5e90637526c89c872a3291f275e~UEw37cBDn1501515015euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 09:31:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241224093147euoutp01dfeaa5e90637526c89c872a3291f275e~UEw37cBDn1501515015euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1735032707;
 bh=3Nu/ij16UUT42lqe5Bh1GBTS2K9+BxVpiEpokJla4rg=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=I6vW8WMFg4yzE6lIMlgvWHRT5BSP6wyYlygHxO2AKSlWgBTAlguorfQixWWJpbHqY
 69UwsxSqyUxDgS6wRwPeA4z2semx9C+SEm6FNubMTrnGBFyJKUyWMkoUYHedIcnu5z
 bSvWRxFSrC/X2ENjxMlbNxZ2h8ze0wpMmmDpVBb4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241224093146eucas1p2a8502d1d2cfe9bc9a124c7922a07875e~UEw3SoWR71295412954eucas1p27;
 Tue, 24 Dec 2024 09:31:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id AC.69.20821.28F7A676; Tue, 24
 Dec 2024 09:31:46 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241224093145eucas1p29ab5546f55e59b9b54873f4eb28b7004~UEw2g_yGH2149421494eucas1p2V;
 Tue, 24 Dec 2024 09:31:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241224093145eusmtrp136f912a8d7b273585e3990bf96361e2b~UEw2gEDwc1635616356eusmtrp1J;
 Tue, 24 Dec 2024 09:31:45 +0000 (GMT)
X-AuditID: cbfec7f2-b11c470000005155-1e-676a7f825839
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 31.AB.19920.18F7A676; Tue, 24
 Dec 2024 09:31:45 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241224093144eusmtip27edc20307c19f74a5a9e4811f470707d~UEw1PhWww1893718937eusmtip2C;
 Tue, 24 Dec 2024 09:31:44 +0000 (GMT)
Message-ID: <756031bf-4f81-424d-8cbc-db27ac27f6dd@samsung.com>
Date: Tue, 24 Dec 2024 10:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/19] dt-bindings: power: thead,th1520: Add
 support for power domains
To: Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <db2987c2-53fc-4d3a-b85c-f5683f74e7a0@kernel.org>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHc25v7y24smuBcQQDWtQE5qCaLZ4xonPZ424JUbI5t7noGrhW
 tBTWgo9lC7J2WFgRUBGtqyCywZBSQVoK4TEeoQVs63jJnFSz6FgrjPCocRBg0Isb/31+39/3
 nO/vd3J4HEEHEcxLkqUxcplYKiR8cVPXP45Xvs04KhHdLFqHrHdLMWSc05KoqtmOoeJOOxc5
 ++owNOCZIFD14zsk+qs5E0dDFToSKbsMBHJpnQRyOG6SaFLj5KL+xh8INJ3bCZBpWkUgfecI
 ia5NGnFUZm4EKCv7Jy76tecdNOK04sjVr+GgLO2LaLHJTKKFoRocXfm7lUR1YwVcZNHvR6rW
 C/ibofTE8HckPeZy4XSHeoakm5+W4HSDdoSkNQ23AV1bmU3Q94eaCPpqdzz94HsLRt8qy6BV
 +i6MzpsX0RMtgwR9tq4S0H3Ku+RewWe+sYmMNOk4I4/e+YXvkcs9Djy1ijrpcf+GnwbnXsgB
 PjxIvQqnMvPwHODLE1AVABqe6jG2mAGwbVC3UkwDWGK7w31+5Bf9DQ7bKAewZ0BJsMU4gFWl
 FeSyi0/thM2LHi/j1GbYVtiLs/pa2H35kZcDqTD44N4lr8efSoCGCyqwfFEAVYVD92i5N45D
 1QNovc1nOQjee1SMLTNBbYcPy4u9Hp+lMI/tyYo/DCqNV7zjQWrQFzovOXB27rfhxEIxybI/
 dFvqVng97D2vWfGkwIfGKQ7LX8MGjWWF34D37bNLa/KWAiKgoTGalXfDOtcUd1mGlB8cHl/L
 juAHz5mKOKzMh+osAeveAgs1uf+F2itMWD4Qale9inbVktpVy2j/zy0BeCUIYtIVyRJGsU3G
 nIhSiJMV6TJJVEJKci1Y+ue9C5YpM9C5J6PaAcYD7QDyOMIAfrsgSSLgJ4pPfcXIUw7J06WM
 oh2E8HBhEH9zYhgjoCTiNOYYw6Qy8uddjOcTfBoLTy4jZJqIgCewpn7c7fjgkLo25eTPswPv
 H9TEqDnHEuOSWo3K2Iw4Zn9Bx7XGaZMh0lgzL95nK61urd2z4cvcgmFjaHiCPfxi/2tZMdXm
 lut+W7v9v/n4IJkTOJJ54Drn02j61Oh7M3tvGT8/YFUe3ze6K7+Fd/Qt7rO0wvlN2/02SPK3
 WNUqaWpoiOhMdo858HWRcmvR2egTzPo/F8esCzHrdJHWGCYi8Pfw3PjDsrm+D6mx6cd/0Klt
 6k8MF7UZwRVxe8yTO4iIJtuNNRtjz88erncWeXYEaD/a9S5s320Sr6n8MUFYb9cZ8mwvWTeO
 hszpx0SF0njly1JQKTvzLFaIK46It0Vy5Arxv1AwNKtWBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsVy+t/xe7qN9VnpBjsvqFicuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLM6f38Bu
 8bHnHqvF5V1z2Cw+9x5htNj2uYXNYu2Ru+wWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLmHnqPEvBGoGKr69usjQwTuLpYuTkkBAwkTiwdjUziC0ksJRR4s/kDIi4
 jMS17pcsELawxJ9rXWxdjFxANa8ZJda/fwGW4BWwk9j7/ys7iM0ioCpxcOppqLigxMmZT8Bs
 UQF5ifu3ZoDVCAskS6yf0sIIMkhEYA2LxNV3U1lBHGaB7YwSG2ZOZYRY8ZdRYvasB2wgLcwC
 4hK3nsxnArHZBIwkHiyfzwpicwKt/nr2NZDNAVSjLrF+nhBEubxE89bZzBMYhWYhOWQWkkmz
 EDpmIelYwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzB9bTv2c/MOxnmvPuodYmTiYDzE
 KMHBrCTCe0goM12INyWxsiq1KD++qDQntfgQoykwMCYyS4km5wMTaF5JvKGZgamhiZmlgaml
 mbGSOK/b5fNpQgLpiSWp2ampBalFMH1MHJxSDUyyD578OngpN8Ep9mTI6yWnJVyu7LjjdIxr
 fXGHXfl6JTajex57jqW8OfXpyyku+X7J1PxPYSvEVzytu3T06NysfeYam36c1fpSf6i4NKSI
 8/H1Z0YHfJf2dLJq1Of3TXu8xi3j1SNz8akOd2XKTxl2745dv2q3RVid29QJotETtxmU87wv
 PLgtKzczJnbaY7NNRn8sKl590T+n1yjaWvj09tsnT4R9szMKUw/LMgvu3twY2iXm8YSDf0GE
 ob/y0kL+Tf+uWa0IzF/CrnFx2i4/2+UOOi/2Lgnhj1u9o9uDZ///veKKUeVhuhl/9NbMFU9X
 Oe4hFjOz4PWHTnXlogXfJJ9tfaGUGLO2+/quC7FKLMUZiYZazEXFiQALa9nU6AMAAA==
X-CMS-MailID: 20241224093145eucas1p29ab5546f55e59b9b54873f4eb28b7004
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
 <CGME20241223125604eucas1p26b870756eeaf2a5666b70de3f7554c13@eucas1p2.samsung.com>
 <20241223125553.3527812-4-m.wilczynski@samsung.com>
 <db2987c2-53fc-4d3a-b85c-f5683f74e7a0@kernel.org>
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



On 12/23/24 17:09, Krzysztof Kozlowski wrote:
> On 23/12/2024 13:55, Michal Wilczynski wrote:
>> +  compatible:
>> +    const: thead,th1520-pd
>> +
>> +  "#power-domain-cells":
>> +    const: 1
>> +
>> +additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - "#power-domain-cells"
>> +
>> +examples:
>> +  - |
>> +    firmware {
> 
> Drop
> 
>> +        aon: aon {
>> +            compatible = "thead,th1520-aon";
>> +            mboxes = <&mbox_910t 1>;
>> +            mbox-names = "aon";
> 
> Drop aon node... but the main problem is you do not have any resources
> in your power-domain device node, assuming your binding is complete.
> This suggests that this is part of aon, not separate device. Fold the
> device node into its parent (so everything goes to AON).

Merging everything to AON node would definitely work. I was looking at
the other implementations of firmware protocols for example, and that's
how I figured the current implementation:

arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
soc {
	firmware: firmware {
		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
		mboxes = <&mailbox>;

		firmware_clocks: clocks {
			compatible = "raspberrypi,firmware-clocks";
			#clock-cells = <1>;
		};
	};

	power: power {
		compatible = "raspberrypi,bcm2835-power";
		firmware = <&firmware>;
		#power-domain-cells = <1>;
	};
};

This is fairly similar, as the firmware is passed as property, instead
as in a parent-child relationship. Would you consider it more canonical
?

I would be happy to merge everything to AON node, and merge the
power-domain driver and AON driver together, but it seemed to me like
those could use some separation, and since power-domain and the AON
represent actual HW it's fine to represent them in the device tree.

Thanks,
Michał
> 
>> +
>> +            pd: power-domain {
>> +                compatible = "thead,th1520-pd";
>> +                #power-domain-cells = <1>;
>> +            };
>> +        };
>> +    };
> 
> Best regards,
> Krzysztof
> 
