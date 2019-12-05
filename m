Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C51141BC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 14:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E2B6F647;
	Thu,  5 Dec 2019 13:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1C76F647
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 13:41:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g17so3677022wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2019 05:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NqCYdX4qdRT4efoUWlumA86poqrKJOYDLoHT58nl68M=;
 b=lGqz5xO8sPBF5Ic2K+OZGK8VFJmvImO+18tI0X3/UBvy7p9O7eZ3DT2ZN1kWoxPCQS
 21SmLYRf0B+c5r4P3m4j3biZTMuXGCgu+9S4F1o6K5uCP28NZti6Vnz61Kex0E/XGWQD
 gRW2uiqxKH21QZEBd9Wrx2dh0fsBl6lEaOrkgGrSlD+PQgxClEROEFPiZ2ZmSF59zT4r
 Kgsf8Aigz2lc0LcjmUAe/5s8Ujwl66oD+VDD3bsS7HlCHrB3ECETX0Ksc5KVtwnfg48w
 uEDuUGAjLkhSDeb9Xf0AM/l3yaYDnkYhTXPfxtgJxZYAjBq4348PEnQVHakJbuzL6rmS
 VKxQ==
X-Gm-Message-State: APjAAAW7oop/oeciDImHkCbwXMYHl8zHfGyFUw0IU4nNgVvozc88swj9
 Th+j3ah+AENOmZ3poewDA6r2OGVZlTQ=
X-Google-Smtp-Source: APXvYqyUuQWJoMGXr2ldTRRuCQ6ZnsQ7XtZGOch6SRNg7ezgvo5HEbGxUoAVuIr3cPQaXveZPsokxA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr10442319wri.378.1575553290586; 
 Thu, 05 Dec 2019 05:41:30 -0800 (PST)
Received: from dell ([95.147.198.32])
 by smtp.gmail.com with ESMTPSA id t5sm12434067wrr.35.2019.12.05.05.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 05:41:30 -0800 (PST)
Date: Thu, 5 Dec 2019 13:41:21 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] backlight: pwm_bl: Switch to full GPIO descriptor
Message-ID: <20191205134121.GD3468@dell>
References: <20191205081116.5254-1-linus.walleij@linaro.org>
 <CAMpxmJWZ=JC2CRB4YW18uTPverAwNvgY-Phmm-QQWNhJX=55Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMpxmJWZ=JC2CRB4YW18uTPverAwNvgY-Phmm-QQWNhJX=55Sw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=NqCYdX4qdRT4efoUWlumA86poqrKJOYDLoHT58nl68M=;
 b=TzJ8A2WONGfnPkrP5qJR/iYe2B/d5t1p7jXbMPEN0tV7F3vJ+p9kSz5L7l6oZpcXXD
 +/Zj4qC7O6luuSerA00V8C32bVu2Tju36+gEV4GaDLTRV6vmuCPfQFQCCRO4aqbXK/Sy
 kk1N7ou1uLiGD6fdGz5UR39YN8J7o0e/T8+qYCQGc7AmtsMVnipReYIvYHZfZfR482Qc
 mHcfrkIkE+WKsT4N1MIEdhCGXNBSw7mnyVGPS0GY4XUMNLijqxllJHMpuWoTfx5O2ZMS
 Hu73fK+kIJA6r0IKx919kx+cHKqsNON8DFeZtyTUvIv5uTD/JCQiDoohFxhfbnGeeVR3
 keJQ==
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Guan Xuetao <gxt@pku.edu.cn>,
 Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-drm <dri-devel@lists.freedesktop.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAwNSBEZWMgMjAxOSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gY3p3Liwg
