Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D1175E81
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 16:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E386E504;
	Mon,  2 Mar 2020 15:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0F56E504
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200302154235euoutp0185d8b2b683b800f0424d8432a25522bc~4hwwl6unl1322613226euoutp01E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 15:42:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200302154235euoutp0185d8b2b683b800f0424d8432a25522bc~4hwwl6unl1322613226euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583163755;
 bh=eDSx6Ol5pio0KwUFZPvqg82H3h7F/bFkN2rPoKXN2sk=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=I+9jLMj6PfEz8LZIIkSatEnPKBNpfMzC7vvS7L+CPqfFVpuz4hmACpdbK+JD6xdvC
 B+UDGG4TE1aS5UvrxeAusWjLDvKCt3gwI0LP3AUcnH+Bl52Z4z4WX0jcsMpesJqJXz
 ri6VRmuI4j3LnO9yeXZ6zakO1j3+joPPdf812E54=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200302154235eucas1p29481c369be662e126846f6913f0f7bf9~4hwwf4o3f2199621996eucas1p2S;
 Mon,  2 Mar 2020 15:42:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D8.C3.60698.B692D5E5; Mon,  2
 Mar 2020 15:42:35 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154234eucas1p28d4029255b58b6cd63e587655010efbc~4hwwKKjeM2399223992eucas1p2O;
 Mon,  2 Mar 2020 15:42:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200302154234eusmtrp1257456edfec660818add2723ecf1872d~4hwwJjINk2922329223eusmtrp1M;
 Mon,  2 Mar 2020 15:42:34 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-84-5e5d296bb470
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.00.07950.A692D5E5; Mon,  2
 Mar 2020 15:42:34 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200302154234eusmtip2f17357d24d4c7770d7325bb853ea054b~4hwv0j-m32188921889eusmtip2H;
 Mon,  2 Mar 2020 15:42:34 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] video: remove set but not used variable 'ulScaleRight'
To: yu kuai <yukuai3@huawei.com>
Message-ID: <0b16ece5-a95c-5420-b5d4-7c576171780f@samsung.com>
Date: Mon, 2 Mar 2020 16:42:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200119121945.12517-1-yukuai3@huawei.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djPc7rZmrFxBtvOM1tc+fqezeJE3wdW
 i8u75rBZXHt3hs1izkI2i4WPbrA5sHm0HHnL6nG/+ziTx+dNcgHMUVw2Kak5mWWpRfp2CVwZ
 +5acZSro4ql4dOs2WwPjd84uRk4OCQETicPbl7CB2EICKxglTrVadTFyAdlfGCXOXj3ICuF8
 ZpR4efQXUBUHWMeZ//UQ8eWMErdXfGCG6H7LKNHa7wdiswlYSUxsX8UIYgsLeEvMXfudBcQW
 EVCQuNX8gh2kmVmgh1HiwJc9YAleATuJddf/gw1iEVCR6Dn8hhXEFhWIkPj04DArRI2gxMmZ
 T8DqOQUsJBatPcQOYjMLiEvcejKfCcKWl2jeOpsZZIGEwGR2iSdPp7JD/OkisX33MiYIW1ji
 1fEtUHEZidOTe1ggGtYxSvzteAHVvZ1RYvnkf2wQVdYSd85B/M8soCmxfpc+RNhRYs2hfnZI
 sPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahIblm1gg1nbtXMl8wRGpVlIXpuF5J1ZSN6ZhbB3
 ASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMAUc/rf8a87GPf9STrEKMDBqMTDG8Ac
 GyfEmlhWXJl7iFGCg1lJhNeXMzpOiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/xopexQgLpiSWp
 2ampBalFMFkmDk6pBsaDxgeTj32f01a9w3bpHdni2stW7z1V7eWmaqwR+ypyK417W67gWpsD
 a/mNvcsWy2df4prUPj9slVS7RHV1aFGvd/WD9qVvS+VE5uyfc/9O1u5Y/QXvJMSm9CW4rvx5
 5/G+EP0/b5aJzmJkWnSZZafNRwHZc96nZLOX1MldFz5/pa89VCFI5L8SS3FGoqEWc1FxIgAd
 hsuNLQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRmVeSWpSXmKPExsVy+t/xe7pZmrFxBk/O6Vpc+fqezeJE3wdW
 i8u75rBZXHt3hs1izkI2i4WPbrA5sHm0HHnL6nG/+ziTx+dNcgHMUXo2RfmlJakKGfnFJbZK
 0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ+5acZSro4ql4dOs2WwPjd84u
 Rg4OCQETiTP/67sYuTiEBJYySqy6+4cdIi4jcXx9WRcjJ5ApLPHnWhcbRM1rRomHb16wgSTY
 BKwkJravYgSxhQW8Jeau/c4CYosIKEjcan7BDmIzC/QwSvyaFw/R3A204PsssAZeATuJddf/
 M4PYLAIqEj2H37CC2KICERKHd8DUCEqcnPkEbCingIXEorWHoIaqS/yZd4kZwhaXuPVkPhOE
 LS/RvHU28wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAmNq
 27GfW3Ywdr0LPsQowMGoxMP7gyE2Tog1say4MvcQowQHs5IIry9ndJwQb0piZVVqUX58UWlO
 avEhRlOg5yYyS4km5wPjPa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8T
 B6dUA2PMHeNfqVYN36wnSR7I5WKxOntwhkTc7nVf5OVqTkjFRH1TlP3ifkL1+2nbzrACu4A4
 pt6Kf+0p5vtrs4/41SmZ1mTnrTStY9zkZq5i/7Wdo9Z5V2/fimcrElRti9olJkrqs0geqilc
 Z+c81W73jutL16w7dMh85/qNfVF7Fb/Myc+VbHwxS4mlOCPRUIu5qDgRAPeAlIK/AgAA
