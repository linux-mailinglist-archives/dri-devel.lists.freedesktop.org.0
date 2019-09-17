Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D477EB54A8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 19:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D076F6E109;
	Tue, 17 Sep 2019 17:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0906E109
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 17:55:08 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w144so3666075oia.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 10:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=apP6EuGrN+2ThQnbuaWrR8NOtzPWwQdyNbUGXH4C9kY=;
 b=WV0p0G1fwA07qBSe0hV40t9BAq31IfsFHVRafdgqV8UM/vVOUvk3i0g2r7ypYxCvBf
 B+I8mECsK5lsDLcADBrjdvwkZfw+TBe65hTbsQAdDMzflSv2N356l/xWI6528cNblUb+
 mSsSsg0Dk3UgHQHTsK+1CZSWIyPxJuD4SkDV0nNjITndzG4bQt7ZOuwiAoWcaeyJubI0
 e5wofEPZo7Eb8L43SH5GCgtv+oeaR78RmXy6vu0ww+5UQrGn1+xI9Wcpae8I8ahWpKR5
 uot3MR3vnH2ZwAjaOhoOyuJuXWgK7IBJDE3AUgHs5W1NYBE1s3At5KYsz5pCgM4hhbza
 zcwQ==
X-Gm-Message-State: APjAAAUCW/6Reiyf2B+6g8b1tCe36mxdS20fjDPScTgQ3qhUrei+eExE
 RZfk7Rfj6xSfqmwjCo8vuAa8uOE=
X-Google-Smtp-Source: APXvYqxroo1YBuMjGZ0BOe2e6ICZ0bADExyq7TNaM4+OK8EjcRVNatn2iNeE5lPJX0K6tHBwPgEUdQ==
X-Received: by 2002:aca:c7d8:: with SMTP id x207mr4901443oif.99.1568742907207; 
 Tue, 17 Sep 2019 10:55:07 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b4sm868738oiy.30.2019.09.17.10.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 10:55:06 -0700 (PDT)
Date: Tue, 17 Sep 2019 12:55:05 -0500
From: Rob Herring <robh@kernel.org>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 1/9] dt-bindings: display: renesas,cmm: Add R-Car CMM
 documentation
Message-ID: <20190917175505.GA29276@bogus>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906135436.10622-2-jacopo+renesas@jmondi.org>
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
Cc: muroya@ksk.co.jp, devicetree@vger.kernel.org, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie, mark.rutland@arm.com,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com, Harsha.ManjulaMallikarjun@in.bosch.com,
 uli+renesas@fpond.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDM6NTQ6MjhQTSArMDIwMCwgSmFjb3BvIE1vbmRpIHdy
