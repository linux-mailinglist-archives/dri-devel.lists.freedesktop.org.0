Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA192A2AA2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 13:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571A6E4CA;
	Mon,  2 Nov 2020 12:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4CC6E4CA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:23:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20201102122320euoutp02c6bd67416dd072693a7edf89750cf088~DsFvP-YEM0378203782euoutp02P
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:23:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20201102122320euoutp02c6bd67416dd072693a7edf89750cf088~DsFvP-YEM0378203782euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604319800;
 bh=q7+ilGGLT18/vuSxWDQthCN3467HY9jEgT+ik8brKQk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nJ70JShet0S2a6Dqq8HgE/zaqAzGsrHM/nI+F5Iu7rDjZjC9ey0YXT3F8lRphW91K
 zagjVTkvu79AYGpDb7zgRtPlsJfW+U7opWVjDZTQ831O6gLBXBAGxG4fW/9V+7/ONk
 PKRtl4TBLewbaysAyJO2Rm47it72RrHttiZOswd0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201102122311eucas1p10c5ad39eb4e356d254f268fbda6ad4b4~DsFmsUMu80490104901eucas1p1R;
 Mon,  2 Nov 2020 12:23:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 77.30.06456.F2AFF9F5; Mon,  2
 Nov 2020 12:23:11 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201102122311eucas1p1805e9f745babaa133d80418bddf108a7~DsFmSwRB-2982429824eucas1p1e;
 Mon,  2 Nov 2020 12:23:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201102122311eusmtrp2d1c125a97c0549688cb333b9b5616db6~DsFmRWqTd2919729197eusmtrp2G;
 Mon,  2 Nov 2020 12:23:11 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-eb-5f9ffa2f975d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 85.B2.06314.E2AFF9F5; Mon,  2
 Nov 2020 12:23:10 +0000 (GMT)
