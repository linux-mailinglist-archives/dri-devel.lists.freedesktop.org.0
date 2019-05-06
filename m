Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D2A14AF4
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 15:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344B898FD;
	Mon,  6 May 2019 13:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE6898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:32:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190506133257euoutp01e4a6cb01e91219fafd2410341bb612f4~cG0pM_o4L3260932609euoutp01T
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 13:32:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190506133257euoutp01e4a6cb01e91219fafd2410341bb612f4~cG0pM_o4L3260932609euoutp01T
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190506133256eucas1p1a28b30ff888700f20d844bf2a055f9a9~cG0orXuxD3092330923eucas1p16;
 Mon,  6 May 2019 13:32:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 43.C7.04377.88730DC5; Mon,  6
 May 2019 14:32:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190506133255eucas1p2f710b96c6a25d9e4ed4d1fcf2acf5060~cG0oAi9Td0514805148eucas1p2c;
 Mon,  6 May 2019 13:32:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190506133255eusmtrp2e0935f878b5630390134d65272c108bf~cG0nykYfT1223612236eusmtrp2M;
 Mon,  6 May 2019 13:32:55 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-d8-5cd03788d0d9
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.B1.04146.78730DC5; Mon,  6
 May 2019 14:32:55 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190506133255eusmtip2396f65c6cb20f925876269f230896e55~cG0nV1bJE0553405534eusmtip26;
 Mon,  6 May 2019 13:32:55 +0000 (GMT)
Subject: Re: [PATCH] fbcon: Don't reset logo_shown when logo is currently shown
To: Andreas Schwab <schwab@linux-m68k.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <4a5fe468-c153-910a-098e-3d6cff3432c8@samsung.com>
Date: Mon, 6 May 2019 15:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <87imvwp9d4.fsf_-_@igel.home>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKKsWRmVeSWpSXmKPExsWy7djPc7od5hdiDDZt5bdY+PAus8WVr+/Z
 LN4cn85kcaY71+JE3wdWi3UXrrBbvPvRy26xr+MBk0X/0g42i9u/+SzO70p04PaY3XCRxWPv
 twUsHgt6zjN7tOy7xe5x6HAHo8f97uNMHr3N79g83u+7yubxeZNcAGcUl01Kak5mWWqRvl0C
 V0bzmwUsBf0sFf/ufmJrYFzP3MXIySEhYCLR9uk/axcjF4eQwApGiX9Pr7BAOF8YJZbN7maE
 cD4zShx5sJ0FpmVr0wRmiMRyRonGLWvZIJy3jBKH975jAqkSFgiUWLFvKpgtIqAl0TNxIlgR
 s8B7JoljGw6xgSTYBKwkJravYgSxeQXsJDavPAm0goODRUBF4tPDDBBTVCBCov+MOkSFoMTJ
 mU/AjuAEGvlu/Waw8cwCBhJHFs1hhbDlJba/nQN2nITALXaJ09/3MkFc7SLR87sL6gNhiVfH
 t7BD2DIS/3fOZ4JoWMco8bfjBVT3dkaJ5ZP/sUFUWUscPn6RFeQiCQFHiasHMiBMPokbbwUh
 FvNJTNo2nRkizCvR0SYE0agmsWHZBjaYVV07V0LD3UPiyNlpTBMYFWcheW0WkndmIXlnASPz
 Kkbx1NLi3PTUYqO81HK94sTc4tK8dL3k/NxNjMDEdfrf8S87GHf9STrEKMDBqMTDu0DlfIwQ
 a2JZcWXuIUYJDmYlEd7EZ+dihHhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJzU5N
 LUgtgskycXBKNTC2mie7v3GasItnjl+9bWhnhWxt6By5Dym3r70uvTdp/Y917yJ5HNVPfueQ
 KDLym8FtwZ3ZVPDnouZ757BNuwIyu+qdEw5Lim5dOvuq4Z4QDS6rm7WCy45GzPq5/uve+B2R
 /1cnp55Zx5EbwG185ObTgu4rCz7FCO3fdePeA8nDz3Y/ZVsWteyaEktxRqKhFnNRcSIA6rSr
 vVgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xe7rt5hdiDOZdVrRY+PAus8WVr+/Z
 LN4cn85kcaY71+JE3wdWi3UXrrBbvPvRy26xr+MBk0X/0g42i9u/+SzO70p04PaY3XCRxWPv
 twUsHgt6zjN7tOy7xe5x6HAHo8f97uNMHr3N79g83u+7yubxeZNcAGeUnk1RfmlJqkJGfnGJ
 rVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbzmwUsBf0sFf/ufmJrYFzP
 3MXIySEhYCKxtWkCkM3FISSwlFFi2ZmLQA4HUEJG4vj6MogaYYk/17rYIGpeM0rMOHuAFSQh
 LBAosWLfVCYQW0RAS6Jn4kSoomVMEid/XmYCcZgFPjJJ/N2wEayKTcBKYmL7KkYQm1fATmLz
 ypMsINtYBFQkPj3MAAmLCkRI3HrYwQJRIihxcuYTMJsTaMG79ZvBxjAL6EnsuP6LFcKWl9j+
 dg7zBEbBWUhaZiEpm4WkbAEj8ypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAeNx27OfmHYyX
 NgYfYhTgYFTi4fVQOh8jxJpYVlyZe4hRgoNZSYQ38dm5GCHelMTKqtSi/Pii0pzU4kOMpkA/
 TGSWEk3OB6aKvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUwfUwcnFINjC1q
 DLGzmq7FNhdeVKn+u3nW4tQlTIHxrX5irI+4/gpsCGty6Gmwvnp8yoJTnPvS3zk/fv1yjuSr
 QLmLOySaPx7Neqd6u/+A8i2RQ/u/lP6u2mny/9ncTr1Htl13T7QV2YZ/Xajx2jB5e1CstOjO
 e+6iXgWXn+64Ms/p2qe1Kw+Y3zRe7hw8YYoSS3FGoqEWc1FxIgC7ihE/3QIAAA==
