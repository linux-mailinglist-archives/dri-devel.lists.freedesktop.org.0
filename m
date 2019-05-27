Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E26772BB6A
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 22:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101CA89B20;
	Mon, 27 May 2019 20:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441B489B20
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 20:29:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5422180349;
 Mon, 27 May 2019 22:29:34 +0200 (CEST)
Date: Mon, 27 May 2019 22:29:32 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Extend drm_bus_flags? [Was: [PATCH v3 2/3] drm: Add bus flag for
 Sharp-specific signals]
Message-ID: <20190527202932.GA28319@ravnborg.org>
References: <20190425231854.24479-1-paul@crapouillou.net>
 <20190425231854.24479-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425231854.24479-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=e5mUnYsNAAAA:8 a=o6lnpZa0LUvyYah9iqMA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLgoKUGxlYXNlIHNlZSBtYWlsIGJlbG93IC0gaXMgaXQgT0sgdG8gZXh0ZW5kIGRybV9i
dXNfZmxhZ3MgdG8KcmVwcmVzZW50ICJTSEFSUCBzaWduYWxzIj8KClBhdWwgKGFuZCBJKSBjb3Vs
ZCBub3QgZmluZCBhbnkgYmV0dGVyIHdheSB0byBsZXQgdGhlIHBhbmVsIHRlbGwgdGhlCmRpc3Bs
YXkgZHJpdmVyIHRoYXQgaXQgcmVxdWlyZXMgdGhlIHNwZWNpYWwgU0hBUlAgc2lnbmFscy4KClRo
aXMgaGFzIGJlZW4gcGVuZGluZyBhbG1vc3QgYSBtb250aCBub3cgYW5kIGl0IHdvdWxkIG9ubHkg
YmUgZmFpcgp0byBlaXRoZXIgYWNjZXB0IHRoZSBzb2x1dGlvbiBvciB0byBnaXZlIFBhdWwgZ3Vp
ZGlhbmNlIGhvdyB0byBtb3ZlCmZvcndhcmQuCgpUaGVyZSBpcyBhIGRpc3BsYXkgZHJpdmVyIHRo
YXQgYXdhaXRzIHRoZSByZXNpbHV0aW9ucyBvZiB0aGlzIGlzc3VlLgoKCVNhbQoKT24gRnJpLCBB
cHIgMjYsIDIwMTkgYXQgMDE6MTg6NTNBTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToKPiBB
ZGQgdGhlIERSTV9CVVNfRkxBR19TSEFSUF9TSUdOQUxTIHRvIHRoZSBkcm1fYnVzX2ZsYWdzIGVu
dW0uCj4gCj4gVGhpcyBmbGFncyBjYW4gYmUgdXNlZCB3aGVuIHRoZSBkaXNwbGF5IG11c3QgYmUg
ZHJpdmVuIHdpdGggdGhlCj4gU2hhcnAtc3BlY2lmaWMgc2lnbmFscyBTUEwsIENMUywgUkVWLCBQ
Uy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5l
dD4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6IE5ldyBwYXRjaAo+IAo+ICBpbmNsdWRlL2Ry
bS9kcm1fY29ubmVjdG9yLmggfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCBiL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDAyYTEzMTIwMmFkZC4uYWM3ZDU4ZmQxZTAz
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ICsrKyBiL2luY2x1
ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC0zMjMsNiArMzIzLDggQEAgZW51bSBkcm1fcGFu
ZWxfb3JpZW50YXRpb24gewo+ICAgKgkJCQkJZWRnZSBvZiB0aGUgcGl4ZWwgY2xvY2sKPiAgICog
QERSTV9CVVNfRkxBR19TWU5DX1NBTVBMRV9ORUdFREdFOglTeW5jIHNpZ25hbHMgYXJlIHNhbXBs
ZWQgb24gdGhlIGZhbGxpbmcKPiAgICoJCQkJCWVkZ2Ugb2YgdGhlIHBpeGVsIGNsb2NrCj4gKyAq
IEBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFMUzoJCVNldCBpZiB0aGUgU2hhcnAtc3BlY2lmaWMg
c2lnbmFscwo+ICsgKgkJCQkJKFNQTCwgQ0xTLCBQUywgUkVWKSBtdXN0IGJlIHVzZWQKPiAgICov
Cj4gIGVudW0gZHJtX2J1c19mbGFncyB7Cj4gIAlEUk1fQlVTX0ZMQUdfREVfTE9XID0gQklUKDAp
LAo+IEBAIC0zNDEsNiArMzQzLDcgQEAgZW51bSBkcm1fYnVzX2ZsYWdzIHsKPiAgCURSTV9CVVNf
RkxBR19TWU5DX0RSSVZFX05FR0VER0UgPSBEUk1fQlVTX0ZMQUdfU1lOQ19ORUdFREdFLAo+ICAJ
RFJNX0JVU19GTEFHX1NZTkNfU0FNUExFX1BPU0VER0UgPSBEUk1fQlVTX0ZMQUdfU1lOQ19ORUdF
REdFLAo+ICAJRFJNX0JVU19GTEFHX1NZTkNfU0FNUExFX05FR0VER0UgPSBEUk1fQlVTX0ZMQUdf
U1lOQ19QT1NFREdFLAo+ICsJRFJNX0JVU19GTEFHX1NIQVJQX1NJR05BTFMgPSBCSVQoOCksCj4g
IH07Cj4gIAo+ICAvKioKPiAtLSAKPiAyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOAo+IAo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
