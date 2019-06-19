Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C04B613
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 12:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450B6E358;
	Wed, 19 Jun 2019 10:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E6F6E358
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:17:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190619101711euoutp0208ae7cad045a228a3b558909d2b21046~pkiSh2G632049120491euoutp02N
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 10:17:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190619101711euoutp0208ae7cad045a228a3b558909d2b21046~pkiSh2G632049120491euoutp02N
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190619101710eucas1p23a6c0f7ae8496fd96174a0cd06a44793~pkiRpeZ520319103191eucas1p2F;
 Wed, 19 Jun 2019 10:17:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 24.86.04377.6AB0A0D5; Wed, 19
 Jun 2019 11:17:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190619101710eucas1p2fba9c19d5d6193c58efccf839da25498~pkiQ5qTg50521905219eucas1p2r;
 Wed, 19 Jun 2019 10:17:10 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190619101709eusmtrp14208afc034f27f12829fc05749ca1b99~pkiQrWGTa1096410964eusmtrp1m;
 Wed, 19 Jun 2019 10:17:09 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-1a-5d0a0ba6b53e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EB.41.04140.5AB0A0D5; Wed, 19
 Jun 2019 11:17:09 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190619101708eusmtip2ff459664db2a7db61c34c4f93e840d13~pkiPuqCeG0678306783eusmtip2X;
 Wed, 19 Jun 2019 10:17:08 +0000 (GMT)
Subject: Re: [RFT 01/10] dt-bindings: gpu: mali: Add Samsung compatibles for
 Midgard and Utgard
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <fff4b807-e100-9739-0410-4fe10ec61b37@samsung.com>
Date: Wed, 19 Jun 2019 12:17:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeBBXd2vhBPq6BMzvdRf1_f8d9Pd=_N1X0chHLVbhi0rQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SZ0xTURj1vtVHsc2laPjiTBo1onFgTLzGEU0czx/G9Q8hWvWJRCimT3DF
 EQiCtSpUjVgHBhVMHUhFlCY1yqqKUhGZDjTQAAKBWsSgddA+VP6de8757jlf8vG0Jocbw8fq
 d4sGvS5OyymZoooB14zcYGX07FLTVHKi6hlFfporFKQgK58lPbkmROr72ljyuyiTJtllVSx5
 87WHI+bmDIaY0nwsOdXSSROX666C2FrqWOIxfWBJjf0iR7Jcjyhyvb6aItXPl5Pn9V6OpDrK
 FKS0K40lv+oKGGK1+xDp8DxlloBw6/ItJPz4bkZCT0OqQnD0X2GEYst7hWCzHuOEB/0fWaH5
 uJMS7l07LLx5mswKJwutSPDaJqwdGalcuE2Mi00SDbMWb1buKGi4RO1KDdl7v7eVOYKuqY0o
 iAc8F4xN6ZwRKXkNvoGg+HsX6xc0uA9B+9vxsuBF8KXOzv2dSLnsRrKQh6AxuXZovBuBqzOb
 8rtCsQ68XxwKPx6Fw6H+5zfWb6LxAAfu9tuMX+BwBBi7jYFvVXgxFBc6AtkMngw296cAPxpH
 QdbDNkb2hMCz860BHITXganmaiCMxhPhQfdFWsZh0NTqL6EcrPqOh7KuPIXcexl0dGYO4VD4
 7CwcwuOg8rSJkQdSEHyquq2QHyYENclZSHYtgFJn9WA9fjAiHPLts2R6KTR6rJyfBqyGhu4Q
 uYQazEXnaJlWQfpRjeyeAhbnnX+xT169pjOQ1jJsNcuwdSzD1rH8z72CGCsKExOl+BhRmqMX
 98yUdPFSoj5m5taEeBsavNzKX86+h8ju21KCMI+0I1XYy0drWF2StC++BAFPa0epglOCojWq
 bbp9+0VDwiZDYpwolaCxPKMNUx0Y8XGjBsfodos7RXGXaPirUnzQmCMonD/Y2VE6l3dviKCC
 DetjqvtetixZ4Umjcdvqx82ZQnBH/6XcVdJs9QW1zZVErwyteuGr/ZAult/0ZOhJ45rEnLMJ
 1jjSWvzbV1DWe7XrWOyA2DZp+6HpVo5aa4h8t331POX8sek5J6PC3ZXSAgcqrzzztq623bTI
 3JQ3afJELSPt0EVMow2S7g/DL6kRtQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMKsWRmVeSWpSXmKPExsVy+t/xe7pLubliDbqWm1j0njvJZPF30jF2
 i40z1rNavF/Ww2hx/ctzVov/2yYyW8w/co7V4srX92wWk+5PYLHoaf/DatH/+DWzxfnzG9gt
 Nj2+xmrxseceq8XlXXPYLGac38dksfT6RSaLi6dcLU5d/8xm0br3CLvF4TftrBb/rm1ksVi1
 6w+jxcuPJ1gcJDzWzFvD6PH71yRGj/c3Wtk99n5bwOKxc9Zddo9NqzrZPLZ/e8Dqcb/7OJPH
 5iX1HldONLF69G1ZxejxeZNcAE+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsbGG3OZCloFK7Z+eMLSwLiEr4uRk0NCwESied5Txi5GLg4hgaWM
 Egv+T2WGSMhInJzWwAphC0v8udbFBmILCbxmlHj1NhLEFhZIlPj8aS87iC0ioClx/e93sHpm
 gb9sEnM+KkAMXcsksermBSaQBJuAoUTXW4hBvAJ2Eju37AVrYBFQldj09CFYXFQgRmL/wdss
 EDWCEidnPgGzOQUCJXouL2aCWGAmMW/zQ2YIW15i+9s5ULa4xK0n85kmMArNQtI+C0nLLCQt
 s5C0LGBkWcUoklpanJueW2ykV5yYW1yal66XnJ+7iRGYYLYd+7llB2PXu+BDjAIcjEo8vDs+
 cMQKsSaWFVfmHmKU4GBWEuHlbuaMFeJNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YPLLK4k3
 NDU0t7A0NDc2NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXA2OF17m/kuwn9eXFfFn6N
 8BHWLr449ytvUNM1n8SW2zO2SMd7MpeuulfvtEtzaUCbXKdr6wHXRqHMSJW3164Y+m/WEe9S
 PewepfZa2S/q1+vb6Uyz7LW3ZHgYvVTlErjG9Cc+NpR592nx1w9P5HcXZS/ZFCOjvE3QJEKq
 rvirmt2hbPdnoeuUWIozEg21mIuKEwHLczsYRgMAAA==
