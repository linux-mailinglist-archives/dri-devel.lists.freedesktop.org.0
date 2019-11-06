Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0517F2849
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 08:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829006EEB0;
	Thu,  7 Nov 2019 07:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4196ED94
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 15:07:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA53BB143;
 Wed,  6 Nov 2019 15:07:17 +0000 (UTC)
Message-ID: <82d17114302562e0c553e2ea936974f77734e86b.camel@suse.de>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion
 to YAML
From: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>
To: Rob Herring <robh@kernel.org>
Date: Wed, 06 Nov 2019 16:07:39 +0100
In-Reply-To: <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-2-afaerber@suse.de>
 <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
Organization: SUSE Linux GmbH
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Nov 2019 07:43:23 +0000
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
 Guillaume Gardet <guillaume.gardet@arm.com>,
 linux-realtek-soc@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIGRlbiAwNi4xMS4yMDE5LCAwODoyNCAtMDYwMCBzY2hyaWViIFJvYiBIZXJy
aW5nOgo+IE9uIFN1biwgTm92IDMsIDIwMTkgYXQgNzo0MCBQTSBBbmRyZWFzIEbDpHJiZXIgPGFm
YWVyYmVyQHN1c2UuZGU+Cj4gd3JvdGU6Cj4gPiBJbnN0ZWFkIG9mIGdyb3VwaW5nIGFscGhhYmV0
aWNhbGx5IGJ5IHRoaXJkLXBhcnR5IHZlbmRvciwgbGVhZGluZwo+ID4gdG8KPiA+IG9uZS1lbGVt
ZW50IGVudW1zLCBzb3J0IGJ5IE1hbGkgbW9kZWwgbnVtYmVyLCBhcyBkb25lIGZvciBVdGdhcmQu
Cj4gPiAKPiA+IFRoaXMgYWxyZWFkeSBhbGxvd3MgdXMgdG8gZGUtZHVwbGljYXRlIHR3byAiYXJt
LG1hbGktdDc2MCIgc2VjdGlvbnMKPiA+IGFuZAo+ID4gd2lsbCBtYWtlIGl0IGVhc2llciB0byBh
ZGQgbmV3IHZlbmRvciBjb21wYXRpYmxlcy4KPiAKPiBUaGF0IHdhcyB0aGUgaW50ZW50LiBOb3Qg
c3VyZSBob3cgSSBtZXNzZWQgdGhhdCB1cC4uLgo+IAo+IFRoaXMgcGF0Y2ggaXMgcHJvYmxlbWF0
aWMgYmVjYXVzZSB0aGVyZSdzIGNoYW5nZXMgaW4gYXJtLXNvYyBqdW5vL2R0Cj4gYnJhbmNoIGFu
ZCB0aGVyZSdzIG5vdyBhIHBhdGNoIGZvciBleHlub3M1NDIwICh0NjI4KS4gSSdkIHByb3Bvc2Ug
SQo+IGFwcGx5IHRoaXMgc3VjaCB0aGF0IHdlIGRvbid0IGdldCBhIG1lcmdlIGNvbmZsaWN0IHdp
dGgganVuby9kdCBhbmQKPiB3ZQo+IGZpbmlzaCByZXNvcnRpbmcgYWZ0ZXIgcmMxIChvciB3aGVu
IGJvdGggYnJhbmNoZXMgYXJlIGluIExpbnVzJwo+IHRyZWUpLgoKVGhpcyBzZXJpZXMgaGFzIGRl
cGVuZGVuY2llcyBmb3IgdGhlIFJlYWx0ZWstc2lkZSBSRkMgcGF0Y2hlcyBhbmQgaXMKbm90IHll
dCByZWFkeSB0byBtZXJnZSwgc28geW91IGNhbiB0YWtlIHRoaXMgcHJlcCBQQVRDSCB0aHJvdWdo
IHlvdXIKdHJlZSBmb3IgdjUuNiBwcm9iYWJseSwgb3IgZmVlbCBmcmVlIHRvIHJlYmFzZS9yZXdv
cmsgYXMgeW91IHNlZSBmaXQgLQpJJ2QganVzdCBhcHByZWNpYXRlIGJlaW5nIGNyZWRpdGVkIGF0
IGxlYXN0IHZpYSBSZXBvcnRlZC1ieS4gOikKClRoYW5rcywKQW5kcmVhcwoKLS0gClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkKR0Y6IEZlbGl4IEltZW5kw7ZyZmZlcgpIUkIgMzY4MDkgKEFHIE7DvHJuYmVy
ZykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
