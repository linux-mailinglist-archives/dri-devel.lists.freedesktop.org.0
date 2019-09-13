Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ECEB1AE5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 11:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B5C36EEF9;
	Fri, 13 Sep 2019 09:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6D96EEF9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:34:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4BB12081B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 09:34:36 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id q64so15906932ljb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 02:34:36 -0700 (PDT)
X-Gm-Message-State: APjAAAVEIDRkzKfZALxDXFegxyMH385kPg3hACQAsUmSZpdAM0+G+7pF
 zXCPiPZtyqbpsxf482Qz4g7x+2R6SokXOtm6QS8=
X-Google-Smtp-Source: APXvYqy5o658AEBPc5fOVRFV7GUypotpgi43Z/aqyQfjnJkobgK4lZIRZ8dAvgCn3EqfTws0Ta/hoGRE/Pj+V5zRQXQ=
X-Received: by 2002:a2e:8785:: with SMTP id n5mr25373427lji.210.1568367275146; 
 Fri, 13 Sep 2019 02:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190912093315.5744-1-m.falkowski@samsung.com>
 <CGME20190912161550eucas1p2bdc813d46f337f3717bdbfd33bae8d4a@eucas1p2.samsung.com>
 <20190912161538.4321-1-m.falkowski@samsung.com> <20190913062945.GA10283@pi3>
 <e082996a-743d-807a-38c0-dee65b490771@samsung.com>
 <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
