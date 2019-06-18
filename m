Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6949A10
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD3E6E0F8;
	Tue, 18 Jun 2019 07:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCDB6E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 07:12:37 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id r185so21412083iod.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 00:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HmL++hI8lQoZaDbMBXIiWF1lw21O/uzMRwn2y/O0Xwk=;
 b=kIWdf1mfArk07Vad/IQ1bK7HTHsjilyLVjBdsmB9JgkLLRgWwEt1kwzDaAvIIKASXW
 kCLU+UwUvsFca2aykuLmZBGYoRESU1EWNDWqOwWCNVYgU/qkwZzPe/77USrOFqdhK3aJ
 YNaOlpVTi3OIO03W5tPugWMsew0DkF1Z0XOfdBovV5Clo9QDkcj2BMoaO78FHBfUyRA2
 1IhoIpUMbF5kKY/m6O2uYASKljv1gYvPZR0P0hjrWn572uu6daOL+9CXq5FmE/yTsrMm
 EiwLozUokPcNEgHSWZyLvGNG8etBscLgT0pyi79ytlzQEEqxc8Rjg/z1NcduvPENXOYm
 puZw==
X-Gm-Message-State: APjAAAV782o5s3tvvwvAD+2pDYsQvK1JMe1DOCzu+Sd6LA84urjdnCP6
 0caIvX8gk1x7ti18km7HWPqPlhtyaF9Tb9pb7TJAUA==
X-Google-Smtp-Source: APXvYqzNRlDJxCxF6O+3RbQgMZ8Vz5JWFmeOF5YnAqT2HmdW9eHgtOSbGNu6hfDOSRSNCnLlinOQTSXbS6Nte7phh2s=
X-Received: by 2002:a6b:6b14:: with SMTP id g20mr6191396ioc.28.1560841955317; 
 Tue, 18 Jun 2019 00:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190614164324.9427-1-jagan@amarulasolutions.com>
 <20190614164324.9427-6-jagan@amarulasolutions.com>
 <20190617114503.pclqsf6bo3ih47nt@flea>
 <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
In-Reply-To: <CAGb2v66RU=m0iA9VoBiYbake+mDoiiGcd5gGGXvNCBjhY2n+Dw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Jun 2019 12:42:23 +0530
Message-ID: <CAMty3ZA0J+2fSRwX+tS-waJDLMyTOf6UY_1pHjXe0qOk5QuzrQ@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH v2 5/9] drm/sun4i: tcon_top: Register
 clock gates in probe
