Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC5B581EC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFEB6E110;
	Thu, 27 Jun 2019 11:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559EC6E110
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:55:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190627115514euoutp0202606009fa746000da10e015136c7001~sDCLPkKq21317213172euoutp02L
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:55:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190627115514euoutp0202606009fa746000da10e015136c7001~sDCLPkKq21317213172euoutp02L
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190627115513eucas1p2148bb85cd4267ef45a2e3f940a32a99c~sDCKmImuh0347803478eucas1p2l;
 Thu, 27 Jun 2019 11:55:13 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 3C.CC.04298.1AEA41D5; Thu, 27
 Jun 2019 12:55:13 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190627115512eucas1p146ab7a53bbaf5c47ed6afa4f42ec697a~sDCJs0-ki0705007050eucas1p1c;
 Thu, 27 Jun 2019 11:55:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190627115512eusmtrp18f320c47b8f02d07b8887fca2acbdee3~sDCJeuobh3136031360eusmtrp1m;
 Thu, 27 Jun 2019 11:55:12 +0000 (GMT)
X-AuditID: cbfec7f2-3615e9c0000010ca-d1-5d14aea17fd1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1D.11.04146.0AEA41D5; Thu, 27
 Jun 2019 12:55:12 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190627115511eusmtip2db30738342a694241f34ee3c0f83d563~sDCI7ma-G0106701067eusmtip2j;
 Thu, 27 Jun 2019 11:55:11 +0000 (GMT)
Subject: Re: [PATCH v6 00/15] tc358767 driver improvements
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <d902a0b7-2ac9-96bd-2ff2-e984b4e03bda@samsung.com>
Date: Thu, 27 Jun 2019 13:55:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a3fdbb02-586b-66d3-1857-1ed6d90d2537@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOKsWRmVeSWpSXmKPExsWy7djP87oL14nEGiw5KGzR3GFr0XSogdXi
 x5XDLBYH9xxnsrjy9T2bxYO5N5ksOicuYbe4vGsOm8XdeydYLNbPv8XmwOXxYOp/Jo+ds+6y
 e8zumMnqcb/7OJNH/18Dj+M3tjN5fN4k53Fu6lmmAI4oLpuU1JzMstQifbsErox7dyYwFjxh
 rXjc8pmtgfEISxcjJ4eEgInEjlt72bsYuTiEBFYwSqy+3csK4XxhlOh/uREq85lR4lj/WyaY
 lvc9TVBVyxkltjefYIFw3jJK/Fjfwg5SJSxgJTG5eS4jiC0iUCHx6/o+NpAiZoGFTBJ7rj0C
 284moCnxd/NNNhCbV8BO4vW2/WA2i4CqxIWNb8FqRAUiJL7s3MQIUSMocXLmE7A4J9CCj01f
 wWxmAXmJ7W/nMEPY4hK3nsyHOvUWu8TljYUQtovEivUXGCFsYYlXx7ewQ9gyEqcn90BDo17i
 /ooWZpBDJQQ6GCW2btjJDJGwljh8/CLQzxxACzQl1u/Shwg7Sly6/I4JJCwhwCdx460gxAl8
 EpO2TWeGCPNKdLQJQVQrStw/uxVqoLjE0gtf2SYwKs1C8tgsJM/MQvLMLIS9CxhZVjGKp5YW
 56anFhvmpZbrFSfmFpfmpesl5+duYgQmr9P/jn/awfj1UtIhRgEORiUeXoY9wrFCrIllxZW5
 hxglOJiVRHjzw0RihXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5NLUgtgsky
 cXBKNTDuuRkYbPelU671RYNP2j3uWUfrGec8Lq7/+XfRheMv5xkXafo5P30R7dARKZ3Ps2Bu
 s7Ypn80HSz6N2VliJ9byfO823KhRPntq8NX2ZyUfQ/PLtvRcWent9GBy0MPsnbyLs7pMhO89
 yxav03nZ5lEr4SGxe9OkJvklp+8tX1l/z431Q3LaTRUlluKMREMt5qLiRABBGWCsWgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xe7oL1onEGhyZJm/R3GFr0XSogdXi
 x5XDLBYH9xxnsrjy9T2bxYO5N5ksOicuYbe4vGsOm8XdeydYLNbPv8XmwOXxYOp/Jo+ds+6y
 e8zumMnqcb/7OJNH/18Dj+M3tjN5fN4k53Fu6lmmAI4oPZui/NKSVIWM/OISW6VoQwsjPUNL
 Cz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYx7dyYwFjxhrXjc8pmtgfEISxcjJ4eEgInE
 +54m1i5GLg4hgaWMEns3TmeHSIhL7J7/lhnCFpb4c62LDaLoNaPEjBkTwYqEBawkJjfPZQSx
 RQQqJE73tDCCFDELLGaS2HFvCQtEx0FGiS1zZrKCVLEJaEr83XyTDcTmFbCTeL1tP5jNIqAq
 cWHjW7CbRAUiJGbvamCBqBGUODnzCZjNCbTtY9NXMJtZQF3iz7xLzBC2vMT2t3OgbHGJW0/m
 M01gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBitx37uXkH
 46WNwYcYBTgYlXh4V+wUjhViTSwrrsw9xCjBwawkwpsfJhIrxJuSWFmVWpQfX1Sak1p8iNEU
 6LmJzFKiyfnAZJJXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGR
 SX/p+dDPV1zZQwRfdp34fCOnO4Hb7Vwfo0sHQ8KLUL7kwMh+7i2X2TYudyhpm+O4zDajg9X6
 9JSwqLCrE3e++LRvptcS16sXf5SJH7vgo3VbJOjUVLblf54lf5q873Or3folTe8FfhZINRT3
 suYyx4VrzTG1zhDctV1qb05SpaDWsrcPvzQpsRRnJBpqMRcVJwIAAAGKce4CAAA=
