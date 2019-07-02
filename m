Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19F05CC85
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 11:20:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241A789AB3;
	Tue,  2 Jul 2019 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB0989AB3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 09:20:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5872187648;
 Tue,  2 Jul 2019 09:20:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 629941001B36;
 Tue,  2 Jul 2019 09:20:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5421811AB5; Tue,  2 Jul 2019 11:20:23 +0200 (CEST)
Date: Tue, 2 Jul 2019 11:20:23 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/5] drm/vram: Don't export driver callback functions
 for PRIME
Message-ID: <20190702092023.dv4sveiqb7s3k5ne@sirius.home.kraxel.org>
References: <20190702080139.21814-1-tzimmermann@suse.de>
 <20190702080139.21814-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702080139.21814-6-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 02 Jul 2019 09:20:40 +0000 (UTC)
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
 dri-devel@lists.freedesktop.org, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 zourongrong@gmail.com, airlied@redhat.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ICBIaSwKCj4gK3N0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9vYmplY3RfZnJlZShzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKmdlbSkKPiArewo+ICsJc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdi
byA9IGRybV9nZW1fdnJhbV9vZl9nZW0oZ2VtKTsKPiArCj4gKwlkcm1fZ2VtX3ZyYW1fcHV0KGdi
byk7Cj4gK30KCkhtbSwgc2VlbXMgZ2l0IGRpZmYgZGlkbid0IGZpZ3VyZSBpdCdzIHRoZSBzYW1l
IGZ1bmMganVzdCByZW5hbWVkCihsaWtld2lzZSBwaW4vdW5waW4vdm1hcC92dW5tYXApLiAgTWF5
YmUgImdpdCBkaWZmIC0tbWluaW1hbCIgZ2l2ZXMKYmV0dGVyIHJlc3VsdHMgaGVyZS4gIFBsYWNp
bmcgdGhlIG9iamVjdF9mdW5jcyBzdHJ1Y3QgKHBhdGNoIDEpIGF0IHRoZQplbmQgb2YgdGhlIGZp
bGUgbWlnaHQgaGVscCB0b28uCgo+IC0vKioKPiAtICogZHJtX2dlbV92cmFtX2RyaXZlcl9nZW1f
ZnJlZV9vYmplY3RfdW5sb2NrZWQoKSAtIFwKPiAtCUltcGxlbWVudHMgJnN0cnVjdCBkcm1fZHJp
dmVyLmdlbV9mcmVlX29iamVjdF91bmxvY2tlZAo+IC0gKiBAZ2VtOglHRU0gb2JqZWN0LiBSZWZl
cnMgdG8gJnN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0LmdlbQo+IC0gKi8KCkkgdGhpbmsgd2Ug
c2hvdWxkIGtlZXAgdGhlIGRvY3VtZW50YXRpb24gLi4uCgo+IC1FWFBPUlRfU1lNQk9MKGRybV9n
ZW1fdnJhbV9kcml2ZXJfZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkKTsKCkFuZCB0aGUgRVhQT1JU
X1NZTUJPTCB0b28uCgpEcml2ZXJzIG1pZ2h0IHdhbnQgcm9sbCB0aGVpciBvd24gdmVyc2lvbiBv
ZiBkcm1fZ2VtX29iamVjdF9mdW5jcywKd2l0aCBzb21lIG9mIHRoZSBmdW5jdGlvbnMgcmVwbGFj
ZWQgYnkgZHJpdmVyLXNwZWNpZmljIHZlcnNpb25zIGluCmNhc2UgdGhleSBoYXZlIHNvbWUgZXh0
cmEgd29yayB0byBkby4KCmNoZWVycywKICBHZXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
