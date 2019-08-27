Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D79FCF1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4492C89956;
	Wed, 28 Aug 2019 08:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C10989208
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 19:35:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id o11so6804880lfb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 12:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UXGLJL++Z+jdJykH8rs7rNVqniWK7Kl5eR86rOuKOGw=;
 b=hAr482ZmwSxcHbuaU56U0gnAPrRAYT0fy7LmYUT3QRls9nxTzR2RFc4JUz9yBI5xNj
 jikw3Tzo9eXE13j2Xn8hSIIvxYxxJKtU9Ydn8MY3ROmV4e4Q/3RIQkKOgZMV6GpkCDr2
 0TILsSADacjwf3IkF0tjKWUMk4GAMOnGw9vDQDgkBQ7VYYHmVWZR5m/SYKd5tLucgOst
 v0/k9m1Mss2d6lQx8zQCj+hPsrlhE8/BhXQONEqhFbeNMpqeipkCJD4oi5MlPtYtnrui
 zzEwu4lMGuo2FTF49RFA1Jdo2nF6thlVZGPULMXzBInb/QmXzVzenCr8Euc6jH4HTc5F
 EtJQ==
X-Gm-Message-State: APjAAAX0vAvT/X9icosuTd0OVg1bsHzFPThgktaxm9CfExqFhq2it/Av
 6U6l/4zyYNlO6YpF3eKbU7h9qqKQI/fgh6QxPtO1KoDT
X-Google-Smtp-Source: APXvYqz44n52da3eoYkElHaFYDptnCw1Q6JZZG9zzcCSQeDp/vwalBaCRo4z5Wkzsa7sDzYribClOypuoqbErQlvrNA=
X-Received: by 2002:a19:2314:: with SMTP id j20mr51138lfj.22.1566934536390;
 Tue, 27 Aug 2019 12:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190827115850.25731-1-mripard@kernel.org>
 <20190827115850.25731-3-mripard@kernel.org>
