Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2803BAD651
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 12:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E289B0B;
	Mon,  9 Sep 2019 10:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC0D89B0B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:06:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 56B3F3090FC2;
 Mon,  9 Sep 2019 10:06:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
 [10.36.117.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8DAA10018F8;
 Mon,  9 Sep 2019 10:06:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0588916E19; Mon,  9 Sep 2019 12:06:54 +0200 (CEST)
Date: Mon, 9 Sep 2019 12:06:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 05/17] drm: add mmap() to drm_gem_object_funcs
Message-ID: <20190909100653.hyo4psakt3ccfwjk@sirius.home.kraxel.org>
References: <20190808134417.10610-1-kraxel@redhat.com>
 <20190808134417.10610-6-kraxel@redhat.com>
 <20190903094859.GQ2112@phenom.ffwll.local>
 <20190906121318.r4nvoacazvwukuun@sirius.home.kraxel.org>
 <CAKMK7uHFS8uW15NMEzN92POD2hyhkvKFgePdjgL=D-noUAkq3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHFS8uW15NMEzN92POD2hyhkvKFgePdjgL=D-noUAkq3Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 09 Sep 2019 10:06:55 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gPiArICAgICAgICAgICAgICAgdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX1BG
Tk1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKPiA+ICsgICAgICAgICAgICAgICB2
bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0X3BhZ2VfcHJvdCh2
bWEtPnZtX2ZsYWdzKSk7Cj4gPiArICAgICAgICAgICAgICAgdm1hLT52bV9wYWdlX3Byb3QgPSBw
Z3Byb3RfZGVjcnlwdGVkKHZtYS0+dm1fcGFnZV9wcm90KTsKPiA+ICsgICAgICAgfQo+IAo+IFRv
dGFsbHkgdW5yZWxhdGVkIGRpc2N1c3Npb24gYXJvdW5kIEhNTSBsZWFkIG1lIHRvIGEgYml0IGEg
Y2hhc2UsIGFuZAo+IHJlYWxpemluZyB0aGF0IHdlIHByb2JhYmx5IHdhbnQgYQo+IAo+ICAgICBX
QVJOX09OKCEodm1hLT52bV9mbGFncyAmIFZNX1NQRUNJQUwpKTsKPiAKPiBoZXJlLCB0byBtYWtl
IHN1cmUgZHJpdmVycyBzZXQgYXQgbGVhc3Qgb25lIG9mIHRoZSAidGhpcyBpcyBhIHNwZWNpYWwK
PiB2bWEsIGRvbid0IHRyeSB0byB0cmVhdCBpdCBsaWtlIHBhZ2VjYWNoZS9hbm9uIG1lbW9yeSIu
IEp1c3QgdG8gYmUgb24KPiB0aGUgc2FmZSBzaWRlLiBNYXliZSB3ZSBhbHNvIHdhbnQgdG8ga2Vl
cCB0aGUgZW50aXJlIHZtYS0+dm1fZmxhZ3MKPiBhc3NpZ25tZW50IGluIHRoZSBjb21tb24gY29k
ZSwgYnV0IGF0IGxlYXN0IHRoZSBXQVJOX09OIHdvdWxkIGJlIGEKPiBnb29kIGNoZWNrIEkgdGhp
bmsuIE1heWJlIGFsc28gY2hlY2sgZm9yIFZNX0RPTlRFWFBBTkQgd2hpbGUgYXQgaXQKCkhtbS4g
IFZNX1NQRUNJQUwgaXMgdGhpczoKCiAgI2RlZmluZSBWTV9TUEVDSUFMIChWTV9JTyB8IFZNX0RP
TlRFWFBBTkQgfCBWTV9QRk5NQVAgfCBWTV9NSVhFRE1BUCkKClJlcXVpcmluZyBWTV9ET05URVhQ
QU5EIG1ha2VzIHNlbnNlIGZvciBzdXJlLiAgRHVubm8gYWJvdXQgdGhlIG90aGVyCm9uZXMuICBG
b3IgZHJtX2dlbV92cmFtX2hlbHBlciBWTV9JTyArIFZNX1BGTk1BUCBhcmUgbmVlZGVkLgoKQnV0
IHdlIGFsc28gaGF2ZSBkcm1fZ2VtX3NobWVtX2hlbHBlciB3aGljaCBiYWNrcyBvYmplY3RzIHdp
dGggbm9ybWFsCnBhZ2VzLiAgSW4gZmFjdCBkcm1fZ2VtX3NobWVtX21tYXAgZG9lcyB0aGlzOgoK
CS8qIFZNX1BGTk1BUCB3YXMgc2V0IGJ5IGRybV9nZW1fbW1hcCgpICovCgl2bWEtPnZtX2ZsYWdz
ICY9IH5WTV9QRk5NQVA7Cgl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOwoKaW5jbHVkZS9s
aW51eC9tbS5oIGlzbid0IHZlcnkgaGVscGZ1bCBpbiBleHBsYWluaW5nIGhvdyBWTV9NSVhFRE1B
UApzaG91bGQgYmUgdXNlZCwgb25seSBzYXlpbmcgY2FuIGJlIGJvdGggInN0cnVjdCBwYWdlIiBh
bmQgcGZubWFwLCBzbyBJJ20Kbm90IHN1cmUgd2h5IFZNX01JWEVETUFQIGlzIHNldCBoZXJlLCBp
dCBzaG91bGQgYWx3YXlzIGJlICJzdHJ1Y3QgcGFnZSIKZm9yIHNobWVtLCBubz8KCmNoZWVycywK
ICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
