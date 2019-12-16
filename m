Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABF811FFC8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 09:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02F56E447;
	Mon, 16 Dec 2019 08:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823FF6E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:50:59 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20191216005055epoutp04d8a07573aacc04ab66d30bd07b59c7d3~gs7QOl2hi1785217852epoutp04M
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 00:50:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20191216005055epoutp04d8a07573aacc04ab66d30bd07b59c7d3~gs7QOl2hi1785217852epoutp04M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576457455;
 bh=eOKZFtEtodywr7reb+wwKFTw2jgOl7JGDlGOvMIhTe8=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=m+yzd1v+Mhbm1JOEbLKGSLxXM9pwKyqixWncRSut2ZcsPF1p9sKqTvKQ33AaFyNyT
 exUq3nOt+NWwVzuUbZjTt2mll9y/xIkYIGIy7WABi5WFdGWGkMoGBSn6eQ5282iznF
 kvV8aY76jjvQ7ZgEg0LcDgL+IBI6E2erUhVyp5Zg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20191216005054epcas1p385f5e8d50bde6ebb34d87216a7443360~gs7PugLbs1055810558epcas1p3K;
 Mon, 16 Dec 2019 00:50:54 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.157]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47bjPS4VqSzMqYkj; Mon, 16 Dec
 2019 00:50:52 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 8C.4C.52419.8E4D6FD5; Mon, 16 Dec 2019 09:50:48 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20191216005048epcas1p369df270aca6b7483d38f9ee4a00f6f1d~gs7J1A1bn0826508265epcas1p3j;
 Mon, 16 Dec 2019 00:50:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191216005048epsmtrp1cbefa5fa4dfed5ca69240a04dc95423e~gs7Jz9EsJ2363023630epsmtrp1g;
 Mon, 16 Dec 2019 00:50:48 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-1d-5df6d4e8308c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 30.29.10238.8E4D6FD5; Mon, 16 Dec 2019 09:50:48 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191216005048epsmtip1a1fd24321ead4eaf1c257793b107d4ad~gs7JhoQ-i1012310123epsmtip1s;
 Mon, 16 Dec 2019 00:50:48 +0000 (GMT)
