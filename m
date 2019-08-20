Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFFD95BC1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 11:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D76E2BF;
	Tue, 20 Aug 2019 09:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146DB6E2BF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:56:20 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190820095618euoutp02a8df0fc8e55826d5af6eaccb0bb1c41d~8mPwFN-uj1325413254euoutp02P
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 09:56:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190820095618euoutp02a8df0fc8e55826d5af6eaccb0bb1c41d~8mPwFN-uj1325413254euoutp02P
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190820095618eucas1p153388d106ed34efe40372616068ec9db~8mPvmM-fs2216722167eucas1p1E;
 Tue, 20 Aug 2019 09:56:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 14.36.04309.1C3CB5D5; Tue, 20
 Aug 2019 10:56:17 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190820095616eucas1p190bd9e5388103e26bcdd395061c9e7f7~8mPuk0X7-2216122161eucas1p1_;
 Tue, 20 Aug 2019 09:56:16 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190820095616eusmtrp14f5160e042e3f1d3582be0e86bf4bf80~8mPuWqHjW3034030340eusmtrp1p;
 Tue, 20 Aug 2019 09:56:16 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-b4-5d5bc3c108d2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 43.F8.04166.0C3CB5D5; Tue, 20
 Aug 2019 10:56:16 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190820095616eusmtip1238b7051c38cad50ff5074f907212452~8mPuFLHeJ0081300813eusmtip1D;
 Tue, 20 Aug 2019 09:56:16 +0000 (GMT)
Subject: Re: [PATCH 2/3] video: fbdev: mmp: add COMPILE_TEST support
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <28d91688-6df2-9207-7d88-34d024baf727@samsung.com>
Date: Tue, 20 Aug 2019 11:56:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:69.0) Gecko/20100101
 Thunderbird/69.0
MIME-Version: 1.0
In-Reply-To: <d21a19ea-8c18-80df-ae79-76de7c5ee67c@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7djP87oHD0fHGjxrNbDYOGM9q8WVr+/Z
 LE70fWC1uLxrDpsDi8f97uNMHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJXR0/uTsWAnb8Xk
 r/dYGhjncncxcnJICJhIbLpxk7WLkYtDSGAFo8SyJ6sZIZwvjBK7N/5jhnA+M0oc+PCQEabl
 3KwPTBCJ5YwS8/rnskA4bxkl5i4+xgpSJSzgIjG3fw8bSEJEYAajxK95e1hAEmwCmhJ/N99k
 A7F5Bewk1l3/DhZnEVCVWLN8BZgtKhAmsXbhZhaIGkGJkzOfgNmcAvYSe9a9AVvALCAv0bx1
 NjOELS5x68l8sJMkBH6zSRy+/pUN4lYXidv996BsYYlXx7ewQ9gyEqcn97BA2PUS91e0MEM0
 dzBKbN2wkxkiYS1x+PhFoG0cQBs0Jdbv0ocIO0rsvraRCSQsIcAnceOtIMQNfBKTtk1nhgjz
 SnS0CUFUK0rcP7sVaqC4xNILMJd5SOzomsYygVFxFpIvZyH5bBaSz2Yh3LCAkWUVo3hqaXFu
 emqxUV5quV5xYm5xaV66XnJ+7iZGYFI5/e/4lx2Mu/4kHWIU4GBU4uH1mBYVK8SaWFZcmXuI
 UYKDWUmEt2IOUIg3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS1OzU1ILUIpgsEwen
 VAOj/tn8xXFZgcLLo77pzrJq5moKXWHFE2VvKfktsrTw8JVSI++zVtOLHJ5ONg5lucnFedbV
 esblB/MX2cgZpfbPl1lZ6/V0/sHory99wpobJUKL9r1abLmT2SA7d8Eby7N3+ifOXnlJ46xZ
 gRSbqHuLs/IR7bsW+Z+/R1Vk7/EJzF+fIHecdboSS3FGoqEWc1FxIgBL6ahqJgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsVy+t/xu7oHDkfHGsw/o2WxccZ6VosrX9+z
 WZzo+8BqcXnXHDYHFo/73ceZPPq2rGL0+LxJLoA5Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLP
 yMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS+jp/cnY8FO3orJX++xNDDO5e5i5OSQEDCRODfr
 A1MXIxeHkMBSRomZU24zQiTEJXbPf8sMYQtL/LnWxQZiCwm8ZpS4sBjMFhZwkZjbv4cNpFlE
 YAajxMPzC1khiiYxSty95gZiswloSvzdfBOsgVfATmLd9e8sIDaLgKrEmuUrwGxRgTCJG/fu
 MULUCEqcnPkELM4pYC+xZ90bsJnMAuoSf+ZdYoaw5SWat86GssUlbj2ZzzSBUXAWkvZZSFpm
 IWmZhaRlASPLKkaR1NLi3PTcYkO94sTc4tK8dL3k/NxNjMBY2Xbs5+YdjJc2Bh9iFOBgVOLh
 9ZgWFSvEmlhWXJl7iFGCg1lJhLdiDlCINyWxsiq1KD++qDQntfgQoynQcxOZpUST84FxnFcS
 b2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgZFPu3lDsgpXcixTzV3Z
 pKrfKxXW/anqr1XfbH6yfUvpnMWlxjbMeuo9vA3BW/fmWu5Tu/wj/PDEiB/PHp1z5biePU8y
 aPnvzfFrrZq2nVyr5y/Wu1itRuf85cdxuo2T33V3bUiMSDoeICz/xdz4C8dBJamr35lELdN4
 t8426V2yJ3yT6IUn+kosxRmJhlrMRcWJANtS6LerAgAA
