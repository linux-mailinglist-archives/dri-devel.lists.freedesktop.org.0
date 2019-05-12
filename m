Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A841ABC5
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 12:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B3A89954;
	Sun, 12 May 2019 10:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8109289954
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:22:46 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 988EF2B6;
 Sun, 12 May 2019 12:22:44 +0200 (CEST)
Date: Sun, 12 May 2019 13:22:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 02/10] dt-bindings: display: bridge: thc63lvd1024:
 Document dual-link operation
Message-ID: <20190512102228.GB4960@pendragon.ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190511210702.18394-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXtg3Kv+zt6kS9tViu93AjaHsOrSSotemt8T=8XVJcdyA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557656564;
 bh=DDR03bYg2ePZF7d5mgZhH20vPXhFxdLu/MQ9njF3CQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubY5jB/68AMS9OBdxqPuH2LdmYqEgpccxeh4DGF/Ps1H0SqQFd58RbwOfcM6pwTMI
 LgAvyNImm36i4hXultF85+27UlkRBIr9N6KytTIPPpZesoVBVdKyy2I2LN/aWUlOzR
 PbLKAaJ0SjZvG7Bcb7lZbCSOcSTXYodwgx6mSDoc=
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsCgpPbiBTdW4sIE1heSAxMiwgMjAxOSBhdCAxMDo1ODo1NEFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gU2F0LCBNYXkgMTEsIDIwMTkgYXQgMTE6MDcgUE0g
TGF1cmVudCBQaW5jaGFydCB3cm90ZToKPiA+IFRoZSBUSEM2M0xWRDEwMjQgTFZEUyBkZWNvZGVy
IGNhbiBvcGVyYXRlIGluIHR3byBtb2Rlcywgc2luZ2xlLWxpbmsgb3IKPiA+IGR1YWwtbGluay4g
SW4gZHVhbC1saW5rIG1vZGUgYm90aCBpbnB1dCBwb3J0cyBhcmUgdXNlZCB0byBjYXJyeSBldmVu
LQo+ID4gYW5kIG9kZC1udW1iZXJlZCBwaXhlbHMgc2VwYXJhdGVseS4gRG9jdW1lbnQgdGhpcyBp
biB0aGUgRFQgYmluZGluZ3MsCj4gPiBhbG9uZyB3aXRoIHRoZSByZWxhdGVkIHJ1bGVzIGdvdmVy
bmluZyBwb3J0IGFuZCB1c2FnZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNo
YXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KPiA+IFJldmll
d2VkLWJ5OiBKYWNvcG8gTW9uZGkgPGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+Cj4gPiAtLS0K
PiA+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dCAg
ICAgICAgICB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEwMjQudHh0Cj4gPiBp
bmRleCAzN2YwYzA0ZDVhMjguLmQxN2QxZTU4MjBkNyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZDEw
MjQudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvdGhpbmUsdGhjNjNsdmQxMDI0LnR4dAo+ID4gQEAgLTI4LDYgKzI4LDEyIEBAIE9w
dGlvbmFsIHZpZGVvIHBvcnQgbm9kZXM6Cj4gPiAgLSBwb3J0QDE6IFNlY29uZCBMVkRTIGlucHV0
IHBvcnQKPiA+ICAtIHBvcnRAMzogU2Vjb25kIGRpZ2l0YWwgQ01PUy9UVEwgcGFyYWxsZWwgb3V0
cHV0Cj4gPgo+ID4gK1RoZSBkZXZpY2UgY2FuIG9wZXJhdGUgaW4gc2luZ2xlLWxpbmsgbW9kZSBv
ciBkdWFsLWxpbmsgbW9kZS4gSW4gc2luZ2xlLWxpbmsKPiA+ICttb2RlLCBhbGwgcGl4ZWxzIGFy
ZSByZWNlaXZlZCBvbiBwb3J0QDAsIGFuZCBwb3J0QDEgc2hhbGwgbm90IGNvbnRhaW4gYW55Cj4g
PiArZW5kcG9pbnQuIEluIGR1YWwtbGluayBtb2RlLCBldmVuLW51bWJlcmVkIHBpeGVscyBhcmUg
cmVjZWl2ZWQgb24gcG9ydEAwIGFuZAo+ID4gK29kZC1udW1iZXJlZCBwaXhlbHMgb24gcG9ydEAx
LCBhbmQgYm90aCBwb3J0QDAgYW5kIHBvcnRAMSBzaGFsbCBjb250YWluCj4gPiArZW5kcG9pbnRz
Lgo+IAo+IFRoaXMgZGVzY3JpYmVzIHNpbmdsZS9kdWFsIGlucHV0Lgo+IERvZXMgc2luZ2xlL2R1
YWwgb3V0cHV0IG5lZWQgdG8gYmUgZGVzY3JpYmVkLCB0b28/CgpKYWNvcG8gYXNrZWQgdGhlIHNh
bWUgcXVlc3Rpb24gb24gdjEgOi0pIER1YWwtb3V0cHV0IHNob3VsZCBiZSBkZXNjcmliZWQKYXMg
d2VsbCwgYnV0IGFzIEkgaGF2ZSBubyBoYXJkd2FyZSBzZXR1cCB3aGVyZSB0byB0ZXN0IHRoYXQs
IEkgZGVjaWRlZAp0byBsZWF2ZSBpdCBvdXQgb2YgdGhlIERUIGJpbmRpbmdzIHRvIHN0YXJ0IHdp
dGgsIGFzIGl0J3MgZ2VuZXJhbGx5IGEKYmFkIGlkZWEgdG8gc3BlY2lmeSB1bnRlc3RlZCBEVCBi
aW5kaW5ncyAoYXMgaW4gaGF2aW5nIG5vIGVuZC10by1lbmQKaW1wbGVtZW50YXRpb24pLiBJIGRv
bid0IHRoaW5rIGl0IHdpbGwgYmUgYSBiaWcgZGVhbCB0aG91Z2gsIHRoZXJlIGlzCmFscmVhZHkg
YSBwb3J0IGZvciB0aGUgc2Vjb25kIG91dHB1dCwgaXQgc2hvdWxkIGp1c3QgYmUgYSBtYXR0ZXIg
b2YKY29ubmVjdGluZyBpdC4KCj4gQlRXLCBJIHNlZSB0aGUgc2Vjb25kIGlucHV0L291dHB1dCBz
ZXQgaXMgb3B0aW9uYWwsIHdpbGUgdGhlIGZpcnN0IHNldAo+IGlzIHJlcXVpcmVkLiAgQ291bGQg
aXQgaGFwcGVuIHRoZSBoYXJkd2FyZSBpcyB3aXJlZCBmb3IgdGhlIHNlY29uZAo+IHNldCBvbmx5
PwoKTm90IHRvIG15IGtub3dsZWRnZS4gSW4gZHVhbC1pbiwgZHVhbC1vdXQgdGhlIHR3byBpbnB1
dC9vdXRwdXQgcGFpcnMgYXJlCm5vdCBpbmRlcGVuZGVudCwgdGhlIHR3byBpbnB1dHMgYXJlIHVz
ZWQgdG9nZXRoZXIgdG8gY3JlYXRlIGEgaGlnaGVyCmJhbmR3aWR0aCBsaW5rLCBhbmQgdGhlIG9k
ZC0gYW5kIGV2ZW4tcGl4ZWxzIGFyZSB0aGVuIHNlbnQgdG8gc2VwYXJhdGUKcm91dGVzLgoKLS0g
ClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