Subject: Re: [RFC PATCH v2 05/11] interconnect: Export
 of_icc_get_from_provider()
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <42a50e8a-c201-ac88-5353-873c981359f0@samsung.com>
Date: Mon, 16 Dec 2019 09:57:24 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20190919142236.4071-6-a.swigon@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJsWRmVeSWpSXmKPExsWy7bCmvu6LK99iDWZdtbK4P6+V0WLjjPWs
 FvOPnGO1uPL1PZvF9L2b2Cwm3Z/AYnH+/AZ2ixV3P7JabHp8jdXi8q45bBafe48wWsw4v4/J
 Yu2Ru+wWtxtXsFnMmPySzYHfY9OqTjaPO9f2sHnc7z7O5LF5Sb3Hxnc7mDz6tqxi9Pi8SS6A
 PSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfobiWF
 ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWWBXnFibnFpXrpecn6ulaGBgZEpUGFC
 dsacTU9YCq4JVRycMoetgfEMfxcjJ4eEgInEnwPLGbsYuTiEBHYwSjx/dp8NwvnEKPH67H5W
 COcbo8SE7UdZYVquTrrLBJHYyyhxak4PM4TznlGiqX8GWJWwQLBE1/Ir7CAJEYH/jBKnl60E
 m8UscIxRYu+dnywgVWwCWhL7X9xgA7H5BRQlrv54zAhi8wrYSbxbPB9oLAcHi4CqRMOFAJCw
 qECYxMltLVAlghInZz4BG8MpYCnx/egOJhCbWUBc4taT+VC2vETz1tnMEGfvY5d48qkawnaR
 6HyyignCFpZ4dXwLO4QtJfGyvw3KrpZYefIIODAkBDoYJbbsvwD1v7HE/qWTmUBuYxbQlFi/
 Sx8irCix8/dcRoi9fBLvvvawgpRICPBKdLQJQZQoS1x+cBdqraTE4vZOtgmMSrOQfDMLyQez
 kHwwC2HZAkaWVYxiqQXFuempxYYFxsjRvYkRnKi1zHcwbjjnc4hRgINRiYfXIftbrBBrYllx
 Ze4hRgkOZiUR3lTtz7FCvCmJlVWpRfnxRaU5qcWHGE2BYT2RWUo0OR+YRfJK4g1NjYyNjS1M
 DM1MDQ2VxHk5flyMFRJITyxJzU5NLUgtgulj4uCUamDUnmDk8/fA4psnV+xukhINEpJOe6q3
 msf+bMjrzqDb0tzfXszlSKiOjljycdPWhhmWqY/iYgNWtr62dZ5wMuCB+Uz71YpCzz9c3H7A
 s7mzad3B6dsUH3zlOLP7fvXdh3seMOQV5NoY7vl67RxX6u+koqUqt4oDj1/MT/7r+dxINuJT
 Zr7ZjiW/lFiKMxINtZiLihMBeBP9G+oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRmVeSWpSXmKPExsWy7bCSnO6LK99iDfquyVncn9fKaLFxxnpW
 i/lHzrFaXPn6ns1i+t5NbBaT7k9gsTh/fgO7xYq7H1ktNj2+xmpxedccNovPvUcYLWac38dk
 sfbIXXaL240r2CxmTH7J5sDvsWlVJ5vHnWt72Dzudx9n8ti8pN5j47sdTB59W1YxenzeJBfA
 HsVlk5Kak1mWWqRvl8CVMWfTE5aCa0IVB6fMYWtgPMPfxcjJISFgInF10l0mEFtIYDejxPv5
 LBBxSYlpF48ydzFyANnCEocPF3cxcgGVvGWUePZwPVi9sECwRNfyK+wgCRGB/4wSD9uOMYI4
 zALHGCU+rljPCtECNPX79S9gLWwCWhL7X9xgA7H5BRQlrv54zAhi8wrYSbxbPB9sHYuAqkTD
 hQCQsKhAmMTOJY+ZIEoEJU7OfAJ2HaeApcT3ozvA4swC6hJ/5l1ihrDFJW49mQ8Vl5do3jqb
 eQKj8Cwk7bOQtMxC0jILScsCRpZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBEaul
 uYPx8pL4Q4wCHIxKPLwO2d9ihVgTy4orcw8xSnAwK4nwpmp/jhXiTUmsrEotyo8vKs1JLT7E
 KM3BoiTO+zTvWKSQQHpiSWp2ampBahFMlomDU6qBkf9XMV/Mt4qVRitWcup86bhk+uHVL7V9
 P9e8n+afb2E7vU/v+419WzweGp9/25DiPP+45jsNzw2GK9X/i7Av27Vye2ObR9mvg1x5Z9fd
 sr1ufaJp/uNdtxf8fS3IVC4XkvrwU0dZ+O8JpROv3lm6LGGdlde6iKnTZ56IKJzR4ZMpd+su
 g62gx2UlluKMREMt5qLiRACrEIzl1AIAAA==
X-CMS-MailID: 20191216005048epcas1p369df270aca6b7483d38f9ee4a00f6f1d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190919142325eucas1p28102446c22b1e1c61aae0bad46d079b0
References: <20190919142236.4071-1-a.swigon@samsung.com>
 <CGME20190919142325eucas1p28102446c22b1e1c61aae0bad46d079b0@eucas1p2.samsung.com>
 <20190919142236.4071-6-a.swigon@samsung.com>
X-Mailman-Approved-At: Mon, 16 Dec 2019 08:30:48 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com, krzk@kernel.org,
 myungjoo.ham@samsung.com, leonard.crestez@nxp.com, georgi.djakov@linaro.org,
 m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xOS8xOSAxMToyMiBQTSwgQXJ0dXIgxZp3aWdvxYQgd3JvdGU6Cj4gRnJvbTogQXJ0dXIg
