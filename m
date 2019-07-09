Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B4637F4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73AE6E064;
	Tue,  9 Jul 2019 14:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB736E064
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:32:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190709143228euoutp0244a5710e3063452501473295984c61c9~vw64M6Wus2293322933euoutp02B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 14:32:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190709143228euoutp0244a5710e3063452501473295984c61c9~vw64M6Wus2293322933euoutp02B
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190709143227eucas1p23f375b06316f977b4d791f8fb8f33cf6~vw63heuVr2183121831eucas1p2l;
 Tue,  9 Jul 2019 14:32:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E4.8A.04298.A75A42D5; Tue,  9
 Jul 2019 15:32:27 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190709143226eucas1p1276d65747330a5bc3a0c22f173e803a0~vw621Q2VD2340823408eucas1p1q;
 Tue,  9 Jul 2019 14:32:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190709143226eusmtrp2039f688e033411e4e498d022dd07d703~vw62nNO7C0884008840eusmtrp2k;
 Tue,  9 Jul 2019 14:32:26 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-40-5d24a57a4021
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 70.A9.04146.A75A42D5; Tue,  9
 Jul 2019 15:32:26 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190709143225eusmtip2b2d9e0f3467e81769d2039b3fcf63701~vw62Mfu5-0230802308eusmtip2c;
 Tue,  9 Jul 2019 14:32:25 +0000 (GMT)
Subject: Re: [PATCH 06/60] drm/bridge: simple-bridge: Add support for enable
 GPIO
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <8d9b9bdb-c3e5-bbb8-b3c5-075b5f638202@samsung.com>
Date: Tue, 9 Jul 2019 16:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190707181937.6250-3-laurent.pinchart@ideasonboard.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0iTYRjt3bfL52j2OjWfdFCt/cjCGwguFFG6+P0QMZKK1Gzmx5Tm1E1X
 JpjhBS9YqZU6RSdpmmSaOi8rjWY6JEytKB3IJvgjTcsuBgppm98k/7wczjnPc54DL0kIX3I8
 yRRlJq1SyhRiLp/dN7Y+6ZPTIon37x5G0q2+CkL6ce07V1pS0cyTNv3Qs6XWxVdIOlf1xvZ8
 jZJ2Npq5YSTV8DSHGphrRtTQHx2bqiuu5VAN42cpS5mJRZkMZh5lmulnRZOX+CFJtCJFQ6v8
 Qq/wk2+/mCbSS9xvFG684+ahcpdS5EQCDoSNkYecUsQnhbgNwae5Ep5dEOLfCDrqgxnhF4LR
 byusnYma1xUsxtSK4NFdkjGtINBaazl2wRWfg8cFFrYdu+FYMHQNbUcQuJAFFdrFbRMXe8Pf
 nlmuHQtwKEzO3iHsmI0l0FpuRnbsjs/Duq7E4XGB8dqF7aVO+IyN127zBD4I+fo6gsEeYF5o
 ZNnDAI/xYGCeCQB8CiqXmOsAu8KSqZfHYBFsDTY6qt0CS1sBwQwXI9B3DRKMEAwjpmnbMGlL
 8IZOgx9Dh8Ps1H3CTgN2hpkVF+YGZ6jsq3bQAiguEjLuw2CZ0DsWekDL1Br3HhJrdzXT7mqj
 3dVG+z9Xh9jtyIPOUqfKaXWAkr7uq5alqrOUct+raandyPan3m6afg6gtfeJRoRJJN4rgAJJ
 vJAj06izU40ISELsJhiOOBIvFCTJsm/SqrQEVZaCVhuRF8kWewhy9lhjhVguy6Sv0XQ6rdpR
 WaSTZx7yT3Tff2D+wYmI9dy0Qw0+VEfTmHywl0yYy0w2EkW50iAsCbxwOW7VWoUVGe1bOTU9
 MaJN0b7IhSXDcy99RnB9UMxgIbTy40I2lpMnWqIu8jVhU+6R4TUtMSLds9XqJzOzAaNK/8NU
 /ofPPl9OInS8f/60omypvVdzlBW93CRmq5NlAccIlVr2Dw2TLOdPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xe7pVS1ViDRa85bf4v20is8WVr+/Z
 LDonLmG3WPhxK4vFg5f7GS3uTj4CJF77Wayff4vNgcNj3ppqjx13lzB67P22gMVjdsdMVo95
 JwM97ncfZ/I4vusWu8fxG9uZAjii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62M
 TJX07WxSUnMyy1KL9O0S9DIad19kLugUrWj9dY6tgbFXsIuRk0NCwERixsGJTF2MXBxCAksZ
 JRpmfmSBSIhL7J7/lhnCFpb4c62LDaLoNaPE97vzGUESwgLBEsta7oM1iAhES5w5dBisgVmg
 nUmica0BRMNEJokrc5aCJdgENCX+br7JBmLzCthJnL/ZBxZnEVCRWN57C2goB4eoQJjE0RN5
 ECWCEidnPgGbzyngJvFzwSw2iPnqEn/mXYLaJS/RvHU2lC0ucevJfKYJjEKzkLTPQtIyC0nL
 LCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG5rZjPzfvYLy0MfgQowAHoxIPr0SL
 SqwQa2JZcWXuIUYJDmYlEd597sqxQrwpiZVVqUX58UWlOanFhxhNgX6byCwlmpwPTBp5JfGG
 pobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoYLXWOrAk8dTPx5XNeyZbf
 MUZ38xYK7fGoicn05Nd+n/2yPuLmKZ/TScxacr5xjWFTJ9yNv5a94sdCoT+lNRO3Jl9sLYm9
 kvtW+E3got2ZMqd+sfPMv6uSFfNxR8mGtNltXsVal5nbzB4vydI9pOL78/6Dwug5q/ucDae2
 lcb3WziFLOq9MmemEktxRqKhFnNRcSIAuYN5ZeICAAA=
