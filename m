Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468BA2802F
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 16:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED14F89F1B;
	Thu, 23 May 2019 14:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D176C89F1B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:48:29 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r7so5662865otn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 07:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oDQBZdIvYwIinFH3kAqUI347dxABstmtY5K29nEy8mo=;
 b=tSbJARpzXQvKJ4urFIjfih9PEEmAv3FNhfqMSajgWfVsVj0lito5XqDaEd8X1VfMQS
 DoH9Yps88T+tFTMd+zaiWw8Mg8iFb+jRcH47UByviXUbVHxYwLM9cIdZQFZPz9rcC+pY
 +j/jdfgTzkgAM95bzM8warM5LH95qS1LtKfauLaw0g8V5en10YEGzKbrW9+lbiUZmVzR
 2pLIQU7rjhoKXxHStrhkmnjvg6VK4fHrzBcLCNt7GMR7zG3Q6UkipeZAkcP4EX7fGrQR
 AFvs1FtsIsqzU8DKg7hS8yUKj2/YKauAjr7FLpHxDWWgm9CQr2qILkiRpVXd1lKXVw+W
 YCog==
X-Gm-Message-State: APjAAAVIQFBBTKGmuknGf4lfwTn7UgnL0eEUyT8dzBbnOEjwl/nPhgVl
 bonePZ3+rXW+7FWCJFaf6CUBwpaU4VcA9xy2zRQ=
X-Google-Smtp-Source: APXvYqw3lXNzL20L5yiXLKv5Z3v3y22lX4Y0hQjIQiu0uAzQPUXWXHzt/EhByUGPnFRRFPnfxLaM88AV6ZYWkFV34b8=
X-Received: by 2002:a05:6830:2047:: with SMTP id
 f7mr29121701otp.312.1558622909158; 
 Thu, 23 May 2019 07:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065404.BB60F68B20@newverein.lst.de>
In-Reply-To: <20190523065404.BB60F68B20@newverein.lst.de>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Thu, 23 May 2019 07:48:03 -0700
Message-ID: <CA+E=qVdh-=C5zOYWYj95jLN51EaXFS6B+CQ101-f64q5QmgN3g@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a64: enable ANX6345 bridge on
 Teres-I
