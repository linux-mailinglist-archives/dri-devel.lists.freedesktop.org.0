Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C48CE8D9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 18:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69FC96E5E1;
	Mon,  7 Oct 2019 16:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28136E5E1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:15:30 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A172E21721
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 16:15:30 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id q203so13160726qke.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 09:15:30 -0700 (PDT)
X-Gm-Message-State: APjAAAWoMrsdRMVrkybvNFH2Ri6xki1WlRdQUnoRkzILy5Fx+HaHTPpD
 BNSni7u7aokx9RjFwrrrxwqjtdPSgCKxCzD3xg==
X-Google-Smtp-Source: APXvYqyMttVp4NzoL2BDMDlTAFC0wl59ea24O6Tt3LAaIXYbjarxKts9Yn3gDhGLEMnxuy668Diq4GmdVs5QafCFS30=
X-Received: by 2002:a05:620a:549:: with SMTP id
 o9mr24622003qko.223.1570464929688; 
 Mon, 07 Oct 2019 09:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-5-jjhiblot@ti.com>
In-Reply-To: <20191007124437.20367-5-jjhiblot@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 7 Oct 2019 11:15:17 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
Message-ID: <CAL_JsqLTqnKpU4PB8Zt9SSPSia5mkFcUgoA8ZyX_1E_HfdFyxg@mail.gmail.com>
Subject: Re: [PATCH v9 4/5] dt-bindings: backlight: Add led-backlight binding
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570464930;
 bh=c5S5cP7zbXe49BRmhXacvHzF7MGKuJdxIqqAZRMyIhI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qKjcPd59Q3r4oAQhmdNT3jUfAgQuGlV43LIyhLlgYTCGrWJXflwGMesh62+b0eERb
 kt2y4GqnwWWulinmXB3T1hLTKrgayW3gOA/79+XsKJR4QuBe/YzRDhgo+dJ/AeXie3
 Z1uM1nOmWkfAGBMqspT9g8/Xd+bISDku+j0xS9bw=
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

UGxlYXNlIHNlbmQgRFQgYmluZGluZ3MgdG8gRFQgbGlzdCBvciBpdCdzIG5ldmVyIGluIG15IHF1
ZXVlLiBJT1csCnNlbmQgcGF0Y2hlcyB0byB0aGUgbGlzdHMgdGhhdCBnZXRfbWFpbnRhaW5lcnMu
cGwgdGVsbHMgeW91IHRvLgoKT24gTW9uLCBPY3QgNywgMjAxOSBhdCA3OjQ1IEFNIEplYW4tSmFj
cXVlcyBIaWJsb3QgPGpqaGlibG90QHRpLmNvbT4gd3JvdGU6Cj4KPiBBZGQgRFQgYmluZGluZyBm
b3IgbGVkLWJhY2tsaWdodC4KPgo+IFNpZ25lZC1vZmYtYnk6IEplYW4tSmFjcXVlcyBIaWJsb3Qg
PGpqaGlibG90QHRpLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFRob21wc29uIDxkYW5pZWwu
dGhvbXBzb25AbGluYXJvLm9yZz4KPiBSZXZpZXdlZC1ieTogU2ViYXN0aWFuIFJlaWNoZWwgPHNl
YmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9sZWRz
L2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dCB8IDI4ICsrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xp
Z2h0LnR4dAoKUGxlYXNlIG1ha2UgdGhpcyBhIERUIHNjaGVtYS4KCj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xp
Z2h0LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdo
dC9sZWQtYmFja2xpZ2h0LnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi40YzdkZmJlN2Y2N2EKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0Cj4g
QEAgLTAsMCArMSwyOCBAQAo+ICtsZWQtYmFja2xpZ2h0IGJpbmRpbmdzCj4gKwo+ICtUaGlzIGJp
bmRpbmcgaXMgdXNlZCB0byBkZXNjcmliZSBhIGJhc2ljIGJhY2tsaWdodCBkZXZpY2UgbWFkZSBv
ZiBMRURzLgo+ICtJdCBjYW4gYWxzbyBiZSB1c2VkIHRvIGRlc2NyaWJlIGEgYmFja2xpZ2h0IGRl
dmljZSBjb250cm9sbGVkIGJ5IHRoZSBvdXRwdXQgb2YKPiArYSBMRUQgZHJpdmVyLgo+ICsKPiAr
UmVxdWlyZWQgcHJvcGVydGllczoKPiArICAtIGNvbXBhdGlibGU6ICJsZWQtYmFja2xpZ2h0Igo+
ICsgIC0gbGVkczogYSBsaXN0IG9mIExFRHMKCidsZWRzJyBpcyBhbHJlYWR5IHVzZWQgYXMgYSBu
b2RlIG5hbWUgYW5kIG1peGluZyBpcyBub3QgaWRlYWwuCgpXZSBhbHJlYWR5IGhhdmUgJ2ZsYXNo
LWxlZHMnIGluIHVzZSBhbmQgd2l0aCB0aGUgc2FtZSBkZWZpbml0aW9uLCBzbwpsZXRzIGNvbnRp
bnVlIHRoYXQgYW5kIHVzZSAnYmFja2xpZ2h0LWxlZHMnLgoKPiArCj4gK09wdGlvbmFsIHByb3Bl
cnRpZXM6Cj4gKyAgLSBicmlnaHRuZXNzLWxldmVsczogQXJyYXkgb2YgZGlzdGluY3QgYnJpZ2h0
bmVzcyBsZXZlbHMuIFRoZSBsZXZlbHMgbXVzdCBiZQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGluIHRoZSByYW5nZSBhY2NlcHRlZCBieSB0aGUgdW5kZXJseWluZyBMRUQgZGV2aWNlcy4KPiAr
ICAgICAgICAgICAgICAgICAgICAgICBUaGlzIGlzIHVzZWQgdG8gdHJhbnNsYXRlIGEgYmFja2xp
Z2h0IGJyaWdodG5lc3MgbGV2ZWwKPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRvIGEgTEVE
IGJyaWdodG5lc3MgbGV2ZWwuIElmIGl0IGlzIG5vdCBwcm92aWRlZCwgdGhlCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWRlbnRpdHkgbWFwcGluZyBpcyB1c2VkLgo+ICsKPiArICAtIGRlZmF1
bHQtYnJpZ2h0bmVzcy1sZXZlbDogVGhlIGRlZmF1bHQgYnJpZ2h0bmVzcyBsZXZlbC4KCllvdSBj
YW4ganVzdCBhc3N1bWUgdGhlc2UgMiBnZXQgYSBjb21tb24gc2NoZW1hIGF0IHNvbWUgcG9pbnQu
IFNvIGp1c3QKbmVlZCB0byBkZWZpbmUgYW55IGFkZGl0aW9uYWwgY29uc3RyYWludHMgaWYgcG9z
c2libGUuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
