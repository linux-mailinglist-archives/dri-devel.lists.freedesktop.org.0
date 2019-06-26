Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6B56C5A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B4E6E44F;
	Wed, 26 Jun 2019 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461686E44F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:40:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B6A632004F;
 Wed, 26 Jun 2019 16:40:14 +0200 (CEST)
Date: Wed, 26 Jun 2019 16:40:13 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] drm/vram: store dumb bo dimensions.
Message-ID: <20190626144013.GB12510@ravnborg.org>
References: <20190626065551.12956-1-kraxel@redhat.com>
 <20190626065551.12956-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626065551.12956-2-kraxel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
 a=P2sAgps8Zq9CMGv8isMA:9 a=CjuIK1q_8ugA:10
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
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, tzimmermann@suse.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VyZC4KCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA4OjU1OjUwQU0gKzAyMDAsIEdlcmQg
SG9mZm1hbm4gd3JvdGU6Cj4gU3RvcmUgd2lkdGggYW5kIGhlaWdodCBvZiB0aGUgYm8uICBOZWVk
ZWQgaW4gY2FzZSB1c2Vyc3BhY2UKPiBzZXRzIHVwIGEgZnJhbWVidWZmZXIgd2l0aCBmYi0+d2lk
dGggIT0gYm8tPndpZHRoLi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5o
ICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMiAr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmgKPiBpbmRleCAxYTBlYTE4ZTdhNzQuLjM2OTJkYmExNjdkZiAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKPiArKysgYi9pbmNsdWRlL2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgKPiBAQCAtMzksNiArMzksNyBAQCBzdHJ1Y3QgZHJtX2dl
bV92cmFtX29iamVjdCB7Cj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgZ2VtOwo+ICAJc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0IGJvOwo+ICAJc3RydWN0IHR0bV9ib19rbWFwX29iaiBrbWFwOwo+
ICsJdW5zaWduZWQgaW50IHdpZHRoLCBoZWlnaHQ7Cj4gIAo+ICAJLyogU3VwcG9ydGVkIHBsYWNl
bWVudHMgYXJlICVUVE1fUExfVlJBTSBhbmQgJVRUTV9QTF9TWVNURU0gKi8KPiAgCXN0cnVjdCB0
dG1fcGxhY2VtZW50IHBsYWNlbWVudDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmMKPiBpbmRleCA0ZGU3ODJjYTI2YjIuLmMwMmJmNzY5NDExNyAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuYwo+IEBAIC0zNzcsNiArMzc3LDggQEAgaW50IGRybV9nZW1f
dnJhbV9maWxsX2NyZWF0ZV9kdW1iKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSwKPiAgCWdibyA9IGRy
bV9nZW1fdnJhbV9jcmVhdGUoZGV2LCBiZGV2LCBzaXplLCBwZ19hbGlnbiwgaW50ZXJydXB0aWJs
ZSk7Cj4gIAlpZiAoSVNfRVJSKGdibykpCj4gIAkJcmV0dXJuIFBUUl9FUlIoZ2JvKTsKPiArCWdi
by0+d2lkdGggPSBhcmdzLT53aWR0aDsKPiArCWdiby0+aGVpZ2h0ID0gYXJncy0+aGVpZ2h0Owo+
ICAKPiAgCXJldCA9IGRybV9nZW1faGFuZGxlX2NyZWF0ZShmaWxlLCAmZ2JvLT5nZW0sICZoYW5k
bGUpOwo+ICAJaWYgKHJldCkKCkJlIHdhcm5lZCwgSSBtYXkgaGF2ZSBtaXNzZWQgc29tZXRoaW5n
IGluIHRoZSBiaWdnZXIgcGljdHVyZS4KCllvdXIgcGF0Y2ggd2lsbCBzZXQgd2lkdGggYW5kIGhl
aWdodCBvbmx5IGZvciBkdW1iIGJvJ3MKQnV0IHdlIGhhdmUgc2V2ZXJhbCB1c2VycyBvZiBkcm1f
Z2VtX3ZyYW1fY3JlYXRlKCkgdGhhdCB3aWxsCm5vdCBzZXQgdGhlIHdpZHRoIGFuZCBoZWlnaHQu
CgpTbyBvbmx5IGluIHNvbWUgY2FzZXMgY2FuIHdlIHJlbHkgb24gdGhlbSBiZWluZyBzZXQuClNo
b3VsZCB0aGlzIGJlIHJlZmFjdG9yZWQgc28gd2UgYWx3YXlzIHNldCB3aWR0aCwgaGVpZ2h0LgpP
ciBtYXliZSBzYXkgaW4gYSBzbWFsbCBjb21tZW50IHRoYXQgd2lkdGgsaGVpZ2h0IGFyZSBvbmx5
CnNldCBmb3IgZHVtYiBibydzPwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
