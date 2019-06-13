Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA824364C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 15:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D113689950;
	Thu, 13 Jun 2019 13:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CC789950
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:12:43 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190613131242euoutp028965af1632c63c105a0aed01edd1227f~nxDz8IRfg0365503655euoutp02B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 13:12:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190613131242euoutp028965af1632c63c105a0aed01edd1227f~nxDz8IRfg0365503655euoutp02B
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190613131241eucas1p1d70fd4873570a1cd4ec1e697c8944ace~nxDzNcZbA2949929499eucas1p1K;
 Thu, 13 Jun 2019 13:12:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 11.10.04377.8CB420D5; Thu, 13
 Jun 2019 14:12:41 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190613131240eucas1p2ae15561a8c4068692ff3708048bff6e5~nxDyXCxRN1331513315eucas1p2r;
 Thu, 13 Jun 2019 13:12:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190613131240eusmtrp2ab1f2cec2b61aa96242bdff85990149a~nxDyHgOv72314223142eusmtrp2-;
 Thu, 13 Jun 2019 13:12:40 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-04-5d024bc8583b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 46.7E.04140.8CB420D5; Thu, 13
 Jun 2019 14:12:40 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190613131239eusmtip241093eea365a602834bf0ad5a257b17b~nxDxvXVtA3141931419eusmtip2N;
 Thu, 13 Jun 2019 13:12:39 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: analogix-anx78xx: Drop of_gpio.h include
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <513f05bf-df76-5a6a-361f-360a91504131@samsung.com>
Date: Thu, 13 Jun 2019 15:12:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190609223254.8523-1-linus.walleij@linaro.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djPc7onvZliDe5MZ7K48vU9m8Wa24cY
 Le79+cBq0TlxCbvFlD/LmRxYPXbcXcLoMbtjJqvHnWt72Dzudx9n8tiy/zNjAGsUl01Kak5m
 WWqRvl0CV8bmV6eYCr5yVFz8cYaxgXEvexcjJ4eEgIlE9+tfLF2MXBxCAisYJX5MOsAO4Xxh
 lOjrWskE4XxmlNi+qRmu5djihVCJ5YwSO+e8YoZw3jJK7Pi+hxGkSljAU6Jh1Q0wW0QgReL7
 ip9gS5gFmhglNt48wwKSYBPQlPi7+SYbiM0rYCfx+lsL2AoWAVWJ9vv3weKiAhESX3ZuYoSo
 EZQ4OfMJWC+ngK3E3dPXmEFsZgF5ieats6FscYlbT+aDnSchsIhd4v3k3UCDOIAcF4kdz4Ig
 XhCWeHV8C9Q7MhL/d4LUg9j1EvdXtDBD9HYwSmzdsJMZImEtcfj4RVaQOcxAR6/fpQ8RdpS4
 8Hs5I8R4PokbbwUhTuCTmLRtOjNEmFeio00IolpR4v7ZrVADxSWWXvjKNoFRaRaSx2YheWYW
 kmdmIexdwMiyilE8tbQ4Nz212CgvtVyvODG3uDQvXS85P3cTIzDlnP53/MsOxl1/kg4xCnAw
 KvHwHrBiihViTSwrrsw9xCjBwawkwvuDASjEm5JYWZValB9fVJqTWnyIUZqDRUmct5rhQbSQ
 QHpiSWp2ampBahFMlomDU6qBMet/aMChU/Kb/75V0fyz/kz605Mbnp8TeLlwg9ZaXd6j+r2n
 L9zX85j1+x1Hy9SU6aHcW33T+056zV+YU+feWqR3irUs+rnJljv9OdYn3k2QDl0unJ11xzhG
 ozYkbpqv0Jun//Qu/bmy6vYnyZjCqftvZ6dqmgtvzGD17Y980xF5ICCoVV/xqBJLcUaioRZz
 UXEiAK/4a/Q1AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xe7onvJliDR7NYrG48vU9m8Wa24cY
 Le79+cBq0TlxCbvFlD/LmRxYPXbcXcLoMbtjJqvHnWt72Dzudx9n8tiy/zNjAGuUnk1RfmlJ
 qkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbmV6eYCr5yVFz8
 cYaxgXEvexcjJ4eEgInEscULmboYuTiEBJYySiyYu4MJIiEusXv+W2YIW1jiz7UuNoii14wS
 D+9NZgRJCAt4SjSsugFmiwikSHTPbgWbxCzQwihx4uI9ZoiOCYwS6w8sYwWpYhPQlPi7+SYb
 iM0rYCfx+lsL2B0sAqoS7ffvg8VFBSIkZu9qYIGoEZQ4OfMJmM0pYCtx9/Q1sJOYBdQl/sy7
 BGXLSzRvnQ1li0vcejKfaQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnp
 esn5uZsYgXG27djPLTsYu94FH2IU4GBU4uE9YMUUK8SaWFZcmXuIUYKDWUmE9wcDUIg3JbGy
 KrUoP76oNCe1+BCjKdBzE5mlRJPzgSkgryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2
 ampBahFMHxMHp1QD46LHfH/b4lzsX+1yKjnF/Y/D1rX5wvbVTiw85swhZbFftiVn5jAEfFL0
 +mQuuMDjclCGXEH9FCazCQV3v4lEPZtxQPJJZsitwpTb/l9SambvPF586YRG/Jsbec2nPEuq
 /4o+vP6NieHH8qmffDqKTogtZ1G/t73sfU9H6vVtU/t9eT4/FmFOVWIpzkg01GIuKk4EAFX1
 LkPJAgAA
