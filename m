Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C3A56A20
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 15:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12E16E423;
	Wed, 26 Jun 2019 13:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DD96E423
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 13:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 8E490FB03;
 Wed, 26 Jun 2019 15:15:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHUvfR61ehuQ; Wed, 26 Jun 2019 15:15:32 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id E7FEF48EAB; Wed, 26 Jun 2019 15:15:31 +0200 (CEST)
Date: Wed, 26 Jun 2019 15:15:31 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 0/4] drm/panel: jh057n0090: Add regulators and drop
 magic value in init
Message-ID: <20190626131531.GA25354@bogon.m.sigxcpu.org>
References: <cover.1561542477.git.agx@sigxcpu.org>
 <20190626124139.GB7337@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626124139.GB7337@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

SGksCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDAyOjQxOjM5UE0gKzAyMDAsIFNhbSBSYXZuYm9y
ZyB3cm90ZToKPiBIaSBHdWlkby4KPiAKPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAxMjozNzo0
N1BNICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+IEZpeCB0aGUgb21pc3Npb24gb2Yg
YSByZWd1bGF0b3JzIGZvciB0aGUgcmVjZW50bHkgYWRkZWQgcGFuZWwgYW5kIG1ha2Ugc3VyZSBh
bGwKPiA+IGRzaSBjb21tYW5kcyBzdGFydCB3aXRoIGEgY29tbWFuZCBpbnN0ZWFkIG9mIG9uZSBo
YXZpbmcgYSBtYWdpYyBjb25zdGFudCAod2hpY2gKPiA+IGFscmVhZHkgY2F1c2VkIGNvbmZ1c2lv
bikuCj4gPiAKPiA+IEFsc28gYWRkcyBhIG1haWwgYWxpYXMgdG8gdGhlIHBhbmVsJ3MgTUFJTlRB
SU5FUiBlbnRyeSB0byByZWR1Y2UgdGhlIGJ1cwo+ID4gZmFjdG9yLgo+ID4gCj4gPiBDaGFuZ2Vz
IGZyb20gdjE6Cj4gPiAqIEFzIHBlciByZXZpZXcgY29tbWVudHMgZnJvbSBTYW0gUmF2bmJvcmc6
Cj4gPiAgIC0gUHJpbnQgZXJyb3Igb24gZGV2bV9yZWd1bGF0b3JfZ2V0KCkgZmFpbHJlcwo+ID4g
ICAtIEZpeCB0eXBvcyBpbiBjb21taXQgbWVzc2FnZXMKPiA+ICogUHJpbnQgYW4gZXJyb3Igb24g
cmVndWxhdG9yX2VuYWJsZSgpCj4gPiAqIERpc2FibGUgdmNjIGlmIGlvdmNjIGZhaWxzIHRvIGVu
YWJsZQo+ID4gCj4gPiBHdWlkbyBHw7xudGhlciAoNCk6Cj4gPiAgIE1BSU5UQUlORVJTOiBBZGQg
UHVyaXNtIG1haWwgYWxpYXMgYXMgcmV2aWV3ZXIgZm9yIHRoZWlyIGRldmtpdCdzCj4gPiAgICAg
cGFuZWwKPiA+ICAgZHJtL3BhbmVsOiBqaDA1N24wMDkwMDogRG9uJ3QgdXNlIG1hZ2ljIGNvbnN0
YW50Cj4gPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5L3BhbmVsOiBqaDA1N24wMDkwMDogRG9jdW1l
bnQgcG93ZXIgc3VwcGx5Cj4gPiAgICAgcHJvcGVydGllcwo+ID4gICBkcm0vcGFuZWw6IGpoMDU3
bjAwOTAwOiBBZGQgcmVndWxhdG9yIHN1cHBvcnQKPiAKPiBQYXRjaGVzIGFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dCBhbmQgcHVzaGVkIG91dAoKVGhhbmsgeW91IQogLS0gR3VpZG8KCj4gCj4gCVNh
bQo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
