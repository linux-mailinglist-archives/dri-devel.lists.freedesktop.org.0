Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB627A818
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427806E2D1;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550D86EC45
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:49:00 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 845AF1FACC9B85756694;
 Fri, 25 Sep 2020 15:48:58 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 15:48:50 +0800
Subject: Re: [PATCH] drm/hisilicon: Deleted the drm_device declaration
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1601016580-5937-1-git-send-email-tiantao6@hisilicon.com>
 <5db712e8-d6cb-3de9-f48e-c2060442e4e0@suse.de>
 <50c87a77-ffdd-42d2-0747-69c95305a48f@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <d9243413-ae13-7eee-933a-13441ec4c151@huawei.com>
Date: Fri, 25 Sep 2020 15:48:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <50c87a77-ffdd-42d2-0747-69c95305a48f@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC85LzI1IDE1OjI2LCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAyNS4wOS4yMCB1bSAwOTowMiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+PiBIaSwK
Pj4KPj4ganVzdCBhIGZldyBuaXRzLgo+Pgo+PiBBbSAyNS4wOS4yMCB1bSAwODo0OSBzY2hyaWVi
IFRpYW4gVGFvOgo+Pj4gZHJtX2ZyYW1lYnVmZmVyLmggY29udGFpbnMgZHJtL2RybV9kZXZpY2Uu
aCBhbmQgc3RydWN0IGRybV9kZXZpY2UgaXMKPj4KPj4gY29udGFpbnMgLT4gaW5jbHVkZXMKPj4K
Pj4+IGFscmVhZHkgZGVjbGFyZWQgaW4gdGhpcyBmaWxlLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRv
IGRlY2xhcmUgc3RydWN0Cj4+Cj4+IGRlY2xhcmVkIC0+IGRlZmluZWQKPiAKPiBXYWl0IGEgc2Vj
b25kLiBkcm1fZnJhbWVidWZmZXIuaCBhY3R1YWxseSBkZWNsYXJlcyBzdHJ1Y3QgZHJtX2Rldmlj
ZSwKPiBidXQgZG9lcyBub3QgaW5jbHVkZSA8ZHJtL2RldmljZS5oPi4gU28gdGhlIGNvbW1pdCBt
ZXNzYWcgc2hvdWxkIHNheQo+IHNvbWV0aGluZyBsaWtlCj4gCj4gICAgZHJtX2ZyYW1lYnVmZmVy
LmggYWxyZWFkeSBkZWNsYXJlcyBzdHJ1Y3QgZHJtX2RldmljZSwgc28gdGhlcmUncyBubwo+IG5l
ZWQgdG8gZGVjbGFyZSBpdCBpbiBoaWJtX2RybV9kcnYuaAo+IApUaGFuayB5b3UgdmVyeSBtdWNo
Lkkgd2lsbCBhcHBseSB0aGlzLgo+Pgo+Pj4gZHJtX2RldmljZSBpbiBoaWJtX2RybV9kcnYuaC4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlzaWxpY29uLmNvbT4K
Pj4KPj4gQWNrZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+
Pgo+Pj4gLS0tCj4+PiAgIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJt
X2Rydi5oIHwgMiAtLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1f
ZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuaAo+
Pj4gaW5kZXggODdkMmFhZC4uNmE2MzUwMiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24vaGlibWMvaGlibWNfZHJtX2Rydi5oCj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuaAo+Pj4gQEAgLTIyLDggKzIyLDYgQEAK
Pj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+Cj4+PiAgICNpbmNsdWRlIDxkcm0v
ZHJtX2ZyYW1lYnVmZmVyLmg+Cj4+PiAgIAo+Pj4gLXN0cnVjdCBkcm1fZGV2aWNlOwo+Pj4gLQo+
Pj4gICBzdHJ1Y3QgaGlibWNfY29ubmVjdG9yIHsKPj4+ICAgCXN0cnVjdCBkcm1fY29ubmVjdG9y
IGJhc2U7Cj4+PiAgIAo+Pj4KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
