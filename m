Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCB62D3D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 03:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C57898BF;
	Tue,  9 Jul 2019 01:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4C898BF
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 01:00:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (softbank126163157105.bbtec.net
 [126.163.157.105])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1EEA56A;
 Tue,  9 Jul 2019 03:00:29 +0200 (CEST)
Date: Tue, 9 Jul 2019 04:00:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 17/60] dt-bindings: Add legacy 'toppoly' vendor prefix
Message-ID: <20190709010004.GD4819@pendragon.ideasonboard.com>
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-1-laurent.pinchart@ideasonboard.com>
 <20190707181937.6250-14-laurent.pinchart@ideasonboard.com>
 <CAL_JsqLJy=UCeQ_Ex7tFh2OjtitNFVjT4v=PDZSbseva+ZrGDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLJy=UCeQ_Ex7tFh2OjtitNFVjT4v=PDZSbseva+ZrGDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1562634030;
 bh=JcoNvT6UrNwEt+JAKB+7zeJTg9CMTlg7f+WQ+ug96XA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJ0dnaeWZoBDMj0jnrK99OHQkR2NJ0rWC5xGY2fL7nW9Cl7NDb0ePwDHRPL56kUR6
 u2Wiqg1TbBPafN9RBiuGxFkbZzixD1txIm1yJHrrm751ziIsNMSOUErN2BN76ci26w
 1D+6jM1yyDMJ/NlGZCCH1Ht9P9E2UVwrXPh0a5aU=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gTW9uLCBKdWwgMDgsIDIwMTkgYXQgMDE6MDA6MzVQTSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6Cj4gT24gU3VuLCBKdWwgNywgMjAxOSBhdCAxMjoyNSBQTSBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4KPiA+IFRoZSAndG9wcG9seScgdmVuZG9yIHByZWZpeCBpcyBpbiB1
c2UgYW5kIHJlZmVycyB0byBUUE8sIHdob3NlIERUIHZlbmRvcgo+ID4gcHJlZml4IGlzIGFscmVh
ZHkgZGVmaW5lZCBhcyAndHBvJy4gQWRkICd0b3Bwb2x5JyBhcyBhbiBhbHRlcm5hdGl2ZSBhbmQK
PiA+IGRvY3VtZW50IGl0IGFzIGxlZ2FjeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50
IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiAtLS0KPiA+
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwg
fCAyICsrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVz
LnlhbWwKPiA+IGluZGV4IDI1MTQ0NjNmMmM2My4uZDc4NTI3ZWI4MjU0IDEwMDY0NAo+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZp
eGVzLnlhbWwKPiA+IEBAIC04NjcsNiArODY3LDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gPiAg
ICAgIGRlc2NyaXB0aW9uOiBUZWNvbiBNaWNyb3Byb2Nlc3NvciBUZWNobm9sb2dpZXMsIExMQy4K
PiA+ICAgICJedG9wZWV0LC4qIjoKPiA+ICAgICAgZGVzY3JpcHRpb246IFRvcGVldAo+ID4gKyAg
Il50b3Bwb2x5LC4qIjoKPiA+ICsgICAgZGVzY3JpcHRpb246IFRQTyAobGVnYWN5IHByZWZpeCwg
c2VlICd0cG8nKQo+IAo+IEFkZCAnZGVwcmVjYXRlZDogdHJ1ZScgYWxzby4gVGhhdCdzIGEgbmV3
IHByb3BlcnR5IGluIGpzb24tc2NoZW1hCj4gZHJhZnQ4LiBJdCdzIG5vdCB1c2VkIGZvciBhbnl0
aGluZyB5ZXQgb3RoZXIgdGhhbiBkb2N1bWVudGF0aW9uLgoKVGhhbmsgeW91IGZvciB0aGUgcG9p
bnRlci4KCkJ5IHRoZSB3YXkgdGhpcyBzZXJpZXMgY29uZmxpY3RzIHdpdGggeW91ciBwYXRjaGVz
IHRoYXQgbW92ZSBhbGwgcGFuZWwKYmluZGluZ3MgdG8geWFtbC4gSSdsbCByZWJhc2UgaXQgb24g
dG9wIGlmIHlvdXJzIGdldHMgbWVyZ2VkIGZpcnN0LgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