X-CMS-MailID: 20190709143226eucas1p1276d65747330a5bc3a0c22f173e803a0
X-Msg-Generator: CA
X-RootMTR: 20190707182139epcas2p468afe9203ac8a8f4c77a0ebcd8aa9de1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190707182139epcas2p468afe9203ac8a8f4c77a0ebcd8aa9de1
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <CGME20190707182139epcas2p468afe9203ac8a8f4c77a0ebcd8aa9de1@epcas2p4.samsung.com>
 <20190707181937.6250-3-laurent.pinchart@ideasonboard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1562682748;
 bh=jY6UGck4w3nMdqDcbDL5HqpqcGbng5FbWd/iGfHK+Oc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qgKHpn9UyRF919G0FbSAEd69IIQ/yy1h8RODV5OSTUg1JmKvRne3DiCUoTkU5VNPx
 bzLkZ47l0m6uISrK2EfwHsEj/M3/cZ8SeZcnsmBplMLbKo3oXIJ5B9tse5gnl/pqiG
 g7jVRheLM7PG7vILUW/ZYQBEpYAxhTmkt1gcSOm8=
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
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcuMDcuMjAxOSAyMDoxOCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiBJZiBhbiBlbmFi
bGUgR1BJTyBpcyBkZWNsYXJlZCBpbiB0aGUgZmlybXdhcmUsIGFzc2VydCBpdCB3aGVuIGVuYWJs
aW5nCj4gdGhlIGJyaWRnZSBhbmQgZGVhc3NlcnQgaXQgd2hlbiBkaXNhYmxpbmcgaXQuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+CgoKSG1tLCBzaW1wbGUgYmVjb21lcyBsZXNzIHNpbXBsZS4gSSBndWVzcyB3ZSB3
aWxsIGVuZC11cCB3aXRoIHN0aCBzaW1pbGFyCnRvIHBhbmVsLXNpbXBsZS4gQW5kIHRoZW4gd2Ug
Y2FuIG1lcmdlIGJvdGggOikKCgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBz
YW1zdW5nLmNvbT4KCsKgLS0KUmVnYXJkcwpBbmRyemVqCgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMgfCAyMiArKysrKysrKysrKysrKysrKystLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9zaW1wbGUtYnJpZGdlLmMKPiBpbmRleCBiZmYyNDBjZjI4M2QuLmE3
ZWRmM2MzOTYyNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpbXBsZS1i
cmlkZ2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2ltcGxlLWJyaWRnZS5jCj4g
QEAgLTYsNiArNiw3IEBACj4gICAqIE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAZnJlZS1l
bGVjdHJvbnMuY29tPgo+ICAgKi8KPiAgCj4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L29mX2Rl
dmljZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KPiBAQCAtMjksNiArMzAsNyBA
QCBzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSB7Cj4gIAo+ICAJc3RydWN0IGkyY19hZGFwdGVyCSpkZGM7
Cj4gIAlzdHJ1Y3QgcmVndWxhdG9yCSp2ZGQ7Cj4gKwlzdHJ1Y3QgZ3Bpb19kZXNjCSplbmFibGU7
Cj4gIH07Cj4gIAo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBzaW1wbGVfYnJpZGdlICoKPiBAQCAt
MTM1LDE5ICsxMzcsMjMgQEAgc3RhdGljIGludCBzaW1wbGVfYnJpZGdlX2F0dGFjaChzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICBzdGF0aWMgdm9pZCBzaW1wbGVfYnJpZGdlX2VuYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICB7Cj4gIAlzdHJ1Y3Qgc2ltcGxlX2JyaWRnZSAq
c2JyaWRnZSA9IGRybV9icmlkZ2VfdG9fc2ltcGxlX2JyaWRnZShicmlkZ2UpOwo+IC0JaW50IHJl
dCA9IDA7Cj4gKwlpbnQgcmV0Owo+ICAKPiAtCWlmIChzYnJpZGdlLT52ZGQpCj4gKwlpZiAoc2Jy
aWRnZS0+dmRkKSB7Cj4gIAkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShzYnJpZGdlLT52ZGQpOwo+
ICsJCWlmIChyZXQpCj4gKwkJCURSTV9FUlJPUigiRmFpbGVkIHRvIGVuYWJsZSB2ZGQgcmVndWxh
dG9yOiAlZFxuIiwgcmV0KTsKPiArCX0KPiAgCj4gLQlpZiAocmV0KQo+IC0JCURSTV9FUlJPUigi
RmFpbGVkIHRvIGVuYWJsZSB2ZGQgcmVndWxhdG9yOiAlZFxuIiwgcmV0KTsKPiArCWdwaW9kX3Nl
dF92YWx1ZV9jYW5zbGVlcChzYnJpZGdlLT5lbmFibGUsIDEpOwo+ICB9Cj4gIAo+ICBzdGF0aWMg
dm9pZCBzaW1wbGVfYnJpZGdlX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAg
ewo+ICAJc3RydWN0IHNpbXBsZV9icmlkZ2UgKnNicmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3NpbXBs
ZV9icmlkZ2UoYnJpZGdlKTsKPiAgCj4gKwlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoc2JyaWRn
ZS0+ZW5hYmxlLCAwKTsKPiArCj4gIAlpZiAoc2JyaWRnZS0+dmRkKQo+ICAJCXJlZ3VsYXRvcl9k
aXNhYmxlKHNicmlkZ2UtPnZkZCk7Cj4gIH0KPiBAQCAtMjAwLDYgKzIwNiwxNCBAQCBzdGF0aWMg
aW50IHNpbXBsZV9icmlkZ2VfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAg
CQlkZXZfZGJnKCZwZGV2LT5kZXYsICJObyB2ZGQgcmVndWxhdG9yIGZvdW5kOiAlZFxuIiwgcmV0
KTsKPiAgCX0KPiAgCj4gKwlzYnJpZGdlLT5lbmFibGUgPSBkZXZtX2dwaW9kX2dldF9vcHRpb25h
bCgmcGRldi0+ZGV2LCAiZW5hYmxlIiwKPiArCQkJCQkJICBHUElPRF9PVVRfTE9XKTsKPiArCWlm
IChJU19FUlIoc2JyaWRnZS0+ZW5hYmxlKSkgewo+ICsJCWlmIChQVFJfRVJSKHNicmlkZ2UtPmVu
YWJsZSkgIT0gLUVQUk9CRV9ERUZFUikKPiArCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiVW5hYmxl
IHRvIHJldHJpZXZlIGVuYWJsZSBHUElPXG4iKTsKPiArCQlyZXR1cm4gUFRSX0VSUihzYnJpZGdl
LT5lbmFibGUpOwo+ICsJfQo+ICsKPiAgCXNicmlkZ2UtPmRkYyA9IHNpbXBsZV9icmlkZ2VfcmV0
cmlldmVfZGRjKCZwZGV2LT5kZXYpOwo+ICAJaWYgKElTX0VSUihzYnJpZGdlLT5kZGMpKSB7Cj4g
IAkJaWYgKFBUUl9FUlIoc2JyaWRnZS0+ZGRjKSA9PSAtRU5PREVWKSB7CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
