Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ED5224D59
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 19:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6036E1E6;
	Sat, 18 Jul 2020 17:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E016E1E6
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 17:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id B9C92FB03;
 Sat, 18 Jul 2020 19:31:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N14d5shIaMI1; Sat, 18 Jul 2020 19:31:25 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B4BC842576; Sat, 18 Jul 2020 19:31:24 +0200 (CEST)
Date: Sat, 18 Jul 2020 19:31:24 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Fabio Estevam <festevam@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix st7703 panel initialization failures
Message-ID: <20200718173124.GA88021@bogon.m.sigxcpu.org>
References: <20200716123753.3552425-1-megous@megous.com>
 <20200716140843.GA359122@bogon.m.sigxcpu.org>
 <20200716143209.ud6ote4q545bo2c7@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200716143209.ud6ote4q545bo2c7@core.my.home>
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

SGksCk9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDA0OjMyOjA5UE0gKzAyMDAsIE9uZMWZZWogSmly
bWFuIHdyb3RlOgo+IEhpIEd1aWRvLAo+IAo+IE9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDA0OjA4
OjQzUE0gKzAyMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+ID4gSGkgT25kcmVqLAo+ID4gT24g
VGh1LCBKdWwgMTYsIDIwMjAgYXQgMDI6Mzc6NTFQTSArMDIwMCwgT25kcmVqIEppcm1hbiB3cm90
ZToKPiA+ID4gV2hlbiBleHRlbmRpbmcgdGhlIGRyaXZlciBmb3IgeGJkNTk5IHBhbmVsIHN1cHBv
cnQgSSB0cmllZCB0byBkbyBtaW5pbWFsCj4gPiA+IGNoYW5nZXMgYW5kIGtlZXAgdGhlIGV4aXN0
aW5nIGluaXRpYWxpemF0aW9uIHRpbWluZy4KPiA+ID4gCj4gPiA+IEl0IHR1cm5lZCBvdXQgdGhh
dCBpdCdzIG5vdCBnb29kIGVub3VnaCBhbmQgdGhlIGV4aXN0aW5nIGluaXQgc2VxdWVuY2UKPiA+
ID4gaXMgdG9vIGFnZ3Jlc3NpdmUgYW5kIGRvZXNuJ3QgZm9sbG93IHRoZSBzcGVjaWZpY2F0aW9u
LiBPbiBQaW5lUGhvbmUKPiA+ID4gcGFuZWwgaXMgYmVpbmcgcG93ZXJlZCBkb3duL3VwIGR1cmlu
ZyBzdXNwZW5kL3Jlc3VtZSBhbmQgd2l0aCBjdXJyZW50Cj4gPiA+IHRpbWluZ3MgdGhpcyBmcmVx
dWVudGx5IGxlYWRzIHRvIGNvcnJ1cHRlZCBkaXNwbGF5Lgo+ID4gCj4gPiBHaXZlbiB0aGUgYW1v
dW50IG9mIFNUNzcwMyBsb29rIGFsaWtlcyBpIGRvbid0IHRoaW5rIHlvdSBjYW4gZ28gYnkgdGhl
Cj4gPiBkYXRhc2hlZXQgYW5kIGhvcGUgbm90IHRvIGJyZWFrIG90aGVyIHBhbmVscy4gVGhlIGN1
cnJlbnQgc2xlZXBzIGNhdGVyCj4gPiBmb3IgdGhlIHJvY2t0ZWNoIHBhbmVsICh3aGljaCBzdWZm
ZXJlZCBmcm9tIHNpbWlsYXIgaXNzdWVzIHlvdSBkZXNjcmliZQo+ID4gd2hlbiB3ZSB0b29rIG90
aGVyIHBhcmFtZXRlcnMpIHNvIHlvdSBuZWVkIHRvIG1ha2UgdGhvc2UgcGFuZWwgc3BlY2lmaWMu
Cj4gCj4gSXQgc2hvdWxkIHdvcmsgb24gcm9ja3RlY2ggdG9vLiBUaGUgcGF0Y2ggbW9zdGx5IGlu
Y3JlYXNlcy9yZW9yZGVycyB0aGUgZGVsYXlzCj4gc2xpZ2h0bHksIHRvIG1hdGNoIHRoZSBjb250
cm9sbGVyIGRvY3VtZW50YXRpb24uIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHRvCj4gY29tcGxpY2F0
ZSB0aGUgZHJpdmVyIHdpdGggcGVyIHBhbmVsIHNwZWNpYWwgZGVsYXlzLCB1bmxlc3MgdGhlc2Ug
cGF0Y2hlcyBkb24ndAo+IHdvcmsgb24geW91ciBwYW5lbC4KClRoYXQncyB3aHkgaSBicm91Z2h0
IGl0IHVwLiBJdCBicmVha3MgdGhlIHJvY2t0ZWNoIHBhbmVsIG9uCmJsYW5rL3VuYmxhbmsgbG9v
cHMgd2hlcmUgaXQganVzdCBzdGF5cyBibGFuayBhbmQgdGhlbiBzdGFydHMgaGl0dGluZwpEU0kg
Y29tbWFuZCB0aW1lb3V0cy4KQ2hlZXJzLAogLS0gR3VpZG8KCj4gCj4gVGhlIGluaXQgc2VxdWVu
Y2UgaXMgc3RpbGwgc3Vib3B0aW1hbCwgYW5kIGRvZXNuJ3QgZm9sbG93IHRoZSBrZXJuZWwgZG9j
cwo+IGNvbXBsZXRlbHksIGV2ZW4gYWZ0ZXIgdGhlc2UgcGF0Y2hlcy4gQ29udHJvbGxlciBzcGVj
IGFsc28gdGFsa3MgYWJvdXQgYWRkaW5nCj4gc29tZSBkZWxheSBiZWZvcmUgZW5hYmxpbmcgdGhl
IGJhY2tsaWdodCB0byBhdm9pZCB2aXN1YWwgZ2xpdGNoZXMuCj4gCj4gV2hpY2ggaXMgd2hhdCBl
bmFibGUgY2FsbGJhY2sgaXMgZG9jdW1lbnRlZCB0byBiZSBmb3IuIEN1cnJlbnRseSBwYXJ0IG9m
IHRoZQo+IGluaXRpYWxpemF0aW9uIHRoYXQgYmVsb25ncyB0byBwcmVwYXJlIGNhbGxiYWNrIGlz
IGFsc28gZG9uZSBpbiBlbmFibGUgY2FsbGJhY2suCj4gCj4gSSBzZWUgdGhlIGdsaXRjaCAoc21h
bGwgdmVydGljYWwgc2hpZnQgb2YgdGhlIGltYWdlIG9uIHBvd2VydXApLCBidXQgcGVyc29uYWxs
eQo+IGRvbid0IGNhcmUgbXVjaCB0byBpbnRyb2R1Y2UgZXZlbiBtb3JlIGRlbGF5cyB0byB0aGUg
ZHJpdmVyLCBqdXN0IGZvciB0aGUKPiBjb3NtZXRpYyBpc3N1ZS4KPiAKPiByZWdhcmRzLAo+IAlv
Lgo+IAo+ID4gQ2hlZXJzLAo+ID4gIC0tIEd1aWRvCj4gPiAKPiA+ID4gCj4gPiA+IFRoaXMgcGF0
Y2ggc2VyaWVzIGZpeGVzIHRoZSBwcm9ibGVtcy4KPiA+ID4gCj4gPiA+IFRoZSBpc3N1ZSB3YXMg
cmVwb3J0ZWQgYnkgU2FtdWVsIEhvbGxhbmQuCj4gPiA+IAo+ID4gPiBSZWxldmFudCBzY3JlZW5z
aG90cyBmcm9tIHRoZSBkYXRhc2hlZXQ6Cj4gPiA+IAo+ID4gPiAgIFBvd2VyIG9uIHRpbWluZzog
aHR0cHM6Ly9tZWdvdXMuY29tL2RsL3RtcC8zNWI3MmU2NzRjZTBjYTI3LnBuZwo+ID4gPiAgIFBv
d2VyIG9mZiB0aW1pbmc6IGh0dHBzOi8vbWVnb3VzLmNvbS9kbC90bXAvZGVhMTk1NTE3MTA2ZmYx
Ny5wbmcKPiA+ID4gICBNb3JlIG9wdGltYWwgcmVzZXQgb24gcG93ZXJvbjogaHR0cHM6Ly9tZWdv
dXMuY29tL2RsL3RtcC9hOWU1Y2FmMTRlMWIwZGM2LnBuZwo+ID4gPiAgIExlc3Mgb3B0aW1hbCBy
ZXNldCBvbiBwb3dlcm9uOiBodHRwczovL21lZ291cy5jb20vZGwvdG1wLzI0Njc2MTAzOTI4M2M0
Y2YucG5nCj4gPiA+ICAgRGF0YXNoZWV0OiBodHRwczovL21lZ291cy5jb20vZGwvdG1wL1NUNzcw
M19EU192MDFfMjAxNjAxMjgucGRmCj4gPiA+IAo+ID4gPiBQbGVhc2UgdGFrZSBhIGxvb2suCj4g
PiA+IAo+ID4gPiB0aGFuayB5b3UgYW5kIHJlZ2FyZHMsCj4gPiA+ICAgT25kcmVqIEppcm1hbgo+
ID4gPiAKPiA+ID4gT25kcmVqIEppcm1hbiAoMik6Cj4gPiA+ICAgZHJtL3BhbmVsOiBzdDc3MDM6
IE1ha2UgdGhlIHNsZWVwIGV4aXQgdGltaW5nIG1hdGNoIHRoZSBzcGVjCj4gPiA+ICAgZHJtL3Bh
bmVsOiBzdDc3MDM6IEZpeCB0aGUgcG93ZXIgdXAgc2VxdWVuY2Ugb2YgdGhlIHBhbmVsCj4gPiA+
IAo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpdHJvbml4LXN0NzcwMy5jIHwg
MjkgKysrKysrKysrKy0tLS0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gLS0gCj4gPiA+IDIuMjcuMAo+ID4g
PiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
