Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823E99FD4E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073A88945A;
	Wed, 28 Aug 2019 08:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2188945A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:39:57 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190828083955euoutp01a97235d77cf5d695596eb520d43d2514~-CXWPWn0-2255822558euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:39:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190828083955euoutp01a97235d77cf5d695596eb520d43d2514~-CXWPWn0-2255822558euoutp01Y
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190828083955eucas1p2c5ef161d4b0934ff1def119ebe330278~-CXVc2gpu2348323483eucas1p2z;
 Wed, 28 Aug 2019 08:39:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0A.DD.04374.ADD366D5; Wed, 28
 Aug 2019 09:39:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190828083954eucas1p2b8dc8e6d795b984ec607a7e49911ff2b~-CXUm5jQe2349023490eucas1p2h;
 Wed, 28 Aug 2019 08:39:54 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190828083953eusmtrp1093ab1005f1cbb6474ace28275f78049~-CXUYPHem2582525825eusmtrp1x;
 Wed, 28 Aug 2019 08:39:53 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-b1-5d663dda61d3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D7.07.04117.9DD366D5; Wed, 28
 Aug 2019 09:39:53 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190828083953eusmtip198a24422c79bd0cf39db371dda376fb4~-CXTs6pHN0415604156eusmtip1z;
 Wed, 28 Aug 2019 08:39:53 +0000 (GMT)
Subject: Re: [PATCH v7 9/9] drm: exynos: exynos_hdmi: use
 cec_notifier_conn_(un)register
To: Dariusz Marcinkiewicz <darekm@google.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <6bbfb6f8-15c2-9ad2-8857-898f4c6435a3@samsung.com>
Date: Wed, 28 Aug 2019 10:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814104520.6001-10-darekm@google.com>
Content-Language: en-GB
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3bO2Y7D6WkavqybDfujIs2MOmVZQcSBIIIoYyW27KTSZrbT
 uhJ5AfGy6XJRuVatErR102XzVkZqDZMaUoQpa5JCqUnknGBeltuZ5H+/532f93veFz4Sk/4g
 ZGRm1hlWk6VUyYVi3P5u4uPanm0nUtZ1F8fS+o8dAtpnv4rRlY6HiP7s/S2kuypcOF3uNuD0
 z29dOF3WP4zRTmeNiP6Q90tE2/q/EPSnJrOQ1tW8IOibzhYBfdM4KNwRzrwat+CMxaZlbNYi
 IVM/3kcw7hKHgHleeYUprbMixmNbxrz3ekT7QhTircdZVeZZVhOXdFScca15lMhuCz1vnviJ
 5aAqcTEKIYHaAK6rPYJiJCalVDUCS25xUIwheGvXI154EPwqdKK5EXf+oIhvVCG4Wz8UFCMI
 XDN/cL8rglLAtOuR0N+IpIoQPNCPBwRGVWCQ224Q+F1CKh70b0sD70qoJDB+MBN+xqmVMGOb
 CNQXUYdgtK+N4D0LoaNiIJAQQm0Coy434MGoKMgbe0jwvBzqR8yYPwyoIhKG/74KLr4L7M52
 Ic8RMOSoE/G8BDqNOpwfyEega+4V8cKAwO2wBKcToc3RNRtBzkasgmdNcX4Eaif0vVDxGAbd
 Iwv5HcKg3H4D48sSKCyQ8m/EwKT1hoBnGZQM+HADkpvmXWaad41p3jWm/7EWhFtRFKvl1Oks
 l5DFnovllGpOm5Uem3ZKbUOz369zxuFtQC1Tx1oRRSJ5qKQwnE2REsqz3AV1KwISk0dKvsfM
 liTHlRcusppTqRqtiuVa0WISl0dJLi3oOyyl0pVn2JMsm81q5roCMkSWg0JtUUeTahWjntKc
 38k1BUmENe70Cvflgarke3dueauv9ywzNEq96w5M/tn7MmUqc+nmg7UmRVnbYEWe6xz96MmT
 L0OpTRunDkfXDdsOJnZz62WNr/fcr6a2xzyd7k+IeOxTR2fcbX1sUPs+NfjSCm/3Kr6uMTX9
 OJJt3r3/zZb+khw5zmUo41djGk75D83/noN6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xu7o3bdNiDV7M0bPoPXeSyeL/tonM
 FkuOr2S0uPL1PZvFxZl3WSwm3Z/AYvHi3kUWi/7Hr5ktzp/fwG5xtukNu8Wmx9dYLS7vmsNm
 0bNhK6vFjPP7mCxmTH7J5sDvsffbAhaPBZtKPTat6mTz2P7tAavH/e7jTB6bl9R79G1Zxejx
 eZOcx6mvn9kDOKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0Mqbs/sRacJinYs7PF8wNjMu5uhg5OSQETCTuN79k72Lk4hASWMoo8fHhHcYuRg6g
 hJTE/BYliBphiT/Xutggal4zSnzfso8RJCEsECXx9+5qsISIQCejxK47t1lAHGaBmcwSu1b0
 QI3dxijxZ8kWVpAWNgFDid6jfWDtvAJ2EpPPzgGLswioSvzb9BMsLioQIXF4xyyoGkGJkzOf
 sIDYnALmEpN7GsHizALqEn/mXWKGsMUlmr6sZIWw5SW2v53DPIFRaBaS9llIWmYhaZmFpGUB
 I8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwGjfduznlh2MXe+CDzEKcDAq8fB28KfGCrEm
 lhVX5h5ilOBgVhLhfaQCFOJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YCLKK4k3NDU0t7A0
 NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAWHk/8qHuefNNd5nnltxWXRTqWXXl
 y2nn3wfm7brHqOHCeant5InlAk7si0tEVi09KF/4ZqOfC+P5kBei//tM4j9HL0+68izsilSt
 /jzR4IYXEoeWcXqFRU75ylH0TVdjzkZ1ZptntxK0jj3dbphVotGx/j27adNijwOdrae2mmVq
 Cx+LmLwnQYmlOCPRUIu5qDgRAAkeheoMAwAA
