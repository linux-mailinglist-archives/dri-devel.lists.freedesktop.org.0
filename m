Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A156B73B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0126E26F;
	Wed, 17 Jul 2019 07:08:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC25789FA7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 13:33:48 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v6GDXlcYx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 16 Jul 2019 15:33:47 +0200 (CEST)
Date: Tue, 16 Jul 2019 15:33:47 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
 laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
Message-ID: <744338423.62787.1563284027376@webmail.strato.com>
In-Reply-To: <20190706140746.29132-20-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-20-jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v2 19/19] drm: rcar-du: kms: Update CMM in atomic commit
 tail
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-IP: 85.212.152.154
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1563284027; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=YA+JbVt6PLR9gPJLCe+SSmvEZqhUKqEKXMbM82smQgo=;
 b=frlWAzwp6QgdvGgi9Be2984UgyL9e8m+wIo1QzIpXGlBm1amRqgH8ep3CcztVZdJrn
 wrDyo2yXyzw0L3qu5BWQMogAcpwlvXE79euNxk8MDpzhm7XpTWjbt5uZix0MWk5UFIIz
 ca0Ga/s/SCcnNBZDzMWQy8mw8uavFiRErKWWKbNf8iUIlfIiwOqpbDJqyGBOgB0xj6oA
 /qm5MEJhH67p8HBDlBm8ouVv0N8zd/4GdHFZ2I78HwByRTp73i6vkbzZILG64YOCKDwz
 ndN2hh9qeIw3MXERw68yE7/HOYuhgb5qNrKG8Di8XmordoOWZMUORxDpt1yHWNlsl0xA
 9liA==
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVseSA2LCAyMDE5IGF0IDQ6MDcgUE0gSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNh
c0BqbW9uZGkub3JnPiB3cm90ZToKPiAKPiAKPiBVcGRhdGUgQ01NIHNldHRpbmdzIGF0IGluIHRo
ZSBhdG9taWMgY29tbWl0IHRhaWwgaGVscGVyIG1ldGhvZC4KPiAKPiBUaGUgQ01NIGlzIHVwZGF0
ZWQgd2l0aCBuZXcgZ2FtbWEgdmFsdWVzIHByb3ZpZGVkIHRvIHRoZSBkcml2ZXIKPiBpbiB0aGUg
R0FNTUFfTFVUIGJsb2IgcHJvcGVydHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRp
IDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNh
ci1kdS9yY2FyX2R1X2ttcy5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9y
Y2FyX2R1X2ttcy5jCj4gaW5kZXggYjc5Y2RhMmY1NTMxLi5mOWFlY2U3OGNhNWYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMKPiBAQCAtMjEsNiArMjEsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4K
PiAgCj4gKyNpbmNsdWRlICJyY2FyX2NtbS5oIgo+ICAjaW5jbHVkZSAicmNhcl9kdV9jcnRjLmgi
Cj4gICNpbmNsdWRlICJyY2FyX2R1X2Rydi5oIgo+ICAjaW5jbHVkZSAicmNhcl9kdV9lbmNvZGVy
LmgiCj4gQEAgLTI4Nyw2ICsyODgsMzcgQEAgcmNhcl9kdV9mYl9jcmVhdGUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsCj4gICAqIEF0b21pYyBDaGVj
ayBhbmQgVXBkYXRlCj4gICAqLwo+ICAKPiArc3RhdGljIHZvaWQgcmNhcl9kdV9hdG9taWNfY29t
bWl0X3VwZGF0ZV9jbW0oc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICsJCQkJCSAgICAgc3RydWN0
IGRybV9jcnRjX3N0YXRlICpvbGRfc3RhdGUpCj4gK3sKPiArCXN0cnVjdCByY2FyX2R1X2NydGMg
KnJjcnRjID0gdG9fcmNhcl9jcnRjKGNydGMpOwo+ICsJc3RydWN0IHJjYXJfY21tX2NvbmZpZyBj
bW1fY29uZmlnID0ge307Cj4gKwo+ICsJaWYgKCFyY3J0Yy0+Y21tIHx8ICFjcnRjLT5zdGF0ZS0+
Y29sb3JfbWdtdF9jaGFuZ2VkKQo+ICsJCXJldHVybjsKPiArCj4gKwlpZiAoIWNydGMtPnN0YXRl
LT5nYW1tYV9sdXQpIHsKPiArCQljbW1fY29uZmlnLmx1dC5lbmFibGUgPSBmYWxzZTsKPiArCQly
Y2FyX2NtbV9zZXR1cChyY3J0Yy0+Y21tLCAmY21tX2NvbmZpZyk7Cj4gKwo+ICsJCXJldHVybjsK
PiArCX0KPiArCj4gKwljbW1fY29uZmlnLmx1dC5lbmFibGUgPSB0cnVlOwo+ICsJY21tX2NvbmZp
Zy5sdXQudGFibGUgPSAoc3RydWN0IGRybV9jb2xvcl9sdXQgKikKPiArCQkJICAgICAgIGNydGMt
PnN0YXRlLT5nYW1tYV9sdXQtPmRhdGE7Cj4gKwo+ICsJLyogU2V0IExVVCB0YWJsZSBzaXplIHRv
IDAgaWYgZW50cmllcyBzaG91bGQgbm90IGJlIHVwZGF0ZWQuICovCj4gKwlpZiAoIW9sZF9zdGF0
ZS0+Z2FtbWFfbHV0IHx8Cj4gKwkgICAgb2xkX3N0YXRlLT5nYW1tYV9sdXQtPmJhc2UuaWQgIT0g
Y3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCkKPiArCQljbW1fY29uZmlnLmx1dC5zaXpl
ID0gY3J0Yy0+c3RhdGUtPmdhbW1hX2x1dC0+bGVuZ3RoCj4gKwkJCQkgICAgLyBzaXplb2YoY21t
X2NvbmZpZy5sdXQudGFibGVbMF0pOwo+ICsJZWxzZQo+ICsJCWNtbV9jb25maWcubHV0LnNpemUg
PSAwOwo+ICsKPiArCXJjYXJfY21tX3NldHVwKHJjcnRjLT5jbW0sICZjbW1fY29uZmlnKTsKPiAr
fQo+ICsKPiAgc3RhdGljIGludCByY2FyX2R1X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAo+ICAJCQkJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQo+ICB7Cj4gQEAg
LTMyOSw2ICszNjEsOSBAQCBzdGF0aWMgdm9pZCByY2FyX2R1X2F0b21pY19jb21taXRfdGFpbChz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0YXRlKQo+ICAJCQlyY2R1LT5kcGFkMV9zb3Vy
Y2UgPSByY3J0Yy0+aW5kZXg7Cj4gIAl9Cj4gIAo+ICsJZm9yX2VhY2hfb2xkX2NydGNfaW5fc3Rh
dGUob2xkX3N0YXRlLCBjcnRjLCBjcnRjX3N0YXRlLCBpKQo+ICsJCXJjYXJfZHVfYXRvbWljX2Nv
bW1pdF91cGRhdGVfY21tKGNydGMsIGNydGNfc3RhdGUpOwo+ICsKPiAgCS8qIEFwcGx5IHRoZSBh
dG9taWMgdXBkYXRlLiAqLwo+ICAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X21vZGVzZXRfZGlz
YWJsZXMoZGV2LCBvbGRfc3RhdGUpOwo+ICAJZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5l
cyhkZXYsIG9sZF9zdGF0ZSwKPiAtLSAKPiAyLjIxLjAKPgoKUmV2aWV3ZWQtYnk6IFVscmljaCBI
ZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+CgpDVQpVbGkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
