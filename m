Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F23465E7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 19:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39666892CA;
	Fri, 14 Jun 2019 17:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5282B892CA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 17:40:40 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z24so3383759qtj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 10:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wPpnwqyMUwz4SjcLvux0hAtQhIO7tvhlsaBTqk5BtFQ=;
 b=t1mPcZ9amZugqJAs5xwPJ6QfcF5ZA9Bo/MkEiiApJpYsJS1bYOoqthyFfyKcvt9Tv9
 8YLXrL/OOOf/Zo0VU8QLWgmkssC5Hpxq3vbf8h6bIApPpZykLWTt+vnonHQinvAxbFic
 3n29tpQlUdI1g6c33oS0GVVPkA/3XsENVTxe7WdPSArdp6A7AYCWdWfOfjLvcS6Lx/QX
 axPWxdIh724BV0pjzaVhlT89ec5+bf024UFtwjppo/IhPpMEs3wxpzdwC/HlPfXCnc4H
 G8fi8XN3mTgjmXW9dAs9S6j8tT9ZvWqUaldcYh94ju9dOWF930U3Xi2QTgxHB7T3kykb
 10dA==
X-Gm-Message-State: APjAAAV6aD4wUZBJNOjt81WS6vqIhmE8NfChaI3ceTNHEbQ7YbIrg4Ry
 tsQup7KJr0RGXgzqWa//VA==
X-Google-Smtp-Source: APXvYqxo44A52mZTtb6SOTHwe53kddQe2wYjOh2ybh83i+aLF200ttNmY0LQpx9l952MRTesaOIZBw==
X-Received: by 2002:ad4:43e3:: with SMTP id f3mr9527578qvu.108.1560534039177; 
 Fri, 14 Jun 2019 10:40:39 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id f25sm2592067qta.81.2019.06.14.10.40.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:40:38 -0700 (PDT)
Date: Fri, 14 Jun 2019 11:40:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: display: bridge: Add ICN6211
 MIPI-DSI to RGB converter bridge
Message-ID: <20190614174036.GA31068@bogus>
References: <20190524104317.20287-1-jagan@amarulasolutions.com>
 <20190524104317.20287-2-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190524104317.20287-2-jagan@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MTM6MTVQTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBJQ042MjExIGlzIE1JUEktRFNJL1JHQiBjb252ZXJ0ZXIgYnJpZGdlIGZyb20gY2hpcG9u