X-CMS-MailID: 20190613131240eucas1p2ae15561a8c4068692ff3708048bff6e5
X-Msg-Generator: CA
X-RootMTR: 20190609223300epcas2p101fcf0882928905991ec3b4b3bac1784
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190609223300epcas2p101fcf0882928905991ec3b4b3bac1784
References: <CGME20190609223300epcas2p101fcf0882928905991ec3b4b3bac1784@epcas2p1.samsung.com>
 <20190609223254.8523-1-linus.walleij@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560431562;
 bh=heO6T15MdpVkH5YhWPHCASMQafQxpUqSu7NTbASfWQ8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=kk03PNpvgv5jOd9GMbAnd2e4Cpm02Nfw4cx/caiU0F9yLtQM89Or/w8UDeKSbJ7ur
 YNCaLLtQbdutChYJ9mPgogZd9LPpXXlTS2gPj5prBwokz7hVR7XP3XzT93lkpGG3LQ
 ZWJbdrHdzMRjOIgy97tq5IERaU1h5dSgRZUGZdog=
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAuMDYuMjAxOSAwMDozMiwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBUaGlzIGluY2x1ZGUg
aXMgb25seSB1c2VkIGZvciBzb21lIGdwaW8gZHJpdmVycyBhbmQgY29uc3VtZXJzCj4gdGhhdCBs
b29rIHVwIEdQSU8gbnVtYmVycyBkaXJlY3RseSBmcm9tIHRoZSBkZXZpY2UgdHJlZS4KPiBUaGlz
IGRyaXZlciBkb2VzIG5vdCB1c2UgaXQgYW5kIG9ubHkgbmVlZHMgPGxpbnV4L2dwaW8vY29uc3Vt
ZXIuaD4uCj4gRGVsZXRlIHRoZSB1bnVzZWQgaW5jbHVkZS4KPgo+IENjOiBFbnJpYyBCYWxsZXRi
byBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+IENjOiBKb3NlIEFicmV1
IDxKb3NlLkFicmV1QHN5bm9wc3lzLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgoKUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEg
PGEuaGFqZGFAc2Ftc3VuZy5jb20+CgpJIHdpbGwgcXVldWUgaXQgc29vbiB0byBkcm0tbWlzYy1u
ZXh0LgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvYW5hbG9naXgtYW54Nzh4eC5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9u
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3
OHh4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwo+IGluZGV4
IGMwOWFhZjkzYWUxYi4uNjFiNTEyMmU1YTUyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9hbmFsb2dpeC1hbng3OHh4LmMKPiBAQCAtMjAsNyArMjAsNiBAQAo+ICAjaW5jbHVkZSA8bGlu
dXgvaTJjLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L21vZHVsZS5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfZ3Bpby5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9ybS5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
