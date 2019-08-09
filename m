Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33D88BA4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023806E408;
	Sat, 10 Aug 2019 13:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC76E1F7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 08:25:45 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t3so2782371ljj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 01:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/A/7y3FwUsdRyRWbpHY31PGn5klTkFuPU5InmeFB5Vk=;
 b=dDte/BVLSQ7FztgA0HxMIgaE3flJw2nyJMAv8Eiq8jQbN0MJVvOf8/5P9cnfpi+U1d
 V+L3Gs16aZchVtUWP5g7L5Pz+ReTEzP+o0gFj25YTXXQ0ZYSWlWjnWl6Z0TR1+y9obop
 tZHmUIjczsBS9D58MREZ33IeTVG+a+XfXkWNLBXPrlk3yq3vYiI981UMUjM+1bgNutrC
 yLa06zIg+wP11DtVcVMpJMmDqyTnCqQUO0qDqhfOq+S+UANERm///V5dIy7iL/Y/4UkH
 7Zp9dX53KhJqNSrSYYqAqGyA/XsjBnWPGbpvQAQcIIAaBrtmSvySI+X6Hb1kEww0+ARw
 yylA==
X-Gm-Message-State: APjAAAX73Fw6PnjqRuRGXd70U7vKr7IwQMTdAUyMl1vzxlTIH0uKc3IZ
 Wec7yzjHXQSaaoiN+gN+zImkZ0Cb46LpFQ4+D6o=
X-Google-Smtp-Source: APXvYqzRX9Y6GM2LBGO/GzFpFOiYrL7yUSPZ4SglXcKIzN9V37dUNVzUdXfm4el8/ZqkKAylzB4JXgRo2vU6koy4FEA=
X-Received: by 2002:a2e:85d7:: with SMTP id h23mr10916932ljj.53.1565339144082; 
 Fri, 09 Aug 2019 01:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190806155744.10263-1-megous@megous.com>
 <20190806155744.10263-5-megous@megous.com>
In-Reply-To: <20190806155744.10263-5-megous@megous.com>
From: Code Kipper <codekipper@gmail.com>
Date: Fri, 9 Aug 2019 10:25:32 +0200
Message-ID: <CAEKpxBn1nF0t-M34iRSy1yYEuUxgNMUXFBhtjXBY8Qk+43zbDQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v8 4/4] arm64: dts: allwinner: orange-pi-3:
 Enable HDMI output
