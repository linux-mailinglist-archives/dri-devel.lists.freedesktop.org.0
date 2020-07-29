Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B772321DF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 17:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522BD6E554;
	Wed, 29 Jul 2020 15:48:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C4D6E554
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 15:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 40641FB03;
 Wed, 29 Jul 2020 17:48:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeLiyG1p29WJ; Wed, 29 Jul 2020 17:48:09 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 1EBD845341; Wed, 29 Jul 2020 17:48:09 +0200 (CEST)
Date: Wed, 29 Jul 2020 17:48:09 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix st7703 panel initialization failures
Message-ID: <20200729154809.GA435075@bogon.m.sigxcpu.org>
References: <20200716123753.3552425-1-megous@megous.com>
 <20200716140843.GA359122@bogon.m.sigxcpu.org>
 <20200716143209.ud6ote4q545bo2c7@core.my.home>
 <20200718173124.GA88021@bogon.m.sigxcpu.org>
 <20200718174215.mgjl3klytfa3nf3t@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718174215.mgjl3klytfa3nf3t@core.my.home>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFNhdCwgSnVsIDE4LCAyMDIwIGF0IDA3OjQyOjE1UE0gKzAyMDAsIE9uZMWZZWogSmly
bWFuIHdyb3RlOgo+IEhlbGxvLAo+IAo+IE9uIFNhdCwgSnVsIDE4LCAyMDIwIGF0IDA3OjMxOjI0
UE0gKzAyMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4gSGksCj4gPiBPbiBUaHUsIEp1bCAx
NiwgMjAyMCBhdCAwNDozMjowOVBNICswMjAwLCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiA+ID4g
SGkgR3VpZG8sCj4gPiA+IAo+ID4gPiBPbiBUaHUsIEp1bCAxNiwgMjAyMCBhdCAwNDowODo0M1BN
ICswMjAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKPiA+ID4gPiBIaSBPbmRyZWosCj4gPiA+ID4g
T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDI6Mzc6NTFQTSArMDIwMCwgT25kcmVqIEppcm1hbiB3
cm90ZToKPiA+ID4gPiA+IFdoZW4gZXh0ZW5kaW5nIHRoZSBkcml2ZXIgZm9yIHhiZDU5OSBwYW5l
bCBzdXBwb3J0IEkgdHJpZWQgdG8gZG8gbWluaW1hbAo+ID4gPiA+ID4gY2hhbmdlcyBhbmQga2Vl
cCB0aGUgZXhpc3RpbmcgaW5pdGlhbGl6YXRpb24gdGltaW5nLgo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBJdCB0dXJuZWQgb3V0IHRoYXQgaXQncyBub3QgZ29vZCBlbm91Z2ggYW5kIHRoZSBleGlzdGlu
ZyBpbml0IHNlcXVlbmNlCj4gPiA+ID4gPiBpcyB0b28gYWdncmVzc2l2ZSBhbmQgZG9lc24ndCBm
b2xsb3cgdGhlIHNwZWNpZmljYXRpb24uIE9uIFBpbmVQaG9uZQo+ID4gPiA+ID4gcGFuZWwgaXMg
YmVpbmcgcG93ZXJlZCBkb3duL3VwIGR1cmluZyBzdXNwZW5kL3Jlc3VtZSBhbmQgd2l0aCBjdXJy
ZW50Cj4gPiA+ID4gPiB0aW1pbmdzIHRoaXMgZnJlcXVlbnRseSBsZWFkcyB0byBjb3JydXB0ZWQg
ZGlzcGxheS4KPiA+ID4gPiAKPiA+ID4gPiBHaXZlbiB0aGUgYW1vdW50IG9mIFNUNzcwMyBsb29r
IGFsaWtlcyBpIGRvbid0IHRoaW5rIHlvdSBjYW4gZ28gYnkgdGhlCj4gPiA+ID4gZGF0YXNoZWV0
IGFuZCBob3BlIG5vdCB0byBicmVhayBvdGhlciBwYW5lbHMuIFRoZSBjdXJyZW50IHNsZWVwcyBj
YXRlcgo+ID4gPiA+IGZvciB0aGUgcm9ja3RlY2ggcGFuZWwgKHdoaWNoIHN1ZmZlcmVkIGZyb20g
c2ltaWxhciBpc3N1ZXMgeW91IGRlc2NyaWJlCj4gPiA+ID4gd2hlbiB3ZSB0b29rIG90aGVyIHBh
cmFtZXRlcnMpIHNvIHlvdSBuZWVkIHRvIG1ha2UgdGhvc2UgcGFuZWwgc3BlY2lmaWMuCj4gPiA+
IAo+ID4gPiBJdCBzaG91bGQgd29yayBvbiByb2NrdGVjaCB0b28uIFRoZSBwYXRjaCBtb3N0bHkg
aW5jcmVhc2VzL3Jlb3JkZXJzIHRoZSBkZWxheXMKPiA+ID4gc2xpZ2h0bHksIHRvIG1hdGNoIHRo
ZSBjb250cm9sbGVyIGRvY3VtZW50YXRpb24uIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvCj4gPiA+
IGNvbXBsaWNhdGUgdGhlIGRyaXZlciB3aXRoIHBlciBwYW5lbCBzcGVjaWFsIGRlbGF5cywgdW5s
ZXNzIHRoZXNlIHBhdGNoZXMgZG9uJ3QKPiA+ID4gd29yayBvbiB5b3VyIHBhbmVsLgo+ID4gCj4g
PiBUaGF0J3Mgd2h5IGkgYnJvdWdodCBpdCB1cC4gSXQgYnJlYWtzIHRoZSByb2NrdGVjaCBwYW5l
bCBvbgo+ID4gYmxhbmsvdW5ibGFuayBsb29wcyB3aGVyZSBpdCBqdXN0IHN0YXlzIGJsYW5rIGFu
ZCB0aGVuIHN0YXJ0cyBoaXR0aW5nCj4gPiBEU0kgY29tbWFuZCB0aW1lb3V0cy4KPiAKPiBHb29k
IHRvIGtub3cuIERvZXMga2VlcGluZyB0aGUgbXNsZWVwKDIwKTsgYWZ0ZXIgaW5pdCBzZXF1ZW5j
ZSBhbmQgYmVmb3JlIHNsZWVwCj4gZXhpdCBtYWtlIGl0IHdvcms/CgpXZSBuZWVkIGJvdGggc2xl
ZXBzIHRvIG1ha2UgdGhpcyB3b3JrIHJlbGlhYmx5IHNvIGJhc2ljYWxseQpyZXZlcnRpbmcgeW91
ciAnZHJtL3BhbmVsOiBzdDc3MDM6IE1ha2UgdGhlIHNsZWVwIGV4aXQgdGltaW5nIG1hdGNoIHRo
ZQpzcGVjJyBtYWtlcyB0aGluZ3Mgc3RhYmxlIGFnYWluLgoKV2UgZG9uJ3QgbmVlZCB0byBzbGVl
cCAxMjBtcyBhZnRlciBzbGVlcCBvdXQgdGhvdWdoIHNpbmNlIG91ciBwYW5lbCBvbmx5CnJlcXVp
cmVzIDE1bXMgYXMgcGVyIGRhdGEgc2hlZXQgdGhlcmUgc28gaXQgcmVhbGx5IG1ha2VzIHNlbnNl
IHRvIG1ha2UKdGhlc2UgY29uZmlndXJhYmxlLgpDaGVlcnMsCiAtLSBHdWlkbwoKPiAKPiB0aGFu
ayB5b3UgYW5kIHJlZ2FyZHMsCj4gCW8uCj4gCj4gPiBDaGVlcnMsCj4gPiAgLS0gR3VpZG8KPiA+
IAo+ID4gPiAKPiA+ID4gVGhlIGluaXQgc2VxdWVuY2UgaXMgc3RpbGwgc3Vib3B0aW1hbCwgYW5k
IGRvZXNuJ3QgZm9sbG93IHRoZSBrZXJuZWwgZG9jcwo+ID4gPiBjb21wbGV0ZWx5LCBldmVuIGFm
dGVyIHRoZXNlIHBhdGNoZXMuIENvbnRyb2xsZXIgc3BlYyBhbHNvIHRhbGtzIGFib3V0IGFkZGlu
Zwo+ID4gPiBzb21lIGRlbGF5IGJlZm9yZSBlbmFibGluZyB0aGUgYmFja2xpZ2h0IHRvIGF2b2lk
IHZpc3VhbCBnbGl0Y2hlcy4KPiA+ID4gCj4gPiA+IFdoaWNoIGlzIHdoYXQgZW5hYmxlIGNhbGxi
YWNrIGlzIGRvY3VtZW50ZWQgdG8gYmUgZm9yLiBDdXJyZW50bHkgcGFydCBvZiB0aGUKPiA+ID4g
aW5pdGlhbGl6YXRpb24gdGhhdCBiZWxvbmdzIHRvIHByZXBhcmUgY2FsbGJhY2sgaXMgYWxzbyBk
b25lIGluIGVuYWJsZSBjYWxsYmFjay4KPiA+ID4gCj4gPiA+IEkgc2VlIHRoZSBnbGl0Y2ggKHNt
YWxsIHZlcnRpY2FsIHNoaWZ0IG9mIHRoZSBpbWFnZSBvbiBwb3dlcnVwKSwgYnV0IHBlcnNvbmFs
bHkKPiA+ID4gZG9uJ3QgY2FyZSBtdWNoIHRvIGludHJvZHVjZSBldmVuIG1vcmUgZGVsYXlzIHRv
IHRoZSBkcml2ZXIsIGp1c3QgZm9yIHRoZQo+ID4gPiBjb3NtZXRpYyBpc3N1ZS4KPiA+ID4gCj4g
PiA+IHJlZ2FyZHMsCj4gPiA+IAlvLgo+ID4gPiAKPiA+ID4gPiBDaGVlcnMsCj4gPiA+ID4gIC0t
IEd1aWRvCj4gPiA+ID4gCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGZp
eGVzIHRoZSBwcm9ibGVtcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIGlzc3VlIHdhcyByZXBv
cnRlZCBieSBTYW11ZWwgSG9sbGFuZC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gUmVsZXZhbnQgc2Ny
ZWVuc2hvdHMgZnJvbSB0aGUgZGF0YXNoZWV0Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgIFBvd2Vy
IG9uIHRpbWluZzogaHR0cHM6Ly9tZWdvdXMuY29tL2RsL3RtcC8zNWI3MmU2NzRjZTBjYTI3LnBu
Zwo+ID4gPiA+ID4gICBQb3dlciBvZmYgdGltaW5nOiBodHRwczovL21lZ291cy5jb20vZGwvdG1w
L2RlYTE5NTUxNzEwNmZmMTcucG5nCj4gPiA+ID4gPiAgIE1vcmUgb3B0aW1hbCByZXNldCBvbiBw
b3dlcm9uOiBodHRwczovL21lZ291cy5jb20vZGwvdG1wL2E5ZTVjYWYxNGUxYjBkYzYucG5nCj4g
PiA+ID4gPiAgIExlc3Mgb3B0aW1hbCByZXNldCBvbiBwb3dlcm9uOiBodHRwczovL21lZ291cy5j
b20vZGwvdG1wLzI0Njc2MTAzOTI4M2M0Y2YucG5nCj4gPiA+ID4gPiAgIERhdGFzaGVldDogaHR0
cHM6Ly9tZWdvdXMuY29tL2RsL3RtcC9TVDc3MDNfRFNfdjAxXzIwMTYwMTI4LnBkZgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiBQbGVhc2UgdGFrZSBhIGxvb2suCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHRo
YW5rIHlvdSBhbmQgcmVnYXJkcywKPiA+ID4gPiA+ICAgT25kcmVqIEppcm1hbgo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBPbmRyZWogSmlybWFuICgyKToKPiA+ID4gPiA+ICAgZHJtL3BhbmVsOiBzdDc3
MDM6IE1ha2UgdGhlIHNsZWVwIGV4aXQgdGltaW5nIG1hdGNoIHRoZSBzcGVjCj4gPiA+ID4gPiAg
IGRybS9wYW5lbDogc3Q3NzAzOiBGaXggdGhlIHBvd2VyIHVwIHNlcXVlbmNlIG9mIHRoZSBwYW5l
bAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJv
bml4LXN0NzcwMy5jIHwgMjkgKysrKysrKysrKy0tLS0tLS0tLQo+ID4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPiA+ID4gPiA+IAo+ID4g
PiA+ID4gLS0gCj4gPiA+ID4gPiAyLjI3LjAKPiA+ID4gPiA+IAo+ID4gPiAKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