X-CMS-MailID: 20190820095616eucas1p190bd9e5388103e26bcdd395061c9e7f7
X-Msg-Generator: CA
X-RootMTR: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c
References: <CGME20190627140744eucas1p1eb91c6c21ae36105f38dbf5e42259a7c@eucas1p1.samsung.com>
 <d21a19ea-8c18-80df-ae79-76de7c5ee67c@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566294978;
 bh=/k7UolWm42rFLgzc1nD6W9ByqFjCzGOE0sIVZj7FLpY=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=NbJjUgl4UIL7JKTbDAm515Xlwt1yC95rBVMauOm82nn567UxmRQeMTRbtrdL/1KI1
 YviUCPnPw8q95aghEnCJcQyoiYGw0wPi4TafREwj2Eg9CICWm25kNtTYVoCZNFQUxu
 yFvkbm0fVYVoXIzjtMe2m7eCVEBYW9JZP+TLewiA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcuMDYuMjAxOSAxNjowNywgQmFydGxvbWllaiBab2xuaWVya2lld2ljeiB3cm90ZToKPiBB
ZGQgQ09NUElMRV9URVNUIHN1cHBvcnQgdG8gbW1wIGRpc3BsYXkgc3Vic3lzdGVtIGZvciBiZXR0
ZXIgY29tcGlsZQo+IHRlc3RpbmcgY292ZXJhZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgoKUmV2aWV3ZWQt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5k
cnplagoKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL0tjb25maWcgICAgfCAgICAy
ICstCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL2h3L0tjb25maWcgfCAgICAzICsrLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IEluZGV4
OiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvbW1wL0tjb25maWcKPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGEv
ZHJpdmVycy92aWRlby9mYmRldi9tbXAvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvbW1wL0tjb25maWcKPiBAQCAtMSw3ICsxLDcgQEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Cj4gIG1lbnVjb25maWcgTU1QX0RJU1AKPiAgCXRyaXN0YXRlICJN
YXJ2ZWxsIE1NUCBEaXNwbGF5IFN1YnN5c3RlbSBzdXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBDUFVf
UFhBOTEwIHx8IENQVV9NTVAyCj4gKwlkZXBlbmRzIG9uIENQVV9QWEE5MTAgfHwgQ1BVX01NUDIg
fHwgQ09NUElMRV9URVNUCj4gIAloZWxwCj4gIAkgIE1hcnZlbGwgRGlzcGxheSBTdWJzeXN0ZW0g
c3VwcG9ydC4KPiAgCj4gSW5kZXg6IGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvS2NvbmZp
Zwo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9ody9LY29uZmln
Cj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9tbXAvaHcvS2NvbmZpZwo+IEBAIC0xLDcgKzEs
OCBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAgY29uZmln
IE1NUF9ESVNQX0NPTlRST0xMRVIKPiAgCWJvb2wgIm1tcCBkaXNwbGF5IGNvbnRyb2xsZXIgaHcg
c3VwcG9ydCIKPiAtCWRlcGVuZHMgb24gQ1BVX1BYQTkxMCB8fCBDUFVfTU1QMgo+ICsJZGVwZW5k
cyBvbiBIQVZFX0NMSyAmJiBIQVNfSU9NRU0KPiArCWRlcGVuZHMgb24gQ1BVX1BYQTkxMCB8fCBD
UFVfTU1QMiB8fCBDT01QSUxFX1RFU1QKPiAgCWhlbHAKPiAgCQlNYXJ2ZWxsIE1NUCBkaXNwbGF5
IGh3IGNvbnRyb2xsZXIgc3VwcG9ydAo+ICAJCXRoaXMgY29udHJvbGxlciBpcyB1c2VkIG9uIE1h
cnZlbGwgUFhBOTEwIGFuZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
