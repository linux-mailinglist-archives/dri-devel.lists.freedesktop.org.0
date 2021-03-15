Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DA33ACF8
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 09:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4006D899BC;
	Mon, 15 Mar 2021 08:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B0689CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 06:43:37 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzRfH4Pg9z8xlQ;
 Mon, 15 Mar 2021 14:41:43 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Mon, 15 Mar 2021
 14:43:27 +0800
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To: Inki Dae <inki.dae@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <krzk@kernel.org>
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
 <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <bb8f7bae-6621-b149-b41e-363b34bd2428@huawei.com>
Date: Mon, 15 Mar 2021 14:43:27 +0800
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
ZHJvcCBvbmx5IG9mX2dwaW8uaCBpbmNsdXNpb24/ClRoYW5rcyBmb3IgaGVscGluZyB0byByZXZp
ZXcgcGF0Y2gsIElmIHlvdSBjYW4gZ2l2ZSBtZSByZXZpZXctYnksIEkgY2FuIApoZWxwIHB1c2gg
dG8gZHJtLW1pc2MuCj4gVGhhbmtzLAo+IElua2kgRGFlCj4KPj4gU2lnbmVkLW9mZi1ieTogVGlh
biBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zNTQzM19kcm1fZGVjb24uYwo+PiBpbmRleCAxZjc5YmMyLi45ZmM1MWE2
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vczU0MzNfZHJtX2Rl
Y29uLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3M1NDMzX2RybV9kZWNv
bi5jCj4+IEBAIC0xMSw5ICsxMSw5IEBACj4+ICAgI2luY2x1ZGUgPGxpbnV4L2NvbXBvbmVudC5o
Pgo+PiAgICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvaXJx
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgo+PiAgICNpbmNsdWRlIDxs
aW51eC9tZmQvc3lzY29uLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+PiAt
I2luY2x1ZGUgPGxpbnV4L29mX2dwaW8uaD4KPj4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KPj4gICAjaW5jbHVk
ZSA8bGludXgvcmVnbWFwLmg+Cj4+Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
