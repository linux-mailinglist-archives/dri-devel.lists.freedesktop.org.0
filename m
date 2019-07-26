Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009F676BCF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 16:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4946ED92;
	Fri, 26 Jul 2019 14:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86336ED92
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:42:06 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190726144205euoutp011ee41c9b2f563a1b7c11a8e84ea55afc~0-BIQIOfy1896818968euoutp018
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 14:42:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190726144205euoutp011ee41c9b2f563a1b7c11a8e84ea55afc~0-BIQIOfy1896818968euoutp018
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190726144204eucas1p29fdfca908afd99f7e8122089ef89dd25~0-BHZqdiu2930529305eucas1p2u;
 Fri, 26 Jul 2019 14:42:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id D5.DD.04325.B311B3D5; Fri, 26
 Jul 2019 15:42:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190726144203eucas1p26523f3c212d09825cd4acbd75cc58a5f~0-BGqN2Z92930529305eucas1p2s;
 Fri, 26 Jul 2019 14:42:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190726144203eusmtrp10abf6250d4d73a795302e4390471a3df~0-BGcAggM0432204322eusmtrp1O;
 Fri, 26 Jul 2019 14:42:03 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-90-5d3b113b644c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.1A.04146.B311B3D5; Fri, 26
 Jul 2019 15:42:03 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190726144202eusmtip204104652d00728c2685c814d2d167fe2~0-BF5Hisb1184011840eusmtip2b;
 Fri, 26 Jul 2019 14:42:02 +0000 (GMT)
Subject: Re: [PATCH 0/4] video: of: display_timing: Adjust err printing of
 of_get_display_timing()
To: Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3fe0fa09-5e7f-158e-7551-e15f5c05ddc0@samsung.com>
Date: Fri, 26 Jul 2019 16:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190723083847.GA32268@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbSyVYRjHu8/z4mGObofmGo11ttqUt+TD4yW9zIdntUqtTWlWR55hHOwc
 Emo7+iCUIlSO9zlzJCLFwRIdco55yZmYKdXKh9RMK7SzUI6H5dvvvq7rf13//3YzhGSWcmZi
 E5J5RYIsXkrbkG395hHPQPvACJ9MFcvmjQyI2L9tBQQ7XPuKZt8uztNsToHGii1a1opY450f
 FDvWWUaz+uIuxE5/MJJsnbkVsebOCpJtqpyiD4u5sQkTwZWqTCTXtVRFch3qaSuuNLuE4t5P
 vKA53dInivt4yyDi7q74cJr74zRnmNSJuF8trqG24TZBUXx87BVe4R18ySZmuLyaTsrBV2vN
 uSIVWrHNRdYMYD8YejwmsrAE1yFofeqZi2zWeAFB3btRUnj8QtBk7kWbimfdQ1aCQotg4U+Q
 MDSHIPOnlrA0HHAUjH4uWmdHfAp6ykbXmcCNBJgq3CxM4wAouFm/tpRhxDgYNEWRljKJd8P3
 htn1WzvwOfjY30xZWIztYaBkhrSwNfaFxfzfGyudYGqmUiSwG+jmygiLH8DFDNzomLYSTIdA
 j7GPEtgBvhmeb9R3wmDhbVIQPEGwkv11Q61DoC1cpYWpQOg1mCiLUwK7Q1Ont1A+AoU5pesB
 ANvB5Jy9YMIO7rU9IISyGLKzJML0HmiubaY3z+Z2PCLykVS9JZp6Sxz1ljjq/3erEFmPnPgU
 pTyaVx5I4FO9lDK5MiUh2utyorwFrX3AwVXDYjt6uRypR5hBUltxqDkgQkLJrijT5HoEDCF1
 FLe2+0dIxFGytHRekXhRkRLPK/XIhSGlTuKMbZ8uSHC0LJmP4/kkXrHZFTHWzirUWBzel3J+
 lyY11cNe29AVMFJKHyOdWiRhaboLbnHqwflqPyKVGg45N/Amw7fEdCbUzeVpvX/G5/DK7ooa
 o97Ow6gJSww7GYxyzuYdvXZc5V6XnjWUFeB3LX9f/umHpLvqule415GDe8qP9p9YHpLXjC85
 1rhmL7y2bVk5FPMFbZeSyhjZ/r2EQin7B4GpE6d8AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsVy+t/xe7rWgtaxBu8bOS16z51ksvi/bSKz
 xdllB9ksrnx9z2bROXEJu8WUP8uZLE70fWC1uLxrDpvFoal7GS3u3jvBYrHi51ZGi5+75rFY
 rJ9/i82B1+PytYvMHrMbLrJ47P22gMVj56y77B6zO2ayety5tofNY/u3B6we97uPM3n0/zXw
 WDLtKpvH8RvbmTw+b5IL4InSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3
 s0lJzcksSy3St0vQyzg7dyFbQadAxbKfXUwNjH95uhg5OSQETCQ27z/D3sXIxSEksJRRYmfH
 X9YuRg6ghIzE8fVlEDXCEn+udbFB1LxmlNjz9hIbSEJYIEXiwqMpzCC2iICvxJaGLywgNrPA
 WmaJnvUSEA3bGCVuH3nJCJJgE7CSmNi+ihFkAa+AncSSKUkgYRYBVYnXayBKRAUiJM68XwE2
 h1dAUOLkzCdgNqeAkcTXCd+ZIearS/yZdwnKFpe49WQ+E4QtL7H97RzmCYxCs5C0z0LSMgtJ
 yywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIExvy2Yz8372C8tDH4EKMAB6MSD2/A
 T6tYIdbEsuLK3EOMEhzMSiK8W3dYxgrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAd5ZXE
 G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYAxwcXI3zvuy8thU9s9u
 n5gqKn28pnPcsvzawXj4/iObmQtUZh31WyfLb/N4yvVHvR0n5vjZXVzTxsqveGWW9ax/XlK+
 Ldrecx49FH/4XbDoVVLSqRI3Xy2WG2867b/IhV827VttnTu14/+l3UUZWds5dwfvqz9wVzNz
 Y8nKiflnWGWqz3pnXFViKc5INNRiLipOBAA7VTcoDwMAAA==
