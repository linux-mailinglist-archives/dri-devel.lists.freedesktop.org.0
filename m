Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A74ADA4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 00:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7616E264;
	Tue, 18 Jun 2019 22:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D4C6E264
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:10:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 8027C260D74
Message-ID: <20372cd5e56d67b8e896c2d94b3d0d136cc2886e.camel@collabora.com>
Subject: Re: [PATCH 2/3] drm/rockchip: Add optional support for CRTC gamma LUT
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 18 Jun 2019 19:09:57 -0300
In-Reply-To: <CAKb7UvgvY0tJDV9A=4+8=iqraziyt8SGF-QrX=M8jz+R+5JC=A@mail.gmail.com>
References: <20190618213406.7667-1-ezequiel@collabora.com>
 <20190618213406.7667-3-ezequiel@collabora.com>
 <CAKb7UvgvY0tJDV9A=4+8=iqraziyt8SGF-QrX=M8jz+R+5JC=A@mail.gmail.com>
Organization: Collabora
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
 devicetree <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTE4IGF0IDE3OjQ3IC0wNDAwLCBJbGlhIE1pcmtpbiB3cm90ZToKPiBP
biBUdWUsIEp1biAxOCwgMjAxOSBhdCA1OjQzIFBNIEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxA
Y29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gPiBBZGQgYW4gb3B0aW9uYWwgQ1JUQyBnYW1tYSBMVVQg
c3VwcG9ydCwgYW5kIGVuYWJsZSBpdCBvbiBSSzMyODguCj4gPiBUaGlzIGlzIGN1cnJlbnRseSBl
bmFibGVkIHZpYSBhIHNlcGFyYXRlIGFkZHJlc3MgcmVzb3VyY2UsCj4gPiB3aGljaCBuZWVkcyB0
byBiZSBzcGVjaWZpZWQgaW4gdGhlIGRldmljZXRyZWUuCj4gPiAKPiA+IFRoZSBhZGRyZXNzIHJl
c291cmNlIGlzIHJlcXVpcmVkIGJlY2F1c2Ugb24gc29tZSBTb0NzLCBzdWNoIGFzCj4gPiBSSzMy
ODgsIHRoZSBMVVQgYWRkcmVzcyBpcyBhZnRlciB0aGUgTU1VIGFkZHJlc3MsIGFuZCB0aGUgbGF0
dGVyCj4gPiBpcyBzdXBwb3J0ZWQgYnkgYSBkaWZmZXJlbnQgZHJpdmVyLiBUaGlzIHByZXZlbnRz
IHRoZSBEUk0gZHJpdmVyCj4gPiBmcm9tIHJlcXVlc3RpbmcgYW4gZW50aXJlIHJlZ2lzdGVyIHNw
YWNlLgo+ID4gCj4gPiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiB3b3JrcyBmb3IgUkdCIDEw
LWJpdCB0YWJsZXMsIGFzIHRoYXQKPiA+IGlzIHdoYXQgc2VlbXMgdG8gd29yayBvbiBSSzMyODgu
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFi
b3JhLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBmcm9tIFJGQzoKPiA+ICogUmVxdWVzdCAoYW4g
b3B0aW9uYWwpIGFkZHJlc3MgcmVzb3VyY2UgZm9yIHRoZSBMVVQuCj4gPiAqIERyb3Agc3VwcG9y
dCBmb3IgUkszMzk5LCB3aGljaCBkb2Vzbid0IHNlZW0gdG8gd29yawo+ID4gICBvdXQgb2YgdGhl
IGJveCBhbmQgbmVlZHMgbW9yZSByZXNlYXJjaC4KPiA+ICogU3VwcG9ydCBwYXNzLXRocnUgc2V0
dGluZyB3aGVuIEdBTU1BX0xVVCBpcyBOVUxMLgo+ID4gKiBBZGQgYSBjaGVjayBmb3IgdGhlIGdh
bW1hIHNpemUsIGFzIHN1Z2dlc3RlZCBieSBJbGlhLgo+ID4gKiBNb3ZlIGdhbW1hIHNldHRpbmcg
dG8gYXRvbWljX2NvbW1pdF90YWlsLCBhcyBwb2ludGVkCj4gPiAgIG91dCBieSBKYWNvcG8vTGF1
cmVudCwgaXMgdGhlIGNvcnJlY3Qgd2F5Lgo+ID4gLS0tCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
b2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPiA+IGluZGV4IDEyZWQ1MjY1YTkwYi4uNWI2ZWRi
ZTI2NzNmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlw
X2RybV92b3AuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2Ry
bV92b3AuYwo+ID4gK3N0YXRpYyB2b2lkIHZvcF9jcnRjX2dhbW1hX3NldChzdHJ1Y3Qgdm9wICp2
b3AsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm9sZF9zdGF0ZSkKPiA+ICt7Cj4gPiArICAgICAg
IGludCBpZGxlLCByZXQsIGk7Cj4gPiArCj4gPiArICAgICAgIHNwaW5fbG9jaygmdm9wLT5yZWdf
bG9jayk7Cj4gPiArICAgICAgIFZPUF9SRUdfU0VUKHZvcCwgY29tbW9uLCBkc3BfbHV0X2VuLCAw
KTsKPiA+ICsgICAgICAgdm9wX2NmZ19kb25lKHZvcCk7Cj4gPiArICAgICAgIHNwaW5fdW5sb2Nr
KCZ2b3AtPnJlZ19sb2NrKTsKPiA+ICsKPiA+ICsgICAgICAgcmV0ID0gcmVhZHhfcG9sbF90aW1l
b3V0KHZvcF9kc3BfbHV0X2lzX2VuYWJsZSwgdm9wLAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWRsZSwgIWlkbGUsIDUsIDMwICogMTAwMCk7Cj4gPiArICAgICAgIGlmIChyZXQpCj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgICBzcGluX2xvY2soJnZv
cC0+cmVnX2xvY2spOwo+ID4gKwo+ID4gKyAgICAgICBpZiAoY3J0Yy0+c3RhdGUtPmdhbW1hX2x1
dCkgewo+ID4gKyAgICAgICAgICAgICAgIGlmICghb2xkX3N0YXRlLT5nYW1tYV9sdXQgfHwgKGNy
dGMtPnN0YXRlLT5nYW1tYV9sdXQtPmJhc2UuaWQgIT0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBvbGRfc3RhdGUtPmdhbW1hX2x1dC0+YmFzZS5pZCkp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2b3BfY3J0Y193cml0ZV9nYW1tYV9sdXQodm9w
LCBjcnRjKTsKPiA+ICsgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICBmb3IgKGkg
PSAwOyBpIDwgY3J0Yy0+Z2FtbWFfc2l6ZTsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICB1MzIgd29yZDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHdvcmQgPSAo
aSA8PCAyMCkgfCAoaSA8PCAxMCkgfCBpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgd3Jp
dGVsKHdvcmQsIHZvcC0+bHV0X3JlZ3MgKyBpICogNCk7Cj4gPiArICAgICAgICAgICAgICAgfQo+
IAo+IE5vdGUgLSBJJ20gbm90IGluIGFueSB3YXkgZmFtaWxpYXIgd2l0aCB0aGUgaGFyZHdhcmUs
IHNvIHRha2Ugd2l0aCBhCj4gZ3JhaW4gb2Ygc2FsdCAtLQo+IAo+IENvdWxkIHlvdSBqdXN0IGxl
YXZlIGRzcF9sdXRfZW4gdHVybmVkIG9mZiBpbiB0aGlzIGNhc2U/Cj4gCgpUaGF0IHdhcyB0aGUg
Zmlyc3QgdGhpbmcgSSB0cmllZCA6LSkKCkl0IHNlZW1zIGRzcF9sdXRfZW4gaXMgbm90IHRvIGVu
YWJsZSB0aGUgQ1JUQyBnYW1tYSBMVVQgc3RhZ2UsCmJ1dCB0byBlbmFibGUgd3JpdGluZyB0aGUg
Z2FtbWEgTFVUIHRvIHRoZSBpbnRlcm5hbCBSQU0uCgpBbmQgdGhlIHNwZWNzIGxpc3Qgbm8gcmVn
aXN0ZXIgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGdhbW1hIExVVC4KClRoYW5rcyEKRXplCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
