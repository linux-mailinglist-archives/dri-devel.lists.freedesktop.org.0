Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F79563B1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4BA26E2B4;
	Wed, 26 Jun 2019 07:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C946E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:51:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 985483087BA9;
 Wed, 26 Jun 2019 07:51:58 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296F660C6E;
 Wed, 26 Jun 2019 07:51:48 +0000 (UTC)
Date: Wed, 26 Jun 2019 09:51:46 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: move drm_connector_update_edid_property() call
Message-ID: <20190626095146.2731a2dc.cohuck@redhat.com>
In-Reply-To: <20190405044602.2334-1-kraxel@redhat.com>
References: <20190405044602.2334-1-kraxel@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 26 Jun 2019 07:51:58 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 jcmvbkbc@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgNSBBcHIgMjAxOSAwNjo0NjowMiArMDIwMApHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IGRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkg
Y2FuIHNsZWVwLCB3ZSBtdXN0IG5vdAo+IGNhbGwgaXQgd2hpbGUgaG9sZGluZyBhIHNwaW5sb2Nr
LiAgTW92ZSB0aGUgY2FsbHNpemUuCgpzL2NhbGxzaXplL2NhbGxzaXRlLwoKPiAKPiBSZXBvcnRl
ZC1ieTogTWF4IEZpbGlwcG92IDxqY212YmtiY0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
R2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV92cS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Zp
cnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwo+
IGluZGV4IGU2MmZlMjRiMWEyZS4uNWJiMGYwYTA4NGU5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRp
by92aXJ0Z3B1X3ZxLmMKPiBAQCAtNjE5LDExICs2MTksMTEgQEAgc3RhdGljIHZvaWQgdmlydGlv
X2dwdV9jbWRfZ2V0X2VkaWRfY2Ioc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKPiAg
CW91dHB1dCA9IHZnZGV2LT5vdXRwdXRzICsgc2Nhbm91dDsKPiAgCj4gIAluZXdfZWRpZCA9IGRy
bV9kb19nZXRfZWRpZCgmb3V0cHV0LT5jb25uLCB2aXJ0aW9fZ2V0X2VkaWRfYmxvY2ssIHJlc3Ap
Owo+ICsJZHJtX2Nvbm5lY3Rvcl91cGRhdGVfZWRpZF9wcm9wZXJ0eSgmb3V0cHV0LT5jb25uLCBu
ZXdfZWRpZCk7Cj4gIAo+ICAJc3Bpbl9sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2spOwo+
ICAJb2xkX2VkaWQgPSBvdXRwdXQtPmVkaWQ7Cj4gIAlvdXRwdXQtPmVkaWQgPSBuZXdfZWRpZDsK
PiAtCWRybV9jb25uZWN0b3JfdXBkYXRlX2VkaWRfcHJvcGVydHkoJm91dHB1dC0+Y29ubiwgb3V0
cHV0LT5lZGlkKTsKPiAgCXNwaW5fdW5sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2spOwo+
ICAKPiAgCWtmcmVlKG9sZF9lZGlkKTsKClRoaXMgZ2V0cyByaWQgb2YgdGhlIHNsZWVwaW5nIHdo
aWxlIGF0b21pYyB0cmFjZXMgSSd2ZSBiZWVuIHNlZWluZyB3aXRoCmFuIHMzOTB4IGd1ZXN0IChi
b3RoIHZpcnRpby1ncHUtcGNpIGFuZCB2aXJ0aW8tZ3B1LWNjdykuCgpUZXN0ZWQtYnk6IENvcm5l
bGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgoKSSBoYXZlIGFsc28gbG9va2VkIGF0IHRoZSBj
b2RlIGEgYml0LCBidXQgZG9uJ3QgZmVlbCBjb25maWRlbnQgZW5vdWdoCnRvIGdpdmUgYW4gUi1i
LgoKQWNrZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
