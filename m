Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B999251933
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0D89B06;
	Mon, 24 Jun 2019 16:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C1A89B06
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:59:23 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190624165922euoutp027386e8d832e80092fa982c917fbe13e5~rMP21aiQf0748407484euoutp02S
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:59:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190624165922euoutp027386e8d832e80092fa982c917fbe13e5~rMP21aiQf0748407484euoutp02S
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190624165921eucas1p16a47a6a7040ca2ea49be7dddc544b695~rMP2OhDNb0345903459eucas1p1q;
 Mon, 24 Jun 2019 16:59:21 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 93.31.04325.961011D5; Mon, 24
 Jun 2019 17:59:21 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190624165920eucas1p2ba62121bbb0242e38194d906a1511b61~rMP1IaHAP1830118301eucas1p2w;
 Mon, 24 Jun 2019 16:59:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190624165919eusmtrp12e8a2919976610699a44a22fd2971452~rMP06VFsl2683826838eusmtrp1T;
 Mon, 24 Jun 2019 16:59:19 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-87-5d110169b299
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E9.4A.04140.761011D5; Mon, 24
 Jun 2019 17:59:19 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190624165919eusmtip1d5fa48fb01e17b2fd3abf44e76e35174~rMP0RXp0k3028730287eusmtip1h;
 Mon, 24 Jun 2019 16:59:19 +0000 (GMT)
Subject: Re: [PATCH 4/4] drm/sun4i: Enable DRM InfoFrame support on H6
To: Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Jernej_=c5=a0krabec?=
 <jernej.skrabec@siol.net>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <025bb8b2-8e0d-65ba-a7cc-4d8078f90428@samsung.com>
Date: Mon, 24 Jun 2019 18:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAGb2v67T-nOqxkjekcc1ze9otVrzJb5KEtdJuMMk+dEGgAn1pQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGKsWRmVeSWpSXmKPExsWy7djPc7qZjIKxBo+/s1tc+fqezeL/o9es
 FnMn1Vpc/f6S2eLkm6ssFj/btzBZdE5cwm5xedccNosHL/czWhzqi7b4eeg8k8X6Fn0HHo/3
 N1rZPeatqfbY8Gg1q8fsjpmsHicmXGLyuN99nMnj76z9LB4HeiezeGy/No/Z4/MmuQCuKC6b
 lNSczLLUIn27BK6M3R9eMRUcU6x4fVGjgfGGdBcjJ4eEgInEvmONTF2MXBxCAisYJS7uv8QG
 4XxhlPix8y4LhPOZUeLc9W1AZRxgLQuvJ0DElzNK/L/zEaroLaPEtgc72EDmCgu4SWxctZS9
 i5GdQ0QgVuJOLkgJs8ASFomuxl5WkBI2AU2Jv5tvgpXzCthJrFuwAsxmEVCVOLVlNguILSoQ
 IfFl5yZGiBpBiZMzn4DFOQUCJWbPWQxWzywgL9G8dTYzhC0ucevJfLB3JAT+sks0vpnPAvGn
 i8Scnm9sELawxKvjW9ghbBmJ05N7oGrqJe6vaGGGaO5glNi6YSczRMJa4vDxi6wg3zMDXb1+
 lz5E2FFixyFQCIEChU/ixltBiBv4JCZtm84MEeaV6GgTgqhWlLh/divUQHGJpRe+sk1gVJqF
 5LNZSL6ZheSbWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMbaf/Hf+6g3Hf
 n6RDjAIcjEo8vAuOCMQKsSaWFVfmHmKU4GBWEuFdmggU4k1JrKxKLcqPLyrNSS0+xCjNwaIk
 zlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwJhuZxt15vqFD2ejHT/22E+Zcfl4aUX4lxtcHapO
 70st9k88sy4p5PNu6zCfZSF/LJad2hfEv2Dn+dXBLWlSXlbSSSvFn92tZAsxr/uUol4e/Wj7
 zEvCTd1ZN043/d24ttdS+VnT7J36rcfu6k92yyld3sSj5Nm/p4RVUyftgI5Usvrmd10/9yqx
 FGckGmoxFxUnAgCXz8+raQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xu7rpjIKxBnN3Wlhc+fqezeL/o9es
 FnMn1Vpc/f6S2eLkm6ssFj/btzBZdE5cwm5xedccNosHL/czWhzqi7b4eeg8k8X6Fn0HHo/3
 N1rZPeatqfbY8Gg1q8fsjpmsHicmXGLyuN99nMnj76z9LB4HeiezeGy/No/Z4/MmuQCuKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M3R9eMRUc
 U6x4fVGjgfGGdBcjB4eEgInEwusJXYxcHEICSxkllu46z9TFyAkUF5fYPf8tM4QtLPHnWhcb
 RNFrRol/01+CFQkLuElsXLWUHcQWEYiVOPlmLitIEbPAMhaJJ6dXMkJ0zGSWWLD9ICNIFZuA
 psTfzTfZQGxeATuJdQtWgNksAqoSp7bMZgGxRQUiJGbvamCBqBGUODnzCZjNKRAoMXvOYrB6
 ZgF1iT/zLjFD2PISzVtnQ9niEreezGeawCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGR
 XnFibnFpXrpecn7uJkZgRG879nPLDsaud8GHGAU4GJV4eBccEYgVYk0sK67MPcQowcGsJMK7
 NBEoxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAZJNXEm9oamhuYWlobmxubGahJM7bIXAw
 RkggPbEkNTs1tSC1CKaPiYNTqoFxe535fFGpjVNPz2C8Gy7++tzPC5KlLGcD+A7r/bMSKni3
 uF/o7Gxe+3WvP99+vK5Ubd3T8CPfG6b81pt0V3T7y8+H5pkdt15xpS1+jdI+3pQrc8VW7TVe
 tGmz1xT356oZC1adbP/ys+842/bUF0sPszxSZoy4X/NW0vJQXPvlrilH1qqrTtlkHqjEUpyR
 aKjFXFScCAB4lZGZ/gIAAA==
