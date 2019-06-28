Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B559881
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 12:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0D86E8D1;
	Fri, 28 Jun 2019 10:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7E6E8D1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:37:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190628103717euoutp014c7d7e9673c7f4f84bc5fd7850fa3467~sVnZjUM7c2952429524euoutp01Z
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 10:37:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190628103717euoutp014c7d7e9673c7f4f84bc5fd7850fa3467~sVnZjUM7c2952429524euoutp01Z
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190628103716eucas1p105d9274e0550d634387197accbff735b~sVnZABy371454814548eucas1p1Y;
 Fri, 28 Jun 2019 10:37:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.D3.04298.CDDE51D5; Fri, 28
 Jun 2019 11:37:16 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190628103715eucas1p223f9d5f79bc6276e74f44956a0bc33c8~sVnYRZiwV1524415244eucas1p2r;
 Fri, 28 Jun 2019 10:37:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190628103715eusmtrp156cde791cd047c11e1ae3c3e114e9a80~sVnYDYrej2375123751eusmtrp1k;
 Fri, 28 Jun 2019 10:37:15 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-8c-5d15eddcdc17
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 1C.9B.04146.BDDE51D5; Fri, 28
 Jun 2019 11:37:15 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190628103715eusmtip21309facbc69f7ed4970878d77faa6a3e~sVnXtOJax1858318583eusmtip2t;
 Fri, 28 Jun 2019 10:37:15 +0000 (GMT)
Subject: Re: [PATCH] video: fbdev: s3c-fb: fix sparse warnings about using
 incorrect types
To: Jingoo Han <jingoohan1@gmail.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <0c1c0ba0-a37b-2018-ab0a-ea89b99587d1@samsung.com>
Date: Fri, 28 Jun 2019 12:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <PSXP216MB0662D369EFFABF260394F179AAFC0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIKsWRmVeSWpSXmKPExsWy7djPc7p33orGGmxoF7O48vU9m8WKLzPZ
 LU70fWC1uLxrDpsDi8fOWXfZPe53H2fy+LxJLoA5issmJTUnsyy1SN8ugSvj/JVZrAW7WCrW
 7V7N2MB4mbmLkZNDQsBEYt+EpSwgtpDACkaJVUfVuxi5gOwvjBIrlhxkh3A+M0rMXL8TruPi
 r4OMEB3LGSVerrWDsN8ySiw6HAliCwvESJzb/x9sqoiAqkTD+ZOsIIOYBY4zSkx9fhmsmU3A
 SmJi+yowm1fATmLvbgibBaih7cZ2NhBbVCBC4v6xDawQNYISJ2c+ARvKCbTg8MKpYPXMAuIS
 t57MZ4Kw5SW2v53DDLJMQqCfXWL+qzdQV7tIPH3ZxgphC0u8Or6FHcKWkTg9uYcFomEdo8Tf
 jhdQ3dsZJZZP/scGUWUtcfj4RaBuDqAVmhLrd+lDhB0lGueeYwMJSwjwSdx4KwhxBJ/EpG3T
 mSHCvBIdbUIQ1WoSG5ZtYINZ27VzJfMERqVZSF6bheSdWUjemYWwdwEjyypG8dTS4tz01GLD
 vNRyveLE3OLSvHS95PzcTYzAhHL63/FPOxi/Xko6xCjAwajEw6uwUyRWiDWxrLgy9xCjBAez
 kgiv5DmgEG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalFMFkmDk6pBkae
 kOoHN0XlZuoVuj684svI0K5x3yNVYHLh7zp/tqqHi3vvXvjI5sWzxHBTQrspk8ea3TvmLjxg
 KRrN9GDOqrRM9tmMwivr50nu3lTPXjo5bNKvoPoLIqtk9t3T9+K4yuHJrp+UccDi235tE5et
 fx4fuVS981zq0ROM7j2ibaeW8B3yS0hdFa/EUpyRaKjFXFScCADtj2qgJAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7q334rGGkxZrmhx5et7NosVX2ay
 W5zo+8BqcXnXHDYHFo+ds+6ye9zvPs7k8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
 kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G+SuzWAt2sVSs272asYHxMnMXIyeHhICJxMVf
 Bxm7GLk4hASWMkrMurWYpYuRAyghI3F8fRlEjbDEn2tdbBA1rxklTlzuZQdJCAvESJzb/58F
 xBYRUJVoOH+SFcQWEnjCKNHa4ArSwCxwnFFiy+V5TCAJNgEriYntqxhBbF4BO4m9uyFsFqDm
 thvb2UBsUYEIiTPvV7BA1AhKnJz5BMzmBFp2eOFUsHpmAXWJP/MuMUPY4hK3nsxngrDlJba/
 ncM8gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzAGNp27Ofm
 HYyXNgYfYhTgYFTi4VXYKRIrxJpYVlyZe4hRgoNZSYRX8hxQiDclsbIqtSg/vqg0J7X4EKMp
 0HMTmaVEk/OB8Z1XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoEx
 /74Wu9KbI1nXArb8OAaMka2zc/Weqz3NPpgkafVpx7rVIkumhL/Nsz6zrmrihucLp8f652h/
 kDA8bal3Tc3Aec9rAdt3R8+FMmtu8AwWz1i/NrBbhJGn9mLXynfKRjJVzOf0M85E2q8NYQuQ
 7JrnyZLxJfzElzVXtn7+tifvwLUN17331t9VYinOSDTUYi4qTgQAULLzzbcCAAA=
