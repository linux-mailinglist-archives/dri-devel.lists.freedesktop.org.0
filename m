Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94ED2D2145
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 09:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBE56EA9E;
	Thu, 10 Oct 2019 07:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED3DB6EA9E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:01:36 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191010070134euoutp0178b8fa0c3448442815e6e460936fd326~MNwwPtCu33197831978euoutp01I
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191010070134euoutp0178b8fa0c3448442815e6e460936fd326~MNwwPtCu33197831978euoutp01I
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191010070134eucas1p2af696c60adf770326146e56b386b805b~MNwwBIelY0356003560eucas1p2i;
 Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 9A.36.04374.E47DE9D5; Thu, 10
 Oct 2019 08:01:34 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191010070134eucas1p1a5a9a64e9eb496fac919e77c68864367~MNwvrCUIb1596515965eucas1p1H;
 Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191010070134eusmtrp24d534bf82ee054ba29762009c4844c49~MNwvqSa7r0121201212eusmtrp2i;
 Thu, 10 Oct 2019 07:01:34 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-23-5d9ed74ea7f7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id A8.B0.04117.E47DE9D5; Thu, 10
 Oct 2019 08:01:34 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191010070133eusmtip10aba0388d0be7fe5d8fda6ce38dd381e~MNwvHoUj01290012900eusmtip1d;
 Thu, 10 Oct 2019 07:01:33 +0000 (GMT)
Subject: Re: [PATCH RESEND] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <4887a9f6-8f37-d56b-322b-c04a38b7361e@samsung.com>
Date: Thu, 10 Oct 2019 09:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SaUhUYRT1m/dm5s3UyOe4XVwKBw2S0iKJB4oYJL1flRUtLtSYD3edZlzr
 R6JZ44pLFI7mmCiZKKPmTkWM5CiapTWpSS5hgdIguZXhkjNPyX/n3nPPved8fBQhHeA7UdEJ
 SawyQR4nE4jJ9t6190fPjlaGHcv660kXDPXz6K32YoL+tLIgoI2/5wi6/6eRpHOKa4S0emMZ
 0R+7KwS0vjCELhw6EyBmFsayhcyr1SqSKVeX8Zm+ohEe07E6zWem8gw85sdTHcm8KSglmaWW
 A+dFwWK/CDYuOoVVevvfEEctf2smFI0Oab/qB4gMpJPmIhEF2AcmjS1kLhJTUlyHoKCsjWcm
 pHgZQUY2yxFLCP7MlpG7ioyt/B3FMwTa4oeIK0wIyjvqheYpWxwGUzkFyIzt8GXoza6xKAjc
 xIP6B/OEmRDgw7DxYlxgxhLsDxWF3ZY+iT1gNK/Tgu3xVVic7uFzMzbQXzZrsSHCgVCrrrNg
 Ah+EDlMFwWFH+DKr5ZmPAZ4TQkNmw7aY2i5OQ++qCxfBFuYNrUIOu8BWl5bH4bswVXeP4LRq
 BG1NXQRH+EKPYdiyh9g2rev25tqnYKJ1nODWW8OYyYazYA0l7Y932hJQ3995ajeYete2s9AR
 aj+sCIqQTLMnmGZPGM2eMJr/d6sQWY8c2WRVfCSrOpHApnqp5PGq5IRIr5uJ8S1o+4sNbBpW
 OtHr9XA9whSS7ZdE9T8Jk/LlKar0eD0CipDZSao1FWFSSYQ8/TarTLyuTI5jVXrkTJEyR8kd
 q+kQKY6UJ7GxLKtglbssjxI5ZaAkhcJbv/lVqnGNeDvzOeZSABl8xeeCacaYGYLJa761EUUl
 rh7hg2u42quxtDDxuUJhNxhqf46JDeqyEhhcRZsnA0eOrDknGy+mhOb7xcRNut+ixN9lqQqr
 wD6REPnqOh8tV3sNL66/1OqyDvm7I4cqvtZnn1tQV+WEa3OaSUaqouTHPQmlSv4Pdi93YV4D
 AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRmVeSWpSXmKPExsVy+t/xu7p+1+fFGqxbLWDRe+4kk8X/bROZ
 La58fc9mcfX7S2aLk2+uslh0TlzCbtHx9wujxeVdc9gsDvVFW/Sdc3fg8nh/o5XdY++3BSwe
 sztmsnqcmHCJyWP7twesHve7jzN5PFu4nsXjQO9kFo/Pm+QCOKP0bIryS0tSFTLyi0tslaIN
 LYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr482shcsFas4uOq08wNjOuFuhg5
 OSQETCQa/vewdDFycQgJLGWUOPT4ABNEQlxi9/y3zBC2sMSfa11sEEWvGSUWHJrJCJIQFoiV
 uN/ZC2aLCIRJXJ0zhx2kiFlgA5PE/+6vrCAJIYEZjBKXlseC2GwCmhJ/N99kA7F5Bewk5vTt
 AtvAIqAqcb17B5gtKhAhcXjHLEaIGkGJkzOfsIDYnAKuEks7VoDZzALqEn/mXWKGsOUltr+d
 A2WLS9x6Mp9pAqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiB
 kbvt2M8tOxi73gUfYhTgYFTi4T1wem6sEGtiWXFl7iFGCQ5mJRHeRbPmxArxpiRWVqUW5ccX
 leakFh9iNAV6biKzlGhyPjCp5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C
 6WPi4JRqYFTX3xHeOcc0+cqWkiK+6322lqJ7jrY5LNn8k9FNVC5CcBmba8VB954U/VIXMf9v
 aYcTay1KVvU13HtW+jtztXJMttu9j6EPvpaHWi1t1Vpw3bG68tCs+4cmCWV9N3qj5nFnQtCi
 Qzu3vZh+2SrzyppPn2wmCpdce5zLdeHU/YObNZv1RbdveaXEUpyRaKjFXFScCACNG0To8gIA
 AA==
