Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753120F890
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 17:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9CB6E3CE;
	Tue, 30 Jun 2020 15:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2846E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 15:41:31 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200630154130euoutp01d50d57c1b5a2a62ce4f61bf133c03486~dXKEj0JmT3086930869euoutp017
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 15:41:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200630154130euoutp01d50d57c1b5a2a62ce4f61bf133c03486~dXKEj0JmT3086930869euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593531690;
 bh=9+ZLNHccDw6coz73gcRe7hN+aPPjOugZXhzt0Urpb10=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Wiw+xl2QnqJRK70fj0aslQhPtb6MNS8iJKs7ADL6AMmR67lZJ4DEUnU6eo93oeVA2
 hEarkjDbsK5LT6MAD1yOFUwDU5QtY8iJKZsSR4nVOunctkJG6aMakPbgxY2T8stuPq
 2N/7XY36JADRaEAFA7izWH8ga04sPdsvA4MHTxuI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200630154129eucas1p17cd71ea4c71e6b908bd03beb386f8352~dXKD949CJ1267712677eucas1p1B;
 Tue, 30 Jun 2020 15:41:29 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id A2.6C.06456.92D5BFE5; Tue, 30
 Jun 2020 16:41:29 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200630154129eucas1p1b9fe4f782eaacfc3997bbb3742816326~dXKDjZNdh0182201822eucas1p1F;
 Tue, 30 Jun 2020 15:41:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200630154129eusmtrp1704148f4f0ae4aab4cfadc825f5a57d6~dXKDigtoR0929409294eusmtrp1N;
 Tue, 30 Jun 2020 15:41:29 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-27-5efb5d291577
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B0.27.06314.92D5BFE5; Tue, 30
 Jun 2020 16:41:29 +0100 (BST)
