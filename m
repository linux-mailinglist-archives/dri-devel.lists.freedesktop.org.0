Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B54966A055
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 03:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DD26E067;
	Tue, 16 Jul 2019 01:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601089B20
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 20:00:46 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id m24so36201219ioo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 13:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D/u//h9h5nsqAs7HfcVGU38KKZeeeobvjpeQ+T4FGUw=;
 b=tEWWpjEKqABHukX4QL22bN00KWba/+xFgEWHwCU9gWDtfp0+oAsvwzm5UysbGq8Pb4
 x3f093oiEAVGBZAJQxGca0zLpYuEneKSwW2LGn9Seys+Vnn6UQTFfTyOjP62Bwvc4DDs
 KZXL8HEg1jyObCFq3f5kNFhcsfiOxl0qlUKyRqHTP0MO5obxV7RE2nt6GRw75WLlj9/b
 OKXqk/QFxjiCPIQ3+qdVfYoCuS8ZEuKthfCBpWw5AX2d4qHPTqa0hBiVO9UK9xzqW0FK
 gTmYO8bCQMFJsu0pZT6Dfgmy8XKwl4DwbD1GHDFwDfN9/9E/nWzPwZla815mMHlC0XDL
 sBdQ==
X-Gm-Message-State: APjAAAU1KPqj6cj62smV1eIQpIkJiJdiHnjkRSfwNkbUTSlcwEqXXtSj
 c1uaAZmE/dN9wJaB8Z3PBTlftIOuPe8d4EpguMwnwYga9tU=
X-Google-Smtp-Source: APXvYqyA6vQUGkrRdX/HxIitR7pnzYfqz0G0jJgjDOfZSZ3zx/ehoosjvpOq9MEMo4CpKvX4MGgoRTmUe1f03Nyg/e8=
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr21440225iog.43.1563220845620; 
 Mon, 15 Jul 2019 13:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
 <20190703063956.GA32102@innovation.ch>
 <20190715180407.GB131063@dtor-ws>
