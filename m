Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C4627BDC6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FD86E463;
	Tue, 29 Sep 2020 07:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8FD89CFA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 06:35:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y11so4171799lfl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+v6NFNkpNv4QFfcDFX8DIUEdE4c/tx9CiOwb1iqWN8s=;
 b=LArxUVHh0fN7BaYMIeqQtxL60B6Hn0pyGZk6bPFsEdPyEpKQ2GzoOoyN+ZpvUQw5Ud
 iYroF9Zwhnhx4rkRfL2VenuryVNspDptQCDUOf+9+DnY/0UNxKKUI5KYxt3L9bEmyHND
 CkRbdjRIJyVaDc1gi606MC4Y+Yx80g+RdZ9rJalrNCVu8/GP515IeIqJaBTtGhA1R7O5
 XFZvq5ZlPR4pgWwPaaAvokpuKoiOOMNRtE+W7TQ1UoCjILJeNvuI/35e+VB6/tSZSdAo
 yJhFLn1/6K+/JrBBM1qWUfxrL7ttTqBNNp08uRDH6Bkllitx+NjcaspMg65YSWPJvPna
 G4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+v6NFNkpNv4QFfcDFX8DIUEdE4c/tx9CiOwb1iqWN8s=;
 b=OVrSbBiaUlYDdr1Cf+lYpUwj+YZMCYCd/Ph5rVwrL1NdRJLUYEXyOMpO+CPBJREZAW
 4ettrsRFdOjiKgMfYN4BLKulKUvqVCcMnfeDPc+eSj0DSzCJ/wF6Mzro7Z5yPTK+jExV
 gfqcVZLpjyUsGnJ43EZh6fNe4LZ3Uw+3UGGKB8+R6yo3IwZrvu+BXAQEHl+XP+6L73tY
 jrB1LRlnFRVEPoH5qq/LisoQ/ddsLkBRxnh4gnA8SVirFky0P2d99LmYqdHQqgg2qBOQ
 E3qEo6P/WFHB6NzDvtkbGF7OX8KPJ8uLn1SbhHVkRoXByD2zHUcPv4ToIUeApr4yz7tE
 PYgw==
X-Gm-Message-State: AOAM531dO9/ybLbBP3tIvWI2aDGqM9Icv+vWJUXfZAsVhkcf8drVb6Qc
 5jpVEsZ7ZKiC+QQ1J6nttGH96qrA1jJf80SGbpA=
X-Google-Smtp-Source: ABdhPJwDZX67W2Jnc3QulXwMmecGTBztlpEn8xr1t/O2/Kg32kOG8ZxZPTjRCZ6EjqWRMWP9MM8oHYjJPSSXTIJ0dCI=
X-Received: by 2002:a19:992:: with SMTP id 140mr594077lfj.273.1601361332605;
 Mon, 28 Sep 2020 23:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
 <1601274460-7866-2-git-send-email-kevin3.tang@gmail.com>
 <20200928081726.hkh3rzbfr6m7jszt@gilmour.lan>
 <CAL_JsqLUT9gBiVgSdcHM86vNLR_1MxEZ+x9MDBaFGdv2j9EtvA@mail.gmail.com>
In-Reply-To: <CAL_JsqLUT9gBiVgSdcHM86vNLR_1MxEZ+x9MDBaFGdv2j9EtvA@mail.gmail.com>
From: Kevin Tang <kevin3.tang@gmail.com>
Date: Tue, 29 Sep 2020 14:35:21 +0800
Message-ID: <CAFPSGXYbdeZuVKQWnU6kiPzn3zgm224O2uDkr-uuLBUUjufGsA@mail.gmail.com>
Subject: Re: [PATCH RFC v7 1/6] dt-bindings: display: add Unisoc's drm master
 bindings
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 Lyra Zhang <zhang.lyra@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Maxime Ripard <maxime@cerno.tech>,
 Orson Zhai <orsonzhai@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLApDb21wb25lbnQgZnJhbWV3b3JrIGluY2x1ZGUgbWFzdGVyIGFuZCBjb21wb25lbnQs
