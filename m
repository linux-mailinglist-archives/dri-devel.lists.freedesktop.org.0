Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A9B2837AF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 16:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A525E89DE5;
	Mon,  5 Oct 2020 14:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164289DE5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:27:22 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201005142720euoutp01ce1b0a6fc9458d0011339b53ccd180fd~7HuAhCYbM1286512865euoutp01O
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:27:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201005142720euoutp01ce1b0a6fc9458d0011339b53ccd180fd~7HuAhCYbM1286512865euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601908040;
 bh=N4ccLP6GJqWrJK+K0XUH9NxiqLa5g4pUYelDJIKu0Ds=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=PCuPzk3yxvc7GdK7rkPbTVL8CfybyXiSkRWFdxhv8L1BO+RE6Q8Wl9aIV+KilY4rs
 wTeOwgv9xI4FSfyds8IcGtrtkLO+WyIpaSjfmIgW3roudRwnXaMlLKK7kT3WrF2aX7
 f2S9aX28wIpWjuWM+eWOylCpCQNi60B+6yH//bmQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201005142720eucas1p2400e1a61c33f54ff984ffc0d82b4cac3~7HuARb89g1454314543eucas1p2H;
 Mon,  5 Oct 2020 14:27:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 84.21.05997.84D2B7F5; Mon,  5
 Oct 2020 15:27:20 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201005142719eucas1p1d1b841671fdde5ff7da35197a64380af~7Ht-3LkQd1395613956eucas1p1N;
 Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201005142719eusmtrp20337b69b9a76bb06f5d0df754b9c7409~7Ht-2gG6l1451214512eusmtrp2A;
 Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-30-5f7b2d482cba
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A6.7A.06017.74D2B7F5; Mon,  5
 Oct 2020 15:27:19 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201005142719eusmtip20ee4c686d8a5120b29d5263639457330~7Ht-Uz0LJ2898728987eusmtip2X;
 Mon,  5 Oct 2020 14:27:19 +0000 (GMT)
Subject: Re: [PATCH RESEND] drm/bridge: tc358764: restore connector support
To: Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <fd29eebc-d9dc-374a-db98-b08613f505f8@samsung.com>
Date: Mon, 5 Oct 2020 16:27:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0)
 Gecko/20100101 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20201004191441.GA551257@ravnborg.org>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djPc7oeutXxBg0L2S2ufH3PZnH1+0tm
 i5NvrrJYdE5cwm5xedccNosZ5/cxWaw9cpfd4lBftMWKn1sZHTg93t9oZfeY3TGT1ePEhEtM
 Hve7jzN5LJl2lc2jb8sqRo8DvZNZPD5vkgvgiOKySUnNySxLLdK3S+DKOLfwKVtBE2fF118T
 2BsYl7N3MXJySAiYSDSt3MLUxcjFISSwglFia9cyFgjnC6NE5/JfUJnPjBJTj39ghGmZ+nYn
 G0RiOVDLhmvMEM57RomLO6cyg1QJC3hLbJrwlRXEFhEIkujufQAWZxaYziRxpkUHxGYT0JT4
 u/kmG4jNK2AncXn3U7AaFgEViaaZt8F6RQUSJPY8OscKUSMocXLmExYQm1PAWOLN41nsEDPl
 JZq3zoaaLy7R9GUlK8hBEgLX2CXWPeiAOttF4tSqZ8wQtrDEq+NboCEgI/F/53wmCLte4v6K
 FmaI5g6Q13ZCNVhL3Dn3C+hSDqANmhLrd+lDhB0lvq9dxgQSlhDgk7jxVhDiBj6JSdumM0OE
 eSU62oQgqhUl7p/dCjVQXGLpha9sExiVZiH5bBaSb2Yh+WYWwt4FjCyrGMVTS4tz01OLjfJS
 y/WKE3OLS/PS9ZLzczcxApPW6X/Hv+xg3PUn6RCjAAejEg+vgkh1vBBrYllxZe4hRgkOZiUR
 Xqezp+OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8xovehkrJJCeWJKanZpakFoEk2Xi4JRqYNRM
 sVH78nOL9xxl6Ze/Xfhfr94YEFO9SZVLindv2aMJn179uz+vlzuz+YI5X9bLXrm9jcvKK1b/
 uFuwsDg8oTTJbZPeEkXesBuMHnseNLVudOwtv8/P5iq7cW64+oNXjf5zpEuSu50MHpvfYm1f
 Yv7o+C+Z+qOMbj8ua1p9fvJc6dG7m8l7bJVYijMSDbWYi4oTATTRLcJWAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7ruutXxBtvPaVpc+fqezeLq95fM
 FiffXGWx6Jy4hN3i8q45bBYzzu9jslh75C67xaG+aIsVP7cyOnB6vL/Ryu4xu2Mmq8eJCZeY
 PO53H2fyWDLtKptH35ZVjB4HeiezeHzeJBfAEaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2Ri
 qWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXcW7hU7aCJs6Kr78msDcwLmfvYuTkkBAwkZj6didb
 FyMXh5DAUkaJq5s62CAS4hK7579lhrCFJf5c64Iqesso8ePUZLAiYQFviU0TvrJ2MXJwiAgE
 SWy9XwASZhaYziQx53c1RP1ORon/P/+BbWMT0JT4u/kmWC+vgJ3E5d1PwRawCKhINM28zQpi
 iwokSDz8cpkZokZQ4uTMJywgNqeAscSbx7PYIRaYSXRt7WKEsOUlmrfOZoawxSWavqxkncAo
 NAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYJRuO/Zzyw7GrnfB
 hxgFOBiVeHgVRKrjhVgTy4orcw8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyI0RTouYnM
 UqLJ+cAEklcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVE9inGS
 MLd9l77XHdVHXIt2zG0IabJdUZafv/zv1NLXmVw3Tm1y2D1RsehANc/el2cfFfyziz73ak/B
 OY9VjKHctsuzvGzuJ607fWZeCleLofQt0T8Hdhe/Lb2waNH27tKDfut3hivculu6rkzvutDD
 V5met5bMk5v242Lj9O0Bt76c37vjYFWFEktxRqKhFnNRcSIAD0QWUugCAAA=
