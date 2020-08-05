Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50423D78F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A976E88B;
	Thu,  6 Aug 2020 07:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2D89C82
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:03:20 +0000 (UTC)
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id 46CF7485;
 Wed,  5 Aug 2020 18:03:17 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12032T139957011113728S1596621795960706_; 
 Wed, 05 Aug 2020 18:03:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <58f15e56412951c2acfe8d69cef47c2a>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm: sysfs: Add to get current mode
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200805083646.4123-1-hjc@rock-chips.com>
 <CAKMK7uGmKJqZJ0ONQjjquZn6mksKbkScmcUSEA43eg1jFskmTg@mail.gmail.com>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <693f6555-d9d2-f255-1198-e3798c8f4fe8@rock-chips.com>
Date: Wed, 5 Aug 2020 18:03:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGmKJqZJ0ONQjjquZn6mksKbkScmcUSEA43eg1jFskmTg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Tao Huang <huangtao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Kever Yang <kever.yang@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsCgrlnKggMjAyMC84LzUgMTc6MzYsIERhbmllbCBWZXR0ZXIg5YaZ6YGTOgo+IE9u
IFdlZCwgQXVnIDUsIDIwMjAgYXQgMTA6MzcgQU0gU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBz
LmNvbT4gd3JvdGU6Cj4+IGFkZCB0aGlzIG5vZGUgdG8gZ2V0IHRoZSBjdXJyZW50IHRydWUgbW9k
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2FuZHkgSHVhbmcgPGhqY0Byb2NrLWNoaXBzLmNvbT4K
PiBVaCB3aGF0J3MgdGhpcyBmb3I/IFNpbmNlIGl0J3Mgc3lzZnMsIEkgZ3Vlc3MgdGhlcmUncyBz
b21ldGhpbmcKPiBwYXJzaW5nIHRoaXMsIHdoaWNoIG1lYW5zIHdlJ2Qga2luZGEgbmVlZCB0byBo
YXZlIHRoYXQgcGllY2UgdG9vLgo+Cj4gSWYgaXQncyBqdXN0IGZvciBkZWJ1Z2dpbmcgcHVycG9z
ZXMsIHRoZW4gd2UgYWxyZWFkeSBoYXZlIHRoaXMKPiBpbmZvcm1hdGlvbiBpbiBkZWJ1Z2ZzLCB0
b2dldGhlciB3aXRoIGV2ZXJ5dGhpbmcgZWxzZSB0aGF0J3MgaW4gdGhlCj4gYXRvbWljIG1vZGVz
ZXQgc3RhdGUuCj4gLURhbmllbAoKeWVzLCB0aGlzIGlzIGp1c3QgZm9yIGRlYnVnOwoKYW5kIGkg
Z2V0IHRoZSBpbmZvcm1hdGlvbiB3aGF0IGkgbmVlZCBmcm9tIGNhdCAKL3N5cy9rZXJuZWwvZGVi
dWcvZHJpLzAvc3RhdGUsIHRoYW5rcy4KCj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
c3lzZnMuYyB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3N5c2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPj4gaW5kZXggOTM5
ZjAwMzJhYWIxLi5mMzliY2QzNDg1M2IgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fc3lzZnMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5c2ZzLmMKPj4gQEAgLTE5
LDYgKzE5LDcgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+Pgo+PiAgICNpbmNsdWRl
IDxkcm0vZHJtX2Nvbm5lY3Rvci5oPgo+PiArI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+PiAg
ICNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+PiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUu
aD4KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlcy5oPgo+PiBAQCAtMjM2LDE2ICsyMzcsNDUg
QEAgc3RhdGljIHNzaXplX3QgbW9kZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCj4+ICAg
ICAgICAgIHJldHVybiB3cml0dGVuOwo+PiAgIH0KPj4KPj4gK3N0YXRpYyBzc2l6ZV90IGN1cnJl
bnRfbW9kZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldmljZSwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgY2hhciAqYnVmKQo+PiArewo+PiArICAgICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IgPSB0b19kcm1fY29ubmVjdG9yKGRldmljZSk7Cj4+ICsgICAgICAgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGU7Cj4+ICsgICAgICAgc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlOwo+PiArICAgICAgIGJvb2wgaW50ZXJsYWNlZDsKPj4gKyAgICAgICBpbnQgd3JpdHRl
biA9IDA7Cj4+ICsKPj4gKyAgICAgICBpZiAoIWNvbm5lY3Rvci0+c3RhdGUgfHwgIWNvbm5lY3Rv
ci0+c3RhdGUtPmNydGMpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gd3JpdHRlbjsKPj4gKwo+
PiArICAgICAgIGNydGNfc3RhdGUgPSBjb25uZWN0b3ItPnN0YXRlLT5jcnRjLT5zdGF0ZTsKPj4g
KyAgICAgICBpZiAoIWNydGNfc3RhdGUpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gd3JpdHRl
bjsKPj4gKwo+PiArICAgICAgIG1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsKPj4gKwo+PiArICAg
ICAgIGludGVybGFjZWQgPSAhIShtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNF
KTsKPj4gKyAgICAgICB3cml0dGVuICs9IHNucHJpbnRmKGJ1ZiArIHdyaXR0ZW4sIFBBR0VfU0la
RSAtIHdyaXR0ZW4sICIlZHglZCVzJWRcbiIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBtb2RlLT5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXksCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnRlcmxhY2VkID8gImkiIDogInAiLCBkcm1fbW9kZV92cmVmcmVzaChtb2RlKSk7
Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gd3JpdHRlbjsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBE
RVZJQ0VfQVRUUl9SVyhzdGF0dXMpOwo+PiAgIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhlbmFibGVk
KTsKPj4gICBzdGF0aWMgREVWSUNFX0FUVFJfUk8oZHBtcyk7Cj4+ICAgc3RhdGljIERFVklDRV9B
VFRSX1JPKG1vZGVzKTsKPj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhjdXJyZW50X21vZGUpOwo+
Pgo+PiAgIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpjb25uZWN0b3JfZGV2X2F0dHJzW10gPSB7
Cj4+ICAgICAgICAgICZkZXZfYXR0cl9zdGF0dXMuYXR0ciwKPj4gICAgICAgICAgJmRldl9hdHRy
X2VuYWJsZWQuYXR0ciwKPj4gICAgICAgICAgJmRldl9hdHRyX2RwbXMuYXR0ciwKPj4gICAgICAg
ICAgJmRldl9hdHRyX21vZGVzLmF0dHIsCj4+ICsgICAgICAgJmRldl9hdHRyX2N1cnJlbnRfbW9k
ZS5hdHRyLAo+PiAgICAgICAgICBOVUxMCj4+ICAgfTsKPj4KPj4gLS0KPj4gMi4xNy4xCj4+Cj4+
Cj4+Cj4KLS0gCkJlc3QgUmVnYXJkCgrpu4TlrrbpkpcKU2FuZHkgSHVhbmcKQWRkcjog56aP5bee
5biC6byT5qW85Yy66ZOc55uY6Lev6L2v5Lu25aSn6YGTODnlj7fnpo/lt57ova/ku7blm61B5Yy6
MjHlj7fmpbwoMzUwMDAzKQogICAgICAgTm8uIDIxIEJ1aWxkaW5nLCBBIERpc3RyaWN0LCBOby44
OSxzb2Z0d2FyZSBCb3VsZXZhcmQgRnV6aG91LEZ1amlhbixQUkMKVGVs77yaKzg2IDA1OTEtODc4
ODQ5MTkgIDg2OTAKRS1tYWls77yaaGpjQHJvY2stY2hpcHMuY29tCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
