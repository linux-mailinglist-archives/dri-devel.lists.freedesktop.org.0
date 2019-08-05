Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CE81594
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 11:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD2E89CFA;
	Mon,  5 Aug 2019 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8610189CF9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 09:35:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A559B2F9;
 Mon,  5 Aug 2019 11:35:45 +0200 (CEST)
Date: Mon, 5 Aug 2019 12:35:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH/RFC 02/12] dt-bindings: display: renesas: lvds: Document
 renesas,swap-data
Message-ID: <20190805093543.GB29747@pendragon.ideasonboard.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802074428.GB5008@pendragon.ideasonboard.com>
 <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17706A4FF4C26CD4BDA1A5DAC0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564997745;
 bh=9lyHNth0BO3OFQvy53sY8ChramaGr6/aYpcQayRs7Wk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eD6hF6pNE4bGlluLrMGZh1kev4mdIMcD6210/F7TcCD0TUmHaq+x3qIKSNpNLjI9O
 cnLNzSztiNtar/f+edH9FcfE2L3wsdjsgGvImAuR1LSyQQTdl0Gz3LscYddaQXoudC
 YclyoiDWszwHtibWSIFQLKCqKqh7obs/JjZw3NfI=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Simon Horman <horms@verge.net.au>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFicml6aW8sCgpPbiBNb24sIEF1ZyAwNSwgMjAxOSBhdCAwODo1OTo1MUFNICswMDAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBTZW50OiAwMiBBdWd1c3QgMjAxOSAwODo0