X-CMS-MailID: 20201005142719eucas1p1d1b841671fdde5ff7da35197a64380af
X-Msg-Generator: CA
X-RootMTR: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7
References: <CGME20200930114050eucas1p2fd39f213b4cf82068b79c97992a9acc7@eucas1p2.samsung.com>
 <20200930114042.5806-1-m.szyprowski@samsung.com>
 <20201004191441.GA551257@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, linux-samsung-soc@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClcgZG5pdSAwNC4xMC4yMDIwIG/CoDIxOjE0LCBTYW0gUmF2bmJvcmcgcGlzemU6Cj4gSGkgTWFy
ZWsuCj4KPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwMTo0MDo0MlBNICswMjAwLCBNYXJlayBT
enlwcm93c2tpIHdyb3RlOgo+PiBUaGlzIHBhdGNoIHJlc3RvcmVzIERSTSBjb25uZWN0b3IgcmVn
aXN0cmF0aW9uIGluIHRoZSBUQzM1ODc2NCBicmlkZ2UKPj4gZHJpdmVyIGFuZCByZXN0b3JlcyB1
c2FnZSBvZiB0aGUgb2xkIGRybV9wYW5lbF8qIEFQSSwgdGh1cyBhbGxvd3MgZHluYW1pYwo+PiBw
YW5lbCByZWdpc3RyYXRpb24uIFRoaXMgZml4ZXMgcGFuZWwgb3BlcmF0aW9uIG9uIEV4eW5vczUy
NTAtYmFzZWQKPj4gQXJuZGFsZSBib2FyZC4KPj4KPj4gVGhpcyBpcyBlcXVpdmFsZW50IHRvIHRo
ZSByZXZlcnQgb2YgdGhlIGZvbGxvd2luZyBjb21taXRzOgo+PiAxNjQ0MTI3ZjgzYmMgImRybS9i
cmlkZ2U6IHRjMzU4NzY0OiBhZGQgZHJtX3BhbmVsX2JyaWRnZSBzdXBwb3J0Igo+PiAzODVjYTM4
ZGEyOWMgImRybS9icmlkZ2U6IHRjMzU4NzY0OiBkcm9wIGRybV9jb25uZWN0b3JfKHVuKXJlZ2lz
dGVyIgo+PiBhbmQgcmVtb3ZhbCBvZiB0aGUgY2FsbHMgdG8gZHJtX3BhbmVsX2F0dGFjaCgpL2Ry
bV9wYW5lbF9kZXRhY2goKSwgd2hpY2gKPj4gd2VyZSBuby1vcHMgYW5kIGhhcyBiZWVuIHJlbW92
ZWQgaW4gbWVhbndoaWxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxt
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxh
LmhhamRhQHNhbXN1bmcuY29tPgo+IFRoYW5rcyBmb3IgcHJvdmlkaW5nIHRoZSByZXZlcnQgc28g
d2UgY2FuIGhhdmUgdGhpcyBmaXhlZCBpbiB1cHN0cmVhbS4KPiBTbyBmYXIgSSBoYXZlIGhhZCBu
byB0aW1lIHRvIGRpdmUgZGVlcGVyIGludG8gd2hhdCBpcyBnb2luZyB3cm9uZyBidXQKPiBhbmQg
dGhlIHJldmVydCBpcyB0aGUgcmlnaHQgY2F1c2Ugb2YgYWN0aW9uIGZvciBub3cuCj4KPiBJIGV4
cGVjdCBBbmRyemVqIHRvIHBpY2sgaXQgdXAgYXMgaGUgaGFzIGFscmVhZHkgcmV2aWV3ZWQgaXQu
Cj4KPiAJU2FtCgoKRG9uZQoKClJlZ2FyZHMKCkFuZHJ6ZWoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
