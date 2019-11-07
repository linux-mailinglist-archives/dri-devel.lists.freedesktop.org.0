Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B559DF41AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA516F85C;
	Fri,  8 Nov 2019 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96526E3F7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 10:03:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C88CB2EE;
 Thu,  7 Nov 2019 10:03:28 +0000 (UTC)
Subject: Re: [PATCH 1/7] dt-bindings: gpu: mali-midgard: Tidy up conversion to
 YAML
To: Rob Herring <robh@kernel.org>
References: <20191104013932.22505-1-afaerber@suse.de>
 <20191104013932.22505-2-afaerber@suse.de>
 <CAL_JsqL3NOstoa5ZY1JE9e3Ay=WTmz153H-KbHErhi-GBX-5GA@mail.gmail.com>
 <82d17114302562e0c553e2ea936974f77734e86b.camel@suse.de>
 <CAL_JsqLDFefWVdiPuAktctuBpBeOvG-OVhX2aZn=UaiN55nodg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <3c9d7a8c-94e4-60b9-9a84-f368e227666e@suse.de>
Date: Thu, 7 Nov 2019 11:03:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLDFefWVdiPuAktctuBpBeOvG-OVhX2aZn=UaiN55nodg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
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

QW0gMDYuMTEuMTkgdW0gMTY6MzQgc2NocmllYiBSb2IgSGVycmluZzoKPiBPbiBXZWQsIE5vdiA2
LCAyMDE5IGF0IDk6MDcgQU0gQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPiB3cm90
ZToKPj4gQW0gTWl0dHdvY2gsIGRlbiAwNi4xMS4yMDE5LCAwODoyNCAtMDYwMCBzY2hyaWViIFJv
YiBIZXJyaW5nOgo+Pj4gVGhpcyBwYXRjaCBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIHRoZXJlJ3Mg
Y2hhbmdlcyBpbiBhcm0tc29jIGp1bm8vZHQKPj4+IGJyYW5jaCBhbmQgdGhlcmUncyBub3cgYSBw
YXRjaCBmb3IgZXh5bm9zNTQyMCAodDYyOCkuIEknZCBwcm9wb3NlIEkKPj4+IGFwcGx5IHRoaXMg
c3VjaCB0aGF0IHdlIGRvbid0IGdldCBhIG1lcmdlIGNvbmZsaWN0IHdpdGgganVuby9kdCBhbmQK
Pj4+IHdlCj4+PiBmaW5pc2ggcmVzb3J0aW5nIGFmdGVyIHJjMSAob3Igd2hlbiBib3RoIGJyYW5j
aGVzIGFyZSBpbiBMaW51cycKPj4+IHRyZWUpLgo+Pgo+PiBUaGlzIHNlcmllcyBoYXMgZGVwZW5k
ZW5jaWVzIGZvciB0aGUgUmVhbHRlay1zaWRlIFJGQyBwYXRjaGVzIGFuZCBpcwo+PiBub3QgeWV0
IHJlYWR5IHRvIG1lcmdlLCBzbyB5b3UgY2FuIHRha2UgdGhpcyBwcmVwIFBBVENIIHRocm91Z2gg
eW91cgo+PiB0cmVlIGZvciB2NS42IHByb2JhYmx5LCBvciBmZWVsIGZyZWUgdG8gcmViYXNlL3Jl
d29yayBhcyB5b3Ugc2VlIGZpdCAtCj4+IEknZCBqdXN0IGFwcHJlY2lhdGUgYmVpbmcgY3JlZGl0
ZWQgYXQgbGVhc3QgdmlhIFJlcG9ydGVkLWJ5LiA6KQo+IAo+IEkgd2FzIGFzc3VtaW5nIHRoZSBu
b24tUkZDIHBhdGNoZXMgYXJlIGdvb2QgdG8gZ28sIHNvIEkgd2FzIGdvaW5nIHRvCj4gcGljayB1
cCAxLCAyLCBhbmQgNy4KCkFjdHVhbGx5IDEsIDIgYW5kIDQgc2hvdWxkIGJlIGdvb2QgdG8gZ287
IDcgaWYgeW91IGZpeCB0aGUgc3ViamVjdCBvciBpZgpJIHJlc3Bpbi4gQWxzbyA2IGlmIHlvdSBj
YW4gaGF2ZSBzb21lb25lIGNoZWNrIHRoYXQgbm8gbmV3IHByb3BlcnRpZXMKd2lsbCBiZSBuZWVk
ZWQgZm9yIDQ3MCAobm8gTGludXggZHJpdmVyIHN1cHBvcnQgeWV0KS4KCkFsbCBidXQgMSBhc3N1
bWluZyB5b3UnbGwgYmUgb2theSB0byBhZGQgU29DLXNwZWNpZmljIHJlc3RyaWN0aW9ucyBvbgpj
bG9ja3MvcmVzZXRzL2RvbWFpbnMgbGF0ZXIsIG9uY2Ugd2UndmUgZnVsbHkgZmlndXJlZCBpdCBv
dXQgKGNmLiBjb3ZlcgpsZXR0ZXIgZm9yIGN1cnJlbnQgZXJyb3JzIC0gbG9va2luZyBpbnRvIHBv
d2VyIGRvbWFpbnMgbmV4dCkuCgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
