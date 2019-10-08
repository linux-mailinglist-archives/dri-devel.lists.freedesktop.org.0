Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D4D01D6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 22:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE706E137;
	Tue,  8 Oct 2019 20:01:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80B96E137
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:01:11 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C638206C0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:01:11 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id w2so48596qkf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 13:01:11 -0700 (PDT)
X-Gm-Message-State: APjAAAUPH6xB4YYi3Zqfp78/x9kC2E8sYSBKgBVnUTzkro/endsAoPdb
 6KoIZ86pJco/AHIgqD6PSX2ulAiLJ9yNM+JjWg==
X-Google-Smtp-Source: APXvYqzM48d5zR+zkCtLlKtkyUNzyrezT7QeMT9990hbYZvI1831lnXsT0GtMlUy9GSCqRc67XwIzIu3jH6XXuZmdCE=
X-Received: by 2002:a05:620a:12d5:: with SMTP id
 e21mr31267756qkl.152.1570564870662; 
 Tue, 08 Oct 2019 13:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
 <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
 <30fcd898-aa50-bac2-b316-0d9bf2429369@ti.com>
 <bc5e4094-2b58-c917-9b9e-0f646c04dd78@ti.com>
 <CAL_JsqL8b0gWPTt3oJ8ScY_AwP+uB__dZP6Eednfa5Fq9vAptw@mail.gmail.com>
 <edadb121-cebd-b8ea-e07d-f5495a581dfd@gmail.com>
In-Reply-To: <edadb121-cebd-b8ea-e07d-f5495a581dfd@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Oct 2019 15:00:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJLp65f6g2OG5uJPrcZ2uuc5cgREaiQ-AXeBp6reqvbkw@mail.gmail.com>
Message-ID: <CAL_JsqJLp65f6g2OG5uJPrcZ2uuc5cgREaiQ-AXeBp6reqvbkw@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570564871;
 bh=MXnhJLTL8ti42i5VuVCIvvysD431dNS8jvytu6e8Lf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r3wGpJ5xQJauzB5omWs2piL66oogJbi9dKwnsf6P7dpJBpkjbxME+CL3Sby1isMxo
 BpBwx+ii+CFuyMGzq10Oep53fWC7hjLld4CN0YwhP6JdH7Z7Jc1ory6inLSqnG+mDA
 0ONxGaQ7yr848NPhVlPjE4y7Mc9JXtwdoXuYbDy0=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgOCwgMjAxOSBhdCAxMjoxNyBQTSBKYWNlayBBbmFzemV3c2tpCjxqYWNlay5h
