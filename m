Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F072CFCD4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 16:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5EB6E81A;
	Tue,  8 Oct 2019 14:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1086E81B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:53:08 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1D33218DE
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 14:53:07 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id u184so17026419qkd.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 07:53:07 -0700 (PDT)
X-Gm-Message-State: APjAAAVn8vhgMsgIUq6kzce7d+6tJ9VQSyszlINlv8QChyVqRRwqxXB1
 rSXtctsx/NXiTlop7O+P3IO9zWvwaTvP8vpZsg==
X-Google-Smtp-Source: APXvYqwcuwLAT/clJ+O/meI0n2cyKwQwDkoVsvf05zAfDMSzMau5X1IcXnFIoiry9nOSZIPabNLne3OOyzFtDOAFCJA=
X-Received: by 2002:a37:be87:: with SMTP id
 o129mr30275734qkf.254.1570546386900; 
 Tue, 08 Oct 2019 07:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
In-Reply-To: <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 09:52:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLzi3y8hBvx9Qpx7QKPGAzq_LyuEDdi35f9k8nEfj5wCw@mail.gmail.com>
Message-ID: <CAL_JsqLzi3y8hBvx9Qpx7QKPGAzq_LyuEDdi35f9k8nEfj5wCw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570546388;
 bh=43D7mJTidNziffTuZdsS4fBLNRTISxe76SYbSUFqmEA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MWpABNzw8267oYfqktmZ/QxiCNpAUqaZ71le++hcszfl/5016mCY9scCqYd9zFIQm
 1Ccb3OHaHXXYJFbTCSrTCw93gMonQCJaffLpTKZiobEd3RLcNS2/wtJXFX9p7hOpep
 EEmMEgiC07K4KV8l+ybzz2SEyDdGruT38MghePrU=
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA3OjUxIEFNIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGli
bG90QHRpLmNvbT4gd3JvdGU6Cj4KPiBIaSBSb2IsCj4KPiBPbiAwNy8xMC8yMDE5IDE4OjE1LCBS
b2IgSGVycmluZyB3cm90ZToKPiA+IFBsZWFzZSBzZW5kIERUIGJpbmRpbmdzIHRvIERUIGxpc3Qg
b3IgaXQncyBuZXZlciBpbiBteSBxdWV1ZS4gSU9XLAo+ID4gc2VuZCBwYXRjaGVzIHRvIHRoZSBs
aXN0cyB0aGF0IGdldF9tYWludGFpbmVycy5wbCB0ZWxscyB5b3UgdG8uCj4gPgo+ID4gT24gTW9u
LCBPY3QgNywgMjAxOSBhdCA3OjQ1IEFNIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGlibG90QHRp
LmNvbT4gd3JvdGU6Cj4gPj4gQWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCj4gPj4K
PiA+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxqamhpYmxvdEB0aS5jb20+
Cj4gPj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFy
by5vcmc+Cj4gPj4gUmV2aWV3ZWQtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVp
Y2hlbEBjb2xsYWJvcmEuY29tPgo+ID4+IC0tLQo+ID4+ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjggKysrKysrKysrKysrKysrKysrKwo+ID4+ICAg
MSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJh
Y2tsaWdodC50eHQKPiA+IFBsZWFzZSBtYWtlIHRoaXMgYSBEVCBzY2hlbWEuCj4KPiBPSy4KPgo+
IEJUVyBJIHVzZWQgIm1ha2UgZHRfYmluZGluZ19jaGVjayIgYnV0IGhhZCB0byBmaXggYSBjb3Vw
bGUgb2YgWUFNTHMgZmlsZQo+IHRvIGdldCBpdCB0byB3b3JrLiBEbyB5b3UgaGF2ZSBhIGtlcm5l
bCB0cmVlIHdpdGggYWxyZWFkeSBhbGwgdGhlIFlBTUwKPiBmaWxlcyBpbiBnb29kIHNoYXBlID8g
T3IgZG8geW91IHdhbnQgbWUgdG8gcG9zdCB0aGUgY2hhbmdlcyB0bwo+IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnID8KCmxpbnV4LW5leHQgaXMgZml4ZWQgbm93LgoKPiA+PiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1i
YWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4gPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+PiBp
bmRleCAwMDAwMDAwMDAwMDAuLjRjN2RmYmU3ZjY3YQo+ID4+IC0tLSAvZGV2L251bGwKPiA+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVk
LWJhY2tsaWdodC50eHQKPiA+PiBAQCAtMCwwICsxLDI4IEBACj4gPj4gK2xlZC1iYWNrbGlnaHQg
YmluZGluZ3MKPiA+PiArCj4gPj4gK1RoaXMgYmluZGluZyBpcyB1c2VkIHRvIGRlc2NyaWJlIGEg
YmFzaWMgYmFja2xpZ2h0IGRldmljZSBtYWRlIG9mIExFRHMuCj4gPj4gK0l0IGNhbiBhbHNvIGJl
IHVzZWQgdG8gZGVzY3JpYmUgYSBiYWNrbGlnaHQgZGV2aWNlIGNvbnRyb2xsZWQgYnkgdGhlIG91
dHB1dCBvZgo+ID4+ICthIExFRCBkcml2ZXIuCj4gPj4gKwo+ID4+ICtSZXF1aXJlZCBwcm9wZXJ0
aWVzOgo+ID4+ICsgIC0gY29tcGF0aWJsZTogImxlZC1iYWNrbGlnaHQiCj4gPj4gKyAgLSBsZWRz
OiBhIGxpc3Qgb2YgTEVEcwo+ID4gJ2xlZHMnIGlzIGFscmVhZHkgdXNlZCBhcyBhIG5vZGUgbmFt
ZSBhbmQgbWl4aW5nIGlzIG5vdCBpZGVhbC4KPiA+Cj4gPiBXZSBhbHJlYWR5IGhhdmUgJ2ZsYXNo
LWxlZHMnIGluIHVzZSBhbmQgd2l0aCB0aGUgc2FtZSBkZWZpbml0aW9uLCBzbwo+ID4gbGV0cyBj
b250aW51ZSB0aGF0IGFuZCB1c2UgJ2JhY2tsaWdodC1sZWRzJy4KPiBPSwo+ID4KPiA+PiArCj4g
Pj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gPj4gKyAgLSBicmlnaHRuZXNzLWxldmVsczogQXJy
YXkgb2YgZGlzdGluY3QgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZSBsZXZlbHMgbXVzdCBiZQo+ID4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGluIHRoZSByYW5nZSBhY2NlcHRlZCBieSB0aGUgdW5k
ZXJseWluZyBMRUQgZGV2aWNlcy4KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBUaGlzIGlz
IHVzZWQgdG8gdHJhbnNsYXRlIGEgYmFja2xpZ2h0IGJyaWdodG5lc3MgbGV2ZWwKPiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0IGlz
IG5vdCBwcm92aWRlZCwgdGhlCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWRlbnRpdHkg
bWFwcGluZyBpcyB1c2VkLgo+ID4+ICsKPiA+PiArICAtIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZl
bDogVGhlIGRlZmF1bHQgYnJpZ2h0bmVzcyBsZXZlbC4KPiA+IFlvdSBjYW4ganVzdCBhc3N1bWUg
dGhlc2UgMiBnZXQgYSBjb21tb24gc2NoZW1hIGF0IHNvbWUgcG9pbnQuIFNvIGp1c3QKPiA+IG5l
ZWQgdG8gZGVmaW5lIGFueSBhZGRpdGlvbmFsIGNvbnN0cmFpbnRzIGlmIHBvc3NpYmxlLgo+Cj4g
TWF5YmUgd2Ugc2hvdWxkIGtlZXAgdGhlbSB1bnRpbCBzdWNoIGEgY29tbW9uIHNjaGVtYSBpcyB3
cml0dGVuID8KCkknbSBub3Qgc2F5aW5nIHRvIHJlbW92ZSB0aGVtLCBidXQgeW91IGNhbiBqdXN0
IGhhdmUgYSBkZXNjcmlwdGlvbiBpZgp0aGVyZSBhcmUgbm8gb3RoZXIgY29uc3RyYWludHMuCgpS
b2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
