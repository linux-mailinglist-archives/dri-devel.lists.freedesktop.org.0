Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1212A2BCC
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C436EB7E;
	Mon,  2 Nov 2020 13:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144E6E4CB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:32:33 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPskK2kPRzkdkY;
 Mon,  2 Nov 2020 20:32:25 +0800 (CST)
Received: from [127.0.0.1] (10.57.60.129) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 20:32:18 +0800
Subject: Re: [PATCH] drm/irq: Add irq as false detection
To: Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao
 <tiantao6@hisilicon.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <1604315990-56787-1-git-send-email-tiantao6@hisilicon.com>
 <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
From: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <d67b75bd-205b-262b-db07-36497c941731@huawei.com>
Date: Mon, 2 Nov 2020 20:32:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8a76d144-f8ba-bbbc-9177-53088f6dc73a@suse.de>
X-Originating-IP: [10.57.60.129]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgrlnKggMjAyMC8xMS8yIDIwOjA5LCBUaG9tYXMgWmltbWVybWFubiDlhpnpgZM6Cj4gSGkKPiAK
PiBBbSAwMi4xMS4yMCB1bSAxMjoxOSBzY2hyaWViIFRpYW4gVGFvOgo+PiBBZGQgdGhlIGRldGVj
dGlvbiBvZiBmYWxzZSBmb3IgaXJxLCBzbyB0aGF0IHRoZSBFSU5WQUwgaXMgbm90Cj4+IHJldHVy
bmVkIHdoZW4gZGV2LT5pcnFfZW5hYmxlZCBpcyBmYWxzZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
VGlhbiBUYW8gPHRpYW50YW82QGhpc2lsaWNvbi5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1faXJxLmMgfCAzICsrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2lycS5jCj4+IGluZGV4IDA5ZDZlOWUuLjc1MzdhM2QgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9pcnEuYwo+PiBAQCAtMTcyLDYgKzE3Miw5IEBAIGludCBkcm1faXJxX3VuaW5zdGFsbChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+PiAgIAlib29sIGlycV9lbmFibGVkOwo+PiAgIAlpbnQgaTsK
Pj4gICAKPj4gKwlpZiAoIWRldi0+aXJxX2VuYWJsZWQgfHwgIWRldikKPj4gKwkJcmV0dXJuIDA7
Cj4+ICsKPiAKPiBEZXJlZmVyZW5jaW5nIGEgcG9pbnRlciBiZWZvcmUgTlVMTC1jaGVja2luZyBp
dCwgaXMgWW9kYSBwcm9ncmFtbWluZy4gOikKPiBJJ2QganVzdCBkcm9wIHRoZSB0ZXN0IGZvciAh
ZGV2IGFuZCBhc3N1bWUgdGhhdCBkZXYgaXMgYWx3YXlzIHZhbGlkLgo+IAo+IEkgc3VnZ2VzdCB0
byBjaGFuZ2UgdGhlIGludCByZXR1cm4gdmFsdWUgdG8gdm9pZCBhbmQgcmV0dXJuIG5vdGhpbmcu
Cj4gCj4gUmUtcmVhZGluZyB0aGUgYWN0dWFsIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgZnVuY3Rp
b24sIHRoaXMgbG9jYXRpb24KPiBtaWdodCBiZSB0b28gZWFybHkuIEZ1cnRoZXIgYmVsb3cgdGhl
cmUgYWxyZWFkeSBpcyBhIHRlc3QgZm9yCj4gaXJxX2VuYWJsZWQuIFB1dCBhIGRybV9XQVJOX09O
IGFyb3VuZCBpdCBhbmQgaXQgc2hvdWxkIGJlIGZpbmUuIFRoaXMgd2F5Cj4gdGhlIHZibGFuayBo
YW5kbGVycyB3aWxsIGJlIGRpc2FibGVkIGFuZCBlcnJvbmVvdXMgY2FsbGVycyB3aWxsIHNlZSBh
Cj4gd2FybmluZyBpbiB0aGUga2VybmVsJ3MgbG9nLgo+IAp0aGFuayB5b3XvvIxJIHdpbGwgc2Vu
ZCBhIG5ldyBwYXRjaCB0byBmaXggdGhhdC4KPiBCZXN0IHJlZ2FyZHMKPiBUaG9tYXMKPiAKPj4g
ICAJaXJxX2VuYWJsZWQgPSBkZXYtPmlycV9lbmFibGVkOwo+PiAgIAlkZXYtPmlycV9lbmFibGVk
ID0gZmFsc2U7Cj4+ICAgCj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