To: megous@megous.com
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/A/7y3FwUsdRyRWbpHY31PGn5klTkFuPU5InmeFB5Vk=;
 b=Qfqne4S2i01albbmzKziFOjlp1SXKoDMxp9rmWkJewHFL7gA+G4afjkR78ZqhWYDIQ
 cqd1c0nbWqKdgIsechuMRgIdVV9cQiusELCw/NgSM1kwEVdg4C2SXjO4a/6t7VgZHZM1
 ztT2Ube+FUfbXXynvTQIbRFeSKxOj5+x2InTwF4SSXQJgiwSKeb5hF3R3HQLTubh83d7
 Usj/aimxcOKIVIBM2bAhpz/0P/CY/ABl5DxO3XPh0QqhrUw8PgYY0RN4X4UP3JuIi6ry
 G9FXKdgUw3XgqdPYkXvUGYPk0yEIuKg+aoyOT8ZrU/bQlQBbh9ChDnIbuzM83+w5iUSA
 VaiQ==
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCA2IEF1ZyAyMDE5IGF0IDE3OjU3LCA8bWVnb3VzQG1lZ291cy5jb20+IHdyb3RlOgo+
Cj4gRnJvbTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+Cj4KPiBPcmFuZ2UgUGkg
MyBoYXMgYSBERENfQ0VDX0VOIHNpZ25hbCBjb25uZWN0ZWQgdG8gUEgyLCB0aGF0IGVuYWJsZXMg
dGhlIEREQwo+IEkyQyBidXMgdm9sdGFnZSBzaGlmdGVyLiBCZWZvcmUgRURJRCBjYW4gYmUgcmVh
ZCwgd2UgbmVlZCB0byBwdWxsIFBIMiBoaWdoLgo+IFRoaXMgaXMgcmVhbGl6ZWQgYnkgdGhlIGRk
Yy1lbi1ncGlvcyBwcm9wZXJ0eS4KR3JlYXQgd29yay4gSXMgdGhlcmUgYW55IGNoYW5jZSB5b3Ug
Y2FuIG1vdmUgdGhpcyB0byB0aGUKYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBp
LWg2LW9yYW5nZXBpLmR0c2k/LCBhcyBhbGwgdGhlIEg2CmJhc2VkIG9yYW5nZS1waSdzIGhhdmUg
dGhpcyBmZWF0dXJlLgpCUiwKQ0sKPgo+IFNpZ25lZC1vZmYtYnk6IE9uZHJlaiBKaXJtYW4gPG1l
Z291c0BtZWdvdXMuY29tPgo+IC0tLQo+ICAuLi4vZHRzL2FsbHdpbm5lci9zdW41MGktaDYtb3Jh
bmdlcGktMy5kdHMgICAgfCAyNiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gaW5kZXggMmM2ODA3Yjc0ZmY2Li4w
MWJiMWJhZmUyODQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIv
c3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3
aW5uZXIvc3VuNTBpLWg2LW9yYW5nZXBpLTMuZHRzCj4gQEAgLTIyLDYgKzIyLDE4IEBACj4gICAg
ICAgICAgICAgICAgIHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MTE1MjAwbjgiOwo+ICAgICAgICAg
fTsKPgo+ICsgICAgICAgY29ubmVjdG9yIHsKPiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJoZG1pLWNvbm5lY3RvciI7Cj4gKyAgICAgICAgICAgICAgIGRkYy1lbi1ncGlvcyA9IDwmcGlv
IDcgMiBHUElPX0FDVElWRV9ISUdIPjsgLyogUEgyICovCj4gKyAgICAgICAgICAgICAgIHR5cGUg
PSAiYSI7Cj4gKwo+ICsgICAgICAgICAgICAgICBwb3J0IHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBoZG1pX2Nvbl9pbjogZW5kcG9pbnQgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZoZG1pX291dF9jb24+Owo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICB9Owo+ICsKPiAgICAg
ICAgIGxlZHMgewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8tbGVkcyI7Cj4K
PiBAQCAtNzIsNiArODQsMTAgQEAKPiAgICAgICAgIGNwdS1zdXBwbHkgPSA8JnJlZ19kY2RjYT47
Cj4gIH07Cj4KPiArJmRlIHsKPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4g
ICZlaGNpMCB7Cj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4gQEAgLTkxLDYgKzEw
NywxNiBAQAo+ICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICB9Owo+Cj4gKyZoZG1pIHsKPiAr
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiArfTsKPiArCj4gKyZoZG1pX291dCB7Cj4gKyAgICAg
ICBoZG1pX291dF9jb246IGVuZHBvaW50IHsKPiArICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZoZG1pX2Nvbl9pbj47Cj4gKyAgICAgICB9Owo+ICt9Owo+ICsKPiAgJm1kaW8gewo+
ICAgICAgICAgZXh0X3JnbWlpX3BoeTogZXRoZXJuZXQtcGh5QDEgewo+ICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImV0aGVybmV0LXBoeS1pZWVlODAyLjMtYzIyIjsKPiAtLQo+IDIuMjIu
MAo+Cj4gLS0KPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJz
Y3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJsaW51eC1zdW54aSIgZ3JvdXAuCj4gVG8gdW5z
dWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBp
dCwgc2VuZCBhbiBlbWFpbCB0byBsaW51eC1zdW54aSt1bnN1YnNjcmliZUBnb29nbGVncm91cHMu
Y29tLgo+IFRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIsIHZpc2l0IGh0dHBzOi8v
Z3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9saW51eC1zdW54aS8yMDE5MDgwNjE1NTc0NC4xMDI2
My01LW1lZ291cyU0MG1lZ291cy5jb20uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