X-CMS-MailID: 20190627115512eucas1p146ab7a53bbaf5c47ed6afa4f42ec697a
X-Msg-Generator: CA
X-RootMTR: 20190627102712epcas1p1d6182a13af3efaaaf5d7369f823b0522
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627102712epcas1p1d6182a13af3efaaaf5d7369f823b0522
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
 <CGME20190627102712epcas1p1d6182a13af3efaaaf5d7369f823b0522@epcas1p1.samsung.com>
 <a3fdbb02-586b-66d3-1857-1ed6d90d2537@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561636514;
 bh=FeZQPqAIyrEaL3SuA1RZalX38vDy0YTh95KqmmaIo+c=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nJ9V+QMQAcGxZuQ4ezt2OIUIEJKyV/sPfCDzGRIxfhJipbKtk+4j2omyzNgbKbp3S
 tClx6BMFIMcxDuiTpMdvE1lTOqf3WXqWc49zCbP+jkWvaHxEXZ5fbZCclXqqoTvb99
 p/FJwi5Xr5Oyzh//2OCkFCRu4njA0HhOxAHENIp4=
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDYuMjAxOSAxMjoyNiwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gT24gMTkvMDYvMjAx
OSAwODoyNywgQW5kcmV5IFNtaXJub3Ygd3JvdGU6Cj4+IEV2ZXJ5b25lOgo+Pgo+PiBUaGlzIHNl
cmllcyBjb250YWlucyB2YXJpb3VzIGltcHJvdmVtZW50cyAoYXQgbGVhc3QgaW4gbXkgbWluZCkg
YW5kCj4+IGZpeGVzIHRoYXQgSSBtYWRlIHRvIHRjMzU4NzY3IHdoaWxlIHdvcmtpbmcgd2l0aCB0
aGUgY29kZSBvZiB0aGUKPj4gZHJpdmVyLiBIb3BlZnVseSBlYWNoIHBhdGNoIGlzIHNlbGYgZXhw
bGFuYXRvcnkuCj4+Cj4+IEZlZWRiYWNrIGlzIHdlbGNvbWUhCj4gSSB0aGluayB0aGlzIGxvb2tz
IGZpbmUsIHNvOgo+Cj4gUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5l
bkB0aS5jb20+Cj4KPiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBteSBEUCBlcXVpcG1lbnQg
Zm9yIHRoZSB0aW1lIGJlaW5nLCBzbyBJJ20gCj4gbm90IGFibGUgdG8gdGVzdCB0aGlzIG9uIG91
ciBib2FyZC4gSSdtIGZpbmUgd2l0aCBtZXJnaW5nLCBhcyB0aGUgCj4gcHJldmlvdXMgc2VyaWVz
IHdvcmtlZCBvayBhZnRlciByZXZlcnRpbmcgdGhlIHNpbmdsZSByZWdyZXNzaW9uICh3aGljaCAK
PiBpcyBmaXhlZCBpbiB0aGlzIHNlcmllcykuCj4KPiAgIFRvbWkKPgpRdWV1ZWQgdG8gZHJtLW1p
c2MtbmV4dC4KCgpSZWdhcmRzCgpBbmRyemVqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