Received: from [106.210.123.115] (unknown [106.210.123.115]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201102122309eusmtip27199189c706b9bdf043f5960224f430e~DsFlQd0A40348203482eusmtip2a;
 Mon,  2 Nov 2020 12:23:09 +0000 (GMT)
Subject: Re: [PATCH v7 2/6] interconnect: Add generic interconnect driver
 for Exynos SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <9ef1cf71-0729-d4f7-6a15-eb4ba1ffbefc@samsung.com>
Date: Mon, 2 Nov 2020 13:23:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201031121747.GB9399@kozik-lap>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTm3e7ursPZdSo7zFKY/iihmSVxyTATi0EU/q3IufKmK522qaUQ
 +JGl+cFwhbrMjQK1lZjDWX5iMlshurBIScWyofkxxKaFWpp3V8l/z3PO85xznpeX4IqGeRJC
 pc6kNWplqhQXYG1vVx0Hw9eMikNl0xJqsq4IUS3VzTxqZHmGRxltQzzq08oiTlV1W3CqclKH
 UQ7HSz71saMWp9zlNkRVO3o4VJNtgk+N5TfiVFG3jU9V62fxmD1yi7kEl49/7sLlk6V2jryi
 1YzkbktQPO+C4HgSnarKpjXh0YmClM6pN5yM7163GrosvDzk5t9HXgSQkbDont/CAkJENiJY
 sM/xWLKM4GFPPZclbgQlw1P4jsX1dHVb1YBgetyJsWQJgaG316PyIy/CN30Hl8H+5AEY+fvb
 4+CS6xwoNA96tuNkBJT3VyAGC8lo6P9T66ljZCg4n1V5zAFkAuha7mCsxhfe1zDbCMKLlMEL
 61GmzCXF8MVp5LA4GAqtjzxnA7nEhy5dDWL0QMZB04SCTeAHc/bW7QfYC5vtjJfRFyIo6xzj
 s0SHYNJuQqwqCsaH1nBmEHcrTXNHODvzJAzb9rPQB0ZdvuwJPlDZxlzPlIVQfFfEzgiFdXMV
 h8USKHVuYjokNezKZdgVxrArjOH/WhPCzEhMZ2nTkmlthJq+KdMq07RZ6mTZlfQ0C9r6aQMb
 9p+v0crw5T5EEkjqLez1MypEPGW2NietDwHBlfoLYwcHEkTCJGVOLq1JV2iyUmltHwokMKlY
 eOTJ7CURmazMpK/TdAat2elyCC9JHuoOmLlmDBtzxmwcjiwMOX2GPmtNVp9vedBW8UGc5Doh
 vl3T/C6GLtgXJ5Wd+iHo94uOqss6duPVeEHfdL2+4B6uShxMUKktgbEb0K6vQ93eY7+C1kcf
 W0OCu75GufV6k8l17mp121pxfMBa8fPR3IWm+WJBTcGm0wTL+fcVzVJMm6KMCONqtMp/5Yoh
 qWUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7p6v+bHG/x9ZWlxf14ro8XGGetZ
 La5/ec5qMf/IOVaLK1/fs1lM37uJzWLS/QksFufPb2C3uLxrDpvF594jjBYzzu9jslh75C67
 xe3GFWwWrXuPsFvMmPySzYHfY9OqTjaPO9f2sHnc7z7O5NG3ZRWjx+dNcgGsUXo2RfmlJakK
 GfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZux8dZCp4zFmxfM8m
 1gbGz+xdjJwcEgImEm8X/2TtYuTiEBJYyiixv3sqWxcjB1BCSmJ+ixJEjbDEn2tdbBA17xkl
 JixZyQJSIywQLTH1gyNIjYiApsT1v9/B5jAL/GaSOHDvMgtEw2NGibVzj4BtYxMwlOg92scI
 YvMK2Ekc/TMHLM4ioCLxZOV0ZhBbVCBO4sfEXjaIGkGJkzOfgC3jFNCTWLPVDCTMLKAu8Wfe
 JWYIW1zi1pP5TBC2vETz1tnMExiFZiHpnoWkZRaSlllIWhYwsqxiFEktLc5Nzy021CtOzC0u
 zUvXS87P3cQIjOFtx35u3sF4aWPwIUYBDkYlHt4DwvPjhVgTy4orcw8xSnAwK4nwOp09HSfE
 m5JYWZValB9fVJqTWnyI0RTot4nMUqLJ+cD0klcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9
 sSQ1OzW1ILUIpo+Jg1OqgVFaYvOjLJ00Fn9z52VvVtq+ZPEvP/6Wx/q2QHrLFfcdZsI7Zj/6
 djMzcNr9yRZX381ill9aZlY70ex3QlVLzKHQL7+KPu5YG6cm7PV/37uQ5Pr7cTZxlgw1LMmh
 sWsy+Ga9vTJHVFeyKu5uPcfsFbav7qst71yQK71cwOOK4lFW4d0e9ak5lkosxRmJhlrMRcWJ
 AHWDOub3AgAA
X-CMS-MailID: 20201102122311eucas1p1805e9f745babaa133d80418bddf108a7
X-Msg-Generator: CA
X-RootMTR: 20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9
References: <20201030125149.8227-1-s.nawrocki@samsung.com>
 <CGME20201030125301eucas1p218b0e654cb4c826b05280f28836da8d9@eucas1p2.samsung.com>
 <20201030125149.8227-3-s.nawrocki@samsung.com>
 <20201031121747.GB9399@kozik-lap>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzEuMTAuMjAyMCAxMzoxNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiBGcmks
IE9jdCAzMCwgMjAyMCBhdCAwMTo1MTo0NVBNICswMTAwLCBTeWx3ZXN0ZXIgTmF3cm9ja2kgd3Jv
dGU6Cj4+IFRoaXMgcGF0Y2ggYWRkcyBhIGdlbmVyaWMgaW50ZXJjb25uZWN0IGRyaXZlciBmb3Ig
RXh5bm9zIFNvQ3MgaW4gb3JkZXIKPj4gdG8gcHJvdmlkZSBpbnRlcmNvbm5lY3QgZnVuY3Rpb25h
bGl0eSBmb3IgZWFjaCAic2Ftc3VuZyxleHlub3MtYnVzIgo+PiBjb21wYXRpYmxlIGRldmljZS4K
Cj4+IFNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcu
Y29tPgoKPj4gIGRyaXZlcnMvaW50ZXJjb25uZWN0L0tjb25maWcgICAgICAgICB8ICAgMSArCj4+
ICBkcml2ZXJzL2ludGVyY29ubmVjdC9NYWtlZmlsZSAgICAgICAgfCAgIDEgKwo+PiAgZHJpdmVy
cy9pbnRlcmNvbm5lY3QvZXh5bm9zL0tjb25maWcgIHwgICA2ICsrCj4+ICBkcml2ZXJzL2ludGVy
Y29ubmVjdC9leHlub3MvTWFrZWZpbGUgfCAgIDQgKwo+PiAgZHJpdmVycy9pbnRlcmNvbm5lY3Qv
ZXh5bm9zL2V4eW5vcy5jIHwgMTk4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gCj4gSG93IGFib3V0IG5hbWluZyB0aGUgZGlyZWN0b3J5IGFzICJzYW1zdW5nIj8gSSBkb24n
dCBleHBlY3QgaW50ZXJjb25uZWN0Cj4gZHJpdmVycyBmb3IgdGhlIG9sZCBTYW1zdW5nIFMzQyBv
ciBTNVAgcGxhdGZvcm1zLCBidXQgaXQgd291bGQgYmUKPiBjb25zaXN0ZW55IHdpdGggb3RoZXIg
bmFtZXMgKG1lbW9yeSwgY2xrLCBwaW5jdHJsKS4KClN1cmUsIEkgd2lsbCByZW5hbWUgdGhlIGRp
cmVjdG9yeS4KCj4gSG93IGFib3V0IGFkZGluZyBzZXBhcmF0ZSBtYWludGFpbmVycyBlbnRyeSBm
b3IgdGhlIGRyaXZlciB3aXRoIHlvdSBhbmQKPiBBcnR1ciAoaWYgaGUgc3RpbGwgd29ya3Mgb24g
dGhpcyk/CgpJJ20gbm90IHN1cmUgd2hhdCdzIHRoZSBwcmVmZXJlbmNlIGluIHRoZSBzdWJzeXN0
ZW0sIEknbSBnb2luZyB0byBhZGQKYSBwYXRjaCBpbnRyb2R1Y2luZyBzdWNoIGEgbWFpbnRhaW5l
cnMgZW50cnkgYXMgaXQgbWlnaHQgYmUgaGVscGZ1bCAKZm9yIHJldmlld3MvdGVzdGluZy4gIAoK
LS0gClJlZ2FyZHMsClN5bHdlc3RlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
