Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31899971
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 18:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF65D6E544;
	Thu, 22 Aug 2019 16:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BDB6E544
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 16:41:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8536228D206;
 Thu, 22 Aug 2019 17:41:29 +0100 (BST)
Date: Thu, 22 Aug 2019 18:41:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 04/50] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20190822184125.71507502@collabora.com>
In-Reply-To: <20190820011721.30136-5-laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-5-laurent.pinchart@ideasonboard.com>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMCBBdWcgMjAxOSAwNDoxNjozNSArMDMwMApMYXVyZW50IFBpbmNoYXJ0IDxsYXVy
ZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+IHdyb3RlOgoKPiAgCj4gKy8qKgo+ICsgKiBl
bnVtIGRybV9icmlkZ2Vfb3BzIC0gQml0bWFzayBvZiBvcGVyYXRpb25zIHN1cHBvcnRlZCBieSB0
aGUgYnJpZGdlCj4gKyAqLwo+ICtlbnVtIGRybV9icmlkZ2Vfb3BzIHsKPiArCS8qKgo+ICsJICog
QERSTV9CUklER0VfT1BfREVURUNUOiBUaGUgYnJpZGdlIGNhbiBkZXRlY3QgZGlzcGxheXMgY29u
bmVjdGVkIHRvCj4gKwkgKiBpdHMgb3V0cHV0LiBCcmlkZ2VzIHRoYXQgc2V0IHRoaXMgZmxhZyBz
aGFsbCBpbXBsZW1lbnQgdGhlCj4gKwkgKiAmZHJtX2JyaWRnZV9mdW5jcy0+ZGV0ZWN0IGNhbGxi
YWNrLgo+ICsJICovCj4gKwlEUk1fQlJJREdFX09QX0RFVEVDVCA9IEJJVCgwKSwKPiArCS8qKgo+
ICsJICogQERSTV9CUklER0VfT1BfRURJRDogVGhlIGJyaWRnZSBjYW4gcmV0cmlldmUgdGhlIEVE
SUQgb2YgdGhlIGRpc3BsYXkKPiArCSAqIGNvbm5lY3RlZCB0byBpdHMgb3V0cHV0LiBCcmlkZ2Vz
IHRoYXQgc2V0IHRoaXMgZmxhZyBzaGFsbCBpbXBsZW1lbnQKPiArCSAqIHRoZSAmZHJtX2JyaWRn
ZV9mdW5jcy0+Z2V0X2VkaWQgY2FsbGJhY2suCj4gKwkgKi8KPiArCURSTV9CUklER0VfT1BfRURJ
RCA9IEJJVCgxKSwKPiArCS8qKgo+ICsJICogQERSTV9CUklER0VfT1BfSFBEOiBUaGUgYnJpZGdl
IGNhbiBkZXRlY3QgaG90LXBsdWcgYW5kIGhvdC11bnBsdWcKPiArCSAqIHdpdGhvdXQgcmVxdWly
aW5nIHBvbGxpbmcuIEJyaWRnZXMgdGhhdCBzZXQgdGhpcyBmbGFnIHNoYWxsCj4gKwkgKiBpbXBs
ZW1lbnQgdGhlICZkcm1fYnJpZGdlX2Z1bmNzLT5ocGRfZW5hYmxlIGFuZAo+ICsJICogJmRybV9i
cmlkZ2VfZnVuY3MtPmhwZF9kaXNhYmxlIGNhbGxiYWNrcyBpZiB0aGV5IHN1cHBvcnQgZW5hYmxp
bmcKPiArCSAqIGFuZCBkaXNhYmxpbmcgaG90LXBsdWcgZGV0ZWN0aW9uIGR5bmFtaWNhbGx5Lgo+
ICsJICovCj4gKwlEUk1fQlJJREdFX09QX0hQRCA9IEJJVCgyKSwKPiArCS8qKgo+ICsJICogQERS
TV9CUklER0VfT1BfTU9ERVM6IFRoZSBicmlkZ2UgY2FuIHJldHJpZXZpbmcgdGhlIG1vZGVzIHN1
cHBvcnRlZAo+ICsJICogYnkgdGhlIGRpc3BsYXkgYXQgaXRzIG91dHB1dC4gVGhpcyBkb2VzIG5v
dCBpbmNsdWRlIHJlYWRpbmQgRURJRAo+ICsJICogd2hpY2ggaXMgc2VwYXJhdGVseSBjb3ZlcmVk
IGJ5IEBEUk1fQlJJREdFX09QX0VESUQuIEJyaWRnZXMgdGhhdCBzZXQKPiArCSAqIHRoaXMgZmxh
ZyBzaGFsbCBpbXBsZW1lbnQgdGhlICZkcm1fYnJpZGdlX2Z1bmNzLT5nZXRfbW9kZXMgY2FsbGJh
Y2suCj4gKwkgKi8KPiArCURSTV9CUklER0VfT1BfTU9ERVMgPSBCSVQoMyksCj4gK307Cj4gKwo+
ICAvKioKPiAgICogc3RydWN0IGRybV9icmlkZ2UgLSBjZW50cmFsIERSTSBicmlkZ2UgY29udHJv
bCBzdHJ1Y3R1cmUKPiAgICovCj4gQEAgLTM5OCw2ICs1MzgsMzMgQEAgc3RydWN0IGRybV9icmlk
Z2Ugewo+ICAJY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzOwo+ICAJLyoqIEBk
cml2ZXJfcHJpdmF0ZTogcG9pbnRlciB0byB0aGUgYnJpZGdlIGRyaXZlcidzIGludGVybmFsIGNv
bnRleHQgKi8KPiAgCXZvaWQgKmRyaXZlcl9wcml2YXRlOwo+ICsJLyoqIEBvcHM6IGJpdG1hc2sg
b2Ygb3BlcmF0aW9ucyBzdXBwb3J0ZWQgYnkgdGhlIGJyaWRnZSAqLwo+ICsJZW51bSBkcm1fYnJp
ZGdlX29wcyBvcHM7CgpKdXN0IHJlYWxpemVkIHRoYXQgeW91J3JlIG5vdCBjaGVja2luZyAtPm9w
cyBhbmQgLT5mdW5jcyBjb25zaXN0ZW5jeSBhdAphdHRhY2goKSB0aW1lICh5b3UncmUgb25seSBj
aGVja2luZyAtPm9wcyBpbiB0aGUgdGZwNDEwIGRyaXZlciBiZWZvcmUKY2FsbGluZyAtPmZ1bmNz
LT5kZXRlY3QoKSBhbmQgLT5mdW5jcy0+Z2V0X21vZGVzKCkgYW5kIHRoZXkgbWlnaHQgYmUKTlVM
TCkuCgo+ICsJLyoqCj4gKwkgKiBAdHlwZTogVHlwZSBvZiB0aGUgY29ubmVjdGlvbiBhdCB0aGUg
YnJpZGdlIG91dHB1dAo+ICsJICogKERSTV9NT0RFX0NPTk5FQ1RPUl8qKS4gRm9yIGJyaWRnZXMg
YXQgdGhlIGVuZCBvZiB0aGlzIGNoYWluIHRoaXMKPiArCSAqIGlkZW50aWZpZXMgdGhlIHR5cGUg
b2YgY29ubmVjdGVkIGRpc3BsYXkuCj4gKwkgKi8KPiArCWludCB0eXBlOwo+ICsJLyoqCj4gKwkg
KiBAZGRjOiBBc3NvY2lhdGVkIEkyQyBhZGFwdGVyIGZvciBEREMgYWNjZXNzLCBpZiBhbnkuCj4g
KwkgKi8KPiArCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwo+ICsJLyoqIHByaXZhdGU6ICovCj4g
KwkvKioKPiArCSAqIEBocGRfbXV0ZXg6IFByb3RlY3RzIHRoZSBAaHBkX2NiIGFuZCBAaHBkX2Rh
dGEgZmllbGRzLgo+ICsJICovCj4gKwlzdHJ1Y3QgbXV0ZXggaHBkX211dGV4Owo+ICsJLyoqCj4g
KwkgKiBAaHBkX2NiOiBIb3QgcGx1ZyBkZXRlY3Rpb24gY2FsbGJhY2ssIHJlZ2lzdGVyZWQgd2l0
aAo+ICsJICogZHJtX2JyaWRnZV9ocGRfZW5hYmxlKCkuCj4gKwkgKi8KPiArCXZvaWQgKCpocGRf
Y2IpKHZvaWQgKmRhdGEsIGVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVzKTsKPiArCS8q
Kgo+ICsJICogQGhwZF9kYXRhOiBQcml2YXRlIGRhdGEgcGFzc2VkIHRvIHRoZSBIb3QgcGx1ZyBk
ZXRlY3Rpb24gY2FsbGJhY2sKPiArCSAqIEBocGRfY2IuCj4gKwkgKi8KPiArCXZvaWQgKmhwZF9k
YXRhOwo+ICB9OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
