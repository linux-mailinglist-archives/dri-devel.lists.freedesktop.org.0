Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EB1727B6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A006EBFF;
	Thu, 27 Feb 2020 18:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BBBF6EBFF;
 Thu, 27 Feb 2020 18:35:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3901D1FB;
 Thu, 27 Feb 2020 10:35:46 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 190B83F73B;
 Thu, 27 Feb 2020 10:35:46 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id CD024682F2C; Thu, 27 Feb 2020 18:35:44 +0000 (GMT)
Date: Thu, 27 Feb 2020 18:35:44 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 18/51] drm/<drivers>: Use drmm_add_final_kfree
Message-ID: <20200227183544.GC364558@e110455-lin.cambridge.arm.com>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-19-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-19-daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBGZWIgMjcsIDIwMjAgYXQgMDc6MTQ6NDlQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGVzZSBhcmUgdGhlIGxlZnRvdmVyIGRyaXZlcnMgdGhhdCBkaWRuJ3QgaGF2ZSBh
IC0+cmVsZWFzZSBob29rIHRoYXQKPiBuZWVkZWQgdG8gYmUgdXBkYXRlZC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogIkph
bWVzIChRaWFuKSBXYW5nIiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gQ2M6IExpdml1IER1
ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IENjOiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwu
YXRhbmFzc292QGFybS5jb20+Cj4gQ2M6IFJ1c3NlbGwgS2luZyA8bGludXhAYXJtbGludXgub3Jn
LnVrPgo+IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDIgKysKPiAg
ZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZHJ2LmMgICAgICAgICAgICAgfCAyICsrCj4g
IGRyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyAgICAgICAgICAgIHwgMiArKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4gaW5kZXggNDQyZDQ2NTYxNTBh
Li4xNmRmZDVjZGI2NmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuYwo+IEBAIC0xNCw2ICsxNCw3IEBACj4gICNpbmNsdWRlIDxkcm0v
ZHJtX2dlbV9jbWFfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZl
cl9oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1faXJxLmg+Cj4gKyNpbmNsdWRlIDxkcm0v
ZHJtX21hbmFnZWQuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+Cj4gICNp
bmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgo+ICAKPiBAQCAtMjcxLDYgKzI3Miw3IEBAIHN0cnVj
dCBrb21lZGFfa21zX2RldiAqa29tZWRhX2ttc19hdHRhY2goc3RydWN0IGtvbWVkYV9kZXYgKm1k
ZXYpCj4gIAllcnIgPSBkcm1fZGV2X2luaXQoZHJtLCAma29tZWRhX2ttc19kcml2ZXIsIG1kZXYt
PmRldik7Cj4gIAlpZiAoZXJyKQo+ICAJCWdvdG8gZnJlZV9rbXM7Cj4gKwlkcm1tX2FkZF9maW5h
bF9rZnJlZShkcm0sIGttcyk7Cj4gIAo+ICAJZHJtLT5kZXZfcHJpdmF0ZSA9IG1kZXY7Cj4gIAoK
Rm9yIGtvbWVkYTogQWNrZWQtYnk6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgoK
QmVzdCByZWdhcmRzLApMaXZpdQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybWFk
YS9hcm1hZGFfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9kcnYuYwo+IGlu
ZGV4IDE5N2RjYTNmYzg0Yy4uZGQ5ZWQ3MWVkOTQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm1hZGEvYXJtYWRhX2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9h
cm1hZGFfZHJ2LmMKPiBAQCAtMTIsNiArMTIsNyBAQAo+ICAjaW5jbHVkZSA8ZHJtL2RybV9hdG9t
aWNfaGVscGVyLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+ICAjaW5jbHVkZSA8ZHJt
L2RybV9pb2N0bC5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+Cj4gICNpbmNsdWRl
IDxkcm0vZHJtX3ByaW1lLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgo+
ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KPiBAQCAtMTAzLDYgKzEwNCw3IEBAIHN0
YXRpYyBpbnQgYXJtYWRhX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQlrZnJlZShw
cml2KTsKPiAgCQlyZXR1cm4gcmV0Owo+ICAJfQo+ICsJZHJtbV9hZGRfZmluYWxfa2ZyZWUoJnBy
aXYtPmRybSwgcHJpdik7Cj4gIAo+ICAJLyogUmVtb3ZlIGVhcmx5IGZyYW1lYnVmZmVycyAqLwo+
ICAJcmV0ID0gZHJtX2ZiX2hlbHBlcl9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJzKE5V
TEwsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYyBi
L2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYwo+IGluZGV4IDg1MTJkOTcwYTA5
Zi4uMTNlYWFlNzkyMWY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8v
dmJveF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92Ym94dmlkZW8vdmJveF9kcnYuYwo+
IEBAIC0xNyw2ICsxNyw3IEBACj4gICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgo+ICAj
aW5jbHVkZSA8ZHJtL2RybV9maWxlLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2lvY3RsLmg+Cj4g
KyNpbmNsdWRlIDxkcm0vZHJtX21hbmFnZWQuaD4KPiAgCj4gICNpbmNsdWRlICJ2Ym94X2Rydi5o
Igo+ICAKPiBAQCAtNTQsNiArNTUsNyBAQCBzdGF0aWMgaW50IHZib3hfcGNpX3Byb2JlKHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQo+ICAJdmJv
eC0+ZGRldi5wZGV2ID0gcGRldjsKPiAgCXZib3gtPmRkZXYuZGV2X3ByaXZhdGUgPSB2Ym94Owo+
ICAJcGNpX3NldF9kcnZkYXRhKHBkZXYsIHZib3gpOwo+ICsJZHJtbV9hZGRfZmluYWxfa2ZyZWUo
JnZib3gtPmRkZXYsIHZib3gpOwo+ICAJbXV0ZXhfaW5pdCgmdmJveC0+aHdfbXV0ZXgpOwo+ICAK
PiAgCXJldCA9IHBjaV9lbmFibGVfZGV2aWNlKHBkZXYpOwo+IC0tIAo+IDIuMjQuMQo+IAoKLS0g
Cj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdvcmxk
LCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNlIGNv
ZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