ZS4KPiBJdCBoYXMgYSBmbGV4aWJsZSBjb25maWd1cmF0aW9uIG9mIE1JUEkgRFNJIHNpZ25hbCBp
bnB1dAo+IGFuZCBwcm9kdWNlIFJHQjU2NSwgUkdCNjY2LCBSR0I4ODggb3V0cHV0IGZvcm1hdC4K
PiAKPiBBZGQgZHQtYmluZ2luZ3MgZm9yIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphZ2FuIFRl
a2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICAuLi4vZGlzcGxheS9icmlk
Z2UvY2hpcG9uZSxpY242MjExLnR4dCAgICAgICAgfCA3OCArKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2hpcG9uZSxp
Y242MjExLnR4dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9icmlkZ2UvY2hpcG9uZSxpY242MjExLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9jaGlwb25lLGljbjYyMTEudHh0Cj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUzYTk4NDhlZjhiNgo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2UvY2hpcG9uZSxpY242MjExLnR4dAo+IEBAIC0wLDAgKzEsNzggQEAKPiAr
Q2hpcG9uZSBJQ042MjExIE1JUEktRFNJIHRvIFJHQiBDb252ZXJ0ZXIgQnJpZGdlCj4gKwo+ICtJ
Q042MjExIGlzIE1JUEktRFNJL1JHQiBjb252ZXJ0ZXIgYnJpZGdlIGZyb20gY2hpcG9uZS4KPiAr
SXQgaGFzIGEgZmxleGlibGUgY29uZmlndXJhdGlvbiBvZiBNSVBJIERTSSBzaWduYWwgaW5wdXQK
PiArYW5kIHByb2R1Y2UgUkdCNTY1LCBSR0I2NjYsIFJHQjg4OCBvdXRwdXQgZm9ybWF0Lgo+ICsK
PiArUmVxdWlyZWQgcHJvcGVydGllcyBmb3IgUkdCOgo+ICstIGNvbXBhdGlibGU6IG11c3QgYmUg
ImNoaXBvbmUsaWNuNjIxMSIKPiArLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVyIG9m
IGEgRFNJIHBlcmlwaGVyYWwKPiArLSByZXNldC1ncGlvczogYSBHUElPIHBoYW5kbGUgZm9yIHRo
ZSByZXNldCBwaW4KPiArCj4gK1RoZSBkZXZpY2Ugbm9kZSBjYW4gY29udGFpbiBmb2xsb3dpbmcg
J3BvcnQnIGNoaWxkIG5vZGVzLAo+ICthY2NvcmRpbmcgdG8gdGhlIE9GIGdyYXBoIGJpbmRpbmdz
IGRlZmluZWQgaW4gWzFdOgo+ICsgIDA6IERTSSBJbnB1dCwgbm90IHJlcXVpcmVkLCBpZiB0aGUg
YnJpZGdlIGlzIERTSSBjb250cm9sbGVkCj4gKyAgMTogUkdCIE91dHB1dCwgbWFuZGF0b3J5Cj4g
Kwo+ICtbMV06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1p
bnRlcmZhY2VzLnR4dAo+ICsKPiArRXhhbXBsZToKPiArCj4gKwlwYW5lbCB7Cj4gKwkJY29tcGF0
aWJsZSA9ICJiYW5hbmFwaSxzMDcwd3YyMC1jdDE2IiwgInNpbXBsZS1wYW5lbCI7Cgonc2ltcGxl
LXBhbmVsJyBpcyBub3QgYSB2YWxpZCBjb21wYXRpYmxlIHN0cmluZy4KCj4gKwkJZW5hYmxlLWdw
aW9zID0gPCZwaW8gMSA3IEdQSU9fQUNUSVZFX0hJR0g+OyAvKiBMQ0QtUFdSLUVOOiBQQjcgKi8K
PiArCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47Cj4gKwo+ICsJCXBvcnQgewo+ICsJCQlwYW5l
bF9vdXRfYnJpZGdlOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmJyaWRn
ZV9vdXRfcGFuZWw+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiArJmRzaSB7Cj4gKwl2
Y2MtZHNpLXN1cHBseSA9IDwmcmVnX2RjZGMxPjsJCS8qIFZDQy1EU0kgKi8KPiArCXN0YXR1cyA9
ICJva2F5IjsKPiArCj4gKwlwb3J0cyB7Cj4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKwkJ
I3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCWRzaV9vdXQ6IHBvcnRAMCB7Cj4gKwkJCXJlZyA9
IDwwPjsKPiArCj4gKwkJCWRzaV9vdXRfYnJpZGdlOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmJyaWRnZV9vdXRfZHNpPjsKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiAr
Cj4gKwlicmlkZ2VAMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJjaGlwb25lLGljbjYyMTEiOwo+ICsJ
CXJlZyA9IDwwPjsKPiArCQlyZXNldC1ncGlvcyA9IDwmcl9waW8gMCA1IEdQSU9fQUNUSVZFX0hJ
R0g+OyAvKiBMQ0QtUlNUOiBQTDUgKi8KPiArCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArCQkj
c2l6ZS1jZWxscyA9IDwwPjsKPiArCj4gKwkJcG9ydHMgewo+ICsJCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwo+ICsJCQlicmlkZ2VfaW46IHBvcnRA
MCB7Cj4gKwkJCQlyZWcgPSA8MD47Cj4gKwo+ICsJCQkJYnJpZGdlX291dF9kc2k6IGVuZHBvaW50
IHsKPiArCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXRfYnJpZGdlPjsKPiArCQkJCX07
Cj4gKwkJCX07Cj4gKwo+ICsJCQlicmlkZ2Vfb3V0OiBwb3J0QDEgewo+ICsJCQkJcmVnID0gPDE+
Owo+ICsKPiArCQkJCWJyaWRnZV9vdXRfcGFuZWw6IGVuZHBvaW50IHsKPiArCQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JnBhbmVsX291dF9icmlkZ2U+Owo+ICsJCQkJfTsKPiArCQkJfTsKPiArCQl9
Owo+ICsJfTsKPiArfTsKPiAtLSAKPiAyLjE4LjAuMzIxLmdmZmM2ZmEwZTMKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
