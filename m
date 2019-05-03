Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655E912D04
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 13:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8689D9B;
	Fri,  3 May 2019 11:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111989D9B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 11:59:05 +0000 (UTC)
Received: by mail-it1-x142.google.com with SMTP id q19so8589370itk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 04:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDgYOPNAs5a7jn6rrh+mqlUAcW/QL6gqLTt3pqvnNY8=;
 b=FRcQxTdYBDbBhElLFjBeehs/sbhvRlzknMPxQbWjG3mlNNdqQXkwDt9+Xcqh7p6VKH
 tlOsUwbCn0oFYwJvwg51P245MB7jm07S1oexp2pOL5HOMB/iBB4S3W/0Fdz7k+9mzrQR
 2arbSK5ErvkoilI+/OiUuN4DJHA23285UpDyNXx39vyxRtRqlX/OprnxpMUVmg6hFxXv
 Hf1IFTVnKWY5DRWqiTPvVab8wYa4Gk09jPmYHWFFPfdltBUhoepS46XwcAftFMc66HaX
 g1t59hYqOZP7L+d1Co8Ml7f1p0TvZ3ddZdja9uEnE8G//H+Wz8y3FJPM+cHIsifMd+NQ
 l0ZA==
X-Gm-Message-State: APjAAAWQ5QJrVQELGIiApi3n2XaHd+/MvOx9QiwK3j+EdsbU09SNSz1f
 oySKhbdfY8YeDQYGE21WtrpIzIdEOkH0BTY+J8RGZQ==
X-Google-Smtp-Source: APXvYqxogbylovsed3LC9Wji6QY3Bj1N0GsCs2SPDNY1RvVGOuqXHQj+rfQkbvVmWscSed3alM3kokBhRmxHN3Y8JlY=
X-Received: by 2002:a24:70d5:: with SMTP id f204mr6307014itc.32.1556884744596; 
 Fri, 03 May 2019 04:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-6-megous@megous.com>
In-Reply-To: <20190413165418.27880-6-megous@megous.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 3 May 2019 17:28:53 +0530
Message-ID: <CAMty3ZDx6NXyYhQehYT9geeGwAk2PZidiVMwVw1nnZJa3zwyOg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 5/9] arm64: dts: allwinner: orange-pi-3:
 Enable ethernet