X-CMS-MailID: 20190619101710eucas1p2fba9c19d5d6193c58efccf839da25498
X-Msg-Generator: CA
X-RootMTR: 20190618190551epcas2p38f3c93da2a05117c7741468bb5a7784c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190618190551epcas2p38f3c93da2a05117c7741468bb5a7784c
References: <20190618190534.4951-1-krzk@kernel.org>
 <CGME20190618190551epcas2p38f3c93da2a05117c7741468bb5a7784c@epcas2p3.samsung.com>
 <20190618190534.4951-2-krzk@kernel.org>
 <9d16d4f7-8353-e0f0-a005-1b04457d70f0@samsung.com>
 <CAJKOXPeBBXd2vhBPq6BMzvdRf1_f8d9Pd=_N1X0chHLVbhi0rQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1560939431;
 bh=YXFbvzejdPmbEVrM6cKmXEXnLbPu0ifyzV0x/PWK4Yc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=GhnXmkmOql8p78GM+RdGbyWJw3EaVXe4K2DHYU0LYhQrvXFllxec7EG3cHSMaFXGN
 pCTCIrr/mlZrlj7VzzjNE1mRhrZcRzOr4UeOxqcNnETUHiExLwuH6j437LZKxrn56E
 rxAn0okYmJAK5x5dhRWyQw6hKJOWUx2qPmb8HHbw=
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Will Deacon <will.deacon@arm.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, dri-devel@lists.freedesktop.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org,
 Joseph Kogut <joseph.kogut@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLAoKT24gMjAxOS0wNi0xOSAxMjowOCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBPbiBXZWQsIDE5IEp1biAyMDE5IGF0IDEyOjAxLCBNYXJlayBTenlwcm93c2tpIDxt
