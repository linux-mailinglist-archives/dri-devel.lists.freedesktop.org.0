Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3365E2A6437
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 13:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9ED86E9A0;
	Wed,  4 Nov 2020 12:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED2E6E9A0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 12:25:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v5so2156399wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 04:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HuTwun2Dnd4h1S4X8KEOzU34Qd2VWJJ944RQvE10wwg=;
 b=jCs2y28q9bj/5PwFDn0WDmlTyTe5Vx6fxofUVZJYmVOjW8+EvXuJWsb2t3bxE4ybXk
 XXAK8sfZUJGeEo3cC2Wj6ue004WNwXd+OHPiWZDbbYjNBARfzFB+9XT2+JnGTEdSJBJc
 bN6v3gmALbKYbxuhTORvxnjZWKxJnDowUXDwmozBj+CsofjjORz3192NTC1foPoP4DvV
 Z0MN9xuC4zJnLSPclNt5t/RM2eYjCo4HpxI0/p1Q/uIstzxm6u+dRdOtE4W5HBTKH7mF
 r2zOgV+BXpws5eXB/tZB6ZPEWz5mvbr7oTfWnufUpNSjHYnegwqO0nfVIx9pW8wkEUDG
 zdvg==
X-Gm-Message-State: AOAM530xO7n8mNZCbBu8oeQNwiSAymxmGXWkOkD2md8wQ75Sgv50pMtd
 CHKzar3SjQTs9+aNOz1dwwg=
X-Google-Smtp-Source: ABdhPJwBZQBsDfz4trT0usXpkjYiPOZwSlK8h5bhMyUCxVi8CreHalUXc9dIF1MFkOTWPFzwF6p2Zw==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr4540134wmf.66.1604492716841; 
 Wed, 04 Nov 2020 04:25:16 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id n4sm2017844wmi.32.2020.11.04.04.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 04:25:15 -0800 (PST)
Date: Wed, 4 Nov 2020 13:25:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 1/7] dt-bindings: devfreq: Add documentation for the
 interconnect properties
Message-ID: <20201104122514.GA10157@kozik-lap>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103718eucas1p1c103f1a96499b03c72e5457ac2542c3d@eucas1p1.samsung.com>
 <20201104103657.18007-2-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104103657.18007-2-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com,
 dri-devel@lists.freedesktop.org, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBOb3YgMDQsIDIwMjAgYXQgMTE6MzY6NTFBTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBuZXcgb3B0aW9uYWwgcHJvcGVydGll
cyBpbiB0aGUgZXh5bm9zIGJ1cyBub2RlczoKPiBpbnRlcmNvbm5lY3RzLCAjaW50ZXJjb25uZWN0
LWNlbGxzLCBzYW1zdW5nLGRhdGEtY2xvY2stcmF0aW8uCj4gVGhlc2UgcHJvcGVydGllcyBhbGxv
dyB0byBzcGVjaWZ5IHRoZSBTb0MgaW50ZXJjb25uZWN0IHN0cnVjdHVyZSB3aGljaAo+IHRoZW4g
YWxsb3dzIHRoZSBpbnRlcmNvbm5lY3QgY29uc3VtZXIgZGV2aWNlcyB0byByZXF1ZXN0IHNwZWNp
ZmljCj4gYmFuZHdpZHRoIHJlcXVpcmVtZW50cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcnR1ciDF
mndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU3lsd2VzdGVy
IE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENoYW5nZXMgZm9yIHY4
Ogo+ICAtIHVwZGF0ZWQgZGVzY3JpcHRpb24gb2YgdGhlIGludGVyY29ubmVjdHMgcHJvcGVydHks
Cj4gIC0gZml4ZWQgdHlwbyBpbiBzYW1zdW5nLGRhdGEtY2xrLXJhdGlvIHByb3BlcnR5IGRlc2Ny
aXB0aW9uLgo+IAo+IENoYW5nZXMgZm9yIHY3Ogo+ICAtIGJ1cy13aWR0aCBwcm9wZXJ0eSByZXBs
YWNlZCB3aXRoIHNhbXN1bmcsZGF0YS1jbG9jay1yYXRpbywKPiAgLSB0aGUgaW50ZXJjb25uZWN0
IGNvbnN1bWVyIGJpbmRpbmdzIHVzZWQgaW5zdGVhZCBvZiB2ZW5kb3Igc3BlY2lmaWMKPiAgICBw
cm9wZXJ0aWVzCj4gCj4gQ2hhbmdlcyBmb3IgdjY6Cj4gIC0gYWRkZWQgZHRzIGV4YW1wbGUgb2Yg
YnVzIGhpZXJhcmNoeSBkZWZpbml0aW9uIGFuZCB0aGUgaW50ZXJjb25uZWN0Cj4gICAgY29uc3Vt
ZXIsCj4gIC0gYWRkZWQgbmV3IGJ1cy13aWR0aCBwcm9wZXJ0eS4KPiAKPiBDaGFuZ2VzIGZvciB2
NToKPiAgLSBleHlub3MsaW50ZXJjb25uZWN0LXBhcmVudC1ub2RlIHJlbmFtZWQgdG8gc2Ftc3Vu
ZyxpbnRlcmNvbm5lY3QtcGFyZW50Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rl
dmZyZXEvZXh5bm9zLWJ1cy50eHQgICAgIHwgNzEgKysrKysrKysrKysrKysrKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCkkgYWxyZWFk
eSBhY2tlZCBpdCBhbmQgdGhlcmUgYXJlIG5vIHNpZ25pZ2ljYW50IGNoYW5nZXMgZnJvbSB2Ny4K
CkFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