NAo+ID4gU3ViamVjdDogUmU6IFtQQVRDSC9SRkMgMDIvMTJdIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiByZW5lc2FzOiBsdmRzOiBEb2N1bWVudCByZW5lc2FzLHN3YXAtZGF0YQo+ID4gCj4gPiBIaSBG
YWJyaXppbywKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCj4gPiAKPiA+IE9uIEZy
aSwgQXVnIDAyLCAyMDE5IGF0IDA4OjMzOjU5QU0gKzAxMDAsIEZhYnJpemlvIENhc3RybyB3cm90
ZToKPiA+ID4gUi1DYXIgRDMsIFItQ2FyIEUzLCBhbmQgUlovRzJFIHN1cHBvcnQgZHVhbC1saW5r
IG1vZGUuCj4gPiA+IEluIHN1Y2ggYSBtb2RlLCB0aGUgZmlyc3QgTFZEUyBlbmNvZGVyIGVtaXRz
IGV2ZW4gZGF0YSwgYW5kIHRoZQo+ID4gPiBzZWNvbmQgTFZEUyBlbmNvZGVyIGVtaXRzIG9kZCBk
YXRhLiBUaGlzIHBhdGNoIGRvY3VtZW50cyBwcm9wZXJ0eQo+ID4gPiByZW5lc2FzLHN3YXAtZGF0
YSwgdXNlZCB0byBzd2FwIGV2ZW4gYW5kIG9kZCBkYXRhIGFyb3VuZC4KPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgfCA1ICsrKysrCj4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+
ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVu
ZXNhcyxsdmRzLnR4dAo+ID4gPiBpbmRleCBkZWNlNzllLi44OTgwMTc5IDEwMDY0NAo+ID4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVu
ZXNhcyxsdmRzLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dAo+ID4gPiBAQCAtNTIsNiArNTIsMTEg
QEAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ID4gICAgbWFuZGF0b3J5IGZvciB0aGUgZmlyc3Qg
TFZEUyBlbmNvZGVyIG9uIFItQ2FyIEQzLCBSLUNhciBFMywgYW5kIFJaL0cyRSBTb0NzLAo+ID4g
PiAgICBhbmQgc2hhbGwgcG9pbnQgdG8gdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMg
YSBjb21wYW5pb24gaW4gZHVhbC1saW5rCj4gPiA+ICAgIG1vZGUuIEl0IHNoYWxsIG5vdCBiZSBz
ZXQgZm9yIGFueSBvdGhlciBMVkRTIGVuY29kZXIuCj4gPiA+ICstIHJlbmVzYXMsc3dhcC1kYXRh
IDogd2hlbiBpbiBkdWFsLWxpbmsgbW9kZSwgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBub3JtYWxs
eQo+ID4gPiArICBlbWl0cyBldmVuIGRhdGEsIGFuZCB0aGUgc2Vjb25kIExWRFMgZW5jb2RlciBl
bWl0cyBvZGQgZGF0YS4gV2hlbiBwcm9wZXJ0eQo+ID4gPiArICByZW5lc2FzLHN3YXAtZGF0YSBp
cyBzcGVjaWZpZWQsIHRoZSBkYXRhIGVtaXR0ZWQgYnkgdGhlIHR3byBlbmNvZGVycyB3aWxsIGJl
Cj4gPiA+ICsgIHN3YXBwZWQgYXJvdW5kLiBUaGlzIHByb3BlcnR5IGNhbiBvbmx5IGJlIHVzZWQg
aW4gY29uanVuY3Rpb24gd2l0aCBwcm9wZXJ0eQo+ID4gPiArICByZW5lc2FzLGNvbXBhbmlvbi4K
PiA+IAo+ID4gRnJvbSBhbiBMVkRTIGVuY29kZXIgcG9pbnQgb2YgdmlldyB0aGlzIGlzIG1vcmUg
YSBjb25maWd1cmF0aW9uIG9wdGlvbgo+ID4gdGhhbiBhIGRlc2NyaXB0aW9uIG9mIHRoZSBoYXJk
d2FyZS4gV291bGRuJ3QgaXQgYmUgYmV0dGVyIGZvciB0aGUgTFZEUwo+ID4gc2luayB0byByZXBv
cnQgd2hpY2ggb2YgdGhlIG9kZCBvciBldmVuIHBpeGVscyBpdCBleHBlY3RzIG9uIGVhY2ggb2Yg
aXRzCj4gPiBlbmRwb2ludHMgPwo+IAo+IFllcywgdGhhdCB3b3VsZCBiZSBteSBwcmVmZXJlbmNl
IHRvbywgYW5kIGl0IHdvdWxkIGJlIGJldHRlciwgSSBhbSBqdXN0IG5vdCBlbnRpcmVseQo+IHdo
YXQncyB0aGUgYmVzdCBwbGFjZSBmb3IgdGhpcyBpbmZvcm1hdGlvbiB0aG91Z2gKPiAKPiA+IFRo
ZSBMVkRTIGVuY29kZXIgZHJpdmVyIGNvdWxkIHRoZW4gcXVlcnkgdGhhdCBhdCBydW50aW1lIGFu
ZAo+ID4gY29uZmlndXJlIGl0c2VsZiBhY2NvcmRpbmdseS4gSWRlYWxseSB0aGlzIHNob3VsZCBi
ZSBxdWVyaWVkIHRocm91Z2ggdGhlCj4gPiBkcm1fYnJpZGdlX3RpbWluZ3Mgc3RydWN0dXJlIChv
ciB0aHJvdWdoIGEgc2ltaWxhciBtZWFuKSwgbm90IHRocm91Z2gKPiA+IERULiBBbiBMVkRTIHNp
bmsgdGhhdCBoYXMgYSBmaXhlZCBtYXBwaW5nIG9mIG9kZC9ldmVuIHBpeGVscyB0bwo+ID4gZW5k
cG9pbnRzIHdvdWxkbid0IG5lZWQgdGhlIGluZm9ybWF0aW9uIHRvIGJlIHNwZWNpZmllZCBpbiBE
VCBhdCBhbGwuCj4gCj4gSXNuJ3QgZHJtX2JyaWRnZV90aW1pbmdzIHNwZWNpZmljIGZvciBicmlk
Z2VzPwoKSXRzIG5hbWUgbWFrZXMgaXQgc3BlY2lmaWMgdG8gYnJpZGdlcywgYnV0IHRoZSBpbmZv
cm1hdGlvbiBpdCBjb250YWlucwpjb3VsZCBlcXVhbGx5IGFwcGx5IHRvIHBhbmVscy4gSSB3b3Vs
ZCB0aHVzIHVzZSBpdCBmb3IgYm90aCwgcG9zc2libHkKYWZ0ZXIgcmVuYW1pbmcgaXQuCgotLSAK
UmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
