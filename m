Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8525AA29
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 13:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163B96E45C;
	Wed,  2 Sep 2020 11:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260EE6E45C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:23:55 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200902112354euoutp016d96ee3fa8ebb61ebd3abde945b00518~w87bQfBFQ0581605816euoutp016
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 11:23:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200902112354euoutp016d96ee3fa8ebb61ebd3abde945b00518~w87bQfBFQ0581605816euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599045834;
 bh=OtSO6kCDRYzARjt52u8mNHXpNRyAs7EY5ZDWyY0I4u4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NkLqzdPKs6UYEvaWHE1TwMxARf8Y/8XaIF7mRlJHKy0wCLc+qTAjrJ8mslFjq7eT6
 i4118r9JnMzQxqcIYrD8+SayCGCnSmdWC/e8feSLAijWxL+O6rrPTq18/eNvwN257p
 nxHkgl8whKTIweqMlhdQ70i2Xy2tRpkQWtC+pWbQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200902112353eucas1p2782d672dc8e626e6fe9f4e658edf778e~w87aZ8amE2679626796eucas1p2r;
 Wed,  2 Sep 2020 11:23:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id A3.FD.05997.9C08F4F5; Wed,  2
 Sep 2020 12:23:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200902112352eucas1p1a409c435036274b5f6466ceff2b437cc~w87aHLjPq2822728227eucas1p1o;
 Wed,  2 Sep 2020 11:23:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200902112352eusmtrp1d22680c373f1eacedd592cc5d879c179~w87aGMMr_2475724757eusmtrp1L;
 Wed,  2 Sep 2020 11:23:52 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-38-5f4f80c980f5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.9B.06017.8C08F4F5; Wed,  2
 Sep 2020 12:23:52 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200902112351eusmtip1e4fc0a16aed08cc448ebe5f4f51da2dd~w87YzDC-Q1814318143eusmtip1D;
 Wed,  2 Sep 2020 11:23:51 +0000 (GMT)
Subject: Re: [RFT 09/10] arm64: dts: exynos: Correct port of USB-C connector
 node on Exynos5433 TM2
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Lee Jones <lee.jones@linaro.org>, Sangbeom Kim
 <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <021495a9-7a00-eb91-ddfa-885cc2fb5462@samsung.com>
Date: Wed, 2 Sep 2020 13:23:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4eb7d0d9-29e2-9162-4521-10e4422f9c71@samsung.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH89znvoFWLhXtCRszdn7RREFnsmfZ0jlflrsvaoIfyIzWqlck
 QjG9wsDMgHUKQ0EcYcMiiuBGqbFiKyBETEAUK9LOCWw4OlDUBQXf+qLi27hezPj2O+f/P8/5
 n+ThsbaEjeVTzDski9mUqmcj6YbLL3zzPbmrjAkFvwmk0OuhSPf1NoqcKTvNkNJbd1jyZ/Bf
 hhwNxJG3DYcwOdbuZUh36BFLDg49wMTnq+PIQOgSIuHufIq4hnoZcqP5CEvKfBcocqrdz5G9
 Le0cuTiSx5Dr9iBF8u4OY+J2leIlM8W6gJUVW8KVtNhk83Oiy/EjK/b3nmfFh14vJzaGBxlx
 YH8HJbpP5IhFZx1IDLg+Wj3l28gvNkupKZmSJd6wIXLrcKgcb6+IyXpe/wTlImdUAYrgQVgM
 vuMHmQIUyWsFOwLb0ze0WgQR/PHs7oQSQFBdPIzej4T9hawq1CAIVZVSavEIgbuk+p1ruiCB
 vaAWK0KM0MjAq9YgUgosFCLYE36KFRcrzIXX7j5WYY1gAE/5CKcwLcyBQI2TUniGsB4uX71N
 q55o8By+M848HyF8CfdbzEobC7OgcfQIVlkH1mDtu9wgXOPhpTPAqrmXw9vBm5zK0+F+x9kJ
 /hA6Sw7QKufAgP0HrA7nI6iva8Kq8Dn0e8dYZTEeD326OV5tfwWvgy85pQ3CNPhrNFrNMA1+
 avgFq20N5O/Tqu7ZMNBVP/GgDn79PcQWI71t0mG2SdfYJl1j+39vJaIdSCdlyGnJkrzILH23
 QDalyRnm5AWb0tNcaPyrdr7pCJ5Dza82tiGBR/qpmjLjSqOWMWXK2WltCHisj9Es7epcr9Vs
 NmXvlCzpRktGqiS3oQ94Wq/TfFI1vE4rJJt2SNskabtkea9SfERsLirvW6b7u9ewwiA6a6IS
 Xzz2z39cleTZtWaLNV67/59t5MD3RalTDXFLm2/8nD2j9esebmSZPf1kj9ylvWIrr7KeS1ou
 tybsdvOxWb7aphX+vqLRtVTZkm+Koztmfxy3uGewIs+V5Zy3J2fEWhGNu6IOaRodn42dX22s
 TdxU6bhX/6melreaFs7DFtn0Hwm3d2qmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHee7dvbtaw9vUfFJTGRIUON182aOohR/q0gcT+lBoOS9609Bt
 sTujlw+KFtp8SQPBptMgyxfwpc20sgXqytSaRWYUDRWNTFOL+ZJlmUuDffud8z8/DgcOhYvv
 Er7UWbWO06rZHAnpLhj+M2APeZ5/TBnmWESozDaIodHXfRi6V91OoKrJaRK9W/pMoDrHXrTR
 VYmjequNQKPLiyS6PjWHo5GRDiEaX34K0MpoMYZMU2MEevOolkTVI08w1Gq1C9FVi1WI+r8W
 Eeh10xKGij59wZHZVIUf2s10OApIxrJyS8A8NNiFjKnlGsl8HHtMMgs2m5DpXpkgmPGSAYwx
 N+Qx5Z0tgHGYApJ2JEtjtZpcHReUpeF1cZIUGZJLZdFIKo+IlsrCFadj5JGS0PjYDC7n7HlO
 GxqfJs36slyDnzN6Xfhx/zvIB20eeuBGQToCrtjLSD1wp8T0HQDbbw/hW4EP7Kmf32ZPuD6m
 3x6aB7Bp4obAGXjSHGzSN+POwIvuIeC38leEs8DpMgCnPluEW8oMgPdbp0inQtL74W/z+38s
 ouPhYM1XoZMFdDB0NLZhTvamU+GL0pntmV1w8Ob05jqKcqMPwlmL2tnG6ShYZ57EtzgQds/X
 brMPLFhqJiqA2OBiG1wUg4ticFFuAUEL8OJyeVWmipdLeVbF56ozpekalQls/kjXs7XOB0C/
 cLwP0BSQ7BRVKxOVYoI9z19U9QFI4RIvUcLL4VSxKIO9eInTapTa3ByO7wORm7dV4r7e6ZrN
 j1PrlLJImQJFyxThivAoJPERFdO9p8R0JqvjsjnuHKf972GUm28+iLV4RAr62QJrmnbNP652
 qbE775c9sOtKcJJw460HF+JdPgADUhOOrrr7nWkOKmkpPbmmaMiOjir88LOEW09ZnDvxHqtf
 ZZP8jMY7Hb3ZMttDyFE9jtLLQw+g/5sZgbu8uDLM2vg2JynNfCAx/8geq/lwIdzXKamYNcY0
 Ji9LBHwWKzuAa3n2L7MKsL45AwAA
