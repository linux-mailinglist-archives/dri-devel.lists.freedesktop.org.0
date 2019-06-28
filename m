Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA85A516
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 21:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0323A6E988;
	Fri, 28 Jun 2019 19:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03CE8892CF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 19:22:40 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so14804721ioc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SV3UaGLoeKUQCI7wGZiOfbddOtsjqVsakZX22AHysxE=;
 b=YO/wIB23f4k9amjNzZ/RXodA9OuWSuqSHcNyQ+3Wpaslgl90ZXn/Ydqpv93e3MwTNV
 FUf1IdhRlfR7l4NyZEd76v/NoczFdhbFP5THJ+WlHSfF3oqEM+iT5tYJLKl60V8k2aIK
 0VMwMjoKkrVLNbrja1z0gWZvl5gWtWJ7lWPYWsUo92G7Fw66XMn7BuOoGvgra1fur0f/
 OzdwXBvKlUBEdvbMfkPQiK5ISXQ3V2uSBxKmT2iPlVKP1gU8kX9c7tLvFtXbdRBQ+/ht
 CRWto0t6fRfa0gcDfoCrf3QUVrFOMBm71IciuZGoLII8rwWpg+IfZU5oB88YGFUGX9dm
 bEcQ==
X-Gm-Message-State: APjAAAXN+JG/einaevB/WeDZ82g9tesN2ve/dNthLYlfQxwpkX6ZId8F
 dkyzqS1vkcsMYanQs52vEg==
X-Google-Smtp-Source: APXvYqzFAiaMqX9Kc+pU35sAZ092vTl08ulqOCvMY9sGS0us9aZUSx2qrN6swZfkkImylaZ6IpC8fg==
X-Received: by 2002:a5d:9bc6:: with SMTP id d6mr1291115ion.160.1561749759989; 
 Fri, 28 Jun 2019 12:22:39 -0700 (PDT)
Received: from localhost ([64.188.179.243])
 by smtp.gmail.com with ESMTPSA id c23sm2720600iod.11.2019.06.28.12.22.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 12:22:39 -0700 (PDT)
Date: Fri, 28 Jun 2019 13:22:38 -0600
From: Rob Herring <robh@kernel.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] dt-bindings: backlight: lm3630a: correct schema validation
Message-ID: <20190628192238.GA8617@bogus>
References: <20190520085846.22320-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520085846.22320-1-masneyb@onstation.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMCBNYXkgMjAxOSAwNDo1ODo0NiAtMDQwMCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+
IFRoZSAnI2FkZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnIHByb3BlcnRpZXMgd2VyZSBu
b3QgZGVmaW5lZCBpbgo+IHRoZSBsbTM2MzBhIGJpbmRpbmdzIGFuZCB3b3VsZCBjYXVzZSB0aGUg
Zm9sbG93aW5nIGVycm9yIHdoZW4KPiBhdHRlbXB0aW5nIHRvIHZhbGlkYXRlIHRoZSBleGFtcGxl
cyBhZ2FpbnN0IHRoZSBzY2hlbWE6Cj4gCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2xlZHMvYmFja2xpZ2h0L2xtMzYzMGEtYmFja2xpZ2h0LmV4YW1wbGUuZHQueWFtbDoKPiAn
I2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJl
Z2V4ZXM6Cj4gJ15sZWRAWzAxXSQnLCAncGluY3RybC1bMC05XSsnCj4gCj4gQ29ycmVjdCB0aGlz
IGJ5IGFkZGluZyB0aG9zZSB0d28gcHJvcGVydGllcy4KPiAKPiBXaGlsZSB3ZSdyZSBoZXJlLCBt
b3ZlIHRoZSB0aSxsaW5lYXItbWFwcGluZy1tb2RlIHByb3BlcnR5IHRvIHRoZQo+IGxlZEBbMDFd
IGNoaWxkIG5vZGVzIHRvIGNvcnJlY3QgdGhlIGZvbGxvd2luZyB2YWxpZGF0aW9uIGVycm9yOgo+
IAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sbTM2
MzBhLWJhY2tsaWdodC5leGFtcGxlLmR0LnlhbWw6Cj4gbGVkQDA6ICd0aSxsaW5lYXItbWFwcGlu
Zy1tb2RlJyBkb2VzIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6Cj4gJ3BpbmN0cmwtWzAt
OV0rJwo+IAo+IEZpeGVzOiAzMmZjYjc1YzY2YTAgKCJkdC1iaW5kaW5nczogYmFja2xpZ2h0OiBB
ZGQgbG0zNjMwYSBiaW5kaW5ncyIpCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNu
ZXliQG9uc3RhdGlvbi5vcmc+Cj4gUmVwb3J0ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9sZWRzL2JhY2tsaWdodC9sbTM2MzBhLWJhY2tsaWdodC55
YW1sICAgICB8IDIwICsrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCgpBcHBsaWVkLCB0aGFua3MuCgpSb2IKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
