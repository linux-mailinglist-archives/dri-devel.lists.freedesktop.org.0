Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F75925EE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13ED6E135;
	Mon, 19 Aug 2019 14:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34E26E135
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:05:58 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190819140557euoutp02e5a0c56ba45533887882e91aee6b2edb~8WAcCX8Fx0250402504euoutp02U
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:05:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190819140557euoutp02e5a0c56ba45533887882e91aee6b2edb~8WAcCX8Fx0250402504euoutp02U
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190819140557eucas1p2bcf8dc2a0a8c16dbaef13d2ae8ee11ff~8WAbtqphz0936409364eucas1p2_;
 Mon, 19 Aug 2019 14:05:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 08.64.04374.4CCAA5D5; Mon, 19
 Aug 2019 15:05:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140556eucas1p1c0dd0c9e196e16a5684ede4a57a16172~8WAa_yS8e1875818758eucas1p1K;
 Mon, 19 Aug 2019 14:05:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190819140556eusmtrp21804a7ef133f7c76e2973a9f1882a8d3~8WAav-qZr3227232272eusmtrp2B;
 Mon, 19 Aug 2019 14:05:56 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-2e-5d5aacc43762
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 08.55.04117.4CCAA5D5; Mon, 19
 Aug 2019 15:05:56 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190819140555eusmtip1eeaef4dc2e639d3ba5a5fc7adeb794c3~8WAaboXs80802708027eusmtip1i;
 Mon, 19 Aug 2019 14:05:55 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev:via: Remove dead code
To: Souptick Joarder <jrdr.linux@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <0a2fd868-322a-d0cd-ac24-97a36c5af54e@samsung.com>
Date: Mon, 19 Aug 2019 16:05:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFqt6zYrX-5d8yYVwesYBPWQZK4iXPPv=2w7dqBtHvF9c1WJHA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87pH1kTFGnz5bm5x5et7NovOmdcY
 La5dbWC2ONH3gdXi8q45bA6sHjtn3WX3+PAxzuN+93Emj8+b5AJYorhsUlJzMstSi/TtErgy
 jj5eyFjwi7Xi2bEprA2Md1i6GDk5JARMJBqmvWfqYuTiEBJYwSgx7cV9ZgjnC6NEx52rjBDO
 Z0aJ03dPssO03FxxG6xdSGA5o8TbyeEQRW8ZJZYfWs4KkhAWMJc4e+w2E4gtIqAtMffwL2YQ
 m1mgSmLN8y1gNWwCVhIT21cxgti8AnYS1y6vZAOxWQRUJa50bwBbICoQIXH/2AZWiBpBiZMz
 n4DFOQUCJWbcPsoGMVNc4taT+UwQtrzE9rdzwF6QEJjMLnHs0nSoR10k1t3/ywRhC0u8Or4F
 6hsZif875zNBNKxjlPjb8QKqezvQO5P/sUFUWUscPn4R6AwOoBWaEut36UOEHSWWnFzNDBKW
 EOCTuPFWEOIIPolJ26ZDhXklOtqEIKrVJDYs28AGs7Zr50rmCYxKs5C8NgvJO7OQvDMLYe8C
 RpZVjOKppcW56anFxnmp5XrFibnFpXnpesn5uZsYgUnm9L/jX3cw7vuTdIhRgINRiYfXY1pU
 rBBrYllxZe4hRgkOZiUR3oo5QCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE0hNLUrNT
 UwtSi2CyTBycUg2MHEWdPkHGF6vYVzDtOL6iIyfxd5TG08VX9KoOHv/alXdC7b7ThHk/m9do
 7HnxTPbyT0Zjo0mB76yXifhuE5TXN5Za8CxSadex7kafgypc3kvXMPPunHX5neAib50+d7Z3
 /qHyt0646z6SMM9l9+u/rnCxuU/2oWPywZl/+NerKsc+fvnw004fJZbijERDLeai4kQAa5EB
 BS4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7pH1kTFGnRvZrO48vU9m0XnzGuM
 FteuNjBbnOj7wGpxedccNgdWj52z7rJ7fPgY53G/+ziTx+dNcgEsUXo2RfmlJakKGfnFJbZK
 0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZRx8vZCz4xVrx7NgU1gbGOyxd
 jJwcEgImEjdX3AazhQSWMkp83qXWxcgBFJeROL6+DKJEWOLPtS42iJLXjBKr+4tAbGEBc4mz
 x24zgdgiAtoScw//YgaxmQWqJM7OugJkcwHVv2GS2L1mMSNIgk3ASmJi+yowm1fATuLa5ZVg
 Q1kEVCWudG8Au0FUIELizPsVLBA1ghInZz4BszkFAiVm3D7KBrFAXeLPvEtQy8Qlbj2ZzwRh
 y0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgRG1
 7djPLTsYu94FH2IU4GBU4uH1mBYVK8SaWFZcmXuIUYKDWUmEt2IOUIg3JbGyKrUoP76oNCe1
 +BCjKdBzE5mlRJPzgdGeVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qB8bCTi77a3TU9n5qCJ/gWdjk8nXsmdvEVw49ZGnazK3yyr62/Okle9UmfkZK0dArDHn9D
 OyabaT7n1k/X4xE9UbhwU7DLjDKdC66ef6w4VfRc9x1h8ZkQ8C55aq/gClNPd0btt27tc002
 CkX8cmK/oHzTwXp+eGrtpGURL6QWrUnXfir3LHSeEktxRqKhFnNRcSIA1AlZcb4CAAA=
