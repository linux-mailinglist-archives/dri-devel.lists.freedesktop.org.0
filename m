Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8AB845FE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9AE6E68D;
	Wed,  7 Aug 2019 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7213A6E640
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 07:26:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F07F230B1B7E;
 Wed,  7 Aug 2019 07:26:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8722826164;
 Wed,  7 Aug 2019 07:26:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8E28811AB8; Wed,  7 Aug 2019 09:26:54 +0200 (CEST)
Date: Wed, 7 Aug 2019 09:26:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm: add gem ttm helpers
Message-ID: <20190807072654.arqvx37p4yxhegcu@sirius.home.kraxel.org>
References: <20190806133454.8254-1-kraxel@redhat.com>
 <20190806133454.8254-2-kraxel@redhat.com>
 <20190806135426.GA7444@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190806135426.GA7444@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 07 Aug 2019 07:26:56 +0000 (UTC)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICsvKioKPiA+ICsgKiBkcm1fZ2VtX3R0bV9tbWFwX29mZnNldCgpIC0gUmV0dXJucyBhIEdF
TSB0dG0gb2JqZWN0J3MgbW1hcCBvZmZzZXQKPiA+ICsgKiBAZ2JvOgl0aGUgR0VNIHR0bSBvYmpl
Y3QKPiA+ICsgKgo+ID4gKyAqIFNlZSBkcm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoKSBmb3IgbW9y
ZSBpbmZvcm1hdGlvbi4KPiA+ICsgKgo+ID4gKyAqIFJldHVybnM6Cj4gPiArICogVGhlIGJ1ZmZl
ciBvYmplY3QncyBvZmZzZXQgZm9yIHVzZXJzcGFjZSBtYXBwaW5ncyBvbiBzdWNjZXNzLCBvcgo+
ID4gKyAqIDAgaWYgbm8gb2Zmc2V0IGlzIGFsbG9jYXRlZC4KPiA+ICsgKi8KPiA+ICt1NjQgZHJt
X2dlbV90dG1fbW1hcF9vZmZzZXQoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPiA+ICt7
Cj4gPiArCXJldHVybiBkcm1fdm1hX25vZGVfb2Zmc2V0X2FkZHIoJmJvLT5iYXNlLnZtYV9ub2Rl
KTsKPiAKPiBXaHkgZG8gd2UgbmVlZCBhIG5ldyBvbmUgaGVyZSwgY2FuJ3Qgd2UgdXNlIHRoZSBl
eGlzdGluZyBnZW0KPiBpbXBsZW1lbnRhdGlvbiBmb3IgdGhpcyAodGhlcmUgcmVhbGx5IHNob3Vs
ZCBvbmx5IGJlIG9uZSBJIGhvcGUsIGJ1dCBJCj4gZGlkbid0IGNoZWNrKS4KCkhhdm4ndCBmb3Vu
ZCBvbmUuCgpCdXQgbWF5YmUgd2UgZG9uJ3QgbmVlZCB0aGlzIGFzIHNlcGFyYXRlIGZ1bmN0aW9u
IGFuZCBjYW4gc2ltcGx5IG1vdmUKdGhlIGRybV92bWFfbm9kZV9vZmZzZXRfYWRkcigpIGNhbGwg
aW50bwpkcm1fZ2VtX3R0bV9kcml2ZXJfZHVtYl9tbWFwX29mZnNldCgpLgoKPiA+ICtpbnQgZHJt
X2dlbV90dG1fZHJpdmVyX2R1bWJfbW1hcF9vZmZzZXQoc3RydWN0IGRybV9maWxlICpmaWxlLAo+
ID4gKwkJCQkJIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gPiArCQkJCQkgdWludDMyX3QgaGFu
ZGxlLCB1aW50NjRfdCAqb2Zmc2V0KQo+ID4gK3sKPiA+ICsJc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpnZW07Cj4gPiArCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm87Cj4gPiArCj4gPiArCWdl
bSA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlLCBoYW5kbGUpOwo+ID4gKwlpZiAoIWdlbSkK
PiA+ICsJCXJldHVybiAtRU5PRU5UOwo+ID4gKwo+ID4gKwlibyA9IGRybV9nZW1fdHRtX29mX2dl
bShnZW0pOwo+ID4gKwkqb2Zmc2V0ID0gZHJtX2dlbV90dG1fbW1hcF9vZmZzZXQoYm8pOwo+ID4g
Kwo+ID4gKwlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtKTsKPiA+ICsKPiA+ICsJcmV0
dXJuIDA7Cj4gPiArfQo+ID4gK0VYUE9SVF9TWU1CT0woZHJtX2dlbV90dG1fZHJpdmVyX2R1bWJf
bW1hcF9vZmZzZXQpOwo+IAo+IFNhbWUgZm9yIHRoaXMsIHlvdSdyZSBqdXN0IHVwY2FzdGluZyB0
byB0dG1fYm8gYW5kIHRoZW4gZG93bmNhc3RpbmcgdG8KPiBnZW1fYm8gYWdhaW4gLi4uIEkgdGhp
bmsganVzdCBhIHNlcmllcyB0byByb2xsIG91dCB0aGUgZXhpc3RpbmcgZ2VtCj4gaGVscGVycyBl
dmVyeXdoZXJlIHNob3VsZCB3b3JrPwoKSSBkb24ndCB0aGluayBzby4gIGRybV9nZW1fZHVtYl9t
YXBfb2Zmc2V0KCkgY2FsbHMKZHJtX2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQoKSwgd2hpY2ggSSB0
aGluayBpcyBub3QgY29ycmVjdCBmb3IgdHRtCm9iamVjdHMgYmVjYXVzZSB0dG1fYm9faW5pdCgp
IGhhbmRsZXMgdm1hX25vZGUgaW5pdGlhbGl6YXRpb24uCgpjaGVlcnMsCiAgR2VyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
