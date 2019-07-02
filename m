Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D525CEF0
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 13:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B889C84;
	Tue,  2 Jul 2019 11:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C604989C84
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 11:56:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4062999DDE;
 Tue,  2 Jul 2019 11:56:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 101AB6F947;
 Tue,  2 Jul 2019 11:56:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0DBDD11AB5; Tue,  2 Jul 2019 13:56:11 +0200 (CEST)
Date: Tue, 2 Jul 2019 13:56:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/5] drm/vram: Don't export driver callback functions
 for PRIME
Message-ID: <20190702115611.rj7rsfh552q2lwpv@sirius.home.kraxel.org>
References: <20190702115012.4418-1-tzimmermann@suse.de>
 <20190702115012.4418-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702115012.4418-6-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 02 Jul 2019 11:56:31 +0000 (UTC)
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
Cc: emil.l.velikov@gmail.com, maxime.ripard@bootlin.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 zourongrong@gmail.com, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gIC8qKgo+IC0gKiBkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91
bmxvY2tlZCgpIC0gXAo+IC0JSW1wbGVtZW50cyAmc3RydWN0IGRybV9kcml2ZXIuZ2VtX2ZyZWVf
b2JqZWN0X3VubG9ja2VkCj4gLSAqIEBnZW06CUdFTSBvYmplY3QuIFJlZmVycyB0byAmc3RydWN0
IGRybV9nZW1fdnJhbV9vYmplY3QuZ2VtCj4gKyAqIGRybV9nZW1fdnJhbV9vYmplY3RfZnJlZSgp
IC0gXAo+ICsJSW1wbGVtZW50cyAmc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzLmZyZWUKPiAr
ICogQGdlbTogICAgICAgR0VNIG9iamVjdC4gUmVmZXJzIHRvICZzdHJ1Y3QgZHJtX2dlbV92cmFt
X29iamVjdC5nZW0KPiAgICovCj4gLXZvaWQgZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1fZnJlZV9v
YmplY3RfdW5sb2NrZWQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW0pCj4gK3N0YXRpYyB2b2lk
IGRybV9nZW1fdnJhbV9vYmplY3RfZnJlZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSkKPiAg
ewo+ICAJc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibyA9IGRybV9nZW1fdnJhbV9vZl9n
ZW0oZ2VtKTsKPiAgCj4gIAlkcm1fZ2VtX3ZyYW1fcHV0KGdibyk7Cj4gIH0KPiAtRVhQT1JUX1NZ
TUJPTChkcm1fZ2VtX3ZyYW1fZHJpdmVyX2dlbV9mcmVlX29iamVjdF91bmxvY2tlZCk7CgpBaGgs
IG11Y2ggYmV0dGVyLCB0aGFua3MuCgpTZXJpZXMgaXM6ClJldmlld2VkLWJ5OiBHZXJkIEhvZmZt
YW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
