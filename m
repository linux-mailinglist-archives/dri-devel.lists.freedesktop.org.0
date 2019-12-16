Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A5120F0D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53546E7EA;
	Mon, 16 Dec 2019 16:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B846E7EA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:16:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so7997591wro.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 08:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=A1ORIVbOXINdlGlfc0c8hM6mHDuDTUrnWDZfvZuttXI=;
 b=iL698bIX+2A1ftxkSmj3PQBlwgzQGHiL4eRu0/Q47Bl1skHp23xDvYbSwTLkGn64sC
 /u9+Tu1JEpzuAp8UmsRn160hn3U8us7PrV4U9y9qOXEWGcMrfxl8rEAZT1vXk3wlq9GK
 w1SIi7N+rkCTRGYJZmOFbYJf4ap70d9nVCgrVejmQZwQi9T+twsMP08ZGPr8Vazy0bSG
 mEnw6w1THkv++iGwdHoz//M33Ix8BMq0wNsWnXDwyxp0V5/IcTpqqxzgo4M3ZY8cfLNy
 o9ged8U2QI0gadfstVpKdseXK4ZlAme3/VmQrD5Do29gM1mvhV75R1Wh3udyIdEqjID+
 tD3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=A1ORIVbOXINdlGlfc0c8hM6mHDuDTUrnWDZfvZuttXI=;
 b=sBHnlzKhHWJU7otUCLVC8jEF/2cteBNw2Tao5Vs2w+rUrI8UmEmIE0kac0/GIRZIE+
 fD2tNFguj67i+PhrOxMmoYpQ6xclf6nMR+B9f1HKaEgV2eOqGtdD8sqFQVyiRqNOITkX
 gLcmpOw2PtldeAfqWG3lz516+QUk5aU3HbPyS3+Cu6ngJlZyR3RODy4TPWfI22i/pI+8
 eDO3SiUuQxKHmpay8j34S9Fctg5U9yJGtsF8Ig5XQutjCH+ThefrK8XMP5K6tjJHfOLF
 6oJOOKR2m6jPKjZzeAxjpmQkComDxd0HZLgM6B7eesjlZLbRqjhHB17KTKSLw9RM3Yix
 herQ==
X-Gm-Message-State: APjAAAVwZ+gL51lFDKlMh/InIi3RqaCQAXEhCfvWH+fDcihpxa3h2B60
 LTQ7BJJOlhMhWYPabTUoKdjH3g==
X-Google-Smtp-Source: APXvYqzWWIBgzEtO+ku7G/o2YB9W6imFMbKNeZAV1alKM1nmlFw5qLsHeOazNsRstqVnznlePa9doQ==
X-Received: by 2002:a5d:6802:: with SMTP id w2mr30523649wru.353.1576512986289; 
 Mon, 16 Dec 2019 08:16:26 -0800 (PST)
Received: from dell ([185.17.149.202])
 by smtp.gmail.com with ESMTPSA id f207sm22744977wme.9.2019.12.16.08.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 08:16:25 -0800 (PST)
