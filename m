Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6512A98D47
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7216EAB3;
	Thu, 22 Aug 2019 08:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2019 12:45:33 UTC
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BCD6E32A;
 Wed, 21 Aug 2019 12:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 87DFD3F64D;
 Wed, 21 Aug 2019 14:40:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gkTpkATloo1q; Wed, 21 Aug 2019 14:40:08 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id A3E683F625;
 Wed, 21 Aug 2019 14:40:07 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C92E73602D6;
 Wed, 21 Aug 2019 14:40:06 +0200 (CEST)
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <a9190400-2414-8d83-0f37-61eb0f16504a@shipmail.org>
Date: Wed, 21 Aug 2019 14:40:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820145336.15649-4-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 22 Aug 2019 08:14:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1566391206; bh=wRXVrVRWF3g6grMnJm9yDgdZTPP0+6fzUt3U8nK0rQA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QDoREcgLwziJNVxhYI+yj69PaQAlDwS7fpQAMlYYV1ge5FoX2//u7OImjfrtO2u3y
 Dv+9MGRPSiU0vcVxM/K5eRcZGYKv4M71d7DsekRht4OaqVM5e3G93ebxOjQ6OhzSKq
 4iq8rWwgdnTY9ERlYouayrP39bk2CsEMITt961/4=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=QDoREcgL; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8xOSA0OjUzIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFdpdGggbm91dmVhdSBm
