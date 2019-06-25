Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F9D559CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 23:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB8E6E247;
	Tue, 25 Jun 2019 21:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD5B6E247
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 21:18:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E935B8032D;
 Tue, 25 Jun 2019 23:18:46 +0200 (CEST)
Date: Tue, 25 Jun 2019 23:18:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/panel: jh057n0090: Document
 power supply properties
Message-ID: <20190625211845.GA20625@ravnborg.org>
References: <cover.1561482165.git.agx@sigxcpu.org>
 <5ebbc0cf3fc8fcfd0300fb4d81be5acae156a4d4.1561482165.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ebbc0cf3fc8fcfd0300fb4d81be5acae156a4d4.1561482165.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=ze386MxoAAAA:8 a=awSIf4GHbRsm4FXq22sA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=iBZjaW-pnkserzjvUTHh:22
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
 Purism Kernel Team <kernel@puri.sm>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDc6MDU6MThQTSArMDIwMCwgR3VpZG8gR8O8bnRoZXIg
d3JvdGU6Cj4gRG9jdW1lbnQgdGhlIHZjYy1zdXBwbHkgYW5kIGlvdmNjLXN1cHBseSBwcm9wZXJ0
ZXMgb2YgdGhlIFJvY2t0ZWNoCj4gamgwNTduMDA5MCBwYW5lbC4Kcy9wcm9wZXJ0ZXMvcHJvcGVy
dGllcwpzL2poMDU3bjAwOTAvamgwNTduMDA5MDAKCldpdGggdGhlc2UgZml4ZWQ6ClJldmlld2Vk
LWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gCj4gU2lnbmVkLW9mZi1ieTog
R3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL2Rp
c3BsYXkvcGFuZWwvcm9ja3RlY2gsamgwNTduMDA5MDAudHh0ICAgICAgICAgIHwgNSArKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3
bjAwOTAwLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnR4dAo+IGluZGV4IDFiNTc2MzIwMGNmNi4uYTM3MmM1
ZDg0Njk1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAwLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JvY2t0ZWNoLGpoMDU3bjAwOTAw
LnR4dAo+IEBAIC01LDYgKzUsOSBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIHJlZzogRFNJ
IHZpcnR1YWwgY2hhbm5lbCBvZiB0aGUgcGVyaXBoZXJhbAo+ICAtIHJlc2V0LWdwaW9zOiBwYW5l
bCByZXNldCBncGlvCj4gIC0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQgZGV2
aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAo+ICstIHZjYy1zdXBwbHk6IHBoYW5kbGUgb2YgdGhl
IHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSB2Y2Mgc3VwcGx5IHZvbHRhZ2UuCj4gKy0gaW92
Y2Mtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyB0aGUgaW92
Y2Mgc3VwcGx5Cj4gKyAgdm9sdGFnZS4KPiAgCj4gIEV4YW1wbGU6Cj4gIAo+IEBAIC0xNCw1ICsx
Nyw3IEBAIEV4YW1wbGU6Cj4gIAkJCXJlZyA9IDwwPjsKPiAgCQkJYmFja2xpZ2h0ID0gPCZiYWNr
bGlnaHQ+Owo+ICAJCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzMgMTMgR1BJT19BQ1RJVkVfTE9XPjsK
PiArCQkJdmNjLXN1cHBseSA9IDwmcmVnXzJ2OF9wPjsKPiArCQkJaW92Y2Mtc3VwcGx5ID0gPCZy
ZWdfMXY4X3A+Owo+ICAJCX07Cj4gIAl9Owo+IC0tIAo+IDIuMjAuMQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
