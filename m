Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD8233202
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 14:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD90C6E8E4;
	Thu, 30 Jul 2020 12:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 865DB6E8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 12:28:23 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200730122821euoutp018df95ad260aefa8946e2b2c19dfdefbc~mh3-129LT0854108541euoutp01d
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 12:28:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200730122821euoutp018df95ad260aefa8946e2b2c19dfdefbc~mh3-129LT0854108541euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1596112101;
 bh=tPSQqM65USa2+bVxBO4NArkt40afTFNoTXwqqkbLnBk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=MAbNtK2Bs0sVsSqi9f8mypAeerjxMtcjvwQcPceAxij5eNkk41aAmffk51bWeB68R
 dtL8vUtyTHQz2+/SqPJqFw0tjadz02pRSIFZUQsRQ4KIh73a+1x27qo/LHeLMj8t0m
 LGB0TZid+sKAwQwvbZdVY1oejo9Am+gtangSsIpU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200730122821eucas1p180f3c9a08f3ebf68b9415e26bdfa404d~mh3-kOryC2255322553eucas1p1h;
 Thu, 30 Jul 2020 12:28:21 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 82.B5.05997.5ECB22F5; Thu, 30
 Jul 2020 13:28:21 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200730122820eucas1p11e7d3107b447fb0db19c6070c40f6807~mh3-JCeMB1440914409eucas1p17;
 Thu, 30 Jul 2020 12:28:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200730122820eusmtrp2f3aa1a75b1ff97a7f7d8ce02d76d68b9~mh3-HV2ll0062200622eusmtrp2Q;
 Thu, 30 Jul 2020 12:28:20 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-0f-5f22bce5d07f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 03.B5.06017.4ECB22F5; Thu, 30
 Jul 2020 13:28:20 +0100 (BST)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200730122819eusmtip2f5aada00e302856eacee883d0fdd524a~mh3_EbwOQ1715917159eusmtip27;
 Thu, 30 Jul 2020 12:28:19 +0000 (GMT)
Subject: Re: [PATCH RFC v6 1/6] dt-bindings: exynos-bus: Add documentation
 for interconnect properties
