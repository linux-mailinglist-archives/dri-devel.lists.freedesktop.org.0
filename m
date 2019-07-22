Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C96F9EA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 09:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF3889A7A;
	Mon, 22 Jul 2019 07:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2556689A7A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 07:06:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x1so23152734wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 00:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=7AKc4S2JdeQQN46PQF2XtG4Lb0wPXYNR/5uOmrJuwCI=;
 b=XypDhM58fpfq6Fh0vU85nRMJMVRl0F5dOU3uNI2gTGhP0foVgTBo7c8IQcXjcainSu
 Ozw5XQvtC5k56ErtLuloNHEjkhdeKK2U7VElSoSrepKdmYW3l3mr1UwWz23SRSjX95lo
 5PkZYCZyd2O8L41mOY85qDlDmFWg2aPDjFXq73lZWbXAk96joLWSJDT5S0I/frx7i3ct
 404t3MOfYSbf3nyrqvsI0rrHElwD/LZqJ17/G6XPXfFKuS+A80yYqGG6oAGlAZI17A+i
 gELepXKcdvQQu3FdUijJXkqEym+4JagUtbezHmR8jmvkHGFh1Fc9o+IhFLgRC8PsFGDk
 oSzA==
X-Gm-Message-State: APjAAAVKo/89npLvThwgFmdmY7k/wOiIeTtgrwTIIXO6tLfhSLdBP1V/
 44C0SxtaWIrKWeR7ZZjgxNRAk7xSxWg=
X-Google-Smtp-Source: APXvYqz1zNy/Suaraf0jDlZuuwYJiXQboZhBofok0+Dw6tTV/c6MAxCe+hyhocPGQ96oLQ/5Yf2ZSA==
X-Received: by 2002:a5d:4211:: with SMTP id n17mr4118838wrq.137.1563779182766; 
 Mon, 22 Jul 2019 00:06:22 -0700 (PDT)
Received: from dell ([2.27.35.164])
 by smtp.gmail.com with ESMTPSA id k17sm42778533wrq.83.2019.07.22.00.06.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jul 2019 00:06:22 -0700 (PDT)
Date: Mon, 22 Jul 2019 08:06:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Message-ID: <20190722070620.GD8402@dell>
References: <20190717141514.21171-1-jjhiblot@ti.com>
 <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <283d9044-df2d-b176-bea9-7e1520d9cf56@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=7AKc4S2JdeQQN46PQF2XtG4Lb0wPXYNR/5uOmrJuwCI=;
 b=n1V9ILuFGiEzUzu6vh751kEk3R4i+V91IXoSJlqrNELQuIg9OTOSXjvfRoFZMI+qUD
 sOseYkxLIKd4eQl8a5NQ/NwTMJP+faWHBKb6arB5aWYQJ8Hk5Is5HkhGPzTSghZ2fzld
 f4fU6UER4R681nXx7VKwHMCTJ6SR5cOEOzzGx/7wTBJejfu/IrYARxwWYhUnSkEpzo+l
 Y2mV85siW50mM8hUNQWpTxhJw4ZqqcVhgG4ouq3XWIRjDymNdHITh9h62hFuRGkOvL9O
 sLwaogitA6gF7TXq0HTDti5ZkYFk+g2ITjoZR8ThP5JY3QAnhjju10fFUm313K4f4CEs
 eTFg==
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 tomi.valkeinen@ti.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, dmurphy@ti.com,
 pavel@ucw.cz, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxOCBKdWwgMjAxOSwgSmFjZWsgQW5hc3pld3NraSB3cm90ZToKCj4gT24gNy8xNy8x