IGhlcmUgaXMgbWFzdGVyIHN1Ym5vZGUuCkl0IHNlZW1zIHRoYXQgZXZlcnlvbmUgZWxzZSBkb2Vz
IGl0LCB3aHkgbm90IG1lPwoKWW91ciBjb21tZW50cyBvbiB2NjoKIldlIGdlbmVyYWxseSB0cnkg
dG8gYXZvaWQgdGhpcyB2aXJ0dWFsIG5vZGUgYXMgaXQgZG9lc24ndCByZXByZXNlbnQKYW55IGgv
dy4gQ2FuJ3QgeW91IGJpbmQgdGhlIGRyaXZlciB0byB0aGUgRFBVIGRpcmVjdGx5PyIKCkknbSBz
b3JyeSwgbWF5YmUgaXMgbXkgY2FyZWxlc3MsIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkg
YW5kIGhvdyB0byBkbyBpdAoKUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4g5LqOMjAy
MOW5tDnmnIgyOeaXpeWRqOS6jCDkuIrljYgxMjoyOOWGmemBk++8mgoKPgo+IE9uIE1vbiwgU2Vw
IDI4LCAyMDIwIGF0IDM6MTcgQU0gTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+IHdy
b3RlOgo+ID4KPiA+IEhpIQo+ID4KPiA+IE9uIE1vbiwgU2VwIDI4LCAyMDIwIGF0IDAyOjI3OjM1
UE0gKzA4MDAsIEtldmluIFRhbmcgd3JvdGU6Cj4gPiA+IEZyb206IEtldmluIFRhbmcgPGtldmlu
LnRhbmdAdW5pc29jLmNvbT4KPiA+ID4KPiA+ID4gVGhlIFVuaXNvYyBEUk0gbWFzdGVyIGRldmlj
ZSBpcyBhIHZpcnR1YWwgZGV2aWNlIG5lZWRlZCB0byBsaXN0IGFsbAo+ID4gPiBEUFUgZGV2aWNl
cyBvciBvdGhlciBkaXNwbGF5IGludGVyZmFjZSBub2RlcyB0aGF0IGNvbXByaXNlIHRoZQo+ID4g
PiBncmFwaGljcyBzdWJzeXN0ZW0KPiA+ID4KPiA+ID4gUkZDIHY3Ogo+ID4gPiAgIC0gRml4IERU
QyB1bml0IG5hbWUgd2FybmluZ3MKPiA+ID4gICAtIEZpeCB0aGUgcHJvYmxlbSBvZiBtYWludGFp
bmVycwo+ID4gPgo+ID4gPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNvbT4KPiA+
ID4gQ2M6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21haWwuY29tPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+Cj4gPiA+IC0tLQo+ID4g
PiAgLi4uL2Rpc3BsYXkvc3ByZC9zcHJkLGRpc3BsYXktc3Vic3lzdGVtLnlhbWwgICAgICAgfCAz
OSArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1sCj4gPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9zcHJkL3NwcmQsZGlzcGxheS1zdWJzeXN0ZW0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3NwcmQvc3ByZCxkaXNwbGF5LXN1YnN5c3RlbS55YW1s
Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAwMDAwMDAuLjk0ODdhMzkK
PiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9zcHJkL3NwcmQsZGlzcGxheS1zdWJzeXN0ZW0ueWFtbAo+ID4gPiBA
QCAtMCwwICsxLDM5IEBACj4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gKyVZQU1MIDEuMgo+ID4gPiArLS0tCj4gPiA+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvc3ByZC9zcHJkLGRp
c3BsYXktc3Vic3lzdGVtLnlhbWwjCj4gPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ID4gKwo+ID4gPiArdGl0bGU6IFVuaXNvYyBE
Uk0gbWFzdGVyIGRldmljZQo+ID4gPiArCj4gPiA+ICttYWludGFpbmVyczoKPiA+ID4gKyAgLSBL
ZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+Cj4gPiA+ICsKPiA+ID4gK2Rlc2NyaXB0
aW9uOiB8Cj4gPiA+ICsgIFRoZSBVbmlzb2MgRFJNIG1hc3RlciBkZXZpY2UgaXMgYSB2aXJ0dWFs
IGRldmljZSBuZWVkZWQgdG8gbGlzdCBhbGwKPiA+ID4gKyAgRFBVIGRldmljZXMgb3Igb3RoZXIg
ZGlzcGxheSBpbnRlcmZhY2Ugbm9kZXMgdGhhdCBjb21wcmlzZSB0aGUKPiA+ID4gKyAgZ3JhcGhp
Y3Mgc3Vic3lzdGVtLgo+ID4gPiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICBjb21wYXRp
YmxlOgo+ID4gPiArICAgIGNvbnN0OiBzcHJkLGRpc3BsYXktc3Vic3lzdGVtCj4gPiA+ICsKPiA+
ID4gKyAgcG9ydHM6Cj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvcGhhbmRsZS1hcnJheQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gPiArICAgICAg
U2hvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIHBoYW5kbGVzIHBvaW50aW5nIHRvIGRpc3BsYXkgaW50
ZXJmYWNlIHBvcnQKPiA+ID4gKyAgICAgIG9mIERQVSBkZXZpY2VzLgo+ID4KPiA+IEdlbmVyYWxs
eSBzcGVha2luZywgZHJpdmVyLXNwZWNpZmljIHByb3BlcnRpZXMgc2hvdWxkIGJlIHByZWZpeGVk
IGJ5IHRoZQo+ID4gdmVuZG9yIG5hbWUgdG8gYXZvaWQgYW55IGNvbmZsaWN0IHdpdGggZ2VuZXJp
YyBwcm9wZXJ0aWVzIChsaWtlIHRoZQo+ID4gT0YtR3JhcGggcG9ydHMgc3Vibm9kZSBpbiB0aGlz
IGNhc2UpCj4KPiBXZSB0cnkgdG8gYXZvaWQgdGhpcyB2aXJ0dWFsIG5vZGUgYWx0b2dldGhlciB3
aGljaCBJIGNvbW1lbnRlZCBhYm91dAo+IG9uIHY2IHdoaWNoIHdhcyBpZ25vcmVkLgo+Cj4gUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
