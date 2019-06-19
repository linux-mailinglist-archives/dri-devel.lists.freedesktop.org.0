Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F924B70D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3FC6E373;
	Wed, 19 Jun 2019 11:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177B66E373
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7906530860AF;
 Wed, 19 Jun 2019 11:27:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
 [10.36.116.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 432005D9C6;
 Wed, 19 Jun 2019 11:27:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E84E11AAB; Wed, 19 Jun 2019 13:27:23 +0200 (CEST)
Date: Wed, 19 Jun 2019 13:27:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v3 01/12] drm: add gem array helpers
Message-ID: <20190619112723.sktnns3qfdfh3lvi@sirius.home.kraxel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
 <20190619090420.6667-2-kraxel@redhat.com>
 <20190619103212.GA1896@arch-x1c3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619103212.GA1896@arch-x1c3>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Wed, 19 Jun 2019 11:27:22 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiA+ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfYXJyYXkqCj4gPiArZHJtX2dlbV9hcnJheV9mcm9t
X2hhbmRsZXMoc3RydWN0IGRybV9maWxlICpkcm1fZmlsZSwgdTMyICpoYW5kbGVzLCB1MzIgbmVu
dHMpCj4gPiArewo+ID4gKwlzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfYXJyYXkgKm9ianM7Cj4gPiAr
CXUzMiBpOwo+ID4gKwo+ID4gKwlvYmpzID0gZHJtX2dlbV9hcnJheV9hbGxvYyhuZW50cyk7Cj4g
PiArCWlmICghb2JqcykKPiA+ICsJCXJldHVybiBOVUxMOwo+ID4gKwo+ID4gKwlmb3IgKGkgPSAw
OyBpIDwgbmVudHM7IGkrKykgewo+ID4gKwkJb2Jqcy0+b2Jqc1tpXSA9IGRybV9nZW1fb2JqZWN0
X2xvb2t1cChkcm1fZmlsZSwgaGFuZGxlc1tpXSk7Cj4gPiArCQlpZiAoIW9ianMtPm9ianNbaV0p
IHsKPiBNaXNzaW5nIG9iamVjdCBwdXQgZm9yIHRoZSAwLi5pLTEgaGFuZGxlcy4gUGVyc29uYWxs
eSBJIHdvdWxkOgoKTm8uIGRybV9nZW1fYXJyYXlfYWxsb2MgaW5pdGlhbGl6ZXMgb2Jqcy0+bmVu
dHMgYW5kCmRybV9nZW1fYXJyYXlfcHV0X2ZyZWUoKSBsb29wcyBvdmVyIHRoZSB3aG9sZSBhcnJh
eSwKc2tpcHBpbmcgTlVMTCBwb2ludGVycy4KCj4gPiArCQkJZHJtX2dlbV9hcnJheV9wdXRfZnJl
ZShvYmpzKTsKPiA+ICsJCQlyZXR1cm4gTlVMTDsKPiA+ICsJCX0KPiA+ICsJfQo+ID4gKwlyZXR1
cm4gb2JqczsKPiA+ICt9Cj4gTWlzc2luZyBFWFBPUlRfU1lNQk9MPwoKT29wcy4gIEkgaGFkIHRo
YXQgZml4ZWQuICBQb3NzaWJseSBzcXVhc2hlZCBpbnRvIHRoZSB3cm9uZyBwYXRjaC4KCj4gRGl0
dG8/CgpZZXMuCgpjaGVlcnMsCiAgR2VyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
