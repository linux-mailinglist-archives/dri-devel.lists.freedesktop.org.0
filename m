Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BCBDC24
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 12:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB246EB8C;
	Wed, 25 Sep 2019 10:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 204986EB8C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 10:25:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A572D1570;
 Wed, 25 Sep 2019 03:25:41 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62B5E3F694;
 Wed, 25 Sep 2019 03:25:41 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 2BF45682851; Wed, 25 Sep 2019 11:25:40 +0100 (BST)
Date: Wed, 25 Sep 2019 11:25:40 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v2 2/2] drm/komeda: Adds layer horizontal input size
 limitation check for D71
Message-ID: <20190925102540.oepvakvcshyrhc3u@e110455-lin.cambridge.arm.com>
References: <20190924080022.19250-1-lowry.li@arm.com>
 <20190924080022.19250-3-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924080022.19250-3-lowry.li@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMjQsIDIwMTkgYXQgMDg6MDA6NDlBTSArMDAwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBGcm9tOiAiTG93cnkgTGkgKEFybSBUZWNobm9sb2d5
IENoaW5hKSIgPExvd3J5LkxpQGFybS5jb20+Cj4gCj4gQWRkcyBtYXhpbXVtIGxpbmUgc2l6ZSBj
aGVjayBhY2NvcmRpbmcgdG8gdGhlIEFGQkMgZGVjb2RlciBsaW1pdGF0aW9uCj4gYW5kIHNwZWNp
YWwgTGluZSBzaXplIGxpbWl0YXRpb24oMjA0NikgZm9yIGZvcm1hdDogWVVWNDIwXzEwQklUIGFu
ZCBYMEwyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGlu
YSkgPGxvd3J5LmxpQGFybS5jb20+CgpSZXZpZXdlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1
ZGF1QGFybS5jb20+CgpCZXN0IHJlZ2FyZHMsCkxpdml1Cgo+IC0tLQo+ICAuLi4vYXJtL2Rpc3Bs
YXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgICAgfCA0OSArKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IGlu
ZGV4IDM1NzgzN2I5ZDZlZC4uNjc0MGI4NDIyZjExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYwo+IEBAIC0z
NDksNyArMzQ5LDU2IEBAIHN0YXRpYyB2b2lkIGQ3MV9sYXllcl9kdW1wKHN0cnVjdCBrb21lZGFf
Y29tcG9uZW50ICpjLCBzdHJ1Y3Qgc2VxX2ZpbGUgKnNmKQo+ICAJc2VxX3ByaW50ZihzZiwgIiVz
QURfVl9DUk9QOlx0XHQweCVYXG4iLCBwcmVmaXgsIHZbMl0pOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
aW50IGQ3MV9sYXllcl92YWxpZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKPiArCQkJ
ICAgICAgc3RydWN0IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgKnN0YXRlKQo+ICt7Cj4gKwlzdHJ1
Y3Qga29tZWRhX2xheWVyX3N0YXRlICpzdCA9IHRvX2xheWVyX3N0KHN0YXRlKTsKPiArCXN0cnVj
dCBrb21lZGFfbGF5ZXIgKmxheWVyID0gdG9fbGF5ZXIoYyk7Cj4gKwlzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpwbGFuZV9zdDsKPiArCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwo+ICsJdTMy
IGZvdXJjYywgbGluZV9zeiwgbWF4X2xpbmVfc3o7Cj4gKwo+ICsJcGxhbmVfc3QgPSBkcm1fYXRv
bWljX2dldF9uZXdfcGxhbmVfc3RhdGUoc3RhdGUtPm9iai5zdGF0ZSwKPiArCQkJCQkJICBzdGF0
ZS0+cGxhbmUpOwo+ICsJZmIgPSBwbGFuZV9zdC0+ZmI7Cj4gKwlmb3VyY2MgPSBmYi0+Zm9ybWF0
LT5mb3JtYXQ7Cj4gKwo+ICsJaWYgKGRybV9yb3RhdGlvbl85MF9vcl8yNzAoc3QtPnJvdCkpCj4g
KwkJbGluZV9zeiA9IHN0LT52c2l6ZSAtIHN0LT5hZmJjX2Nyb3BfdCAtIHN0LT5hZmJjX2Nyb3Bf
YjsKPiArCWVsc2UKPiArCQlsaW5lX3N6ID0gc3QtPmhzaXplIC0gc3QtPmFmYmNfY3JvcF9sIC0g
c3QtPmFmYmNfY3JvcF9yOwo+ICsKPiArCWlmIChmYi0+bW9kaWZpZXIpIHsKPiArCQlpZiAoKGZi
LT5tb2RpZmllciAmIEFGQkNfRk9STUFUX01PRF9CTE9DS19TSVpFX01BU0spID09Cj4gKwkJCUFG
QkNfRk9STUFUX01PRF9CTE9DS19TSVpFXzMyeDgpCj4gKwkJCW1heF9saW5lX3N6ID0gbGF5ZXIt
PmxpbmVfc3o7Cj4gKwkJZWxzZQo+ICsJCQltYXhfbGluZV9zeiA9IGxheWVyLT5saW5lX3N6IC8g
MjsKPiArCj4gKwkJaWYgKGxpbmVfc3ogPiBtYXhfbGluZV9zeikgewo+ICsJCQlEUk1fREVCVUdf
QVRPTUlDKCJhZmJjIHJlcXVlc3QgbGluZV9zejogJWQgZXhjZWVkIHRoZSBtYXggYWZiYyBsaW5l
X3N6OiAlZC5cbiIsCj4gKwkJCQkJIGxpbmVfc3osIG1heF9saW5lX3N6KTsKPiArCQkJcmV0dXJu
IC1FSU5WQUw7Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWlmIChmb3VyY2MgPT0gRFJNX0ZPUk1BVF9Z
VVY0MjBfMTBCSVQgJiYgbGluZV9zeiA+IDIwNDYgJiYgKHN0LT5hZmJjX2Nyb3BfbCAlIDQpKSB7
Cj4gKwkJRFJNX0RFQlVHX0FUT01JQygiWVVWNDIwXzEwQklUIGlucHV0X2hzaXplOiAlZCBleGNl
ZWQgdGhlIG1heCBzaXplIDIwNDYuXG4iLAo+ICsJCQkJIGxpbmVfc3opOwo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICsJfQo+ICsKPiArCWlmIChmb3VyY2MgPT0gRFJNX0ZPUk1BVF9YMEwyICYmIGxp
bmVfc3ogPiAyMDQ2ICYmIChzdC0+YWRkclswXSAlIDE2KSkgewo+ICsJCURSTV9ERUJVR19BVE9N
SUMoIlgwTDIgaW5wdXRfaHNpemU6ICVkIGV4Y2VlZCB0aGUgbWF4IHNpemUgMjA0Ni5cbiIsCj4g
KwkJCQkgbGluZV9zeik7Cj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudF9mdW5j
cyBkNzFfbGF5ZXJfZnVuY3MgPSB7Cj4gKwkudmFsaWRhdGUJPSBkNzFfbGF5ZXJfdmFsaWRhdGUs
Cj4gIAkudXBkYXRlCQk9IGQ3MV9sYXllcl91cGRhdGUsCj4gIAkuZGlzYWJsZQk9IGQ3MV9sYXll
cl9kaXNhYmxlLAo+ICAJLmR1bXBfcmVnaXN0ZXIJPSBkNzFfbGF5ZXJfZHVtcCwKPiAtLSAKPiAy
LjE3LjEKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8Cnwg
Zml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8
CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/Crwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
