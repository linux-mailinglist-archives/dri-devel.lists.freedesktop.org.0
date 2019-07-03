Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BF25DE7D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC116E0DA;
	Wed,  3 Jul 2019 07:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jul 2019 06:45:02 UTC
Received: from chill.innovation.ch (chill.innovation.ch
 [IPv6:2001:470:1:5ba:222:15ff:fecf:4ca5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1AE6E0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 06:45:02 +0000 (UTC)
Date: Tue, 2 Jul 2019 23:39:56 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 85CEE64013F
From: "Life is hard, and then you die" <ronald@innovation.ch>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
Message-ID: <20190703063956.GA32102@innovation.ch>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=innovation.ch; s=default; t=1562135996;
 bh=waAA9bz7u8vTcqSxfkBH3kI4fMWrMyh3e4aqengWgPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arld3s3oUiDqM0POunjuNaXZx1LPmOkmuIEDUZXuHuMRO1KtTYegdWtFteYdleykz
 bnaGCYFRvBegnM7u77hhw5jcfUO7jlOGJ3XyTQvUuUkDt+/VX/v0jhALYCPr5LQ6dx
 hnr9d7rU5vpxvfwPUXKAcTWQr+zI8Me+aKrpZljnLwlTgJcbOTOM1udKcq4yf9WZC8
 pV5DyQGdBM3yJRW7B/Ra+oM6J8cGZqG0AlL36KkBchVyOfKSkHBXGuuch0u7GQxLES
 q/3qQ39Dsk2rFuR2x/dEmf/TxLh6aIOUspIeinHPT/OYmMqP4NUSJp/HWbZGFQDwgB
 g8eUiEpsgEk/Q==
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
Cc: Henrik Rydberg <rydberg@bitmath.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Federico Lorenzi <federico@travelground.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIFR1ZSwgSnVsIDAyLCAyMDE5IGF0IDAzOjUwOjQ5UE0gKzAyMDAsIEFuZHJ6ZWogSGFqZGEg
d3JvdGU6Cj4gT24gMTkuMDQuMjAxOSAxMDoxOSwgUm9uYWxkIFRzY2hhbMOkciB3cm90ZToKPiA+
IGNvbW1pdCBkNmFiZTZkZjcwNmMgKGRybS9icmlkZ2U6IHNpbF9zaWk4NjIwOiBkbyBub3QgaGF2
ZSBhIGRlcGVuZGVuY3kKPiA+IG9mIFJDX0NPUkUpIGNoYW5nZWQgdGhlIGRyaXZlciB0byBzZWxl
Y3QgYm90aCBSQ19DT1JFIGFuZCBJTlBVVC4KPiA+IEhvd2V2ZXIsIHRoaXMgY2F1c2VzIHByb2Js
ZW1zIHdpdGggb3RoZXIgZHJpdmVycywgaW4gcGFydGljdWxhciBhbiBpbnB1dAo+ID4gZHJpdmVy
IHRoYXQgZGVwZW5kcyBvbiBNRkRfSU5URUxfTFBTU19QQ0kgKHRvIGJlIGFkZGVkIGluIGEgc2Vw
YXJhdGUKPiA+IGNvbW1pdCk6Cj4gPiAKPiA+ICAgZHJpdmVycy9jbGsvS2NvbmZpZzo5OmVycm9y
OiByZWN1cnNpdmUgZGVwZW5kZW5jeSBkZXRlY3RlZCEKPiA+ICAgZHJpdmVycy9jbGsvS2NvbmZp
Zzo5OiAgICAgICAgc3ltYm9sIENPTU1PTl9DTEsgaXMgc2VsZWN0ZWQgYnkgTUZEX0lOVEVMX0xQ
U1MKPiA+ICAgZHJpdmVycy9tZmQvS2NvbmZpZzo1NjY6ICAgICAgc3ltYm9sIE1GRF9JTlRFTF9M
UFNTIGlzIHNlbGVjdGVkIGJ5IE1GRF9JTlRFTF9MUFNTX1BDSQo+ID4gICBkcml2ZXJzL21mZC9L
Y29uZmlnOjU4MDogICAgICBzeW1ib2wgTUZEX0lOVEVMX0xQU1NfUENJIGlzIGltcGxpZWQgYnkg
S0VZQk9BUkRfQVBQTEVTUEkKPiA+ICAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnOjcz
OiAgICBzeW1ib2wgS0VZQk9BUkRfQVBQTEVTUEkgZGVwZW5kcyBvbiBJTlBVVAo+ID4gICBkcml2
ZXJzL2lucHV0L0tjb25maWc6ODogICAgICBzeW1ib2wgSU5QVVQgaXMgc2VsZWN0ZWQgYnkgRFJN
X1NJTF9TSUk4NjIwCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZzo4MzogICAg
c3ltYm9sIERSTV9TSUxfU0lJODYyMCBkZXBlbmRzIG9uIERSTV9CUklER0UKPiA+ICAgZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnOjE6ICAgICBzeW1ib2wgRFJNX0JSSURHRSBpcyBzZWxl
Y3RlZCBieSBEUk1fUEwxMTEKPiA+ICAgZHJpdmVycy9ncHUvZHJtL3BsMTExL0tjb25maWc6MTog
ICAgICBzeW1ib2wgRFJNX1BMMTExIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ID4gCj4gPiBBY2Nv
cmRpbmcgdG8gdGhlIGRvY3MgYW5kIGdlbmVyYWwgY29uc2Vuc3VzLCBzZWxlY3Qgc2hvdWxkIG9u
bHkgYmUgdXNlZAo+ID4gZm9yIG5vbiB1c2VyLXZpc2libGUgc3ltYm9scywgYnV0IGJvdGggUkNf
Q09SRSBhbmQgSU5QVVQgYXJlCj4gPiB1c2VyLXZpc2libGUuIEZ1cnRoZXJtb3JlIGFsbW9zdCBh
bGwgb3RoZXIgcmVmZXJlbmNlcyB0byBJTlBVVAo+ID4gdGhyb3VnaG91dCB0aGUga2VybmVsIGNv
bmZpZyBhcmUgZGVwZW5kcywgbm90IHNlbGVjdHMuIEZvciB0aGlzIHJlYXNvbgo+ID4gdGhlIGZp
cnN0IHBhcnQgb2YgdGhpcyBjaGFuZ2UgcmV2ZXJ0cyBjb21taXQgZDZhYmU2ZGY3MDZjLgo+ID4g
Cj4gPiBJbiBvcmRlciB0byBhZGRyZXNzIHRoZSBvcmlnaW5hbCByZWFzb24gZm9yIGNvbW1pdCBk
NmFiZTZkZjcwNmMsIG5hbWVseQo+ID4gdGhhdCBub3QgYWxsIGJvYXJkcyB1c2UgdGhlIHJlbW90
ZSBjb250cm9sbGVyIGZ1bmN0aW9uYWxpdHkgYW5kIGhlbmNlCj4gPiBzaG91bGQgbm90IG5lZWQg
aGF2ZSB0byBkZWFsIHdpdGggUkNfQ09SRSwgdGhlIHNlY29uZCBwYXJ0IG9mIHRoaXMKPiA+IGNo
YW5nZSBub3cgbWFrZXMgdGhlIHJlbW90ZSBjb250cm9sIHN1cHBvcnQgaW4gdGhlIGRyaXZlciBv
cHRpb25hbCBhbmQKPiA+IGNvbnRpbmdlbnQgb24gUkNfQ09SRSBiZWluZyBkZWZpbmVkLiBBbmQg
d2l0aCB0aGlzIHRoZSBoYXJkIGRlcGVuZGVuY3kKPiA+IG9uIElOUFVUIGFsc28gZ29lcyBhd2F5
IGFzIHRoYXQgaXMgb25seSBuZWVkZWQgaWYgUkNfQ09SRSBpcyBkZWZpbmVkCj4gPiAod2hpY2gg
aW4gdHVybiBhbHJlYWR5IGRlcGVuZHMgb24gSU5QVVQpLgo+ID4gCj4gPiBDQzogSW5raSBEYWUg
PGlua2kuZGFlQHNhbXN1bmcuY29tPgo+ID4gQ0M6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ft
c3VuZy5jb20+Cj4gPiBDQzogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVh
c29uYm9hcmQuY29tPgo+ID4gQ0M6IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdt
YWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBUc2NoYWzDpHIgPHJvbmFsZEBpbm5v
dmF0aW9uLmNoPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+Cj4gCj4gCj4gQXBwYXJlbnRseSB0aGlzIHBhdGNoIHdhcyBub3QgcXVldWVkIHRvIGtl
cm5lbCB5ZXQuIElmIHRoZXJlIGFyZSBubwo+IG9iamVjdGlvbnMgSSB3aWxsIHF1ZXVlIGl0IHZp
YSBkcm0tbWlzYy1uZXh0IHRyZWUgdG9tb3Jyb3cuCgpJZiB0aGlzIHBhdGNoIHNldCB3b24ndCBi
ZSBxdWV1ZWQgZm9yIDUuMyB0aGVuIEkgZ3Vlc3MgdGhhdCB3b3VsZCBiZSBhCmdvb2QgaWRlYS4K
CkJ1dCBtYXkgSSBhc2sgd2hhdCBpcyBwcmV2ZW50aW5nIHRoaXMgcGF0Y2ggc2V0IGZyb20gYmVp
bmcgcXVldWVkIGZvcgp1cHN0cmVhbSwgc28gSSBjYW4gdHJ5IGFuZCBmaXggd2hhdGV2ZXIgdGhl
IGlzc3VlIGlzPwoKCiAgQ2hlZXJzLAoKICBSb25hbGQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
