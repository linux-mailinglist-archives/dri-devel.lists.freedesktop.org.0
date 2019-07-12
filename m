Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602CC66F6B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7946489B51;
	Fri, 12 Jul 2019 13:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C14789B51
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 13:01:47 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190712130145euoutp0119682b9d93b4b21157dbed5efe37c305~wqniraUMZ0144601446euoutp01b
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 13:01:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190712130145euoutp0119682b9d93b4b21157dbed5efe37c305~wqniraUMZ0144601446euoutp01b
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190712130145eucas1p23e4e0971a626de5b7a229d1c81566fb2~wqniAROjQ3006530065eucas1p2O;
 Fri, 12 Jul 2019 13:01:45 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 82.33.04325.8B4882D5; Fri, 12
 Jul 2019 14:01:44 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190712130144eucas1p18e10379bdec5a07d218f775495cd3db1~wqnhHqbG30135501355eucas1p1D;
 Fri, 12 Jul 2019 13:01:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190712130144eusmtrp1748cf5233b9a72a42c4c4e27528dbdc5~wqng5kBYx1905319053eusmtrp1o;
 Fri, 12 Jul 2019 13:01:44 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-fc-5d2884b8ca55
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 21.A4.04140.7B4882D5; Fri, 12
 Jul 2019 14:01:43 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190712130143eusmtip254e80d709661cfbfe69a4e165de522ff~wqngdl3Db0500405004eusmtip2d;
 Fri, 12 Jul 2019 13:01:43 +0000 (GMT)
Subject: Re: [PATCH 1/2] regmap: Add DSI bus support
To: Rob Clark <robdclark@gmail.com>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <10b1313f-7a60-df04-a9e3-76649b74f2f0@samsung.com>
Date: Fri, 12 Jul 2019 15:01:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFKsWRmVeSWpSXmKPExsWy7djP87o7WjRiDebeNrfoPXeSyeL0/ncs
 FlMfPmGz+L9tIrPFla/v2Szaln9jtuicuITdYuL+s+wWl3fNYbN4vvAHswOXx95vC1g8ds66
 y+4xu2Mmq8emVZ1sHneu7WHz2P7tAavH/e7jTB6fN8kFcERx2aSk5mSWpRbp2yVwZXx/dJ+l
 YKFExax/rSwNjGeFuhg5OSQETCSuXLnO3sXIxSEksIJR4u+XdVDOF0aJm783QDmfGSVWTrnN
 AtPy8P06FojEckaJz5uuskE4bxklfs6bwwhSJQxUtW7pAWYQW0RAWWLV1v1gHcwCU5gldl+9
 AlbEJqAp8XfzTTYQm1fATqK/aQtYnEVAVWL21YPsILaoQJjEzwWdUDWCEidnPgE7g1MgUGLh
 7WtgcWYBeYntb+cwQ9jiEreezGcCWSYhcI9d4ureNiaIu10k7v9+xQ5hC0u8Or4FypaROD25
 B+q3eon7K1qYIZo7GCW2btjJDJGwljh8/CJrFyMH0AZNifW79CHCjhKLvi9mAQlLCPBJ3Hgr
 CHEDn8SkbdOZIcK8Eh1t0MBWlLh/divUQHGJpRe+sk1gVJqF5LNZSL6ZheSbWQh7FzCyrGIU
 Ty0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMYaf/Hf+6g3Hfn6RDjAIcjEo8vDcs1WOFWBPL
 iitzDzFKcDArifCu+g8U4k1JrKxKLcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUI
 JsvEwSnVwKiqkVr8/0XocR+elcc1bHo29RxYvuqx2Y2Ab7JXrnrvirI1lXhwX9Pb10FXL1ju
 Rn94/7TjUqv7G2y+Mj+I63rqoMh3vJw1xXfLna3BS364rz768N6FvUVrSw6fSDvsZGSTeO43
 Z/2SpberhBI/mbLbf/pRkh2j5y79ZOM03p/vv+S6hfQ5eiqxFGckGmoxFxUnAgA3HWjfXQMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xe7rbWzRiDTre21j0njvJZHF6/zsW
 i6kPn7BZ/N82kdniytf3bBZty78xW3ROXMJuMXH/WXaLy7vmsFk8X/iD2YHLY++3BSweO2fd
 ZfeY3TGT1WPTqk42jzvX9rB5bP/2gNXjfvdxJo/Pm+QCOKL0bIryS0tSFTLyi0tslaINLYz0
 DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mr4/us9SsFCiYta/VpYGxrNCXYycHBIC
 JhIP369j6WLk4hASWMoo8frkHSaIhLjE7vlvmSFsYYk/17rYIIpeM0o0TdjNApIQBupet/QA
 WJGIgLLEqq37wSYxC0xhlpj56iwzRMcrJom3sx+xglSxCWhK/N18kw3E5hWwk+hv2sIIYrMI
 qErMvnqQvYuRg0NUIEzi6Ik8iBJBiZMzn4At4xQIlFh4+xpYK7OAusSfeZeYIWx5ie1v50DZ
 4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYMxu
 O/Zzyw7GrnfBhxgFOBiVeHhvWKrHCrEmlhVX5h5ilOBgVhLhXfUfKMSbklhZlVqUH19UmpNa
 fIjRFOi3icxSosn5wHSSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2xJDU7NbUgtQimj4mD
 U6qB8SYjz/U+Z5E/WjFcktxKD5eeXbPg4KtJecLpC9RDd2/n9I+/5F/ouzCg1/dVuc3iwAnz
 5cRFldauXSH9o+SoJfNjm81dyaw9i7Y2y9Zfs2ZaGKn1MMQnVf6VzfrdEel9U8UrfzREbtzB
 9I+9OIlVavfSOdbrXr4zjD5086V4vMK3O5xcxpv+KLEUZyQaajEXFScCANMElHPvAgAA
