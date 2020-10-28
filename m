Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE029D1B3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 20:28:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC9D6E323;
	Wed, 28 Oct 2020 19:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64406E323
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 19:28:26 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id x1so703098eds.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 12:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vP95c5G5AiWt8jFAMoFHGwxXSql0kCQrJ9xpkPgq6gg=;
 b=Q/87pBiI4fpZqtIU5Q3RaA7rlBe+NAEt8rKRTvJmOfKNis0D7iiHdJiuaE6HSrPb5S
 fLQqr+AoEdk8rb4rBnPQnR9/61WzRRZH+wB/rmHXHghfx+UZO2VwsUOmuqtkMU6W1Bpo
 +Z3o+o8qPbFO+ExTeF6bGFMMhANBCHs0wAdqTCYhdtwXEfTQ3X+CUWGiJvyPDMZfsgwj
 xejl28XY4WGF7rZqSbxo3JhJTwqb9fGtVYM5fUmjpQdATL98+p/On5VgdnRMxNSJEv2C
 oXbFGU+lZMubxsOeh2bEEvS9TodJjJtZSzv1rIgMapPlXNfSGEfqcP4WZV3Ax8W9srDq
 kU4w==
X-Gm-Message-State: AOAM53233msnryRi/pGy5n9Rh9lpuXztyYVATMeMKXqi1PdJ8hc4We7u
 HEXS0iCDrusKhb64xIFiohw=
X-Google-Smtp-Source: ABdhPJyHdwuuiwRcW53qYzu6ELBzFaASak8bZZ7cUJm7qaJ+2lCiPhJEUbxJ3cDKZqX83Q9tfRG3aQ==
X-Received: by 2002:a05:6402:134c:: with SMTP id
 y12mr460552edw.344.1603913305471; 
 Wed, 28 Oct 2020 12:28:25 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id p1sm261722ejd.33.2020.10.28.12.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 12:28:23 -0700 (PDT)
Date: Wed, 28 Oct 2020 20:28:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 41/52] memory: tegra124-emc: Use
 devm_platform_ioremap_resource()
Message-ID: <20201028192821.GB170285@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-42-digetx@gmail.com>
 <20201027102707.GC17089@kozik-lap>
 <d79e4972-acf9-f889-50b8-f0829a0e8e08@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d79e4972-acf9-f889-50b8-f0829a0e8e08@gmail.com>
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjcsIDIwMjAgYXQgMTE6MzA6MzFQTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI3LjEwLjIwMjAgMTM6MjcsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXR
gjoKPiA+IE9uIE1vbiwgT2N0IDI2LCAyMDIwIGF0IDAxOjE3OjI0QU0gKzAzMDAsIERtaXRyeSBP
c2lwZW5rbyB3cm90ZToKPiA+PiBVc2UgZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkg
aGVscGVyIHdoaWNoIG1ha2VzIGNvZGUgYSBiaXQKPiA+PiBjbGVhbmVyLgo+ID4gCj4gPiBTdWNo
IGNsZWFudXBzIChhbmQgZmV3IG90aGVyIGluIHRoaXMgcGF0Y2hzZXQpIHNob3VsZCBiZSBhdCBi
ZWdpbm5pbmcgb2YKPiA+IHBhdGNoc2V0IG9yIGV2ZW4gYXMgcGFydCBvZiBhIHNlcGFyYXRlIG9u
ZS4gIEkgdGhpbmsgdGhlcmUgaXMgbm90IG11Y2gKPiA+IHN0b3BwaW5nIGFueW9uZSBmcm9tIGFw
cGx5aW5nIHRoZXNlLi4uIGV4Y2VwdCB0aGF0IHlvdSBwdXQgdGhlbSBpbiB0aGUKPiA+IG1pZGRs
ZSBvZiBiaWcgZGVwZW5kZW5jeS4KPiAKPiBTb21lIG9mIHRoZXNlIGNsZWFudXAgcGF0Y2hlcyBj
YW4ndCBiZSBhcHBsaWVkIHNlcGFyYXRlbHkgd2l0aG91dCBhIG5lZWQKPiB0byBtYWtlIGEgcmVi
YXNlLiBJIHRoaW5rIGl0IHNob3VsZCBiZSBtb3JlIHByZWZlcnJlZCB0byBoYXZlIGFsbCB0aGUK
PiBwYXRjaGVzIHdpdGhpbiBhIHNpbmdsZSBzZXJpZXMuCj4gCj4gSSdsbCB0cnkgdG8gcmVvcmRl
ciB0aGUgcGF0Y2hlcyBpbiB2NyBpZiB0aGlzIHdpbGwgZWFzZSB0aGUgcmV2aWV3LCB0aGFua3Mu
CgpJZiBmZWFzaWJsZSwgdGhhdCB3b3VsZCBiZSBnb29kLiBUaGFua3MuCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
