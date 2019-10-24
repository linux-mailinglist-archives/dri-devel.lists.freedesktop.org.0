Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242C2E3331
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 14:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80446E3E5;
	Thu, 24 Oct 2019 12:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990336E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 12:56:48 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id r144so17454303iod.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 05:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTdM6kx15igVuSSKMbiCTSzmlWnq1yiOzOY1SuHhFrs=;
 b=gJdCRb/Ynde7Nx/2f0XAa85qPjFxHyvPMM81F+F77suF9EGmkttAkjRHDgLjUNvaBp
 OMEJ9q+ZtXzVKPtMm4SOMpOY/c9M/0Id5edrhGIbmJNVYpwBRPpIadBrjcMLjl1VP91Q
 sUFZOODpyGBZa6t4PHq0/XjWSUMGyFSOPPAKgm7C1bjS/VVyRsP9WnqLTkqqv8rmGEc0
 0ozz+mp3A+/tPPNRhPdD8YwhXQNIJedssdG+1HtvGF0fgJg3HRvFngv0ghFYNH8ioK1O
 R64mdMT1dN6qTCZG67ySSEw55IA9PbxXTPeQDGIg9hRSs/zVAB88nKKz2uaEfTR0o2K6
 A08g==
X-Gm-Message-State: APjAAAW5JZvzamhM6ymLNB0ydtBiAZ/+NrggULa5hKoSg1USm/DRuedG
 tqcOO0kTSOYYlDfVcenO9tk3ZyvUS2zYNSniLKKGrw==
X-Google-Smtp-Source: APXvYqzkszCGtKnl0Ho1P2Ch5cLL32TntiFQ+qXfuG+AJKZ9bQz72BttFsscY6YYlFZWJiYiZXLcIz32vRnBFLkhYy0=
X-Received: by 2002:a02:694e:: with SMTP id e75mr14609645jac.85.1571921807602; 
 Thu, 24 Oct 2019 05:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com>
 <20191007105708.raxavxk4n7bvxh7x@gilmour>
 <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
 <20191016080306.44pmo3rfmtnkgosq@gilmour>
 <CAMty3ZCTE=W+TNRvdowec-eYB625j97uG8F3fzVMtRFsKsqFFQ@mail.gmail.com>
 <20191017095225.ntx647ivegaldlyf@gilmour>
