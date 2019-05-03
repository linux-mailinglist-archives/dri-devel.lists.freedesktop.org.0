Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3E71309A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 16:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634616E7D1;
	Fri,  3 May 2019 14:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 047296E7D1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 14:41:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD048374;
 Fri,  3 May 2019 07:41:16 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B1DC3F5C1;
 Fri,  3 May 2019 07:41:16 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id DF83E68240F; Fri,  3 May 2019 15:41:14 +0100 (BST)
Date: Fri, 3 May 2019 15:41:14 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/komeda: Potential error pointer dereference
Message-ID: <20190503144114.GF15144@e110455-lin.cambridge.arm.com>
References: <20190503122525.GA29695@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503122525.GA29695@mwanda>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDMsIDIwMTkgYXQgMDM6MjU6MjVQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBXZSBuZWVkIHRvIGNoZWNrIHdoZXRoZXIgZHJtX2F0b21pY19nZXRfY3J0Y19zdGF0
ZSgpIHJldHVybnMgYW4gZXJyb3IKPiBwb2ludGVyIGJlZm9yZSBkZXJlZmVyZW5jaW5nICJjcnRj
X3N0Ii4KPiAKPiBGaXhlczogN2QzMWI5ZTdhNTUwICgiZHJtL2tvbWVkYTogQWRkIGtvbWVkYV9w
bGFuZS9wbGFuZV9oZWxwZXJfZnVuY3MiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUu
ZHVkYXVAYXJtLmNvbT4KCkknbGwgcHVsbCB0aGlzIGFuZCBzZW5kIGl0IGFzIGEgZml4IGFmdGVy
IC1yYzEuCgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9wbGFuZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BsYW5lLmMKPiBpbmRleCAwN2VkMGNjMWJjNDQu
LmM3ZTVmYzZlNTUwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfcGxhbmUuYwo+IEBAIC02NCw3ICs2NCw3IEBAIGtvbWVkYV9wbGFuZV9h
dG9taWNfY2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAkJcmV0dXJuIDA7Cj4gIAo+
ICAJY3J0Y19zdCA9IGRybV9hdG9taWNfZ2V0X2NydGNfc3RhdGUoc3RhdGUtPnN0YXRlLCBzdGF0
ZS0+Y3J0Yyk7Cj4gLQlpZiAoIWNydGNfc3QtPmVuYWJsZSkgewo+ICsJaWYgKElTX0VSUihjcnRj
X3N0KSB8fCAhY3J0Y19zdC0+ZW5hYmxlKSB7Cj4gIAkJRFJNX0RFQlVHX0FUT01JQygiQ2Fubm90
IHVwZGF0ZSBwbGFuZSBvbiBhIGRpc2FibGVkIENSVEMuXG4iKTsKPiAgCQlyZXR1cm4gLUVJTlZB
TDsKPiAgCX0KPiAtLSAKPiAyLjE4LjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkg
d291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8
IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQog
ICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