NSBncnUgMjAxOSBvIDA5OjExIExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4gbmFwaXNhxYIoYSk6Cj4gPgo+ID4gVGhlIFBXTSBiYWNrbGlnaHQgc3RpbGwgc3VwcG9ydHMg
cGFzc2luZyBhIGVuYWJsZSBHUElPIGxpbmUgYXMKPiA+IHBsYXRmb3JtIGRhdGEgdXNpbmcgdGhl
IGxlZ2FjeSA8bGludXgvZ3Bpby5oPiBBUEkuCj4gPgo+ID4gSXQgdHVybnMgb3V0IHRoYXQgZXZl
ciBib2FyZCB1c2luZyB0aGlzIG1lY2hhbmlzbSBleGNlcHQgb25lCj4gPiBpcyBwYXNzIC5lbmFi
bGVfZ3BpbyA9IC0xLiBTbyB3ZSBkcm9wIGFsbCB0aGVzZSBjYXJnby1jdWx0ZWQgLTEncwo+ID4g
ZnJvbSBhbGwgaW5zdGFuY2VzIG9mIHRoaXMgcGxhdGZvcm0gZGF0YSBpbiB0aGUga2VybmVsLgo+
ID4KPiA+IFRoZSByZW1hbmluZyBib2FyZCwgUGFsbSBUQywgaXMgY29udmVydGVkIHRvIHBhc3Mg
YSBtYWNoaW5lCj4gPiBkZXNjcmlwdGlvciB0YWJsZSB3aXRoIHRoZSAiZW5hYmxlIiBHUElPIGlu
c3RlYWQsIGFuZCBkZWxldGUgdGhlCj4gPiBwbGF0Zm9ybSBkYXRhIGVudHJ5IGZvciBlbmFibGVf
Z3BpbyBhbmQgdGhlIGNvZGUgaGFuZGxpbmcgaXQKPiA+IGFuZCB0aGluZ3Mgc2hvdWxkIHdvcmsg
c21vb3RobHkgd2l0aCB0aGUgbmV3IEFQSS4KPiA+Cj4gPiBDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgo+ID4gQ2M6IFJvYmVydCBKYXJ6bWlrIDxyb2JlcnQuamFyem1p
a0BmcmVlLmZyPgo+ID4gQ2M6IEd1YW4gWHVldGFvIDxneHRAcGt1LmVkdS5jbj4KPiA+IENjOiBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4gU2lnbmVk
LW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+ID4gLS0t
Cj4gPiAgYXJjaC9hcm0vbWFjaC1weGEvY20teDMwMC5jICAgICAgICAgICAgICAgfCAgMSAtCj4g
PiAgYXJjaC9hcm0vbWFjaC1weGEvY29saWJyaS1weGEyNzAtaW5jb21lLmMgfCAgMSAtCj4gPiAg
YXJjaC9hcm0vbWFjaC1weGEvZXp4LmMgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJj
aC9hcm0vbWFjaC1weGEvaHg0NzAwLmMgICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9h
cm0vbWFjaC1weGEvbHBkMjcwLmMgICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0v
bWFjaC1weGEvbWFnaWNpYW4uYyAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFj
aC1weGEvbWFpbnN0b25lLmMgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1w
eGEvbWlvYTcwMS5jICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1weGEv
cGFsbTI3eC5jICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1weGEvcGFs
bXRjLmMgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKysrCj4gPiAgYXJjaC9hcm0vbWFjaC1w
eGEvcGFsbXRlMi5jICAgICAgICAgICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1weGEv
cGNtOTkwLWJhc2Vib2FyZC5jICAgICAgfCAgMSAtCj4gPiAgYXJjaC9hcm0vbWFjaC1weGEvdGF2
b3JldmIuYyAgICAgICAgICAgICAgfCAgMiAtLQo+ID4gIGFyY2gvYXJtL21hY2gtcHhhL3ZpcGVy
LmMgICAgICAgICAgICAgICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtcHhhL3oyLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDIgLS0KPiA+ICBhcmNoL2FybS9tYWNoLXB4YS96eWxvbml0ZS5j
ICAgICAgICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1oMTk0
MC5jICAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1yeDE5NTAu
YyAgICAgICB8ICAxIC0KPiA+ICBhcmNoL2FybS9tYWNoLXMzYzY0eHgvZGV2LWJhY2tsaWdodC5j
ICAgICB8ICAzIC0tLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLWNyYWc2NDEwLmMg
ICAgIHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLWhtdC5jICAgICAgICAg
IHwgIDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtYXJ0cS5jICAgICAgIHwg
IDEgLQo+ID4gIGFyY2gvYXJtL21hY2gtczNjNjR4eC9tYWNoLXNtZGs2NDEwLmMgICAgIHwgIDIg
Ky0KPiA+ICBhcmNoL3VuaWNvcmUzMi9rZXJuZWwvcHV2My1uYjA5MTYuYyAgICAgICB8ICAxIC0K
PiA+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyAgICAgICAgICB8IDE5IC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICBpbmNsdWRlL2xpbnV4L3B3bV9iYWNrbGlnaHQuaCAgICAgICAg
ICAgICB8ICAyIC0tCj4gPiAgMjYgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNDgg
ZGVsZXRpb25zKC0pCj4gCj4gUmV2aWV3ZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+CgpQbGVhc2UgY291bGQgeW91IHNuaXAgeW91ciByZXNwb25z
ZXMuCgpUaGVyZSBpcyBhIGxvdCBvZiBjcnVmdCB0byBnZXQgdGhyb3VnaCBiZWZvcmUgd2UgZmlu
ZCB5b3VyIHJlcGx5LgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