To: Rob Herring <robh@kernel.org>, georgi.djakov@linaro.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <65af1a5c-8f8a-ef65-07f8-e0b3d04c336c@samsung.com>
Date: Thu, 30 Jul 2020 14:28:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709210448.GA876103@bogus>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm27nsuFp8rsI3iy7D6K7Zhb4wxEJkBEE/KkNLW3lQSafsqGV/
 nFlq3hILtHVRU8gmpm15yamRqEsqJ11HagvS0iginYHmJc+Okf+e93mf53vf5+XjKNUA483F
 6pJ4vU4bp2YVdEPXhH3bUIs6cnvuwCLivHMZkYcltQx57/rKkNKOHoa8Gf/JkuJWM0uKnIU0
 sdvr5MT8+R1DXjffYslYfgciJfY2GanpGJCTvvQqlsy2NMlJybURNghrzKYrrKb/XQurceba
 ZBpLZZqm4JEJacbMqw+zYYp9UXxcbAqv9ws8pYjJs/ayib9XnH812k4bkG15DvLgAO+CmeEy
 JgcpOBWuQvDZnj5fuBA8mxlCUjGGwGL4Otfh3JZxh0ri7yG4fjV73vELQd1DFyO+uxTHwERj
 HiviZTgAqh3faVFE4UsU5I9UI7HBYn/I7yxwYyUOhMn8j7SIabweCp1P3Xg5joDakUaZpPGE
 7huDbt4Db4WGJ43uYRT2gg+DpTIJr4GM+puUOAzwtBxupA/IpaTBMGS5zUh4KXyzPZrnV8Hs
 Y9EsGjIQ5Fn75FJRiMBpK0OSKgD6eyZZ8QAU3gS1zX4SvR/qZh/LpLssAccPT2mJJVDUUExJ
 tBKyM1WS2gf+mIplEvaG3MFZuhCpjQuiGRfEMS6IY/w/twzRJuTFJwvx0bywQ8ef8xW08UKy
 Ltr3TEK8Gc19uuczNlcTap463Y4wh9SLlWt16yJVjDZFSI1vR8BR6mXKAy+fR6iUUdrUC7w+
 IVKfHMcL7WglR6u9lDvvjpxU4WhtEn+W5xN5/b+ujPPwNiDDQRyVPawPGnI0tiq0bRut4Sc2
 qG6GWzTHTFNru2t66o1hw8dN90PqbUddb8n1EIv1Z2eW/Vaqj2MysXLRp6QTO6dzvtQQ+Q8u
 be+n3VMVKX6G0PLcii0tTuue3tbR2EMPIuSezqYj5V8iLr4YbRO6Dnt3ZmnGMoMDQp3+bxJi
 1bQQo/XfTOkF7V+3TgYJcAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRmVeSWpSXmKPExsVy+t/xe7pP9ijFG1y4ZmBxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C32PT4GqvF5V1z2Cw+9x5htJhxfh+T
 xdojd9ktbjeuYLP4v2cHu8WMyS/ZHAQ8Nq3qZPO4c20Pm8f97uNMHpuX1Hv0bVnF6PF5k1wA
 W5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRs/u
 C2wF3yQrLn06xNLAeFy0i5GDQ0LAROLrDaEuRi4OIYGljBLHDv5jhYhLScxvUepi5AQyhSX+
 XOtig6h5zyjx9/wUNpCEsECGxLJ9LxhBbBEBa4nVN96wgBQxC7QwS3ydNIMJouMho8SEh4/A
 qtgEDCV6j/aB2bwCdhK/eu+xgNgsAqoSE+4fBLNFBeIklm+Zzw5RIyhxcuYTsDingI7Etv3b
 WUFsZgF1iT/zLjFD2OISt57MZ4Kw5SWat85mnsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFu
 em6xkV5xYm5xaV66XnJ+7iZGYFxvO/Zzyw7GrnfBhxgFOBiVeHgV8hTjhVgTy4orcw8xSnAw
 K4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnMUqLJ+cCUk1cSb2hqaG5haWhubG5sZqEk
 ztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgfFYgEeSe7nnmYIsSVOn+9f+7jUsNOv1Ufd4vMDx
 urj6lEv/3764rhHgaSoQULr6n9DpnqP9j87tDW8NvRzltlrExfTt91ZTVWeROZ0ec6RVP/Tn
 hz3Y/H71TqsLhxXLLSw3tBzzypHavpMp7OjMm44cUW0q/NGvJnnJScy3ZpqyeULi/sse65VY
 ijMSDbWYi4oTAWMBGHQBAwAA
X-CMS-MailID: 20200730122820eucas1p11e7d3107b447fb0db19c6070c40f6807
X-Msg-Generator: CA
X-RootMTR: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3
References: <20200702163724.2218-1-s.nawrocki@samsung.com>
 <CGME20200702163748eucas1p2cf7eab70bc072dea9a95183018b38ad3@eucas1p2.samsung.com>
 <20200702163724.2218-2-s.nawrocki@samsung.com>
 <20200709210448.GA876103@bogus>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, krzk@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDkuMDcuMjAyMCAyMzowNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBKdWwgMDIs
