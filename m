Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035D1320F5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 09:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF3F89C55;
	Tue,  7 Jan 2020 08:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74FB6E204
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 09:10:51 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8640324000B;
 Mon,  6 Jan 2020 09:10:44 +0000 (UTC)
Date: Mon, 6 Jan 2020 10:10:42 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] drm/panel: simple: Support reset GPIOs
Message-ID: <20200106101042.5bb5b742@xps13>
In-Reply-To: <20200102172700.GA15341@ravnborg.org>
References: <20191224142134.22902-1-miquel.raynal@bootlin.com>
 <20200102172700.GA15341@ravnborg.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jan 2020 08:05:10 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPiB3cm90ZSBvbiBUaHUsIDIg
SmFuIDIwMjAgMTg6Mjc6MDAgKzAxMDA6Cgo+IEhpIE1pcXVlbAo+IAo+IE9uIFR1ZSwgRGVjIDI0
LCAyMDE5IGF0IDAzOjIxOjM0UE0gKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBUaGUg
cGFuZWwgY29tbW9uIGJpbmRpbmdzIHByb3ZpZGUgYSBncGlvcy1yZXNldCBwcm9wZXJ0eS4gTGV0
J3MKPiA+IHN1cHBvcnQgaXQgaW4gdGhlIHNpbXBsZSBkcml2ZXIuCj4gPiAKPiA+IFR3byBmaWVs
ZHMgYXJlIGFkZGVkIHRvIHRoZSBwYW5lbCBkZXNjcmlwdGlvbiBzdHJ1Y3R1cmU6IHRoZSB0aW1l
IHRvCj4gPiBhc3NlcnQgdGhlIHJlc2V0IGFuZCB0aGUgdGltZSB0byB3YWl0IHJpZ2h0IGFmdGVy
IGJlZm9yZSBzdGFydGluZyB0bwo+ID4gaW50ZXJhY3Qgd2l0aCBpdCBpbiBhbnkgbWFubmVyLiBJ
biBjYXNlIHRoZXNlIGRlZmF1bHQgdmFsdWVzIGFyZSBub3QKPiA+IGZpbGxlZCBidXQgdGhlIEdQ
SU8gaXMgcHJlc2VudCBpbiB0aGUgRFQsIGRlZmF1bHQgdmFsdWVzIGFyZSBhcHBsaWVkLiAgCj4g
Cj4gV2VobiB3ZSBkaXNjdXNzZWQgdGhpcyB0aGUgbGFzdCB0aW1lIHlvdSB3cm90ZToKPiAKPiAi
IiIKPiBteSBoYXJkd2FyZSBpczoKPiAKPiBMVkRTIElQIDwtLS0tLS0tLS0tPiBMVkRTIHRvIFJH
QiBicmlkZ2UgPC0tLS0tLS0tLS0tLT4gUGFuZWwKPiAKPiBXaGlsZSB0aGVyZSBpcyBhIHNpbXBs
ZSAiUkdCIHRvIExWRFMiIGJyaWRnZSBkcml2ZXIsIHRoZXJlIGlzIG5vbmUKPiBkb2luZyB0aGUg
d29yayB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gSW4gbXkgY2FzZSwgdGhlIGJyaWRnZSBoYXMgYSBy
ZXNldAo+IHBpbi4KPiAKPiBBcyB1bnRpbCBub3cgdGhlcmUgaXMgbm8gd2F5IHRvIHJlcHJlc2Vu
dCB0aGUgIkxWRFMgdG8gUkdCIiBicmlkZ2UgYW5kCj4gYmVjYXVzZSB0aGUgYmluZGluZ3MgYWxy
ZWFkeSBkb2N1bWVudCBzdWNoIHJlc2V0IHBpbiwgSSBkZWNpZGVkIHRvIGFkZAo+IHN1cHBvcnQg
Zm9yIGl0IGluIHRoZSBzaW1wbGUgcGFuZWwgZHJpdmVyLgo+ICIiIgo+IAo+IEJhc2VkIG9uIHRo
ZSBpbmZvcm1hdGlvbiBwcm92aWRlZCBpdCBzZWVtcyB0aGF0IHRoZSBjb3JyZWN0IHdheSBpcyB0
bwo+IGFkZCBhICJMVkRTIHRvIFJHQiBicmlkZ2UiIGFuZCB0aGVuIGxldCB0aGUgYnJpZGdlIGhh
bmRsZSB0aGUgcmVzZXQKPiBmdW5jdGlvbmFsaXR5LgoKVGhpcyBJIGFncmVlLCBidXQgd2UgYXJl
IHRhbGtpbmcgYWJvdXQgbXkgY3VycmVudCBzaXR1YXRpb24uIAoKPiAKPiBJdCBpcyBvYnZpb3Vz
bHkgbXVjaCBtb3JlIGNvZGUgdG8gZG8gaXQgdGhpcyB3YXkgYnV0IHRoZW4KPiBvdGhlciBwYW5l
bHMgdXNpbmcgdGhlIHNhbWUgdHlwZSBvZiBicmlnZGUgaGF2ZSB0aGUKPiBzYW1lIGZ1bmN0aW9u
YWxpdHkgd2l0aG91dCBhZGRpbmcgYnJpZGdlIGZ1bmN0aW9uYWxpdHkgdG8gdGhlIHBhbmVsLgoK
VGhpcywgSSBkbyBub3QgZnVsbHkgYWdyZWUgYXMgYmluZGluZ3MgZm9yIHRoZSBwYW5lbCByZXNl
dCBhbHJlYWR5CmV4aXN0IGFuZCB3ZSBjb3VsZCBoYXZlIGEgcmVzZXQgb24gYm90aDogdGhlIGJy
aWRnZSBhbmQgdGhlIHBhbmVsLgpJIGNob29zZSB0byB1c2UgYSB3cm9uZyAocHJpdmF0ZSkgRFQg
cmVwcmVzZW50YXRpb24gYmVjYXVzZSBJIGFtIG5vdAp3aWxsaW5nIHRvIGFkZCBhbiBMVkRTLT5S
R0IgYnJpZGdlOiBhcyB5b3Ugc2F5LCBpdCBpcyBtdWNoIG1vcmUgd29yayB0bwpkby4gQnV0LCBJ
TUhPLCB0aGlzIGlzIG5vdCByZWxhdGVkIHRvIHRoZSBwYXRjaC4gSWYgeW91IGNvbnNpZGVyIHRo
aXMKcGF0Y2ggd3JvbmcgYmVjYXVzZSBhIHBhbmVsIGNhbm5vdCBoYXZlIGEgcmVzZXQsIHRoZW4g
aXQgc2hvdWxkIGJlCnN0YXRlZCBjbGVhcmx5IGFuZCBtYXliZSByZW1vdmVkIGZyb20gdGhlIGJp
bmRpbmdzPwoKQW55d2F5IGlmIHlvdSB0aGluayB0aGlzIGNoYW5nZSBjYW4ndCBiZSB1c2VmdWws
IGxldCdzIHB1dCBpdCBhc2lkZS4KClRoYW5rcyBmb3IgeW91ciB0aW1lLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
