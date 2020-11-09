Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA22AAF97
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 03:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8083A894B7;
	Mon,  9 Nov 2020 02:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7D4894B7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:45:02 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201109024500epoutp03a70e7aa8236a310d7dd45eeff09e4c6b~Fttx0T2GB0728907289epoutp03H
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 02:45:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201109024500epoutp03a70e7aa8236a310d7dd45eeff09e4c6b~Fttx0T2GB0728907289epoutp03H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604889900;
 bh=6UJlkGa7vzbhC6EukK95zM4t99mD0NybVzLLJulFczc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=JR+QkZIgi2cnm0lTjwhLHYPZbj6IaZDZk+CaDjK+4EW5Ak7mK1cU7uaT4mVOrUsSG
 d8gh7pep/rNSDtE5p1/G8YYlldQ4DIryVCzHoIGMA7Ot5ufF/3I4z4qpFMHyymPBtI
 SZSOJ/2/ihpTckiUxD5/WX7prrEH/1J8kR04j/5s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201109024459epcas1p223f106ff4dd74f6be6c749fb7cc6aa81~FttwvBvFL0473704737epcas1p2O;
 Mon,  9 Nov 2020 02:44:59 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CTwMD5QZSzMqYlt; Mon,  9 Nov
 2020 02:44:56 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.5F.09582.82DA8AF5; Mon,  9 Nov 2020 11:44:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201109024456epcas1p167ed228ca19931089dbd923eef8aeaa0~FttuI3bp-3242532425epcas1p1B;
 Mon,  9 Nov 2020 02:44:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201109024456epsmtrp131a5b815a1f1b2106ccc2e762497340b~FttuIC1dv2564625646epsmtrp1B;
 Mon,  9 Nov 2020 02:44:56 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-27-5fa8ad2828ac
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 91.DE.13470.72DA8AF5; Mon,  9 Nov 2020 11:44:56 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201109024455epsmtip1587082fc9d6a8bb43761b83133cadd96~Fttt0A1hv3235732357epsmtip11;
 Mon,  9 Nov 2020 02:44:55 +0000 (GMT)
Subject: Re: [PATCH v2 04/16] drm/exynos: extract helper functions for probe
To: Sam Ravnborg <sam@ravnborg.org>, Michael Tretter <m.tretter@pengutronix.de>
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <ad146fc8-166a-b126-3e0c-617c2ed97561@samsung.com>
Date: Mon, 9 Nov 2020 11:52:17 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20201107222749.GD1052534@ravnborg.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmnq7G2hXxBv2ntSxurTvHarFxxnpW
 iytf37NZvLh3kcVi1dSdLBbnz29gt+icuITdYsb5fUwW21YA1R3qi7ZY8XMro8WMyS/ZLOZ9
 3snkwOvx/kYru8fOWXfZPWZ3zGT12LSqk83jfvdxJo/+vwYeS6ZdZfPo27KK0ePzJrkAzqhs
 m4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygs5UUyhJz
 SoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJucWleel6yfm5VoYGBkamQIUJ2RkH
 byxkK9jPWvG8vYu9gXEnSxcjJ4eEgInElVfHWLsYuTiEBHYwSqx9uYgdwvnEKNG6rgEq841R
 on/jZkaYliXb9kMl9jJKLJ93mgnCec8oseHoPnaQKmEBH4mPlyeC2SICgRKnHt9iBrGZBTYw
 SWy+ZgFiswmoSkxccZ8NxOYVsJNYeLcT7CgWARWJp33vmEBsUYEIiePdk9khagQlTs58AlbD
 CXTFm4tLWSFmikvcejKfCcKWl2jeOpsZ5CAJgTMcEn+PbGCGONtF4s7TVnYIW1ji1fEtULaU
 xMv+NnaIhmZGiYkzIN6REOhglLj7+Do0nIwl9i+dDJTgAFqhKbF+lz5EWFFi5++5jBCb+STe
 fe1hBSmREOCV6GgTgihRkjh28QY06CQkLiyZyAZR4iGxcGPJBEbFWUhem4XknVlI3pmFsHcB
 I8sqRrHUguLc9NRiwwJj5OjexAhO01rmOxinvf2gd4iRiYPxEKMEB7OSCG+Ly7J4Id6UxMqq
 1KL8+KLSnNTiQ4ymwMCeyCwlmpwPzBR5JfGGpkbGxsYWJoZmpoaGSuK8f7Q74oUE0hNLUrNT
 UwtSi2D6mDg4pRqYztn/OyG46uukwCfuDM6pUw275x6x6eYT/XVlyrdpRmWMUl9rJ676PHv5
 DLZLm37tDnpilz5vXw97ZNjNy257XzEU/d5nbGXs0rF0W5fajKNzPl7/5dHn/O51Z+VmCdvC
 SIUkK7Njn+5U77rymHn5je1iHXW/+7SEH1vvV9VUSn77szlpJ2fx59RnTrccIpct2rB++SRO
 VpXlTmG+d988MHaoreouv5mytK0rPSlTVv/VnA+v+V9bWO8VOXNvS3v+Lm7GAF75hGoFORGm
 r7q3t9gYmjseOGAiPtP2/ZfuE7KGGfWfr5k0bRQN6Ln5wzFqMUdfUsf+ndPkTZ7tOFBwZKnY
 CpV+0Y7neyyPH2TbqsRSnJFoqMVcVJwIAHXrpcBcBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsWy7bCSnK7G2hXxBtsvMVvcWneO1WLjjPWs
 Fle+vmezeHHvIovFqqk7WSzOn9/AbtE5cQm7xYzz+5gstq0AqjvUF22x4udWRosZk1+yWcz7
 vJPJgdfj/Y1Wdo+ds+6ye8zumMnqsWlVJ5vH/e7jTB79fw08lky7yubRt2UVo8fnTXIBnFFc
 NimpOZllqUX6dglcGQdvLGQr2M9a8by9i72BcSdLFyMnh4SAicSSbftZuxi5OIQEdjNKnD63
 mbmLkQMoISGxZSsHhCkscfhwMUTJW0aJ5tnnGUF6hQV8JD5ensgOYosIBEq0NF0Gm8kssIFJ
 Yv+KVIiGz4wSP293gCXYBFQlJq64zwZi8wrYSSy82wkWZxFQkXja944JxBYViJBouf+HHaJG
 UOLkzCdgNZxAh765uJQVYoG6xJ95l5ghbHGJW0/mM0HY8hLNW2czT2AUmoWkfRaSlllIWmYh
 aVnAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4KrU0dzBuX/VB7xAjEwfjIUYJ
 DmYlEd4Wl2XxQrwpiZVVqUX58UWlOanFhxilOViUxHlvFC6MExJITyxJzU5NLUgtgskycXBK
 NTApTBXN2S+jq5L8WMrvdj/fGf63P+qvVu0M+cvS3HtiT8o93j3njlzWmtqx4eAZ5UobL981
 M5jDpntPDT32PMBbrfXDqyku/BZvXiUU3czLq+J8+SBe7Kkn7wZe/dbvb5dlpj6afMd3Wqxw
 g2jVt4kri4JWeT1zNV62NUKVt/DIpf3cgY2F3gytHzfE+FW+ya913Zmr62Xo3DbZ9t3Etcek
 FHv8GTq3TshWsXn1ZXbe/lTj5Jk/qnZ+22o+n/uI0pH24Pm5a24Ff1M7E6X058eWDwkPk6K+
 x5/nvfsv+ICFR32ndbVdnsV88ag/v1v8nfQ/G6nPz69S9RTn+MYu9mfWIpO3ki/yUnxYmGzV
 SpRYijMSDbWYi4oTAXjaOHY5AwAA