In-Reply-To: <CAJKOXPdSQJ4CR_0BQjudx1NdaC0E_rU8ZDtFVSB9XwcTbxSdUg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 13 Sep 2019 11:34:23 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd58jsqSycgQF=v_iBti292X+ECeCQ0Tf7ErycYXrkTmQ@mail.gmail.com>
Message-ID: <CAJKOXPd58jsqSycgQF=v_iBti292X+ECeCQ0Tf7ErycYXrkTmQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: gpu: Convert Samsung Image Rotator to
 dt-schema
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568367277;
 bh=H9+NtvTN5Oyf3/3qCq7otSn6j+SjdYcEzVoUk777SgQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JUqhdO25DXtP+/RWXYCZ+QzcenkF30JQc17F0M637aEG6Cr7d9fjAAghLKlTBks1m
 PZdMQr0mtwB+Q1ancXtSnTJDmjouIGnkh00QbSaAl4KEJ54L9val4FyW2vkiT4yBvV
 FYkafksXggWKy+TYjnm8Jp0xTNYfexQvhn1KtrXs=
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>, airlied@linux.ie,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAxMToyOSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgMTMgU2VwIDIwMTkgYXQgMTE6MTUsIE1hcmVr
IFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkg
S3J6eXN6dG9mLAo+ID4KPiA+IE9uIDkvMTMvMTkgODoyOSBBTSwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPiA+ID4gT24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMDY6MTU6MzhQTSArMDIwMCwg
TWFjaWVqIEZhbGtvd3NraSB3cm90ZToKPiA+ID4+IENvbnZlcnQgU2Ftc3VuZyBJbWFnZSBSb3Rh
dG9yIHRvIG5ld2VyIGR0LXNjaGVtYSBmb3JtYXQuCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1i
eTogTWFjaWVqIEZhbGtvd3NraSA8bS5mYWxrb3dza2lAc2Ftc3VuZy5jb20+Cj4gPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4g
PiA+IEp1c3QgdG8gbWFrZSBpdCBjbGVhciwgTWFyZWsncyBzaWduZWQtb2ZmIHNob3VsZCBhcHBl
YXIgZm9yIG9uZSBvZgo+ID4gPiBjb25kaXRpb25zOgo+ID4gPiAgIC0gaGUgY29udHJpYnV0ZWQg
c29tZSBzb3VyY2UgY29kZSB0byB5b3VyIHBhdGNoLAo+ID4gPiAgIC0gaGUgdG9vayB5b3VyIHBh
dGNoLCByZWJhc2VkLCBzZW5kIGJ5IGhpbXNlbGYgKG5vdCBhIGNhc2UgaGVyZSwgSQo+ID4gPiAg
ICAgdGhpbmspLAo+ID4gPiAgIC0gaGUgY29udHJpYnV0ZWQgc2lnbmlmaWNhbnQgaWRlYXMsIGFs
dGhvdWdoIGZvciB0aGlzIHRoZXJlIGlzIGEKPiA+ID4gICAgICJDby1kZXZlbG9wZWQtYnkiIHRh
Zy4KPiA+ID4KPiA+ID4gSWYgc29tZW9uZSBtYWRlIGp1c3QgcmV2aWV3IC0gYWRkIFJldmlld2Vk
LWJ5LiBJZiBzb21lb25lIHN1Z2dlc3RlZCB0aGUKPiA+ID4gcGF0Y2ggLSBhZGQgU3VnZ2VzdGVk
LWJ5Lgo+ID4KPiA+IE15IHNpZ25lZC1vZmYgaGVyZSB3YXMgYWRkZWQgdG8gbWFyayB0aGF0IHRo
aXMgcGF0Y2ggaXMgYWxsb3dlZCB0byBiZQo+ID4gc3VibWl0dGVkIHRvIHRoZSBwdWJsaWMgbWFp
bGluZyBsaXN0LCBhcyBJIGhhdmUgcmVxdWlyZWQgY29tcGFueQo+ID4gcGVybWlzc2lvbnMgZm9y
IHN1Y2ggYWN0aXZpdHkuIEl0IGlzIG5vdCB0aGF0IHVuY29tbW9uIHRoYXQgYSBnaXZlbgo+ID4g
cGF0Y2ggaGFzIG1vcmUgdGhhbiBvbmUgc2lnbmVkLW9mZiBhbmQgc3RpbGwgdGhlIG1haW4gYXV0
aG9yIGhhcyB0aGUKPiA+IGZpcnN0IHNpZ25lZC1vZmYgdGFnLgo+Cj4gVGhhbmtzIGZvciBleHBs
YW5hdGlvbnMuIElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdXIgU29CIGFwcGVhcnMKPiBi
ZWNhdXNlIHNvbWUgaW50ZXJuYWwgU2Ftc3VuZyBydWxlcy4gVGhhdCBpcyBub3Qgd2hhdCBTb0Ig
aXMgbWVhbnQKPiBmb3I6Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMy1y
Yzgvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w0
MzEKPiBJZiB5b3UgZG8gbm90IGNvbnRyaWJ1dGVkIHRvIHRoZSBwYXRjaCwgZGlkIG5vdCB0b3Vj
aCBpdCAoZS5nLgo+IHJlYmFzaW5nKSBhbmQgeW91IGFyZSBub3Qgc2VuZGluZyBpdCwgdGhlbiB5
b3VyIFNvQiBzaG91bGQgbm90IGJlCj4gdGhlcmUuIEl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgbWFk
bmVzcyB3aXRoIEt5dW5nbWluIFBhcmsgbG9uZyB0aW1lCj4gYWdvOgo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tyemsvbGludXguZ2l0L2NvbW1pdC8/
aD1mb3ItbmV4dCZpZD02YzZjZjY0YjE2NDM4ZWFjNmRhOWE5MDQxMmE4MjMxNmFkMTk2ZTdjCj4g
RXZlcnkgcGF0Y2ggd2FzIG1hcmtlZCB3aXRoIFNvQiBldmVuIHRob3VnaCBoZSB3YXMgbm90IGlu
dm9sdmVkIGF0IGFsbAo+IGluIHRoZSBwcm9jZXNzLgo+Cj4gVGhhdCdzIG5vdCB3aGF0IGtlcm5l
bCdzIFNvQiBpcyBmb3IuCgpBaCwgYW5kIGlmIHlvdSBtZWFudCB0aGF0IE1hY2llaiBkb2VzIG5v
dCBoYXZlIHRoZSBwZXJtaXNzaW9ucyB0byBzZW5kCnRoZSBwYXRjaGVzLCB0aGVuIHlvdXIgU29C
IGFsb25nIHdpdGggcGF0Y2ggZ29pbmcgdGhyb3VnaCB5b3VyIGFjY291bnQKbWFrZXMgc2Vuc2Uu
IE90aGVyd2lzZSwgYWRkaW5nIHlvdXIgU29CIGFuZCBzZW5kaW5nIGJ5IE1hY2llaiwgaXMgYQpq
b2tlIG9mIGNvbXBhbnkgcmVndWxhdGlvbnMuIEl0IG1lYW5zIGFic29sdXRlbHkgbm90aGluZyBh
bmQgdGhlbgpzdHJpcCBpdCBvdXQuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