In-Reply-To: <20190715180407.GB131063@dtor-ws>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 15 Jul 2019 13:00:34 -0700
Message-ID: <CAKdAkRTGXNbUsuKASNGLfwUwC7Asod9K5baYLPWPU7EX-42-yA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
To: "Life is hard, and then you die" <ronald@innovation.ch>
X-Mailman-Approved-At: Tue, 16 Jul 2019 01:36:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D/u//h9h5nsqAs7HfcVGU38KKZeeeobvjpeQ+T4FGUw=;
 b=j+1GpKUrI57uEEkfPvTStFfut1NiVn1A/l+zGXIuClHjPdQD7GXUijxd0dyBo/CsHQ
 Bq+TMIDTowgY+dRMVYFTZ2HIrQGlPbl2nDVWBNL8QS0YA7558NLf56+vQGk1UMdNOgis
 nAoemWbyrgtjGFlo3eID4MX8RVG6FBdGwDmU/NVsbjwh7jIEM5FyCgIMl1BH19pVQcKM
 cUdAKEgppV50CRqrdYISBXXGCJI/RavB27InkgiS0hXPNXeTiSw622gRa6r/Gtlr7mvT
 SlJkBY8aSoJ0R9k83EqBbMR6P0xNMrpAIqeJdIcRpEVeMgM5+hSInJUK7aSgeLYOVTsk
 bGqg==
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Henrik Rydberg <rydberg@bitmath.org>, lkml <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Federico Lorenzi <federico@travelground.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MDQgQU0gRG1pdHJ5IFRvcm9raG92CjxkbWl0cnku
dG9yb2tob3ZAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gVHVlLCBKdWwgMDIsIDIw
MTkgYXQgMTE6Mzk6NTZQTSAtMDcwMCwgTGlmZSBpcyBoYXJkLCBhbmQgdGhlbiB5b3UgZGllIHdy
b3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVsIDAyLCAyMDE5IGF0IDAzOjUwOjQ5UE0gKzAyMDAsIEFu
ZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gPiA+IE9uIDE5LjA0LjIwMTkgMTA6MTksIFJvbmFsZCBUc2No
YWzDpHIgd3JvdGU6Cj4gPiA+ID4gY29tbWl0IGQ2YWJlNmRmNzA2YyAoZHJtL2JyaWRnZTogc2ls
X3NpaTg2MjA6IGRvIG5vdCBoYXZlIGEgZGVwZW5kZW5jeQo+ID4gPiA+IG9mIFJDX0NPUkUpIGNo
YW5nZWQgdGhlIGRyaXZlciB0byBzZWxlY3QgYm90aCBSQ19DT1JFIGFuZCBJTlBVVC4KPiA+ID4g
PiBIb3dldmVyLCB0aGlzIGNhdXNlcyBwcm9ibGVtcyB3aXRoIG90aGVyIGRyaXZlcnMsIGluIHBh
cnRpY3VsYXIgYW4gaW5wdXQKPiA+ID4gPiBkcml2ZXIgdGhhdCBkZXBlbmRzIG9uIE1GRF9JTlRF
TF9MUFNTX1BDSSAodG8gYmUgYWRkZWQgaW4gYSBzZXBhcmF0ZQo+ID4gPiA+IGNvbW1pdCk6Cj4g
PiA+ID4KPiA+ID4gPiAgIGRyaXZlcnMvY2xrL0tjb25maWc6OTplcnJvcjogcmVjdXJzaXZlIGRl
cGVuZGVuY3kgZGV0ZWN0ZWQhCj4gPiA+ID4gICBkcml2ZXJzL2Nsay9LY29uZmlnOjk6ICAgICAg
ICBzeW1ib2wgQ09NTU9OX0NMSyBpcyBzZWxlY3RlZCBieSBNRkRfSU5URUxfTFBTUwo+ID4gPiA+
ICAgZHJpdmVycy9tZmQvS2NvbmZpZzo1NjY6ICAgICAgc3ltYm9sIE1GRF9JTlRFTF9MUFNTIGlz
IHNlbGVjdGVkIGJ5IE1GRF9JTlRFTF9MUFNTX1BDSQo+ID4gPiA+ICAgZHJpdmVycy9tZmQvS2Nv
bmZpZzo1ODA6ICAgICAgc3ltYm9sIE1GRF9JTlRFTF9MUFNTX1BDSSBpcyBpbXBsaWVkIGJ5IEtF
WUJPQVJEX0FQUExFU1BJCj4gPiA+ID4gICBkcml2ZXJzL2lucHV0L2tleWJvYXJkL0tjb25maWc6
NzM6ICAgIHN5bWJvbCBLRVlCT0FSRF9BUFBMRVNQSSBkZXBlbmRzIG9uIElOUFVUCj4gPiA+ID4g
ICBkcml2ZXJzL2lucHV0L0tjb25maWc6ODogICAgICBzeW1ib2wgSU5QVVQgaXMgc2VsZWN0ZWQg
YnkgRFJNX1NJTF9TSUk4NjIwCj4gPiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25m
aWc6ODM6ICAgIHN5bWJvbCBEUk1fU0lMX1NJSTg2MjAgZGVwZW5kcyBvbiBEUk1fQlJJREdFCj4g
PiA+ID4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWc6MTogICAgIHN5bWJvbCBEUk1f
QlJJREdFIGlzIHNlbGVjdGVkIGJ5IERSTV9QTDExMQo+ID4gPiA+ICAgZHJpdmVycy9ncHUvZHJt
L3BsMTExL0tjb25maWc6MTogICAgICBzeW1ib2wgRFJNX1BMMTExIGRlcGVuZHMgb24gQ09NTU9O
X0NMSwo+ID4gPiA+Cj4gPiA+ID4gQWNjb3JkaW5nIHRvIHRoZSBkb2NzIGFuZCBnZW5lcmFsIGNv
bnNlbnN1cywgc2VsZWN0IHNob3VsZCBvbmx5IGJlIHVzZWQKPiA+ID4gPiBmb3Igbm9uIHVzZXIt
dmlzaWJsZSBzeW1ib2xzLCBidXQgYm90aCBSQ19DT1JFIGFuZCBJTlBVVCBhcmUKPiA+ID4gPiB1
c2VyLXZpc2libGUuIEZ1cnRoZXJtb3JlIGFsbW9zdCBhbGwgb3RoZXIgcmVmZXJlbmNlcyB0byBJ
TlBVVAo+ID4gPiA+IHRocm91Z2hvdXQgdGhlIGtlcm5lbCBjb25maWcgYXJlIGRlcGVuZHMsIG5v
dCBzZWxlY3RzLiBGb3IgdGhpcyByZWFzb24KPiA+ID4gPiB0aGUgZmlyc3QgcGFydCBvZiB0aGlz
IGNoYW5nZSByZXZlcnRzIGNvbW1pdCBkNmFiZTZkZjcwNmMuCj4gPiA+ID4KPiA+ID4gPiBJbiBv
cmRlciB0byBhZGRyZXNzIHRoZSBvcmlnaW5hbCByZWFzb24gZm9yIGNvbW1pdCBkNmFiZTZkZjcw
NmMsIG5hbWVseQo+ID4gPiA+IHRoYXQgbm90IGFsbCBib2FyZHMgdXNlIHRoZSByZW1vdGUgY29u
dHJvbGxlciBmdW5jdGlvbmFsaXR5IGFuZCBoZW5jZQo+ID4gPiA+IHNob3VsZCBub3QgbmVlZCBo
YXZlIHRvIGRlYWwgd2l0aCBSQ19DT1JFLCB0aGUgc2Vjb25kIHBhcnQgb2YgdGhpcwo+ID4gPiA+
IGNoYW5nZSBub3cgbWFrZXMgdGhlIHJlbW90ZSBjb250cm9sIHN1cHBvcnQgaW4gdGhlIGRyaXZl
ciBvcHRpb25hbCBhbmQKPiA+ID4gPiBjb250aW5nZW50IG9uIFJDX0NPUkUgYmVpbmcgZGVmaW5l
ZC4gQW5kIHdpdGggdGhpcyB0aGUgaGFyZCBkZXBlbmRlbmN5Cj4gPiA+ID4gb24gSU5QVVQgYWxz
byBnb2VzIGF3YXkgYXMgdGhhdCBpcyBvbmx5IG5lZWRlZCBpZiBSQ19DT1JFIGlzIGRlZmluZWQK
PiA+ID4gPiAod2hpY2ggaW4gdHVybiBhbHJlYWR5IGRlcGVuZHMgb24gSU5QVVQpLgo+ID4gPiA+
Cj4gPiA+ID4gQ0M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KPiA+ID4gPiBDQzog
QW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiA+ID4gPiBDQzogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gPiA+IENDOiBE
bWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogUm9uYWxkIFRzY2hhbMOkciA8cm9uYWxkQGlubm92YXRpb24uY2g+Cj4gPiA+ID4g
UmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Cj4gPiA+Cj4g
PiA+Cj4gPiA+IEFwcGFyZW50bHkgdGhpcyBwYXRjaCB3YXMgbm90IHF1ZXVlZCB0byBrZXJuZWwg
eWV0LiBJZiB0aGVyZSBhcmUgbm8KPiA+ID4gb2JqZWN0aW9ucyBJIHdpbGwgcXVldWUgaXQgdmlh
IGRybS1taXNjLW5leHQgdHJlZSB0b21vcnJvdy4KPiA+Cj4gPiBJZiB0aGlzIHBhdGNoIHNldCB3
b24ndCBiZSBxdWV1ZWQgZm9yIDUuMyB0aGVuIEkgZ3Vlc3MgdGhhdCB3b3VsZCBiZSBhCj4gPiBn
b29kIGlkZWEuCj4gPgo+ID4gQnV0IG1heSBJIGFzayB3aGF0IGlzIHByZXZlbnRpbmcgdGhpcyBw
YXRjaCBzZXQgZnJvbSBiZWluZyBxdWV1ZWQgZm9yCj4gPiB1cHN0cmVhbSwgc28gSSBjYW4gdHJ5
IGFuZCBmaXggd2hhdGV2ZXIgdGhlIGlzc3VlIGlzPwo+Cj4gQXMgSSBtZW50aW9uZWQgaW4gbXkg
cHVsbCByZXF1ZXN0IHRvIExpbnV4IEkgd2lsbCBiZSBwaWNraW5nIHVwIHRoZQo+IEFwcGxlIGtl
eWJvYXJkIGRyaXZlciBmb3IgdGhpcyBtZXJnZSB3aW5kb3cgZXZlbiB0aG91Z2ggaXQgd2FzIG5v
dCBpbgo+IG5leHQgKG15IGZhdWx0KS4KPgo+IEkgY3JlYXRlZCBhbmQgaW1tdXRhYmxlIGJyYW5j
aCBmb3IgdGhpcyBjaGFuZ2UgaWYgeW91J2QgbGlrZSB0byBwdWxsIGl0Cj4gaW4gc28gd2UgZG8g
bm90IGR1cGxpY2F0ZSBjb21taXQgYW5kIHJpc2sgdGhlIGNvbmZsaWN0cyAoYnV0IEkgYmVsaWV2
ZQo+IGdpdCBzaG91bGQgcmVzb2x2ZSBpdCBlaXRoZXIgd2F5KS4KPgo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2R0b3IvaW5wdXQuZ2l0IGlkLzUuMi1z
aWxfc2lpODYyMC1yYy1vcHRpb25hbAoKU29ycnksIHRoYXQgc2hvdWxkIGhhdmUgcmVhZDoKCmh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2R0b3IvaW5wdXQu
Z2l0CmliLzUuMi1zaWxfc2lpODYyMC1yYy1vcHRpb25hbAoKVGhhbmtzLgoKLS0gCkRtaXRyeQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
