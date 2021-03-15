Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448E933ACF9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 09:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8084889BB0;
	Mon, 15 Mar 2021 08:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359EE89CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 06:45:13 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzRh76trGz8x2B;
 Mon, 15 Mar 2021 14:43:19 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Mon, 15 Mar 2021
 14:45:02 +0800
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To: Inki Dae <inki.dae@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <krzk@kernel.org>
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
 <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
Date: Mon, 15 Mar 2021 14:45:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:03:58 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CuWcqCAyMDIxLzMvMTUgMTQ6MzUsIElua2kgRGFlIOWGmemBkzoKPiBIaSBUaWFuIFRhbywKPgo+
IDIxLiAzLiAyLiDsmKTtm4QgMTI6MDPsl5AgVGlhbiBUYW8g7J20KOqwgCkg7JO0IOq4gDoKPj4g
cmVtb3ZlIHRoZSBsZWdhY3kgR1BJTyBoZWFkZXJzIDxsaW51eC9vZl9ncGlvLmg+IGJ1dCB3aGF0
IGl0IHJlYWxseQo+PiB1c2VzIGlzIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+IHNpbmNlIG9ubHkg
Z3Bpb19kZXNjIHN0cnVjdHMgYXJlIGV2ZXIKPj4gcmVmZXJlbmNlZC4KPiBUaGlzIGRyaXZlciBk
b2Vzbid0IHJlZmVyZW5jZSBldmVuIGxpbnV4L2dwaW8vY29uc3VtZXIuaCBzbyBjb3VsZCB5b3Ug
ZHJvcCBvbmx5IG9mX2dwaW8uaCBpbmNsdXNpb24/CgpUaGFua3MgZm9yIGhlbHBpbmcgdG8gcmV2
aWV3IHBhdGNoLEkndmUgcG9zdGVkIGEgbmV3IHBhdGNoIHRvIGZpeCB0aGlzIApwcm9ibGVtwqAg
SWYgeW91IGNhbiBnaXZlIG1lIHJldmlldy1ieSwgSSBjYW4gaGVscCBwdXNoIHRvIGRybS1taXNj
LgoKU3ViamVjdDogW1BBVENIXSBkcm0vZXh5bm9zL2RlY29uNTQzMzogUmVtb3ZlIHRoZSB1bnVz
ZWQgaW5jbHVkZSBzdGF0ZW1lbnRzCgpUaGlzIGRyaXZlciBkb2Vzbid0IHJlZmVyZW5jZSBvZl9n
cGlvLmgsIHNvIGRyb3AgaXQuCgpTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlz
aWxpY29uLmNvbT4KLS0tCiDCoGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1f
ZGVjb24uYyB8IDEgLQogwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyAKYi9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKaW5kZXggMWY3OWJjMi4u
MTUxMGU0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2Ry
bV9kZWNvbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVj
b24uYwpAQCAtMTMsNyArMTMsNiBAQAogwqAjaW5jbHVkZSA8bGludXgvaXJxLmg+CiDCoCNpbmNs
dWRlIDxsaW51eC9tZmQvc3lzY29uLmg+CiDCoCNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
LSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CiDCoCNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KIMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KIMKgI2luY2x1ZGUgPGxp
bnV4L3JlZ21hcC5oPgoKPgo+IFRoYW5rcywKPiBJbmtpIERhZQo+Cj4+IFNpZ25lZC1vZmYtYnk6
IFRpYW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgfCAyICstCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2RlY29uLmMKPj4gaW5kZXggMWY3OWJjMi4uOWZj
NTFhNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2Ry
bV9kZWNvbi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1f
ZGVjb24uYwo+PiBAQCAtMTEsOSArMTEsOSBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9jb21wb25l
bnQuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4
L2lycS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KPj4gICAjaW5jbHVk
ZSA8bGludXgvbWZkL3N5c2Nvbi5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
Pj4gLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+Pgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
