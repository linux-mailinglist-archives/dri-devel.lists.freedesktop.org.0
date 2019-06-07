Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A3F398B1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 00:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D52E890D2;
	Fri,  7 Jun 2019 22:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32779890D2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 22:30:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [109.132.30.162])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 761E9334;
 Sat,  8 Jun 2019 00:30:34 +0200 (CEST)
Date: Sat, 8 Jun 2019 01:30:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190607223020.GB5110@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-3-laurent.pinchart+renesas@ideasonboard.com>
 <63985327-c796-c8cc-50c8-f486942e3161@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63985327-c796-c8cc-50c8-f486942e3161@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1559946634;
 bh=TVcF39DakO89LqGPGv5S/y5Maujvp3sb4JgJNHyACIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JYAmczn8uttCedmd+1NrTM41d7zAgQmJxP4/SlUjYK3NYC4xIsRyW5kTTgkryMSGZ
 fJbrtXOai66AonEnj5dz4QSHcltwjdySvGPfq14ROxnN7RT7cnHyuhpeWs1MQfzIr6
 KEw5t8Co1ee68twgEwMEaIqmbS3aNXDmdbS+0ZMc=
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
Cc: devicetree@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKT24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTE6MTU6MDZQTSArMDEwMCwgS2ll
cmFuIEJpbmdoYW0gd3JvdGU6Cj4gT24gMjgvMDUvMjAxOSAxNToxMiwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiA+IFRoZSBUSEM2M0xWRDEwMjQgTFZEUyBkZWNvZGVyIGNhbiBvcGVyYXRlIGlu
IHR3byBtb2Rlcywgc2luZ2xlLWxpbmsgb3IKPiA+IGR1YWwtbGluay4gSW4gZHVhbC1saW5rIG1v
ZGUgYm90aCBpbnB1dCBwb3J0cyBhcmUgdXNlZCB0byBjYXJyeSBldmVuLQo+ID4gYW5kIG9kZC1u
dW1iZXJlZCBwaXhlbHMgc2VwYXJhdGVseS4gRG9jdW1lbnQgdGhpcyBpbiB0aGUgRFQgYmluZGlu
Z3MsCj4gPiBhbG9uZyB3aXRoIHRoZSByZWxhdGVkIHJ1bGVzIGdvdmVybmluZyBwb3J0IGFuZCB1
c2FnZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5w
aW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSmFjb3Bv
IE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFj
b3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEwMjQudHh0ICAgICAgICAgIHwgNiArKysrKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNs
dmQxMDI0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
aWRnZS90aGluZSx0aGM2M2x2ZDEwMjQudHh0Cj4gPiBpbmRleCAzN2YwYzA0ZDVhMjguLmQxN2Qx
ZTU4MjBkNyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEwMjQudHh0Cj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQx
MDI0LnR4dAo+ID4gQEAgLTI4LDYgKzI4LDEyIEBAIE9wdGlvbmFsIHZpZGVvIHBvcnQgbm9kZXM6
Cj4gPiAgLSBwb3J0QDE6IFNlY29uZCBMVkRTIGlucHV0IHBvcnQKPiA+ICAtIHBvcnRAMzogU2Vj
b25kIGRpZ2l0YWwgQ01PUy9UVEwgcGFyYWxsZWwgb3V0cHV0Cj4gPiAgCj4gPiArVGhlIGRldmlj
ZSBjYW4gb3BlcmF0ZSBpbiBzaW5nbGUtbGluayBtb2RlIG9yIGR1YWwtbGluayBtb2RlLiBJbiBz
aW5nbGUtbGluawo+ID4gK21vZGUsIGFsbCBwaXhlbHMgYXJlIHJlY2VpdmVkIG9uIHBvcnRAMCwg
YW5kIHBvcnRAMSBzaGFsbCBub3QgY29udGFpbiBhbnkKPiA+ICtlbmRwb2ludC4gSW4gZHVhbC1s
aW5rIG1vZGUsIGV2ZW4tbnVtYmVyZWQgcGl4ZWxzIGFyZSByZWNlaXZlZCBvbiBwb3J0QDAgYW5k
Cj4gPiArb2RkLW51bWJlcmVkIHBpeGVscyBvbiBwb3J0QDEsIGFuZCBib3RoIHBvcnRAMCBhbmQg
cG9ydEAxIHNoYWxsIGNvbnRhaW4KPiA+ICtlbmRwb2ludHMuCj4gPiArCj4gCj4gWW91ciBjb3Zl
ciBsZXR0ZXIgZGV0YWlscyA0IGRpZmZlcmVudCBtb2RlcyBvZiBvcGVyYXRpb24gZm9yIHRoaXMg
cGFydC4KPiAKPiBEbyB5b3UgYW50aWNpcGF0ZSB0aGUgb3RoZXIgY29tYmluYXRpb25zIHtTaW5n
bGUtaW4sIGR1YWwtb3V0OyBkdWFsLWluLAo+IGR1YWwtb3V0fSBiZWluZyBzdXBwb3J0ZWQ/IFBl
cmhhcHMgdGhhdCB3b3VsZCBiZSBkZWZpbmVkIGJ5IHRoZSByZWxldmFudAo+IGVuZHBvaW50cyBi
ZWluZyBjb25uZWN0ZWQgb3Igbm90ID8KCkkgZXhwZWN0IHRoYXQgc29tZW9uZSBtaWdodCBuZWVk
IHRob3NlIG1vZGVzIGF0IHNvbWUgcG9pbnQsIGJ1dCBJCmhhdmVuJ3Qgc3BlY2lmaWVkIHRoZW0g
b24gcHVycG9zZSwgYXMgSSBkb24ndCBsaWtlIHdyaXRpbmcgRFQgYmluZGluZ3MKdGhhdCBjYW4n
dCBiZSB0ZXN0ZWQuIEkgaG93ZXZlciBleHBvZWN0IHRoYXQgdGhvc2UgYWRkaXRpb25hbCBtb2Rl
cyBjYW4KYmUgZGVyaXZlZCBmcm9tIHRoZSBjb25uZWN0ZWQgZW5kcG9pbnRzLgoKPiBZb3Ugc3Rh
dGUgdGhhdCBpbiBkdWFsLWxpbmsgbW9kZSwgYm90aCBwb3J0QDAsIGFuZCBwb3J0QDEgc2hhbGwg
Y29udGFpbgo+IGVuZHBvaW50cywgc28gdGhhdCBpbXBsaWVzIHRoYXQgeW91IG9ubHkgZXhwZWN0
IHRvIHN1cHBvcnQgZHVhbC1pbiB3aXRoCj4gdGhlICdkdWFsLWxpbmsnIHByb3BlcnR5LiBJZiB0
aGF0IGlzIGNvcnJlY3QsIHNob3VsZCBpdCBiZSBzdGF0ZWQKPiBleHBsaWNpdGx5PwoKV2hhdCBk
byB5b3UgbWVhbiBieSB0aGUgJ2R1YWwtbGluaycgcHJvcGVydHkgPyBUaGUgcGF0Y2ggc2VyaWVz
IGRlZmluZXMKbm8gc3VjaCBwcm9wZXJ0eS4KCj4gT3RoZXJ3aXNlLAo+IAo+IFJldmlld2VkLWJ5
OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29t
Pgo+IAo+ID4gIEV4YW1wbGU6Cj4gPiAgLS0tLS0tLS0KPiA+ICAKCi0tIApSZWdhcmRzLAoKTGF1
cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
