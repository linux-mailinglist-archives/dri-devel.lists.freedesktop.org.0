Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72087CD0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 16:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3EC6EE1B;
	Fri,  9 Aug 2019 14:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4547C6EE1A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:36:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190809143615euoutp023211e10d0400ecbac8596de3ce4c4968~5R_CbR5ia2180521805euoutp02g
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 14:36:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190809143615euoutp023211e10d0400ecbac8596de3ce4c4968~5R_CbR5ia2180521805euoutp02g
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190809143614eucas1p1ba207acb51332fde256c48166f216859~5R_B75nLN0762007620eucas1p1g;
 Fri,  9 Aug 2019 14:36:14 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DD.2A.04309.ED48D4D5; Fri,  9
 Aug 2019 15:36:14 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190809143614eucas1p136e66c4c1a7a6ec3315a701a7919be37~5R_BGXnlT0369903699eucas1p1f;
 Fri,  9 Aug 2019 14:36:14 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190809143613eusmtrp2e400ad28dd326312b2fc92a9702cae3e~5R_A4SEyX0063000630eusmtrp23;
 Fri,  9 Aug 2019 14:36:13 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-4a-5d4d84de3cb2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 90.90.04166.DD48D4D5; Fri,  9
 Aug 2019 15:36:13 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190809143613eusmtip1dc788cff9033ec99180a64f220b6c914~5R_AbcTKG0489304893eusmtip1U;
 Fri,  9 Aug 2019 14:36:13 +0000 (GMT)
Subject: Re: [PATCH 02/22] ARM: omap1: make omapfb standalone compilable
To: Arnd Bergmann <arnd@arndb.de>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <487da98d-a862-0207-289a-bca8ff18e51a@samsung.com>
Date: Fri, 9 Aug 2019 16:36:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDKsWRmVeSWpSXmKPExsWy7djPc7r3WnxjDXZ/17BY88LB4u+kY+wW
 V76+Z7NoXryezWLKn+VMFpseX2O1uLxrDpvF7CX9LBbr599is9h/xcuBy+P3r0mMHt++TmLx
 OPx1IYvHnWt72Dz2z13D7nG/+ziTx+Yl9R7Hb2xn8vi8SS6AM4rLJiU1J7MstUjfLoEr4+me
 f6wFJ/kq/h5/x9zA+Jy7i5GTQ0LARGLh1RusILaQwApGiZftRl2MXED2F0aJ2SuOs0M4nxkl
 5p18zQTTcW3THKjEckaJ26+vskA4bxklbm7+xQ5SJSzgIdG+5zSYLSKgKDH1xTNmkCJmgZnM
 Ekc37gRbyCZgJTGxfRUjiM0rYCcxrW8XmM0ioCJx+fAesBpRgQiJ+8c2sELUCEqcnPmEBcTm
 FAiU2Ph+NlicWUBc4taT+UwQtrzE9rdzwJZJCLxkl3h8Zz4LxN0uEnPurYP6QVji1fEt7BC2
 jMT/nSDNIA3rGCX+dryA6t7OKLF88j82iCpricPHLwKt4wBaoSmxfpc+RNhR4t2f9YwgYQkB
 PokbbwUhjuCTmLRtOjNEmFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lrs5C8MwvJO7MQ9i5g
 ZFnFKJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmMZO/zv+ZQfjrj9JhxgFOBiVeHgzmn1j
 hVgTy4orcw8xSnAwK4nwXuEACvGmJFZWpRblxxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2a
 WpBaBJNl4uCUamB0+hJqud+cNSczb60x5/u0r38u7654+SdH9bzsQmYd52SDVJezWzhWWYpd
 nsCXJnqrfJ1VvWe7oHJEv97NxGNBHx9MC3z4LXzZzL2F5k0+J4sVgwoOvoqq/zRpwRw5lqQl
 ezfe4MqeNbco6PjE/2+W1pTfWn8keHPou9c/lD9O/Cmz6NKVx95zlViKMxINtZiLihMBtKx3
 MV8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsVy+t/xu7p3W3xjDX5+17NY88LB4u+kY+wW
 V76+Z7NoXryezWLKn+VMFpseX2O1uLxrDpvF7CX9LBbr599is9h/xcuBy+P3r0mMHt++TmLx
 OPx1IYvHnWt72Dz2z13D7nG/+ziTx+Yl9R7Hb2xn8vi8SS6AM0rPpii/tCRVISO/uMRWKdrQ
 wkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+mef6wFJ/kq/h5/x9zA+Jy7i5GT
 Q0LAROLapjnsXYxcHEICSxklJmzqZeli5ABKyEgcX18GUSMs8edaFxuILSTwmlFi7jEHEFtY
 wEOifc9pdhBbREBRYuqLZ8wgc5gF5jJLLHt0mR2iYT2TRO+dehCbTcBKYmL7KkYQm1fATmJa
 3y4wm0VAReLy4T2sILaoQITEmfcrWCBqBCVOznwCZnMKBEpsfD8brIZZQF3iz7xLzBC2uMSt
 J/OZIGx5ie1v5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hQrzgxt7g0L10vOT93
 EyMwZrcd+7l5B+OljcGHGAU4GJV4eDOafWOFWBPLiitzDzFKcDArifBe4QAK8aYkVlalFuXH
 F5XmpBYfYjQFem4is5Rocj4wneSVxBuaGppbWBqaG5sbm1koifN2CByMERJITyxJzU5NLUgt
 gulj4uCUamCU2Ss99Yz7tr+8L3cvqngpJL0/Kr770ucAFZbHW88kB/iKsRmfnLgoc+o8b6GQ
 u2eL757gcry5uGVJDGM616dfex7xnBPuF2dsX3mP5bqd91nrSZeclNYsLN3wn2fvtHKWnLN3
 nCXP2P512/V199cW822fjE1/uhpwHnm+pixbNPRjcc9piQmtSizFGYmGWsxFxYkAEN++Je8C
 AAA=
