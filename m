Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28AA6138
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 08:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED8789333;
	Tue,  3 Sep 2019 06:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02389358
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 06:20:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5110C10C6964;
 Tue,  3 Sep 2019 06:20:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-67.ams2.redhat.com
 [10.36.117.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01DE65D6B7;
 Tue,  3 Sep 2019 06:20:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C038A783D; Tue,  3 Sep 2019 08:20:52 +0200 (CEST)
Date: Tue, 3 Sep 2019 08:20:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/5] drm/vram: add vram-mm debugfs file
Message-ID: <20190903062052.nn57achxfkvnpysr@sirius.home.kraxel.org>
References: <20190902124126.7700-1-kraxel@redhat.com>
 <20190902124126.7700-4-kraxel@redhat.com>
 <2110d38c-1793-a5c9-921c-94ccfe2205cb@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2110d38c-1793-a5c9-921c-94ccfe2205cb@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Tue, 03 Sep 2019 06:20:54 +0000 (UTC)
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

ICBIaSwKCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKPiA+IEBA
IC0xMjMsNiArMTIzLDcgQEAgaW50IGRybV9nZW1fdnJhbV9kcml2ZXJfZHVtYl9tbWFwX29mZnNl
dChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsCj4gPiAgICogJnN0cnVjdCBkcm1fZHJpdmVyIHdpdGgg
ZGVmYXVsdCBmdW5jdGlvbnMuCj4gPiAgICovCj4gPiAgI2RlZmluZSBEUk1fR0VNX1ZSQU1fRFJJ
VkVSIFwKPiA+ICsJLmRlYnVnZnNfaW5pdCAgICAgICAgICAgICA9IGRybV92cmFtX21tX2RlYnVn
ZnNfaW5pdCwgXAo+IAo+ID4gK2ludCBkcm1fdnJhbV9tbV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRy
bV9taW5vciAqbWlub3IpOwo+IAo+IEkgY2Fubm90IGZpbmQgYSBjYWxsZXIgb2YgdGhpcyBmdW5j
dGlvbi4gV2lsbCB0aGlzIGJlIGNhbGxlZCBmb3JtCj4gZHJtX2RlYnVnZnNfaW5pdCgpPwoKWWVz
LCB2aWEgZHJtX2RyaXZlci0+ZGVidWdmc19pbml0IHdoaWNoIGlzIHNldCBhYm92ZS4KCmNoZWVy
cywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
