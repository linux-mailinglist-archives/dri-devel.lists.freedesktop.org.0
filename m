Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E666E510
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 13:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9231A6E80B;
	Fri, 19 Jul 2019 11:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460B86E80B;
 Fri, 19 Jul 2019 11:32:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A0BAE2007B;
 Fri, 19 Jul 2019 13:32:13 +0200 (CEST)
Date: Fri, 19 Jul 2019 13:32:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
Subject: Re: [PATCH/RFT v1 0/6] drm/via: drop use of deprecated headers
 drmP.h and drm_os_linux.h
Message-ID: <20190719113212.GC3247@ravnborg.org>
References: <20190718153737.28657-1-sam@ravnborg.org>
 <20190719060712.GA26070@ravnborg.org>
 <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2a3b772-96e7-0fed-d269-bb103057cafe@daenzer.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=9I2oVEEZX4lp-jue8ogA:9 a=wPNLvfGTeEIA:10
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Kevin Brace <kevinbrace@gmx.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGFlbC4KCk9uIEZyaSwgSnVsIDE5LCAyMDE5IGF0IDExOjA1OjQ0QU0gKzAyMDAsIE1p
Y2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMTktMDctMTkgODowNyBhLm0uLCBTYW0gUmF2bmJv
cmcgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAwNTozNzozMVBNICswMjAwLCBT
YW0gUmF2bmJvcmcgd3JvdGU6Cj4gPj4gVGhpcyBpcyBzb21lIGphbml0b3JpYWwgdXBkYXRlcyB0
byB0aGUgdmlhIGRyaXZlcgo+ID4+IHRoYXQgaXMgcmVxdWlyZWQgdG8gZ2V0IHJpZCBvZiBkZXBy
ZWNhdGVkIGhlYWRlcnMKPiA+PiBpbiB0aGUgZHJtIHN1YnN5c3RlbS4KPiA+Pgo+ID4+IFRoZSBm
aXJzdCB0aHJlZSBwYXRjaGVzIGFyZSB0cml2aWFsLCB3aGVyZQo+ID4+IHRoZSBkZXBlbmRlbmNp
ZXMgb24gZHJtUC5oIGFuZCBkcm1fb3NfbGludXggYXJlIGRyb3BwZWQuCj4gPj4KPiA+PiBUaGUg
cmVtYWluaW5nIHRocmVlIHBhdGNoZXMgZHJvcCB1c2Ugb2YgRFJNX1dBSVRfT04oKS4KPiA+PiBU
aGV5IGFyZSByZXBsYWNlZCBieSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgpLgo+
ID4+IFRoZXNlIHBhdGNoZXMgY291bGQgdXNlIGEgbW9yZSBjcml0aWNhbCByZXZpZXcuCj4gPiAK
PiA+IFRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIERSTV9XQUlUX09OKCkgYW5kCj4gPiB3YWl0X2V2
ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgpIGFyZSBiaWdnZXIgdGhhbiBhbnRpY2lwYXRlZC4K
PiA+IAo+ID4gVGhlIGNvbnZlcnNpb24gSSBkaWQgZm9yIGRybV92YmxhbmsuYyBpcyBib2d1cyB0
aHVzIEkgZXhwZWN0Cj4gPiB0aGUgY29udmVyc2lvbiBkb25lIGZvciB2aWEgaXMgYWxzbyBib2d1
cy4KPiAKPiBXaGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0gdGhvdWdoPyBDYW4geW91IHNoYXJl
IGluZm9ybWF0aW9uIGFib3V0IHRoZQo+IGZhaWx1cmVzIHlvdSdyZSBzZWVpbmc/Cj4gCj4gVGhl
cmUgd2FzIHNvbWUgZGlzY3Vzc2lvbiBhYm91dCBEUk1fV0FJVF9PTigpICJwb2xsaW5nIiBvbiBJ
UkMuIEkgYXNzdW1lCj4gdGhhdCByZWZlcnMgdG8gaXQgb25seSBzbGVlcGluZyBmb3IgdXAgdG8g
MC4wMXMgYmVmb3JlIGNoZWNraW5nIHRoZQo+IGNvbmRpdGlvbiBhZ2Fpbi4gSW4gY29udHJhc3Qs
IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KCkgY2hlY2tzCj4gdGhlIGNvbmRpdGlv
biBvbmNlLCB0aGVuIHNsZWVwcyB1cCB0byB0aGUgZnVsbCB0aW1lb3V0IGJlZm9yZSBjaGVja2lu
Zwo+IGl0IGFnYWluLgpDb3JyZWN0IC0gaXQgd2FzIGJhc2VkIG9uIHRoZSBmZWVkYmFjayBvbiBp
cmMgZnJvbSBhaXJsaWVkIGFuZCBpY2tsZQp0aGF0IG1hZGUgbWUgY29uY2x1ZGUgdGhhdCB0aGUg
dmlhIHBhcnQgbWF5IG5vdCBiZSBnb29kLgpJIGNhbm5vdCBzYXkgaWYgdGhlIHBvbGxpbmcgdmVy
c3VzIHRpbWVvdXQgaXMgcHJvcGVybHkgZGVhbHQgd2l0aCBpbiB0aGUKdmlhIGRyaXZlciBhbmQg
SSBhbSBpbmNsaWRlZCB0byBqdXN0IG1vdmUgRFJNX1dBSVRfT04oKSB0byB2aWFfZHJ2LmggYW5k
Cm5hbWUgaXQgVklBX1dBSVRfT04oKS4KVGhlbiB0aGUgY2hhbmdlcyB0byB0aGlzIGxlZ2FjeSBk
cml2ZXIgaXMgbWluaW1hbCBhbmQgaXQgd2lsbCBub3QKcHJldmVudCB1cyBmcm9tIGdldHR0aW5n
IHJpZCBvZiBkcm1fb3NfbGludXguaAoKPiAKPiBJZiB0aGF0IG1ha2VzIGEgZGlmZmVyZW5jZSBm
b3IgZHJtX3dhaXRfdmJsYW5rX2lvY3RsLCBpdCBpbmRpY2F0ZXMgdGhhdAo+IHNvbWUgb3RoZXIg
Y29kZSB3aGljaCB1cGRhdGVzIHRoZSB2YmxhbmsgY291bnQgb3IgY2xlYXJzIHZibGFuay0+ZW5h
YmxlZAo+IGRvZXNuJ3Qgd2FrZSB1cCB0aGUgdmJsYW5rLT5xdWV1ZS4KTGV0IG1lIGFuYWx5c2Ug
YSBsaXR0bGUuLi4KCkluIGRybV9oYW5kbGVfdmJsYW5rKCkgdGhlcmUgaXMgYSBjYWxsIHRvIHdh
a2VfdXAoJnZibGFuay0+cXVldWUpOwpBbmQgdGhpcyBpcyBjYWxsZWQgZnJvbSBhbiBpbnRlcnJ1
cHQgLSBPSy4KCmRybV92YmxhbmtfZW5hYmxlKCkgaXMgY2FsbGVkIG91dHNpZGUgYW4gaW50ZXJy
dXB0IC0gbm8gbmVlZCBmb3IKd2FrZV91cCgpCgpkcm1fY3J0Y19hY2N1cmF0ZV92YmxhbmtfY291
bnQoKSBpcyBjYWxsZWQgb3V0c2lkZSBpbnRlcnJ1cHQgLSBubyBuZWVkCmZvciB3YWtlX3VwKCkK
CmRybV92YmxhbmtfZGlzYWJsZV9hbmRfc2F2ZSgpIGlzIGNhbGxlZCBvdXRzaWRlIGludGVycnVw
dCAtIG5vIG5lZWQgZm9yCndha2VfdXAoKScKClRoYXQgaXMgYWxsIGZ1bmN0aW9ucyBJIGNvdWxk
IGRpZyB1cCB0aGF0IHVwZGF0ZXMgdGhlIHZibGFuayBjb3VudGVyLgoKU28gYmFzZWQgb24gdGhp
cyBzaG9ydCBhbmFseXNpcyBJIGFjdHVhbGx5IHN0YXJ0IHRvIHRoaW5rIHRoYXQKSSBjYW4gdXNl
IHRoZSB2YXJpYW50IHRoYXQgdXNlcyB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGltZW91dCgp
CmFueXdheS4KSSB3aWxsIHBvc3QgYSB2MyBhbmQgYXdhaXQgZmVlZGJhY2sgb24gdGhhdCB2ZXJz
aW9uLgoKQXMgZm9yIHZpYSAtIGludHJvZHVjaW5nIFZJQV9XQUlUX09OKCkgaXMgdGhlIHNpbXBs
ZSBzb2x1dGlvbi4KU28gSSB3aWxsIHBvc3QgYSB2MiBvZiB0aGlzIHNlcmllcyB1c2luZyBWSUFf
V0FJVF9PTigpLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
