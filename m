Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64395D1E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 13:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3E16E794;
	Tue, 20 Aug 2019 11:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8DD6E794
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 11:18:48 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190820111846euoutp0131379e6f47cdd4b9e813fb72d9cbb3e5~8nXwdRPpY2596425964euoutp01S
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 11:18:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190820111846euoutp0131379e6f47cdd4b9e813fb72d9cbb3e5~8nXwdRPpY2596425964euoutp01S
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190820111846eucas1p11031f64edad0a30e0445b58765f86b3d~8nXwCoEeb0547905479eucas1p1I;
 Tue, 20 Aug 2019 11:18:46 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 62.DB.04374.617DB5D5; Tue, 20
 Aug 2019 12:18:46 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190820111845eucas1p215fb8d38dddce8ebedf0c8c8da212c74~8nXvM9M0M0571405714eucas1p29;
 Tue, 20 Aug 2019 11:18:45 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190820111845eusmtrp181766d1dda30b34573bb266be8f57b58~8nXu_r2QU1052310523eusmtrp1g;
 Tue, 20 Aug 2019 11:18:45 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-14-5d5bd7160620
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7F.15.04117.517DB5D5; Tue, 20
 Aug 2019 12:18:45 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190820111844eusmtip1e1b889110916291f65752e7d3b7f4825~8nXun1Is81500415004eusmtip1J;
 Tue, 20 Aug 2019 11:18:44 +0000 (GMT)
Subject: Re: [PATCH v2 01/50] video: hdmi: Change return type of
 hdmi_avi_infoframe_init() to void
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <0e1c3366-d20b-d51a-db9e-49ec37ec6139@samsung.com>
Date: Tue, 20 Aug 2019 13:18:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820011721.30136-2-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pi16NjDR7cYLO48vU9m0XnxCXs
 Fg9e7me0uDv5CJB47Wexfv4tNgc2j3lrqj123F3C6DG7Yyarx/3u40wex3fdYvc4fmM7UwBb
 FJdNSmpOZllqkb5dAldG17HLTAWvpCrO3JzB2sD4WbSLkZNDQsBE4sK5f0wgtpDACkaJUx9i
 uhi5gOwvjBJrDs9hhHA+M0rsuvqYFaZj163/bBCJ5YwS099PhXLeMkp0f2pkA6kSFkiRODxp
 CTOILSJgIdG7aDrYKGaBc4wS/ff+giXYBKwkJravYgSxeQXsJK5O2wDWzCKgKjHp4gOwGlGB
 CIn7xzawQtQISpyc+YQFxOYUcJe48GEzWJxZQFzi1pP5TBC2vMT2t3OYQZZJCGxil5h4cSMb
 xN0uEsvnvIH6QVji1fEt7BC2jMTpyT0sEA3rGCX+dryA6t7OKLF88j+obmuJw8cvAnVzAK3Q
 lFi/Sx8i7Cjx8+QFRpCwhACfxI23ghBH8ElM2jadGSLMK9HRJgRRrSaxYdkGNpi1XTtXMk9g
 VJqF5LVZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07MLS7NS9dLzs/dxAhMQqf/Hf+6
 g3Hfn6RDjAIcjEo8vB7TomKFWBPLiitzDzFKcDArifBWzAEK8aYkVlalFuXHF5XmpBYfYpTm
 YFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYKyMn5YRZX34fNqZTvn1B67pKwodvPF8atyX
 BP41CU+P3dh/aJ06740D7ytO3f14UOWkp0fyfVOtGfdE9lye8y/r3VXOB8mym9te3L4e2vFg
 vVb8TqeG7J0JW1Vu8AjWqMdNXGBWZn1xz4tu87/t2xefUrwkGMFR/tye64914//d74WP7w8+
 JByrxFKckWioxVxUnAgAnxmEDD4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRmVeSWpSXmKPExsVy+t/xu7qi16NjDe5s4LS48vU9m0XnxCXs
 Fg9e7me0uDv5CJB47Wexfv4tNgc2j3lrqj123F3C6DG7Yyarx/3u40wex3fdYvc4fmM7UwBb
 lJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl5G17HL
 TAWvpCrO3JzB2sD4WbSLkZNDQsBEYtet/2xdjFwcQgJLGSXaHq5j6mLkAErISBxfXwZRIyzx
 51oXVM1rRomdK3eygCSEBVIkDk9awgxiiwhYSPQums4IUsQscI5RYvfVVhaIjuuMEusfzAHr
 YBOwkpjYvooRxOYVsJO4Om0DG4jNIqAqMeniA7BJogIREmfer2CBqBGUODnzCZjNKeAuceHD
 ZlYQm1lAXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4
 Nz232EivODG3uDQvXS85P3cTIzDqth37uWUHY9e74EOMAhyMSjy8HtOiYoVYE8uKK3MPMUpw
 MCuJ8FbMAQrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjAh5JXEG5oamltYGpobmxubWSiJ
 83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYNR+WeAVP41X3Ou4SFcGo/8l+ZC13FURwWazN/+O
 cKxIdy69elr9cdMDM5EjqwRWvQty28nGXD75NN+UBwrvT8UI2zgsZ+a/kbl4RXLCk09R2y/9
 l09P/sEnZPwrd/WBoBU/19jOlXXcKBTn1a81t+fowysXBCf+m1d2OmFZ7Tmptx31xdbz3ZVY
 ijMSDbWYi4oTAXXC8PXQAgAA
