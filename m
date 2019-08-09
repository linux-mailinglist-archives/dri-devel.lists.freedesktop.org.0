Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFF68788E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 13:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1786EDA0;
	Fri,  9 Aug 2019 11:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA6356EDA0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 11:30:04 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190809113003euoutp01b5f31d9ff38922f62d85bd8cb1e1b92d~5PbdS8vpA2630426304euoutp01_
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 11:30:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190809113003euoutp01b5f31d9ff38922f62d85bd8cb1e1b92d~5PbdS8vpA2630426304euoutp01_
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190809113002eucas1p21f587e91f425ab1fb27e14da3eaa6c69~5PbclTNt50338603386eucas1p2B;
 Fri,  9 Aug 2019 11:30:02 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 6C.85.04309.9395D4D5; Fri,  9
 Aug 2019 12:30:01 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190809113001eucas1p2b5ec955fb6968ef7ba052989c1a025a5~5PbbmQD0_1441114411eucas1p2O;
 Fri,  9 Aug 2019 11:30:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190809113001eusmtrp26cd3c65b5c16274b6c9d0dd72bedae4f~5PbbYJpwN0289302893eusmtrp2F;
 Fri,  9 Aug 2019 11:30:01 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-7b-5d4d593901f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 62.AE.04117.8395D4D5; Fri,  9
 Aug 2019 12:30:00 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190809113000eusmtip140190a6266d6eba38570fd1f7fce7976~5Pba42m7F0288202882eusmtip1Y;
 Fri,  9 Aug 2019 11:30:00 +0000 (GMT)
Subject: Re: [PATCH 01/22] ARM: omap1: innovator: pass lcd control address
 as pdata
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <af560012-053e-b439-8c6a-8d3f05ff1ef7@samsung.com>
Date: Fri, 9 Aug 2019 13:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190808212234.2213262-2-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7qWkb6xBof7rCzWvHCw+DvpGLvF
 la/v2SyaF69ns5jyZzmTxabH11gtTvR9YLW4vGsOm8XsJf0sFuvn32Kz2H/Fy4Hb4/evSYwe
 375OYvE4/HUhi8eda3vYPPbPXcPucb/7OJPH5iX1HsdvbGfy+LxJLoAzissmJTUnsyy1SN8u
 gStjW98P5oKrghVz5n1mb2B8ydfFyMkhIWAi8abhE0sXIxeHkMAKRonX33rYIJwvjBIrV16D
 ynxmlLgybw8TTEvjjX3sILaQwHJGiQ+7vSCK3jJKnP+9EaxIWCBU4kPvLDBbREBRYuqLZ8wg
 RcwCX5kkGjp2M4Ik2ASsJCa2rwKzeQXsJJpe3QGzWQRUJC413gFrFhWIkLh/bAMrRI2gxMmZ
 T1hAbE4BU4lNfS1g9cwC4hK3nsxngrDlJba/nQO2TELgI7vE4o1zoc52kVj64CY7hC0s8er4
 FihbRuL/TpBmkIZ1jBJ/O15AdW9nlFg++R8bRJW1xOHjF4HO4ABaoSmxfpc+iCkh4CixYK0e
 hMknceOtIMQNfBKTtk1nhgjzSnS0CUHMUJPYsGwDG8zWrp0rmScwKs1C8tksJN/MQvLNLIS1
 CxhZVjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSms9P/jn/ZwbjrT9IhRgEORiUe3gZF
 n1gh1sSy4srcQ4wSHMxKIrxXOHxjhXhTEiurUovy44tKc1KLDzFKc7AoifNWMzyIFhJITyxJ
 zU5NLUgtgskycXBKNTAK1MvnrOi1enc2aFbZVP34m6d2BicWPlOvFp8a92LdjReBPb7f1yQ9
 e/FotULdoUX79Oy4lxSefMbSIqflI+9upSD1ZU70zdf8q/7PjV9X8vbAxWWGb+4IrDhmpzlV
 eabEeddqkUlSmbZiIkK/dCf4lxXxMc7fslf00ZH22fzRr17kMAitSPNVYinOSDTUYi4qTgQA
 REp+JWMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oWkb6xBo8nW1mseeFg8XfSMXaL
 K1/fs1k0L17PZjHlz3Imi02Pr7FanOj7wGpxedccNovZS/pZLNbPv8Vmsf+KlwO3x+9fkxg9
 vn2dxOJx+OtCFo871/aweeyfu4bd4373cSaPzUvqPY7f2M7k8XmTXABnlJ5NUX5pSapCRn5x
 ia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Gtr4fzAVXBSvmzPvM3sD4
 kq+LkZNDQsBEovHGPvYuRi4OIYGljBIN8+eydTFyACVkJI6vL4OoEZb4c62LDaLmNaPE3ZW7
 WUASwgKhEqd+zmYHsUUEFCWmvnjGDFLELPCVSWLGrV9MEB2bGSVOPGwB62ATsJKY2L6KEcTm
 FbCTaHp1B8xmEVCRuNR4hwnEFhWIkDjzfgULRI2gxMmZT8BsTgFTiU19LWD1zALqEn/mXWKG
 sMUlbj2ZzwRhy0tsfzuHeQKj0Cwk7bOQtMxC0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnp
 esn5uZsYgRG87djPLTsYu94FH2IU4GBU4uHVkPeJFWJNLCuuzD3EKMHBrCTCe4XDN1aINyWx
 siq1KD++qDQntfgQoynQcxOZpUST84HJJa8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6Yklq
 dmpqQWoRTB8TB6dUA6PDe4aJsTsiIzJvBB4QmmAuzxSs7nfN+7Bau9u8KNt/7v/e7o+JORn2
 RiyFa/+eU4p6nnMPrFhVL/KwbsZfcUnOn+eWRZy4+6Thj1G9wKOJ94IU2I4XPiksVdk5+YCk
 S++ljefTWd+kpZsxHjvOOS+vQ+/T7fxtMm0O7Xlv3N7EeVwq/rh25n4lluKMREMt5qLiRABW
 xS779gIAAA==
