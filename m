Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7141EBD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E218893D0;
	Wed, 12 Jun 2019 08:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AB2893C9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:13:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 95C4B223870;
 Wed, 12 Jun 2019 08:13:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 135E31001B10;
 Wed, 12 Jun 2019 08:13:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 45DA316E05; Wed, 12 Jun 2019 10:13:32 +0200 (CEST)
Date: Wed, 12 Jun 2019 10:13:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/9] drm/gem-vram: Support pinning buffers to current
 location
Message-ID: <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611130344.18988-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 08:13:44 +0000 (UTC)
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMDM6MDM6MzZQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gUGlubmluZyBhIGJ1ZmZlciBwcmV2ZW50cyBpdCBmcm9tIGJlaW5nIG1vdmVk
IHRvIGEgZGlmZmVyZW50IG1lbW9yeQo+IGxvY2F0aW9uLiBGb3Igc29tZSBvcGVyYXRpb25zLCBz
dWNoIGFzIGJ1ZmZlciB1cGRhdGVzLCBpdCBpcyBub3QKPiBpbXBvcnRhbnQgd2hlcmUgdGhlIGJ1
ZmZlciBpcyBsb2NhdGVkLiBTZXR0aW5nIHRoZSBwaW4gZnVuY3Rpb24ncwo+IHBsX2ZsYWcgYXJn
dW1lbnQgdG8gMCB3aWxsIHBpbiB0aGUgYnVmZmVyIHRvIHdoZXJlZXZlciBpdCBpcyBzdG9yZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAxMiAr
KysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiBpbmRleCA0MmFk
ODA4ODhkZjcuLjIxNGY1NGI4OTIwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYwo+IEBAIC0yMjQsNyArMjI0LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1f
b2Zmc2V0KTsKPiAgICoKPiAgICogUGlubmluZyBhIGJ1ZmZlciBvYmplY3QgZW5zdXJlcyB0aGF0
IGl0IGlzIG5vdCBldmljdGVkIGZyb20KPiAgICogYSBtZW1vcnkgcmVnaW9uLiBBIHBpbm5lZCBi
dWZmZXIgb2JqZWN0IGhhcyB0byBiZSB1bnBpbm5lZCBiZWZvcmUKPiAtICogaXQgY2FuIGJlIHBp
bm5lZCB0byBhbm90aGVyIHJlZ2lvbi4KPiArICogaXQgY2FuIGJlIHBpbm5lZCB0byBhbm90aGVy
IHJlZ2lvbi4gSWYgdGhlIHBsX2ZsYWcgYXJndW1lbnQgaXMgMCwKPiArICogdGhlIGJ1ZmZlciBp
cyBwaW5uZWQgYXQgaXRzIGN1cnJlbnQgbG9jYXRpb24gKHZpZGVvIFJBTSBvciBzeXN0ZW0KPiAr
ICogbWVtb3J5KS4KPiAgICoKPiAgICogUmV0dXJuczoKPiAgICogMCBvbiBzdWNjZXNzLCBvcgo+
IEBAIC0yNDIsNyArMjQ0LDkgQEAgaW50IGRybV9nZW1fdnJhbV9waW4oc3RydWN0IGRybV9nZW1f
dnJhbV9vYmplY3QgKmdibywgdW5zaWduZWQgbG9uZyBwbF9mbGFnKQo+ICAJaWYgKGdiby0+cGlu
X2NvdW50KQo+ICAJCWdvdG8gb3V0Owo+ICAKPiAtCWRybV9nZW1fdnJhbV9wbGFjZW1lbnQoZ2Jv
LCBwbF9mbGFnKTsKPiArCWlmIChwbF9mbGFnKQo+ICsJCWRybV9nZW1fdnJhbV9wbGFjZW1lbnQo
Z2JvLCBwbF9mbGFnKTsKPiArCj4gIAlmb3IgKGkgPSAwOyBpIDwgZ2JvLT5wbGFjZW1lbnQubnVt
X3BsYWNlbWVudDsgKytpKQo+ICAJCWdiby0+cGxhY2VtZW50c1tpXS5mbGFncyB8PSBUVE1fUExf
RkxBR19OT19FVklDVDsKPiAgCj4gQEAgLTY5MSw3ICs2OTUsNyBAQCBpbnQgZHJtX2dlbV92cmFt
X2RyaXZlcl9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKQo+ICB7Cj4g
IAlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvID0gZHJtX2dlbV92cmFtX29mX2dlbShn
ZW0pOwo+ICAKPiAtCXJldHVybiBkcm1fZ2VtX3ZyYW1fcGluKGdibywgRFJNX0dFTV9WUkFNX1BM
X0ZMQUdfVlJBTSk7Cj4gKwlyZXR1cm4gZHJtX2dlbV92cmFtX3BpbihnYm8sIDApOwoKTm90IHN1
cmUgdGhpcyBpcyBhIGdvb2QgaWRlYSBoZXJlLiAgSWYgdGhlIGJvIGhhcHBlbnMgdG8gYmUgaW4g
c3lzcmFtCml0IGNhbid0IGJlIGRpc3BsYXllZCBhbnkgbW9yZS4KCj4gLQlyZXQgPSBkcm1fZ2Vt
X3ZyYW1fcGluKGdibywgRFJNX0dFTV9WUkFNX1BMX0ZMQUdfVlJBTSk7Cj4gKwlyZXQgPSBkcm1f
Z2VtX3ZyYW1fcGluKGdibywgMCk7CgpMaWtld2lzZS4KCmNoZWVycywKICBHZXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
