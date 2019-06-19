Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A614B82B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 14:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD966E392;
	Wed, 19 Jun 2019 12:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE7B6E392
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:26:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6507420025;
 Wed, 19 Jun 2019 14:26:23 +0200 (CEST)
Date: Wed, 19 Jun 2019 14:26:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 2/2] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Message-ID: <20190619122622.GB29084@ravnborg.org>
References: <20190603152331.23160-1-paul@crapouillou.net>
 <20190603152331.23160-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603152331.23160-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=p6pI0oa4AAAA:8 a=e5mUnYsNAAAA:8 a=H0UmMNABUbsaJNjzNOkA:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=9cw2y2bKwytFd151gpuR:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 Artur Rojek <contact@artur-rojek.eu>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGF1bC4KCk9uIE1vbiwgSnVuIDAzLCAyMDE5IGF0IDA1OjIzOjMxUE0gKzAyMDAsIFBhdWwg
Q2VyY3VlaWwgd3JvdGU6Cj4gQWRkIGEgS01TIGRyaXZlciBmb3IgdGhlIEluZ2VuaWMgSlo0N3h4
IGZhbWlseSBvZiBTb0NzLgo+IFRoaXMgZHJpdmVyIGlzIG1lYW50IHRvIHJlcGxhY2UgdGhlIGFn
aW5nIGp6NDc0MC1mYiBkcml2ZXIuCj4gCj4gVGhpcyBkcml2ZXIgZG9lcyBub3QgbWFrZSB1c2Ug
b2YgdGhlIHNpbXBsZSBwaXBlIGhlbHBlciwgZm9yIHRoZSByZWFzb24KPiB0aGF0IGl0IHdpbGwg
c29vbiBiZSB1cGRhdGVkIHRvIHN1cHBvcnQgbW9yZSBhZHZhbmNlZCBmZWF0dXJlcyBsaWtlCj4g
bXVsdGlwbGUgcGxhbmVzLCBJUFUgaW50ZWdyYXRpb24gZm9yIGNvbG9yc3BhY2UgY29udmVyc2lv
biBhbmQgdXAvZG93bgo+IHNjYWxpbmcsIHN1cHBvcnQgZm9yIERTSSBkaXNwbGF5cywgYW5kIFRW
LW91dCBhbmQgSERNSSBvdXRwdXRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwg
PHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+IFRlc3RlZC1ieTogQXJ0dXIgUm9qZWsgPGNvbnRhY3RA
YXJ0dXItcm9qZWsuZXU+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYyOiAtIFJlbW92ZSBjdXN0
b20gaGFuZGxpbmcgb2YgcGFuZWwuIFRoZSBwYW5lbCBpcyBub3cgZGlzY292ZXJlZCB1c2luZwo+
ICAgICAJICB0aGUgc3RhbmRhcmQgQVBJLgo+ICAgICAJLSBMb3RzIG9mIHNtYWxsIHR3ZWFrcyBz
dWdnZXN0ZWQgYnkgdXBzdHJlYW0KPiAgICAgCj4gICAgIHYzOiAtIFVzZSBkZXZtX2RybV9kZXZf
aW5pdCgpCj4gICAgIAktIFVwZGF0ZSBjb21wYXRpYmxlIHN0cmluZ3MgdG8gLWxjZCBpbnN0ZWFk
IG9mIC1kcm0KPiAgICAgCS0gQWRkIGRlc3Ryb3koKSBjYWxsYmFja3MgdG8gcGxhbmUgYW5kIGNy
dGMKPiAgICAgCS0gVGhlIGluZ2VuaWMsbGNkLW1vZGUgaXMgbm93IHJlYWQgZnJvbSB0aGUgYnJp
ZGdlJ3MgRFQgbm9kZQo+ICAgICAKPiAgICAgdjQ6IFJlbW92ZSBpbmdlbmljLGxjZC1tb2RlIHBy
b3BlcnR5IGNvbXBsZXRlbHkuIFRoZSB2YXJpb3VzIG1vZGVzIGFyZSBub3cKPiAgICAgCWRlZHVj
ZWQgZnJvbSB0aGUgY29ubmVjdG9yIHR5cGUsIHRoZSBwaXhlbCBmb3JtYXQgb3IgdGhlIGJ1cyBm
bGFncy4KPiAgICAgCj4gICAgIHY1OiAtIEZpeCBmcmFtZWJ1ZmZlciBzaXplIGluY29ycmVjdGx5
IGNhbGN1bGF0ZWQgZm9yIDI0YnBwIGZyYW1lYnVmZmVycwo+ICAgICAJLSBVc2UgMzJicHAgZnJh
bWVidWZmZXIgaW5zdGVhZCBvZiAxNmJwcCwgYXMgaXQnbGwgd29yayB3aXRoIGJvdGgKPiAgICAg
CSAgMTYtYml0IGFuZCAyNC1iaXQgcGFuZWwKPiAgICAgCS0gR2V0IHJpZCBvZiBkcm1fZm9ybWF0
X3BsYW5lX2NwcCgpIHdoaWNoIGhhcyBiZWVuIGRyb3BwZWQgdXBzdHJlYW0KPiAgICAgCS0gQXZv
aWQgdXNpbmcgZHJtX2Zvcm1hdF9pbmZvLT5kZXB0aCwgd2hpY2ggaXMgZGVwcmVjYXRlZC4KSW4g
dGhlIGRybSB3b3JsZCB3ZSBpbmNsdWRlIHRoZSByZXZpc2lvbiBub3RlcyBpbiB0aGUgY2hhbmdl
bG9nLgpTbyBJIGRpZCB0aGlzIHdoZW4gSSBhcHBsaWVkIGl0IHRvIGRybS1taXNjLW5leHQuCgpG
aXhlZCBhIGZldyB0cml2aWFsIGNoZWNrcGF0Y2ggd2FybmluZ3MgYWJvdXQgaW5kZW50IHRvby4K
VGhlcmUgd2FzIGEgZmV3IHRvby1sb25nLWxpbmVzIHdhcm5pbmdzIHRoYXQgSSBpZ25vcmVkLiBG
aXhpbmcgdGhlbQp3b3VsZCBoYXZlIGh1cnQgcmVhZGFiaWxpdHkuCgpJIGFzc3VtZSB5b3Ugd2ls
bCBtYWludGFpbiB0aGlzIGRyaXZlciBvbndhcmRzIGZyb20gbm93LgpQbGVhc2UgcmVxdWVzdCBk
cm0tbWlzYyBjb21taXQgcmlnaHRzIChzZWUKaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3dp
a2kvQWNjb3VudFJlcXVlc3RzLykKWW91IHdpbGwgbmVlZCBhIGxlZ2FjeSBTU0ggYWNjb3VudC4K
CkFuZCB5b3Ugc2hvdWxkIGZhbWlsaWFyaXplIHlvdXJzZWxmIHdpdGggdGhlIG1haW50YWluZXIt
dG9vbHM6Cmh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZy9tYWludGFpbmVyLXRvb2xz
L2luZGV4Lmh0bWwKCkZvciBteSB1c2UgSSB1c2UgImRpbSB1cGRhdGUtYnJhbmNoZXM7IGRpbSBh
cHBseTsgZGltIHB1c2gKU28gb25seSBhIHNtYWxsIHN1YnNldCBpIG5lZWRlZCBmb3Igc2ltcGxl
IHVzZS4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
