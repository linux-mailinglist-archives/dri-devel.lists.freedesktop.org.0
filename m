Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35586D261D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0656EACD;
	Thu, 10 Oct 2019 09:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABE66EACD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:19:56 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20191010091955euoutp0234e89ea7b1f5d3b0cade96d4c06ae283~MPpidTtz_3113631136euoutp02M
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:19:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20191010091955euoutp0234e89ea7b1f5d3b0cade96d4c06ae283~MPpidTtz_3113631136euoutp02M
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191010091955eucas1p2588f38a374f53cf80341e33b7cb603a6~MPpiVq-pT1419214192eucas1p2q;
 Thu, 10 Oct 2019 09:19:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3D.4F.04374.AB7FE9D5; Thu, 10
 Oct 2019 10:19:55 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191010091954eucas1p29e790b33ca94fd7c39e172de7ca29e6d~MPph3L5UQ1419214192eucas1p2p;
 Thu, 10 Oct 2019 09:19:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191010091954eusmtrp2472ea2bf82f7876f6f9088dab32b1dec~MPph2hYo12311523115eusmtrp2m;
 Thu, 10 Oct 2019 09:19:54 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-f6-5d9ef7bad521
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F4.94.04166.AB7FE9D5; Thu, 10
 Oct 2019 10:19:54 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191010091954eusmtip248f4d3998d8c42180f6e4b0ba2cc50ed~MPphjJmXe0226202262eusmtip2D;
 Thu, 10 Oct 2019 09:19:54 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: tc358767: fix max_tu_symbol value
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jyri Sarha <jsarha@ti.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <95fb631e-9aff-35d4-a266-f3bc92ea4939@samsung.com>
Date: Thu, 10 Oct 2019 11:19:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924131702.9988-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsWy7djPc7q7v8+LNbhqZdHcYWvRdKiB1eLK
 1/dsFt2dHawWnROXsFusn3+LzYHN48HU/0weO2fdZfeY3TGT1eN+93Emj+M3tjMFsEZx2aSk
 5mSWpRbp2yVwZdxc8pS54DRfxY6Fp5gbGG9wdzFycEgImEj8XcfexcjFISSwglHi9JG/LBDO
 F0aJy9vuMXUxcgI5nxkldkwKB7FBGiZf/cUMUbScUWL34aNQ7W+BOl6tZQepEhZwkljz8gtY
 lYjAFEaJuZ/WMYMkmAXyJKZ/W8kCYrMJaEr83XyTDcTmFbCTmHm6gxHEZhFQldizYirYIFGB
 CIlPDw6zQtQISpyc+QSsl1PASmLl536omfIS29/OgbLFJW49mc8EslhCYB27xMbPC5khHnWR
 +LlVAuIFYYlXx7ewQ9gyEv93zmeCsOsl7q9oYYbo7WCU2LphJzNEwlri8PGLrCBzmIGOXr9L
 HyLsKNGzZzcTxHg+iRtvBSFO4JOYtG061FZeiY42IYhqRYn7Z7dCDRSXWHrhK9sERqVZSB6b
 heSZWUiemYWwdwEjyypG8dTS4tz01GLjvNRyveLE3OLSvHS95PzcTYzApHP63/GvOxj3/Uk6
 xCjAwajEw5txcm6sEGtiWXFl7iFGCQ5mJRHeRbPmxArxpiRWVqUW5ccXleakFh9ilOZgURLn
 rWZ4EC0kkJ5YkpqdmlqQWgSTZeLglGpgNFc9qTbhZvBe2figRSeeKCm/mH6uYOPrp1OOS8jH
 ZR46+a1Y4OL2nq3z7CNKQj6wTphxZeqagKSXPgozeVyXz9sUcP/oR7Gpqdw1fvW7t+c5r3pV
 HOIeaKjW8Y21IavUQY7XTnDCuqDG3vm7W94f1HOQSF2w79TUMmZLKb+ltSuKKg4f/bL0vBJL
 cUaioRZzUXEiAKuYilQ2AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7q7vs+LNVj3SNGiucPWoulQA6vF
 la/v2Sy6OztYLTonLmG3WD//FpsDm8eDqf+ZPHbOusvuMbtjJqvH/e7jTB7Hb2xnCmCN0rMp
 yi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL0Mu4ueQpc8Fp
 voodC08xNzDe4O5i5OSQEDCRmHz1F3MXIxeHkMBSRomH7xazQSTEJXbPf8sMYQtL/LnWxQZR
 9JpR4vaOPlaQhLCAk8Sal1/AikQEpjBK/PnK18XIwcEskCdx7bMGRH0vo8Shlm52kBo2AU2J
 v5tvgi3gFbCTmHm6gxHEZhFQldizYipYjahAhMThHbMYIWoEJU7OfMICYnMKWEms/NwPtotZ
 QF3iz7xLULa8xPa3c6BscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84
 Mbe4NC9dLzk/dxMjMNa2Hfu5eQfjpY3BhxgFOBiVeHgzTs6NFWJNLCuuzD3EKMHBrCTCu2jW
 nFgh3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemgbySeENTQ3MLS0NzY3NjMwslcd4OgYMx
 QgLpiSWp2ampBalFMH1MHJxSDYzZkhNnP35U+567jSVh984/N7ZyHCoUqz+UlGq/4a7jtMWi
 XEFrmb082z7p31/y/u7xDUavbrwtfX/7WfAz/VaeM1O78g7X7e49s0NUMtUnTd47c6aBqtob
 08mK37Yu0cn5vcV3ZqT4LaFDOjmFJ45M6d0pd20D/995Hj6Tap5xJfhOc5RQVOlXYinOSDTU
 Yi4qTgQA9lkC+csCAAA=