To: megous@megous.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vDgYOPNAs5a7jn6rrh+mqlUAcW/QL6gqLTt3pqvnNY8=;
 b=Y6srGshKU+8ofVAzr5oXPRlANIBEkdOrCHKBPiE3tUswNgNowbNADcWMckRUE5gkSL
 9ukukehth9mBJJ/QJCpdkUMMW2+iAg10JbBAKpi7BjWy2OQ+HfalsNh4xdNDSsHWnKVY
 6bANvGQZzE11Hw3Y7RiWx/Sk3RaGiUf3o+mJs=
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBcHIgMTMsIDIwMTkgYXQgMTA6MjQgUE0gbWVnb3VzIHZpYSBsaW51eC1zdW54aQo8
bGludXgtc3VueGlAZ29vZ2xlZ3JvdXBzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPbmRyZWogSmly
bWFuIDxtZWdvdXNAbWVnb3VzLmNvbT4KPgo+IE9yYW5nZSBQaSAzIGhhcyB0d28gcmVndWxhdG9y
cyB0aGF0IHBvd2VyIHRoZSBSZWFsdGVrIFJUTDgyMTFFLiBBY2NvcmRpbmcKPiB0byB0aGUgcGh5
IGRhdGFzaGVldCwgYm90aCByZWd1bGF0b3JzIG5lZWQgdG8gYmUgZW5hYmxlZCBhdCB0aGUgc2Ft
ZSB0aW1lLAo+IGJ1dCB3ZSBjYW4gb25seSBzcGVjaWZ5IGEgc2luZ2xlIHBoeS1zdXBwbHkgaW4g
dGhlIERULgo+Cj4gVGhpcyBjYW4gYmUgYWNoaWV2ZWQgYnkgbWFraW5nIG9uZSByZWd1bGF0b3Ig
ZGVwZWRuaW5nIG9uIHRoZSBvdGhlciB2aWEKPiB2aW4tc3VwcGx5LiBXaGlsZSBpdCdzIG5vdCBh
IHRlY2huaWNhbGx5IGNvcnJlY3QgZGVzY3JpcHRpb24gb2YgdGhlCj4gaGFyZHdhcmUsIGl0IGFj
aGlldmVzIHRoZSBwdXJwb3NlLgo+Cj4gQWxsIHZhbHVlcyBvZiBSWC9UWCBkZWxheSB3ZXJlIHRl
c3RlZCBleGhhdXN0aXZlbHkgYW5kIGEgbWlkZGxlIG9uZSBvZiB0aGUKPiB3b3JraW5nIHZhbHVl
cyB3YXMgY2hvc2VuLgo+Cj4gU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1l
Z291cy5jb20+Cj4gLS0tCj4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1vcmFuZ2VwaS0z
LmR0cyAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGlu
c2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW41MGktaDYtb3JhbmdlcGktMy5kdHMKPiBpbmRleCAxN2Q0OTY5OTAxMDguLjZkNmIxZjY2
Nzk2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGkt
aDYtb3JhbmdlcGktMy5kdHMKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9z
dW41MGktaDYtb3JhbmdlcGktMy5kdHMKPiBAQCAtMTUsNiArMTUsNyBAQAo+Cj4gICAgICAgICBh
bGlhc2VzIHsKPiAgICAgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0MDsKPiArICAgICAgICAg
ICAgICAgZXRoZXJuZXQwID0gJmVtYWM7Cj4gICAgICAgICB9Owo+Cj4gICAgICAgICBjaG9zZW4g
ewo+IEBAIC00NCw2ICs0NSwyNyBAQAo+ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDw1MDAwMDAwPjsKPiAgICAgICAgICAgICAgICAgcmVndWxhdG9yLWFsd2F5cy1v
bjsKPiAgICAgICAgIH07Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFRoZSBib2FyZCB1
c2VzIDIuNVYgUkdNSUkgc2lnbmFsbGluZy4gUG93ZXIgc2VxdWVuY2UgdG8gZW5hYmxlCj4gKyAg
ICAgICAgKiB0aGUgcGh5IGlzIHRvIGVuYWJsZSBHTUFDLTJWNSBhbmQgR01BQy0zVjMgKGFsZG8y
KSBwb3dlciByYWlscwo+ICsgICAgICAgICogYXQgdGhlIHNhbWUgdGltZSBhbmQgdG8gd2FpdCAx
MDBtcy4KPiArICAgICAgICAqLwo+ICsgICAgICAgcmVnX2dtYWNfMnY1OiBnbWFjLTJ2NSB7Cj4g
KyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiArICAgICAg
ICAgICAgICAgcmVndWxhdG9yLW5hbWUgPSAiZ21hYy0ydjUiOwo+ICsgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDwyNTAwMDAwPjsKPiArICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MjUwMDAwMD47Cj4gKyAgICAgICAgICAgICAgIHN0YXJ0
dXAtZGVsYXktdXMgPSA8MTAwMDAwPjsKPiArICAgICAgICAgICAgICAgZW5hYmxlLWFjdGl2ZS1o
aWdoOwo+ICsgICAgICAgICAgICAgICBncGlvID0gPCZwaW8gMyA2IEdQSU9fQUNUSVZFX0hJR0g+
OyAvKiBQRDYgKi8KPiArCj4gKyAgICAgICAgICAgICAgIC8qIFRoZSByZWFsIHBhcmVudCBvZiBn
bWFjLTJ2NSBpcyByZWdfdmNjNXYsIGJ1dCB3ZSBuZWVkIHRvCj4gKyAgICAgICAgICAgICAgICAq
IGVuYWJsZSB0d28gcmVndWxhdG9ycyB0byBwb3dlciB0aGUgcGh5LiBUaGlzIGlzIG9uZSB3YXkK
PiArICAgICAgICAgICAgICAgICogdG8gYWNoaWV2ZSB0aGF0Lgo+ICsgICAgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAgICAgICAgdmluLXN1cHBseSA9IDwmcmVnX2FsZG8yPjsgLyogR01BQy0z
VjMgKi8KClRoZSBhY3R1YWwgb3V0cHV0IHN1cHBseSBwaW4gbmFtZSBpcyBHTUFDLTNWIHdoaWNo
IGhhcyBhbiBpbnB1dCBvZgpWQ0MzVjMtTUFDIChpZSBhbGRvMiksIGlmIHdlIGNvbXBhdGlibGUg
dG8gc2NoZW1hdGljcyBiZXR0ZXIgdG8gdXNlCnRoZSBzYW1lLCBJTUhPLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
