Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDB3325D99
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 07:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1A46E8F2;
	Fri, 26 Feb 2021 06:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 102010 seconds by postgrey-1.36 at gabe;
 Fri, 26 Feb 2021 06:37:58 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18C86E8F2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 06:37:58 +0000 (UTC)
Received: from localhost (unknown [192.168.167.235])
 by regular1.263xmail.com (Postfix) with ESMTP id 95F8F777;
 Fri, 26 Feb 2021 14:37:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.76] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P19731T140185115293440S1614321473188104_; 
 Fri, 26 Feb 2021 14:37:53 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <5a105a916e8deb098b3f54bc85a97a5b>
X-RL-SENDER: hjc@rock-chips.com
X-SENDER: hjc@rock-chips.com
X-LOGIN-NAME: hjc@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Subject: Re: [PATCH] drm/rockchip: Require the YTR modifier for AFBC
To: Daniel Stone <daniel@fooishbar.org>
References: <20200811202631.3603-1-alyssa.rosenzweig@collabora.com>
 <CAPj87rMS5zxY6sK4N8zVZF9MHThmURj6kuso=G5+MQDVmNjC4Q@mail.gmail.com>
 <d17ea299-b21e-b298-9098-f47b780be106@rock-chips.com>
 <CAPj87rMBt9bJhPcyX--xa_wMse9JCttHCfz1PkFXFwHcRheuJg@mail.gmail.com>
