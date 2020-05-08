Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5281CA4DE
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 09:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59156EA87;
	Fri,  8 May 2020 07:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7E96EA8F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 07:12:14 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200508071212euoutp010c43f4983d290ce676796f20545f0623~M-BRfBNUG2574225742euoutp01Y
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 07:12:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200508071212euoutp010c43f4983d290ce676796f20545f0623~M-BRfBNUG2574225742euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1588921933;
 bh=MNq8IaWUA6Un4kt7IMAiklPWVR3gf64K43Fn6O07vqs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Vb8aluHNEw2JqOy80I0E6I6Y8ywULeo5y2fJruM/YjEqktoHKqHrnSgLkcX3ZM422
 hpdrckhVsKQQwiMlZOpS+xX2P8OSoQKM8KJZYhOQPPi13GsmPGLQQIhEuIc5nCCTH5
 7kpq//KUDt40Ys1jXlI0DUiDRUPooFwT17sxiUYA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200508071212eucas1p2f160f406bc38d49c40a526e2f90073cd~M-BRGg3qQ0835408354eucas1p2O;
 Fri,  8 May 2020 07:12:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 03.30.60679.C4605BE5; Fri,  8
 May 2020 08:12:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200508071211eucas1p2c0d71295772b61cd59ea323234374fca~M-BQi3KsU0800008000eucas1p2K;
 Fri,  8 May 2020 07:12:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200508071211eusmtrp1807089cd64cf7c196d7a64f6e784733b~M-BQiFdOl0512605126eusmtrp1M;
 Fri,  8 May 2020 07:12:11 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-24-5eb5064cdf42
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id BC.FD.08375.B4605BE5; Fri,  8
 May 2020 08:12:11 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200508071211eusmtip2934bd81bad65ddd62f2c0e1050abb486~M-BPtk_EY1877618776eusmtip2B;
 Fri,  8 May 2020 07:12:11 +0000 (GMT)
Subject: Re: [PATCH v3 02/25] drm: core: fix common struct sg_table related
 issues