OSA0OjE1IFBNLCBKZWFuLUphY3F1ZXMgSGlibG90IHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgYWlt
cyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0byBwd20tYmFja2xpZ2h0
LAo+ID4gYnV0IHVzaW5nIGEgTEVEIGNsYXNzIGRldmljZSB1bmRlcm5lYXRoLgo+ID4gCj4gPiBB
IGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBzZXJpZXMgaW1w
bGVtZW50aW5nIGEKPiA+IGJhY2tsaWdodCBkcml2ZXIgb24gdG9wIG9mIGEgTEVEIGRldmljZToK
PiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5Mzk5MS8KPiA+IGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KPiA+IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5Mzk4MS8KPiA+IAo+ID4gVGhlIGRpc2N1c3Npb24gc3Rv
cHBlZCBiZWNhdXNlIFRvbWkgbGFja2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCj4gPiAKPiA+
IGNoYW5nZXMgaW4gdjQ6Cj4gPiAtIGZpeCBkZXZfZXJyKCkgbWVzc2FnZXMgYW5kIGNvbW1pdCBs
b2dzIGZvbGxvd2luZyB0aGUgYWR2aWNlcyBvZiBQYXZlbAo+ID4gLSBjb3NtZXRpYyBjaGFuZ2Vz
IChpbmRlbnRzLCBnZXR0aW5nIHJpZCBvZiAgIj8gMSA6IDAiIGluCj4gPiAgIGxlZF9tYXRjaF9s
ZWRfbm9kZSgpKQo+ID4gCj4gPiBjaGFuZ2VzIGluIHYzOgo+ID4gLSBkdCBiaW5kaW5nOiBkb24n
dCBsaW1pdCB0aGUgYnJpZ2h0bmVzcyByYW5nZSB0byAwLTI1NS4gVXNlIHRoZSByYW5nZSBvZgo+
ID4gICB0aGUgdW5kZXJseWluZyBMRURzLiBhcyBhIHNpZGUtZWZmZWN0LCBhbGwgTEVEcyBtdXN0
IG5vdyBoYXZlIHRoZSBzYW1lCj4gPiAgIHJhbmdlCj4gPiAtIGRyaXZlcjogQWRhcHQgdG8gZHQg
YmluZGluZyB1cGRhdGUuCj4gPiAtIGRyaXZlcjogcmV3b3JrIHByb2JlKCkgZm9yIGNsYXJpdHkg
YW5kIHJlbW92ZSB0aGUgcmVtYWluaW5nIGdvdG8uCj4gPiAKPiA+IGNoYW5nZXMgaW4gdjI6Cj4g
PiAtIGhhbmRsZSBtb3JlIHRoYW4gb25lIExFRC4KPiA+IC0gZG9uJ3QgbWFrZSB0aGUgYmFja2xp
Z2h0IGRldmljZSBhIGNoaWxkIG9mIHRoZSBMRUQgY29udHJvbGxlci4KPiA+IC0gbWFrZSBicmln
aHRuZXNzLWxldmVscyBhbmQgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsIG9wdGlvbmFsCj4gPiAt
IHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSBHUElPIGVuYWJsZS4KPiA+IC0gcmVtb3ZlZCB0
aGUgb3B0aW9uIHRvIHVzZSBhIHJlZ3VsYXRvci4gSXQgc2hvdWxkIGJlIGhhbmRsZWQgYnkgdGhl
IExFRAo+ID4gICBjb3JlCj4gPiAtIGRvbid0IG1ha2UgYW55IGNoYW5nZSB0byB0aGUgTEVEIGNv
cmUgKG5vdCBuZWVkZWQgYW55bW9yZSkKPiA+IAo+ID4gSmVhbi1KYWNxdWVzIEhpYmxvdCAoMik6
Cj4gPiAgIGxlZHM6IEFkZCBtYW5hZ2VkIEFQSSB0byBnZXQgYSBMRUQgZnJvbSBhIGRldmljZSBk
cml2ZXIKPiA+ICAgZHQtYmluZGluZ3M6IGJhY2tsaWdodDogQWRkIGxlZC1iYWNrbGlnaHQgYmlu
ZGluZwo+ID4gCj4gPiBUb21pIFZhbGtlaW5lbiAoMik6Cj4gPiAgIGxlZHM6IEFkZCBvZl9sZWRf
Z2V0KCkgYW5kIGxlZF9wdXQoKQo+ID4gICBiYWNrbGlnaHQ6IGFkZCBsZWQtYmFja2xpZ2h0IGRy
aXZlcgo+ID4gCj4gPiAgLi4uL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQu
dHh0IHwgIDI4ICsrCj4gPiAgZHJpdmVycy9sZWRzL2xlZC1jbGFzcy5jICAgICAgICAgICAgICAg
ICAgICAgIHwgIDkyICsrKysrKwo+ID4gIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L0tjb25maWcg
ICAgICAgICAgICAgICB8ICAgNyArCj4gPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZp
bGUgICAgICAgICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRf
YmwuYyAgICAgICAgICAgICAgfCAyNjggKysrKysrKysrKysrKysrKysrCj4gPiAgaW5jbHVkZS9s
aW51eC9sZWRzLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsKPiA+ICA2IGZpbGVz
IGNoYW5nZWQsIDQwMiBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0
LnR4dAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRf
YmwuYwo+ID4gCj4gCj4gRm9yIHRoZSB3aG9sZSBzZXQ6Cj4gCj4gQWNrZWQtYnk6IEphY2VrIEFu
YXN6ZXdza2kgPGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPgo+IAo+IExlZSAtIHdlIG5lZWQg
dG8gY3JlYXRlIGltbXV0YWJsZSBicmFuY2ggZm9yIHRoaXMgc2V0IHNpbmNlIHRoZXJlIHdpbGwK
PiBiZSBzb21lIGludGVyZmVyaW5nIGNoYW5nZXMgaW4gdGhlIExFRCBjb3JlIGluIHRoaXMgY3lj
bGUuCj4gCj4gSSBjYW4gY3JlYXRlIHRoZSBicmFuY2ggYW5kIHNlbmQgdGhlIHB1bGwgcmVxdWVz
dCBvbmNlIHdlIHdpbGwKPiBvYnRhaW4gdGhlIGFjayBmcm9tIFJvYiBmb3IgRFQgYmluZGluZ3Ms
IHVubGVzcyB5b3UgaGF2ZSBvdGhlcgo+IHByZWZlcmVuY2UuCgpXZSBhbHNvIHJlcXVpcmUgYSBy
ZXZpZXcgdG8gYmUgY29uZHVjdGVkIGJ5IERhbmllbCBUaG9tcHNvbi4KCkFmdGVyIHdoaWNoLCBh
biBpbW11dGFibGUgYnJhbmNoIHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiAgSSdkIGxpa2UgdG8K
Y3JlYXRlIHRoaXMgbXlzZWxmIGlmIHlvdSBkb24ndCBtaW5kLgoKLS0gCkxlZSBKb25lcyBb5p2O
55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