X-CMS-MailID: 20190624165920eucas1p2ba62121bbb0242e38194d906a1511b61
X-Msg-Generator: CA
X-RootMTR: 20190624160742epcas3p291e57fd4a47043c67cb4fbe1ed301e2f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624160742epcas3p291e57fd4a47043c67cb4fbe1ed301e2f
References: <VI1PR03MB420621617DDEAB3596700DE0AC1C0@VI1PR03MB4206.eurprd03.prod.outlook.com>
 <3f9e51d5-8ca5-a439-943c-26de92dd52fe@samsung.com>
 <CAGb2v67FF3k9wZu7K+Z5yKFFeh8A_4iuEXfh+tO65UvVRfY-sA@mail.gmail.com>
 <44611965.cJa5QBey4U@jernej-laptop>
 <CGME20190624160742epcas3p291e57fd4a47043c67cb4fbe1ed301e2f@epcas3p2.samsung.com>
 <CAGb2v67T-nOqxkjekcc1ze9otVrzJb5KEtdJuMMk+dEGgAn1pQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561395562;
 bh=kKbJkzdhBU9lOffCTViCp1aEU1TW8YWN8Y4kXn1ZRL4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iOat0pfRkwf6Iy+PoI4VeMCgYRdivwnlPVPrrmVdoPHVUvsflpZs2NTUTY4kbDDOC
 72Tz2lSy/foDm1UUNoxvUeoYAXP5WTsHhu9x0jGy80seHJCVgHEZ4KBcZbXXr9s/2K
 7WfO1tnxEN82zZbqvvwaAQCmH/Zmeui4Xr01IEZw=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "zhengyang@rock-chips.com" <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDYuMjAxOSAxODowNywgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI1