To: Christoph Hellwig <hch@lst.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <b887c355-14db-ad37-0e93-733ff2249967@samsung.com>
Date: Fri, 8 May 2020 09:12:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200505110950.GA19067@lst.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRjlt/vwOr1xnco+rQzWA4zStIgLhhkU3D8iKvpDhGyrbirqlN20
 llT2QG1O8YFlS8o0MtdjtelKS8yVDbGWqZTrZaVJWqalDiqz3K6W/51zvvPxnQMfhcm+EsFU
 kno/r1GrUhSkFLc++uFYuZmsj19VXruQLXC0Sdhb5SaC/WMtxtjuiRGSrb3aKmErm6PY8e73
 Etbc95xguxorSPbit3qczTl1mWBbRvsJtu5LMRFDc9fOX0Nck6sS58zGUyR32/WO4M63beN6
 8+0SznLpKPdqqg/jSntqEHfXmU1yhXVGxFnas7gxc8hWOk66bi+fkpTJa8KjldLEp84JIj03
 6OD1gWNkNioK1CFvCpg1MFmYi+uQlJIxVxDc+/2ZFMk4gvFei5dIxhA0teYRsyv5v5ol4qAG
 galzdIaMILg41IC7Xf7MDqjvtEvcOIBRwMehJ8htwpjnGFgH7R4TyUSAblhHujHNRENtaZmX
 G+PMEtDn6T16ILMT2qstSPT4QdvZ/uldivJmVoDjwRa3jDGL4ET9OUzEcnjZf8ETCJgyClx3
 K2ZibwTD2/wZ7A9D9jovES+A9lI9Li6cQPDecd1LJHoEXcfLkeiKgteOn6T7MsaEgqkxXJQ3
 wJT+i0cGZh70DPuJIeZBifUMJso05OXIRPcyMNhv/Dvb0tGJFSGFYU4zw5w6hjl1DP/vViLc
 iOR8hpCawAuRav5AmKBKFTLUCWF70lLNaPoL26fs43dQ4+RuG2IopPCl2W+WeBmhyhS0qTYE
 FKYIoIsP1sXL6L0q7SFek7ZLk5HCCzY0n8IVcnp11eBOGZOg2s8n83w6r5mdSijv4Gxkit2W
 pFRlbapufDbQlD3WrYvxvRn3wq4xFcTyIRlEQOYFPrljwsdAFJwMehhWdfRD4Jte463Y49IK
 I2/6xFdFhn62pssrHy9uKFnqZM8duTfqdK0RDhu024tCt0+sXzZVczuGPukTpRS+r40+fX/f
 VWXQggBSm9g6/DpOaXtrVOBCoipiOaYRVH8BbttRxYEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleLIzCtJLcpLzFFi42I5/e/4PV1vtq1xBq0nzSx6z51kstg4Yz2r
 xf9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWSz8uJXFoq1zGavFwQ9PWC22
 vJnI6sDrsWbeGkaPvd8WsHhsWtXJ5rH92wNWj3knAz3udx9n8ti8pN7j9r/HzB6Tbyxn9Nh9
 s4HNo2/LKkaPzaerPT5vkgvgjdKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV
 0rezSUnNySxLLdK3S9DLOH/zK2tBu2TF2meNbA2ME0S7GDk5JARMJLp/72fqYuTiEBJYyijx
 8uQiNoiEjMTJaQ2sELawxJ9rXWwQRW8ZJW61XgJLCAuESGy9dJwJxBYRUJJ4+uosI0gRs8AN
 Zolvm3vZITo+MUm8uLWaHaSKTcBQouttF9gKXgE7iZWTp4LFWQRUJHo6esDiogKxEquvtTJC
 1AhKnJz5hKWLkYODU0BH4txhP5Aws4CZxLzND5khbHmJ5q2zoWxxiVtP5jNNYBSahaR7FpKW
 WUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMw9rcd+7l5B+OljcGHGAU4GJV4
 eC0+bo4TYk0sK67MPcQowcGsJMI7sWJLnBBvSmJlVWpRfnxRaU5q8SFGU6DfJjJLiSbnA9NS
 Xkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTEktTs1NSC1CKYPiYOTqkGRvHpq6P2dSa8OVjH
 Vnnx/YGs1ZcMdwq/K7n9/U7He6XK9JWHT8tsYp7h8JBf8sbi5spdx4KuXOOyr5Xa2tR+VPzt
 87f72QXfNKjcbvS+wG+wXdhJXto6fGJ81+6q3St3/X+9d+1X1Z0qoo/t8vKMnYqbt3IrLJCK
 i961PECs8mq0SuPMHqmKuUosxRmJhlrMRcWJAMJUTm8TAwAA
X-CMS-MailID: 20200508071211eucas1p2c0d71295772b61cd59ea323234374fca
X-Msg-Generator: CA
X-RootMTR: 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454@eucas1p1.samsung.com>
 <20200505084614.30424-2-m.szyprowski@samsung.com>
 <20200505101508.GA14860@lst.de>
 <5dd1cb55-accb-0dc6-4ca5-90c57cd19527@samsung.com>
 <20200505110950.GA19067@lst.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0b3BoLAoKT24gMDUuMDUuMjAyMCAxMzowOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3Jv