X-CMS-MailID: 20190726144203eucas1p26523f3c212d09825cd4acbd75cc58a5f
X-Msg-Generator: CA
X-RootMTR: 20190723084201epcas2p49dff78d4666e1451303afcf8163b2061
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190723084201epcas2p49dff78d4666e1451303afcf8163b2061
References: <20190722182439.44844-1-dianders@chromium.org>
 <CGME20190723084201epcas2p49dff78d4666e1451303afcf8163b2061@epcas2p4.samsung.com>
 <20190723083847.GA32268@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1564152125;
 bh=ZblZaWTmY5WlSFF9U+AKvrQQItNw1TLlK3jegZrPviw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=FoU0i5SaH0F0MhvNlL07ROEMeD5P1YHyodOno+FTGXx+XZeBxEb4vy6Ijf+Xw1CZI
 BEWu1z26ROrWBe671QmGCOkPxAlDC6Jb5/XtU4ANC5SAD1ISQ57VvnPofrZ57ykZ4p
 +s/bRZahOfND1kTkFc/y3CqsrkSlr7Er7KASPTL4=
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Russell King <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhpLAoKT24gNy8yMy8xOSAxMDozOCBBTSwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IEhpIERvdWdo
Lgo+IAo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDExOjI0OjM1QU0gLTA3MDAsIERvdWdsYXMg
QW5kZXJzb24gd3JvdGU6Cj4+IEFzIHJlcG9ydGVkIGJ5IFNhbSBSYXZuYm9yZyBbMV0sIGFmdGVy
IGNvbW1pdCBiOGEyOTQ4ZmEyYjMKPj4gKCJkcm0vcGFuZWw6IHNpbXBsZTogQWRkIGFiaWxpdHkg
dG8gb3ZlcnJpZGUgdHlwaWNhbCB0aW1pbmciKSB3ZSBub3cKPj4gc2VlIGEgcG9pbnRsZXNzIGVy
cm9yIG1lc3NhZ2UgcHJpbnRlZCBvbiBldmVyeSBib290IGZvciBtYW55IHN5c3RlbXMuCj4+IExl
dCdzIGZpeCB0aGF0IGJ5IGFkanVzdGluZyB3aG8gaXMgcmVzcG9uc2libGUgZm9yIHByaW50aW5n
IGVycm9yCj4+IG1lc3NhZ2VzIHdoZW4gb2ZfZ2V0X2Rpc3BsYXlfdGltaW5nKCkgaXMgdXNlZC4K
Pj4KPj4gTW9zdCBjZXJ0YWlubHkgd2UgY2FuIGJpa2VzaGVkIHRoZSB0b3BpYyBhYm91dCB3aGV0
aGVyIHRoaXMgaXMgdGhlCj4+IHJpZ2h0IGZpeCBvciB3ZSBzaG91bGQgaW5zdGVhZCBhZGQgbG9n
aWMgdG8gcGFuZWxfc2ltcGxlX3Byb2JlKCkgdG8KPj4gYXZvaWQgY2FsbGluZyBvZl9nZXRfZGlz
cGxheV90aW1pbmcoKSBpbiB0aGUgY2FzZSB3aGVyZSB0aGVyZSBpcyBubwo+PiAicGFuZWwtdGlt
aW5nIiBzdWItbm9kZS4gIElmIHRoZXJlIGlzIGNvbnNlbnN1cyB0aGF0IEkgc2hvdWxkIG1vdmUg
dGhlCj4+IGZpeCB0byBwYW5lbF9zaW1wbGVfcHJvYmUoKSBJJ20gaGFwcHkgdG8gc3BpbiB0aGlz
IHNlcmllcy4gIEluIHRoYXQKPj4gY2FzZSB3ZSBwcm9iYWJseSBzaG91bGQgX3JlbW92ZV8gdGhl
IGV4dHJhIHByaW50cyB0aGF0IHdlcmUgYWxyZWFkeQo+PiBwcmVzZW50IGluIHRoZSBvdGhlciB0
d28gY2FsbGVycyBvZiBvZl9nZXRfZGlzcGxheV90aW1pbmcoKS4KPj4KPj4gV2hpbGUgYXQgaXQs
IGZpeCBhIG1pc3Npbmcgb2Zfbm9kZV9wdXQoKSBmb3VuZCBieSBjb2RlIGluc3BlY3Rpb24uCj4+
Cj4+IE5PVEU6IGFtYmEtY2xjZCBhbmQgcGFuZWwtbHZkcyB3ZXJlIG9ubHkgY29tcGlsZS10ZXN0
ZWQuCj4+Cj4+IFsxXSBodHRwczovL2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNzIxMDkzODE1LkdB
NDM3NUByYXZuYm9yZy5vcmcKPj4KPj4KPj4gRG91Z2xhcyBBbmRlcnNvbiAoNCk6Cj4+ICAgdmlk
ZW86IG9mOiBkaXNwbGF5X3RpbWluZzogQWRkIG9mX25vZGVfcHV0KCkgaW4KPj4gICAgIG9mX2dl
dF9kaXNwbGF5X3RpbWluZygpCj4+ICAgdmlkZW86IG9mOiBkaXNwbGF5X3RpbWluZzogRG9uJ3Qg
eWVsbCBpZiBubyB0aW1pbmcgbm9kZSBpcyBwcmVzZW50Cj4+ICAgZHJtOiBwYW5lbC1sdmRzOiBT
cG91dCBhbiBlcnJvciBpZiBvZl9nZXRfZGlzcGxheV90aW1pbmcoKSBnaXZlcyBhbgo+PiAgICAg
ZXJyb3IKPj4gICB2aWRlbzogYW1iYS1jbGNkOiBTcG91dCBhbiBlcnJvciBpZiBvZl9nZXRfZGlz
cGxheV90aW1pbmcoKSBnaXZlcyBhbgo+PiAgICAgZXJyb3IKPiAKPiBTZXJpZXMgbG9va3MgZ29v
ZCAtIHRoYW5rcy4KPiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
Pgo+IAo+IFlvdSBjb3VsZCBjb25zaWRlciBzaWxlbmNpbmcgZGlzcGxheV90aW1pbmcgYXMgdGhl
IGxhc3QgcGF0Y2gsIGJ1dCB0aGF0cwo+IGEgdmVyeSBzbWFsbCBkZXRhaWwuCj4gCj4gSG93IGRv
IHdlIGFwcGx5IHRoZXNlIGZpeGVzIC0gdG8gZHJtLW1pc2MtbmV4dD8gQmFydGxvbWllaj8KPiAK
PiBObyBuZWVkIHRvIGdvIGluIHZpYSBkcm0tbWlzYy1maXhlcyBhcyB0aGUgb2ZmZW5kaW5nIGNv
bW1pdCBpcyBvbmx5IGluCj4gZHJtLW1pc2MtbmV4dC4KSSd2ZSBtZXJnZWQgdGhlIHdob2xlIHNl
cmllcyB0byBkcm0tbWlzYy1uZXh0LCB0aGFua3MhCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21p
ZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVs
ZWN0cm9uaWNzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
