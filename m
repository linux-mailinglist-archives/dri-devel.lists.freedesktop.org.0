Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C984CEA84
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBEF6E0AF;
	Mon,  7 Oct 2019 17:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4B46E0AF
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:23:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 941EA80516;
 Mon,  7 Oct 2019 19:22:58 +0200 (CEST)
Date: Mon, 7 Oct 2019 19:22:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007172256.GA1956@ravnborg.org>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=9T81fxlNLQDmeR1-j4EA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 Jyri Sarha <jsarha@ti.com>, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KT24gTW9uLCBPY3QgMDcsIDIwMTkgYXQgMDg6MDc6NTZQTSArMDMwMCwgTGF1
cmVudCBQaW5jaGFydCB3cm90ZToKPiBIZWxsbywKPiAKPiBUaGlzIHBhdGNoIHNlcmllcyBmaXhl
cyBhIG1vZHVsZSBhbGlhcyBpc3N1ZSB3aXRoIHRoZSBmaXZlIHJlY2VudGx5Cj4gYWRkZWQgcGFu
ZWwgZHJpdmVycyB1c2VkIGJ5IG9tYXBkcm0uCj4gCj4gQmVmb3JlIHRob3NlIHBhbmVsIGRyaXZl
cnMsIG9tYXBkcm0gaGFkIGN1c3RvbSBkcml2ZXJzIGZvciB0aGUgcGFuZWxzLAo+IGFuZCBwcmVm
aXhlZCB0aGUgT0YgY29tcGF0aWJsZSBzdHJpbmdzIHdpdGggYW4gIm9tYXBkc3MsIiBwcmVmaXgu
IFRoZQo+IFNQSSBkZXZpY2UgSURzIGFyZSBjb25zdHJ1Y3RlZCBieSBzdHJpcHBpbmcgdGhlIE9G
IGNvbXBhdGlibGUgc3RyaW5nCj4gZnJvbSB0aGUgcHJlZml4LCByZXN1bHRpbmcgaW4gdGhlICJv
bWFwZHNzLCIgcHJlZml4IGJlaW5nIHJlbW92ZWQsIGJ1dAo+IHRoZSBzdWJzZXF1ZW5jZSBPRiB2
ZW5kb3IgcHJlZml4IGJlaW5nIGtlcHQuIFRoZSBTUEkgZHJpdmVycyB0aHVzIGhhZAo+IG1vZHVs
ZXMgYWxpYXNlcyB0aGF0IGNvbnRhaW5lZCB0aGUgdmVuZG9yIHByZWZpeC4KPiAKPiBOb3cgdGhh
dCB0aGUgcGFuZWxzIGFyZSBzdXBwb3J0ZWQgYnkgc3RhbmRhcmQgZHJpdmVycyBhbmQgdGhlICJv
bWFwZHNzLCIKPiBwcmVmaXggaXMgcmVtb3ZlZCwgdGhlIFNQSSBkZXZpY2UgSURzIGFyZSBzdHJp
cHBlZCBmcm9tIHRoZSBPRiB2ZW5kb3IKPiBwcmVmaXguIEFzIHRoZSBuZXcgcGFuZWwgZHJpdmVy
cyBjb3BpZWQgdGhlIG1vZHVsZSBhbGlhc2VzIGZyb20gdGhlCj4gb21hcGRybS1zcGVjaWZpYyBk
cml2ZXJzLCB0aGV5IGNvbnRhaW4gdGhlIHZlbmRvciBwcmVmaXggaW4gdGhlaXIgU1BJCj4gbW9k
dWxlIGFsaWFzZXMsIGFuZCBhcmUgdGh1cyBub3QgbG9hZGVkIGF1dG9tYXRpY2FsbHkuCj4gCj4g
Rml4IHRoaXMgYnkgcmVtb3ZpbmcgdGhlIHZlbmRvciBwcmVmaXggZnJvbSB0aGUgU1BJIG1vZHVs
ZXMgYWxpYXNlcyBpbgo+IHRoZSBkcml2ZXJzLiBGb3IgY29uc2lzdGVuY3kgcmVhc29uLCB0aGUg
bWFudWFsIG1vZHVsZSBhbGlhc2VzIGFyZSBhbHNvCj4gbW92ZWQgdG8gdXNlIGFuIFNQSSBtb2R1
bGUgdGFibGUuCgpHb29kIGV4cGxhbmF0aW9uIC0gdGhhbmtzLgoKPiAKPiBUaGVzZSBwYXRjaGVz
IGFyZSBiYXNlZCBvbiB0aGUgZHJtLW1pc2MtZml4ZXMgYnJhbmNoIGFzIHRoZXkgZml4IHY1LjQK
PiByZWdyZXNzaW9ucy4KPiAKPiBMYXVyZW50IFBpbmNoYXJ0ICg1KToKPiAgIGRybS9wYW5lbDog
bGctbGIwMzVxMDI6IEZpeCBTUEkgYWxpYXMKPiAgIGRybS9wYW5lbDogbmVjLW5sODA0OGhsMTE6
IEZpeCBTUEkgYWxpYXMKPiAgIGRybS9wYW5lbDogc29ueS1hY3g1NjVha206IEZpeCBTUEkgYWxp
YXMKPiAgIGRybS9wYW5lbDogdHBvLXRkMDI4dHRlYzE6IEZpeCBTUEkgYWxpYXMKPiAgIGRybS9w
YW5lbDogdHBvLXRkMDQzbXRlYTE6IEZpeCBTUEkgYWxpYXMKCkZ1bGwgc2VyaWVzIGlzOgpBY2tl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKSSBleHBlY3Qgc29tZW9uZSBl
bHNlIHRvIHBpY2sgdGhlbSB1cCBvciB0aGF0IHlvdSBhcHBseSB0aGVtLgoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
