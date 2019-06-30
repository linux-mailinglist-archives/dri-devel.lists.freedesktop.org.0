Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D81945AF61
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 10:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D23A899B7;
	Sun, 30 Jun 2019 08:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29633899B7;
 Sun, 30 Jun 2019 08:16:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3DEDC20065;
 Sun, 30 Jun 2019 10:16:04 +0200 (CEST)
Date: Sun, 30 Jun 2019 10:16:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/panel: make drm_panel.h self-contained
Message-ID: <20190630081602.GB5081@ravnborg.org>
References: <20190627110103.7539-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627110103.7539-1-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=P-IC7800AAAA:8
 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=4pJgdKY-X3TIkPgY1f4A:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaS4KCk9uIFRodSwgSnVuIDI3LCAyMDE5IGF0IDAyOjAxOjAzUE0gKzAzMDAsIEphbmkg
TmlrdWxhIHdyb3RlOgo+IEZpeCBidWlsZCB3YXJuaW5nIGlmIGRybV9wYW5lbC5oIGlzIGJ1aWx0
IHdpdGggQ09ORklHX09GPW4gb3IKPiBDT05GSUdfRFJNX1BBTkVMPW4gYW5kIGluY2x1ZGVkIHdp
dGhvdXQgdGhlIHByZXJlcXVpc2l0ZSBlcnIuaDoKPiAKPiAuL2luY2x1ZGUvZHJtL2RybV9wYW5l
bC5oOiBJbiBmdW5jdGlvbiDigJhvZl9kcm1fZmluZF9wYW5lbOKAmToKPiAuL2luY2x1ZGUvZHJt
L2RybV9wYW5lbC5oOjIwMzo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rp
b24g4oCYRVJSX1BUUuKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgIHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+ICAgICAgICAgIF5+fn5+fn4KPiAuL2luY2x1
ZGUvZHJtL2RybV9wYW5lbC5oOjIwMzo5OiBlcnJvcjogcmV0dXJuaW5nIOKAmGludOKAmSBmcm9t
IGEgZnVuY3Rpb24gd2l0aCByZXR1cm4gdHlwZSDigJhzdHJ1Y3QgZHJtX3BhbmVsICrigJkgbWFr
ZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgWy1XZXJyb3I9aW50LWNvbnZl
cnNpb25dCj4gICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPiAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+Cj4gCj4gRml4ZXM6IDVmYThlNGEyMjE4MiAoImRybS9wYW5lbDogTWFrZSBvZl9kcm1f
ZmluZF9wYW5lbCgpIHJldHVybiBhbiBFUlJfUFRSKCkgaW5zdGVhZCBvZiBOVUxMIikKPiBDYzog
Qm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+Cj4gQ2M6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KCldoZW4gd2Ugc3RhcnQgdG8gZGVwbG95IGhlYWRlcnMtdGVzdCBJIGV4
cGVjdCB1cyB0byBmaW5kIG1hbnkgbW9yZSBvZgp0aGlzIGNsYXNzIG9mIGlzc3Vlcy4KQnV0IGxl
dHMgZ2V0IHRoZW0gZml4ZWQgc28gd2UgZG8gbm90IHNlZSBzcG9yYWRpYyBidWlsZCBlcnJvcnMg
ZHVlCnRvIG1pc3NpbmcgZGVwZW5kZW5jaWVzIGluIHRoZSBoZWFkZXIgZmlsZXMuCgpJIGFzc3Vt
ZSB5b3Ugd2lsbCBjb21taXQgdGhlIGZpeC4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
