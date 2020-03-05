Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44FA17AE59
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 19:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CB36E34D;
	Thu,  5 Mar 2020 18:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A2BAE6E34E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 18:42:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30B7830E;
 Thu,  5 Mar 2020 10:42:57 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10DE03F6CF;
 Thu,  5 Mar 2020 10:42:57 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id C241F682F35; Thu,  5 Mar 2020 18:42:55 +0000 (GMT)
Date: Thu, 5 Mar 2020 18:42:55 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: Re: [PATCH] drm: komeda: Make rt_pm_ops dependent on CONFIG_PM
Message-ID: <20200305184255.GH364558@e110455-lin.cambridge.arm.com>
References: <20200304145412.33936-1-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304145412.33936-1-vincenzo.frascino@arm.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMDQsIDIwMjAgYXQgMDI6NTQ6MTJQTSArMDAwMCwgVmluY2Vuem8gRnJhc2Np
bm8gd3JvdGU6Cj4ga29tZWRhX3J0X3BtX3N1c3BlbmQoKSBhbmQga29tZWRhX3J0X3BtX3Jlc3Vt
ZSgpIGFyZSBjb21waWxlZCBvbmx5IHdoZW4KPiBDT05GSUdfUE0gaXMgZW5hYmxlZC4gSGF2aW5n
IGl0IGRpc2FibGVkIHRyaWdnZXJzIHRoZSBmb2xsb3dpbmcgd2FybmluZwo+IGF0IGNvbXBpbGUg
dGltZToKPiAKPiBsaW51eC9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kcnYuYzoxNTY6MTI6Cj4gd2FybmluZzog4oCYa29tZWRhX3J0X3BtX3Jlc3VtZeKAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4gIHN0YXRpYyBpbnQga29tZWRh
X3J0X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fgo+IGxpbnV4L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rydi5jOjE0OToxMjoKPiB3YXJuaW5nOiDigJhrb21lZGFfcnRfcG1fc3VzcGVuZOKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtZnVuY3Rpb25dCj4gIHN0YXRpYyBpbnQga29t
ZWRhX3J0X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+IAo+IE1ha2Uga29tZWRhX3J0
X3BtX3N1c3BlbmQoKSBhbmQga29tZWRhX3J0X3BtX3Jlc3VtZSgpIGRlcGVuZGVudCBvbgo+IENP
TkZJR19QTSB0byBhZGRyZXNzIHRoZSBpc3N1ZS4KPiAKPiBDYzogIkphbWVzIChRaWFuKSBXYW5n
IiA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Cj4gQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRh
dUBhcm0uY29tPgo+IENjOiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5j
b20+Cj4gQ2M6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gU2lnbmVkLW9mZi1ieTogVmluY2Vuem8gRnJhc2Npbm8gPHZpbmNlbnpvLmZy
YXNjaW5vQGFybS5jb20+CgpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5j
b20+CgpUaGFua3MgZm9yIHRoZSBwYXRjaCwgSSB3aWxsIHB1c2ggaXQgaW50byBkcm0tbWlzYy1m
aXhlcyB0b21vcnJvdy4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZHJ2LmMKPiBpbmRleCBlYTVjZDFlMTczMDQuLmRkM2FlM2Q4ODY4
NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rydi5jCj4gQEAgLTE0Niw2ICsxNDYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBrb21lZGFfb2ZfbWF0Y2hbXSA9IHsKPiAgCj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IGtvbWVkYV9vZl9tYXRjaCk7Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1BNCj4gIHN0YXRpYyBpbnQg
a29tZWRhX3J0X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3Qg
a29tZWRhX2RydiAqbWRydiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+IEBAIC0xNTksNiArMTYw
LDcgQEAgc3RhdGljIGludCBrb21lZGFfcnRfcG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikK
PiAgCj4gIAlyZXR1cm4ga29tZWRhX2Rldl9yZXN1bWUobWRydi0+bWRldik7Cj4gIH0KPiArI2Vu
ZGlmIC8qIENPTkZJR19QTSAqLwo+ICAKPiAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBrb21l
ZGFfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiAtLSAKPiAyLjI1LjEKPiAK
Ci0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3
b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJj
ZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