Received: from [106.210.85.205] (unknown [106.210.85.205]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200630154127eusmtip12655edbc046a96b358ecc5ebb417ec9c~dXKB8M9py1474314743eusmtip10;
 Tue, 30 Jun 2020 15:41:27 +0000 (GMT)
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Grygorii Strashko <grygorii.strashko@ti.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <21f5ec9c-2d1d-5f28-5aeb-ac0db144a55e@samsung.com>
Date: Tue, 30 Jun 2020 17:41:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGczvT6VAtDAXTE3CJdQloRIloxiXELTrERH10CWjBkUUopLUK
 vkBEtKAsFRu1gCFgAevSUhYFQyDFWAyyCLJIgGoUY1VopCwRlUiZEnn7zv3P/59zkkti4mm+
 Hxkrv8Aq5LJ4KSHEa1/96tgUGP47YsuH3jW0Pa8Z0ZV3jXxa+/EzQb+bdBB0eqmRoB/exume
 aTtGv/7Rg9OZmgcC2vypl0931xcStEXbgOgnL4cEtCXnFF00ocX2eDHdvW8xxtGfIWDqdEMC
 pkB9j8+YDZkE05LXxWMaix4LGNsNK4+pepDK5FQbENOUnY8z1v5nPMZpXnlMdFK4+ywbH3uR
 VWwOPSOMMbTY8KQ+7+SRzvg01OuZhTxIoELAlDvKy0JCUkxVILg/PYZxxQSCokazu3AiKC3/
 QyxYXpi+E5xQjqBPM+PuciCYKWoVuLp8qEgYqm7gu9iXioJfg7PzDoyqxWHw/ot5gaAC4W/V
 +/lYERUKA+0d82acWgcd12Z5Ll5GhUOOvtjd4w2v733GXexB7YRHpmHkYoxaBek1BRjHErgy
 8ZDvGgaUnoQ3+ib33gdgaqqMz7EPfLNWCzheDq35N3GOU8FWcRXjzGoENaY6jBN2wWD7zFwQ
 OTchEIz1m10I1F7Qf9rOoSf0j3pzK3jCrdo7GPcsAvU1MZexGmxtNe48Ceg7J4k8JNUtOky3
 6BjdomN0/8cWI9yAJKxKmRDNKoPl7KUgpSxBqZJHB0UlJpjR3HdsnbWOP0eTXZEWRJFIulSk
 XvE7QsyXXVSmJFgQkJjUV7SvrTVCLDorS7nMKhJPK1TxrNKC/ElcKhFtLbGHi6lo2QX2PMsm
 sYoFlUd6+KUhg8Qr76uhRHpubb2fzdf/8Hp/Q9DTy3/tYXXGJcXjtqa3GvPHjHYobs9QOa/v
 SLT7WMdV2oDC422OXcOnTgTklnhGaiZyj4SPOUvNEFvSqIkRhJQfisq6nX2wauOWnOSu0TJ1
 pQPEP68O5Du/bGMKmo/GKc6Eee9/lhEXYxppkOLKGFnwBkyhlP0DUG3b4ooDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42I5/e/4XV3N2N9xBv/7OSxeTjjMaLFxxnpW
 i6kPn7BZXPn6ns2iefF6NouVU1gsrn5/yWxx8s1VFovOiUvYLTY9vsZqcXnXHDaLQ1P3Mlqs
 PXKX3eJQX7TF3C9TmR34PS5fu8js8f5GK7vHzll32T1md8xk9di0qpPN48SES0we++euYfe4
 332cyWPzknqPvi2rGD0O9E5m8Th+YzuTx+dNcgG8UXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6
 RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZq07cZym4Lljx9EJOA+M1vi5GTg4JAROJ3Rte
 s4HYQgJLGSVW/dCDiItL7J7/lhnCFpb4c60LqIYLqOYto8Sh32vAEsICSRJ3t+xlBbFFBJIl
 vnS8YAEpYhbYxSJx4m8DO0THBSaJKTO2g61gE9CU+Lv5JpjNK2AncevceXYQm0VAVeJ82z8m
 EFtUIFbi270tUDWCEidnPmEBsTkFrCRWb7jHCGIzC5hJzNv8kBnClpdo3jobyhaXaPqyknUC
 o9AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIHpYNuxn5t3MF7a
 GHyIUYCDUYmHt0P2d5wQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzGaAj03
 kVlKNDkfmKrySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphakFsH0MXFwSjUwtm3o
 eOq+40Vz+ByOubarKzQWad/x/P5jw8ZZn4yuX+kXvhP4c078/sc7t0/zd+4odY09OHWRLo/H
 M+XiqiDxO7/CZr6+OPHijqk/FHvs5u7fsjpv31KFl6xiO5+0/399/mzt3urP/Qf9fb4lrety
 6N5w/u/XDZKRlmqhbw9tWci6pd8y6afmjm1KLMUZiYZazEXFiQAhCqvUHQMAAA==
X-CMS-MailID: 20200630154129eucas1p1b9fe4f782eaacfc3997bbb3742816326
X-Msg-Generator: CA
X-RootMTR: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e
References: <20200626100103.18879-1-a.hajda@samsung.com>
 <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
 <5f159e00-44fd-515b-dd8c-4db9845dc9e6@ti.com>
 <7e3c924b-c025-a829-6868-78e2935c70eb@samsung.com>
 <66faa188-5ef6-d449-07fe-28c8be5e559c@ti.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMwLjA2LjIwMjAgMTA6NTksIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOgo+IEhpCj4KPiBP
biAyOS8wNi8yMDIwIDE0OjI4LCBBbmRyemVqIEhhamRhIHdyb3RlOgo+PiBIaSBHcnlnb3JpaSwK
Pj4KPj4gKC4uLikKPj4KPj4+PiDCoMKgIC8qCj4+Pj4gwqDCoMKgICogZGVmZXJyZWRfZGV2c19z
aG93KCkgLSBTaG93IHRoZSBkZXZpY2VzIGluIHRoZSBkZWZlcnJlZCBwcm9iZQo+Pj4+IHBlbmRp
bmcgbGlzdC4KPj4+PiDCoMKgwqAgKi8KPj4+PiBAQCAtMjIxLDcgKzI0MSw4IEBAIHN0YXRpYyBp
bnQgZGVmZXJyZWRfZGV2c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywKPj4+PiB2b2lkICpkYXRh
KQo+Pj4+IMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZkZWZlcnJlZF9wcm9iZV9tdXRleCk7Cj4+
Pj4gwqDCoCDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoY3VyciwgJmRlZmVycmVkX3By
b2JlX3BlbmRpbmdfbGlzdCwKPj4+PiBkZWZlcnJlZF9wcm9iZSkKPj4+PiAtwqDCoMKgwqDCoMKg
wqAgc2VxX3ByaW50ZihzLCAiJXNcbiIsIGRldl9uYW1lKGN1cnItPmRldmljZSkpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHMsICIlc1x0JXMiLCBkZXZfbmFtZShjdXJyLT5kZXZp
Y2UpLAo+Pj4+ICsgY3Vyci0+ZGV2aWNlLT5wLT5kZWZlcnJlZF9wcm9iZV9yZWFzb24gPzogIlxu
Iik7Cj4+Pj4gwqDCoCDCoMKgwqDCoMKgIG11dGV4X3VubG9jaygmZGVmZXJyZWRfcHJvYmVfbXV0
ZXgpOwo+Pj4+Cj4+Pgo+Pj4gU3J5LCBtYXkgYmUgaSBtaXNzaW5nIHNtdGgsIGJ1dCBzaG91bGRu
J3QgaXQgYmUgb3B0aW9uYWwKPj4+IChDT05GSUdfREVCVUdfRlMgaXMgcHJvYmFibHkgdG9vIGdl
bmVyaWMpLgo+Pj4KPj4KPj4gSSBhbSBub3Qgc3VyZSB3aGF0IGV4YWN0bHkgYXJlIHlvdSByZWZl
cnJpbmcgdG8sIGJ1dCB0aGlzIHBhdGNoIGRvZXMgbm90Cj4+IGFkZCBuZXcgcHJvcGVydHksIGl0
IGp1c3QgZXh0ZW5kcyBmdW5jdGlvbmFsaXR5IG9mIGV4aXN0aW5nIG9uZS4KPgo+IFNyeSwgbmVl
ZGVkIHRvIGJlIG1vcmUgc3BlY2lmaWMuCj4KPiBZb3UndmUgYWRkZWTCoCBkZXZpY2Vfc2V0X2Rl
ZmVycmVkX3Byb2JlX3Jlc29uKGRldiwgJnZhZik7Cj4gd2hpY2ggZXhwZWN0ZWQgdG8gYmUgdXNl
ZCBvbiBldmVyeSBFUFJPQkVfREVGRVIgaW4gZGV2X2Vycl9wcm9iZSgpIGluIAo+IGNvbWJpbmF0
aW9uIHdpdGgKPgo+ICvCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkZXZpY2Vfc2V0X2RlZmVycmVkX3Byb2JlX3Jlc29uKGRldiwgJnZhZik7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9kYmcoZGV2LCAiZXJyb3IgJWQ6ICVw
ViIsIGVyciwgJnZhZik7Cj4KPiBeXiBkZXZfZGJnKCkgZG9lcyBub3QgYWRkIGFueSBydW50aW1l
IG92ZXJoZWFkIGR1cmluZyBib290IHVubGVzcyBlbmFibGVkCj4gK8KgwqDCoMKgwqDCoCB9Cj4K
PiBCdXQ6Cj4KPiArdm9pZCBkZXZpY2Vfc2V0X2RlZmVycmVkX3Byb2JlX3Jlc29uKGNvbnN0IHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IAo+IHZhX2Zvcm1hdCAqdmFmKQo+ICt7Cj4gK8KgwqDC
oMKgwqDCoCBjb25zdCBjaGFyICpkcnYgPSBkZXZfZHJpdmVyX3N0cmluZyhkZXYpOwo+ICsKPiAr
wqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJmRlZmVycmVkX3Byb2JlX211dGV4KTsKPiArCj4gK8Kg
wqDCoMKgwqDCoCBrZnJlZShkZXYtPnAtPmRlZmVycmVkX3Byb2JlX3JlYXNvbik7Cj4gK8KgwqDC
oMKgwqDCoCBkZXYtPnAtPmRlZmVycmVkX3Byb2JlX3JlYXNvbiA9IGthc3ByaW50ZihHRlBfS0VS
TkVMLCAiJXM6IAo+ICVwViIsIGRydiwgdmFmKTsKPiArCj4gK8KgwqDCoMKgwqDCoCBtdXRleF91
bmxvY2soJmRlZmVycmVkX3Byb2JlX211dGV4KTsKPiArfQo+Cj4gXl4gQWRkcyBsb2NraW5nLCBr
ZnJlZSgpIGFuZCBrYXNwcmludGYoKSBmb3IgZXZlcnkgZGVmZXJyZWQgcHJvYmUgCj4gZHVyaW5n
IGJvb3QgYW5kIGNhbid0IGJlIGRpc2FibGVkLgo+Cj4gUmlnaHQ/CgoKUmlnaHQsIGJ1dCB1c3Vh
bGx5IHRoZSBidXJkZW4gc2hvdWxkIGJlIGluc2lnbmlmaWNhbnQgaW4gY29tcGFyaXNvbiB0byAK
cHJvYmUgdGltZSwgc28gSSBkbyBub3QgdGhpbmsgaXQgaXMgd29ydGggb3B0aW1pemluZy4KCgpS
ZWdhcmRzCgpBbmRyemVqCgoKPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
