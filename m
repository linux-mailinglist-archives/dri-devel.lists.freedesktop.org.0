Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096DF6CF87
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 16:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FAF6E3D2;
	Thu, 18 Jul 2019 14:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2C46E3D2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:16:15 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190718141613euoutp01931f29c8924bb43cc99fad32f9641ab9~yhgRO6TBB0215202152euoutp01C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 14:16:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190718141613euoutp01931f29c8924bb43cc99fad32f9641ab9~yhgRO6TBB0215202152euoutp01C
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190718141612eucas1p21bdd98468e25aa732aa23f92cc99989d~yhgQbzXDF2613026130eucas1p2Q;
 Thu, 18 Jul 2019 14:16:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 49.3E.04325.C2F703D5; Thu, 18
 Jul 2019 15:16:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190718141612eucas1p19040faed910e9308277cb3af2e49b674~yhgPptBZU2337623376eucas1p1o;
 Thu, 18 Jul 2019 14:16:12 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190718141611eusmtrp2685c8d5863909732b0b13c5089f40a1e~yhgPbovAr2627226272eusmtrp20;
 Thu, 18 Jul 2019 14:16:11 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-f5-5d307f2cda74
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F9.C4.04140.B2F703D5; Thu, 18
 Jul 2019 15:16:11 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190718141611eusmtip1e153ebe5450f9ced53f167105366c1e2~yhgO9tqqx0874808748eusmtip1f;
 Thu, 18 Jul 2019 14:16:11 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: fix RC_CORE dependency
To: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ea59751e-7391-e3e9-bb46-00e86b25f1a8@samsung.com>
Date: Thu, 18 Jul 2019 16:16:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190718134240.2265724-1-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj2O+ds52w5+5yaL10MR/0oSo3SDnShSOhIFBrYj2rUypNabsmO
 WnahISXOsLx0czMvaWQmKea9krzgvKBkRd7SWSwodRWYopWZ8yj573ne53m/93ngY0hli2Q5
 E6mL4fU6TZRKKqcqm6c6N2644qf2S0j3ZlM6Wwl2Or2ZZmcq00i28cEXxL4b/y5ljWkFNPu2
 NkvKfhm0E+xARhPaJeN+/0pH3MuJXIqrMQ3QnDkpU8LdMgJXNTEk4azXLQRnqe2jubEyr2DZ
 Yfn2MD4qMo7X++48Lo+wWRup6Dbn849LpigDeiFPRjIG8BYwPLmGkpGcUeJCBPdMZkokPxHc
 N9dLRTKGIOFxHbGwYrRlkaLwCEGTrZAWiR2BPbVV6nC54a1Qa/4kSUYM4455SJwIdnhIbCAg
 r+SVxOGR4nUw/ax3zq/AO2Gke5h2YAqvhbbnk6QDe+BDMJVrnPe4QmumjXJgGfYH+9uCuUQk
 Xg1V9ixSxJ7QZ8shHMcAD9LQ9zkLibEDoam6RSJiNxi2lNMiXgkzNTnz1a6AtfAqKS4nIago
 rSFFYRs0Wrrm2pCzqUtqfcXxbugYKKYcY8Au0GN3FTO4QHrlXVIcKyApUSm6vcHaUTH/oCc8
 fD0uTUUq06JmpkVtTIvamP7fzUVUEfLkYwVtOC9s1vHnfASNVojVhfucPKstQ7P/q/2vZbwa
 1f050YAwg1TOimCtn1op0cQJ8doGBAypclf0f/VVKxVhmvgLvP7sMX1sFC80oBUMpfJUXHQa
 OqLE4ZoY/gzPR/P6BZVgZMsN6GmhuZ9YMtZTtPto3jT/LWL/aCItLZ1xGknJWRZ/4NLB8tuT
 +o3WqAT1vq69RN1So64pI+bmjRP+W0dx2kh0QH7gjj1Fb2Rj3dlerQFu9ZG4J6z4TqW60+jC
 f+gVToe2Z0d3GULyHvalBEHuquHQUx75gxWXP5Kl73+YQuLX4CAVJURoNq0n9YLmH+3NLINb
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRmVeSWpSXmKPExsVy+t/xu7ra9QaxBidnalr0njvJZPF30jF2
 i//bJjJbHF70gtHiytf3bBadE5ewW1zeNYfN4sW9t0wWdycfYXTg9Pj9axKjx95vC1g8ds66
 y+4xu2Mmq8eUTgmP7d8esHrc7z7O5HF81y12j8+b5AI4o/RsivJLS1IVMvKLS2yVog0tjPQM
 LS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyntw/zFJwiqdi5fqfLA2Me7i6GDk5JARM
 JDqfzGHuYuTiEBJYyihx/mcDO0RCXGL3/LfMELawxJ9rXWwQRa8ZJR5MeMAGkhAWMJfYNfsR
 K4gtIpAqsfXiW0aQImaBJiaJ1x8es0B0dDBK3F+7DayKTUBT4u/mm2DdvAJ2Eq+vvwJbxyKg
 KnFq9w+gdRwcogJhEkdP5EGUCEqcnPmEBcTmFDCVeHt5CROIzSygLvFn3iVmCFteYvvbOVC2
 uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRGLHb
 jv3csoOx613wIUYBDkYlHt6AXINYIdbEsuLK3EOMEhzMSiK8t1/qxwrxpiRWVqUW5ccXleak
 Fh9iNAX6bSKzlGhyPjCZ5JXEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi
 4JRqYJzOJZaR/oGX597390lTeGZJxN6zUJjjGxmbFTWVWX+lGEO4t9DTfdq9G5zjD34I652R
 muQ6ZV7+i4hrs/5Eu2pvE/x4pXZvwZMfRparsw2e7Gu+6faTZ29p5ZIDRUUngytkP55pjt7a
 sVF/0hO5VwYNXOJWWZa7LnVsu8ha/T978R7hu01RX5RYijMSDbWYi4oTASEF853uAgAA
