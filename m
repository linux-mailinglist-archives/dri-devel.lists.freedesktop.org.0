Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1924840C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C088D18;
	Mon, 17 Jun 2019 13:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CC73D88D18
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:33:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A2CC28;
 Mon, 17 Jun 2019 06:33:26 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AB533F246;
 Mon, 17 Jun 2019 06:33:26 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 260E9682413; Mon, 17 Jun 2019 14:33:25 +0100 (BST)
Date: Mon, 17 Jun 2019 14:33:25 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm/komeda: fix 32-bit komeda_crtc_update_clock_ratio
Message-ID: <20190617133325.GZ4173@e110455-lin.cambridge.arm.com>
References: <20190617125121.1414507-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617125121.1414507-1-arnd@arndb.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDI6NTE6MDRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBjbGFuZyBwb2ludHMgb3V0IGEgYnVnIGluIHRoZSBjbG9jayBjYWxjdWxhdGlvbiBv
biAzMi1iaXQsIHRoYXQgbGVhZHMKPiB0byB0aGUgY2xvY2tfcmF0aW8gYWx3YXlzIGJlaW5nIHpl
cm86Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5j
OjMxOjM2OiBlcnJvcjogc2hpZnQgY291bnQgPj0gd2lkdGggb2YgdHlwZSBbLVdlcnJvciwtV3No
aWZ0LWNvdW50LW92ZXJmbG93XQo+ICAgICAgICAgYWNsayA9IGtvbWVkYV9jYWxjX2FjbGsoa2Ny
dGNfc3QpIDw8IDMyOwo+IAo+IE1vdmUgdGhlIHNoaWZ0IGludG8gdGhlIGRpdmlzaW9uIHRvIG1h
a2UgaXQgYXBwbHkgb24gYSA2NC1iaXQKPiB2YXJpYWJsZS4gQWxzbyB1c2UgdGhlIG1vcmUgZXhw
ZW5zaXZlIGRpdjY0X3U2NCgpIGluc3RlYWQgb2YgZGl2X3U2NCgpCj4gdG8gYWNjb3VudCBmb3Ig
cHhsY2xrIGJlaW5nIGEgNjQtYml0IGludGVnZXIuCj4gCj4gRml4ZXM6IGE5NjIwOTEyMjdlZCAo
ImRybS9rb21lZGE6IEFkZCBlbmdpbmUgY2xvY2sgcmVxdWlyZW1lbnQgY2hlY2sgZm9yIHRoZSBk
b3duc2NhbGluZyIpCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5k
ZT4KCkFja2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KClRoYW5rcyBm
b3IgdGhlIHBhdGNoLCBJIHdpbGwgcHVsbCBpdCBpbnRvIHRoZSBrb21lZGEgdHJlZS4KCkJlc3Qg
cmVnYXJkcywKTGl2aXUKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21l
ZGEva29tZWRhX2NydGMuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCj4gaW5kZXggY2FmYjQ0NTdlMTg3Li4zZjIyMmY0NjRl
YjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfY3J0Yy5jCj4gQEAgLTI4LDEwICsyOCw5IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9jcnRjX3Vw
ZGF0ZV9jbG9ja19yYXRpbyhzdHJ1Y3Qga29tZWRhX2NydGNfc3RhdGUgKmtjcnRjX3N0KQo+ICAJ
fQo+ICAKPiAgCXB4bGNsayA9IGtjcnRjX3N0LT5iYXNlLmFkanVzdGVkX21vZGUuY2xvY2sgKiAx
MDAwOwo+IC0JYWNsayA9IGtvbWVkYV9jYWxjX2FjbGsoa2NydGNfc3QpIDw8IDMyOwo+ICsJYWNs
ayA9IGtvbWVkYV9jYWxjX2FjbGsoa2NydGNfc3QpOwo+ICAKPiAtCWRvX2RpdihhY2xrLCBweGxj
bGspOwo+IC0Ja2NydGNfc3QtPmNsb2NrX3JhdGlvID0gYWNsazsKPiArCWtjcnRjX3N0LT5jbG9j
a19yYXRpbyA9IGRpdjY0X3U2NChhY2xrIDw8IDMyLCBweGxjbGspOwo+ICB9Cj4gIAo+ICAvKioK
PiAtLSAKPiAyLjIwLjAKPiAKCi0tIAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlr
ZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBt
ZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjj
g4QpXy/CrwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