To: Torsten Duwe <duwe@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oDQBZdIvYwIinFH3kAqUI347dxABstmtY5K29nEy8mo=;
 b=HNr+lm9qrX2w9n+0DHcc8xytZybxavfe+23JfHpNgn9pseNEgnEK0UTfApLytl3g9K
 JPfxVu6Ozzs/AWTnnt8YvUO5noCYyjb5r5fdlvOHCfygSc6lc6s1KKX2G3aaws7mPgYr
 ZODo9q5J84Pvb7LDzjMKYtcbpQ+k2785cimOMJKhSrEL/BNOkiA0DvyCiJlQd6XyUI1R
 xNge4WJLZqLPiNoaN0sHp8dNBpGSjdaULSEzM5V2FUa5iUxU0A3dZd+sWCwd1nq5pZHA
 rpR1DJxBRNF/ZBXNbinJniHhF3t9FMym1Z0QdoAn0/JDUL+MySyXAunoctX5Mb4/gG/q
 77/A==
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
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjIsIDIwMTkgYXQgMTE6NTQgUE0gVG9yc3RlbiBEdXdlIDxkdXdlQGxzdC5k
ZT4gd3JvdGU6Cj4KPiBGcm9tOiBJY2Vub3d5IFpoZW5nIDxpY2Vub3d5QGFvc2MuaW8+Cj4KPiBU
ZXJlcy1JIGhhcyBhbiBhbng2MzQ1IGJyaWRnZSBjb25uZWN0ZWQgdG8gdGhlIFJHQjY2NiBMQ0Qg
b3V0cHV0LCBhbmQKPiB0aGUgSTJDIGNvbnRyb2xsaW5nIHNpZ25hbHMgYXJlIGNvbm5lY3RlZCB0
byBJMkMwIGJ1cy4gZURQIG91dHB1dCBnb2VzCj4gdG8gYW4gSW5ub2x1eCBOMTE2QkdFIHBhbmVs
Lgo+Cj4gRW5hYmxlIGl0IGluIHRoZSBkZXZpY2UgdHJlZS4KPgo+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KPiBTaWduZWQtb2ZmLWJ5OiBUb3JzdGVuIER1
d2UgPGR1d2VAc3VzZS5kZT4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWE2NC10ZXJlcy1pLmR0cyB8ICAgNjUgKysrKysrKysrKysrKysrKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktYTY0LXRlcmVzLWkuZHRzCj4g
QEAgLTY1LDYgKzY1LDIxIEBACj4gICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICB9Owo+Cj4g
KyAgICAgICBwYW5lbDogcGFuZWwgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0iaW5u
b2x1eCxuMTE2YmdlIiwgInNpbXBsZS1wYW5lbCI7CgpJSVJDIFJvYiB3YW50ZWQgaXQgdG8gYmUg
ZWRwLWNvbm5lY3Rvciwgbm90IHNpbXBsZS1wYW5lbC4gQWxzbyB5b3UKbmVlZCB0byBpbnRyb2R1
Y2UgZWRwLWNvbm5lY3RvciBiaW5kaW5nLgoKPiArICAgICAgICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOwo+ICsgICAgICAgICAgICAgICBwb3dlci1zdXBwbHkgPSA8JnJlZ19kY2RjMT47Cj4gKyAg
ICAgICAgICAgICAgIGJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArCj4gKyAgICAgICAgICAg
ICAgIHBvcnRzIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbjogcG9ydCB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYW5lbF9pbl9lZHA6IGVuZHBvaW50IHsK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBvaW50
ID0gPCZhbng2MzQ1X291dD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+
ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAg
ICB9Owo+ICsKPiAgICAgICAgIHJlZ191c2IxX3ZidXM6IHVzYjEtdmJ1cyB7Cj4gICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPiAgICAgICAgICAgICAgICAg
cmVndWxhdG9yLW5hbWUgPSAidXNiMS12YnVzIjsKPiBAQCAtODEsMjAgKzk2LDQ4IEBACj4gICAg
ICAgICB9Owo+ICB9Owo+Cj4gKyZkZSB7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gK307
Cj4gKwo+ICAmZWhjaTEgewo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+Cj4KPiAt
LyogVGhlIEFOWDYzNDUgZURQLWJyaWRnZSBpcyBvbiBpMmMwLiBUaGVyZSBpcyBubyBsaW51eCAo
bWFpbmxpbmUpCj4gLSAqIGRyaXZlciBmb3IgdGhpcyBjaGlwIGF0IHRoZSBtb21lbnQsIHRoZSBi
b290bG9hZGVyIGluaXRpYWxpemVzIGl0Lgo+IC0gKiBIb3dldmVyIGl0IGNhbiBiZSBhY2Nlc3Nl
ZCB3aXRoIHRoZSBpMmMtZGV2IGRyaXZlciBmcm9tIHVzZXIgc3BhY2UuCj4gLSAqLwo+ICAmaTJj
MCB7Cj4gICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsKPiAgICAgICAgIHBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gICAgICAgICBwaW5jdHJsLTAgPSA8JmkyYzBfcGlucz47
Cj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsgICAgICAgYW54NjM0NTogYW54NjM0
NUAzOCB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7
Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IDwweDM4PjsKPiArICAgICAgICAgICAgICAgcmVzZXQt
Z3Bpb3MgPSA8JnBpbyAzIDI0IEdQSU9fQUNUSVZFX0xPVz47IC8qIFBEMjQgKi8KPiArICAgICAg
ICAgICAgICAgZHZkZDI1LXN1cHBseSA9IDwmcmVnX2RsZG8yPjsKPiArICAgICAgICAgICAgICAg
ZHZkZDEyLXN1cHBseSA9IDwmcmVnX2RsZG8zPjsKPiArCj4gKyAgICAgICAgICAgICAgIHBvcnRz
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAg
ICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcG9ydEAwIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFu
eDYzNDVfaW46IGVuZHBvaW50IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZ0Y29uMF9vdXRfYW54NjM0NT47Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIH07Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcG9ydEAxIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFueDYzNDVfb3V0OiBlbmRwb2ludCB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW5fZWRwPjsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgfTsKPiArICAgICAgICAgICAgICAgfTsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmbWl4
ZXIwIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPgo+ICAmbW1jMCB7Cj4gQEAg
LTI3OSw2ICszMjIsMjAgQEAKPiAgICAgICAgIHZjYy1oZG1pLXN1cHBseSA9IDwmcmVnX2RsZG8x
PjsKPiAgfTsKPgo+ICsmdGNvbjAgewo+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPiArICAgICAgIHBpbmN0cmwtMCA9IDwmbGNkX3JnYjY2Nl9waW5zPjsKPiArCj4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gK307Cj4gKwo+ICsmdGNvbjBfb3V0IHsKPiArICAgICAgIHRj
b24wX291dF9hbng2MzQ1OiBlbmRwb2ludEAwIHsKPiArICAgICAgICAgICAgICAgcmVnID0gPDA+
Owo+ICsgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8JmFueDYzNDVfaW4+Owo+ICsg
ICAgICAgfTsKPiArfTsKPiArCj4gICZ1YXJ0MCB7Cj4gICAgICAgICBwaW5jdHJsLW5hbWVzID0g
ImRlZmF1bHQiOwo+ICAgICAgICAgcGluY3RybC0wID0gPCZ1YXJ0MF9wYl9waW5zPjsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