In-Reply-To: <20190827115850.25731-3-mripard@kernel.org>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Tue, 27 Aug 2019 21:35:20 +0200
Message-ID: <CAOUEw11cATRw4vRCBFmiVM=pVWnfOk36q9VgK_LX8AgLvK=4OA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/modes: Introduce a whitelist for the named modes
To: Maxime Ripard <mripard@kernel.org>
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UXGLJL++Z+jdJykH8rs7rNVqniWK7Kl5eR86rOuKOGw=;
 b=qkB+0CnRlunkGH9vqvMCjfLtBQjmmcq2F7W9NrZGGoDs3EQUoliX6V+kyjbo4rDlbV
 Wa40yT0Ka4LnM1QlYoEuhY55h/hfPih6KbTIb18QlhKHlIER0YJM0tBta1Mzm7kiVLOa
 WPx6mHw7fANusWA1Nguxod4GAzt2tFCBe1lYiu9v3aAxJgh/Ry7/0f93N1pRR6ks0Pw7
 g4Y3LJdEeMxwxycm0x5XDhRlSYKgcEb4bd5j65QG3s/kGQv3ttWTJAP9LfbAiXKOTwsH
 dybs9KQF/xZON93MikPPhoVG+evF9i7ZzYIb3lr+Dl4uveNxC8v8MHV0ViKvxO28Kpy7
 ZLMw==
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkgbWF4aW1lLAoKT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTo1OSBQTSBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KPgo+IFRoZSBuYW1lZCBtb2RlcyBzdXBwb3J0IGhhcyBp
bnRyb2R1Y2VkIGEgbnVtYmVyIG9mIGdsaXRjaGVzIHRoYXQgd2VyZSBpbgo+IHBhcnQgZHVlIHRv
IHRoZSBmYWN0IHRoYXQgdGhlIHBhcnNlciB3aWxsIHRha2UgYW55IHN0cmluZyBhcyBhIG5hbWVk
IG1vZGUuCj4KPiBTaW5jZSB3ZSBzaG91bGRuJ3QgaGF2ZSBhIGxvdCBvZiBvcHRpb25zIHRoZXJl
IChhbmQgdGhleSBzaG91bGQgYmUgcHJldHR5Cj4gc3RhbmRhcmQpLCBsZXQncyBpbnRyb2R1Y2Ug
YSB3aGl0ZWxpc3Qgb2YgdGhlIGF2YWlsYWJsZSBuYW1lZCBtb2RlcyBzbyB0aGF0Cj4gdGhlIGtl
cm5lbCBjYW4gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGEgcG9vcmx5IGZvcm1lZCBjb21tYW5kIGxp
bmUgYW5kIGEKPiBuYW1lZCBtb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KClRlc3RlZC1ieTogdGhvbWFzIGdyYWljaGVuIDx0
aG9tYXMuZ3JhaWNoZW5AZ21haWwuY29tPgoKQkVGT1JFIChvbmx5ICJbUEFUQ0ggdjUgMDUvMTJd
IGRybS9tb2RlczogUmV3cml0ZSB0aGUgY29tbWFuZCBsaW5lCnBhcnNlciAiIGFwcGxpZWQpOgpt
eSBlYWNobGluayBoNiBtaW5pIHR2IGJveCAod2hpY2ggcmVxdWlyZXMgdGhlIHZpZGVvPUhETUkt
QS0xOmUKY21kbGluZSBvcHRpb24gdG8gZ2l2ZSBhbnkgb3V0cHV0IG9uIGhkbWkpIGRpZCBub3Qg
c2hvdyBhbnkgaGRtaQpvdXRwdXQgYW55IG1vcmUgKGluIDUuMiBpdCBzdGlsbCB3b3JrZWQpCgpB
RlRFUiAodGhlIGFib3ZlIHBhdGNoIHBsdXMgdGhpcyBwYXRjaCBzZXQgaGVyZSBhcHBsaWVkKToK
bXkgZWFjaGxpbmsgaDYgbWluaSB0diBib3ggZ2l2ZXMgb3V0cHV0IG9uIGhkbWkgYWdhaW4uIGkg
YWxzbyBkaWQKY2hlY2sgaXQgdGhlIG90aGVyIHdheSBhcm91bmQ6IGlmIGkgcmVtb3ZlIHRoZSB2
aWRlbz1IRE1JLUEtMTplIG9wdGlvbgppIG5vIGxvbmdlciBnZXQgYW55IGhkbWkgb3V0cHV0IGFz
IGV4cGVjdGVkLiBhcyBhIHJlc3VsdCB0aGlzIHBhdGNoCnNlcmllcyBmaXhlcyB0aGUgcHJvYmxl
bS9yZWdyZXNzaW9uIGZvciBtZS4KCmJlc3Qgd2lzaGVzIC0gdGhvbWFzCgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IGluZGV4IGVh
N2U2YzhjODMxOC4uOTg4Nzk3ZDgwODBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IEBAIC0xNjc3
LDYgKzE2NzcsMjIgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMo
Y2hhciAqc3RyLCBzaXplX3QgbGVuLAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtjb25z
dCBjaGFyICpkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W10gPSB7Cj4gKyAgICAgICAiTlRTQyIs
Cj4gKyAgICAgICAiUEFMIiwKPiArfTsKPiArCj4gK3N0YXRpYyBib29sIGRybV9uYW1lZF9tb2Rl
X2lzX2luX3doaXRlbGlzdChjb25zdCBjaGFyICptb2RlLCB1bnNpZ25lZCBpbnQgc2l6ZSkKPiAr
ewo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJ
WkUoZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdCk7IGkrKykKPiArICAgICAgICAgICAgICAgaWYg
KCFzdHJuY21wKG1vZGUsIGRybV9uYW1lZF9tb2Rlc193aGl0ZWxpc3RbaV0sIHNpemUpKQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICsKPiArICAgICAgIHJldHVybiBm
YWxzZTsKPiArfQo+ICsKPiAgLyoqCj4gICAqIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yIC0gcGFyc2UgY29tbWFuZCBsaW5lIG1vZGVsaW5lIGZvciBjb25uZWN0b3IK
PiAgICogQG1vZGVfb3B0aW9uOiBvcHRpb25hbCBwZXIgY29ubmVjdG9yIG1vZGUgb3B0aW9uCj4g
QEAgLTE3OTQsNiArMTgxMCwxMCBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLAo+ICAgICAgICAgaWYgKG5hbWVk
X21vZGUpIHsKPiAgICAgICAgICAgICAgICAgaWYgKG1vZGVfZW5kICsgMSA+IERSTV9ESVNQTEFZ
X01PREVfTEVOKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4g
KyAgICAgICAgICAgICAgIGlmICghZHJtX25hbWVkX21vZGVfaXNfaW5fd2hpdGVsaXN0KG5hbWUs
IG1vZGVfZW5kKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+
ICAgICAgICAgICAgICAgICBzdHJzY3B5KG1vZGUtPm5hbWUsIG5hbWUsIG1vZGVfZW5kICsgMSk7
Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICByZXQgPSBkcm1fbW9kZV9wYXJz
ZV9jbWRsaW5lX3Jlc19tb2RlKG5hbWUsIG1vZGVfZW5kLAo+IC0tCj4gMi4yMS4wCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
