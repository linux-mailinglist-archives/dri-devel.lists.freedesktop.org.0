Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCD61ADEF8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 16:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853166E3FE;
	Fri, 17 Apr 2020 14:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF476E3FE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417140730euoutp01f61e3edf06368a7b7c123e941e66eab5~GoI4c1QDy1953319533euoutp01j
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200417140730euoutp01f61e3edf06368a7b7c123e941e66eab5~GoI4c1QDy1953319533euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587132450;
 bh=lsq2eSUvdBU1vvyLFdk6GKu1kqi9p8k3KwTJyUCI7Ug=;
 h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
 b=fBesXSfBbi8jc8LHt5Zc0oOTMLnEoJYnXT80KeSaPG6qRjXfVtkHaA/s2VHT/5/PF
 ErxwrHsgvHdRRgDBO8NhxGLGjCZqtlHYmZOxzbTBeVCFfTRBjyNNhvpsHSTAyYJWLR
 kj3wq9wbsK1QT3uZT8feZvV4ksI4Uwtuc2NJ0eFc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417140730eucas1p1e0695ecaef0e5846cbe3f882a7cd0adf~GoI4WQPWG1657316573eucas1p1l;
 Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 5D.BA.60698.228B99E5; Fri, 17
 Apr 2020 15:07:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200417140730eucas1p1c314f5fadf3f27aa5268c180a0c1d63b~GoI383igW1445114451eucas1p1i;
 Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200417140730eusmtrp126e85ae9b19c516579c0e491e09efe34~GoI38SGk12167921679eusmtrp1j;
 Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-6a-5e99b822aaab
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 45.B2.08375.228B99E5; Fri, 17
 Apr 2020 15:07:30 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417140730eusmtip2301934b40db4dd719801f43127a7a95c~GoI3sw5Gm0114701147eusmtip27;
 Fri, 17 Apr 2020 14:07:30 +0000 (GMT)
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <a53b8cfd-dc4b-322b-6661-ea4312152e92@samsung.com>
Date: Fri, 17 Apr 2020 16:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7pKO2bGGbQu07LobZrOZHHl63s2
 ixN9H1gtli1by+rA4rFz1l12j3knAz3udx9n8vi8SS6AJYrLJiU1J7MstUjfLoErY/nK08wF
 C/kqenZfYGtgPM7dxcjJISFgInFz/h/GLkYuDiGBFYwS/5s62UASQgJfGCWWbNWGSHxmlLj5
 /QA7TMeL433sEInljBJ/Xi2Aan/LKPHwwHFmkCo2ASuJie2rgBIcHMICwRK/TnmBhEUEzCXW
 TVoEtoFZIFRiQ8N7dpASXgE7iSmzwcIsAqoSN893soDYogIREp8eHGYFsXkFBCVOznwCFucU
 cJfom70Xaoy4xK0n85kgbHmJ5q2zmUHOkRCYzC5x9W4fI8TRLhIPvm1hgrCFJV4d3wL1jIzE
 6ck9LBAN6xgl/na8gOreziixfPI/Nogqa4k7536xgVzKLKApsX6XPkTYUeL9hW9MIGEJAT6J
 G28FIY7gk5i0bTozRJhXoqNNCKJaTWLDsg1sMGu7dq5knsCoNAvJa7OQvDMLyTuzEPYuYGRZ
 xSieWlqcm55abJyXWq5XnJhbXJqXrpecn7uJEZhWTv87/nUH474/SYcYBTgYlXh4DXpmxgmx
 JpYVV+YeYpTgYFYS4T3oBhTiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpiSWp2ampB
 ahFMlomDU6qBUbFcsXB+6OU7X4seMFvvaE49celhb+9Xi171zOsKb/PjLm1eXc+j0hLssuZ4
 whKZTY1fzrFpCd3feTq7+8q+K5MFjxkesU17l739k1d66SQe21faL9n5b+9wM/N9LXnmLN/n
 RbP6ljHMCXV/e+ZU8t4d0649mTV9y53bS5LTtIvFhO/zK37Je6DEUpyRaKjFXFScCAAxU5gE
 JwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xe7pKO2bGGaycKWbR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wAS5SeTVF+aUmqQkZ+cYmtUrShhZGe
 oaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexvKVp5kLFvJV9Oy+wNbAeJy7i5GTQ0LA
 ROLF8T72LkYuDiGBpYwSH74uBnI4gBIyEsfXl0HUCEv8udbFBlHzmlGibe9pFpAEm4CVxMT2
 VYwg9cICwRK/TnmBhEUEzCXWTVrEBmIzC4RK3L+9jgmidxajxMRzq9hA6nkF7CSmzAarYRFQ
 lbh5vhNspKhAhMThHbMYQWxeAUGJkzOfgMU5Bdwl+mbvhZqpLvFn3iVmCFtc4taT+UwQtrxE
 89bZzBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93ECIyjbcd+
 bt7BeGlj8CFGAQ5GJR5eg56ZcUKsiWXFlbmHGCU4mJVEeA+6AYV4UxIrq1KL8uOLSnNSiw8x
 mgI9N5FZSjQ5HxjjeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUa
 GIUmaOortRxtfJ8n/H3rerkS2wUPVYP6IrdlX/B4l3tD1/fWnwttf7v/Li9q5psd9DSbxdtr
 xSx+jwtrcib++bZM5M8n768ymhP/eCyYEtO1d3LrmYlzEj7cCrl+d+WJ85k29nvmanhsujiF
 4+ML/0zTMsbcuXcau0WNHfl/TOiVZVuR0yRy670SS3FGoqEWc1FxIgDkf0QLuQIAAA==
