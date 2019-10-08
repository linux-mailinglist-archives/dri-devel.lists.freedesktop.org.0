Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAF0CFD02
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104826E820;
	Tue,  8 Oct 2019 15:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251696E820
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:00:54 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD3E121835
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 15:00:53 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id r5so25811169qtd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 08:00:53 -0700 (PDT)
X-Gm-Message-State: APjAAAXZ2rHml25TL7JGcndcxzga0IQgIiAidQqOAgLrOt9JsSkjnXQW
 5jEFi+gHMa9dC0/OrcXGCkwsWuSNFmtVBpykZg==
X-Google-Smtp-Source: APXvYqxP6OYtmivflGW5PuW6N5u1AFSfWfw65nZu7DiCXNvZAX3yzN9B4FocPVaxRPLAuQbbqjyQg6ezZktfviQ4t/8=
X-Received: by 2002:a0c:9792:: with SMTP id l18mr32776173qvd.79.1570546852893; 
 Tue, 08 Oct 2019 08:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
 <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
In-Reply-To: <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 10:00:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
Message-ID: <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570546854;
 bh=2ILkLKJMhVewO7YXPjwi7ITxE09NkLitzKFS8RD6cF4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tgsldvaDL9BYjWvesGpBQdKUHkXWUfUNX+B0iMBaUqel0roQOkSEgNAZhwOqEiPSa
 E8rOkfJShI3VACodadJjlGAY8fTsEoUcmpYyc7WynBzEu5Z/9M9ttZxu9M4zD1+IjN
 5LL5pYehh5+K356nhgf1xEvSRLHAdpRoPkkgvwEw=
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

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCA4OjMwIEFNIEplYW4tSmFjcXVlcyBIaWJsb3QgPGpqaGli
bG90QHRpLmNvbT4gd3JvdGU6Cj4KPiBSb2IsCj4KPiBPbiAwOC8xMC8yMDE5IDE0OjUxLCBKZWFu
LUphY3F1ZXMgSGlibG90IHdyb3RlOgo+ID4gSGkgUm9iLAo+ID4KPiA+IE9uIDA3LzEwLzIwMTkg
MTg6MTUsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4+IFBsZWFzZSBzZW5kIERUIGJpbmRpbmdzIHRv
IERUIGxpc3Qgb3IgaXQncyBuZXZlciBpbiBteSBxdWV1ZS4gSU9XLAo+ID4+IHNlbmQgcGF0Y2hl
cyB0byB0aGUgbGlzdHMgdGhhdCBnZXRfbWFpbnRhaW5lcnMucGwgdGVsbHMgeW91IHRvLgo+ID4+
Cj4gPj4gT24gTW9uLCBPY3QgNywgMjAxOSBhdCA3OjQ1IEFNIEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPiA+PiB3cm90ZToKPiA+Pj4gQWRkIERUIGJpbmRpbmcgZm9yIGxl
ZC1iYWNrbGlnaHQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJs
b3QgPGpqaGlibG90QHRpLmNvbT4KPiA+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8
ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPj4+IFJldmlld2VkLWJ5OiBTZWJhc3RpYW4g
UmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPiA+Pj4gLS0tCj4gPj4+
ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjgKPiA+
Pj4gKysrKysrKysrKysrKysrKysrKwo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRp
b25zKCspCj4gPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPj4+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dAo+ID4+IFBs
ZWFzZSBtYWtlIHRoaXMgYSBEVCBzY2hlbWEuCj4gPgo+ID4gT0suCj4gPgo+ID4gQlRXIEkgdXNl
ZCAibWFrZSBkdF9iaW5kaW5nX2NoZWNrIiBidXQgaGFkIHRvIGZpeCBhIGNvdXBsZSBvZiBZQU1M
cwo+ID4gZmlsZSB0byBnZXQgaXQgdG8gd29yay4gRG8geW91IGhhdmUgYSBrZXJuZWwgdHJlZSB3
aXRoIGFscmVhZHkgYWxsIHRoZQo+ID4gWUFNTCBmaWxlcyBpbiBnb29kIHNoYXBlID8gT3IgZG8g
eW91IHdhbnQgbWUgdG8gcG9zdCB0aGUgY2hhbmdlcyB0bwo+ID4gZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcgPwo+ID4KPiA+Cj4gPj4KPiA+Pj4gZGlmZiAtLWdpdAo+ID4+PiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4
dAo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9sZWQtYmFja2xpZ2h0LnR4dAo+ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjRjN2RmYmU3ZjY3YQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsr
Kwo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9sZWQtYmFja2xpZ2h0LnR4dAo+ID4+PiBAQCAtMCwwICsxLDI4IEBACj4gPj4+ICtsZWQtYmFj
a2xpZ2h0IGJpbmRpbmdzCj4gPj4+ICsKPiA+Pj4gK1RoaXMgYmluZGluZyBpcyB1c2VkIHRvIGRl
c2NyaWJlIGEgYmFzaWMgYmFja2xpZ2h0IGRldmljZSBtYWRlIG9mCj4gPj4+IExFRHMuCj4gPj4+
ICtJdCBjYW4gYWxzbyBiZSB1c2VkIHRvIGRlc2NyaWJlIGEgYmFja2xpZ2h0IGRldmljZSBjb250
cm9sbGVkIGJ5Cj4gPj4+IHRoZSBvdXRwdXQgb2YKPiA+Pj4gK2EgTEVEIGRyaXZlci4KPiA+Pj4g
Kwo+ID4+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+Pj4gKyAgLSBjb21wYXRpYmxlOiAibGVk
LWJhY2tsaWdodCIKPiA+Pj4gKyAgLSBsZWRzOiBhIGxpc3Qgb2YgTEVEcwo+ID4+ICdsZWRzJyBp
cyBhbHJlYWR5IHVzZWQgYXMgYSBub2RlIG5hbWUgYW5kIG1peGluZyBpcyBub3QgaWRlYWwuCj4g
Pj4KPiA+PiBXZSBhbHJlYWR5IGhhdmUgJ2ZsYXNoLWxlZHMnIGluIHVzZSBhbmQgd2l0aCB0aGUg
c2FtZSBkZWZpbml0aW9uLCBzbwo+ID4+IGxldHMgY29udGludWUgdGhhdCBhbmQgdXNlICdiYWNr
bGlnaHQtbGVkcycuCj4gPiBPSwo+Cj4gSSBhbSB0YWtpbmcgdGhhdCBiYWNrLiBJIGhhdmUgYWRk
ZWQgb2ZfZ2V0X2xlZCgpIGFuZCBkZXZtX29mX2dldF9sZWQoKQo+IHRvIHRoZSBMRUQgY29yZSB0
byBtYWtlIGl0IGVhc2llciB0byBnZXQgYSBMRUQgZnJvbSB0aGUgRFQuIEkgbW9kZWxlZAo+IHRo
ZSBpbnRlcmZhY2UgbGlrZSBpdCBpcyBkb25lIGZvciBQV00sIFBIWXMgb3IgY2xvY2tzLiBUaGUg
cHJvcGVydHkKPiBjb250YWluaW5nIGxpc3QvYXJyYXkgb2YgcGhhbmRsZSAgaXMgYWx3YXlzIG5h
bWVkIHRoZSBzYW1lLiBUbyBnZXQgb25lCj4gcGFydGljdWxhciBQV00vUEhZL2Nsb2NrLCBhIGlk
ZW50aWZpZXIgKG5hbWUgb3IgaW50ZWdlcikgbXVzdCBiZSBwcm92aWRlZC4KCkl0IGNhbiBiZSBk
b25lIGFzIHdlIGRvIHN1cHBvcnQgdGhhdCB3aXRoICctZ3Bpb3MnLCBidXQgeWVzLCBpdCBpcyBh
CmJpdCBtb3JlIHBhaW5mdWwgdG8gZGVhbCB3aXRoLgoKPiBTbyB1bmxlc3MgdGhlcmUgaXMgYSBz
dHJvbmcgaW5jZW50aXZlIHRvIGRvIG90aGVyd2lzZSBJJ3MgcmF0aGVyIGtlZXAKPiB0aGlzIG5h
bWUgaGVyZS4KCkluIHRoYXQgY2FzZSwgdGhpcyBuZWVkcyB0byBiZSBkb2N1bWVudGVkIGFzIGEg
Y29tbW9uIExFRCBiaW5kaW5nLCBub3QKc29tZXRoaW5nIGhpZGRlbiBhd2F5IGluIHRoaXMgYmlu
ZGluZy4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
