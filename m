Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDD92AED9B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 10:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FAA6E02C;
	Wed, 11 Nov 2020 09:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687146E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 09:26:24 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id t11so1504753edj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 01:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OdzB/jIicwSRsIBqe3je5Z5qz8YP6pSQHD6SoGClZyc=;
 b=nnPGhkRRS5D59wrA26umaomaUyj65nEocLEmHQTitsYO6MFcUabozorkv6KEznO24P
 CsrDhjLmLqQgm2VKlqRK4EyP/N4LWeCT4rwKQFC0VmRwRErK7L3VcQTQ1z1dR1Ahpunz
 Pwv+SP10woX/Y0yJ8ijNqw0PTXeCgPyKm+BlGZf4r46Iz5ECWOR/y6PkjLVR+Df9YHYt
 IXD4EJI3Z5agaA9rCNcxgZpW/hBvMx4PlMI5Cy9D43fM85CKQwN4XLtI8DypOliO3+2m
 XsWFO0KtAB/66/gtPeJmVcXVZGTpMRYygaa3JELzOoF7zUnL6oJKgPR4LSlgyckZ37jf
 z9tg==
X-Gm-Message-State: AOAM531FoL7BdGy2tE5mJbgPLxxtww581PJ63JbSrqqDTJqTlRz9Ib/o
 NnmM+KeotRSlk20SI2AMkcE=
X-Google-Smtp-Source: ABdhPJwycZxm4vB3dtSk1cfv3vSWVxzMWnM8OiFZHVme5ZFG51Ffl5xHG5HC9WEEjJoIIV42kr7DPQ==
X-Received: by 2002:a05:6402:b02:: with SMTP id
 bm2mr24912274edb.299.1605086782978; 
 Wed, 11 Nov 2020 01:26:22 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id k4sm639339edq.73.2020.11.11.01.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:26:21 -0800 (PST)
Date: Wed, 11 Nov 2020 10:26:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 11/26] memory: tegra124-emc: Make driver modular
Message-ID: <20201111092619.GD4050@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-12-digetx@gmail.com>
 <20201111090434.GB4050@kozik-lap>
 <f44b64f5-6b08-5f1e-4f9b-a73a1705d493@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f44b64f5-6b08-5f1e-4f9b-a73a1705d493@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMTEsIDIwMjAgYXQgMTI6MTc6MzdQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDExLjExLjIwMjAgMTI6MDQsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+PiAtb2JqLSQoQ09ORklHX1RFR1JBMTI0X0VNQykJCSs9IGNsay10ZWdyYTEyNC1lbWMu