bmFzemV3c2tpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC84LzE5IDU6MDAgUE0sIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA4OjMwIEFNIEplYW4tSmFj
cXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBSb2IsCj4gPj4K
PiA+PiBPbiAwOC8xMC8yMDE5IDE0OjUxLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+ID4+
PiBIaSBSb2IsCj4gPj4+Cj4gPj4+IE9uIDA3LzEwLzIwMTkgMTg6MTUsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4+Pj4gUGxlYXNlIHNlbmQgRFQgYmluZGluZ3MgdG8gRFQgbGlzdCBvciBpdCdzIG5l
dmVyIGluIG15IHF1ZXVlLiBJT1csCj4gPj4+PiBzZW5kIHBhdGNoZXMgdG8gdGhlIGxpc3RzIHRo
YXQgZ2V0X21haW50YWluZXJzLnBsIHRlbGxzIHlvdSB0by4KPiA+Pj4+Cj4gPj4+PiBPbiBNb24s
IE9jdCA3LCAyMDE5IGF0IDc6NDUgQU0gSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGku
Y29tPgo+ID4+Pj4gd3JvdGU6Cj4gPj4+Pj4gQWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGln
aHQuCj4gPj4+Pj4KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKZWFuLUphY3F1ZXMgSGlibG90IDxq
amhpYmxvdEB0aS5jb20+Cj4gPj4+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsLnRob21wc29uQGxpbmFyby5vcmc+Cj4gPj4+Pj4gUmV2aWV3ZWQtYnk6IFNlYmFzdGlhbiBS
ZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPgo+ID4+Pj4+IC0tLQo+ID4+
Pj4+ICAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgMjgK
PiA+Pj4+PiArKysrKysrKysrKysrKysrKysrCj4gPj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjgg
aW5zZXJ0aW9ucygrKQo+ID4+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPj4+Pj4gRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQu
dHh0Cj4gPj4+PiBQbGVhc2UgbWFrZSB0aGlzIGEgRFQgc2NoZW1hLgo+ID4+Pgo+ID4+PiBPSy4K
PiA+Pj4KPiA+Pj4gQlRXIEkgdXNlZCAibWFrZSBkdF9iaW5kaW5nX2NoZWNrIiBidXQgaGFkIHRv
IGZpeCBhIGNvdXBsZSBvZiBZQU1Mcwo+ID4+PiBmaWxlIHRvIGdldCBpdCB0byB3b3JrLiBEbyB5
b3UgaGF2ZSBhIGtlcm5lbCB0cmVlIHdpdGggYWxyZWFkeSBhbGwgdGhlCj4gPj4+IFlBTUwgZmls
ZXMgaW4gZ29vZCBzaGFwZSA/IE9yIGRvIHlvdSB3YW50IG1lIHRvIHBvc3QgdGhlIGNoYW5nZXMg
dG8KPiA+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcgPwo+ID4+Pgo+ID4+Pgo+ID4+Pj4K
PiA+Pj4+PiBkaWZmIC0tZ2l0Cj4gPj4+Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKPiA+Pj4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4
dAo+ID4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAw
Li40YzdkZmJlN2Y2N2EKPiA+Pj4+PiAtLS0gL2Rldi9udWxsCj4gPj4+Pj4gKysrCj4gPj4+Pj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJh
Y2tsaWdodC50eHQKPiA+Pj4+PiBAQCAtMCwwICsxLDI4IEBACj4gPj4+Pj4gK2xlZC1iYWNrbGln
aHQgYmluZGluZ3MKPiA+Pj4+PiArCj4gPj4+Pj4gK1RoaXMgYmluZGluZyBpcyB1c2VkIHRvIGRl
c2NyaWJlIGEgYmFzaWMgYmFja2xpZ2h0IGRldmljZSBtYWRlIG9mCj4gPj4+Pj4gTEVEcy4KPiA+
Pj4+PiArSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZpY2Ug
Y29udHJvbGxlZCBieQo+ID4+Pj4+IHRoZSBvdXRwdXQgb2YKPiA+Pj4+PiArYSBMRUQgZHJpdmVy
Lgo+ID4+Pj4+ICsKPiA+Pj4+PiArUmVxdWlyZWQgcHJvcGVydGllczoKPiA+Pj4+PiArICAtIGNv
bXBhdGlibGU6ICJsZWQtYmFja2xpZ2h0Igo+ID4+Pj4+ICsgIC0gbGVkczogYSBsaXN0IG9mIExF
RHMKPiA+Pj4+ICdsZWRzJyBpcyBhbHJlYWR5IHVzZWQgYXMgYSBub2RlIG5hbWUgYW5kIG1peGlu
ZyBpcyBub3QgaWRlYWwuCj4KPiBmb3IgdGhlIHJlY29yZDogY2hpbGQgbm9kZSBuYW1lcyAoaWYg
dGhhdCB3YXMgd2hhdCB5b3UgaGFkIG9uIG1pbmQpCj4gaGF2ZSBzaW5ndWxhciBmb3JtICdsZWQn
LgoKSSBkaWQgYWN0dWFsbHkgZ3JlcCB0aGlzIGFuZCBub3QgcmVseSBvbiBteSBzb21ld2hhdCBm
YXVsdHkgbWVtb3J5OgoKJCBnaXQgZ3JlcCAnXHNsZWRzIHsnIHwgd2MgLWwKNDYzCgpUaGVzZSBh
cmUgbW9zdGx5IGdwaW8tbGVkcyBJIHRoaW5rLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
