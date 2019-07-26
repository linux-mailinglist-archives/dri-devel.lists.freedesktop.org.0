Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A991D76EAD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 18:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231A96EDC1;
	Fri, 26 Jul 2019 16:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BDE6EDC1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 16:14:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5548A80582;
 Fri, 26 Jul 2019 18:14:04 +0200 (CEST)
Date: Fri, 26 Jul 2019 18:14:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: Controllers with several interface options - one or more drivers?
Message-ID: <20190726161403.GA25593@ravnborg.org>
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
 <20190726122510.GA14341@ravnborg.org>
 <20190726145513.GK15868@phenom.ffwll.local>
 <CAKMK7uESP5D4e_Qx6W7amURqxJ=5Y4JHduZYCtkyVQY9jKJQeA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uESP5D4e_Qx6W7amURqxJ=5Y4JHduZYCtkyVQY9jKJQeA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=25-AhOLfAAAA:8
 a=vxpcmmc7qeB5gxik3AUA:9 a=CjuIK1q_8ugA:10 a=dnuY3_Gu-P7Vi9ynLKQe:22
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
Cc: devicetree <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Josef Lusticky <josef@lusticky.cz>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLgoKQWRkZWQgTm9yYWxmIC0gc29tZWhvdyBJIG1pc3NlZCBoaW0gb24gdGhlIG9y
aWdpbmFsIG1haWwuCgpPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCAwNTowNjowM1BNICswMjAwLCBE
YW5pZWwgVmV0dGVyIHdyb3RlOgo+IEFsc28gcHJvYmFibHkgc2hvdWxkIGFkZCBhIGZldyBtb3Jl
IChkcm1fYnJpZGdlKSBwZW9wbGUsIEkgdGhpbmsKPiB0aGF0J3MgYWxzbyBzb21ld2hhdCByZWxl
dmFudCBoZXJlLgo+IC1EYW5pZWwKPiAKPiBPbiBGcmksIEp1bCAyNiwgMjAxOSBhdCA0OjU1IFBN
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBK
dWwgMjYsIDIwMTkgYXQgMDI6MjU6MTBQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgo+ID4g
PiBIaSBKb3NlZiwgRGFuaWVsIGV0IGFsLgo+ID4gPgo+ID4gPiBUaGUgZHJpdmVyIHRoYXQgdHJp
Z2dlcmVkIHRoaXMgcmVwbHkgaXMgYSBkcml2ZXIgdGhhdCBhZGRzIHBhcmFsbGVsCj4gPiA+IHN1
cHBvcnQgdG8gaWxpOTM0MSBpbiBhIGRlZGljYXRlZCBwYW5lbCBkcml2ZXIuCj4gPiA+IFRoZSBp
c3N1ZSBoZXJlIGlzIHRoYXQgd2UgYWxyZWFkeSBoYXZlIGEgdGlueSBkcml2ZXIgdGhhdCBzdXBw
b3J0cyB0aGUKPiA+ID4gaWxpOTM0MSBjb250cm9sbGVyIC0gYnV0IHdpdGggYSBzbGlnaHRseSBk
aWZmZXJlbnQgY29uZmlndXJhdGlvbi4KPiA+ID4KPiA+ID4gVGhlIGlsaTkzNDEgc3VwcG9ydHMg
c2V2ZXJhbCBpbnRlcmZhY2VzIC0gZnJvbSB0aGUgZGF0YXNoZWV0Ogo+ID4gPiAgICAgIklMSTkz
NDEgc3VwcG9ydHMgcGFyYWxsZWwgOC0vOS0vMTYtLzE4LWJpdCBkYXRhIGJ1cwo+ID4gPiAgICAg
IE1DVSBpbnRlcmZhY2UsIDYtLzE2LS8xOC1iaXQgZGF0YSBidXMgUkdCIGludGVyZmFjZSBhbmQK
PiA+ID4gICAgICAzLS80LWxpbmUgc2VyaWFsIHBlcmlwaGVyYWwgaW50ZXJmYWNlIChTUEkpIgo+
ID4gPgo+ID4gPiBOb3JhbGYgLSBpbiBhbm90aGVyIG1haWwgZXhwbGFpbmVkOgo+ID4gPiAiCj4g
PiA+IFRoZSBNSVBJIEFsbGlhbmNlIGhhcyBsb3RzIG9mIHN0YW5kYXJkcyBzb21lIHdydC4gZGlz
cGxheSBjb250cm9sbGVyCj4gPiA+IGludGVyZmFjZXM6Cj4gPiA+IC0gTUlQSSBEQkkgLSBEaXNw
bGF5IEJ1cyBJbnRlcmZhY2UgKHVzZWQgZm9yIGNvbW1hbmRzIGFuZCBvcHRpb25hbGx5IHBpeGVs
cykKPiA+ID4gLSBNSVBJIERQSSAtIERpc3BsYXkgUGl4ZWwgSW50ZXJmYWNlIChhbHNvIGNhbGxl
ZCBSR0IgaW50ZXJmYWNlIG9yCj4gPiA+IERPVENMSyBpbnRlcmZhY2UpCj4gPiA+IC0gTUlQSSBE
U0kgLSBEaXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UgKGNvbW1hbmRzIGFuZCBwaXhlbHMpCj4gPiA+
Cj4gPiA+IFRoZSBpbGk5MzQxIHN1cHBvcnRzIGJvdGggTUlQSSBEQkkgYW5kIERQSS4KPiA+ID4g
Igo+ID4gPgo+ID4gPiBNSVBJIERQSSAtIGlzIGEgZ29vZCBmaXQgZm9yIGEgZHJtX3BhbmVsIGRy
aXZlci4KPiA+ID4gTUlQSSBEQkkgLSByZXF1aXJlcyBhIGZ1bGwgZGlzcGxheSBjb250cm9sbGVy
IGRyaXZlci4KPiA+ID4KPiA+ID4gVGhlcmUgYXJlIG1hbnkgb3RoZXIgZXhhbXBsZXMgb2YgZHJp
dmVyIFNvQyB0aGF0IGluIHRoZSBzYW1lIHdheQo+ID4gPiBjYW4gYmUgc2VlbiBvbmx5IGFzIGEg
cGFuZWwgb3IgYXMgYSBmdWxsIGRpc3BsYXkgY29udHJvbGxlciBkcml2ZXIuCj4gPiA+Cj4gPiA+
IFRoZSBvcGVuIHF1ZXN0aW9uIGhlcmUgaXMgaWYgd2Ugc2hvdWxkIHRyeSB0byBzdXBwb3J0IGJv
dGggY2FzZXMgaW4gdGhlCj4gPiA+IHNhbWUgZHJpdmVyIC8gZmlsZS4gT3Igc2hhbGwgd2UgaW1w
bG1lbnQgdHdvIGRpZmZlcmVudCBkcml2ZXJzLgo+ID4gPiBPbmUgZm9yIHRoZSBwYW5lbCB1c2Ut
Y2FzZS4gQW5kIG9uZSBmb3IgdGhlIGRpc3BsYXkgY29udHJvbGxlciB1c2VjYXNlPwo+ID4gPgo+
ID4gPiBOb3Qgc3VyZSAtIHNvIGFza2luZyBmb3IgZmVlZGJhY2suCj4gPgo+ID4gSSdtIG5vdCBz
dXJlLiBDdXJyZW50bHkgd2UgZG8gaGF2ZSBEU0kgYW5kIGR1bWIgUkdCIHBhbmVscyBhbGwgaW4K
PiA+IGRybS9wYW5lbC4gSSBkb24ndCB0aGluayB3ZSBoYXZlIERCSSBwYW5lbHMgaW4gdGhlcmUg
eWV0LCBidXQgdGhlbgo+ID4gZHJtL3RpbnkgaXMgdGhlIG9ubHkgb25lIHN1cHBvcnRpbmcgdGhl
c2UuCj4gPgo+ID4gSSBndWVzcyB3ZSBjb3VsZCBsb29rIGludG8gbW92ZSBzb21lIG9mIHRoZSBE
QkkgcGFuZWwgZHJpdmVycyBpbnRvIHBhbmVsCj4gPiBkcml2ZXJzLCBidXQgdGhhdCBuZWVkcyBh
IGJpdCBtb3JlIGdsdWUgYWxsIGFyb3VuZC4gSSdtIGhvbmVzdGx5IG5vdCBzdXJlCj4gPiBob3cg
dGhlIGN1cnJlbnQgRFNJIGRyaXZlcnMgaW4gZHJtX3BhbmVsIHdvcmsgZXhhY3RseSwgZXNwZWNp
YWxseSBmb3IKPiA+IGNvbW1hbmQgbW9kZS4KPiA+Cj4gPiBPciBtYXliZSB3ZSBuZWVkIGEgbmV3
IGludGVyZmFjZSBmb3IgY29tbWFuZCBtb2RlLgpJZiBJIGdldCBhcm91bmQgdG8gZG8gYSBkcml2
ZXIgZm9yIHRoZSBzc2QxMzA2IHRoZW4gSSB3aWxsIHRyeSB0byBzZXdoYXQKbWFrZXMgc2Vuc2Ug
dGhlbi4gRm9yIG5vdyB3ZSBzaGFsbCBub3Qgc3RhbGwgdGhlIGlsaTkzNDEgZHJpdmVyLgo+ID4K
PiA+IFdydCBzaGFyaW5nIGNvZGUgYmV0d2VlbiBkcml2ZXJzIGZvciB0aGUgc2FtZSBjaGlwLCBi
dXQgZGlmZmVyZW50Cj4gPiBpbnRlcmZhY2VzOiBJIHdvdWxkbid0IHdvcnJ5IHRvbyBtdWNoIGFi
b3V0IHRoYXQuIE1heWJlIHRyeSB0byBoYXZlIGEKPiA+IHNoYXJlZCBoZWFkZXIgZmlsZSBhdCBs
ZWFzdCBmb3IgcmVnaXN0ZXJzLgpUaGlzIHBhcnQgc2hvdWxkIGJlIHRoZSBtaW5pbXVtLiBTb210
aGluZyBsaWtlIGluY2x1ZGUvZHJtL21pcGkvPwoKCVNhbQoKPiA+IExvbmcgdGVybSB3ZSBjb3Vs
ZCBlbmQgdXAgd2l0aAo+ID4gb25lIGRyaXZlciBtb2R1bGUgd2hpY2ggZXhwb3NlcyBkaWZmZXJl
bnQgZmxhdm91cnMgb2YgdGhlIHNhbWUgY2hpcCwgc28KPiA+IG11bHRpcGxlIGRybV9wYW5lbCBk
cml2ZXJzLCBvciBtYXliZSB3ZSdsbCBnZXQgc29tZXRoaW5nIG1vcmUgc3BlY2lmaWMgZm9yCj4g
PiBkc2kvZGJpLgo+ID4gLURhbmllbAo+ID4gLS0KPiA+IERhbmllbCBWZXR0ZXIKPiA+IFNvZnR3
YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgo+ID4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
PiAKPiAKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVs
IENvcnBvcmF0aW9uCj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
