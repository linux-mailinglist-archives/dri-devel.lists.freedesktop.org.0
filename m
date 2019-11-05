Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402CEEFC03
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 12:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E90A6E9D7;
	Tue,  5 Nov 2019 11:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB176E9D7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 11:05:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16--v3XwskHO623hpkOJeZiQQ-1; Tue, 05 Nov 2019 06:05:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AFA8107ACC2;
 Tue,  5 Nov 2019 11:05:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69F6F5C28C;
 Tue,  5 Nov 2019 11:05:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EDB316E08; Tue,  5 Nov 2019 12:05:37 +0100 (CET)
Date: Tue, 5 Nov 2019 12:05:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/udl: Remove flags field from struct udl_gem_object
Message-ID: <20191105110537.p4jkdds334jfmoak@sirius.home.kraxel.org>
References: <20191028084549.30243-1-tzimmermann@suse.de>
 <20191028084549.30243-2-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028084549.30243-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -v3XwskHO623hpkOJeZiQQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572951945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLzppWL6pWgsdIsnY4+ezp9EZjNoGd5SMVNS14cpGKY=;
 b=FKc4lQ0cx4Zr1ckBsGQvBwqsY6tcnVhecFyBqL8RilmtcJDQjRueOwmismkKCPG+EUqr/9
 o2Zcdrc2GnLeKDmw+rZ3yhwp/6qnEcrJVUQQciDDihcVuq4Dg8rR1G0QP+N072WRY6EcUe
 UFUi8Wx3ZvIjmWVUgWaoj5xVU4Aftl8=
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDk6NDU6NDdBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gVGhlIGZsYWdzIGZpZWxkIGluIHN0cnVjdCB1ZGxfZ2VtIGNvbnRyb2wgbWFw
cGluZyBwYXJhbWV0ZXJzOiBjYWNoZWQKPiBhY2Nlc3MgZm9yIGxvY2FsIGJ1ZmZlcnMsIHdyaXRl
LWNvbWJpbmVkIGFjY2VzcyBmb3IgaW1wb3J0ZWQgYnVmZmVycy4KPiAKPiBXZSBjYW4gZHJvcCB0
aGUgZmllbGQgYW5kIGRpc3Rpbmd1c2ggYm90aCBjYXNlcyBieSB0ZXN0aW5nIHdoZXRoZXIKPiBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QuaW1wb3J0X2F0dGFjaCBpcyBOVUxMLgoKQWNrZWQtYnk6IEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfZG1hYnVmLmMgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Ry
di5oICAgIHwgIDQgLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyAgICB8IDI3
ICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2RtYWJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZG1hYnVmLmMKPiBp
bmRleCAzMTA4ZTlhOTIzNGIuLmIxYzFlZTY0ZGU1OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kbWFidWYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rt
YWJ1Zi5jCj4gQEAgLTI0MSw3ICsyNDEsNiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnVkbF9n
ZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJZ290byBmYWlsX3Vu
bWFwOwo+ICAKPiAgCXVvYmotPmJhc2UuaW1wb3J0X2F0dGFjaCA9IGF0dGFjaDsKPiAtCXVvYmot
PmZsYWdzID0gVURMX0JPX1dDOwo+ICAKPiAgCXJldHVybiAmdW9iai0+YmFzZTsKPiAgCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZHJ2LmgKPiBpbmRleCAxMmE5NzBmZDlhODcuLmUxMzA2YTUxOTAzYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2Rydi5oCj4gQEAgLTI5LDkgKzI5LDYgQEAgc3RydWN0IGRybV9tb2RlX2Ny
ZWF0ZV9kdW1iOwo+ICAjZGVmaW5lIERSSVZFUl9NSU5PUgkJMAo+ICAjZGVmaW5lIERSSVZFUl9Q
QVRDSExFVkVMCTEKPiAgCj4gLSNkZWZpbmUgVURMX0JPX0NBQ0hFQUJMRQkJKDEgPDwgMCkKPiAt
I2RlZmluZSBVRExfQk9fV0MJCSgxIDw8IDEpCj4gLQo+ICBzdHJ1Y3QgdWRsX2RldmljZTsKPiAg
Cj4gIHN0cnVjdCB1cmJfbm9kZSB7Cj4gQEAgLTgxLDcgKzc4LDYgQEAgc3RydWN0IHVkbF9nZW1f
b2JqZWN0IHsKPiAgCXN0cnVjdCBwYWdlICoqcGFnZXM7Cj4gIAl2b2lkICp2bWFwcGluZzsKPiAg
CXN0cnVjdCBzZ190YWJsZSAqc2c7Cj4gLQl1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4gIH07Cj4gIAo+
ICAjZGVmaW5lIHRvX3VkbF9ibyh4KSBjb250YWluZXJfb2YoeCwgc3RydWN0IHVkbF9nZW1fb2Jq
ZWN0LCBiYXNlKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCj4gaW5kZXggYjIzYTVjMmZjZDgwLi43ZDNj
MWI3M2VhMDIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYwo+IEBAIC0yNSw3ICsyNSw2IEBAIHN0
cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19vYmplY3Qoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKPiAgCQlyZXR1cm4gTlVMTDsKPiAgCX0KPiAgCj4gLQlvYmotPmZsYWdzID0gVURM
X0JPX0NBQ0hFQUJMRTsKPiAgCXJldHVybiBvYmo7Cj4gIH0KPiAgCj4gQEAgLTU3LDIzICs1Niw2
IEBAIHVkbF9nZW1fY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCXJldHVybiAwOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgdm9pZCB1cGRhdGVfdm1fY2FjaGVfYXR0cihzdHJ1Y3QgdWRsX2dl
bV9vYmplY3QgKm9iaiwKPiAtCQkJCSBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPiAtewo+
IC0JRFJNX0RFQlVHX0tNUygiZmxhZ3MgPSAweCV4XG4iLCBvYmotPmZsYWdzKTsKPiAtCj4gLQkv
KiBub24tY2FjaGVhYmxlIGFzIGRlZmF1bHQuICovCj4gLQlpZiAob2JqLT5mbGFncyAmIFVETF9C
T19DQUNIRUFCTEUpIHsKPiAtCQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHZtX2dldF9wYWdlX3Byb3Qo
dm1hLT52bV9mbGFncyk7Cj4gLQl9IGVsc2UgaWYgKG9iai0+ZmxhZ3MgJiBVRExfQk9fV0MpIHsK
PiAtCQl2bWEtPnZtX3BhZ2VfcHJvdCA9Cj4gLQkJCXBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0
X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7Cj4gLQl9IGVsc2Ugewo+IC0JCXZtYS0+dm1fcGFn
ZV9wcm90ID0KPiAtCQkJcGdwcm90X25vbmNhY2hlZCh2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1f
ZmxhZ3MpKTsKPiAtCX0KPiAtfQo+IC0KPiAgaW50IHVkbF9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGUsCj4gIAkJICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJICAgIHN0
cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAqYXJncykKPiBAQCAtODYsMTYgKzY4LDIxIEBAIGlu
dCB1ZGxfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLAo+ICAKPiAgaW50IHVkbF9k
cm1fZ2VtX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
KQo+ICB7Cj4gKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKPiAgCWludCByZXQ7Cj4gIAo+
ICAJcmV0ID0gZHJtX2dlbV9tbWFwKGZpbHAsIHZtYSk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVy
biByZXQ7Cj4gIAo+ICsJb2JqID0gdm1hLT52bV9wcml2YXRlX2RhdGE7Cj4gKwo+ICAJdm1hLT52
bV9mbGFncyAmPSB+Vk1fUEZOTUFQOwo+ICAJdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsK
PiAgCj4gLQl1cGRhdGVfdm1fY2FjaGVfYXR0cih0b191ZGxfYm8odm1hLT52bV9wcml2YXRlX2Rh
dGEpLCB2bWEpOwo+ICsJdm1hLT52bV9wYWdlX3Byb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+
dm1fZmxhZ3MpOwo+ICsJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkKPiArCQl2bWEtPnZtX3BhZ2Vf
cHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1hLT52bV9wYWdlX3Byb3QpOwo+ICAKPiAgCXJl
dHVybiByZXQ7Cj4gIH0KPiBAQCAtMTU1LDcgKzE0Miw3IEBAIGludCB1ZGxfZ2VtX3ZtYXAoc3Ry
dWN0IHVkbF9nZW1fb2JqZWN0ICpvYmopCj4gIAkJCXJldHVybiAtRU5PTUVNOwo+ICAJCXJldHVy
biAwOwo+ICAJfQo+IC0JCQo+ICsKPiAgCXJldCA9IHVkbF9nZW1fZ2V0X3BhZ2VzKG9iaik7Cj4g
IAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gLS0gCj4gMi4yMy4wCj4gCj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