X-CMS-MailID: 20200902112352eucas1p1a409c435036274b5f6466ceff2b437cc
X-Msg-Generator: CA
X-RootMTR: 20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3@eucas1p1.samsung.com>
 <20200829142501.31478-9-krzk@kernel.org>
 <4eb7d0d9-29e2-9162-4521-10e4422f9c71@samsung.com>
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31.08.2020 14:50, Marek Szyprowski wrote:
> Hi Krzysztof,
>
> On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
>> The USB-C connector bindings require port@0.  Such port was already
>> described in DTS but outside of the connector itself.  Put it into
>> proper place to fix dtbs_check warnings like:
>>
>>     arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: musb_connector: ports: 'port@0' is a required property
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> I'm not sure if topic should be about USB-C, I will call it simply USB
> connector node. TM2(e) uses Samsung's 11-pin micro USB 2.0 connector,
> which has nothing in common with USB Type-C.
>
> Anyway, this patch breaks DWC3 (tested in Device mode) driver operation,
> so something has to be somehow adjusted or fixed. Added CC Andrzej
> Hajda, who actually worked on this.
>
>> ---
>>
>> Not tested on HQ. Please kindly review and test.
>>
>> Best regards,
>> Krzysztof
>> ---
>>    .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 +++++++--------
>>    1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index 6246cce2a15e..bab6c1addd5f 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -871,6 +871,13 @@
>>    					#address-cells = <1>;
>>    					#size-cells = <0>;
>>    
>> +					port@0 {
>> +						reg = <0>;
>> +						muic_to_usb: endpoint {
>> +							remote-endpoint = <&usb_to_muic>;
>> +						};
>> +					};
>> +


According to not-yet-yaml documentation of dt-bindings (patch 05/10):
> -Required nodes:
> -- any data bus to the connector should be modeled using the OF graph bindings
> -  specified in bindings/graph.txt, unless the bus is between parent node and
> -  the connector.

This is 'unless' case - muic is parent of the connector, so the port 0 is not necessary.


>>    					port@3 {
>>    						reg = <3>;
>>    						musb_con_to_mhl: endpoint {
>> @@ -879,14 +886,6 @@
>>    					};
>>    				};
>>    			};
>> -
>> -			ports {
>> -				port {
>> -					muic_to_usb: endpoint {
>> -						remote-endpoint = <&usb_to_muic>;
>> -					};
>> -				};


And this port belongs to MUIC - it describes connection between USB-HOST 
and MUIC, it has nothing to do with the connector, and is necessary.


Regards

Andrzej


>> -			};
>>    		};
>>    
>>    		regulators {
> Best regards
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
