Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75B54562F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8A18972B;
	Fri, 14 Jun 2019 07:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B918088FA6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 21:00:38 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id c4so147171uad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 14:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANvjNrcE6QQq73dnlL+mZyHS0xmMxjzetcJMdK2W1jQ=;
 b=hCyQkMDa5dErYAtAG/GeCwF55EDGqSzaDcOGI1xsteKhgdkhflbvVIvzh4DFXvOlLT
 uO1c4GaFKGfQdBDoNO9a0G7hjDkbW18PmD4Z+myI4PkuMRMDYdGEIl+YwhLjZ+LGMVx8
 nVKZ55bNEVPlJ3HBt7kj2fJr85WR3gQLbSQ5tIGfwTF538LSv6RYNg+p4cU7PYh9Rjjz
 lJ6dK5KA1+WreFS4fOiYjSnfGeqPGNlU5ygeDGcgDv1vq4OGDA4ZIEzZndzjaUkoCN4f
 ns0aRBDyZWA+X+bUvaJrmZRiRbq4UMX6FeEL/OZucoMwB6Lcm8PdW+Vg3GffXweYMT3J
 hquQ==
X-Gm-Message-State: APjAAAUHnZI+ARHg1p3fYpgReC0xomEZFrtbdwdeE1jTHum92DC6lYZh
 at4aXEP8Aw+yq1rnFRZOeIaex7Cdz9PGGq3cbsBAJA==
X-Google-Smtp-Source: APXvYqzlG0QFlUSsjLJYtq2bSsXOqJPxL2qmav8y+XGpEorpyChcZ6aWL5jxAoS7c6ipQTO+UOtbuYWiPAgZ4BuXj/Q=
X-Received: by 2002:ab0:3d2:: with SMTP id 76mr17494821uau.12.1560459637540;
 Thu, 13 Jun 2019 14:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190611040350.90064-1-dbasehore@chromium.org>
 <20190611040350.90064-3-dbasehore@chromium.org>
 <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
 <CAGAzgsoWGqf0JQPNyRFnv2xZTMxje6idce7Dy5FZzuxj30mQyw@mail.gmail.com>
 <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+9K764hFT6GG=4paumGaxOUbnts4VJvTZ9a8Y-YPWdhg@mail.gmail.com>
From: "dbasehore ." <dbasehore@chromium.org>
Date: Thu, 13 Jun 2019 14:00:26 -0700
Message-ID: <CAGAzgsrNhumP2DEOff34cZ3UY=CV-EG1RM06Uf_tX3gdUMeSQg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: display/panel: Expand rotation
 documentation
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ANvjNrcE6QQq73dnlL+mZyHS0xmMxjzetcJMdK2W1jQ=;
 b=CXaGzb143DooLWuwJbQV6crBWgqXBWrbK4+440tGPl1wKAyG8snXREUHW1cU4JZmsm
 FByj4Hbh/N7MYr7J1mbnB5t09OsVMCB1N4NOkq7QEs9SD5IFkvvlk2kM4aqXonR4pgZ7
 0hbbny8wK43pD9gCj8eWhwnzsqv2xTicEtM7Y=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgNTo1MiBBTSBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDQ6MDIgUE0gZGJhc2Vo