X-CMS-MailID: 20190819140556eucas1p1c0dd0c9e196e16a5684ede4a57a16172
X-Msg-Generator: CA
X-RootMTR: 20190818165955epcas2p4d3c25b533b9ca5419c3a6e397be56139
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190818165955epcas2p4d3c25b533b9ca5419c3a6e397be56139
References: <1564515200-5020-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zb5ySDbkHVpPkOKHTrF8jFuNh=dXtnwPKO6TuEHBCkYgg@mail.gmail.com>
 <CAFqt6zYsA_0YpZcZ8+LrMEjeWDJ5mwUDJNvqOW1H4ewgKbp+aQ@mail.gmail.com>
 <CGME20190818165955epcas2p4d3c25b533b9ca5419c3a6e397be56139@epcas2p4.samsung.com>
 <CAFqt6zYrX-5d8yYVwesYBPWQZK4iXPPv=2w7dqBtHvF9c1WJHA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566223557;
 bh=98R+ncZrf3D3LHlzj47ZHJE47dDbcFjIanWT4RkYYs8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qK1akU1SlNAlThXPnvVK8aWJu2JU9APlCLI5PyQNEtpTrq99h/JwvsZOMQdKnK4Nv
 sc/ZYkUFvWfqBLeOPFOr/8iCL9CN3S1K3CauqcYNKXldxv5TkzA00ubk/n2N6DZqw8
 D/PhBWaslyEUOEGfeAZChpJSwHBSHGcKhkznpr+0=
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, FlorianSchandinat@gmx.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTgvMTkgNjo1OSBQTSwgU291cHRpY2sgSm9hcmRlciB3cm90ZToKPiBPbiBNb24sIEF1
ZyAxMiwgMjAxOSBhdCA1OjM3IFBNIFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwu
Y29tPiB3cm90ZToKPj4KPj4gT24gV2VkLCBBdWcgNywgMjAxOSBhdCAyOjExIFBNIFNvdXB0aWNr
IEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwuY29tPiB3cm90ZToKPj4+Cj4+PiBPbiBXZWQsIEp1
bCAzMSwgMjAxOSBhdCAxMjo1OSBBTSBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWls
LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGlzIGlzIGRlYWQgY29kZSBzaW5jZSAzLjE1LiBJZiB0
aGVyZSBpcyBubyBwbGFuIHRvIHVzZQo+Pj4+IGl0IGZ1cnRoZXIsIHRoaXMgY2FuIGJlIHJlbW92
ZWQgZm9yZXZlci4KPj4+Pgo+Pj4KPj4+IEFueSBjb21tZW50IG9uIHRoaXMgcGF0Y2ggPwo+Pgo+
PiBBbnkgY29tbWVudCBvbiB0aGlzIHBhdGNoID8KPiAKPiBJZiBubyBjb21tZW50IGNhbiB3ZSBn
ZXQgdGhpcyBpbiBxdWV1ZSBmb3IgNS40ID8KPiAKPj4KPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
U291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+CgpQYXRjaCBxdWV1ZWQgZm9y
IHY1LjQsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVya2lld2lj
egpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
