Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D2F1AE288
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 18:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCE56E088;
	Fri, 17 Apr 2020 16:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DFB6E088
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 16:52:54 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200417165253euoutp02ca970292d9a4772118155e1ce63dd2cc~GqZRZIAb70782007820euoutp026
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 16:52:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200417165253euoutp02ca970292d9a4772118155e1ce63dd2cc~GqZRZIAb70782007820euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587142373;
 bh=QmARaz/YfHjYaRRWniMOGcMe+Z+Z9e/ctlrnnaZF6qo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=nODZxfT1FoqKqTXnMMXBCmSAANUO59d8JwGeUNKW5byaVx+lzBZpMAAHvhw4y4PqO
 FBivbaLJIs/Nt/GZ1tHuSiznthsqH97bSHwABPPmDjviWkko5Lfb82VBHwjeU+xe1h
 YvbR2+7fqTbwci9PLBc4tTnort1fhjRIeLia/4tk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200417165252eucas1p178e2cd8f54b1d9f39a74fe8af2402add~GqZQyjV_83028430284eucas1p10;
 Fri, 17 Apr 2020 16:52:52 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 30.FA.61286.4EED99E5; Fri, 17
 Apr 2020 17:52:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200417165251eucas1p29128afec6cbfb0b75f2d6ef9ed06d7b9~GqZQEiFz01235212352eucas1p2Y;
 Fri, 17 Apr 2020 16:52:51 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200417165251eusmtrp2bb09470a53b1894976490fbf4d9043ce~GqZQDq6jp0574205742eusmtrp2V;
 Fri, 17 Apr 2020 16:52:51 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-24-5e99dee4e42a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id BF.70.08375.3EED99E5; Fri, 17
 Apr 2020 17:52:51 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200417165250eusmtip2c510447550a592bced1104ddfe31c847~GqZPGXUar1212812128eusmtip2F;
 Fri, 17 Apr 2020 16:52:50 +0000 (GMT)
