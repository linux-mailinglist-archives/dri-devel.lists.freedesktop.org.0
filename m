Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD794B2CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A606E2EA;
	Wed, 19 Jun 2019 07:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F946E167
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:15:14 +0000 (UTC)
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de by smtp-ox.front (RZmta 44.24 AUTH)
 with ESMTPSA id h0a328v5IDFA13M
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Tue, 18 Jun 2019 15:15:10 +0200 (CEST)
Date: Tue, 18 Jun 2019 15:15:10 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <197277619.790831.1560863710263@webmail.strato.com>
In-Reply-To: <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 07/10] drm: rcar-du: Provide for_each_group helper
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.220.45
X-Originating-Client: open-xchange-appsuite
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1560863712; 
 s=strato-dkim-0002; d=fpond.eu;
 h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8Sk51g8h+pY9v2GEDSBxZp9Y3gDd6KLCG5Md6Pf+sao=;
 b=FIb4LX3S7Jcpc23hNI4qa8+hW9lwUAfZOi1EB09AYLgrLJ+Tv1SNXqhSTXWyn68XbB
 X8cTzqBwpRu2BM/cvV2+34AIrepkbepbH/xnlhLH7tLrgvUn/E//PPZ1tGKB1IOM5Ynk
 c24dC7qdIDlNWsc95fDTWY+G+dxX2BaQ1je+WKU6i3pKvRrXEgHn3fici0IFxdQnTgip
 4w9LKjMHiX3eHYlMSsYD92nq2p3tR0qVSXsEtA5zeCzCdbQMKHvZDZUNyzmEgz2OshQY
 d2X3y1XmWytuKIIn0TT47qO0P7Aq/bggdBRDw3z3A5KEaL/+Un8bNZyaaaPNsxGFvndm
 Hl2Q==
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cj4gT24gSnVuZSAxNywgMjAxOSBhdCAxMTowOSBQTSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4gCj4gCj4gRnJvbTog
S2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4K
PiAKPiBSZWZhY3RvcmluZyBvZiB0aGUgZ3JvdXAgY29udHJvbCBjb2RlIHdpbGwgc29vbiByZXF1
aXJlIG1vcmUgaXRlcmF0aW9uCj4gb3ZlciB0aGUgYXZhaWxhYmxlIGdyb3Vwcy4gU2ltcGxpZnkg
dGhpcyBwcm9jZXNzIGJ5IGludHJvZHVjaW5nIGEgZ3JvdXAKPiBpdGVyYXRpb24gaGVscGVyLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2Fz
QGlkZWFzb25ib2FyZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBz
aW5jZSB2MjoKPiAKPiAtIERvbid0IGFzc2lnbiBfX2dyb3VwIGluIHRoZSBjb25kaXRpb24gcGFy
dCBvZiB0aGUgZm9yIHN0YXRlbWVudCBvZiB0aGUKPiAgIGZvcl9lYWNoX3JjZHVfZ3JvdXAoKSBt
YWNybwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oIHwgIDUg
KysrKysKPiAgZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYyB8IDEwICsrLS0t
LS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2Lmgg
Yi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5oCj4gaW5kZXggMTMyN2NkMGRm
OTBhLi4wY2MwOTg0YmYyZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2
LmgKPiBAQCAtOTYsNiArOTYsMTEgQEAgc3RydWN0IHJjYXJfZHVfZGV2aWNlIHsKPiAgCXVuc2ln
bmVkIGludCB2c3BkMV9zaW5rOwo+ICB9Owo+ICAKPiArI2RlZmluZSBmb3JfZWFjaF9yY2R1X2dy
b3VwKF9fcmNkdSwgX19ncm91cCwgX19pKSBcCj4gKwlmb3IgKChfX2kpID0gMCwgKF9fZ3JvdXAp
ID0gJihfX3JjZHUpLT5ncm91cHNbMF07IFwKPiArCSAgICAgKF9faSkgPCBESVZfUk9VTkRfVVAo
KF9fcmNkdSktPm51bV9jcnRjcywgMik7IFwKPiArCSAgICAgX19pKyssIF9fZ3JvdXArKykKPiAr
Cj4gIHN0YXRpYyBpbmxpbmUgYm9vbCByY2FyX2R1X2hhcyhzdHJ1Y3QgcmNhcl9kdV9kZXZpY2Ug
KnJjZHUsCj4gIAkJCSAgICAgICB1bnNpZ25lZCBpbnQgZmVhdHVyZSkKPiAgewo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYwo+IGluZGV4IDE0NGMwYzFiMTU5MS4uYzA0MTM2Njc0
ZTU4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfa21zLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jCj4gQEAgLTYyNyw5
ICs2MjcsOSBAQCBpbnQgcmNhcl9kdV9tb2Rlc2V0X2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNl
ICpyY2R1KQo+ICAKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSByY2R1LT5kZGV2Owo+ICAJ
c3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwo+ICsJc3RydWN0IHJjYXJfZHVfZ3JvdXAgKnJn
cnA7Cj4gIAl1bnNpZ25lZCBpbnQgZHBhZDBfc291cmNlczsKPiAgCXVuc2lnbmVkIGludCBudW1f
ZW5jb2RlcnM7Cj4gLQl1bnNpZ25lZCBpbnQgbnVtX2dyb3VwczsKPiAgCXVuc2lnbmVkIGludCBz
d2luZGV4Owo+ICAJdW5zaWduZWQgaW50IGh3aW5kZXg7Cj4gIAl1bnNpZ25lZCBpbnQgaTsKPiBA
QCAtNjcwLDExICs2NzAsNyBAQCBpbnQgcmNhcl9kdV9tb2Rlc2V0X2luaXQoc3RydWN0IHJjYXJf
ZHVfZGV2aWNlICpyY2R1KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICAJLyogSW5pdGlhbGl6ZSB0
aGUgZ3JvdXBzLiAqLwo+IC0JbnVtX2dyb3VwcyA9IERJVl9ST1VORF9VUChyY2R1LT5udW1fY3J0
Y3MsIDIpOwo+IC0KPiAtCWZvciAoaSA9IDA7IGkgPCBudW1fZ3JvdXBzOyArK2kpIHsKPiAtCQlz
dHJ1Y3QgcmNhcl9kdV9ncm91cCAqcmdycCA9ICZyY2R1LT5ncm91cHNbaV07Cj4gLQo+ICsJZm9y
X2VhY2hfcmNkdV9ncm91cChyY2R1LCByZ3JwLCBpKSB7Cj4gIAkJbXV0ZXhfaW5pdCgmcmdycC0+
bG9jayk7Cj4gIAo+ICAJCXJncnAtPmRldiA9IHJjZHU7Cj4gQEAgLTcxMSw4ICs3MDcsNiBAQCBp
bnQgcmNhcl9kdV9tb2Rlc2V0X2luaXQoc3RydWN0IHJjYXJfZHVfZGV2aWNlICpyY2R1KQo+ICAK
PiAgCS8qIENyZWF0ZSB0aGUgQ1JUQ3MuICovCj4gIAlmb3IgKHN3aW5kZXggPSAwLCBod2luZGV4
ID0gMDsgc3dpbmRleCA8IHJjZHUtPm51bV9jcnRjczsgKytod2luZGV4KSB7Cj4gLQkJc3RydWN0
IHJjYXJfZHVfZ3JvdXAgKnJncnA7Cj4gLQo+ICAJCS8qIFNraXAgdW5wb3B1bGF0ZWQgRFUgY2hh
bm5lbHMuICovCj4gIAkJaWYgKCEocmNkdS0+aW5mby0+Y2hhbm5lbHNfbWFzayAmIEJJVChod2lu
ZGV4KSkpCj4gIAkJCWNvbnRpbnVlOwo+IC0tIAo+IFJlZ2FyZHMsCj4gCj4gTGF1cmVudCBQaW5j
aGFydAo+CgpSZXZpZXdlZC1ieTogVWxyaWNoIEhlY2h0IDx1bGkrcmVuZXNhc0BmcG9uZC5ldT4K
CkNVClVsaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
