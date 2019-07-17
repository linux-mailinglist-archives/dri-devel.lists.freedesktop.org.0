Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA296BCD2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843FC6E14C;
	Wed, 17 Jul 2019 13:15:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469846E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 13:15:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7BCA620020;
 Wed, 17 Jul 2019 15:15:34 +0200 (CEST)
Date: Wed, 17 Jul 2019 15:15:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
Message-ID: <20190717131533.GB4852@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717115817.30110-7-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=WZHNqt2aAAAA:8
 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=GB3B8s0AqN8bVpG5rlwA:9
 a=wPNLvfGTeEIA:10 a=PrHl9onO2p7xFKlKy1af:22 a=vFet0B0WnEQeilDPIY6i:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMDE6NTg6MTNQTSArMDIwMCwgTm9y
YWxmIFRyw7hubmVzIHdyb3RlOgo+IFRoaXMgaXMgb25seSB1c2VkIGJ5IG1pcGktZGJpIGRyaXZl
cnMgc28gbW92ZSBpdCB0aGVyZS4KPiAKPiBUaGUgcmVhc29uIHRoaXMgaXNuJ3QgbW92ZWQgdG8g
dGhlIFNQSSBzdWJzeXN0ZW0gaXMgdGhhdCBpdCB3aWxsIGluIGEKPiBsYXRlciBwYXRjaCBwYXNz
IGEgZHVtbXkgcnggYnVmZmVyIGZvciBTUEkgY29udHJvbGxlcnMgdGhhdCBuZWVkIHRoaXMuCj4g
TG93IG1lbW9yeSBib2FyZHMgKDY0TUIpIGNhbiBydW4gaW50byBhIHByb2JsZW0gYWxsb2NhdGlu
ZyBzdWNoIGEgImxhcmdlIgo+IGNvbnRpZ3VvdXMgYnVmZmVyIG9uIGV2ZXJ5IHRyYW5zZmVyIGFm
dGVyIGEgbG9uZyB1cCB0aW1lLgo+IFRoaXMgbGVhdmVzIGEgdmVyeSBzcGVjaWZpYyB1c2UgY2Fz
ZSwgc28gd2UnbGwga2VlcCB0aGUgZnVuY3Rpb24gaGVyZS4KPiBtaXBpLWRiaSB3aWxsIGZpcnN0
IGdvIHRocm91Z2ggYSByZWZhY3RvcmluZyB0aG91Z2gsIGJlZm9yZSB0aGlzIHdpbGwKPiBiZSBk
b25lLgo+IAo+IFJlbW92ZSBTUEkgdG9kbyBlbnRyeSBub3cgdGhhdCB3ZSdyZSBkb25lIHdpdGgg
dGhlIHRpbnlkcm0ua28gU1BJIGNvZGUuCj4gCj4gQWRkaXRpb25hbGx5IG1vdmUgdGhlIG1pcGlf
ZGJpX3NwaV9pbml0KCkgZGVjbGFyYXRpb24gdG8gdGhlIG90aGVyIFNQSQo+IGZ1bmN0aW9ucy4K
PiAKPiBDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+CldpdGggdGhlIGZldyBu
aXRwaWNzIGNvbnNpZGVyZWQ6ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CgoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oIGIv
aW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oCj4gaW5kZXggNTFmYzY2N2JlZWY3Li41NzZl
OWE3MzQ5YWIgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vdGlueWRybS9taXBpLWRiaS5oCj4gQEAgLTY3LDggKzY3LDYgQEAg
c3RhdGljIGlubGluZSBzdHJ1Y3QgbWlwaV9kYmkgKmRybV90b19taXBpX2RiaShzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtKQo+ICAJcmV0dXJuIGNvbnRhaW5lcl9vZihkcm0sIHN0cnVjdCBtaXBpX2Ri
aSwgZHJtKTsKPiAgfQo+ICAKPiAtaW50IG1pcGlfZGJpX3NwaV9pbml0KHN0cnVjdCBzcGlfZGV2
aWNlICpzcGksIHN0cnVjdCBtaXBpX2RiaSAqbWlwaSwKPiAtCQkgICAgICBzdHJ1Y3QgZ3Bpb19k
ZXNjICpkYyk7Ck1vdmluZyB0aGlzIHByb3RvdHlwZSBsb29rcyBsaWtlIGl0IGJlbG9uZ3MgaW4g
YW5vdGhlciBwYXRjaD8KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