From: Huang Jiachai <hjc@rock-chips.com>
Message-ID: <a7db35ea-b4c8-caf1-dfdf-0195a5d6590e@rock-chips.com>
Date: Fri, 26 Feb 2021 14:37:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPj87rMBt9bJhPcyX--xa_wMse9JCttHCfz1PkFXFwHcRheuJg@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoK5ZyoIDIwMjEvMi8yNSAyMDo0NiwgRGFuaWVsIFN0b25lIOWGmemBkzoKPiBI
aSBTYW5keSwKPgo+IE9uIFRodSwgMjUgRmViIDIwMjEgYXQgMDI6MTcsIEh1YW5nIEppYWNoYWkg
PGhqY0Byb2NrLWNoaXBzLmNvbT4gd3JvdGU6Cj4+ICAgICAgIFJLMzM5OSBhbmQgcHgzMCBjYW4g
c3VwcG9ydCBZVFIgYWZiYyBmb3JtYXRbUkdCIG9ubHldLCB0aGVyZSBpcyBhbgo+PiBoaWRkZW4g
Y29udHJvbCBiaXQgdG8gY29udHJvbCB0aGlzLgo+IEdyZWF0LCB0aGFua3MgZm9yIHByb3ZpZGlu
ZyB0aGlzIGluZm9ybWF0aW9uIQo+Cj4+IEhpIEFseXNzYSwKPj4KPj4gICAgICAgQ2FuIHlvdSBh
ZGQgdGhlIGZvbGxvd2luZyBwYXRjaCB0byB0ZXN0IG9uIHlvdXIgcGxhdGZvcm0/IHRoYW5rcy4K
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wLmMKPj4gYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4+
IGluZGV4IDk5YmRiNWEyYTE4NS4uMDc4MGFkNDYyMzBhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPj4gQEAgLTEwNSw3ICsxMDUsNyBAQAo+
PiAgICAjZGVmaW5lIEFGQkNfRk1UX1U4VThVOFU4ICAgICAgMHg1Cj4+ICAgICNkZWZpbmUgQUZC
Q19GTVRfVThVOFU4ICAgICAgICAgICAgICAgIDB4NAo+Pgo+PiAtI2RlZmluZSBBRkJDX1RJTEVf
MTZ4MTYgICAgICAgICAgICAgICAgQklUKDQpCj4+ICsjZGVmaW5lIEFGQkNfRk1UX1lUUiAgICAg
ICAgICAgQklUKDQpCj4+Cj4+ICAgIC8qCj4+ICAgICAqIFRoZSBjb2VmZmljaWVudHMgb2YgdGhl
IGZvbGxvd2luZyBtYXRyaXggYXJlIGFsbCBmaXhlZCBwb2ludHMuCj4+IEBAIC05NTIsNyArOTUy
LDkgQEAgc3RhdGljIHZvaWQgdm9wX3BsYW5lX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFu
ZQo+PiAqcGxhbmUsCj4+ICAgICAgICAgICBpZiAocm9ja2NoaXBfYWZiYyhmYi0+bW9kaWZpZXIp
KSB7Cj4+ICAgICAgICAgICAgICAgICAgIGludCBhZmJjX2Zvcm1hdCA9Cj4+IHZvcF9jb252ZXJ0
X2FmYmNfZm9ybWF0KGZiLT5mb3JtYXQtPmZvcm1hdCk7Cj4+Cj4+IC0gICAgICAgICAgICAgICBW
T1BfQUZCQ19TRVQodm9wLCBmb3JtYXQsIGFmYmNfZm9ybWF0IHwgQUZCQ19USUxFXzE2eDE2KTsK
Pj4gKyAgICAgICAgICAgICAgIGlmIChmYi0+bW9kaWZpZXIgJiBBRkJDX0ZPUk1BVF9NT0RfWVRS
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICBhZmJjX2Zvcm1hdCB8PSBBRkJDX0ZNVF9ZVFI7
Cj4+ICsgICAgICAgICAgICAgICBWT1BfQUZCQ19TRVQodm9wLCBmb3JtYXQsIGFmYmNfZm9ybWF0
KTsKPj4gICAgICAgICAgICAgICAgICAgVk9QX0FGQkNfU0VUKHZvcCwgaHJlZ19ibG9ja19zcGxp
dCwgMCk7Cj4+ICAgICAgICAgICAgICAgICAgIFZPUF9BRkJDX1NFVCh2b3AsIHdpbl9zZWwsIFZP
UF9XSU5fVE9fSU5ERVgodm9wX3dpbikpOwo+PiAgICAgICAgICAgICAgICAgICBWT1BfQUZCQ19T
RVQodm9wLCBoZHJfcHRyLCBkbWFfYWRkcik7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5oCj4+IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV92b3AuaAo+PiBpbmRleCA0YTIwOTljYjU4MmUuLjQ4ZTEzMWI4OGMy
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92
b3AuaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5o
Cj4+IEBAIC0yMCw2ICsyMCw3IEBACj4+ICAgICNkZWZpbmUgUk9DS0NISVBfQUZCQ19NT0QgXAo+
PiAgICAgICAgICAgRFJNX0ZPUk1BVF9NT0RfQVJNX0FGQkMoIFwKPj4gICAgICAgICAgICAgICAg
ICAgQUZCQ19GT1JNQVRfTU9EX0JMT0NLX1NJWkVfMTZ4MTYgfCBBRkJDX0ZPUk1BVF9NT0RfU1BB
UlNFIFwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgfCBBRkJDX0ZPUk1BVF9NT0RfWVRSIFwK
Pj4gICAgICAgICAgICkKPiBMb29rcyBnb29kIC0gdGhpcyB3aWxsIGhlbHAgdXMgY29uZmlybS4g
SSB0aGluayB0aGUgY29tcGxldGUgcGF0Y2gKPiB0aG91Z2ggd291bGQgYWR2ZXJ0aXNlIGJvdGgg
WVRSIGFuZCBub24tWVRSIG1vZGlmaWVyczogcGVyIEFybSdzCj4gcmVjb21tZW5kYXRpb24sIGl0
IHNvdW5kcyBsaWtlIFtBWF1SR0I4ODg4IGZvcm1hdHMgc2hvdWxkIG9ubHkKPiBhZHZlcnRpc2Ug
dGhlIG5vbi1ZVFIgdmFyaWFudCwgYW5kIFtBWF1CR1I4ODg4IHNob3VsZCBhZHZlcnRpc2UgYm90
aAo+IHZhcmlhbnRzLiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KeWVzLCBSR0IgZm9ybWF0IGhhdmUg
WVRSIGFuZCBub24tWVRSIHZhcmlhbnQsIFlVViBmb3JtYXQgb25seSBoYXZlIApub24tWVRSIHZh
cmlhbnQuCj4gQ2hlZXJzLAo+IERhbmllbAo+Cj4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
