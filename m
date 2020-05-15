Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3221D4AD6
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546956EC67;
	Fri, 15 May 2020 10:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403D86EC67
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:24:56 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jZXWK-00063C-Ql; Fri, 15 May 2020 12:24:48 +0200
Message-ID: <a51cb70623c4c2441bb8df8385f56c99392b8435.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix perfmon domain interation
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Fri, 15 May 2020 12:24:47 +0200
In-Reply-To: <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
References: <20200511123846.96594-1-christian.gmeiner@gmail.com>
 <CAH9NwWcJNhUVkzd0KAfJyxNZJ9a71KLzipW+qRwhgEWUmnnxmg@mail.gmail.com>
 <X0BDAQ.L99CTJZCDEJE3@crapouillou.net>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>, stable@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRnJlaXRhZywgZGVuIDE1LjA1LjIwMjAsIDEyOjEyICswMjAwIHNjaHJpZWIgUGF1bCBDZXJj
dWVpbDoKPiBIaSBDaHJpc3RpYW4sCj4gCj4gTGUgdmVuLiAxNSBtYWkgMjAyMCDDoCAxMjowOSwg
Q2hyaXN0aWFuIEdtZWluZXIgCj4gPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4gYSDDqWNy
aXQgOgo+ID4gQW0gTW8uLCAxMS4gTWFpIDIwMjAgdW0gMTQ6MzggVWhyIHNjaHJpZWIgQ2hyaXN0
aWFuIEdtZWluZXIKPiA+IDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Ogo+ID4gPiAgVGhl
IEdDODYwIGhhcyBvbmUgR1BVIGRldmljZSB3aGljaCBoYXMgYSAyZCBhbmQgM2QgY29yZS4gSW4g
dGhpcyAKPiA+ID4gY2FzZQo+ID4gPiAgd2Ugd2FudCB0byBleHBvc2UgcGVyZm1vbiBpbmZvcm1h
dGlvbiBmb3IgYm90aCBjb3Jlcy4KPiA+ID4gCj4gPiA+ICBUaGUgZHJpdmVyIGhhcyBvbmUgYXJy
YXkgd2hpY2ggY29udGFpbnMgYWxsIHBvc3NpYmxlIHBlcmZtb24gZG9tYWlucwo+ID4gPiAgd2l0
aCBzb21lIG1ldGEgZGF0YSAtIGRvbXNfbWV0YS4gSGVyZSB3ZSBjYW4gc2VlIHRoYXQgZm9yIHRo
ZSBHQzg2MAo+ID4gPiAgdHdvIGVsZW1lbnRzIG9mIHRoYXQgYXJyYXkgYXJlIHJlbGV2YW50Ogo+
ID4gPiAKPiA+ID4gICAgZG9tc18zZDogaXMgYXQgaW5kZXggMCBpbiB0aGUgZG9tc19tZXRhIGFy
cmF5IHdpdGggOCBwZXJmbW9uIAo+ID4gPiBkb21haW5zCj4gPiA+ICAgIGRvbXNfMmQ6IGlzIGF0
IGluZGV4IDEgaW4gdGhlIGRvbXNfbWV0YSBhcnJheSB3aXRoIDEgcGVyZm1vbiAKPiA+ID4gZG9t
YWluCj4gPiA+IAo+ID4gPiAgVGhlIHVzZXJzcGFjZSBkcml2ZXIgd2FudHMgdG8gZ2V0IGEgbGlz
dCBvZiBhbGwgcGVyZm1vbiBkb21haW5zIGFuZAo+ID4gPiAgdGhlaXIgcGVyZm1vbiBzaWduYWxz
LiBUaGlzIGlzIGRvbmUgYnkgaXRlcmF0aW5nIG92ZXIgYWxsIGRvbWFpbnMgCj4gPiA+IGFuZAo+
ID4gPiAgdGhlaXIgc2lnbmFscy4gSWYgdGhlIHVzZXJzcGFjZSBkcml2ZXIgd2FudHMgdG8gYWNj
ZXNzIHRoZSBkb21haW4gCj4gPiA+IHdpdGgKPiA+ID4gIGlkIDggdGhlIGtlcm5lbCBkcml2ZXIg
ZmFpbHMgYW5kIHJldHVybnMgaW52YWxpZCBkYXRhIGZyb20gZG9tc18zZCAKPiA+ID4gd2l0aAo+
ID4gPiAgYW5kIGludmFsaWQgb2Zmc2V0Lgo+ID4gPiAKPiA+ID4gIFRoaXMgcmVzdWx0cyBpbjoK
PiA+ID4gICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVh
bCBhZGRyZXNzIDAwMDAwMDAwCj4gPiA+IAo+ID4gPiAgT24gc3VjaCBhIGRldmljZSBpdCBpcyBu
b3QgcG9zc2libGUgdG8gdXNlIHRoZSB1c2Vyc3BhY2UgZHJpdmVyIGF0IAo+ID4gPiBhbGwuCj4g
PiA+IAo+ID4gPiAgVGhlIGZpeCBmb3IgdGhpcyBvZmYtYnktb25lIGVycm9yIGlzIHF1aXRlIHNp
bXBsZS4KPiA+ID4gCj4gPiA+ICBSZXBvcnRlZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+Cj4gPiA+ICBUZXN0ZWQtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0Pgo+ID4gPiAgRml4ZXM6IGVkMWRkODk5YmFhMyAoImRybS9ldG5hdml2OiByZXdv
cmsgcGVyZm1vbiBxdWVyeSAKPiA+ID4gaW5mcmFzdHJ1Y3R1cmUiKQo+ID4gPiAgQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gIFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBHbWVpbmVy
IDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+Cj4gPiA+ICAtLS0KPiA+ID4gICBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYyB8IDIgKy0KPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gCj4gPiA+ICBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMgCj4gPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+ID4gIGluZGV4
IGU2Nzk1YmFmY2JiOS4uMzVmNzE3MWU3NzlhIDEwMDY0NAo+ID4gPiAgLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiA+ID4gICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ldG5hdml2L2V0bmF2aXZfcGVyZm1vbi5jCj4gPiA+ICBAQCAtNDUzLDcgKzQ1Myw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4gCj4gPiA+ICpwbV9kb21haW4o
Y29uc3Qgc3RydWN0IGV0bmF2aXZfZ3B1ICpncHUsCj4gPiA+ICAgICAgICAgICAgICAgICAgaWYg
KCEoZ3B1LT5pZGVudGl0eS5mZWF0dXJlcyAmIG1ldGEtPmZlYXR1cmUpKQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiA+IAo+ID4gPiAgLSAgICAgICAgICAgICAg
IGlmIChtZXRhLT5ucl9kb21haW5zIDwgKGluZGV4IC0gb2Zmc2V0KSkgewo+ID4gPiAgKyAgICAg
ICAgICAgICAgIGlmICgobWV0YS0+bnJfZG9tYWlucyAtIDEpIDwgKGluZGV4IC0gb2Zmc2V0KSkg
ewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0ICs9IG1ldGEtPm5yX2RvbWFp
bnM7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ID4gICAgICAg
ICAgICAgICAgICB9Cj4gPiA+ICAtLQo+ID4gPiAgMi4yNi4yCj4gPiA+IAo+ID4gCj4gPiBwaW5n
Cj4gCj4gSSdsbCBtZXJnZSBpdCB0b21vcnJvdyBpZiB0aGVyZSdzIG5vIGZ1cnRoZXIgZmVlZGJh
Y2suCgpIdWg/IEV0bmF2aXYgcGF0Y2hlcyBhcmUgZ29pbmcgdGhyb3VnaCB0aGUgZXRuYXZpdiB0
cmVlLgoKV2Ugbm93IGhhdmUgdHdvIGRpZmZlcmVudCBzb2x1dGlvbnMgdG8gdGhlIHNhbWUgaXNz
dWUuIEkgZmlyc3Qgd2FudCB0bwpkaWcgaW50byB0aGUgY29kZSB0byBzZWUgd2h5IHR3byBkZXZl
bG9wZXJzIGNhbiBnZXQgY29uZnVzZWQgZW5vdWdoIGJ5CnRoZSBjb2RlIHRvIGNvbWUgdXAgd2l0
aCB0b3RhbGx5IGRpZmZlcmVudCBmaXhlcy4KClJlZ2FyZHMsCkx1Y2FzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