bwo+ID4+ICtvYmotJChDT05GSUdfQVJDSF9URUdSQV8xMjRfU09DKQkrPSBjbGstdGVncmExMjQt
ZW1jLm8KPiA+PiArb2JqLSQoQ09ORklHX0FSQ0hfVEVHUkFfMTMyX1NPQykJKz0gY2xrLXRlZ3Jh
MTI0LWVtYy5vCj4gPiBIb3cgaXMgaXQgcmVsYXRlZCB0byBtb2R1bGFyaXphdGlvbj8gSXQgbG9v
a3MgbGlrZSBkaWZmZXJlbnQgaXNzdWUgaXMKPiA+IGZpeGVkIGhlcmUuCj4gCj4gVGhlIENPTkZJ
R19URUdSQTEyNF9FTUMgbm93IGNvdWxkIGJlICdtJywgd2hpbGUgdGhlIGNsb2NrIGNvZGUgbXVz
dCBiZQo+IGJ1aWx0LWluLiBUaGUgVEVHUkExMjQgRU1DIGRyaXZlciBpcyB1c2VkIGJ5IFQxMjQg
YW5kIFQxMzIgU29Dcy5cCgpNaG1tLCAgdGhlIENPTkZJR19URUdSQTEyNF9FTUMgZGVwZW5kcyBv
biBBUkNIX1RFR1JBXzEyNF9TT0Mgc28gb24gdGhlCmNvbmZpZyAhQVJDSF9URUdSQV8xMjRfU09D
ICYmIEFSQ0hfVEVHUkFfMTMyX1NPQyB0aGlzIHdhcyBub3QKc2VsZWN0ZWQuIE5vdyBpdCB3aWxs
IGJlIHNlbGVjdGVkLgoKPiAKPiAuLi4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvdGVn
cmEvY2xrLmggYi9kcml2ZXJzL2Nsay90ZWdyYS9jbGsuaAo+ID4+IGluZGV4IDZiNTY1ZjZiNWY2
Ni4uMmRhN2M5M2MxYTZjIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvY2xrL3RlZ3JhL2Nsay5o
Cj4gPj4gKysrIGIvZHJpdmVycy9jbGsvdGVncmEvY2xrLmgKPiA+PiBAQCAtODgxLDE4ICs4ODEs
NiBAQCB2b2lkIHRlZ3JhX3N1cGVyX2Nsa19nZW41X2luaXQodm9pZCBfX2lvbWVtICpjbGtfYmFz
ZSwKPiA+PiAgCQkJdm9pZCBfX2lvbWVtICpwbWNfYmFzZSwgc3RydWN0IHRlZ3JhX2NsayAqdGVn
cmFfY2xrcywKPiA+PiAgCQkJc3RydWN0IHRlZ3JhX2Nsa19wbGxfcGFyYW1zICpwbGxfcGFyYW1z
KTsKPiA+PiAgCj4gPj4gLSNpZmRlZiBDT05GSUdfVEVHUkExMjRfRU1DCj4gPj4gLXN0cnVjdCBj
bGsgKnRlZ3JhX2Nsa19yZWdpc3Rlcl9lbWModm9pZCBfX2lvbWVtICpiYXNlLCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLAo+ID4+IC0JCQkJICAgc3BpbmxvY2tfdCAqbG9jayk7Cj4gPj4gLSNlbHNl
Cj4gPj4gLXN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqdGVncmFfY2xrX3JlZ2lzdGVyX2VtYyh2
b2lkIF9faW9tZW0gKmJhc2UsCj4gPj4gLQkJCQkJCSBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAo+
ID4+IC0JCQkJCQkgc3BpbmxvY2tfdCAqbG9jaykKPiA+PiAtewo+ID4+IC0JcmV0dXJuIE5VTEw7
Cj4gPj4gLX0KPiA+PiAtI2VuZGlmCj4gPiBXaHkgY2xvY2sgY2hhbmdlcyBhcmUgc28gdGlnaHRs
eSBjb3VwbGVkIHdpdGggbWFraW5nIGFuIEVNQyBkcml2ZXIKPiA+IG1vZHVsYXI/IFVzdWFsbHkg
dGhpcyBzaG91bGQgYmUgYSBzZXBhcmF0ZSBjaGFuZ2UgLSB5b3UgYWRqdXN0IGFueQo+ID4gZGVw
ZW5kZW5jaWVzIHRvIGFjY2VwdCBsYXRlIG9yIGRlZmVycmVkIHByb2JpbmcsIGV4cG9ydGVkIHN5
bWJvbHMsCj4gPiBsb29zZW4gdGhlIGNvdXBsaW5nIGJldHdlZW4gZHJpdmVycywgZXRjLiBhbmQg
dGhlbiB5b3UgY29udmVydCBzb21ldGhpbmcKPiA+IHRvIG1vZHVsZS4KPiAKPiBCZWNhdXNlIHRo
ZSBjbG9jayBhbmQgRU1DIGRyaXZlciB3ZXJlIG5vdCBzZXBhcmF0ZWQgZnJvbSBlYWNoIG90aGVy
Cj4gcHJldmlvdXNseS4gVGhlIGNsb2NrIHBhcnQgY2FuJ3QgYmUgbW9kdWxhcml6ZWQgZWFzaWx5
IGFuZCBwcm9iYWJseQo+IHNob3VsZG4ndC4KPiAKPiBJJ20gbm90IHN1cmUgd2hldGhlciBpdCdz
IGFjdHVhbGx5IHBvc3NpYmxlIHRvIHNwbGl0IHRoaXMgcGF0Y2ggd2l0aG91dAo+IHRha2luZyBh
IGNsb3NlciBhIGxvb2suCj4gCj4gSSdtIGFsc28gZG91YnQgdGhhdCBpdCB3b3VsZCByZWFsbHkg
d29ydGggdGhlIGVmZm9ydCBmb3IgYSAxMDAgbGluZXMgb2YKPiBhIGNoYW5nZWQgY29kZS4KCklu
ZGVlZCwgdGhlIGNsayBhbmQgZW1jIGRyaXZlcnMgYXJlIHNvIHRpZ2h0bHkgY291cGxlZCB0aGF0
IGFueXdheSBpdAp3b3VsZCBiZSBiaWcgcGF0Y2ggdG8gY2hhbmdlIHRoZSBpbnRlcmZhY2VzIGZv
bGxvd2VkIHVwIGEgc21hbGwgb25lCm1ha2luZyBlbWMgbW9kdWxlLiBPSy4KCkJlc3QgcmVnYXJk
cywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