X-CMS-MailID: 20190712130144eucas1p18e10379bdec5a07d218f775495cd3db1
X-Msg-Generator: CA
X-RootMTR: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
 <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
 <CGME20190706010615epcas2p343102f858a7fadaf6785f7ece105f1a7@epcas2p3.samsung.com>
 <20190706010604.GG20625@sirena.org.uk>
 <64ca3a74-374f-d4f3-bee6-a607cc5c0fc5@samsung.com>
 <CAF6AEGtGjKRA3A8v6pgaXLgpeiLZuz6HuDSFRjKrNp4iQNVZtA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562936505;
 bh=0Ph+jlbDFqlic9RlOSrcIKz2JKpU+ek5a4NYj/6z2ys=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=miJbyZskVcrhDa7qC19aY2wpoji1Zut2W5q0JrcBpNRHyldTkyYHYqWH9PLjiAjJc
 fhhA4rx7RGbhWG3f3fEPnbAQGNFzaAU4AssBelYNr9Qw7bOxdG7URf2/yw8T+ZcrhZ
 mkqCCs+nj2vOIPdxz25AvYSDKvXqT0XdwFqOl8zA=
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEuMDcuMjAxOSAxNTo1NiwgUm9iIENsYXJrIHdyb3RlOgo+IE9uIFRodSwgSnVsIDExLCAy
MDE5IGF0IDY6MTEgQU0gQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4gd3JvdGU6
Cj4+IE9uIDA2LjA3LjIwMTkgMDM6MDYsIE1hcmsgQnJvd24gd3JvdGU6Cj4+PiBPbiBXZWQsIEp1
bCAwMywgMjAxOSBhdCAwMjo0NToxMlBNIC0wNzAwLCBKZWZmcmV5IEh1Z28gd3JvdGU6Cj4+Pj4g
QWRkIGJhc2ljIHN1cHBvcnQgd2l0aCBhIHNpbXBsZSBpbXBsZW1lbnRhdGlvbiB0aGF0IHV0aWxp
emVzIHRoZSBnZW5lcmljCj4+Pj4gcmVhZC93cml0ZSBjb21tYW5kcyB0byBhbGxvdyBkZXZpY2Ug
cmVnaXN0ZXJzIHRvIGJlIGNvbmZpZ3VyZWQuCj4+PiBUaGlzIGxvb2tzIGdvb2QgdG8gbWUgYnV0
IEkgcmVhbGx5IGRvbid0IGtub3cgYW55dGhpbmcgYWJvdXQgRFNJLAo+Pj4gSSdkIGFwcHJlY2lh
dGUgc29tZSByZXZpZXcgZnJvbSBvdGhlciBwZW9wbGUgd2hvIGRvLiAgSSB0YWtlIGl0Cj4+PiB0
aGVyZSdzIHNvbWUgc3BlYyB0aGluZyBpbiBEU0kgdGhhdCBzYXlzIHJlZ2lzdGVycyBhbmQgYnl0
ZXMgbXVzdAo+Pj4gYm90aCBiZSA4IGJpdD8KPj4KPj4gSSBhbSBsaXR0bGUgYml0IGNvbmZ1c2Vk
IGFib3V0IHJlZ21hcCB1c2FnZSBoZXJlLiBPbiB0aGUgb25lIGhhbmQgaXQKPj4gbmljZWx5IGZp
dHMgdG8gdGhpcyBzcGVjaWZpYyBkcml2ZXIsIHByb2JhYmx5IGJlY2F1c2UgaXQgYWxyZWFkeSB1
c2VzCj4+IHJlZ21hcF9pMmMuCj4+Cj4+IE9uIHRoZSBvdGhlciBpdCB3aWxsIGJlIHVudXNhYmxl
IGZvciBhbG1vc3QgYWxsIGN1cnJlbnQgRFNJIGRyaXZlcnMgYW5kCj4+IHByb2JhYmx5IGZvciBt
b3N0IG5ldyBkcml2ZXJzLiBXaHk/Cj4+Cj4+IDEuIERTSSBwcm90b2NvbCBkZWZpbmVzIGFjdHVh
bGx5IG1vcmUgdGhhbiAzMCB0eXBlcyBvZiB0cmFuc2FjdGlvbnNbMV0sCj4+IGJ1dCB0aGlzIHBh
dGNoc2V0IGltcGxlbWVudHMgb25seSBmZXcgb2YgdGhlbSAoZHNpIGdlbmVyaWMgd3JpdGUvcmVh
ZAo+PiBmYW1pbHkpLiBJcyBpdCBwb3NzaWJsZSB0byBpbXBsZW1lbnQgbXVsdGlwbGUgdHlwZXMg
b2YgdHJhbnNhY3Rpb25zIGluCj4+IHJlZ21hcD8KPj4KPj4gMi4gVGhlcmUgaXMgYWxyZWFkeSBz
b21lIHNldCBvZiBoZWxwZXJzIHdoaWNoIHVzZXMgZHNpIGJ1cywgcmV3cml0aW5nIGl0Cj4+IG9u
IHJlZ21hcCBpcyBwb3NzaWJsZSBvciBkcml2ZXIgY291bGQgdXNlIG9mIHJlZ21hcCBhbmQgZGly
ZWN0IGFjY2Vzcwo+PiB0b2dldGhlciwgdGhlIHF1ZXN0aW9uIGlzIGlmIGl0IGlzIHJlYWxseSBu
ZWNlc3NhcnkuCj4+Cj4+IDMuIERTSSBkZXZpY2VzIGFyZSBubyBNRkRzIHNvIHJlZ21hcCBhYnN0
cmFjdGlvbiBoYXMgbm8gYmlnIHZhbHVlIGFkZGVkCj4+IChjb3JyZWN0IG1lLCBpZiB0aGVyZSBh
cmUgb3RoZXIgc2lnbmlmaWNhbnQgYmVuZWZpdHMpLgo+Pgo+IEkgYXNzdW1lIGl0IGlzIG5vdCAq
anVzdCogdGhpcyBvbmUgYnJpZGdlIHRoYXQgY2FuIGJlIHByb2dyYW1tZWQgb3Zlcgo+IGVpdGhl
ciBpMmMgb3IgZHNpLCBkZXBlbmRpbmcgb24gaG93IHRoaW5ncyBhcmUgd2lyZWQgdXAgb24gdGhl
IGJvYXJkLgo+IEl0IGNlcnRhaW5seSB3b3VsZCBiZSBuaWNlIGZvciByZWdtYXAgdG8gc3VwcG9y
dCB0aGlzIGNhc2UsIHNvIHdlCj4gZG9uJ3QgaGF2ZSB0byB3cml0ZSB0d28gZGlmZmVyZW50IGJy
aWRnZSBkcml2ZXJzIGZvciB0aGUgc2FtZSBicmlkZ2UuCj4gSSB3b3VsZG4ndCBleHBlY3QgYSBw
YW5lbCB0aGF0IGlzIG9ubHkgcHJvZ3JhbW1lZCB2aWEgZHNpIHRvIHVzZSB0aGlzLgoKCk9uIHRo
ZSBvdGhlciBzaWRlIHN1cHBvcnRpbmcgRFNJIGFuZCBJMkMgaW4gb25lIGRyaXZlciBpcyBzaW1w
bHkgbWF0dGVyCm9mIHdyaXRpbmcgcHJvcGVyIGFjY2Vzb3JzLgoKClJlZ2FyZHMKCkFuZHJ6ZWoK
Cgo+Cj4gQlIsCj4gLVIKPgo+PiBbMV06Cj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L2xhdGVzdC9zb3VyY2UvaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCNMMTUKPj4KPj4K
Pj4gUmVnYXJkcwo+Pgo+PiBBbmRyemVqCj4+Cj4+Cj4+PiBBIGNvdXBsZSBvZiBtaW5vciBjb21t
ZW50cywgbm8gbmVlZCB0byByZXNlbmQganVzdCBmb3IgdGhlc2U6Cj4+Pgo+Pj4+ICsgICAgICAg
cGF5bG9hZFswXSA9IChjaGFyKXJlZzsKPj4+PiArICAgICAgIHBheWxvYWRbMV0gPSAoY2hhcil2
YWw7Cj4+PiBEbyB5b3UgbmVlZCB0aGUgY2FzdHM/Cj4+Pgo+Pj4+ICsgICAgcmV0ID0gbWlwaV9k
c2lfZ2VuZXJpY193cml0ZShkc2ksIHBheWxvYWQsIDIpOwo+Pj4+ICsgICAgcmV0dXJuIHJldCA8
IDAgPyByZXQgOiAwOwo+Pj4gUGxlYXNlIGp1c3Qgd3JpdGUgYW4gaWYgc3RhdGVtZW50LCBpdCBo
ZWxwcyB3aXRoIGxlZ2liaWxpdHkuCj4+Pgo+Pj4+ICtzdHJ1Y3QgcmVnbWFwICpfX3JlZ21hcF9p
bml0X2RzaShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2ksCj4+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKmNvbmZpZywKPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgKmxvY2tf
a2V5LAo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKmxvY2tf
bmFtZSkKPj4+PiArewo+Pj4+ICsgICAgcmV0dXJuIF9fcmVnbWFwX2luaXQoJmRzaS0+ZGV2LCAm
ZHNpX2J1cywgJmRzaS0+ZGV2LCBjb25maWcsCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICBsb2NrX2tleSwgbG9ja19uYW1lKTsKPj4+PiArfQo+Pj4+ICtFWFBPUlRfU1lNQk9MX0dQTChf
X3JlZ21hcF9pbml0X2RzaSk7Cj4+PiBQZXJoYXBzIHZhbGlkYXRlIHRoYXQgdGhlIGNvbmZpZyBp
cyBPSyAobWFpbmx5IHRoZSByZWdpc3Rlci92YWx1ZQo+Pj4gc2l6ZXMpPyAgVGhvdWdoIEknbSBu
b3Qgc3VyZSBpdCdzIHdvcnRoIGl0IHNvIHBlcmhhcHMgbm90IC0gdXAgdG8KPj4+IHlvdS4KPj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
