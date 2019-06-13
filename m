Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5684744307
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 18:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7F889256;
	Thu, 13 Jun 2019 16:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E72489256
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 16:29:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2B293EF;
 Thu, 13 Jun 2019 09:29:28 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ED963F694;
 Thu, 13 Jun 2019 09:29:28 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 4867E682577; Thu, 13 Jun 2019 17:29:27 +0100 (BST)
Date: Thu, 13 Jun 2019 17:29:27 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [PATCH v2] drm/komeda: Make Komeda interrupts shareable
Message-ID: <20190613162927.GS4173@e110455-lin.cambridge.arm.com>
References: <20190613151257.32297-1-ayan.halder@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613151257.32297-1-ayan.halder@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDQ6MTM6MTBQTSArMDEwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gS29tZWRhIGludGVycnVwdHMgbWF5IGJlIHNoYXJlZCB3aXRoIG90aGVyIGhhcmR3YXJl
IGJsb2Nrcy4KPiBPbmUgbmVlZHMgdG8gdXNlIGRldm1fcmVxdWVzdF9pcnEoKSB3aXRoIElSUUZf
U0hBUkVEIHRvIGNyZWF0ZSBhIHNoYXJlZAo+ICBpbnRlcnJ1cHQgaGFuZGxlci4KPiBBcyBhIHJl
c3VsdCBvZiBub3QgdXNpbmcgZHJtX2lycV9pbnN0YWxsKCkgYXBpLCBvbmUgbmVlZHMgdG8gc2V0
Cj4gIihzdHJ1Y3QgZHJtX2RldmljZSAqKS0+aXJxX2VuYWJsZWQgPSB0cnVlL2ZhbHNlIiB0byBl
bmFibGUvZGlzYWJsZQo+IHZibGFuayBpbnRlcnJ1cHRzLgo+IAo+IENoYW5nZXMgZnJvbSB2MTot
Cj4gMS4gU3F1YXNoZWQgdGhlIGZvbGxvd2luZyB0d28gcGF0Y2hlcyBpbnRvIG9uZSAoYXMgdGhl
IHNlY29uZCBwYXRjaCBpcyBhCj4gY29uc2VxdWVuY2Ugb2YgdGhlIGZpcnN0IG9uZSk6LQo+ICAg
IGRybS9rb21lZGE6IEF2b2lkIHVzaW5nIERSSVZFUl9JUlFfU0hBUkVECj4gICAgZHJtL2tvbWVk
YTogRW5hYmxlL0Rpc2FibGUgdmJsYW5rIGludGVycnVwdHMKPiAyLiBGaXhlZCB0aGUgY29tbWl0
IG1lc3NhZ2UgKGFzIHBvaW50ZWQgYnkgRGFuaWVsIFZldHRlcikKPiAzLiBSZW1vdmVkIGNhbGxz
IHRvICdkcm1faXJxX3VuaW5zdGFsbCgpJyBhcyB3ZSBhcmUgbm8gbG9uZ2VyIHVzaW5nCj4gZHJt
X2lycV9pbnN0YWxsKCkKPiA0LiBSZW1vdmVkIHRoZSBzdHJ1Y3QgbWVtYmVyICdrb21lZGFfa21z
X2RyaXZlci5pcnFfaGFuZGxlcicgYXMgaXQgaXMgbm90Cj4gdXNlZCBhbnl3aGVyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KClJl
dmlld2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIHwgMTYgKysrKysr
KysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2ttcy5jCj4gaW5kZXggODZmNjU0MmFmYjQwLi5iYjJiZmZjMGUwMjIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC01OCw3
ICs1OCw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBrb21lZGFfa21zX2RyaXZlciA9IHsK
PiAgCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfR0VNIHwgRFJJVkVSX01PREVTRVQgfCBEUklW
RVJfQVRPTUlDIHwKPiAgCQkJICAgRFJJVkVSX1BSSU1FIHwgRFJJVkVSX0hBVkVfSVJRLAo+ICAJ
Lmxhc3RjbG9zZQkJCT0gZHJtX2ZiX2hlbHBlcl9sYXN0Y2xvc2UsCj4gLQkuaXJxX2hhbmRsZXIJ
CQk9IGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIsCj4gIAkuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2Vk
CT0gZHJtX2dlbV9jbWFfZnJlZV9vYmplY3QsCj4gIAkuZ2VtX3ZtX29wcwkJCT0gJmRybV9nZW1f
Y21hX3ZtX29wcywKPiAgCS5kdW1iX2NyZWF0ZQkJCT0ga29tZWRhX2dlbV9jbWFfZHVtYl9jcmVh
dGUsCj4gQEAgLTE5NCwyMyArMTkzLDI2IEBAIHN0cnVjdCBrb21lZGFfa21zX2RldiAqa29tZWRh
X2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCj4gIAo+ICAJZHJtX21vZGVfY29u
ZmlnX3Jlc2V0KGRybSk7Cj4gIAo+IC0JZXJyID0gZHJtX2lycV9pbnN0YWxsKGRybSwgbWRldi0+
aXJxKTsKPiArCWVyciA9IGRldm1fcmVxdWVzdF9pcnEoZHJtLT5kZXYsIG1kZXYtPmlycSwKPiAr
CQkJICAgICAgIGtvbWVkYV9rbXNfaXJxX2hhbmRsZXIsIElSUUZfU0hBUkVELAo+ICsJCQkgICAg
ICAgZHJtLT5kcml2ZXItPm5hbWUsIGRybSk7Cj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gY2xlYW51
cF9tb2RlX2NvbmZpZzsKPiAgCj4gIAllcnIgPSBtZGV2LT5mdW5jcy0+ZW5hYmxlX2lycShtZGV2
KTsKPiAgCWlmIChlcnIpCj4gLQkJZ290byB1bmluc3RhbGxfaXJxOwo+ICsJCWdvdG8gY2xlYW51
cF9tb2RlX2NvbmZpZzsKPiArCj4gKwlkcm0tPmlycV9lbmFibGVkID0gdHJ1ZTsKPiAgCj4gIAll
cnIgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7Cj4gIAlpZiAoZXJyKQo+IC0JCWdvdG8gdW5p
bnN0YWxsX2lycTsKPiArCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4gIAo+ICAJcmV0dXJu
IGttczsKPiAgCj4gLXVuaW5zdGFsbF9pcnE6Cj4gLQlkcm1faXJxX3VuaW5zdGFsbChkcm0pOwo+
ICBjbGVhbnVwX21vZGVfY29uZmlnOgo+ICsJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOwo+ICAJ
ZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiAgCWtvbWVkYV9rbXNfY2xlYW51cF9wcml2
YXRlX29ianMoa21zKTsKPiAgZnJlZV9rbXM6Cj4gQEAgLTIyMyw5ICsyMjUsOSBAQCB2b2lkIGtv
bWVkYV9rbXNfZGV0YWNoKHN0cnVjdCBrb21lZGFfa21zX2RldiAqa21zKQo+ICAJc3RydWN0IGRy
bV9kZXZpY2UgKmRybSA9ICZrbXMtPmJhc2U7Cj4gIAlzdHJ1Y3Qga29tZWRhX2RldiAqbWRldiA9
IGRybS0+ZGV2X3ByaXZhdGU7Cj4gIAo+ICsJZHJtLT5pcnFfZW5hYmxlZCA9IGZhbHNlOwo+ICAJ
bWRldi0+ZnVuY3MtPmRpc2FibGVfaXJxKG1kZXYpOwo+ICAJZHJtX2Rldl91bnJlZ2lzdGVyKGRy
bSk7Cj4gLQlkcm1faXJxX3VuaW5zdGFsbChkcm0pOwo+ICAJY29tcG9uZW50X3VuYmluZF9hbGwo
bWRldi0+ZGV2LCBkcm0pOwo+ICAJa29tZWRhX2ttc19jbGVhbnVwX3ByaXZhdGVfb2JqcyhrbXMp
Owo+ICAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKPiAtLSAKPiAyLjIxLjAKPiAKCi0t
IAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3Js
ZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBj
b2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
