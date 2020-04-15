Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D301AAA1C
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECEF6E9E7;
	Wed, 15 Apr 2020 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8986E9E7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 14:36:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200415143639euoutp01698571a9a93428faac1591a2a7b31692~GBPwVhLe71497514975euoutp01f
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 14:36:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200415143639euoutp01698571a9a93428faac1591a2a7b31692~GBPwVhLe71497514975euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586961399;
 bh=mhVRtpTv1+Rha0ywve760KTm268UKvpvEKCKzEy6wuE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=e4i+YlHrnsKsH82ExM19jFnX0dcJr56NFmlZhC2UlN3Ym+gPUwwMofplAJYynE0Gi
 yKdfjwr1eKBRxr3oasjprDyLc6B+SsfFuolSJ0fW0iRDwXX6ytOoSj1OrkJI67ylVh
 C+4UkBmMDbjq5nuScXWTjkXNjG3yLyz2FFk3DLXE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200415143639eucas1p28d1de8c3f7a18c789164666830370cc2~GBPwGnNtz0681906819eucas1p2O;
 Wed, 15 Apr 2020 14:36:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id ED.69.60679.7FB179E5; Wed, 15
 Apr 2020 15:36:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200415143638eucas1p2139b7a00566464a3a2fa42811569db9c~GBPvq5ao00659306593eucas1p2i;
 Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200415143638eusmtrp14bcd3a063a22c8293964cc9567304808~GBPvqUDyH3250832508eusmtrp1X;
 Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-75-5e971bf71553
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DF.65.07950.6FB179E5; Wed, 15
 Apr 2020 15:36:38 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200415143638eusmtip269a8ac7662a0f87fed8d4c478c136ada~GBPvYFPnw3120031200eusmtip27;
 Wed, 15 Apr 2020 14:36:38 +0000 (GMT)
Subject: Re: [PATCH v1 1/5] video: ssd1307fb: Convert driver to use
 ->probe_new()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3f4e53db-e933-b5ba-82fe-2a839ed11a87@samsung.com>
Date: Wed, 15 Apr 2020 16:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200415142018.GH185537@smile.fi.intel.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7rfpafHGfxdyWnR2zSdyeLK1/ds
 Fif6PrBaLFu2ltWBxWPnrLvsHvNOBnrc7z7O5PF5k1wASxSXTUpqTmZZapG+XQJXxsuf/1gL
 PglVbLnYwdzAuJa/i5GTQ0LAROJUzxW2LkYuDiGBFYwS11rnsIMkhAS+MErsni4KkfjMKPGu
 fS0bTMeX029YIIqWAxV9cIMoessocb3nGVA3B4ewQLDEr1NeIDUiAuYS6yYtAutlFgiVWH7q
 G9gCNgEriYntqxhBbF4BO4nJa86BxVkEVCVmvloBVi8qECHx6cFhVogaQYmTM5+A7eUUsJT4
 NH0JC8RMcYlbT+YzQdjyEs1bZzOD3CMhMJld4sz7vSwQR7tIdL5bwgxhC0u8Or6FHcKWkTg9
 uYcFomEdo8TfjhdQ3dsZJZZP/gf1srXEnXO/2EA+YxbQlFi/Sx8i7Cix/XgrI0hYQoBP4sZb
 QYgj+CQmbZvODBHmlehoE4KoVpPYsGwDG8zarp0rmScwKs1C8tosJO/MQvLOLIS9CxhZVjGK
 p5YW56anFhvlpZbrFSfmFpfmpesl5+duYgSmldP/jn/ZwbjrT9IhRgEORiUeXoOX0+KEWBPL
 iitzDzFKcDArifCuz50aJ8SbklhZlVqUH19UmpNafIhRmoNFSZzXeNHLWCGB9MSS1OzU1ILU
 IpgsEwenVAPjjC/z/vtmpOd8fbZgzqbDUo5FIcW1SpvjLF7peDlLfj3A5X5pzp5r6psO+m1+
 s6E4O89iru/caeue/uvK4md9+jXo3oPVm60WV4slHnhzyp/ZZ2Pe3XPsP26ysWx6to0l/dLx
 cpe76T9ONB7yr1mdofcgSdHprPXjJRuZf1ho/d0676rFk0XnGJVYijMSDbWYi4oTAcfaOLIn
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xe7rfpKfHGTxq07DobZrOZHHl63s2
 ixN9H1gtli1by+rA4rFz1l12j3knAz3udx9n8vi8SS6AJUrPpii/tCRVISO/uMRWKdrQwkjP
 0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEv4+XPf6wFn4QqtlzsYG5gXMvfxcjJISFg
 IvHl9BuWLkYuDiGBpYwSDUeWM3UxcgAlZCSOry+DqBGW+HOtiw2i5jWjRM/G44wgNcICwRK/
 TnmB1IgImEusm7SIDcRmFgiVePKvlRmi/iejRN/0t0wgCTYBK4mJ7asYQWxeATuJyWvOsYPY
 LAKqEjNfrQBrFhWIkDi8YxZUjaDEyZlPWEBsTgFLiU/Tl7BALFCX+DPvEjOELS5x68l8Jghb
 XqJ562zmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIERtK2
 Yz+37GDsehd8iFGAg1GJh7fj9bQ4IdbEsuLK3EOMEhzMSiK863OnxgnxpiRWVqUW5ccXleak
 Fh9iNAV6biKzlGhyPjDK80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB9DFx
 cEo1MGo/fzr1ctWFJ0eP3OQwCs7pcpeU1k6vfGI8xYmRJ8PbOeHxiviKR/6TxEyeXDS5/WEd
 n+ol175jSzqVdyr/PX9Pxt7IyGSPY1iWv6H70v+X0sU5JSOOr9Uw/TDxge5FjV3qkq4Xdx/8
 vaHTnnPFv5nfnOQTG1STnrG1KDu6Ocbdz/k1WUH5kxJLcUaioRZzUXEiAP3sEWq6AgAA