LCAyMDE5IGF0IDEyOjAzIEFNIEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5u
ZXQ+IHdyb3RlOgo+PiBEbmUgcG9uZWRlbGplaywgMjQuIGp1bmlqIDIwMTkgb2IgMTc6NTY6MzAg
Q0VTVCBqZSBDaGVuLVl1IFRzYWkgbmFwaXNhbChhKToKPj4+IE9uIE1vbiwgSnVuIDI0LCAyMDE5
IGF0IDExOjQ5IFBNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOgo+
Pj4+IE9uIDI0LjA2LjIwMTkgMTc6MDUsIEplcm5laiDFoGtyYWJlYyB3cm90ZToKPj4+Pj4gRG5l
IHBvbmVkZWxqZWssIDI0LiBqdW5paiAyMDE5IG9iIDE3OjAzOjMxIENFU1QgamUgQW5kcnplaiBI
YWpkYQo+PiBuYXBpc2FsKGEpOgo+Pj4+Pj4gT24gMjYuMDUuMjAxOSAyMzoyMCwgSm9uYXMgS2Fy
bG1hbiB3cm90ZToKPj4+Pj4+PiBUaGlzIHBhdGNoIGVuYWJsZXMgRHluYW1pYyBSYW5nZSBhbmQg
TWFzdGVyaW5nIEluZm9GcmFtZSBvbiBINi4KPj4+Pj4+Pgo+Pj4+Pj4+IENjOiBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+Pj4+Pj4+IENjOiBKZXJuZWogU2tyYWJl
YyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMg
S2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+Cj4+Pj4+Pj4gIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmMgfCAyICsrCj4+Pj4+Pj4gIGRyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW44aV9kd19oZG1pLmggfCAxICsKPj4+Pj4+PiAgMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jCj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfZHdfaGRtaS5jIGluZGV4Cj4+Pj4+Pj4gMzlkODUwOWQ5NmEwLi5iODAx
NjRkZDhhZDgKPj4+Pj4+PiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3Vu
NGkvc3VuOGlfZHdfaGRtaS5jCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1
bjhpX2R3X2hkbWkuYwo+Pj4+Pj4+IEBAIC0xODksNiArMTg5LDcgQEAgc3RhdGljIGludCBzdW44
aV9kd19oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LAo+Pj4+Pj4+IHN0cnVjdCBkZXZpY2Ug
Km1hc3Rlciw+Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgc3VuOGlfaGRtaV9waHlfaW5pdChoZG1pLT5w
aHkpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIHBsYXRfZGF0YS0+bW9kZV92YWxpZCA9IGhkbWktPnF1
aXJrcy0+bW9kZV92YWxpZDsKPj4+Pj4+Pgo+Pj4+Pj4+ICsgICBwbGF0X2RhdGEtPmRybV9pbmZv
ZnJhbWUgPSBoZG1pLT5xdWlya3MtPmRybV9pbmZvZnJhbWU7Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAg
c3VuOGlfaGRtaV9waHlfc2V0X29wcyhoZG1pLT5waHksIHBsYXRfZGF0YSk7Cj4+Pj4+Pj4KPj4+
Pj4+PiAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7Cj4+Pj4+Pj4KPj4+Pj4+
PiBAQCAtMjU1LDYgKzI1Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3VuOGlfZHdfaGRtaV9x
dWlya3MKPj4+Pj4+PiBzdW44aV9hODN0X3F1aXJrcyA9IHs+Cj4+Pj4+Pj4KPj4+Pj4+PiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBzdW44aV9kd19oZG1pX3F1aXJrcyBzdW41MGlfaDZfcXVpcmtzID0g
ewo+Pj4+Pj4+Cj4+Pj4+Pj4gICAgIC5tb2RlX3ZhbGlkID0gc3VuOGlfZHdfaGRtaV9tb2RlX3Zh
bGlkX2g2LAo+Pj4+Pj4+Cj4+Pj4+Pj4gKyAgIC5kcm1faW5mb2ZyYW1lID0gdHJ1ZSwKPj4+Pj4+
Pgo+Pj4+Pj4+ICB9Owo+Pj4+Pj4+Cj4+Pj4+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHN1bjhpX2R3X2hkbWlfZHRfaWRzW10gPSB7Cj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+Pj4+Pj4+IGIvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaCBpbmRleAo+Pj4+Pj4+IDcyMGM1YWE4
YWRjMS4uMmEwZWMwOGVlMjM2Cj4+Pj4+Pj4gMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjhpX2R3X2hkbWkuaAo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV9kd19oZG1pLmgKPj4+Pj4+PiBAQCAtMTc4LDYgKzE3OCw3IEBAIHN0cnVj
dCBzdW44aV9kd19oZG1pX3F1aXJrcyB7Cj4+Pj4+Pj4KPj4+Pj4+PiAgICAgZW51bSBkcm1fbW9k
ZV9zdGF0dXMgKCptb2RlX3ZhbGlkKShzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+Pj4+PiAqY29ubmVj
dG9yLAo+Pj4+Pgo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdAo+Pj4+PiBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsKPj4+Pj4KPj4+Pj4+
PiAgICAgdW5zaWduZWQgaW50IHNldF9yYXRlIDogMTsKPj4+Pj4+Pgo+Pj4+Pj4+ICsgICB1bnNp
Z25lZCBpbnQgZHJtX2luZm9mcmFtZSA6IDE7Cj4+Pj4+PiBBZ2FpbiwgZHJtX2luZm9mcmFtZSBz
dWdnZXN0cyBpdCBjb250YWlucyBpbmZvcmZyYW1lLCBidXQgaW4gZmFjdCBpdAo+Pj4+Pj4ganVz
dCBpbmZvcm1zIGluZm9mcmFtZSBjYW4gYmUgdXNlZCwgc28gYWdhaW4gbXkgc3VnZ2VzdGlvbgo+
Pj4+Pj4gdXNlX2RybV9pbmZvZnJhbWUuCj4+Pj4+Pgo+Pj4+Pj4gTW9yZW92ZXIgYm9vbCB0eXBl
IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUgaGVyZS4KPj4+Pj4gY2hlY2twYXRjaCB3aWxsIGdpdmUg
d2FybmluZyBpZiBib29sIGlzIHVzZWQuCj4+Pj4gVGhlbiBJIHdvdWxkIHNheSAiZml4L2lnbm9y
ZSBjaGVja3BhdGNoIiA6KQo+Pj4+Cj4+Pj4gQnV0IG1heWJlIHRoZXJlIGlzIGEgcmVhc29uLgo+
Pj4gSGVyZSdzIGFuIG9sZCBvbmUgZnJvbSBMaW51czogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTMvOS8xLzE1NAo+Pj4KPj4+IEknZCBzYXkgdGhhdCBib29sIGluIGEgc3RydWN0IGlzIGEgd2Fz
dGUgb2Ygc3BhY2UgY29tcGFyZWQgdG8gYSAxIGJpdAo+Pj4gYml0ZmllbGQsIGVzcGVjaWFsbHkg
d2hlbiB0aGVyZSBhbHJlYWR5IGFyZSBvdGhlciBiaXRmaWVsZHMgaW4gdGhlIHNhbWUKPj4+IHN0
cnVjdC4KPj4+PiBBbnl3YXkgSSd2ZSB0ZXN0ZWQgYW5kIEkgZG8gbm90IHNlZSB0aGUgd2Fybmlu
ZywgY291bGQgeW91IGVsYWJvcmF0ZSBpdC4KPj4+IE1heWJlIGNoZWNrcGF0Y2gucGwgLS1zdHJp
Y3Q/Cj4+IEl0IHNlZW1zIHRoZXkgcmVtb3ZlZCB0aGF0IGNoZWNrOgo+PiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2Nv
bW1pdC8/Cj4+IGlkPTc5Njc2NTZmZmJmYTQ5M2Y1NTQ2YzBmMQo+Pgo+PiBBZnRlciByZWFkaW5n
IHRoYXQgYmxvY2sgb2YgdGV4dCwgSSdtIG5vdCBzdXJlIHdoYXQgd291bGQgYmUgcHJlZmVyZWQg
d2F5IGZvcgo+PiB0aGlzIGNhc2UuCj4gVGhpczoKPgo+ICtJZiBhIHN0cnVjdHVyZSBoYXMgbWFu
eSB0cnVlL2ZhbHNlIHZhbHVlcywgY29uc2lkZXIgY29uc29saWRhdGluZyB0aGVtIGludG8gYQo+
ICtiaXRmaWVsZCB3aXRoIDEgYml0IG1lbWJlcnMsIG9yIHVzaW5nIGFuIGFwcHJvcHJpYXRlIGZp
eGVkIHdpZHRoIHR5cGUsIHN1Y2ggYXMKPiArdTguCj4KPiB3b3VsZCBzdWdnZXN0IHVzaW5nIGEg
Yml0ZmllbGQsIG9yIGZsYWdzIHdpdGhpbiBhIGZpeGVkIHdpZHRoIHR5cGU/CgoKT0ssIEkgaGF2
ZSBhbHNvIGd1ZXNzZWQgd2hhdCBraW5kIG9mIHdhcm5pbmcgSmVybmVqIHdhcyB3cml0aW5nIGFi
b3V0LgpBbmQgSU1PIGl0IHJhdGhlciBkb2VzIG5vdCBmaXQgaGVyZToKCi0gbm8gY29uY3VycmVu
dCB3cml0ZXMsCgotIG5vIG5lZWQgZm9yIHNpemUvY2FjaGUgb3B0aW1pemF0aW9ucy4KCkJ1dCBz
aW5jZSB0aGVyZSBhcmUgc29tZSBjb250cm92ZXJzaWVzIGFib3V0IGJvb2wgaW4gc3RydWN0IGFu
ZCBmaWxlIGhhcwphbHJlYWR5IGNvbnZlbnRpb24gb2YgYml0ZmllbGQgSSBkbyBub3QgaW5zaXN0
IG9uIGl0LCB5b3UgY2FuIGtlZXAgaXQgYXMgaXMuCgoKUmVnYXJkcwoKQW5kcnplagoKCgo+Cj4g
Q2hlbll1Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