X-CMS-MailID: 20191010091954eucas1p29e790b33ca94fd7c39e172de7ca29e6d
X-Msg-Generator: CA
X-RootMTR: 20190924131723epcas2p27878e7a6c00a7a077260cf0c5cad5b1a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190924131723epcas2p27878e7a6c00a7a077260cf0c5cad5b1a
References: <CGME20190924131723epcas2p27878e7a6c00a7a077260cf0c5cad5b1a@epcas2p2.samsung.com>
 <20190924131702.9988-1-tomi.valkeinen@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570699195;
 bh=H8J8CLlSn2Th+aixiR2VCJ4+PQpOS5Bt3pQyGmjXDl0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=lfFh+gHUcwvLi7+kG0zl+mGxohK4uD/ghUsbQQkHMG6kb23p2yRw90hm7bNGRk5ci
 fDcUP0+aNDAmnIojPkI/hfcScpWbJbB8IPCXN+B3Y43h9w7dsGwxtlOHbLFXQAey3X
 jJ/eqxP3I+t91Zne5iSHcefN6IyPmIY6aAB6uGDQ=
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
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDkuMjAxOSAxNToxNywgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gbWF4X3R1X3N5bWJv
bCB3YXMgcHJvZ3JhbW1lZCB0byBUVV9TSVpFX1JFQ09NTUVOREVEIC0gMSwgd2hpY2ggaXMgbm90
Cj4gd2hhdCB0aGUgc3BlYyBzYXlzLiBUaGUgc3BlYyBzYXlzOgo+Cj4gcm91bmR1cCAoKGlucHV0
IGFjdGl2ZSB2aWRlbyBiYW5kd2lkdGggaW4gYnl0ZXMvb3V0cHV0IGFjdGl2ZSB2aWRlbwo+IGJh
bmR3aWR0aCBpbiBieXRlcykgKiB0dV9zaXplKQo+Cj4gSXQgaXMgbm90IHF1aXRlIGNsZWFyIHdo
YXQgdGhlIGFib3ZlIG1lYW5zLCBidXQgY2FsY3VsYXRpbmcKPiBtYXhfdHVfc3ltYm9sID0gKGlu
cHV0IEJwcyAvIG91dHB1dCBCcHMpICogdHVfc2l6ZSBzZWVtcyB0byB3b3JrIGFuZAo+IGZpeGVz
IHRoZSBpc3N1ZXMgc2Vlbi4KPgo+IFRoaXMgZml4ZXMgYXJ0aWZhY3RzIGluIHNvbWUgdmlkZW9t
b2RlcyAoZS5nLiAxMDI0eDc2OEA2MCBvbiAyLWxhbmVzICYKPiAxLjYyR2JwcyB3YXMgcHJldHR5
IGJhZCBmb3IgbWUpLgo+Cj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KCgpRdWV1ZWQgdG8gZml4ZXMuCgoKUmVnYXJkcwoKQW5kcnplagoKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDcgKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jCj4gaW5kZXggMTNhZGUyOGEzNmE4Li5iNmFhMWJkNDdlMWQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCj4gQEAgLTY3Nyw2ICs2NzcsOCBAQCBzdGF0
aWMgaW50IHRjX3NldF92aWRlb19tb2RlKHN0cnVjdCB0Y19kYXRhICp0YywKPiAgCWludCB1cHBl
cl9tYXJnaW4gPSBtb2RlLT52dG90YWwgLSBtb2RlLT52c3luY19lbmQ7Cj4gIAlpbnQgbG93ZXJf
bWFyZ2luID0gbW9kZS0+dnN5bmNfc3RhcnQgLSBtb2RlLT52ZGlzcGxheTsKPiAgCWludCB2c3lu
Y19sZW4gPSBtb2RlLT52c3luY19lbmQgLSBtb2RlLT52c3luY19zdGFydDsKPiArCXUzMiBiaXRz
X3Blcl9waXhlbCA9IDI0Owo+ICsJdTMyIGluX2J3LCBvdXRfYnc7Cj4gIAo+ICAJLyoKPiAgCSAq
IFJlY29tbWVuZGVkIG1heGltdW0gbnVtYmVyIG9mIHN5bWJvbHMgdHJhbnNmZXJyZWQgaW4gYSB0
cmFuc2ZlciB1bml0Ogo+IEBAIC02ODQsNyArNjg2LDEwIEBAIHN0YXRpYyBpbnQgdGNfc2V0X3Zp
ZGVvX21vZGUoc3RydWN0IHRjX2RhdGEgKnRjLAo+ICAJICogICAgICAgICAgICAgIChvdXRwdXQg
YWN0aXZlIHZpZGVvIGJhbmR3aWR0aCBpbiBieXRlcykpCj4gIAkgKiBNdXN0IGJlIGxlc3MgdGhh
biB0dV9zaXplLgo+ICAJICovCj4gLQltYXhfdHVfc3ltYm9sID0gVFVfU0laRV9SRUNPTU1FTkRF
RCAtIDE7Cj4gKwo+ICsJaW5fYncgPSBtb2RlLT5jbG9jayAqIGJpdHNfcGVyX3BpeGVsIC8gODsK
PiArCW91dF9idyA9IHRjLT5saW5rLmJhc2UubnVtX2xhbmVzICogdGMtPmxpbmsuYmFzZS5yYXRl
Owo+ICsJbWF4X3R1X3N5bWJvbCA9IERJVl9ST1VORF9VUChpbl9idyAqIFRVX1NJWkVfUkVDT01N
RU5ERUQsIG91dF9idyk7Cj4gIAo+ICAJZGV2X2RiZyh0Yy0+ZGV2LCAic2V0IG1vZGUgJWR4JWRc
biIsCj4gIAkJbW9kZS0+aGRpc3BsYXksIG1vZGUtPnZkaXNwbGF5KTsKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