LnN6eXByb3dza2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+PiBIaSBLcnp5c3p0b2YsCj4+Cj4+IE9u
IDIwMTktMDYtMTggMjE6MDUsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+PiBBZGQgdmVu
ZG9yIGNvbXBhdGlibGVzIGZvciBzcGVjaWZpYyBpbXBsZW1lbnRhdGlvbiBvZiBNYWxpIFV0Z2Fy
ZAo+Pj4gKEV4eW5vczMyNTAsIEV4eW5vczQtZmFtaWx5KSBhbmQgTWlkZ2FyZCAoRXh5bm9zNTQz
MywgRXh5bm9zNykuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPgo+Pj4gLS0tCj4+PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQudHh0IHwgMSArCj4+PiAgICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2FyZC50eHQgIHwgMSArCj4+
PiAgICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdhcmQu
dHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9hcm0sbWFsaS1taWRn
YXJkLnR4dAo+Pj4gaW5kZXggZTVhZDNiMmFmZTE3Li45YjI5OGVkZWM1YjIgMTAwNjQ0Cj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLW1pZGdh
cmQudHh0Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2Fy
bSxtYWxpLW1pZGdhcmQudHh0Cj4+PiBAQCAtMTcsNiArMTcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+Pj4gICAgICAqIHdoaWNoIG11c3QgYmUgcHJlY2VkZWQgYnkgb25lIG9mIHRoZSBmb2xs
b3dpbmcgdmVuZG9yIHNwZWNpZmljczoKPj4+ICAgICAgICArICJhbGx3aW5uZXIsc3VuNTBpLWg2
LW1hbGkiCj4+PiAgICAgICAgKyAiYW1sb2dpYyxtZXNvbi1neG0tbWFsaSIKPj4+ICsgICAgKyAi
c2Ftc3VuZyxleHlub3M1NDMzLW1hbGkiCj4+PiAgICAgICAgKyAicm9ja2NoaXAscmszMjg4LW1h
bGkiCj4+PiAgICAgICAgKyAicm9ja2NoaXAscmszMzk5LW1hbGkiCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRnYXJk
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktdXRn
YXJkLnR4dAo+Pj4gaW5kZXggYWU2M2YwOWZkYTdkLi41MTkwMThjYjg2MGIgMTAwNjQ0Cj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3B1L2FybSxtYWxpLXV0Z2Fy
ZC50eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJt
LG1hbGktdXRnYXJkLnR4dAo+Pj4gQEAgLTE3LDYgKzE3LDcgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKPj4+ICAgICAgICAgICsgYW1sb2dpYyxtZXNvbjhiLW1hbGkKPj4+ICAgICAgICAgICsgYW1s
b2dpYyxtZXNvbi1neGJiLW1hbGkKPj4+ICAgICAgICAgICsgYW1sb2dpYyxtZXNvbi1neGwtbWFs
aQo+Pj4gKyAgICAgICsgc2Ftc3VuZyxleHlub3MzMjUwLW1hbGkKPj4gSSB3b3VsZCBwcmVmZXIg
J3NhbXN1bmcsZXh5bm9zNC1tYWxpJywgYmVjYXVzZSBoaXN0b3JpY2FsbHkgRXh5bm9zNCB3YXMK
Pj4gdGhlIGZpcnN0IFNvQyB3aXRoIE1hbGk0MDAgYW5kIHN1Y2ggcHJlZml4IGlzIGFscmVhZHkg
dXNlZCBmb3IgbWFueSBodwo+PiBibG9ja3MuCj4gVGhlbiBtYXliZSBzYW1zdW5nLGV4eW5vczQy
MTAtbWFsaSBzbyBpdCB3aWxsIG5vdCBiZSBjb25mdXNlZCB3aXRoIEV4eW5vczQ0MTU/CgpGaW5l
IGZvciBtZS4gRXh5bm9zNDQxNSBhbHNvIGhhcyBNYWxpNDAwLCBzbyBkb24ndCBzZWUgYW55IGlz
c3VlIGhlcmUuCgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1zdW5n
IFImRCBJbnN0aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