X-CMS-MailID: 20200417140730eucas1p1c314f5fadf3f27aa5268c180a0c1d63b
X-Msg-Generator: CA
X-RootMTR: 20200324170539eucas1p25909201d48429c9489c286ac18af0f1c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200324170539eucas1p25909201d48429c9489c286ac18af0f1c
References: <CGME20200324170539eucas1p25909201d48429c9489c286ac18af0f1c@eucas1p2.samsung.com>
 <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClsgYWRkZWQgZHJpLWRldmVsIE1MIHRvIENjOiBdCgpPbiAzLzI0LzIwIDY6MDUgUE0sIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiBVc2UgdGhlIC0+cHJvYmVfbmV3KCkgY2FsbGJhY2suCj4gCj4g
VGhlIGRyaXZlciBkb2VzIG5vdCB1c2UgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKiBhcmd1
bWVudCwKPiBzbyBjb252ZXJ0IGl0IHRvIHV0aWxpc2UgdGhlIHNpbXBsaWZpZWQgScKyQyBkcml2
ZXIgcmVnaXN0cmF0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKUGF0Y2ggcXVldWVkIGZvciB2NS44LCB0
aGFua3MuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3Vu
ZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgo+IC0tLQo+ICBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIHwgMTAgKystLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9zc2Qx
MzA3ZmIuYwo+IGluZGV4IDE0MjUzNTI2N2ZlYy4uMzk3ZWFlMjQ2YzJjIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2ZiLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3NzZDEzMDdmYi5jCj4gQEAgLTU4Niw4ICs1ODYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBzc2QxMzA3ZmJfb2ZfbWF0Y2hbXSA9IHsKPiAgfTsKPiAgTU9EVUxFX0RF
VklDRV9UQUJMRShvZiwgc3NkMTMwN2ZiX29mX21hdGNoKTsKPiAgCj4gLXN0YXRpYyBpbnQgc3Nk
MTMwN2ZiX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4gLQkJCSAgIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkICppZCkKPiArc3RhdGljIGludCBzc2QxMzA3ZmJfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgewo+ICAJc3RydWN0IGJhY2tsaWdodF9kZXZpY2Ug
KmJsOwo+ICAJY2hhciBibF9uYW1lWzEyXTsKPiBAQCAtNTk5LDExICs1OTgsNiBAQCBzdGF0aWMg
aW50IHNzZDEzMDdmYl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+ICAJdm9pZCAq
dm1lbTsKPiAgCWludCByZXQ7Cj4gIAo+IC0JaWYgKCFub2RlKSB7Cj4gLQkJZGV2X2VycigmY2xp
ZW50LT5kZXYsICJObyBkZXZpY2UgdHJlZSBkYXRhIGZvdW5kIVxuIik7Cj4gLQkJcmV0dXJuIC1F
SU5WQUw7Cj4gLQl9Cj4gLQo+ICAJaW5mbyA9IGZyYW1lYnVmZmVyX2FsbG9jKHNpemVvZihzdHJ1
Y3Qgc3NkMTMwN2ZiX3BhciksICZjbGllbnQtPmRldik7Cj4gIAlpZiAoIWluZm8pCj4gIAkJcmV0
dXJuIC1FTk9NRU07Cj4gQEAgLTgwOCw3ICs4MDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGky
Y19kZXZpY2VfaWQgc3NkMTMwN2ZiX2kyY19pZFtdID0gewo+ICBNT0RVTEVfREVWSUNFX1RBQkxF
KGkyYywgc3NkMTMwN2ZiX2kyY19pZCk7Cj4gIAo+ICBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIg
c3NkMTMwN2ZiX2RyaXZlciA9IHsKPiAtCS5wcm9iZSA9IHNzZDEzMDdmYl9wcm9iZSwKPiArCS5w
cm9iZV9uZXcgPSBzc2QxMzA3ZmJfcHJvYmUsCj4gIAkucmVtb3ZlID0gc3NkMTMwN2ZiX3JlbW92
ZSwKPiAgCS5pZF90YWJsZSA9IHNzZDEzMDdmYl9pMmNfaWQsCj4gIAkuZHJpdmVyID0gewo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