b3JlIC4gPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVu
IDExLCAyMDE5IGF0IDg6MjUgQU0gUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDEwOjAzIFBNIERlcmVrIEJh
c2Vob3JlIDxkYmFzZWhvcmVAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFRo
aXMgYWRkcyB0byB0aGUgcm90YXRpb24gZG9jdW1lbnRhdGlvbiB0byBleHBsYWluIGhvdyBkcml2
ZXJzIHNob3VsZAo+ID4gPiA+IHVzZSB0aGUgcHJvcGVydHkgYW5kIGdpdmVzIGFuIGV4YW1wbGUg
b2YgdGhlIHByb3BlcnR5IGluIGEgZGV2aWNldHJlZQo+ID4gPiA+IG5vZGUuCj4gPiA+ID4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9taXVtLm9y
Zz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwu
dHh0ICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLnR4dAo+
ID4gPiA+IGluZGV4IGUyZTY4Njc4NTJiOC4uZjM1ZDYyZDkzM2ZjIDEwMDY0NAo+ID4gPiA+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVs
LnR4dAo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3BhbmVsL3BhbmVsLnR4dAo+ID4gPiA+IEBAIC0yLDMgKzIsMzUgQEAgQ29tbW9uIGRpc3Bs
YXkgcHJvcGVydGllcwo+ID4gPiA+ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ID4K
PiA+ID4gPiAgLSByb3RhdGlvbjogICAgRGlzcGxheSByb3RhdGlvbiBpbiBkZWdyZWVzIGNvdW50
ZXIgY2xvY2t3aXNlICgwLDkwLDE4MCwyNzApCj4gPiA+ID4gKwo+ID4gPiA+ICtQcm9wZXJ0eSBy
ZWFkIGZyb20gdGhlIGRldmljZSB0cmVlIHVzaW5nIG9mIG9mX2RybV9nZXRfcGFuZWxfb3JpZW50
YXRpb24KPiA+ID4KPiA+ID4gRG9uJ3QgcHV0IGtlcm5lbCBzcGVjaWZpY3MgaW50byBiaW5kaW5n
cy4KPiA+Cj4gPiBXaWxsIHJlbW92ZSB0aGF0LiBJJ2xsIGNsZWFuIHVwIHRoZSBkb2N1bWVudGF0
aW9uIHRvIGluZGljYXRlIHRoYXQKPiA+IHRoaXMgYmluZGluZyBjcmVhdGVzIGEgcGFuZWwgb3Jp
ZW50YXRpb24gcHJvcGVydHkgdW5sZXNzIHRoZSByb3RhdGlvbgo+ID4gaXMgaGFuZGxlZCBpbiB0
aGUgVGltaW5nIENvbnRyb2xsZXIgb24gdGhlIHBhbmVsIGlmIHRoYXQgc291bmRzIGZpbmUuCj4K
PiBFdmVuIGlmIHRoZSB0aW1pbmcgY3RybHIgaGFuZGxlcyBpdCwgZG9uJ3QgeW91IHN0aWxsIG5l
ZWQgdG8ga25vdyB3aGF0Cj4gdGhlIG5hdGl2ZSBvcmllbnRhdGlvbiBpcz8KCk5vdCByZWFsbHku
IEZvciBhbGwgaW50ZW50cyBhbmQgcHVycG9zZXMsIHRoZSBvcmllbnRhdGlvbiBvZiB0aGUgcGFu
ZWwKaGFzIGNoYW5nZWQuCgo+Cj4gPiA+ID4gKwo+ID4gPiA+ICtUaGUgcGFuZWwgZHJpdmVyIG1h
eSBhcHBseSB0aGUgcm90YXRpb24gYXQgdGhlIFRDT04gbGV2ZWwsIHdoaWNoIHdpbGwKPiA+ID4K
PiA+ID4gV2hhdCdzIFRDT04/IFNvbWV0aGluZyBNZWRpYXRlayBzcGVjaWZpYyBJSVJDLgo+ID4K
PiA+IFRoZSBUQ09OIGlzIHRoZSBUaW1pbmcgY29udHJvbGxlciwgd2hpY2ggaXMgb24gdGhlIHBh
bmVsLiBFdmVyeSBwYW5lbAo+ID4gaGFzIG9uZS4gSSdsbCBhZGQgdG8gdGhlIGRvYyB0aGF0IHRo
ZSBUQ09OIGlzIGluIHRoZSBwYW5lbCwgZXRjLgo+ID4KPiA+ID4KPiA+ID4gPiArbWFrZSB0aGUg
cGFuZWwgbG9vayBsaWtlIGl0IGlzbid0IHJvdGF0ZWQgdG8gdGhlIGtlcm5lbCBhbmQgYW55IG90
aGVyCj4gPiA+ID4gK3NvZnR3YXJlLgo+ID4gPiA+ICsKPiA+ID4gPiArSWYgbm90LCBhIHBhbmVs
IG9yaWVudGF0aW9uIHByb3BlcnR5IHNob3VsZCBiZSBhZGRlZCB0aHJvdWdoIHRoZSBTb0MKPiA+
ID4gPiArdmVuZG9yIERSTSBjb2RlIHVzaW5nIHRoZSBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxf
b3JpZW50YXRpb25fcHJvcGVydHkKPiA+ID4gPiArZnVuY3Rpb24uCj4gPiA+Cj4gPiA+IFRoZSAn
cm90YXRpb24nIHByb3BlcnR5IHNob3VsZCBiZSBkZWZpbmVkIHB1cmVseSBiYXNlZCBvbiBob3cg
dGhlCj4gPiA+IHBhbmVsIGlzIG1vdW50ZWQgcmVsYXRpdmUgdG8gYSBkZXZpY2UncyBvcmllbnRh
dGlvbi4gSWYgdGhlIGRpc3BsYXkKPiA+ID4gcGlwZWxpbmUgaGFzIHNvbWUgYWJpbGl0eSB0byBo
YW5kbGUgcm90YXRpb24sIHRoYXQncyBhIGZlYXR1cmUgb2YgdGhlCj4gPiA+IGRpc3BsYXkgcGlw
ZWxpbmUgYW5kIG5vdCB0aGUgcGFuZWwuCj4gPgo+ID4gVGhpcyBpcyBob3cgdGhlIHBhbmVsIG9y
aWVudGF0aW9uIHByb3BlcnR5IGlzIGFscmVhZHkgaGFuZGxlZCBpbiB0aGUKPiA+IGtlcm5lbC4g
U2VlIGRyaXZlcnMvZ3B1L2RybS9pOTE1L3Zsdl9kc2kuYyBmb3IgbW9yZSBkZXRhaWxzLgo+Cj4g
VGhlIHBvaW50IGlzIHlvdXIgZGVzY3JpcHRpb24gaXMgYWxsIGFib3V0IHRoZSBrZXJuZWwuIFRo
aXMgaXMgYQo+IGJpbmRpbmcgd2hpY2ggaXMgbm90IGtlcm5lbCBzcGVjaWZpYy4KCkFoLCBJIHNl
ZS4gSSB0aG91Z2h0IHlvdSB3ZXJlIHNheWluZyB3aGF0IHRoZSBpbXBsZW1lbnRhdGlvbiBzaG91
bGQgYmUuCgo+Cj4gPiA+ID4gKwo+ID4gPiA+ICtFeGFtcGxlOgo+ID4gPgo+ID4gPiBUaGlzIGZp
bGUgaXMgYSBjb2xsZWN0aW9uIG9mIGNvbW1vbiBwcm9wZXJ0aWVzLiBJdCBzaG91bGRuJ3QgaGF2
ZSBhbgo+ID4gPiBleGFtcGxlIGVzcGVjaWFsbHkgYXMgdGhpcyBleGFtcGxlIGlzIG1vc3RseSBu
b24tY29tbW9uIHByb3BlcnRpZXMuCj4gPgo+ID4gSnVzdCBjb3BpZWQgb25lIG9mIG91ciBEVFMg
ZW50cmllcyB0aGF0IHVzZXMgdGhlIHByb3BlcnR5LiBJJ2xsIHJlbW92ZQo+ID4gZXZlcnl0aGlu
ZyB1bmRlciBjb21wYXRpYmxlIGV4Y2VwdCBmb3Igcm90YXRpb24gYW5kIHN0YXR1cy4KPgo+IEp1
c3QgcmVtb3ZlIHRoZSBleGFtcGxlIG9yIGFkZCB3aGF0IHlvdSB3YW50IHRvIHRoZSAiYm9lLGhp
bWF4ODI3OWQ4cCIKPiBiaW5kaW5nIGRvYy4gV2UgYXJlIG1vdmluZyB0b3dhcmRzIGV4YW1wbGVz
IGJlaW5nIGNvbXBpbGVkIGFuZAo+IHZhbGlkYXRlZCwgc28gaW5jb21wbGV0ZSBvbmVzIHdvbid0
IHdvcmsuCgpPaywgd2lsbCBkby4KCj4KPiBSb2IKClRoYW5rcyBmb3IgdGhlIHF1aWNrIHJldmll
d3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
