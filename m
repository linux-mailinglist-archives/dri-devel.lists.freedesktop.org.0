Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B4243499
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171086E471;
	Thu, 13 Aug 2020 07:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991576E8B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:12:52 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7EC1DE398E5F144B6222;
 Wed, 12 Aug 2020 15:12:48 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Wed, 12 Aug 2020
 15:12:38 +0800
Subject: Re: [PATCH drm/hisilicon v2 0/3] hibmc clean up and code refactoring
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <kraxel@redhat.com>, <alexander.deucher@amd.com>, <tglx@linutronix.de>,
 <dri-devel@lists.freedesktop.org>, <xinliang.liu@linaro.org>,
 <linux-kernel@vger.kernel.org>
References: <1596415114-21175-1-git-send-email-tiantao6@hisilicon.com>
 <312b8060-f015-35ba-f4f6-ad992aa09aa9@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <8f558a5c-61b6-303a-0c2f-e0f63e9faa10@huawei.com>
Date: Wed, 12 Aug 2020 15:12:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <312b8060-f015-35ba-f4f6-ad992aa09aa9@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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

CgrlnKggMjAyMC84LzEyIDE1OjA0LCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAwMy4wOC4yMCB1bSAwMjozOCBzY2hyaWViIFRpYW4gVGFvOgo+PiBwYXRjaCAjMSBhbmQg
IzMgaXMgY2xlYW4gdXAsIHBhdGNoICMyIGlzIGZvciBjb2RlIHJlZmFjdG9yaW5nCj4gCj4gU29y
cnkgZm9yIGFsbCBteSByZXZpZXdzIHRha2luZyBzbyBsb25nLiBQbGVhc2UgbWVyZ2UgcGF0Y2gg
IzMgaW50bwo+IHBhdGNoICMyIGFuZCB0aGVuIHRoZSBzZXJpZXMgaXMKPiAKdGhhbmtzLEkgd2ls
bCBzZW5kIHYzIHRvIGZpeCB0aGlzLgo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKPiBJIG5vdGljZWQgdGhhdCBoaWJtYyB1c2UgRFJNX0VS
Uk9SIGluIHNldmVyYWwgcGxhY2VzLiBBIGdvb2QgZm9sbG93LXVwCj4gcGF0Y2hzZXQgd291bGQg
YmUgdGhlIGNvbnZlcnNpb24gdG8gZHJtX2luZm8vZHJtX3dhcm4vZHJtX2Vycm9yL2V0Yy4KPiAK
SSB3aWxsIHNlbmQgYW5vdGhlciBwYXRjaHNldCB0byBmaXggdGhpcy4KPiBCZXN0IHJlZ2FyZHMK
PiBUaG9tYXMKPiAKPj4KPj4gQ2hhbmdlcyBzaW5jZSB2MToKPj4gLSBSZXdyaXRlIHRoZSBjb21t
aXRzIG1lc3NhZ2VzIGFuZCBwYXRjaCBuYW1lIGluICMxCj4+IC0gUmV3cml0ZSB0aGUgY29tbWl0
cyBtZXNzYWdlIGluICMyLgo+PiAtIEFkZCB0aGUgbmV3IHBhdGNoICMzCj4+Cj4+IFRpYW4gVGFv
ICgzKToKPj4gICAgZHJtL2hpc2lsaWNvbjogUmVtb3ZlIHRoZSB1bnVzZWQgaW5jbHVkZSBzdGF0
ZW1lbnRzCj4+ICAgIGRybS9oaXNpbGljb246IENvZGUgcmVmYWN0b3JpbmcgZm9yIGhpYm1jX2Ry
dl9kZQo+PiAgICBkcm0vaGlzaWxpY29uOiBSZW5hbWUgdmFyaWFibGVzIHRvIHJlcHJlc2VudCB0
aGUgY29ycmVjdCBtZWFuaW5nCj4+Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJt
Yy9oaWJtY19kcm1fZGUuYyAgIHwgNTggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAgZHJp
dmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fZHJ2LmMgIHwgIDUgLS0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2hpYm1jL2hpYm1jX2RybV9kcnYuaCAgfCAgMiAr
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9oaWJtYy9oaWJtY19kcm1fdmRhYy5jIHwg
IDIgLQo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25z
KC0pCj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
