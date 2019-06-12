Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10654425CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4180589453;
	Wed, 12 Jun 2019 12:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A63089453
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:30:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60FCC5D619;
 Wed, 12 Jun 2019 12:30:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E05907BE69;
 Wed, 12 Jun 2019 12:30:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E699C16E05; Wed, 12 Jun 2019 14:30:08 +0200 (CEST)
Date: Wed, 12 Jun 2019 14:30:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/9] drm/gem-vram: Support pinning buffers to current
 location
Message-ID: <20190612123008.nnckny45ow3tex6b@sirius.home.kraxel.org>
References: <20190611130344.18988-1-tzimmermann@suse.de>
 <20190611130344.18988-2-tzimmermann@suse.de>
 <20190612081332.2p7zvoiz6dzs3sho@sirius.home.kraxel.org>
 <434228c1-4480-1c40-0ff4-668c26cbf554@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <434228c1-4480-1c40-0ff4-668c26cbf554@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 12 Jun 2019 12:30:20 +0000 (UTC)
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6Mjk6MjlBTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSGkKPiAKPiBBbSAxMi4wNi4xOSB1bSAxMDoxMyBzY2hyaWViIEdlcmQgSG9m
Zm1hbm46Cj4gPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwMzowMzozNlBNICswMjAwLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToKPiA+PiBQaW5uaW5nIGEgYnVmZmVyIHByZXZlbnRzIGl0IGZy
b20gYmVpbmcgbW92ZWQgdG8gYSBkaWZmZXJlbnQgbWVtb3J5Cj4gPj4gbG9jYXRpb24uIEZvciBz
b21lIG9wZXJhdGlvbnMsIHN1Y2ggYXMgYnVmZmVyIHVwZGF0ZXMsIGl0IGlzIG5vdAo+ID4+IGlt
cG9ydGFudCB3aGVyZSB0aGUgYnVmZmVyIGlzIGxvY2F0ZWQuIFNldHRpbmcgdGhlIHBpbiBmdW5j
dGlvbidzCj4gPj4gcGxfZmxhZyBhcmd1bWVudCB0byAwIHdpbGwgcGluIHRoZSBidWZmZXIgdG8g
d2hlcmVldmVyIGl0IGlzIHN0b3JlZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+ID4+IC0tLQo+ID4+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMTIgKysrKysrKystLS0tCj4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiA+PiBpbmRleCA0MmFkODA4ODhkZjcuLjIx
NGY1NGI4OTIwYiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jCj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIu
Ywo+ID4+IEBAIC0yMjQsNyArMjI0LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3ZyYW1fb2Zm
c2V0KTsKPiA+PiAgICoKPiA+PiAgICogUGlubmluZyBhIGJ1ZmZlciBvYmplY3QgZW5zdXJlcyB0
aGF0IGl0IGlzIG5vdCBldmljdGVkIGZyb20KPiA+PiAgICogYSBtZW1vcnkgcmVnaW9uLiBBIHBp
bm5lZCBidWZmZXIgb2JqZWN0IGhhcyB0byBiZSB1bnBpbm5lZCBiZWZvcmUKPiA+PiAtICogaXQg
Y2FuIGJlIHBpbm5lZCB0byBhbm90aGVyIHJlZ2lvbi4KPiA+PiArICogaXQgY2FuIGJlIHBpbm5l
ZCB0byBhbm90aGVyIHJlZ2lvbi4gSWYgdGhlIHBsX2ZsYWcgYXJndW1lbnQgaXMgMCwKPiA+PiAr
ICogdGhlIGJ1ZmZlciBpcyBwaW5uZWQgYXQgaXRzIGN1cnJlbnQgbG9jYXRpb24gKHZpZGVvIFJB
TSBvciBzeXN0ZW0KPiA+PiArICogbWVtb3J5KS4KPiA+PiAgICoKPiA+PiAgICogUmV0dXJuczoK
PiA+PiAgICogMCBvbiBzdWNjZXNzLCBvcgo+ID4+IEBAIC0yNDIsNyArMjQ0LDkgQEAgaW50IGRy
bV9nZW1fdnJhbV9waW4oc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywgdW5zaWduZWQg
bG9uZyBwbF9mbGFnKQo+ID4+ICAJaWYgKGdiby0+cGluX2NvdW50KQo+ID4+ICAJCWdvdG8gb3V0
Owo+ID4+ICAKPiA+PiAtCWRybV9nZW1fdnJhbV9wbGFjZW1lbnQoZ2JvLCBwbF9mbGFnKTsKPiA+
PiArCWlmIChwbF9mbGFnKQo+ID4+ICsJCWRybV9nZW1fdnJhbV9wbGFjZW1lbnQoZ2JvLCBwbF9m
bGFnKTsKPiA+PiArCj4gPj4gIAlmb3IgKGkgPSAwOyBpIDwgZ2JvLT5wbGFjZW1lbnQubnVtX3Bs
YWNlbWVudDsgKytpKQo+ID4+ICAJCWdiby0+cGxhY2VtZW50c1tpXS5mbGFncyB8PSBUVE1fUExf
RkxBR19OT19FVklDVDsKPiA+PiAgCj4gPj4gQEAgLTY5MSw3ICs2OTUsNyBAQCBpbnQgZHJtX2dl
bV92cmFtX2RyaXZlcl9nZW1fcHJpbWVfcGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtKQo+
ID4+ICB7Cj4gPj4gIAlzdHJ1Y3QgZHJtX2dlbV92cmFtX29iamVjdCAqZ2JvID0gZHJtX2dlbV92
cmFtX29mX2dlbShnZW0pOwo+ID4+ICAKPiA+PiAtCXJldHVybiBkcm1fZ2VtX3ZyYW1fcGluKGdi
bywgRFJNX0dFTV9WUkFNX1BMX0ZMQUdfVlJBTSk7Cj4gPj4gKwlyZXR1cm4gZHJtX2dlbV92cmFt
X3BpbihnYm8sIDApOwo+IAo+IFRoZSBvbmx5IHVzZSBjYXNlIGZvciB0aGVzZSBQcmltZSBoZWxw
ZXJzIGlzIGZiZGV2IGNvbnNvbGUgZW11bGF0aW9uLiBJCj4gaGF2ZSBhbm90aGVyIHBhdGNoIHNl
dCB0aGF0IHJlcGxhY2VzIHRoZSBhc3QgYW5kIG1nYWcyMDAgY29uc29sZXMgd2l0aAo+IGdlbmVy
aWMgY29kZS4gRHVyaW5nIHRoZSBjb25zb2xlIHVwZGF0ZXMgaXQgdGVtcG9yYXJpbHkgcGlucyB0
aGUgQk8gdmlhCj4gdGhpcyBQcmltZSBmdW5jYXRpb24sIHdoaWNoIG1pZ2h0IG1vdmUgdGhlIEJP
IGludG8gc2NhcmNlIFZSQU0KPiB1bm5lY2Vzc2FyaWx5LgoKT2ssIGlmIHRoZSBwaW4gaXMgdGVt
cG9yYXJ5IG9ubHkgZm9yIHRoZSB1cGRhdGUgdGhpcyBzaG91bGQgYmUgZmluZS4KCj4gQ2FuIHdl
IGxlYXZlIGl0IGxpa2UgdGhpcyBhbmQgYWRkIGEgY29tbWVudCBleHBsYWluaW5nCj4gdGhlIGRl
Y2lzaW9uPwoKWWVzLCBhIGNvbW1lbnQgaXMgYSBnb29kIGlkZWEuCgpjaGVlcnMsCiAgR2VyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