X-CMS-MailID: 20190718141612eucas1p19040faed910e9308277cb3af2e49b674
X-Msg-Generator: CA
X-RootMTR: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022
References: <CGME20190718134253epcas3p32a5afece52c47aaac0cd5795ff4cf022@epcas3p3.samsung.com>
 <20190718134240.2265724-1-arnd@arndb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1563459373;
 bh=wLENZPNH5/PowzkgyxZdtUEKoTWkuWsrgFeMFf+/LHQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=SZUPYHr7ijZFVTNNFzGuqDJ4RGYKOEtJRzBnkAEaflGi8sqyKmqk5p2Ri/Fn3NJTu
 NX3x8R+351BIFjsG0ywy3U/lu6ZGTBFYe4GXHwkBfx0wbfHGlXY0ywJTo6Sh37i0np
 KDX06Vh5ecJeKUXzECLnwLrU2tnWTAW7TGZyq3fw=
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
Cc: =?UTF-8?Q?Ronald_Tschal=c3=a4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQXJuZCwKCk9uIDE4LjA3LjIwMTkgMTU6NDIsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gVXNp
bmcgJ2ltcGx5JyBjYXVzZXMgYSBuZXcgcHJvYmxlbSwgYXMgaXQgYWxsb3dzIHRoZSBjYXNlIG9m
Cj4gQ09ORklHX0lOUFVUPW0gd2l0aCBSQ19DT1JFPXksIHdoaWNoIGZhaWxzIHRvIGxpbms6Cj4K
PiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rpb24gYGlyX2RvX2tleXVwJzoK
PiByYy1tYWluLmM6KC50ZXh0KzB4MmI0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRf
ZXZlbnQnCj4gZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86IEluIGZ1bmN0aW9uIGByY19yZXBl
YXQnOgo+IHJjLW1haW4uYzooLnRleHQrMHgzNTApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBp
bnB1dF9ldmVudCcKPiBkcml2ZXJzL21lZGlhL3JjL3JjLW1haW4ubzogSW4gZnVuY3Rpb24gYHJj
X2FsbG9jYXRlX2RldmljZSc6Cj4gcmMtbWFpbi5jOigudGV4dCsweDkwYyk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGlucHV0X2FsbG9jYXRlX2RldmljZScKPgo+IEFkZCBhICdkZXBlbmRzIG9u
JyB0aGF0IGFsbG93cyBidWlsZGluZyBib3RoIHdpdGggYW5kIHdpdGhvdXQKPiBDT05GSUdfUkNf
Q09SRSwgYnV0IGRpc2FsbG93cyBjb21iaW5hdGlvbnMgdGhhdCBkb24ndCBsaW5rLgo+Cj4gRml4
ZXM6IDUwMjNjZjMyMjEwZCAoImRybS9icmlkZ2U6IG1ha2UgcmVtb3RlIGNvbnRyb2wgb3B0aW9u
YWwiKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgoKUHJv
cGVyIHNvbHV0aW9uIGhhcyBiZWVuIGFscmVhZHkgbWVyZ2VkIHZpYSBpbnB1dCB0cmVlWzFdLgoK
ClsxXToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9DQUtkQWtSVEdYTmJVc3VLQVNOR0xm
d1V3QzdBc29kOUs1YmFZTFBXUFU3RVgtNDIteUFAbWFpbC5nbWFpbC5jb20vCgoKUmVnYXJkcwoK
QW5kcnplagoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9LY29uZmlnCj4gaW5kZXggZjY0YzkxZGVmZGMzLi43MGE4ZWQyNTA1YWEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gQEAgLTg1LDggKzg1LDggQEAgY29uZmlnIERSTV9TSUxf
U0lJODYyMAo+ICAJdHJpc3RhdGUgIlNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlk
Z2UiCj4gIAlkZXBlbmRzIG9uIE9GCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiArCWRlcGVu
ZHMgb24gUkNfQ09SRSB8fCAhUkNfQ09SRQo+ICAJaW1wbHkgRVhUQ09OCj4gLQlpbXBseSBSQ19D
T1JFCj4gIAloZWxwCj4gIAkgIFNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBicmlkZ2Ug
Y2hpcCBkcml2ZXIuCj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