X-CMS-MailID: 20190628103715eucas1p223f9d5f79bc6276e74f44956a0bc33c8
X-Msg-Generator: CA
X-RootMTR: 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5
References: <CGME20190627125803eucas1p1eb6a37f5fa96fd732e41ab1501367de5@eucas1p1.samsung.com>
 <908fc26e-3bfa-c204-6c32-7d814fdcb37b@samsung.com>
 <PSXP216MB0662D369EFFABF260394F179AAFC0@PSXP216MB0662.KORP216.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1561718237;
 bh=A3YT7mvbEnyhF8sgIIDRcFiVnS6/ZYDHzRlh/Z8RroM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=kKkGEuaZTZFv0BgUFs68hQa0hEVmA3adhR4b5SyhD2Io/7mSs65KuUjNpycCtR/yU
 D3QlBLm5tO/k/xCH5cukDjJoMDI0GAkPzwx9GOEG7HDgf5XMXv8p3zeZomXVWxaoe6
 JAUxVken/a7q7/Ngq6fx2+KhPp7ULfqUWJqvmMBs=
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjgvMTkgNzo1MCBBTSwgSmluZ29vIEhhbiB3cm90ZToKPiBPbiA2LzI3LzE5LCA5OjU4
IFBNLCBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IHdyb3RlOgo+Pgo+PiBVc2UgLT5zY3JlZW5f
YnVmZmVyIGluc3RlYWQgb2YgLT5zY3JlZW5fYmFzZSB0byBmaXggc3BhcnNlIHdhcm5pbmdzLgo+
Pgo+PiBbIFBsZWFzZSBzZWUgY29tbWl0IDE3YTdiMGI0ZDk3NCAoImZiLmg6IFByb3ZpZGUgYWx0
ZXJuYXRlIHNjcmVlbl9iYXNlCj4+ICAgcG9pbnRlciIpIGZvciBkZXRhaWxzLiBdCj4+Cj4+IFJl
cG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4gQ2M6IEppbmdv
byBIYW4gPGppbmdvb2hhbjFAZ21haWwuY29tPgo+IAo+IEFja2VkLWJ5OiBKaW5nb28gSGFuIDxq
aW5nb29oYW4xQGdtYWlsLmNvbT4KClRoYW5rcywgSSBxdWV1ZWQgdGhlIHBhdGNoIGZvciB2NS4z
LgoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZE
IEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