X-CMS-MailID: 20200415143638eucas1p2139b7a00566464a3a2fa42811569db9c
X-Msg-Generator: CA
X-RootMTR: 20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732
References: <20200324170532.44384-1-andriy.shevchenko@linux.intel.com>
 <20200330095144.GL1922688@smile.fi.intel.com>
 <CGME20200415142020eucas1p2b9c75eee5c24918c3c657386345f0732@eucas1p2.samsung.com>
 <20200415142018.GH185537@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, xllacyx@gmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ClsgYWRkZWQgZHJpLWRldmVsIHRvIENjOiBdCgpIaSwKCk9uIDQvMTUvMjAgNDoyMCBQTSwgQW5k
eSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDMwLCAyMDIwIGF0IDEyOjUxOjQ0UE0g
KzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKPj4gT24gVHVlLCBNYXIgMjQsIDIwMjAgYXQg
MDc6MDU6MjhQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+Pj4gVXNlIHRoZSAtPnBy
b2JlX25ldygpIGNhbGxiYWNrLgo+Pj4KPj4+IFRoZSBkcml2ZXIgZG9lcyBub3QgdXNlIGNvbnN0
IHN0cnVjdCBpMmNfZGV2aWNlX2lkICogYXJndW1lbnQsCj4+PiBzbyBjb252ZXJ0IGl0IHRvIHV0
aWxpc2UgdGhlIHNpbXBsaWZpZWQgScKyQyBkcml2ZXIgcmVnaXN0cmF0aW9uLgo+Pj4KPj4KPj4g
QmFydGxvbWllaiwgYW55IGNvbW1lbnRzIG9uIHRoZSBzZXJpZXM/Cj4gCj4gRG8gSSBuZWVkIHRv
IGRvIHNvbWV0aGluZyB3aXRoIHRoZSBzZXJpZXM/CgpJdCBoYXNuJ3QgYmVlbiBsb3N0IDopLCBq
dXN0IGhhbmRsaW5nIG9mIGZiZGV2IHBhdGNoZXMgcG9zdGVkIHRvbwpsYXRlIGZvciB2NS43IGhh
cyBiZWVuIHBvc3Rwb25lZCBhZnRlciB2NS43LXJjMSByZWxlYXNlLgoKTEdUTSBhZnRlciBxdWlj
ayBsb29rLgoKSSdsbCByZXZpZXcgaXQgcHJvcGVybHkgLyBhcHBseSBsYXRlciB0aGlzIHdlZWsg
KGhvcGVmdWxseSB0b21vcnJvdykuCgpCZXN0IHJlZ2FyZHMsCi0tCkJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3oKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZApTYW1zdW5nIEVsZWN0cm9uaWNz
Cgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0Bs
aW51eC5pbnRlbC5jb20+Cj4+PiAtLS0KPj4+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdm
Yi5jIHwgMTAgKystLS0tLS0tLQo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c3NkMTMwN2ZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NzZDEzMDdmYi5jCj4+PiBpbmRleCAx
NDI1MzUyNjdmZWMuLjM5N2VhZTI0NmMyYyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc3NkMTMwN2ZiLmMKPj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc3NkMTMwN2Zi
LmMKPj4+IEBAIC01ODYsOCArNTg2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgc3NkMTMwN2ZiX29mX21hdGNoW10gPSB7Cj4+PiAgfTsKPj4+ICBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBzc2QxMzA3ZmJfb2ZfbWF0Y2gpOwo+Pj4gIAo+Pj4gLXN0YXRpYyBpbnQgc3NkMTMw
N2ZiX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCj4+PiAtCQkJICAgY29uc3Qgc3Ry
dWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+Pj4gK3N0YXRpYyBpbnQgc3NkMTMwN2ZiX3Byb2JlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4+PiAgewo+Pj4gIAlzdHJ1Y3QgYmFja2xpZ2h0X2Rl
dmljZSAqYmw7Cj4+PiAgCWNoYXIgYmxfbmFtZVsxMl07Cj4+PiBAQCAtNTk5LDExICs1OTgsNiBA
QCBzdGF0aWMgaW50IHNzZDEzMDdmYl9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAo+
Pj4gIAl2b2lkICp2bWVtOwo+Pj4gIAlpbnQgcmV0Owo+Pj4gIAo+Pj4gLQlpZiAoIW5vZGUpIHsK
Pj4+IC0JCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiTm8gZGV2aWNlIHRyZWUgZGF0YSBmb3VuZCFc
biIpOwo+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4+PiAtCX0KPj4+IC0KPj4+ICAJaW5mbyA9IGZy
YW1lYnVmZmVyX2FsbG9jKHNpemVvZihzdHJ1Y3Qgc3NkMTMwN2ZiX3BhciksICZjbGllbnQtPmRl
dik7Cj4+PiAgCWlmICghaW5mbykKPj4+ICAJCXJldHVybiAtRU5PTUVNOwo+Pj4gQEAgLTgwOCw3
ICs4MDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgc3NkMTMwN2ZiX2ky
Y19pZFtdID0gewo+Pj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBzc2QxMzA3ZmJfaTJjX2lk
KTsKPj4+ICAKPj4+ICBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgc3NkMTMwN2ZiX2RyaXZlciA9
IHsKPj4+IC0JLnByb2JlID0gc3NkMTMwN2ZiX3Byb2JlLAo+Pj4gKwkucHJvYmVfbmV3ID0gc3Nk
MTMwN2ZiX3Byb2JlLAo+Pj4gIAkucmVtb3ZlID0gc3NkMTMwN2ZiX3JlbW92ZSwKPj4+ICAJLmlk
X3RhYmxlID0gc3NkMTMwN2ZiX2kyY19pZCwKPj4+ICAJLmRyaXZlciA9IHsKPj4+IC0tIAo+Pj4g
Mi4yNS4xCj4+Pgo+Pgo+PiAtLSAKPj4gV2l0aCBCZXN0IFJlZ2FyZHMsCj4+IEFuZHkgU2hldmNo
ZW5rbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
