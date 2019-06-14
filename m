Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796FA45F99
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 15:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0A6898C7;
	Fri, 14 Jun 2019 13:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A15898C7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:53:25 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C2A73260EF1;
 Fri, 14 Jun 2019 14:53:23 +0100 (BST)
Date: Fri, 14 Jun 2019 15:53:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [RFC/WIP] drm/rockchip: Support CRTC gamma LUT
Message-ID: <20190614155320.348d42af@collabora.com>
In-Reply-To: <20190613192244.5447-1-ezequiel@collabora.com>
References: <20190613192244.5447-1-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBKdW4gMjAxOSAxNjoyMjo0NCAtMDMwMApFemVxdWllbCBHYXJjaWEgPGV6ZXF1
aWVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgoKCj4gK3N0YXRpYyBpbnQgdm9wX2dhbW1hX2x1dF9y
ZXF1ZXN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJCSBzdHJ1Y3QgcmVzb3VyY2UgKnJlcywg
c3RydWN0IHZvcCAqdm9wKQo+ICt7Cj4gKwlyZXNvdXJjZV9zaXplX3Qgb2Zmc2V0ID0gdm9wLT5k
YXRhLT5nYW1tYV9sdXRfYWRkcl9vZmY7Cj4gKwlyZXNvdXJjZV9zaXplX3Qgc2l6ZSA9IFZPUF9H
QU1NQV9MVVRfU0laRSAqIDQ7Cj4gKwo+ICsJLyoKPiArCSAqIFNvbWUgU29DcyAoZS5nLiBSSzMy
ODgpIGhhdmUgdGhlIGdhbW1hIExVVCBhZGRyZXNzIGFmdGVyCj4gKwkgKiB0aGUgTU1VIHJlZ2lz
dGVycywgd2hpY2ggbWVhbnMgd2UgY2FuJ3QgcmVxdWVzdCBhbmQgaW9yZW1hcAo+ICsJICogdGhl
IGVudGlyZSByZWdpc3RlciBzZXQuIE90aGVyIChlLmcuIFJLMzM5OSkgaGF2ZSBnYW1tYSBMVVQK
PiArCSAqIGFkZHJlc3MgYmVmb3JlIE1NVS4KPiArCSAqCj4gKwkgKiBUaGVyZWZvcmUsIHdlIG5l
ZWQgdG8gcmVxdWVzdCBhbmQgaW9yZW1hcCB0aG9zZSB0aGF0IGhhdmVuJ3QKPiArCSAqIGJlZW4g
YWxyZWFkeS4KPiArCSAqLwo+ICsJaWYgKHZvcC0+bGVuID49IChvZmZzZXQgKyBzaXplKSkgewo+
ICsJCXZvcC0+bHV0X3JlZ3MgPSB2b3AtPnJlZ3MgKyBvZmZzZXQ7Cj4gKwkJcmV0dXJuIDA7Cj4g
Kwl9Cj4gKwo+ICsJaWYgKCFkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbihkZXYsIHJlcy0+c3RhcnQg
KyBvZmZzZXQsCj4gKwkJCQkgICAgIHNpemUsIGRldl9uYW1lKGRldikpKSB7Cj4gKwkJZGV2X3dh
cm4oZGV2LCAiY2FuJ3QgcmVxdWVzdCBnYW1tYSBsdXQgcmVnaW9uXG4iKTsKPiArCQlyZXR1cm4g
LUVCVVNZOwo+ICsJfQo+ICsKPiArCXZvcC0+bHV0X3JlZ3MgPSBkZXZtX2lvcmVtYXAoZGV2LCBy
ZXMtPnN0YXJ0ICsgb2Zmc2V0LCBzaXplKTsKPiArCWlmICghdm9wLT5sdXRfcmVncykgewo+ICsJ
CWRldl9lcnIoZGV2LCAiY2FuJ3QgaW9yZW1hcCBnYW1tYSBsdXQgYWRkcmVzc1xuIik7Cj4gKwkJ
ZGV2bV9yZWxlYXNlX21lbV9yZWdpb24oZGV2LCByZXMtPnN0YXJ0ICsgb2Zmc2V0LCBzaXplKTsK
PiArCQlyZXR1cm4gLUVOT01FTTsKPiArCX0KCkNhbid0IHdlIHBhdGNoIHRoZSByZXNvdXJjZSBq
dXN0IGFmdGVyIGNhbGxpbmcgcGxhZm9ybV9nZXRfcmVzb3VyY2UoKQooYW5kIGJlZm9yZSBjYWxs
aW5nIGRldm1faW9yZW1hcF9yZXNvdXJjZSgpKSBzbyB3ZSBkb24ndCBoYXZlIHRvIGFkZAp0aGVz
ZSBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbigpK2Rldm1faW9yZW1hcCgpIGNhbGxzIGhlcmU/Cgo+
ICsJcmV0dXJuIDA7Cj4gK30KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