Subject: Re: [PATCH 8/8] drm/bridge/sii8620: fix extcon dependency
To: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, linux-fbdev@vger.kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8c653a2f-abf1-906e-49d1-b2ab09c99c88@samsung.com>
Date: Fri, 17 Apr 2020 18:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200417155553.675905-9-arnd@arndb.de>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjO23t7e6mWXArIGzQ4avZjJkMUM47ZdEJ0O4l/ZvxDloB28waN
 UEwrbJAs6lyggKJ0KuslgooOAkxnXWHg1FiwfBhQN0b4/tBCKuHD0IFBBtrLxci/5zzPc573
 fU4Oz+jLuHD+sOmYaDYZUwyclq1xz7V/7BmwJ0VXj2wgZ9pbVGTB5taQHxfGWNIxM8WR0uJC
 NRntuasiT27EkvJ/bgJpqr6oIfZfmoFMd+YDyS28piHNBS/VZLzRDcT5YlJFxrNPAhke6lKT
 Eq+XI9J4MCk6M8EQX6ub2xlK51/bgJZIzSwdbc7h6NkbPjWtk/o1tNhqV1NHZS5HXR2/AXU1
 WIHWzg6paUnLXjqY36Sio0UNKupzRNDJ0gmOOn297FdBX2s/OyimHM4QzZt2HNAeKrpUzx1t
 1H3f9/gZnIC7q/IggEdhKzZk/8TkgZbXCxWA9+a6QBb0wn+AI7YPFMEH+GvnA/bdjdYpDyhC
 OWD30/blGxOAT1tDZRwsxKOvf14lm0KE04Bvzl9hZIERehicu2OQMSd8hAu3uzkZ64QdaHV1
 Lk1ghQ/xgqNiiQ8VEvBi7SIoniBssXuWPAH+LSqra0HJXI+nnMXL+WHY4yldGoyCh8ea/lea
 POD9h114azZQaRCMY01/aBS8Dt/UyX4ZH8fBCuUtULACOn+vYxThU+xrf83JOYx/6Zv1mxQ6
 DuerGtVKfCB2TQQpKwSiraaIUWgdWrP1ijsSB9ucy4FheP3JDHcODNKKYtKKMtKKMtL7uZeB
 rYQwMd2SmixaNpvE76IsxlRLuik56tu0VAf4v+6jxabpP2Hm729cIPBgWK2LPm1P0quNGZbM
 VBcgzxhCdA++8FO6g8bMLNGctt+cniJaXLCWZw1hupirLxL1QrLxmHhEFI+K5neqig8IPwGx
 67t93cLJjYvT0Sbp50LHnhjvam1kmn3b5/tyvCP1D+8nOqwDZR3Wv2LOP+7T/lBAS4+v+eTf
 tp1xUac2hEdkbdvv3HLpsjE5Izf9+e5JV9WdyMDZL11C2/b/K9wJF+J7rj7c+mps6pHdS3OH
 bu22rapyZ9GXZSE5a/KHexf3DFdJBtZyyLh5I2O2GN8C14XajLYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTURzHO7u7d9McXKfiyT8qBhlZbW5r7ayH9IA69FchQZRZQ6+PdC52
 N0slsgIf85VCzs100oNCrFCxciLhFHUGWT5WmpqpmOWrGj3VaI8C//uc7/l9vpwDPz4hbCbD
 +MlpekaXpk4VUf7c53+6xrZPjpljI2/1S1DRCwcHrZR18tDVlU9cNPBtkULWylISTQ+3ctDL
 h0p0r/8RQF115TxkrugG6KuzAKD80js81F38mURzHZ0ANX1c4KC5nCsAvR9/Q6LqmRkKWeaC
 kKlonkCunk5qXwhe+l0GcLWlm4unu3MpXPLQReJmyygPV+aZSdxQm09h+8ADgO3teQA/+T5O
 4mrHMfyuoIuDp03tHOxqWI8XrPMUbnK95R4NPCneo9Ma9MzGJC2r3ys6JUUysVSFxLIdKrFU
 rjy9S6YQSaL2xDOpyemMThJ1VpxkqrJR5zsEF0d6J0A2aF1rBH58SO+APYtTwAj8+UL6LoCm
 QRvPdxEKW6zzhI+D4LLTSHlYSM8CmDOQ4uEg+gB0jS5xPHIwXQigs8xBeA4EPUzAwcEZyldb
 D+DQhMtbRdFb4ErjkLdKQEfBPLuT62EuvQneaLjvzUPoE3CyNBf4ZgKhwzzlnfFzv7W27ok3
 J+jNcLm6j/DxBnitqfIfh8LhKSvnOhBaVumWVYpllWJZpdQAbi0IZgysJlHDSsWsWsMa0hLF
 cVpNA3CvzePOX41PQV99tB3QfCAKEEQWmmOFpDqdzdDYAeQTomBB2yF3JIhXZ2QyOu0ZnSGV
 Ye1A4f5cKREWEqd1L2Ga/oxUIVUilVQpV8p3IlGoII9uixHSiWo9k8Iw5xndf4/D9wvLBjAr
 qqhGom75GrN5JEdhjE74EZkrkyhm1zX+nkwv9reZlj4PJYSm2GaGrbovvc1hROLxLH9s/DDb
 Kt8V4Hz1VnJxH1uQ//pw4YZw5057X8XC1U3LH6Pv/Mxc88e0nzyIS4LWRmTLt10yXD53Qc47
 0HckvGSr6tbt/qqs8t2Pnt10iLhskloaQehY9V8VGYnvTAMAAA==
X-CMS-MailID: 20200417165251eucas1p29128afec6cbfb0b75f2d6ef9ed06d7b9
X-Msg-Generator: CA
X-RootMTR: 20200417155658eucas1p261d88a51a524547e61bfe79d0a29a7f1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200417155658eucas1p261d88a51a524547e61bfe79d0a29a7f1
References: <20200417155553.675905-1-arnd@arndb.de>
 <CGME20200417155658eucas1p261d88a51a524547e61bfe79d0a29a7f1@eucas1p2.samsung.com>
 <20200417155553.675905-9-arnd@arndb.de>
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
Cc: marex@denx.de, Jason Gunthorpe <jgg@ziepe.ca>, thellstrom@vmware.com,
 dsd@laptop.org, Nicolas Pitre <nico@fluxnic.net>, airlied@linux.ie,
 masahiroy@kernel.org, jfrederich@gmail.com, haojian.zhuang@gmail.com,
 linux-renesas-soc@vger.kernel.org, Saeed Mahameed <saeedm@mellanox.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Laurent.pinchart@ideasonboard.com, linux-graphics-maintainer@vmware.com,
 robert.jarzmik@free.fr, daniel@zonque.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcuMDQuMjAyMCAxNzo1NSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBVc2luZyAnaW1wbHkn