xZp3aWdvxYQgPGEuc3dpZ29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+Cj4gCj4gVGhpcyBwYXRjaCBt
YWtlcyB0aGUgYWJvdmUgZnVuY3Rpb24gcHVibGljIChmb3IgdXNlIGluIGV4eW5vcy1idXMgZGV2
ZnJlcQo+IGRyaXZlcikuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dp
Z29uQHBhcnRuZXIuc2Ftc3VuZy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5j
ICAgICAgICAgICB8IDMgKystCj4gIGluY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3ZpZGVy
LmggfCA2ICsrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMgYi9k
cml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMKPiBpbmRleCA3Yjk3MTIyOGRmMzguLjk1ODUwNzAw
ZTM2NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMKPiArKysgYi9k
cml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMKPiBAQCAtMjc5LDcgKzI3OSw3IEBAIEVYUE9SVF9T
WU1CT0xfR1BMKG9mX2ljY194bGF0ZV9vbmVjZWxsKTsKPiAgICogUmV0dXJucyBhIHZhbGlkIHBv
aW50ZXIgdG8gc3RydWN0IGljY19ub2RlIG9uIHN1Y2Nlc3Mgb3IgRVJSX1BUUigpCj4gICAqIG9u
IGZhaWx1cmUuCj4gICAqLwo+IC1zdGF0aWMgc3RydWN0IGljY19ub2RlICpvZl9pY2NfZ2V0X2Zy
b21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYykKPiArc3RydWN0IGljY19u
b2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3Bl
YykKPiAgewo+ICAJc3RydWN0IGljY19ub2RlICpub2RlID0gRVJSX1BUUigtRVBST0JFX0RFRkVS
KTsKPiAgCXN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyOwo+IEBAIC0yOTgsNiArMjk4LDcg
QEAgc3RhdGljIHN0cnVjdCBpY2Nfbm9kZSAqb2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKHN0cnVj
dCBvZl9waGFuZGxlX2FyZ3MgKnNwZWMpCj4gIAo+ICAJcmV0dXJuIG5vZGU7Cj4gIH0KPiArRVhQ
T1JUX1NZTUJPTF9HUEwob2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKTsKPiAgCj4gIC8qKgo+ICAg
KiBvZl9pY2NfZ2V0KCkgLSBnZXQgYSBwYXRoIGhhbmRsZSBmcm9tIGEgRFQgbm9kZSBiYXNlZCBv
biBuYW1lCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3ZpZGVy
LmggYi9pbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCj4gaW5kZXggYjE2Zjll
ZmZhNTU1Li4wNzBlNDExNTY0ZTEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pbnRlcmNv
bm5lY3QtcHJvdmlkZXIuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3Zp
ZGVyLmgKPiBAQCAtMTAwLDYgKzEwMCw3IEBAIHZvaWQgaWNjX25vZGVfYWRkKHN0cnVjdCBpY2Nf
bm9kZSAqbm9kZSwgc3RydWN0IGljY19wcm92aWRlciAqcHJvdmlkZXIpOwo+ICB2b2lkIGljY19u
b2RlX2RlbChzdHJ1Y3QgaWNjX25vZGUgKm5vZGUpOwo+ICBpbnQgaWNjX3Byb3ZpZGVyX2FkZChz
dHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcik7Cj4gIGludCBpY2NfcHJvdmlkZXJfZGVsKHN0
cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKTsKPiArc3RydWN0IGljY19ub2RlICpvZl9pY2Nf
Z2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYyk7Cj4gIAo+ICAj
ZWxzZQo+ICAKPiBAQCAtMTQwLDYgKzE0MSwxMSBAQCBzdGF0aWMgaW5saW5lIGludCBpY2NfcHJv
dmlkZXJfZGVsKHN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKQo+ICAJcmV0dXJuIC1FTk9U
U1VQUDsKPiAgfQo+ICAKPiArc3RydWN0IGljY19ub2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlk
ZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYykKPiArewo+ICsJcmV0dXJuIEVSUl9QVFIo
LUVOT1RTVVBQKTsKPiArfQo+ICsKPiAgI2VuZGlmIC8qIENPTkZJR19JTlRFUkNPTk5FQ1QgKi8K
PiAgCj4gICNlbmRpZiAvKiBfX0xJTlVYX0lOVEVSQ09OTkVDVF9QUk9WSURFUl9IICovCj4gCgpS
ZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+CgotLSAKQmVz
dCBSZWdhcmRzLApDaGFud29vIENob2kKU2Ftc3VuZyBFbGVjdHJvbmljcwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
