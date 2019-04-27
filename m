Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A06B2E0
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 08:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0EE89272;
	Sat, 27 Apr 2019 06:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5207289272
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 06:32:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 109D120025;
 Sat, 27 Apr 2019 08:32:15 +0200 (CEST)
Date: Sat, 27 Apr 2019 08:32:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 2/3] drm: Add bus flag for Sharp-specific signals
Message-ID: <20190427063214.GA13123@ravnborg.org>
References: <20190425231854.24479-1-paul@crapouillou.net>
 <20190425231854.24479-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425231854.24479-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=o6lnpZa0LUvyYah9iqMA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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

SGkgUGF1bAoKT24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDE6MTg6NTNBTSArMDIwMCwgUGF1bCBD
ZXJjdWVpbCB3cm90ZToKPiBBZGQgdGhlIERSTV9CVVNfRkxBR19TSEFSUF9TSUdOQUxTIHRvIHRo
ZSBkcm1fYnVzX2ZsYWdzIGVudW0uCj4gCj4gVGhpcyBmbGFncyBjYW4gYmUgdXNlZCB3aGVuIHRo
ZSBkaXNwbGF5IG11c3QgYmUgZHJpdmVuIHdpdGggdGhlCj4gU2hhcnAtc3BlY2lmaWMgc2lnbmFs
cyBTUEwsIENMUywgUkVWLCBQUy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6IE5ldyBwYXRj
aAo+IAo+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAzICsrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9j
b25uZWN0b3IuaCBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IGluZGV4IDAyYTEzMTIw
MmFkZC4uYWM3ZDU4ZmQxZTAzIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0
b3IuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+IEBAIC0zMjMsNiArMzIz
LDggQEAgZW51bSBkcm1fcGFuZWxfb3JpZW50YXRpb24gewo+ICAgKgkJCQkJZWRnZSBvZiB0aGUg
cGl4ZWwgY2xvY2sKPiAgICogQERSTV9CVVNfRkxBR19TWU5DX1NBTVBMRV9ORUdFREdFOglTeW5j
IHNpZ25hbHMgYXJlIHNhbXBsZWQgb24gdGhlIGZhbGxpbmcKPiAgICoJCQkJCWVkZ2Ugb2YgdGhl
IHBpeGVsIGNsb2NrCj4gKyAqIEBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFMUzoJCVNldCBpZiB0
aGUgU2hhcnAtc3BlY2lmaWMgc2lnbmFscwo+ICsgKgkJCQkJKFNQTCwgQ0xTLCBQUywgUkVWKSBt
dXN0IGJlIHVzZWQKPiAgICovCj4gIGVudW0gZHJtX2J1c19mbGFncyB7Cj4gIAlEUk1fQlVTX0ZM
QUdfREVfTE9XID0gQklUKDApLAo+IEBAIC0zNDEsNiArMzQzLDcgQEAgZW51bSBkcm1fYnVzX2Zs
YWdzIHsKPiAgCURSTV9CVVNfRkxBR19TWU5DX0RSSVZFX05FR0VER0UgPSBEUk1fQlVTX0ZMQUdf
U1lOQ19ORUdFREdFLAo+ICAJRFJNX0JVU19GTEFHX1NZTkNfU0FNUExFX1BPU0VER0UgPSBEUk1f
QlVTX0ZMQUdfU1lOQ19ORUdFREdFLAo+ICAJRFJNX0JVU19GTEFHX1NZTkNfU0FNUExFX05FR0VE
R0UgPSBEUk1fQlVTX0ZMQUdfU1lOQ19QT1NFREdFLAo+ICsJRFJNX0JVU19GTEFHX1NIQVJQX1NJ
R05BTFMgPSBCSVQoOCksCj4gIH07CgpUaGlzIHNvbHV0aW9ucyBsb29rcyB2ZXJ5IGdvb2QgdG8g
bWUuCk5vdyB0aGUgcGFuZWwgY2FuIHJlcG9ydCB0byB0aGUgZGlzcGxheSBkcml2ZXIgdGhhdCBp
cyBuZWVkcyB0aGUKRFJNX0JVU19GTEFHX1NIQVJQX1NJR05BTFMsIHNvIHRoZSBkaXNwbGF5IGRy
aXZlciBjYW4gYWRhcHQgdG8gdGhlCmNvbm5lY3RlZCBkaXNwbGF5LgpPYnZpb3VzbHkgbm90IG1h
bnkgZGlzcGxheSBkcml2ZXJzIHdpbGwgc3VwcG9ydCBEUk1fQlVTX0ZMQUdfU0hBUlBfU0lHTkFM
UwpidXQgdGhlIG9uZSB0aGF0IGRvZXMgbm93IG5vIGxvbmdlciBuZWVkIHRvIGluY2x1ZGUgcGFu
ZWwgY29uZmlndXJhdGlvbi4KCllvdSBjYW4gYWRkOgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgoKQnV0IHdlIG5lZWQgVGhpZXJyeSBvciBzb21lb25lIGVsc2Ug
d2l0aCBtb3JlIGtub3dsZWRnZSBpbiB0aGlzCmFyZWEgdG8gY29tbWVudCBvbiB0aGlzIGJlZm9y
ZSB3ZSBjYW4gYXBwbHkgaXQuCmRybV9idXNfZmxhZyBpcyB0b2RheSBvbmx5IHRpbWluZyByZWxh
dGVkIGNvbmZpZywgYW5kIHRoZXJlIGJlIGEgYmV0dGVyCndheSB0byBkbyB0aGlzLgoKVGhpZXJy
eT8KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