X-CMS-MailID: 20190809143614eucas1p136e66c4c1a7a6ec3315a701a7919be37
X-Msg-Generator: CA
X-RootMTR: 20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f
References: <20190808212234.2213262-1-arnd@arndb.de>
 <CGME20190808212453epcas2p44ff418662ee1acf428c6842ee4488f9f@epcas2p4.samsung.com>
 <20190808212234.2213262-3-arnd@arndb.de>
 <55c9608d-68c4-17f6-2682-7668d5d7720a@samsung.com>
 <CAK8P3a3grFEGr33s327yNMabK5=1kCJc3k7y55dhzQx9sTvkyQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1565361375;
 bh=eDflF5RCD/YInlHvL2icWnHt8F3jpysJjiPXi+H+VKs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=AJ4bJsKfq+cQjbUoXDxLYnMKvsxdvlhSIPr27JuByO+X2MmkJ//WIdwvrkhm3EL5d
 yQtnffUb/I2wx29XysM6YPzI0Ctle8sV8fLVla+aXYYeODVmXJYaL/4F5uAGkKFkO4
 ITqfX6DQuzQt5zIle6ST8WKl3OX7HvHrQ+zH6iLY=
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvOS8xOSAxOjQzIFBNLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIEZyaSwgQXVnIDks
IDIwMTkgYXQgMTozMiBQTSBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6Cj4gPGIuem9sbmllcmtp
ZUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4+IE9uIDgvOC8xOSAxMToyMiBQTSwgQXJuZCBCZXJnbWFu
biB3cm90ZToKPj4+IFRoZSBvbWFwZmIgZHJpdmVyIGlzIHNwbGl0IGludG8gcGxhdGZvcm0gc3Bl
Y2lmaWMgY29kZSBmb3Igb21hcDEsIGFuZAo+Pj4gZHJpdmVyIGNvZGUgdGhhdCBpcyBhbHNvIHNw
ZWNpZmljIHRvIG9tYXAxLgo+Pj4KPj4+IE1vdmluZyBib3RoIHBhcnRzIGludG8gdGhlIGRyaXZl
ciBkaXJlY3Rvcnkgc2ltcGxpZmllcyB0aGUgc3RydWN0dXJlCj4+PiBhbmQgYXZvaWRzIHRoZSBk
ZXBlbmRlbmN5IG9uIGNlcnRhaW4gb21hcCBtYWNoaW5lIGhlYWRlciBmaWxlcy4KPj4+Cj4+PiBU
aGUgaW50ZXJydXB0IG51bWJlcnMgaW4gcGFydGljdWxhciBob3dldmVyIG11c3Qgbm90IGJlIHJl
ZmVyZW5jZWQKPj4+IGRpcmVjdGx5IGZyb20gdGhlIGRyaXZlciB0byBhbGxvdyBidWlsZGluZyBp
biBhIG11bHRpcGxhdGZvcm0KPj4+IGNvbmZpZ3VyYXRpb24sIHNvIHRoZXNlIGhhdmUgdG8gYmUg
cGFzc2VkIHRocm91Z2ggcmVzb3VyY2VzLCBpcwo+Pj4gZG9uZSBmb3IgYWxsIG90aGVyIG9tYXAg
ZHJpdmVycy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPgo+Pgo+PiBGb3IgZmJkZXYgcGFydDoKPj4KPj4gQWNrZWQtYnk6IEJhcnRsb21pZWogWm9s
bmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRh
a2luZyBhIGxvb2suCj4gCj4+IFsgSXQgc2VlbXMgdGhhdCBhZGRpbmcgb2Ygc3RhdGljIGlubGlu
ZSBmb3Igb21hcF9zZXRfZG1hX3ByaW9yaXR5KCkKPj4gICB3aGVuIEFSQ0hfT01BUD1uIHNob3Vs
ZCBiZSBpbiBwYXRjaCAjOSBidXQgdGhpcyBpcyBhIG1pbm9yIGlzc3VlLiBdCj4gCj4gVGhhdCB3
b3VsZCBoYXZlIGJlZW4gb2sgYXMgd2VsbCwgYnV0IGhhdmluZyB0aGUgYWRkaXRpb24gaGVyZSB3
YXMKPiBpbnRlbnRpb25hbCBhbmQgc2VlbXMgbW9yZSBsb2dpY2FsIHRvIG1lIGFzIHRoaXMgaXMg
d2hlcmUgdGhlIGhlYWRlcnMKPiBnZXQgbW92ZWQgYXJvdW5kLgpJIHNlZSB0aGF0IHRoaXMgaXMg
YW4gb3B0aW1pemF0aW9uIGZvciBtYWtpbmcgdGhlIHBhdGNoIHNlcmllcyBtb3JlCmNvbXBhY3Qg
YnV0IEkgdGhpbmsgdGhhdCB0aGlzIGFkZGl0aW9uIGxvZ2ljYWxseSBiZWxvbmdzIHRvIHBhdGNo
ICM5Cih3aGljaCBhZGRzIHN1cHBvcnQgZm9yIENPTVBJTEVfVEVTVCkgd2hlcmUgdGhlIG5ldyBj
b2RlIGlzIHJlcXVpcmVkLgoKTW9yZW92ZXIgcGF0Y2ggZGVzY3JpcHRpb24gZm9yIHBhdGNoICMy
IGxhY2tzIGFueSBjb21tZW50IGFib3V0IHRoaXMKYWRkaXRpb24gYmVpbmcgYSBwcmVwYXJhdGlv
biBmb3IgY2hhbmdlcyBpbiBwYXRjaCAjOSBzbyBJIHdhcyBxdWl0ZQpwdXp6bGVkIGFib3V0IGl0
cyBwdXJwb3NlIHdoZW4gc2VlaW5nIGl0IGZpcnN0LgoKVGhlcmVmb3JlIHBsZWFzZSBoYXZlIG1l
cmN5IG9uIHRoZSBwb29yL3N0dXBpZCByZXZpZXdlciBhbmQgZG9uJ3QgZG8Kc3VjaCBvcHRpbWl6
YXRpb25zIGludGVudGlvbmFsbHkgKG9yIGF0IGxlYXN0IGRlc2NyaWJlIHRoZW0gcHJvcGVybHkK
c29tZXdoZXJlKS4uIDstKQoKQmVzdCByZWdhcmRzLAotLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3
aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