X-CMS-MailID: 20190506133255eucas1p2f710b96c6a25d9e4ed4d1fcf2acf5060
X-Msg-Generator: CA
X-RootMTR: 20190402180939epcas4p15a2bd8dc16a3e56a5f62cdcf396a2404
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190402180939epcas4p15a2bd8dc16a3e56a5f62cdcf396a2404
References: <20190129134350.24049-1-prarit@redhat.com>
 <20190129134350.24049-3-prarit@redhat.com> <87ftr1ed4h.fsf@igel.home>
 <8590ff59-a4fb-5a02-fda4-086476efcbe6@redhat.com>
 <CGME20190402180939epcas4p15a2bd8dc16a3e56a5f62cdcf396a2404@epcas4p1.samsung.com>
 <87imvwp9d4.fsf_-_@igel.home>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1557149577;
 bh=fj3BPnN6nhd6wWJ2Ap4Y7Un3IQZgfbFFeQWzLYzMSZA=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=uQPVFGw1XXSjgVodmdbLfU7tY9gqB0t6OZu9c+sGAvAkQRcJA6N6qtZfAPKX1+Z9+
 cSxpXgh6JXkf9INPdUvsdzZTXiEQGKWUEIe3VXpCzR+QZkF0rk95hkevVxocIV1qdS
 VcllzCtVlNwFzM+xE8b4A3R4DJXt74uAasnJtAt0=
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
Cc: Prarit Bhargava <prarit@redhat.com>, Marko Myllynen <myllynen@redhat.com>,
 linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Yisheng Xie <ysxie@foxmail.com>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDA0LzAyLzIwMTkgMDg6MDkgUE0sIEFuZHJlYXMgU2Nod2FiIHdyb3RlOgo+IFdoZW4gdGhl
IGxvZ28gaXMgY3VycmVudGx5IGRyYXduIG9uIGEgdmlydHVhbCBjb25zb2xlLCBhbmQgdGhlIGNv
bnNvbGUKPiBsb2dsZXZlbCBpcyByZWR1Y2VkIHRvIHF1aWV0LCBsb2dvX3Nob3duIG11c3QgYmUg
bGVmdCBhbG9uZSwgc28gdGhhdCBpdAo+IHRoZSBzY3JvbGxpbmcgcmVnaW9uIG9uIHRoYXQgdmly
dHVhbCBjb25zb2xlIGlzIHByb3Blcmx5IHJlc2V0Lgo+IAo+IEZpeGVzOiAxMDk5MzUwNGQ2NDcg
KCJmYmNvbjogU2lsZW5jZSBmYmNvbiBsb2dvIG9uICdxdWlldCcgYm9vdHMiKQo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAbGludXgtbTY4ay5vcmc+CgpQYXRjaCBxdWV1
ZWQgZm9yIHY1LjIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKLS0KQmFydGxvbWllaiBab2xuaWVy
a2lld2ljegpTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kClNhbXN1bmcgRWxlY3Ryb25pY3MK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