Date: Mon, 16 Dec 2019 16:16:20 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] backlight: pwm_bl: Switch to full GPIO descriptor
Message-ID: <20191216161620.GN2369@dell>
References: <20191213102346.9577-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213102346.9577-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBEZWMgMjAxOSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gVGhlIFBXTSBiYWNr
bGlnaHQgc3RpbGwgc3VwcG9ydHMgcGFzc2luZyBhIGVuYWJsZSBHUElPIGxpbmUgYXMKPiBwbGF0
Zm9ybSBkYXRhIHVzaW5nIHRoZSBsZWdhY3kgPGxpbnV4L2dwaW8uaD4gQVBJLgo+IAo+IEl0IHR1
cm5zIG91dCB0aGF0IGV2ZXIgYm9hcmQgdXNpbmcgdGhpcyBtZWNoYW5pc20gZXhjZXB0IG9uZQo+
IGlzIHBhc3MgLmVuYWJsZV9ncGlvID0gLTEuIFNvIHdlIGRyb3AgYWxsIHRoZXNlIGNhcmdvLWN1
bHRlZCAtMSdzCj4gZnJvbSBhbGwgaW5zdGFuY2VzIG9mIHRoaXMgcGxhdGZvcm0gZGF0YSBpbiB0
aGUga2VybmVsLgo+IAo+IFRoZSByZW1hbmluZyBib2FyZCwgUGFsbSBUQywgaXMgY29udmVydGVk
IHRvIHBhc3MgYSBtYWNoaW5lCj4gZGVzY3JpcHRpb3IgdGFibGUgd2l0aCB0aGUgImVuYWJsZSIg
R1BJTyBpbnN0ZWFkLCBhbmQgZGVsZXRlIHRoZQo+IHBsYXRmb3JtIGRhdGEgZW50cnkgZm9yIGVu
YWJsZV9ncGlvIGFuZCB0aGUgY29kZSBoYW5kbGluZyBpdAo+IGFuZCB0aGluZ3Mgc2hvdWxkIHdv
cmsgc21vb3RobHkgd2l0aCB0aGUgbmV3IEFQSS4KPiAKPiBDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgo+IENjOiBSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtA
ZnJlZS5mcj4KPiBDYzogR3VhbiBYdWV0YW8gPGd4dEBwa3UuZWR1LmNuPgo+IFJldmlld2VkLWJ5
OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkhhcHB5
IHRvIGhhbmRsZSB0aGlzLCBidXQgaXQgcmVxdWlyZXMgbW9yZSBBY2tzLgoKPiAtLS0KPiBDaGFu
Z2VMb2cgdjEtPnYyOgo+IC0gTG9jYXRlZCBhIG1pc3NpbmcgcmVtb3ZhbCBvZiAuZW5hYmxlX2dw
aW8gaW4gdGhlIFBhbG0gVEMKPiAgIGJvYXJkIGZpbGUsIHBvaW50ZWQgb3V0IGJ5IERhbmllbC4K
PiAtIEdyZXBwZWQgdG8gYXNjZXJ0YWluIHRoZXJlIGlzIG5vdCBhIHNpbmdsZSBpbnN0YW5jZSBv
Zgo+ICAgdGhlIHN0cmluZyAiZW5hYmxlX2dwaW8iIGluIHRoZSBhZmZlY3RlZCBib2FyZCBmaWxl
cy4KPiAtLS0KPiAgYXJjaC9hcm0vbWFjaC1weGEvY20teDMwMC5jICAgICAgICAgICAgICAgfCAg
MSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL2NvbGlicmktcHhhMjcwLWluY29tZS5jIHwgIDEgLQo+
ICBhcmNoL2FybS9tYWNoLXB4YS9lenguYyAgICAgICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJj
aC9hcm0vbWFjaC1weGEvaHg0NzAwLmMgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJt
L21hY2gtcHhhL2xwZDI3MC5jICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNo
LXB4YS9tYWdpY2lhbi5jICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1weGEv
bWFpbnN0b25lLmMgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL21pb2E3
MDEuYyAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9wYWxtMjd4LmMg
ICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1weGEvcGFsbXRjLmMgICAgICAg
ICAgICAgICAgfCAxMSArKysrKysrKysrLQo+ICBhcmNoL2FybS9tYWNoLXB4YS9wYWxtdGUyLmMg
ICAgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1weGEvcGNtOTkwLWJhc2Vib2Fy
ZC5jICAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL3Rhdm9yZXZiLmMgICAgICAgICAg
ICAgIHwgIDIgLS0KPiAgYXJjaC9hcm0vbWFjaC1weGEvdmlwZXIuYyAgICAgICAgICAgICAgICAg
fCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtcHhhL3oyLmMgICAgICAgICAgICAgICAgICAgIHwgIDIg
LS0KPiAgYXJjaC9hcm0vbWFjaC1weGEvenlsb25pdGUuYyAgICAgICAgICAgICAgfCAgMSAtCj4g
IGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLWgxOTQwLmMgICAgICAgIHwgIDEgLQo+ICBhcmNo
L2FybS9tYWNoLXMzYzI0eHgvbWFjaC1yeDE5NTAuYyAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0v
bWFjaC1zM2M2NHh4L2Rldi1iYWNrbGlnaHQuYyAgICAgfCAgMyAtLS0KPiAgYXJjaC9hcm0vbWFj
aC1zM2M2NHh4L21hY2gtY3JhZzY0MTAuYyAgICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNj
NjR4eC9tYWNoLWhtdC5jICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgv
bWFjaC1zbWFydHEuYyAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L21hY2gt
c21kazY0MTAuYyAgICAgfCAgMiArLQo+ICBhcmNoL3VuaWNvcmUzMi9rZXJuZWwvcHV2My1uYjA5
MTYuYyAgICAgICB8ICAxIC0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgICAg
ICAgICAgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGluY2x1ZGUvbGludXgvcHdtX2JhY2ts
aWdodC5oICAgICAgICAgICAgIHwgIDIgLS0KPiAgMjYgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgNDkgZGVsZXRpb25zKC0pCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