b3RlOgo+IEFkZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBkb2N1bWVudGF0aW9uIGZvciB0aGUgUmVu
ZXNhcyBSLUNhciBEaXNwbGF5Cj4gVW5pdCBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZS4KPiAKPiBD
TU0gaXMgdGhlIGltYWdlIGVuaGFuY2VtZW50IG1vZHVsZSBhdmFpbGFibGUgb24gZWFjaCBSLUNh
ciBEVSB2aWRlbwo+IGNoYW5uZWwgb24gUi1DYXIgR2VuMiBhbmQgR2VuMyBTb0NzIChWM0ggYW5k
IFYzTSBleGNsdWRlZCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8r
cmVuZXNhc0BqbW9uZGkub3JnPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9yZW5lc2Fz
LGNtbS55YW1sICAgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA2NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sCj4gCj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3JlbmVzYXMs
Y21tLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5l
c2FzLGNtbS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjllNTkyMjY4OWNkNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9yZW5lc2FzLGNtbS55YW1sCj4gQEAgLTAsMCArMSw2NCBA
QAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCgpGb3IgbmV3IGJpbmRpbmdz
OgoKR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQoKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvcmVuZXNhcyxjbW0ueWFt
bCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwjCj4gKwo+ICt0aXRsZTogUmVuZXNhcyBSLUNhciBDb2xvciBNYW5hZ2VtZW50IE1vZHVsZSAo
Q01NKQo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gKyAgLSBLaWVyYW4gQmluZ2hhbSA8a2llcmFu
LmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+ICsgIC0gSmFjb3BvIE1vbmRpIDxq
YWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ICsKPiArZGVzY3JpcHRpb246IHwrCj4gKyAgUmVu
ZXNhcyBSLUNhciBjb2xvciBtYW5hZ2VtZW50IG1vZHVsZSBjb25uZWN0ZWQgdG8gUi1DYXIgRFUg
dmlkZW8gY2hhbm5lbHMuCj4gKyAgSXQgcHJvdmlkZXMgaW1hZ2UgZW5oYW5jZW1lbnQgZnVuY3Rp
b25zIHN1Y2ggYXMgMS1EIGxvb2stdXAgdGFibGVzIChMVVQpLAo+ICsgIDMtRCBsb29rLXVwIHRh
YmxlcyAoQ01VKSwgMUQtaGlzdG9ncmFtIGdlbmVyYXRpb24gKEhHTyksIGFuZCBjb2xvcgo+ICsg
IHNwYWNlIGNvbnZlcnNpb24gKENTQykuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNvbXBhdGli
bGU6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBlbnVtOgo+ICsgICAgICAgIC0gcmVuZXNhcyxy
OGE3Nzk1LWNtbQo+ICsgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2LWNtbQo+ICsgICAgICAgIC0g
cmVuZXNhcyxyOGE3Nzk2NS1jbW0KPiArICAgICAgICAtIHJlbmVzYXMscjhhNzc5OTAtY21tCj4g
KyAgICAgICAgLSByZW5lc2FzLHI4YTc3OTk1LWNtbQo+ICsgICAgICAtIGVudW06Cj4gKyAgICAg
ICAgLSByZW5lc2FzLHJjYXItZ2VuMy1jbW0KPiArICAgICAgICAtIHJlbmVzYXMscmNhci1nZW4y
LWNtbQoKVGhpcyBhbGxvd3MgMTAgdmFsaWQgY2FzZXMgd2hlbiBJIGltYWdpbmUgdGhlcmUncyBv
bmx5IHJlYWxseSA1LiBJJ20gCm9rYXkgbGVhdmluZyBpdCwgYnV0IG1pZ2h0IGJlIGJldHRlciB0
byBzcGxpdCBpbnRvIDIgdW5kZXIgYSAnb25lT2YnLgoKSSBpbWFnaW5lIHRoZXJlIHdpbGwgYmUg
YSBsb3Qgb2YgdGhlc2UgZm9yIFJlbmVzYXMsIHNvIGp1c3QgYmUgCmNvbnNpc3RlbnQuCgo+ICsg
IHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1heEl0ZW1z
OiAxCj4gKwo+ICsgIHJlc2V0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIHBvd2VyLWRv
bWFpbnM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRp
YmxlCj4gKyAgLSByZWcKPiArICAtIGNsb2Nrcwo+ICsgIC0gcmVzZXRzCj4gKyAgLSBwb3dlci1k
b21haW5zCj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVz
Ogo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3I4YTc3OTYtY3Bn
LW1zc3IuaD4KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9yOGE3Nzk2LXN5c2Mu
aD4KPiArCj4gKyAgICBjbW0wOiBjbW1AZmVhNDAwMDAgewo+ICsgICAgICAgICBjb21wYXRpYmxl
ID0gInJlbmVzYXMscjhhNzc5Ni1jbW0iOwo+ICsgICAgICAgICByZWcgPSA8MCAweGZlYTQwMDAw
IDAgMHgxMDAwPjsKPiArICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3Nzk2X1BE
X0FMV0FZU19PTj47Cj4gKyAgICAgICAgIGNsb2NrcyA9IDwmY3BnIENQR19NT0QgNzExPjsKPiAr
ICAgICAgICAgcmVzZXRzID0gPCZjcGcgNzExPjsKPiArICAgIH07Cj4gLS0KPiAyLjIzLjAKPiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