X-CMS-MailID: 20190809113001eucas1p2b5ec955fb6968ef7ba052989c1a025a5
X-Msg-Generator: CA
X-RootMTR: 20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3
References: <20190808212234.2213262-1-arnd@arndb.de>
 <CGME20190808212328epcas1p36ee1f5a956c54d665dbe0c80d912e6b3@epcas1p3.samsung.com>
 <20190808212234.2213262-2-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565350203;
 bh=bTGInlSVhmUeSw5kWsgCeWb8NpQFnLIH+2lya/64BK8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Yho+5J3ctjkUpQmg6yU0ySm2Zc6G4n62d1d1Tqce4VwWxg83/Z6NnM4Q+Hi+QCG4q
 EhmRg8PPyVZ2i/njSBI+AZFFwyQ6VpleOdEC+edzN6/MjDxYYkpcpxMGHtX2KlQ0Lk
 lLqlSjfURsGLrGYMWqpyuyqaNmT+TsQxynem7sjY=
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
Cc: linux-fbdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvOC8xOSAxMToyMiBQTSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBUbyBhdm9pZCB1c2lu
ZyB0aGUgbWFjaC9vbWFwMTUxMC5oIGhlYWRlciBmaWxlLCBwYXNzIHRoZSBjb3JyZWN0Cj4gYWRk
cmVzcyBhcyBwbGF0Zm9ybSBkYXRhLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+CgpGb3IgZmJkZXYgcGFydDoKCkFja2VkLWJ5OiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2FyZHMsCi0t
CkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApT
YW1zdW5nIEVsZWN0cm9uaWNzCgo+IC0tLQo+ICBhcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJkLWlu
bm92YXRvci5jICB8IDMgKysrCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9sY2RfaW5uMTUx
MC5jIHwgNyArKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJkLWlu
bm92YXRvci5jIGIvYXJjaC9hcm0vbWFjaC1vbWFwMS9ib2FyZC1pbm5vdmF0b3IuYwo+IGluZGV4
IGNiZTA5M2Y5NjlkNS4uMjQyNWYxYmFjYjMzIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gt
b21hcDEvYm9hcmQtaW5ub3ZhdG9yLmMKPiArKysgYi9hcmNoL2FybS9tYWNoLW9tYXAxL2JvYXJk
LWlubm92YXRvci5jCj4gQEAgLTE5NCw2ICsxOTQsOSBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RldmljZSBpbm5vdmF0b3IxNTEwX3NtYzkxeF9kZXZpY2UgPSB7Cj4gIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlIGlubm92YXRvcjE1MTBfbGNkX2RldmljZSA9IHsKPiAgCS5uYW1lCQk9
ICJsY2RfaW5uMTUxMCIsCj4gIAkuaWQJCT0gLTEsCj4gKwkuZGV2CT0gewo+ICsJCS5wbGF0Zm9y
bV9kYXRhID0gKHZvaWQgX19mb3JjZSAqKU9NQVAxNTEwX0ZQR0FfTENEX1BBTkVMX0NPTlRST0ws
Cj4gKwl9Cj4gIH07Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSBpbm5vdmF0
b3IxNTEwX3NwaV9kZXZpY2UgPSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
b21hcC9sY2RfaW5uMTUxMC5jIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL2xjZF9pbm4xNTEw
LmMKPiBpbmRleCA3NzZlN2Y4ZDY1NmUuLjM3ZWQwYzE0YWE1YSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvbGNkX2lubjE1MTAuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvb21hcC9sY2RfaW5uMTUxMC5jCj4gQEAgLTE0LDE1ICsxNCwxNyBAQAo+ICAKPiAgI2lu
Y2x1ZGUgIm9tYXBmYi5oIgo+ICAKPiArc3RhdGljIHZvaWQgX19pb21lbSAqb21hcDE1MTBfZnBn
YV9sY2RfcGFuZWxfY29udHJvbDsKPiArCj4gIHN0YXRpYyBpbnQgaW5ub3ZhdG9yMTUxMF9wYW5l
bF9lbmFibGUoc3RydWN0IGxjZF9wYW5lbCAqcGFuZWwpCj4gIHsKPiAtCV9fcmF3X3dyaXRlYigw
eDcsIE9NQVAxNTEwX0ZQR0FfTENEX1BBTkVMX0NPTlRST0wpOwo+ICsJX19yYXdfd3JpdGViKDB4
Nywgb21hcDE1MTBfZnBnYV9sY2RfcGFuZWxfY29udHJvbCk7Cj4gIAlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgc3RhdGljIHZvaWQgaW5ub3ZhdG9yMTUxMF9wYW5lbF9kaXNhYmxlKHN0cnVjdCBsY2Rf
cGFuZWwgKnBhbmVsKQo+ICB7Cj4gLQlfX3Jhd193cml0ZWIoMHgwLCBPTUFQMTUxMF9GUEdBX0xD
RF9QQU5FTF9DT05UUk9MKTsKPiArCV9fcmF3X3dyaXRlYigweDAsIG9tYXAxNTEwX2ZwZ2FfbGNk
X3BhbmVsX2NvbnRyb2wpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgc3RydWN0IGxjZF9wYW5lbCBpbm5v
dmF0b3IxNTEwX3BhbmVsID0gewo+IEBAIC00OCw2ICs1MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgbGNk
X3BhbmVsIGlubm92YXRvcjE1MTBfcGFuZWwgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IGlubm92YXRv
cjE1MTBfcGFuZWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgewo+ICsJ
b21hcDE1MTBfZnBnYV9sY2RfcGFuZWxfY29udHJvbCA9ICh2b2lkIF9faW9tZW0gKilwZGV2LT5k
ZXYucGxhdGZvcm1fZGF0YTsKPiAgCW9tYXBmYl9yZWdpc3Rlcl9wYW5lbCgmaW5ub3ZhdG9yMTUx
MF9wYW5lbCk7Cj4gIAlyZXR1cm4gMDsKPiAgfQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
