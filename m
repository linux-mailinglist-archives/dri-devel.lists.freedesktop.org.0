Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E486C2C6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 23:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE4389D42;
	Wed, 17 Jul 2019 21:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9187C89D42
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 21:51:06 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 7F1DD5C02AF;
 Wed, 17 Jul 2019 23:51:04 +0200 (CEST)
MIME-Version: 1.0
Date: Wed, 17 Jul 2019 23:51:04 +0200
From: Stefan Agner <stefan@agner.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 05/33] drm/mxsfb: drop use of drmP.h
In-Reply-To: <20190715162815.GC27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-6-sam@ravnborg.org>
 <a2727131814fe53ed162853f1215ba45@agner.ch>
 <20190715162815.GC27038@ravnborg.org>
Message-ID: <5f25e5de0a908c25d89e7c8f81dc3be3@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1563400264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uth6fLeys8HDB4u6TB/dHVDpp/rfkpeApY6+uB3BCDY=;
 b=Aqdb2TGTP3Frx4PVbsw1zZ38lDC1juJFEMcUSpYP6+zkw2xdxLTJxKU0J/bQkzXr0JgU8a
 l9hvJDqv4eFaWqSBN2Kt9U+QBAbrZiQ+Dit12xatORWJLIKn3+O31jmu4Qb+nBvQgTf02a
 f3akyjhvUdxbEi573iT++jgLPyH/Bko=
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sam Ravnborg <sam.ravnborg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xNSAxODoyOCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+IE9uIEZyaSwgSnVsIDA1
LCAyMDE5IGF0IDEwOjQ3OjMwUE0gKzAyMDAsIFN0ZWZhbiBBZ25lciB3cm90ZToKPj4gT24gMjAx
OS0wNi0zMCAwODoxOCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+PiA+IERyb3AgdXNlIG9mIHRoZSBk
ZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPj4gPgo+PiA+IFdoaWxlIHRvdWNoaW5nIHRo
ZSBsaXN0IG9mIGluY2x1ZGUgZmlsZXMgZGl2aWRlZCB0aGVtCj4+ID4gaW4gYmxvY2tzIGFuZCBz
b3J0IHRoZW0gd2l0aGluIGVhY2ggYmxvY2suCj4+ID4gRml4ZWQgZmFsbG91dCBpbiB0aGUgcmVs
ZXZhbnQgZmlsZXMuCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4+ID4gQ2M6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiA+IENj
OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPj4gPiBDYzogRGF2aWQgQWlybGllIDxh
aXJsaWVkQGxpbnV4LmllPgo+PiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
Cj4+ID4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPj4gPiBDYzogU2FzY2hh
IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+PiA+IENjOiBQZW5ndXRyb25peCBLZXJu
ZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPgo+PiA+IENjOiBGYWJpbyBFc3RldmFtIDxm
ZXN0ZXZhbUBnbWFpbC5jb20+Cj4+ID4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhw
LmNvbT4KPj4gPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Cj4+
Cj4+IEFja2VkLWJ5OiBTdGVmYW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiAKPiBBcHBsaWVk
LCB0aGFua3MuCj4gCj4gQXMgYSBzdHJhbmdlIG5vdGUsIHRoaXMgbWFpbCBhbHNvIHNob3dlZCB1
cCBpbiBteSBnbWFpbCBhY2NvdW50Lgo+IE1heWJlIGJlY2F1c2UgSSBzZW5kIG1haWxzIG91dCB1
c2luZyBnbWFpbCBidXQgdGhlIG1haWwgYWRkcmVzcyBpcyBub3QKPiB2aXNpYmxlIGFueXdoZXJl
LiBBbnl3YXkgLSBqdXN0IGEgbm90ZS4KCkluIHRoZSBlbWFpbCBJIHJlY2VpdmVkIHlvdXIgZ21h
aWwgd2FzIGluIHRoZSBoZWFkZXIgYXMgIlNlbmRlciIsIGFuZAp0aGUgb3RoZXIgZW1haWwgaW4g
IkZyb20iLiBOb3Qgc3VyZSB3aGF0IGlzIHRoZSByaWdodCBhZGRyZXNzIHRvIGFuc3dlcgp0bywg
YnV0IGl0IHNlZW1zIHRoYXQgbXkgY2xpZW50IGNob3NlICJTZW5kZXIiLi4uPwoKLS0KU3RlZmFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
