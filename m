Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 471C099217
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 13:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F896EAF7;
	Thu, 22 Aug 2019 11:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E276EAF7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 11:33:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C765389F38E;
 Thu, 22 Aug 2019 11:33:42 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97F1F1001B32;
 Thu, 22 Aug 2019 11:33:38 +0000 (UTC)
Subject: Re: [PATCH v5] drm/virtio: use virtio_max_dma_size
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190821111210.27165-1-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2e6eba7b-5f46-e9e8-f6b2-3e80e95754e9@redhat.com>
Date: Thu, 22 Aug 2019 13:33:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190821111210.27165-1-kraxel@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 22 Aug 2019 11:33:42 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDgvMjEvMTkgMTM6MTIsIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gV2UgbXVzdCBtYWtlIHN1
cmUgb3VyIHNjYXR0ZXJsaXN0IHNlZ21lbnRzIGFyZSBub3QgdG9vIGJpZywgb3RoZXJ3aXNlCj4g
d2UgbWlnaHQgc2VlIHN3aW90bGIgZmFpbHVyZXMgKGhhcHBlbnMgd2l0aCBzZXYsIGFsc28gcmVw
cm9kdWNhYmxlIHdpdGgKPiBzd2lvdGxiPWZvcmNlKS4KPiAKPiBTdWdnZXN0ZWQtYnk6IExhc3ps
byBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFu
biA8a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9vYmplY3QuYyB8IDEwICsrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X29iamVjdC5jCj4gaW5kZXggYjJkYTMxMzEwZDI0Li4wOWI1MjY1MThmNWEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jCj4gQEAgLTIwNCw2ICsyMDQsNyBAQCBp
bnQgdmlydGlvX2dwdV9vYmplY3RfZ2V0X3NnX3RhYmxlKHN0cnVjdCB2aXJ0aW9fZ3B1X2Rldmlj
ZSAqcWRldiwKPiAgCQkuaW50ZXJydXB0aWJsZSA9IGZhbHNlLAo+ICAJCS5ub193YWl0X2dwdSA9
IGZhbHNlCj4gIAl9Owo+ICsJc2l6ZV90IG1heF9zZWdtZW50Owo+ICAKPiAgCS8qIHd0ZiBzd2Fw
cGluZyAqLwo+ICAJaWYgKGJvLT5wYWdlcykKPiBAQCAtMjE1LDggKzIxNiwxMyBAQCBpbnQgdmly
dGlvX2dwdV9vYmplY3RfZ2V0X3NnX3RhYmxlKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqcWRl
diwKPiAgCWlmICghYm8tPnBhZ2VzKQo+ICAJCWdvdG8gb3V0Owo+ICAKPiAtCXJldCA9IHNnX2Fs
bG9jX3RhYmxlX2Zyb21fcGFnZXMoYm8tPnBhZ2VzLCBwYWdlcywgbnJfcGFnZXMsIDAsCj4gLQkJ
CQkJbnJfcGFnZXMgPDwgUEFHRV9TSElGVCwgR0ZQX0tFUk5FTCk7Cj4gKwltYXhfc2VnbWVudCA9
IHZpcnRpb19tYXhfZG1hX3NpemUocWRldi0+dmRldik7Cj4gKwltYXhfc2VnbWVudCAmPSBQQUdF
X01BU0s7Cj4gKwlpZiAobWF4X3NlZ21lbnQgPiBTQ0FUVEVSTElTVF9NQVhfU0VHTUVOVCkKPiAr
CQltYXhfc2VnbWVudCA9IFNDQVRURVJMSVNUX01BWF9TRUdNRU5UOwo+ICsJcmV0ID0gX19zZ19h
bGxvY190YWJsZV9mcm9tX3BhZ2VzKGJvLT5wYWdlcywgcGFnZXMsIG5yX3BhZ2VzLCAwLAo+ICsJ
CQkJCSAgbnJfcGFnZXMgPDwgUEFHRV9TSElGVCwKPiArCQkJCQkgIG1heF9zZWdtZW50LCBHRlBf
S0VSTkVMKTsKPiAgCWlmIChyZXQpCj4gIAkJZ290byBvdXQ7Cj4gIAlyZXR1cm4gMDsKPiAKClJl
dmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKVGhhbmtzIQpMYXN6
bG8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
