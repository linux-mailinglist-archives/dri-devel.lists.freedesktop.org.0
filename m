Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBADBB552
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 15:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272B46E90A;
	Mon, 23 Sep 2019 13:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89A396E909
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 13:32:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC971000;
 Mon, 23 Sep 2019 06:32:34 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 155783F694;
 Mon, 23 Sep 2019 06:32:32 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] drm/shmem: drop VM_DONTDUMP
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20190917092404.9982-1-kraxel@redhat.com>
 <20190917092404.9982-4-kraxel@redhat.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f1bd2517-f49f-34c0-6b75-3181c4698f60@arm.com>
Date: Mon, 23 Sep 2019 14:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190917092404.9982-4-kraxel@redhat.com>
Content-Language: en-GB
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDkvMjAxOSAxMDoyMywgR2VyZCBIb2ZmbWFubiB3cm90ZToKPiBOb3Qgb2J2aW91cyB3
aHkgdGhpcyBpcyBuZWVkZWQuICBBY2NvcmRpbmcgdG8gRGVuaWVsIFZldHRlciB0aGlzIGlzIG1v
c3QKPiBsaWtlbHkgYSBoaXN0b3JpYyBhcnRlZmFjdCBkYXRpbmcgYmFjayB0byB0aGUgZGF5cyB3
aGVyZSBkcm0gZHJpdmVycwo+IGV4cG9zZWQgaGFyZHdhcmUgcmVnaXN0ZXJzIGFzIG1tYXAnYWJs
ZSBnZW0gb2JqZWN0cywgdG8gYXZvaWQgZHVtcGluZwo+IHRvdWNoaW5nIHRob3NlIHJlZ2lzdGVy
cy4gIHNobWVtIGdlbSBvYmplY3RzIHN1cmVseSBkb24ndCBuZWVkIHRoYXQgLi4uCj4gCj4gU2ln
bmVkLW9mZi1ieTogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CgpSZXZpZXdlZC1i
eTogU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYwo+IGluZGV4IGE5YTU4NjYzMDUxNy4uNmVmZWRhYjE1MDE2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKPiBAQCAtNTM2LDcgKzUzNiw3IEBA
IGludCBkcm1fZ2VtX3NobWVtX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+IC0Jdm1h
LT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX01JWEVETUFQIHwgVk1fRE9OVEVYUEFORCB8IFZNX0RP
TlREVU1QOwo+ICsJdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX01JWEVETUFQIHwgVk1fRE9O
VEVYUEFORDsKPiAgCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X3dyaXRlY29tYmluZSh2bV9n
ZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpKTsKPiAgCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdw
cm90X2RlY3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7Cj4gIAl2bWEtPnZtX29wcyA9ICZkcm1f
Z2VtX3NobWVtX3ZtX29wczsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