X-CMS-MailID: 20200302154234eucas1p28d4029255b58b6cd63e587655010efbc
X-Msg-Generator: CA
X-RootMTR: 20200119122043eucas1p2b450cd177ca0d86d268323a074c82b05
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200119122043eucas1p2b450cd177ca0d86d268323a074c82b05
References: <CGME20200119122043eucas1p2b450cd177ca0d86d268323a074c82b05@eucas1p2.samsung.com>
 <20200119121945.12517-1-yukuai3@huawei.com>
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
Cc: zhengbin13@huawei.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yi.zhang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjAgMToxOSBQTSwgeXUga3VhaSB3cm90ZToKPiBGaXhlcyBnY2MgJy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4gCj4gZHJpdmVycy92aWRlby9mYmRldi9reXJv
L1NURzQwMDBPdmVybGF5RGV2aWNlLmM6IEluIGZ1bmN0aW9uCj4g4oCYU2V0T3ZlcmxheVZpZXdQ
b3J04oCZOgo+IGRyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9TVEc0MDAwT3ZlcmxheURldmljZS5j
OjMzNDoxOTogd2FybmluZzoKPiB2YXJpYWJsZSDigJh1bFNjYWxlUmlnaHTigJkgc2V0IGJ1dCBu
b3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAKPiBJdCBpcyBuZXZlciB1c2Vk
LCBhbmQgc28gY2FuIGJlIHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVr
dWFpM0BodWF3ZWkuY29tPgoKUGF0Y2ggcXVldWVkIGZvciB2NS43LCB0aGFua3MuCiAKQmVzdCBy
ZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0
ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRl
di9reXJvL1NURzQwMDBPdmVybGF5RGV2aWNlLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYva3lyby9TVEc0MDAwT3ZlcmxheURldmljZS5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9reXJvL1NURzQwMDBPdmVybGF5RGV2aWNlLmMKPiBpbmRleCAwYWVlYWExMDcwOGIuLjlm
ZGUwZTNiNjllYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2t5cm8vU1RHNDAw
ME92ZXJsYXlEZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYva3lyby9TVEc0MDAw
T3ZlcmxheURldmljZS5jCj4gQEAgLTMzMSw3ICszMzEsNyBAQCBpbnQgU2V0T3ZlcmxheVZpZXdQ
b3J0KHZvbGF0aWxlIFNURzQwMDBSRUcgX19pb21lbSAqcFNUR1JlZywKPiAgCXUzMiB1bFNjYWxl
Owo+ICAJdTMyIHVsTGVmdCwgdWxSaWdodDsKPiAgCXUzMiB1bFNyY0xlZnQsIHVsU3JjUmlnaHQ7
Cj4gLQl1MzIgdWxTY2FsZUxlZnQsIHVsU2NhbGVSaWdodDsKPiArCXUzMiB1bFNjYWxlTGVmdDsK
PiAgCXUzMiB1bGhEZWNpbTsKPiAgCXUzMiB1bHNWYWw7Cj4gIAl1MzIgdWxWZXJ0RGVjRmFjdG9y
Owo+IEBAIC00NzAsNyArNDcwLDYgQEAgaW50IFNldE92ZXJsYXlWaWV3UG9ydCh2b2xhdGlsZSBT
VEc0MDAwUkVHIF9faW9tZW0gKnBTVEdSZWcsCj4gIAkJICogcm91bmQgZG93biB0aGUgcGl4ZWwg
cG9zIHRvIHRoZSBuZWFyZXN0IDggcGl4ZWxzLgo+ICAJCSAqLwo+ICAJCXVsU2NhbGVMZWZ0ID0g
dWxTcmNMZWZ0Owo+IC0JCXVsU2NhbGVSaWdodCA9IHVsU3JjUmlnaHQ7Cj4gIAo+ICAJCS8qIHNo
aWZ0IGZ4c2NhbGUgdW50aWwgaXQgaXMgaW4gdGhlIHJhbmdlIG9mIHRoZSBzY2FsZXIgKi8KPiAg
CQl1bGhEZWNpbSA9IDA7Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