In-Reply-To: <20191017095225.ntx647ivegaldlyf@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Oct 2019 18:26:36 +0530
Message-ID: <CAMty3ZDYcwJ4XMm45BLjXnvPXeu-rMAiN5v=CDhvuLsAm5tf=Q@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=aTdM6kx15igVuSSKMbiCTSzmlWnq1yiOzOY1SuHhFrs=;
 b=hbo6HBALmJDGv9jgxlTtf+xksm9OJfWjLr2jEs1YgJaKNaoOQZiQIwRBkCZXab9vC8
 xlZ7f1bHG9D+YTORvlGPIf0LAoOoY5uPWuaoiiz8LEammkRzU8H5R/4MLt5ZAOXKal79
 TECVYmuEMl7GwJJokwPwayW76Qjpo9wnLDenY=
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMzoyMiBQTSBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDI6MTk6NDRQTSAr
MDUzMCwgSmFnYW4gVGVraSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE2LCAyMDE5IGF0IDE6MzMg
UE0gTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMDU6Mzc6NTBQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiA+ID4gPiBPbiBNb24sIE9jdCA3LCAyMDE5IGF0IDQ6MjcgUE0gTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBTYXQsIE9j
dCAwNSwgMjAxOSBhdCAwNzo0OToxMlBNICswNTMwLCBKYWdhbiBUZWtpIHdyb3RlOgo+ID4gPiA+
ID4gPiBBZGQgTUlQSSBEU0kgcGlwZWxpbmUgZm9yIEFsbHdpbm5lciBBNjQuCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IC0gZHNpIG5vZGUsIHdpdGggQTY0IGNvbXBhdGlibGUgc2luY2UgaXQgZG9l
c24ndCBzdXBwb3J0Cj4gPiA+ID4gPiA+ICAgRFNJX1NDTEsgZ2F0aW5nIHVubGlrZSBBMzMKPiA+
ID4gPiA+ID4gLSBkcGh5IG5vZGUsIHdpdGggQTY0IGNvbXBhdGlibGUgd2l0aCBBMzMgZmFsbGJh
Y2sgc2luY2UKPiA+ID4gPiA+ID4gICBEUEhZIG9uIEE2NCBhbmQgQTMzIGlzIHNpbWlsYXIKPiA+
ID4gPiA+ID4gLSBmaW5hbGx5LCBhdHRhY2ggdGhlIGRzaV9pbiB0byB0Y29uMCBmb3IgY29tcGxl
dGUgTUlQSSBEU0kKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+ID4gPiA+IFRlc3RlZC1ieTog
TWVybGlqbiBXYWplciA8bWVybGlqbkB3aXp6dXAub3JnPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4g
PiA+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaSB8IDM4
ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNl
cnRpb25zKCspCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+ID4gPiA+ID4gaW5kZXggNjkxMjhhNmRmYzQ2
Li5hZDQxNzBiOGFlZTAgMTAwNjQ0Cj4gPiA+ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjUwaS1hNjQuZHRzaQo+ID4gPiA+ID4gPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LmR0c2kKPiA+ID4gPiA+ID4gQEAgLTM4Miw2
ICszODIsMTIgQEAKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MT47Cj4gPiA+ID4gPiA+ICsK
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0Y29uMF9v
dXRfZHNpOiBlbmRwb2ludEAxIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwxPjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmZHNp
X2luX3Rjb24wPjsKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGFsbHdpbm5lcix0Y29uLWNoYW5uZWwgPSA8MT47Cj4gPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIH07Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgfTsKPiA+ID4gPiA+ID4gQEAgLTEwMDMs
NiArMTAwOSwzOCBAQAo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0g
ImRpc2FibGVkIjsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICB9Owo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiArICAgICAgICAgICAgIGRzaTogZHNpQDFjYTAwMDAgewo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWE2NC1taXBp
LWRzaSI7Cj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMWNhMDAw
MCAweDEwMDA+Owo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDg5IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ID4gPiA+ID4gPiArICAgICAgICAg
ICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19NSVBJX0RTST47Cj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiOwo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoaXMgd29uJ3QgdmFsaWRhdGUgd2l0aCB0aGUgYmluZGluZ3MgeW91IGhhdmUgZWl0
aGVyIGhlcmUsIHNpbmNlIGl0Cj4gPiA+ID4gPiBzdGlsbCBleHBlY3RzIGJ1cyBhbmQgbW9kLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IEkgZ3Vlc3MgaW4gdGhhdCBjYXMsIHdlIGNhbiBqdXN0IGRyb3Ag
Y2xvY2stbmFtZXMsIHdoaWNoIHdpbGwgcmVxdWlyZQo+ID4gPiA+ID4gYSBiaXQgb2Ygd29yayBv
biB0aGUgZHJpdmVyIHNpZGUgYXMgd2VsbC4KPiA+ID4gPgo+ID4gPiA+IE9rYXkuCj4gPiA+ID4g
bW9kIGNsb2NrIGlzIG5vdCByZXF1aXJlZCBmb3IgYTY0LCBpZSByZWFzb24gd2UgaGF2ZSBoYXNf
bW9kX2NsayBxdWlyawo+ID4gPiA+IHBhdGNoLiBBZGp1c3QgdGhlIGNsb2NrLW5hbWVzOiBvbiBk
dC1iaW5kaW5ncyB3b3VsZCBtYWtlIHNlbnNlIGhlcmUsCj4gPiA+ID4gd2hhdCBkbyB5b3UgdGhp
bms/Cj4gPiA+Cj4gPiA+IEknbSBjb25mdXNlZCwgd2hhdCBhcmUgeW91IHN1Z2dlc3Rpbmc/Cj4g
Pgo+ID4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24uCj4gPgo+ID4gVGhlIG1vZCBjbG9jayBpcyBu
b3QgcmVxdWlyZWQgZm9yIEE2NCBhbmQgd2UgaGF2ZSBhIHBhdGNoIGZvciBoYW5kbGluZwo+ID4g
bW9kIGNsb2NrIHVzaW5nIGhhc19tb2RfY2xrIHF1aXJrKG9uIHRoZSBzZXJpZXMpLCBpbmRlZWQg
dGhlIG1vZCBjbG9jawo+ID4gaXMgYXZhaWxhYmxlIGluIEEzMSBhbmQgbm90IG5lZWRlZCBmb3Ig
QTY0LiBTbywgdG8gc2F0aXNmeSB0aGlzCj4gPiByZXF1aXJlbWVudCB0aGUgY2xvY2stbmFtZXMg
b24gZHQtYmluZGluZ3MgY2FuIHVwZGF0ZSB0byBtYWtlIG1vZAo+ID4gY2xvY2stbmFtZSBpcyBv
cHRpb25hbCBhbmQgYnVzIGNsb2NrIGlzIHJlcXVpcmVkLgo+Cj4gTm8sIHRoZSBidXMgY2xvY2sg
bmFtZSBpcyBub3QgbmVlZGVkIGlmIHRoZXJlJ3Mgb25seSBvbmUgY2xvY2suCgpMb29rcyBsaWtl
IHdlIG5lZWQgImJ1cyIgY2xvY2sgcmVxdWlyZWQgc2luY2UgdGhlCmRldm1fcmVnbWFwX2luaXRf
bW1pb19jbGsgaXMgY3JlYXRlZCBvbmx5IGlmIGJ1cyBjbG9jay1uYW1lcyBhZGRlZCBpbgpkdC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