To: Chen-Yu Tsai <wens@csie.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HmL++hI8lQoZaDbMBXIiWF1lw21O/uzMRwn2y/O0Xwk=;
 b=iaB9nIVlWH6LV1DMIrnPdNE4Ys6DzvdzS2TdZXtSSCE+E+q//N61iRLXcbqzVqDJaM
 QqF1qJCQwPEafzabEz0t6xWOChZQsyc3weFjZWETylgOH5RD2KFWKbMKG4bLlXxFg9OX
 dq6AUnd4hFcU4o+A0TnJag+k3HkoKHdrN5hKs=
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNjozMSBQTSBDaGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5v
cmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgNzo0NSBQTSBNYXhpbWUgUmlw
YXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEp1
biAxNCwgMjAxOSBhdCAxMDoxMzoyMFBNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+ID4gPiBU
Q09OIFRPUCBoYXZlIGNsb2NrIGdhdGVzIGZvciBUVjAsIFRWMSwgZHNpIGFuZCByaWdodAo+ID4g
PiBub3cgdGhlc2UgYXJlIHJlZ2lzdGVyIGR1cmluZyBiaW5kIGNhbGwuCj4gPiA+Cj4gPiA+IE9m
IHdoaWNoLCBkc2kgY2xvY2sgZ2F0ZSB3b3VsZCByZXF1aXJlZCBkdXJpbmcgRFBIWSBwcm9iZQo+
ID4gPiBidXQgc2FtZSBjYW4gbWlzcyB0byBnZXQgc2luY2UgdGNvbiB0b3AgaXMgbm90IGJvdW5k
IGF0Cj4gPiA+IHRoYXQgdGltZS4KPiA+ID4KPiA+ID4gVG8gc29sdmUsIHRoaXMgY2lyY3VsYXIg
ZGVwZW5kZW5jeSBtb3ZlIHRoZSBjbG9jayBnYXRlCj4gPiA+IHJlZ2lzdHJhdGlvbiBmcm9tIGJp
bmQgdG8gcHJvYmUgc28tdGhhdCBEUEhZIGNhbiBnZXQgdGhlCj4gPiA+IGRzaSBnYXRlIGNsb2Nr
IG9uIHRpbWUuCj4gPgo+ID4gSXQncyBub3QgcmVhbGx5IGNsZWFyIHRvIG1lIHdoYXQgdGhlIGNp
cmN1bGFyIGRlcGVuZGVuY3kgaXM/Cj4gPgo+ID4gaWYgeW91IGhhdmUgYSBjaGFpbiB0aGF0IGlz
Ogo+ID4KPiA+IHRjb24tdG9wICstPiBEU0kKPiA+ICAgICAgICAgICstPiBELVBIWQo+ID4KPiA+
IFRoZXJlJ3Mgbm8gbG9vcCwgcmlnaHQ/Cj4KPiBMb29raW5nIGF0IGhvdyB0aGUgRFRTSSBwYXRj
aCBzdHJ1Y3R1cmVzIHRoaW5ncyAod2l0aG91dCBnb2luZyBpbnRvCj4gd2hldGhlciBpdCBpcyBj
b3JyZWN0IG9yIGFjY3VyYXRlKToKPgo+IFRoZSBELVBIWSBpcyBub3QgcGFydCBvZiB0aGUgY29t
cG9uZW50IGdyYXBoLiBIb3dldmVyIGl0IHJlcXVlc3RzCj4gdGhlIERTSSBnYXRlIGNsb2NrIGZy
b20gdGhlIFRDT04tVE9QLgo+Cj4gVGhlIFRDT04tVE9QIGRyaXZlciwgaW4gaXRzIGN1cnJlbnQg
Zm9ybSwgb25seSByZWdpc3RlcnMgdGhlIGNsb2Nrcwo+IGl0IHByb3ZpZGVzIGF0IGNvbXBvbmVu
dCBiaW5kIHRpbWUuIFRodXMgdGhlIEQtUEhZIGNhbid0IHN1Y2Nlc3NmdWxseQo+IHByb2JlIHVu
dGlsIHRoZSBUQ09OLVRPUCBoYXMgYmVlbiBib3VuZC4KPgo+IFRoZSBEU0kgaW50ZXJmYWNlIHJl
cXVpcmVzIHRoZSBELVBIWSB0byBiaW5kLiBJdCB3aWxsIHJldHVybiAtRVBST0JFX0RFRkVSCj4g
aWYgaXQgY2Fubm90IHJlcXVlc3QgaXQuIFRoaXMgaW4gdHVybiBnb2VzIGludG8gdGhlIGVycm9y
IHBhdGggb2YKPiBjb21wb25lbnRfYmluZF9hbGwsIHdoaWNoIHVuYmluZHMgYWxsIHByZXZpb3Vz
IGNvbXBvbmVudHMuCj4KPiBTbyBpdCdzIGFjdHVhbGx5Cj4KPiAgICAgRC1QSFkgLT4gVENPTi1U
T1AgLT4gRFNJCj4gICAgICAgXiAgICAgICAgICAgICAgICAgICB8Cj4gICAgICAgfC0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4KPiBJJ3ZlIG5vdCBjaGVja2VkLCBidXQgSSBzdXNwZWN0IHRoZXJlJ3Mg
bm8gcG9zc2liaWxpdHkgb2YgaGF2aW5nIG90aGVyCj4gZHJpdmVycyBwcm9iZSAodG8gZGVhbCB3
aXRoIGRlZmVycmVkIHByb2JpbmcpIHdpdGhpbiBjb21wb25lbnRfYmluZF9hbGwuCj4gT3RoZXJ3
aXNlIHdlIHNob3VsZG4ndCBydW4gaW50byB0aGlzIHdlaXJkIGNpcmN1bGFyIGRlcGVuZGVuY3kg
aXNzdWUuCj4KPiBTbyB0aGUgcXVlc3Rpb24gZm9yIEphZ2FuIGlzIHRoYXQgaXMgdGhpcyBpbmRl
ZWQgdGhlIGNhc2U/IERvZXMgdGhpcwo+IHBhdGNoIHNvbHZlIGl0LCBvciBhdCBsZWFzdCB3b3Jr
IGFyb3VuZCBpdC4KClllcywgdGhpcyBpcyB3aGF0IEkgd2FzIG1lbnRpb25lZCBpbiBpbml0aWFs
IHZlcnNpb24sIHNpbmNlIHRoZSAiZHNpIgpnYXRlIGluIHRjb24gdG9wIGlzIHJlZ2lzdGVyaW5n
IGR1cmluZyBiaW5kLCB0aGUgZHBoeSBvZiBkc2kKY29udHJvbGxlciB3b24ndCBnZXQgdGhlIGFz
c29jaWF0ZWQgY2xvY2sgZm9yICJtb2QiIHNvIGl0IGlzIGtlZXAgb24KcmV0dXJuaW5nIC1FUFJP
QkVfREVGRVIuIEJ5IG1vdmluZyB0aGUgY2xvY2sgZ2F0ZSByZWdpc3RyYXRpb24gdG8KcHJvYmUs
IGV2ZXJ5dGhpbmcgYm91bmQgYXMgZXhwZWN0ZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
