Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06003C06C5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645126E845;
	Fri, 27 Sep 2019 13:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2DF26E848;
 Fri, 27 Sep 2019 13:57:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85CEF1570;
 Fri, 27 Sep 2019 06:57:23 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F8CD3F86F;
 Fri, 27 Sep 2019 06:57:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] drm/v3d: use drm_gem_objects_lookup_user
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190927134616.21899-1-yuq825@gmail.com>
 <20190927134616.21899-3-yuq825@gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <0f35e5c2-6e57-4425-7249-2e9df82c93fd@arm.com>
Date: Fri, 27 Sep 2019 14:57:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927134616.21899-3-yuq825@gmail.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, lima@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDkvMjAxOSAxNDo0NiwgUWlhbmcgWXUgd3JvdGU6Cj4gdjI6Cj4gdXNlIGRybV9nZW1f
b2JqZWN0c19sb29rdXBfdXNlciBpbnN0ZWFkIG9mCj4gZHJtX2dlbV9vYmplY3RzX2xvb2t1cC4K
PiAKPiBDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KPiBTaWduZWQtb2ZmLWJ5OiBR
aWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KCkxvb2tzIGZhbWlsaWFyIDopCgpOaXQ6IHBsZWFz
ZSB3cml0ZSBhIGNvbW1pdCBtZXNzYWdlLiBCdXQgb3RoZXJ3aXNlOgoKUmV2aWV3ZWQtYnk6IFN0
ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vdjNkL3YzZF9nZW0uYyB8IDQ5ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS92M2QvdjNkX2dlbS5jCj4gaW5kZXggNGM0YjU5YWUyYzgxLi43NWEzYjQ0OGYzZmEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdjNkL3YzZF9nZW0uYwo+IEBAIC0yOTAsMTAgKzI5MCw2IEBAIHYzZF9sb29rdXBf
Ym9zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkgICAgICAgdTY0IGJvX2hhbmRsZXMsCj4g
IAkgICAgICAgdTMyIGJvX2NvdW50KQo+ICB7Cj4gLQl1MzIgKmhhbmRsZXM7Cj4gLQlpbnQgcmV0
ID0gMDsKPiAtCWludCBpOwo+IC0KPiAgCWpvYi0+Ym9fY291bnQgPSBib19jb3VudDsKPiAgCj4g
IAlpZiAoIWpvYi0+Ym9fY291bnQpIHsKPiBAQCAtMzA0LDQ4ICszMDAsOSBAQCB2M2RfbG9va3Vw
X2JvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+
ICAKPiAtCWpvYi0+Ym8gPSBrdm1hbGxvY19hcnJheShqb2ItPmJvX2NvdW50LAo+IC0JCQkJIHNp
emVvZihzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICopLAo+IC0JCQkJIEdGUF9LRVJORUwgfCBf
X0dGUF9aRVJPKTsKPiAtCWlmICgham9iLT5ibykgewo+IC0JCURSTV9ERUJVRygiRmFpbGVkIHRv
IGFsbG9jYXRlIHZhbGlkYXRlZCBCTyBwb2ludGVyc1xuIik7Cj4gLQkJcmV0dXJuIC1FTk9NRU07
Cj4gLQl9Cj4gLQo+IC0JaGFuZGxlcyA9IGt2bWFsbG9jX2FycmF5KGpvYi0+Ym9fY291bnQsIHNp
emVvZih1MzIpLCBHRlBfS0VSTkVMKTsKPiAtCWlmICghaGFuZGxlcykgewo+IC0JCXJldCA9IC1F
Tk9NRU07Cj4gLQkJRFJNX0RFQlVHKCJGYWlsZWQgdG8gYWxsb2NhdGUgaW5jb21pbmcgR0VNIGhh
bmRsZXNcbiIpOwo+IC0JCWdvdG8gZmFpbDsKPiAtCX0KPiAtCj4gLQlpZiAoY29weV9mcm9tX3Vz
ZXIoaGFuZGxlcywKPiAtCQkJICAgKHZvaWQgX191c2VyICopKHVpbnRwdHJfdClib19oYW5kbGVz
LAo+IC0JCQkgICBqb2ItPmJvX2NvdW50ICogc2l6ZW9mKHUzMikpKSB7Cj4gLQkJcmV0ID0gLUVG
QVVMVDsKPiAtCQlEUk1fREVCVUcoIkZhaWxlZCB0byBjb3B5IGluIEdFTSBoYW5kbGVzXG4iKTsK
PiAtCQlnb3RvIGZhaWw7Cj4gLQl9Cj4gLQo+IC0Jc3Bpbl9sb2NrKCZmaWxlX3ByaXYtPnRhYmxl
X2xvY2spOwo+IC0JZm9yIChpID0gMDsgaSA8IGpvYi0+Ym9fY291bnQ7IGkrKykgewo+IC0JCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqYm8gPSBpZHJfZmluZCgmZmlsZV9wcml2LT5vYmplY3RfaWRy
LAo+IC0JCQkJCQkgICAgIGhhbmRsZXNbaV0pOwo+IC0JCWlmICghYm8pIHsKPiAtCQkJRFJNX0RF
QlVHKCJGYWlsZWQgdG8gbG9vayB1cCBHRU0gQk8gJWQ6ICVkXG4iLAo+IC0JCQkJICBpLCBoYW5k
bGVzW2ldKTsKPiAtCQkJcmV0ID0gLUVOT0VOVDsKPiAtCQkJc3Bpbl91bmxvY2soJmZpbGVfcHJp
di0+dGFibGVfbG9jayk7Cj4gLQkJCWdvdG8gZmFpbDsKPiAtCQl9Cj4gLQkJZHJtX2dlbV9vYmpl
Y3RfZ2V0KGJvKTsKPiAtCQlqb2ItPmJvW2ldID0gYm87Cj4gLQl9Cj4gLQlzcGluX3VubG9jaygm
ZmlsZV9wcml2LT50YWJsZV9sb2NrKTsKPiAtCj4gLWZhaWw6Cj4gLQlrdmZyZWUoaGFuZGxlcyk7
Cj4gLQlyZXR1cm4gcmV0Owo+ICsJcmV0dXJuIGRybV9nZW1fb2JqZWN0c19sb29rdXBfdXNlcihm
aWxlX3ByaXYsCj4gKwkJCQkJICAgKHZvaWQgX191c2VyICopKHVpbnRwdHJfdClib19oYW5kbGVz
LAo+ICsJCQkJCSAgIGpvYi0+Ym9fY291bnQsICZqb2ItPmJvKTsKPiAgfQo+ICAKPiAgc3RhdGlj
IHZvaWQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