aXhlZCBhbGwgdHRtLXVzaW5nIGRyaXZlcyBoYXZlIHRoZSBjb3JyZWN0IG5lc3Rpbmcgb2YKPiBt
bWFwX3NlbSB2cyBkbWFfcmVzdiwgYW5kIHdlIGNhbiBqdXN0IGxvY2sgdGhlIGJ1ZmZlci4KPgo+
IEFzc3VtaW5nIEkgZGlkbid0IHNjcmV3IHVwIGFueXRoaW5nIHdpdGggbXkgYXVkaXQgb2YgY291
cnNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
PiBDYzogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8
a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6ICJWTXdhcmUgR3JhcGhpY3MiIDxsaW51eC1ncmFwaGlj
cy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ry
b21Adm13YXJlLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAg
fCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3ZtLmMgfCAyNiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBpbmNs
dWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgIDEgLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNjAgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBpbmRl
eCAyMGZmNTZmMjdhYTQuLmE5NTJkZDYyNGIwNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBA
IC0xOTU0LDM3ICsxOTU0LDMgQEAgdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwoc3RydWN0IHR0bV9i
b19kZXZpY2UgKmJkZXYpCj4gICAJCTsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3N3
YXBvdXRfYWxsKTsKPiAtCj4gLS8qKgo+IC0gKiB0dG1fYm9fd2FpdF91bnJlc2VydmVkIC0gaW50
ZXJydXB0aWJsZSB3YWl0IGZvciBhIGJ1ZmZlciBvYmplY3QgdG8gYmVjb21lCj4gLSAqIHVucmVz
ZXJ2ZWQKPiAtICoKPiAtICogQGJvOiBQb2ludGVyIHRvIGJ1ZmZlcgo+IC0gKi8KPiAtaW50IHR0
bV9ib193YWl0X3VucmVzZXJ2ZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiAtewo+
IC0JaW50IHJldDsKPiAtCj4gLQkvKgo+IC0JICogSW4gdGhlIGFic2Vuc2Ugb2YgYSB3YWl0X3Vu
bG9ja2VkIEFQSSwKPiAtCSAqIFVzZSB0aGUgYm86Ond1X211dGV4IHRvIGF2b2lkIHRyaWdnZXJp
bmcgbGl2ZWxvY2tzIGR1ZSB0bwo+IC0JICogY29uY3VycmVudCB1c2Ugb2YgdGhpcyBmdW5jdGlv
bi4gTm90ZSB0aGF0IHRoaXMgdXNlIG9mCj4gLQkgKiBibzo6d3VfbXV0ZXggY2FuIGdvIGF3YXkg
aWYgd2UgY2hhbmdlIGxvY2tpbmcgb3JkZXIgdG8KPiAtCSAqIG1tYXBfc2VtIC0+IGJvOjpyZXNl
cnZlLgo+IC0JICovCj4gLQlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmJvLT53dV9t
dXRleCk7Cj4gLQlpZiAodW5saWtlbHkocmV0ICE9IDApKQo+IC0JCXJldHVybiAtRVJFU1RBUlRT
WVM7Cj4gLQlpZiAoIWRtYV9yZXN2X2lzX2xvY2tlZChiby0+YmFzZS5yZXN2KSkKPiAtCQlnb3Rv
IG91dF91bmxvY2s7Cj4gLQlyZXQgPSBkbWFfcmVzdl9sb2NrX2ludGVycnVwdGlibGUoYm8tPmJh
c2UucmVzdiwgTlVMTCk7Cj4gLQlpZiAocmV0ID09IC1FSU5UUikKPiAtCQlyZXQgPSAtRVJFU1RB
UlRTWVM7Cj4gLQlpZiAodW5saWtlbHkocmV0ICE9IDApKQo+IC0JCWdvdG8gb3V0X3VubG9jazsK
PiAtCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsKPiAtCj4gLW91dF91bmxvY2s6Cj4g
LQltdXRleF91bmxvY2soJmJvLT53dV9tdXRleCk7Cj4gLQlyZXR1cm4gcmV0Owo+IC19Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jCj4gaW5kZXggNzZlZWRiOTYzNjkzLi41MDVlMTc4N2FlZWEgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBAQCAtMTI1LDMxICsxMjUsNyBAQCBzdGF0aWMg
dm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gICAJCSZi
ZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV07Cj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0IGN2
bWE7Cj4gICAKPiAtCS8qCj4gLQkgKiBXb3JrIGFyb3VuZCBsb2NraW5nIG9yZGVyIHJldmVyc2Fs
IGluIGZhdWx0IC8gbm9wZm4KPiAtCSAqIGJldHdlZW4gbW1hcF9zZW0gYW5kIGJvX3Jlc2VydmU6
IFBlcmZvcm0gYSB0cnlsb2NrIG9wZXJhdGlvbgo+IC0JICogZm9yIHJlc2VydmUsIGFuZCBpZiBp
dCBmYWlscywgcmV0cnkgdGhlIGZhdWx0IGFmdGVyIHdhaXRpbmcKPiAtCSAqIGZvciB0aGUgYnVm
ZmVyIHRvIGJlY29tZSB1bnJlc2VydmVkLgo+IC0JICovCj4gLQlpZiAodW5saWtlbHkoIWRtYV9y
ZXN2X3RyeWxvY2soYm8tPmJhc2UucmVzdikpKSB7Cj4gLQkJaWYgKHZtZi0+ZmxhZ3MgJiBGQVVM
VF9GTEFHX0FMTE9XX1JFVFJZKSB7Cj4gLQkJCWlmICghKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFH
X1JFVFJZX05PV0FJVCkpIHsKPiAtCQkJCXR0bV9ib19nZXQoYm8pOwo+IC0JCQkJdXBfcmVhZCgm
dm1mLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7Cj4gLQkJCQkodm9pZCkgdHRtX2JvX3dhaXRfdW5y
ZXNlcnZlZChibyk7Cj4gLQkJCQl0dG1fYm9fcHV0KGJvKTsKPiAtCQkJfQo+IC0KPiAtCQkJcmV0
dXJuIFZNX0ZBVUxUX1JFVFJZOwo+IC0JCX0KPiAtCj4gLQkJLyoKPiAtCQkgKiBJZiB3ZSdkIHdh
bnQgdG8gY2hhbmdlIGxvY2tpbmcgb3JkZXIgdG8KPiAtCQkgKiBtbWFwX3NlbSAtPiBibzo6cmVz
ZXJ2ZSwgd2UnZCB1c2UgYSBibG9ja2luZyByZXNlcnZlIGhlcmUKPiAtCQkgKiBpbnN0ZWFkIG9m
IHJldHJ5aW5nIHRoZSBmYXVsdC4uLgo+IC0JCSAqLwoKSSB0aGluayB5b3Ugc2hvdWxkIGp1c3Rp
Znkgd2h5IHRoZSBhYm92ZSBjb2RlIGlzIHJlbW92ZWQsIHNpbmNlIHRoZSAKY29tbWVudHMgYWN0
dWFsbHkgb3V0bGluZXMgd2hhdCB0byBkbyBpZiB3ZSBjaGFuZ2UgbG9ja2luZyBvcmRlci4KClRo
ZSBjb2RlIHRoYXQncyByZW1vdmVkIGFib3ZlIGlzIG5vdCBmb3IgYWRqdXN0aW5nIGxvY2tpbmcg
b3JkZXJzIGJ1dCB0byAKZGVjcmVhc2UgdGhlIG1tIGxhdGVuY3kgYnkgcmVsZWFzaW5nIHRoZSBt
bWFwX3NlbSB3aGlsZSB3YWl0aW5nIGZvciBibyAKcmVzZXJ2ZSB3aGljaCBpbiB0dXJuIG1pZ2h0
IGJlIHdhaXRpbmcgZm9yIEdQVS4gQXQgYSBtaW5pbXVtIHdlIHNob3VsZCAKaGF2ZSBhIHNlcGFy
YXRlIHBhdGNoIHdpdGgganVzdGlmaWNhdGlvbi4KCk5vdGUgdGhhdCB0aGUgY2FsbGVyIGhlcmUg
ZW5zdXJlcyBsb2NraW5nIHByb2dyZXNzIGJ5IGFkanVzdGluZyB0aGUgClJFVFJZIGZsYWdzIGFm
dGVyIGEgcmV0cnkuCgovVGhvbWFzCgoKPiAtCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwo+IC0J
fQo+ICsJZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsKPiAgIAo+ICAgCS8qCj4g
ICAJICogUmVmdXNlIHRvIGZhdWx0IGltcG9ydGVkIHBhZ2VzLiBUaGlzIHNob3VsZCBiZSBoYW5k
bGVkCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oCj4gaW5kZXggNDNjNDkyOWEyMTcxLi42YjUwZTYyNGUzZTIg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPiBAQCAtNzY1LDcgKzc2NSw2IEBAIHNzaXplX3QgdHRt
X2JvX2lvKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZmlsZSAqZmlscCwKPiAg
IGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiwKPiAgIAkJCXN0
cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KTsKPiAgIHZvaWQgdHRtX2JvX3N3YXBvdXRfYWxs
KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KTsKPiAtaW50IHR0bV9ib193YWl0X3VucmVzZXJ2
ZWQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7Cj4gICAKPiAgIC8qKgo+ICAgICogdHRt
X2JvX3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdCAtIGNoZWNrIGlmIHRoZSBnaXZlbiBibyB1c2Vz
IHRoZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
