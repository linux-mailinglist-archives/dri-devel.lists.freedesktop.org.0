Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49BCFA61
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 14:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229289F8E;
	Tue,  8 Oct 2019 12:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A7A89F8E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 12:50:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m18so3013419wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 05:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bFWMwkdfgSlqbJTIDocqKJvGwcD57UaC11+rFmnz6Kc=;
 b=JejNZjTA6EqyAKhiHasHPTQx1z7L1cjvAH6PCLuHNTC2fh8xfGy3SuROzsksql9qSm
 ooUYuoKibawn8Otfka73XU0CzCIwj1QYO0tQjYCoe6pd9rDxiE/pZeS43pWw/CO6Ca8o
 M7AMEnbKkg/Sqb+wlX8JBQZ0FrznoRSg7ZAUCm7/clmiaP504FLqF2mlWvAwrZMAsBGm
 shCrPUVygk3IiwT9YqRUvYxVsrkdLz9eMdZQyyiTMocRwNjaUBmEq6zoOToAuUGbNvLI
 XRJ+5lgJ12lMUIQh7lPD84I1xwn0WU2C4fROqtUEG9Ul09MTzdNHTaYw06HENwD+onBk
 JezQ==
X-Gm-Message-State: APjAAAXOUcP1G7oNOXt+/sYbo/RKhWSSg4MylbtG+i056HyDy3OJ4r9V
 78uxWK0E7Fj1FTS/BO1WoPY=
X-Google-Smtp-Source: APXvYqynsGw67zM/kLC2+YxQ7cWPgz0Fnub1csInHDDTqUjZRtD9OaXw2dWRP/82MQmeVhcp3vQOIg==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr3469466wmj.4.1570539043033;
 Tue, 08 Oct 2019 05:50:43 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
 by smtp.googlemail.com with ESMTPSA id 63sm24153438wri.25.2019.10.08.05.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 05:50:42 -0700 (PDT)
Date: Tue, 8 Oct 2019 14:50:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Force clkoutN names to be
 unique in PMU
Message-ID: <20191008125038.GA2550@pi3>
References: <20191004151414.8458-1-krzk@kernel.org>
 <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJDTcHu5oXG6zszGHCBhTE6EW94AANUjyMV78SkKcn5yA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMDgsIDIwMTkgYXQgMDc6Mzg6MTRBTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgNCwgMjAxOSBhdCAxMDoxNCBBTSBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBjbGtvdXROIG5hbWVzIG9mIGNs
b2NrcyBtdXN0IGJlIHVuaXF1ZSBiZWNhdXNlIHRoZXkgcmVwcmVzZW50Cj4gPiB1bmlxdWUgaW5w
dXRzIG9mIGNsb2NrIG11bHRpcGxleGVyLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbCB8IDYgKysrKy0tCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5n
L3BtdS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1zdW5n
L3BtdS55YW1sCj4gPiBpbmRleCA3M2I1NmZjNWJmNTguLmQ4ZTAzNzE2ZjVkMiAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUu
eWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zYW1z
dW5nL3BtdS55YW1sCj4gPiBAQCAtNTMsOCArNTMsMTAgQEAgcHJvcGVydGllczoKPiA+ICAgICAg
ICBMaXN0IG9mIGNsb2NrIG5hbWVzIGZvciBwYXJ0aWN1bGFyIENMS09VVCBtdXggaW5wdXRzCj4g
PiAgICAgIG1pbkl0ZW1zOiAxCj4gPiAgICAgIG1heEl0ZW1zOiAzMgo+ID4gLSAgICBpdGVtczoK
PiA+IC0gICAgICBwYXR0ZXJuOiAnXmNsa291dChbMC05XXxbMTJdWzAtOV18M1swLTFdKSQnCj4g
PiArICAgIGFsbE9mOgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIHBhdHRlcm46
ICdeY2xrb3V0KFswLTldfFsxMl1bMC05XXwzWzAtMV0pJCcKPiA+ICsgICAgICAtIHVuaXF1ZUl0
ZW1zOiB0cnVlCj4gCj4gWW91IHNob3VsZG4ndCBuZWVkIHRoZSAnYWxsT2YnLCBqdXN0IGFkZCB1
bmlxdWVJdGVtcyBhdCB0aGUgc2FtZSBsZXZlbCBhcyBpdGVtcy4KCklmIHlvdSBtZWFuIHNvbWV0
aGluZyBsaWtlOgogIDU2ICAgICB1bmlxdWVJdGVtczogdHJ1ZQogIDU3ICAgICBpdGVtczoKICA1
OCAgICAgICBwYXR0ZXJuOiAnXmNsa291dChbMC05XXxbMTJdWzAtOV18M1swLTFdKSQnCgpUaGVu
IHRoZSBkdF9iaW5kaW5nX2NoZWNrIGZhaWxzOgoKZGV2L2xpbnV4L0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9wbXUueWFtbDogcHJvcGVydGllczpjbG9jay1u
YW1lczoKJ3VuaXF1ZUl0ZW1zJyBpcyBub3Qgb25lIG9mIFsnJHJlZicsICdhZGRpdGlvbmFsSXRl
bXMnLCAnYWRkaXRpb25hbFByb3BlcnRpZXMnLCAnYWxsT2YnLCAnYW55T2YnLCAnY29uc3QnLCAn
Y29udGFpbnMnLCAnZGVmYXVsdCcsICdkZXBlbmRlbmNpZXMnLCAnZGVwcmVjYXRlZCcsICdkZXNj
cmlwdGlvbicsICdlbHNlJywgJ2VudW0nLCAnaXRlbXMnLCAnaWYnLCAnbWluSXRlbXMnLCAnbWlu
aW11bScsICdtYXhJdGVtcycsICdtYXhpbXVtJywgJ25vdCcsICdvbmVPZicsICdwYXR0ZXJuJywg
J3BhdHRlcm5Qcm9wZXJ0aWVzJywgJ3Byb3BlcnRpZXMnLCAncmVxdWlyZWQnLCAndGhlbicsICd0
eXBlJywgJ3R5cGVTaXplJywgJ3VuZXZhbHVhdGVkUHJvcGVydGllcyddCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