IGRvZXMgbm90IHdvcmsgaGVyZSwgaXQgc3RpbGwgY2F1c2UgdGhlIHNhbWUgYnVpbGQKPiBmYWls
dXJlOgo+Cj4gYXJtLWxpbnV4LWdudWVhYmktbGQ6IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ls
LXNpaTg2MjAubzogaW4gZnVuY3Rpb24gYHNpaTg2MjBfcmVtb3ZlJzoKPiBzaWwtc2lpODYyMC5j
OigudGV4dCsweDFiOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGV4dGNvbl91bnJlZ2lzdGVy
X25vdGlmaWVyJwo+IGFybS1saW51eC1nbnVlYWJpLWxkOiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3NpbC1zaWk4NjIwLm86IGluIGZ1bmN0aW9uIGBzaWk4NjIwX3Byb2JlJzoKPiBzaWwtc2lpODYy
MC5jOigudGV4dCsweDI3ZTgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBleHRjb25fZmluZF9l
ZGV2X2J5X25vZGUnCj4gYXJtLWxpbnV4LWdudWVhYmktbGQ6IHNpbC1zaWk4NjIwLmM6KC50ZXh0
KzB4Mjg3MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGV4dGNvbl9yZWdpc3Rlcl9ub3RpZmll
cicKPiBhcm0tbGludXgtZ251ZWFiaS1sZDogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWwtc2lp
ODYyMC5vOiBpbiBmdW5jdGlvbiBgc2lpODYyMF9leHRjb25fd29yayc6Cj4gc2lsLXNpaTg2MjAu
YzooLnRleHQrMHgyOTA4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZXh0Y29uX2dldF9zdGF0
ZScKPgo+IE5vdyB0aGF0IHRoZSBmcmFtZWJ1ZmZlciBjb25maWd1cmF0aW9uIGlzIGNsZWFuZWQg
dXAsIHdlIGNhbiB1c2UgdGhlCj4gdXN1YWwgJ2RlcGVuZHMgb24gRVhUQ09OIHx8ICFFWFRDT04n
IHRyaWNrLgo+Cj4gRml4ZXM6IDdhMTA5NjczODk5YiAoImRybS9icmlkZ2Uvc2lpODYyMDogYWRk
IEtjb25maWcgZGVwZW5kZW5jeSBvbiBleHRjb24iKQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+CgpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIGl0LgoKUmV2
aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2Fy
ZHMKQW5kcnplagoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9LY29uZmlnCj4gaW5kZXggYWFlZDIzNDdhY2U5Li4yOWM4Mzc2MjVmMDMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCj4gQEAgLTkwLDcgKzkwLDcgQEAgY29uZmlnIERSTV9T
SUxfU0lJODYyMAo+ICAJdHJpc3RhdGUgIlNpbGljb24gSW1hZ2UgU0lJODYyMCBIRE1JL01ITCBi
cmlkZ2UiCj4gIAlkZXBlbmRzIG9uIE9GCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKPiAtCWlt
cGx5IEVYVENPTgo+ICsJZGVwZW5kcyBvbiBFWFRDT04gfHwgIUVYVENPTgo+ICAJZGVwZW5kcyBv
biBSQ19DT1JFIHx8ICFSQ19DT1JFCj4gIAloZWxwCj4gIAkgIFNpbGljb24gSW1hZ2UgU0lJODYy
MCBIRE1JL01ITCBicmlkZ2UgY2hpcCBkcml2ZXIuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