X-CMS-MailID: 20191010070134eucas1p1a5a9a64e9eb496fac919e77c68864367
X-Msg-Generator: CA
X-RootMTR: 20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd
References: <CGME20191008203330epcas2p31dc15af8587d35eba5a03f71418587bd@epcas2p3.samsung.com>
 <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1570690895;
 bh=9Qb+HXoM3YSdNp11C3zR48b48VxCNTQVc82NaoKIpeM=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ssT0DKap7RhJWuDbhwIuXjSv+TlyC23cS6Q78WjmPplrBQD/PHCQmTkYC8uPw6nTS
 cZt8SycnfSmI42wTAFvQHhPgvqIbG+EIcmO+KCqvqov+yzq1XFKfYS70Tq1omCAAeo
 /uTPC3co/Il3iR0lgnCxwKLODujiMX5duJUjc6eg=
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDguMTAuMjAxOSAyMjozMywgV29sZnJhbSBTYW5nIHdyb3RlOgo+IE1vdmUgZnJvbSB0aGUg
ZGVwcmVjYXRlZCBpMmNfbmV3X2R1bW15KCkgdG8gZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSgp
Lgo+IFdlIG5vdyBnZXQgYW4gRVJSUFRSIHdoaWNoIHdlIHVzZSBpbiBlcnJvciBoYW5kbGluZyBh
bmQgd2UgY2FuIHNraXAKPiByZW1vdmFsIG9mIHRoZSBjcmVhdGVkIGRldmljZXMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29t
Pgo+IC0tLQoKCkFwcGxpZWQsIHRoeC4KCgpSZXJnYXJkcwoKQW5kcnplagoKCj4KPiBSZWJhc2Vk
IHRvIHY1LjQtcmMyIHNpbmNlIGxhc3QgdGltZS4gT25lIG9mIHRoZSBsYXN0IHR3byB1c2VycyBv
ZiB0aGUKPiBvbGQgQVBJLCBzbyBwbGVhc2UgYXBwbHkgc29vbiwgc28gSSBjYW4gcmVtb3ZlIHRo
ZSBvbGQgaW50ZXJmYWNlLiBPbmx5Cj4gYnVpbGQgdGVzdGVkLgo+Cj4gIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lpOTIzNC5jIHwgMzYgKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zaWk5MjM0LmMKPiBpbmRleCAyNWQ0YWQ4YzdhZDYuLjhhNmM4NTY5M2E4
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkyMzQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTIzNC5jCj4gQEAgLTg0MSwzOSArODQxLDI4IEBA
IHN0YXRpYyBpbnQgc2lpOTIzNF9pbml0X3Jlc291cmNlcyhzdHJ1Y3Qgc2lpOTIzNCAqY3R4LAo+
ICAKPiAgCWN0eC0+Y2xpZW50W0kyQ19NSExdID0gY2xpZW50Owo+ICAKPiAtCWN0eC0+Y2xpZW50
W0kyQ19UUEldID0gaTJjX25ld19kdW1teShhZGFwdGVyLCBJMkNfVFBJX0FERFIpOwo+IC0JaWYg
KCFjdHgtPmNsaWVudFtJMkNfVFBJXSkgewo+ICsJY3R4LT5jbGllbnRbSTJDX1RQSV0gPSBkZXZt
X2kyY19uZXdfZHVtbXlfZGV2aWNlKCZjbGllbnQtPmRldiwgYWRhcHRlciwKPiArCQkJCQkJCSBJ
MkNfVFBJX0FERFIpOwo+ICsJaWYgKElTX0VSUihjdHgtPmNsaWVudFtJMkNfVFBJXSkpIHsKPiAg
CQlkZXZfZXJyKGN0eC0+ZGV2LCAiZmFpbGVkIHRvIGNyZWF0ZSBUUEkgY2xpZW50XG4iKTsKPiAt
CQlyZXR1cm4gLUVOT0RFVjsKPiArCQlyZXR1cm4gUFRSX0VSUihjdHgtPmNsaWVudFtJMkNfVFBJ
XSk7Cj4gIAl9Cj4gIAo+IC0JY3R4LT5jbGllbnRbSTJDX0hETUldID0gaTJjX25ld19kdW1teShh
ZGFwdGVyLCBJMkNfSERNSV9BRERSKTsKPiAtCWlmICghY3R4LT5jbGllbnRbSTJDX0hETUldKSB7
Cj4gKwljdHgtPmNsaWVudFtJMkNfSERNSV0gPSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCZj
bGllbnQtPmRldiwgYWRhcHRlciwKPiArCQkJCQkJCSAgSTJDX0hETUlfQUREUik7Cj4gKwlpZiAo
SVNfRVJSKGN0eC0+Y2xpZW50W0kyQ19IRE1JXSkpIHsKPiAgCQlkZXZfZXJyKGN0eC0+ZGV2LCAi
ZmFpbGVkIHRvIGNyZWF0ZSBIRE1JIFJYIGNsaWVudFxuIik7Cj4gLQkJZ290byBmYWlsX3RwaTsK
PiArCQlyZXR1cm4gUFRSX0VSUihjdHgtPmNsaWVudFtJMkNfSERNSV0pOwo+ICAJfQo+ICAKPiAt
CWN0eC0+Y2xpZW50W0kyQ19DQlVTXSA9IGkyY19uZXdfZHVtbXkoYWRhcHRlciwgSTJDX0NCVVNf
QUREUik7Cj4gLQlpZiAoIWN0eC0+Y2xpZW50W0kyQ19DQlVTXSkgewo+ICsJY3R4LT5jbGllbnRb
STJDX0NCVVNdID0gZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSgmY2xpZW50LT5kZXYsIGFkYXB0
ZXIsCj4gKwkJCQkJCQkgIEkyQ19DQlVTX0FERFIpOwo+ICsJaWYgKElTX0VSUihjdHgtPmNsaWVu
dFtJMkNfQ0JVU10pKSB7Cj4gIAkJZGV2X2VycihjdHgtPmRldiwgImZhaWxlZCB0byBjcmVhdGUg
Q0JVUyBjbGllbnRcbiIpOwo+IC0JCWdvdG8gZmFpbF9oZG1pOwo+ICsJCXJldHVybiBQVFJfRVJS
KGN0eC0+Y2xpZW50W0kyQ19DQlVTXSk7Cj4gIAl9Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gLQo+IC1m
YWlsX2hkbWk6Cj4gLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJDX0hETUld
KTsKPiAtZmFpbF90cGk6Cj4gLQlpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJD
X1RQSV0pOwo+IC0KPiAtCXJldHVybiAtRU5PREVWOwo+IC19Cj4gLQo+IC1zdGF0aWMgdm9pZCBz
aWk5MjM0X2RlaW5pdF9yZXNvdXJjZXMoc3RydWN0IHNpaTkyMzQgKmN0eCkKPiAtewo+IC0JaTJj
X3VucmVnaXN0ZXJfZGV2aWNlKGN0eC0+Y2xpZW50W0kyQ19DQlVTXSk7Cj4gLQlpMmNfdW5yZWdp
c3Rlcl9kZXZpY2UoY3R4LT5jbGllbnRbSTJDX0hETUldKTsKPiAtCWkyY191bnJlZ2lzdGVyX2Rl
dmljZShjdHgtPmNsaWVudFtJMkNfVFBJXSk7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHNpaTkyMzQgKmJyaWRnZV90b19zaWk5MjM0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Up
Cj4gQEAgLTk1MCw3ICs5MzksNiBAQCBzdGF0aWMgaW50IHNpaTkyMzRfcmVtb3ZlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCj4gIAo+ICAJc2lpOTIzNF9jYWJsZV9vdXQoY3R4KTsKPiAgCWRy
bV9icmlkZ2VfcmVtb3ZlKCZjdHgtPmJyaWRnZSk7Cj4gLQlzaWk5MjM0X2RlaW5pdF9yZXNvdXJj
ZXMoY3R4KTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