X-CMS-MailID: 20201109024456epcas1p167ed228ca19931089dbd923eef8aeaa0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201107222757epcas1p4633e7287b326567a8e944a5b4f4a6273
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <20200911135413.3654800-5-m.tretter@pengutronix.de>
 <CGME20201107222757epcas1p4633e7287b326567a8e944a5b4f4a6273@epcas1p4.samsung.com>
 <20201107222749.GD1052534@ravnborg.org>
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, a.hajda@samsung.com, krzk@kernel.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gMTEuIDguIOyYpOyghCA3OjI37JeQIFNhbSBSYXZuYm9yZyDsnbQo6rCAKSDsk7Qg6riA
Ogo+IE9uIEZyaSwgU2VwIDExLCAyMDIwIGF0IDAzOjU0OjAxUE0gKzAyMDAsIE1pY2hhZWwgVHJl
dHRlciB3cm90ZToKPj4gQXMgdGhlIGRyaXZlciBzaGFsbCBiZSB1c2FibGUgd2l0aCBkcml2ZXJz
IHRoYXQgdXNlIHRoZSBjb21wb25lbnQKPj4gZnJhbWV3b3JrIGFuZCBkcml2ZXJzIHRoYXQgZG9u
J3QsIHNwbGl0IHRoZSBjb21tb24gcHJvYmluZyBjb2RlIGludG8gYQo+PiBzZXBhcmF0ZSBmdW5j
dGlvbiB0aGF0IGNhbiBiZSBjYWxsZWQgZnJvbSBkaWZmZXJlbnQgbG9jYXRpb25zLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFRyZXR0ZXIgPG0udHJldHRlckBwZW5ndXRyb25peC5kZT4K
PiBSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKVGhpcyBwYXRj
aCBhbmQgb3RoZXIgYXJlIHJlbGF0ZWQgdG8gd2hhdCB0aGlzIHBhdGNoIHNlcmllcyBkby4gSG93
ZXZlciwgdGhpcyBwYXRjaCBtYWtlcyBFeHlub3MgYm9hcmQgbm90IHdvcmtpbmcgeWV0LgpTbyBl
eGNlcHRpbmcgcGF0Y2hlcyAyIHRvIDMsIEkgd2lsbCB3YWl0IGZvciB0aGF0IHRoaXMgcGF0Y2gg
c2VyaWVzIHdpbGwgYmUgZml4ZWQgYW5kIHJldmlld2VkIG1vcmUuCgpUaGFua3MsCklua2kgRGFl
Cgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