X-CMS-MailID: 20190828083954eucas1p2b8dc8e6d795b984ec607a7e49911ff2b
X-Msg-Generator: CA
X-RootMTR: 20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71
References: <20190814104520.6001-1-darekm@google.com>
 <CGME20190814104630epcas3p44755443f37e78b2613f7dda35d71bb71@epcas3p4.samsung.com>
 <20190814104520.6001-10-darekm@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566981595;
 bh=nCO1CGbNKa5rvO48tD1eLJmbBQi/YQi3un/pIVM1ksQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=GyUvhO6HUlrozwZ+TG0uHeVIsHhZiuw7lkq26iTfRYh/mXQq/HVm2f0FZ4Q2Brefi
 /go/dCadcvFZSwQaJ4kn/7fqD7oQyo9qjS24MxWdthRrAkgHTAx+NJqdHM7UHBHp5L
 S0CF7Js9555sE7kx4Y1RZlliA8d1Tv4DUheaz7QA=
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
Cc: linux-samsung-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xNC8xOSAxMjo0NSwgRGFyaXVzeiBNYXJjaW5raWV3aWN6IHdyb3RlOgo+IFVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwo+ICh1bily
ZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZpbGwgaW4K
PiB0aGUgY2VjX2Nvbm5lY3Rvcl9pbmZvLgo+IAo+IENoYW5nZXMgc2luY2UgdjI6Cj4gCS0gcmVt
b3ZlZCB1bm5lY2Vzc2FyeSBjYWxsIHRvIGludmFsaWRhdGUgcGh5cyBhZGRyZXNzIGJlZm9yZQo+
IAlkZXJlZ2lzdGVyaW5nIHRoZSBub3RpZmllciwKPiAJLSB1c2UgY2VjX25vdGlmaWVyX3BoeXNf
YWRkcl9pbnZhbGlkYXRlIGluc3RlYWQgb2Ygc2V0dGluZwo+IAlpbnZhbGlkIGFkZHJlc3Mgb24g
YSBub3RpZmllci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdpY3ogPGRh
cmVrbUBnb29nbGUuY29tPgo+IFRlc3RlZC1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1jaXNj
b0B4czRhbGwubmw+CgpSZXZpZXdlZC1ieTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tp
QHNhbXN1bmcuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfaGRtaS5jCj4gaW5kZXgg
YmMxNTY1ZjE4MjJhYi4uZDUzMmI0NjhkOWFmNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19oZG1pLmMKCj4gQEAgLTIwMDYsMTIgKzIwMjAsNiBAQCBzdGF0aWMgaW50IGhkbWlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQl9Cj4gIAl9Cj4gIAo+IC0JaGRh
dGEtPm5vdGlmaWVyID0gY2VjX25vdGlmaWVyX2dldCgmcGRldi0+ZGV2KTsKPiAtCWlmIChoZGF0
YS0+bm90aWZpZXIgPT0gTlVMTCkgewo+IC0JCXJldCA9IC1FTk9NRU07Cj4gLQkJZ290byBlcnJf
aGRtaXBoeTsKPiAtCX0KPiAtCj4gIAlwbV9ydW50aW1lX2VuYWJsZShkZXYpOwo+ICAKPiAgCWF1
ZGlvX2luZm9mcmFtZSA9ICZoZGF0YS0+YXVkaW8uaW5mb2ZyYW1lOwo+IEBAIC0yMDIzLDcgKzIw
MzEsNyBAQCBzdGF0aWMgaW50IGhkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiAgCj4gIAlyZXQgPSBoZG1pX3JlZ2lzdGVyX2F1ZGlvX2RldmljZShoZGF0YSk7Cj4gIAlp
ZiAocmV0KQo+IC0JCWdvdG8gZXJyX25vdGlmaWVyX3B1dDsKPiArCQlnb3RvIGVycl9ydW50aW1l
X2Rpc2FibGU7CgoKPiAtZXJyX25vdGlmaWVyX3B1dDoKPiAtCWNlY19ub3RpZmllcl9wdXQoaGRh
dGEtPm5vdGlmaWVyKTsKPiArZXJyX3J1bnRpbWVfZGlzYWJsZToKPiAgCXBtX3J1bnRpbWVfZGlz
YWJsZShkZXYpOwoKbml0OiBJIHRoaW5rIGVycl9ycG1fZGlzYWJsZSBvciBlcnJfcG1fcnVudGlt
ZV9kaXNhYmxlIGNvdWxkIGJlIGJldHRlciAKICAgICBsYWJlbCBuYW1lcy4KCi0tIApUaGFua3Ms
ClN5bHdlc3RlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