IDIwMjAgYXQgMDY6Mzc6MTlQTSArMDIwMCwgU3lsd2VzdGVyIE5hd3JvY2tpIHdyb3RlOgo+PiBB
ZGQgZG9jdW1lbnRhdGlvbiBmb3IgbmV3IG9wdGlvbmFsIHByb3BlcnRpZXMgaW4gdGhlIGV4eW5v
cyBidXMgbm9kZXM6Cj4+IHNhbXN1bmcsaW50ZXJjb25uZWN0LXBhcmVudCwgI2ludGVyY29ubmVj
dC1jZWxscywgYnVzLXdpZHRoLgo+PiBUaGVzZSBwcm9wZXJ0aWVzIGFsbG93IHRvIHNwZWNpZnkg
dGhlIFNvQyBpbnRlcmNvbm5lY3Qgc3RydWN0dXJlIHdoaWNoCj4+IHRoZW4gYWxsb3dzIHRoZSBp
bnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNpZmljCj4+IGJhbmR3
aWR0aCByZXF1aXJlbWVudHMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxh
LnN3aWdvbkBzYW1zdW5nLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tp
IDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgoKPj4gLS0tCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9kZXZmcmVxL2V4eW5vcy1idXMudHh0ICAgICB8IDY4ICsrKysrKysrKysrKysrKysrKysr
Ky0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2RldmZy
ZXEvZXh5bm9zLWJ1cy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2
ZnJlcS9leHlub3MtYnVzLnR4dAo+PiBpbmRleCBlNzFmNzUyLi40MDM1ZTNlIDEwMDY0NAo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9leHlub3MtYnVz
LnR4dAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGV2ZnJlcS9l
eHlub3MtYnVzLnR4dAo+PiBAQCAtNTEsNiArNTEsMTMgQEAgT3B0aW9uYWwgcHJvcGVydGllcyBv
bmx5IGZvciBwYXJlbnQgYnVzIGRldmljZToKPj4gIC0gZXh5bm9zLHNhdHVyYXRpb24tcmF0aW86
IHRoZSBwZXJjZW50YWdlIHZhbHVlIHdoaWNoIGlzIHVzZWQgdG8gY2FsaWJyYXRlCj4+ICAJCQl0
aGUgcGVyZm9ybWFuY2UgY291bnQgYWdhaW5zdCB0b3RhbCBjeWNsZSBjb3VudC4KPj4gIAo+PiAr
T3B0aW9uYWwgcHJvcGVydGllcyBmb3IgaW50ZXJjb25uZWN0IGZ1bmN0aW9uYWxpdHkgKFFvUyBm
cmVxdWVuY3kgY29uc3RyYWludHMpOgo+PiArLSBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQ6
IHBoYW5kbGUgdG8gdGhlIHBhcmVudCBpbnRlcmNvbm5lY3Qgbm9kZTsgZm9yCj4+ICsgIHBhc3Np
dmUgZGV2aWNlcyBzaG91bGQgcG9pbnQgdG8gc2FtZSBub2RlIGFzIHRoZSBleHlub3MscGFyZW50
LWJ1cyBwcm9wZXJ0eS4KPiAKPiBBZGRpbmcgdmVuZG9yIHNwZWNpZmljIHByb3BlcnRpZXMgZm9y
IGEgY29tbW9uIGJpbmRpbmcgZGVmZWF0cyB0aGUgCj4gcG9pbnQuCgpTaG91bGQgd2UgbWFrZSBp
dCB0aGVuIGEgY29tbW9uIGludGVyY29ubmVjdC1wYXJlbnQgcHJvcGVydHk/IFBlcmhhcHMgYWxs
b3dpbmcKYWxzbyBhIHNlY29uZCBjZWxsIGFmdGVyIHRoZSBwaGFuZGxlIHRvIGluZGljYXRlIHRo
ZSB0YXJnZXQgaW50ZXJjb25uZWN0IGlkPwoKQ3VycmVudGx5IHRoZSBsaW5rcyBhcmUgb25seSBi
ZWluZyBkZWZpbmVkIGluIGRyaXZlcnMsIEknbSBub3Qgc3VyZSBpZiB3ZSB3YW50IAp0byBnbyB0
aGF0IGRpcmVjdGlvbiBhbmQgZXh0ZW5kIHRoZSBpbnRlcmNvbm5lY3QgYmluZGluZyBzbyBpdCBp
cyBwb3NzaWJsZQp0byBkZWZpbmUgYW55IGxpbmsgYmV0d2VlbiB0aGUgbm9kZXMuCgpXaXRoIHRo
ZSBzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQgcHJvcGVydHkgdGhlcmUgd2FzIGFuIGFzc3Vt
cHRpb24gdGhhdAplYWNoIERUIG5vZGUgKCJzYW1zdW5nLGV4eW5vcy1idXMiIGNvbXBhdGlibGUp
IGNvcnJlc3BvbmRzIHRvIGFuIGludGVyY29ubmVjdCAKcHJvdmlkZXIgd2l0aCBzaW5nbGUgaW50
ZXJjb25uZWN0IG5vZGUuIFRoZSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIG5vZGUgaWQgCmZvciB0
aGUgbGluayB3ZXJlIHVuc3BlY2lmaWVkIGFuZCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYnkgdGhl
IGRyaXZlci4KCkkgZ3Vlc3Mgd2UgZG9uJ3Qgd2FudCBhIHByb3BlcnR5IHRoYXQgd291bGQgY29u
dGFpbiBwYWlycyBvZiB0aGUgaW50ZXJjb25uZWN0IApub2RlIHNwZWNpZmllcnMgKHBoYW5kbGUg
KyBpbnRlcmNvbm5lY3QgaWQpIHRvIGRlZmluZSBhbGwgbGlua3MsIHNpbmNlIHVzdWFsbHkgCmFk
ZGl0aW9uYWwgZGF0YSBpcyByZXF1aXJlZCBwZXIgZWFjaCBsaW5rLgoKVGhlbiBwZXJoYXBzIHdl
IGNvdWxkIG1ha2UgdGhlIG5ldyBpbnRlcmNvbm5lY3QtcGFyZW50IHByb3BlcnR5IGFwcGxpY2Fi
bGUKb25seSB0byBEVCBub2RlcyB3aXRoICNpbnRlcmNvbm5lY3QtY2VsbHMgPT0gMCwgaS5lLiB2
YWxpZCBvbmx5IGluIHN1Y2ggRFQgCm5vZGVzPwoKPj4gKy0gI2ludGVyY29ubmVjdC1jZWxsczog
c2hvdWxkIGJlIDAuCj4+ICstIGJ1cy13aWR0aDogdGhlIGludGVyY29ubmVjdCBidXMgd2lkdGgg
aW4gYml0cywgZGVmYXVsdCB2YWx1ZSBpcyA4IHdoZW4gdGhpcwo+PiArICBwcm9wZXJ0eSBpcyBt
aXNzaW5nLgo+IAo+IFlvdXIgYnVzIGlzIDgtYml0cyBvciA0LWJpdHMgYXMgdGhlIGV4YW1wbGU/
CkJ1cyB3aWR0aCBtaWdodCBub3QgYmUgYSBnb29kIHRlcm0gZm9yIHRoZSBpbnRlbmRlZCBwdXJw
b3NlIG9mIHRoYXQgcHJvcGVydHkuCkl0IGhhcyBiZWVuIGFkZGVkIHRvIHNwZWNpZnkgbWluaW11
bSBidXMgY2xvY2sgcmF0ZSByZXF1aXJlZCBmb3IgZ2l2ZW4gZGF0YQp0aHJvdWdocHV0LiBBZnRl
ciBjaGVja2luZyB0aGUgZG9jdW1lbnRhdGlvbiBhZ2FpbiB0aGUgQVhJIGJ1cyB3aWR0aCBpcwph
Y3R1YWxseSAxMjggYml0cyBldmVyeXdoZXJlIGZvciBpbnN0YW5jZS4gVGhlIGV4YW1wbGUgZGVm
aW5lcyBkYXRhIHBhdGggCmxlZnRidXMgPC0gZG1jIDwtIChtZW1vcnkpIGFuZCBmb3IgbGVmdGJ1
cyB3ZSBoYXZlIGJ1cy13aWR0aD08OD4gYW5kIGZvciBkbWMgCmJ1cy13aWR0aD08ND4uIAoKUGVy
aGFwcyBpdCdzIGJldHRlciB0byB1c2UgYSB2ZW5kb3Igc3BlY2lmaWMgcHJvcGVydHkgaW5zdGVh
ZCwgZS5nLgpzYW1zdW5nLCBkYXRhLWNsb2NrLXJhdGlvPwoKLS0gClRoYW5rcywKU3lsd2VzdGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