X-CMS-MailID: 20190820111845eucas1p215fb8d38dddce8ebedf0c8c8da212c74
X-Msg-Generator: CA
X-RootMTR: 20190820011737epcas1p18382b5054f39aa3aa936fb416fe7b6a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190820011737epcas1p18382b5054f39aa3aa936fb416fe7b6a6
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <CGME20190820011737epcas1p18382b5054f39aa3aa936fb416fe7b6a6@epcas1p1.samsung.com>
 <20190820011721.30136-2-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1566299926;
 bh=mVmcJpiVdgdsI4wmgfZfH64ZAonQ8599LUZaFDes5qo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=anpkSzfI170V4N13UXZVg55AjzaBZ7szuLx6PBEJoJD7NIkcApkgyzYdFFORdmQD7
 fB4bGdpK4PD0WzgGHamMIz9pDAoKNQds7nex+nm5RUAdj6hTZ65g6Gm3s/9OGAHoVU
 66EJp72RFMMyddh/kwwDNdvlEWA/Uv5Qt+05kKL8=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjAvMTkgMzoxNiBBTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBUaGUgaGRtaV9h
dmlfaW5mb2ZyYW1lX2luaXQoKSBuZXZlciBuZWVkcyB0byByZXR1cm4gYW4gZXJyb3IsIGNoYW5n
ZSBpdHMKPiByZXR1cm4gdHlwZSB0byB2b2lkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQg
UGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1i
eTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KCkFja2VkLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCi0tCkJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBv
bGFuZApTYW1zdW5nIEVsZWN0cm9uaWNzCgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gCj4g
LSBSZW1vdmVkIGRvY3VtZW50YXRpb24gb2YgdGhlIHJldHVybiB2YWx1ZQo+IAo+IENjOiBCYXJ0
bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgIDUgKy0tLS0KPiAgZHJpdmVycy92aWRlby9o
ZG1pLmMgICAgICAgfCAxMSArKy0tLS0tLS0tLQo+ICBpbmNsdWRlL2xpbnV4L2hkbWkuaCAgICAg
ICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IGluZGV4IDgyYTRjZWVkM2ZjZi4uODZkZGI2N2MxZThh
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9lZGlkLmMKPiBAQCAtNTA4MywxNCArNTA4MywxMSBAQCBkcm1faGRtaV9h
dmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUg
KmZyYW1lLAo+ICAJCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPiAg
ewo+ICAJZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IHBpY3R1cmVfYXNwZWN0Owo+IC0JaW50IGVy
cjsKPiAgCj4gIAlpZiAoIWZyYW1lIHx8ICFtb2RlKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAK
PiAtCWVyciA9IGhkbWlfYXZpX2luZm9mcmFtZV9pbml0KGZyYW1lKTsKPiAtCWlmIChlcnIgPCAw
KQo+IC0JCXJldHVybiBlcnI7Cj4gKwloZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChmcmFtZSk7Cj4g
IAo+ICAJaWYgKG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19EQkxDTEspCj4gIAkJZnJhbWUt
PnBpeGVsX3JlcGVhdCA9IDE7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vaGRtaS5jIGIv
ZHJpdmVycy92aWRlby9oZG1pLmMKPiBpbmRleCBiOTM5YmMyOGQ4ODYuLmZmNGQwOTU5MjYwMiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8v
aGRtaS5jCj4gQEAgLTUzLDE4ICs1MywxNCBAQCBzdGF0aWMgdm9pZCBoZG1pX2luZm9mcmFtZV9z
ZXRfY2hlY2tzdW0odm9pZCAqYnVmZmVyLCBzaXplX3Qgc2l6ZSkKPiAgLyoqCj4gICAqIGhkbWlf
YXZpX2luZm9mcmFtZV9pbml0KCkgLSBpbml0aWFsaXplIGFuIEhETUkgQVZJIGluZm9mcmFtZQo+
ICAgKiBAZnJhbWU6IEhETUkgQVZJIGluZm9mcmFtZQo+IC0gKgo+IC0gKiBSZXR1cm5zIDAgb24g
c3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KPiAgICovCj4gLWlu
dCBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFt
ZSkKPiArdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSkKPiAgewo+ICAJbWVtc2V0KGZyYW1lLCAwLCBzaXplb2YoKmZyYW1lKSk7Cj4g
IAo+ICAJZnJhbWUtPnR5cGUgPSBIRE1JX0lORk9GUkFNRV9UWVBFX0FWSTsKPiAgCWZyYW1lLT52
ZXJzaW9uID0gMjsKPiAgCWZyYW1lLT5sZW5ndGggPSBIRE1JX0FWSV9JTkZPRlJBTUVfU0laRTsK
PiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGhkbWlfYXZpX2luZm9mcmFt
ZV9pbml0KTsKPiAgCj4gQEAgLTE1NTMsNyArMTU0OSw2IEBAIHN0YXRpYyBpbnQgaGRtaV9hdmlf
aW5mb2ZyYW1lX3VucGFjayhzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKPiAgCQkJ
CSAgICAgY29uc3Qgdm9pZCAqYnVmZmVyLCBzaXplX3Qgc2l6ZSkKPiAgewo+ICAJY29uc3QgdTgg
KnB0ciA9IGJ1ZmZlcjsKPiAtCWludCByZXQ7Cj4gIAo+ICAJaWYgKHNpemUgPCBIRE1JX0lORk9G
UkFNRV9TSVpFKEFWSSkpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTE1NjYsOSArMTU2MSw3
IEBAIHN0YXRpYyBpbnQgaGRtaV9hdmlfaW5mb2ZyYW1lX3VucGFjayhzdHJ1Y3QgaGRtaV9hdmlf
aW5mb2ZyYW1lICpmcmFtZSwKPiAgCWlmIChoZG1pX2luZm9mcmFtZV9jaGVja3N1bShidWZmZXIs
IEhETUlfSU5GT0ZSQU1FX1NJWkUoQVZJKSkgIT0gMCkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
Cj4gLQlyZXQgPSBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChmcmFtZSk7Cj4gLQlpZiAocmV0KQo+
IC0JCXJldHVybiByZXQ7Cj4gKwloZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChmcmFtZSk7Cj4gIAo+
ICAJcHRyICs9IEhETUlfSU5GT0ZSQU1FX0hFQURFUl9TSVpFOwo+ICAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9oZG1pLmggYi9pbmNsdWRlL2xpbnV4L2hkbWkuaAo+IGluZGV4IDk5MThh
NmM5MTBjNS4uOTYxM2Q3OTZjZmIxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvaGRtaS5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9oZG1pLmgKPiBAQCAtMjA3LDcgKzIwNyw3IEBAIHN0cnVj
dCBoZG1pX2RybV9pbmZvZnJhbWUgewo+ICAJdTE2IG1heF9mYWxsOwo+ICB9Owo+ICAKPiAtaW50
IGhkbWlfYXZpX2luZm9mcmFtZV9pbml0KHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1l
KTsKPiArdm9pZCBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSk7Cj4gIHNzaXplX3QgaGRtaV9hdmlfaW5mb2ZyYW1lX3BhY2soc3RydWN0IGhk
bWlfYXZpX2luZm9mcmFtZSAqZnJhbWUsIHZvaWQgKmJ1ZmZlciwKPiAgCQkJCXNpemVfdCBzaXpl
KTsKPiAgc3NpemVfdCBoZG1pX2F2aV9pbmZvZnJhbWVfcGFja19vbmx5KGNvbnN0IHN0cnVjdCBo
ZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1lLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