dGU6Cj4gT24gVHVlLCBNYXkgMDUsIDIwMjAgYXQgMTI6NTE6NThQTSArMDIwMCwgTWFyZWsgU3p5
cHJvd3NraSB3cm90ZToKPj4gT24gMDUuMDUuMjAyMCAxMjoxNSwgQ2hyaXN0b3BoIEhlbGx3aWcg
d3JvdGU6Cj4+Pj4gLQkJZm9yX2VhY2hfc2dfcGFnZShzdC0+c2dsLCAmc2dfaXRlciwgc3QtPm5l
bnRzLCAwKQo+Pj4+ICsJCWZvcl9lYWNoX3NnX3BhZ2Uoc3QtPnNnbCwgJnNnX2l0ZXIsIHN0LT5v
cmlnX25lbnRzLCAwKQo+Pj4gV291bGQgaXQgbWFrZSBzZW5zZSB0byBhbHNvIGFkZCBhIGZvcl9l
YWNoX3NndGFibGVfcGFnZSBoZWxwZXIgdGhhdAo+Pj4gaGlkZXMgdGhlIHVzZSBvZiBvcmlnX25l
bnRzPyAgVG8gYmUgdXNlZCBsaWtlOgo+Pj4KPj4+IAkJZm9yX2VhY2hfc2d0YWJsZV9wYWdlKHN0
LCAmc2dfaXRlciwgMCkgewo+PiBXZSB3b3VsZCBuZWVkIHR3byBoZWxwZXJzOgo+Pgo+PiBmb3Jf
ZWFjaF9zZ3RhYmxlX2NwdV9wYWdlKCkgYW5kIGZvcl9lYWNoX3NndGFibGVfZG1hX3BhZ2UoKS4K
Pj4KPj4gSSBjb25zaWRlcmVkIHRoZW0sIGJ1dCB0aGVuIEkgZm91bmQgdGhhdCB0aGVyZSBhcmUg
YWxyZWFkeQo+PiBmb3JfZWFjaF9zZ19wYWdlKCksIGZvcl9lYWNoX3NnX2RtYV9wYWdlKCkgYW5k
IHZhcmlvdXMgc3BlY2lhbCBpdGVyYXRvcnMKPj4gbGlrZSBzZ19wYWdlX2l0ZXIsIHNnX2RtYV9w
YWdlX2l0ZXIgYW5kIHNnX21hcHBpbmdfaXRlci4gVG9vIGJhZCB0aGF0Cj4+IHRoZXkgYXJlIGFs
bW9zdCBub3QgdXNlZCwgYXQgbGVhc3QgaW4gdGhlIERSTSBzdWJzeXN0ZW0uIEkgd29uZGVyIGlm
IGl0Cj4+IG1ha2Ugc2Vuc2UgdG8gYXBwbHkgdGhlbSBvciBzaW1wbHkgcHJvdmlkZSB0aGUgdHdv
IGFib3ZlIG1lbnRpb25lZAo+PiB3cmFwcGVycz8KPiBOb25lIG9mIHRoZSBoZWxwZXJzIGhlbHBz
IHdpdGggcGFzc2luZyB0aGUgcmlnaHQgcGFyYW1ldGVycyBmcm9tIHRoZQo+IHNnX3RhYmxlLiAg
U28gaW4gZG91YmUgd2UnZCBuZWVkIHdyYXBwZXJzIGZvciBhbGwgb2YgdGhlIGFib3ZlLCBvcgo+
IG5vbmUuLgoKSSd2ZSBwbGF5ZWQgYSBiaXQgd2l0aCB0aGUgY29kZSBhbmQgdGhlIGV4aXN0aW5n
IHNjYXR0ZXJsaXN0IGl0ZXJhdG9ycyAtIApmb3JfZWFjaF9zZ19wYWdlKCkgYW5kIGZvcl9lYWNo
X3NnX2RtYV9wYWdlKCkuIEkndmUgZm91bmQgdGhlbSBxdWl0ZSBoYW5keSEKClRoZSBiaWdnZXN0
IGFkdmFudGFnZSBvZiB0aGVtIGlzIHRoYXQgdGhleSBhbHdheXMgaXRlcmF0ZSBvdmVyIApzY2F0
dGVybGlzdCBpbiBQQUdFX1NJWkUgdW5pdHMsIHdoYXQgc2hvdWxkIG1ha2UgdGhlIGNvZGUgbXVj
aCBlYXNpZXIgdG8gCnVuZGVyc3RhbmQuIEhlcmUgaXMgZXhhbXBsZSBvZiB0aGVpciBhcHBsaWNh
dGlvbiB0byB0aGUgZnVuY3Rpb24gdGhhdCAKc3RhcnRlZCB0aGlzIHRocmVhZDoKCmludCBkcm1f
cHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyhzdHJ1Y3Qgc2dfdGFibGUgKnNndCwgc3RydWN0
IHBhZ2UgCioqcGFnZXMsCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2FkZHJfdCAqYWRkcnMsIGludCBt
YXhfZW50cmllcykKewogwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNnX2RtYV9wYWdlX2l0ZXIgZG1h
X2l0ZXI7CiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2dfcGFnZV9pdGVyIHBhZ2VfaXRlcjsKCiDC
oMKgwqDCoMKgwqDCoCBpZiAoYWRkcnMpCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Zm9yX2VhY2hfc2d0YWJsZV9kbWFfcGFnZShzZ3QsICZkbWFfaXRlciwgMCkKIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKmFkZHJzKysgPSBzZ19wYWdlX2l0
ZXJfZG1hX2FkZHJlc3MoJmRtYV9pdGVyKTsKIMKgwqDCoMKgwqDCoMKgIGlmIChwYWdlcykKIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb3JfZWFjaF9zZ3RhYmxlX3BhZ2Uoc2d0LCAm
cGFnZV9pdGVyLCAwKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqcGFnZXMrKyA9IHNnX3BhZ2VfaXRlcl9wYWdlKCZwYWdlX2l0ZXIpOwogwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7Cn0KCkFmdGVyIGFwcGx5aW5nIHRob3NlIGl0ZXJhdG9ycyB3aGVyZSBw
b3NzaWJsZSAodGhleSBjYW4gYmUgdXNlZCBvbmx5IGZvciAKcmVhZGluZyB0aGUgc2NhdHRlcmxp
c3QpLCB3ZSB3b3VsZCBqdXN0IG5lZWQgdG8gYWRkIDIgdHJpdmlhbCB3cmFwcGVycyAKdG8gdXNl
IHRoZW0gd2l0aCBzZ190YWJsZSBvYmplY3RzOgoKI2RlZmluZSBmb3JfZWFjaF9zZ3RhYmxlX3Bh
Z2Uoc2d0LCBwaXRlciwgcGdvZmZzZXQpwqDCoMKgIFwKIMKgwqDCoMKgwqDCoCBmb3JfZWFjaF9z
Z19wYWdlKHNndC0+c2dsLCBwaXRlciwgc2d0LT5vcmlnX25lbnRzLCBwZ29mZnNldCkKCiNkZWZp
bmUgZm9yX2VhY2hfc2d0YWJsZV9kbWFfcGFnZShzZ3QsIGRtYV9pdGVyLCBwZ29mZnNldCnCoMKg
wqDCoCBcCiDCoMKgwqDCoMKgwqAgZm9yX2VhY2hfc2dfZG1hX3BhZ2Uoc2d0LT5zZ2wsIGRtYV9p
dGVyLCBzZ3QtPm5lbnRzLCBwZ29mZnNldCkKClRoZW4gd2Ugd291bGQganVzdCBuZWVkIG9uZSBt
b3JlIGhlbHBlciB0byBjb25zdHJ1Y3Qgc2NhdHRlcmxpc3QsIGFzIHRoZSAKYWJvdmUgdHdvIGFy
ZSByZWFkLW9ubHkgZG9uJ3QgYWxsb3cgdG8gbW9kaWZ5IHNjYXR0ZXJsaXN0OgoKI2RlZmluZSBm
b3JfZWFjaF9zZ3RhYmxlX3NnKHNndCwgc2csIGkpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFwKIMKgwqDCoMKgwqDCoCBmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2csIHNndC0+b3JpZ19u
ZW50cywgaSkKCldpdGggdGhlIGFib3ZlIDMgaGVscGVycyB3ZSBjYW4gcHJvYmFibHkgZ2V0IHJp
ZCBvZiBhbGwgaW5zdGFuY2VzIG9mIApzZ190YWJsZS0+e25lbnRzLG9yaWdfbmVudHN9IGZyb20g
dGhlIERSTSBjb2RlLiBJIHdpbGwgcHJlcGFyZSBwYXRjaGVzIHNvb24uCgpCZXN0IHJlZ2FyZHMK
LS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
