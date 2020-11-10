Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C22ADDDE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 19:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935F2897F5;
	Tue, 10 Nov 2020 18:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AD5897F5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 18:11:59 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id ay21so13782749edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 10:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ObZ+uatBT5aV3E0Ee3Zvvp2n0wcTHU9I6h5xLp1wh8Y=;
 b=iFZ9GJQ7rOK6w8FFJf7dH7ofh/bzIKeN3dgZbhPCUTO62Do5ttluAgeDJqDBiCLrS0
 wDJMNqwoZbTuB9yooJFDd/ev1a0c1uIAEvrmMvMiHcQHoHk/Xfg/193w3JmqQE2Saet7
 X4qWk2LjfqB5oiJVmCRGUSNs7S9U747YGx43/7S2Lmc4JzYW7Ip+2nRmsHcz/O0EOOzz
 FGXGdis1L+uMA9gQB/bRpIzYVSos59WeO0Gtg7HwgTgliHeFuk6Ul87mbWbXrvo6loYR
 uPmuWWyWRylUAQpoq1VhfKzTWmEJH2Zrau6l9/TY5JrCIZs4vMDPeTwYifxxouMzhW6r
 iLOw==
X-Gm-Message-State: AOAM532Ac+UFnIfVk52Pg3qqQ865PwLpgTUUr5rHkjyMSdKxCOscl3Pp
 LzSVGK7AwUCDFuyCJOHPpKQ=
X-Google-Smtp-Source: ABdhPJwH9rjo7WFDRce3ZY6Wa0VD4LphG89cjoxx/d+KTfqVHXT4euGN+saA+HjI7WjxqocCsmFDRA==
X-Received: by 2002:aa7:c546:: with SMTP id s6mr609076edr.114.1605031918334;
 Tue, 10 Nov 2020 10:11:58 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id
 rn28sm11065161ejb.22.2020.11.10.10.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 10:11:57 -0800 (PST)
Date: Tue, 10 Nov 2020 19:11:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 5/7] ARM: dts: exynos: Add interconnect properties to
 Exynos4412 bus nodes
Message-ID: <20201110181155.GA18447@kozik-lap>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103726eucas1p248b51b25f5ee42898bf03e9cb2229c5d@eucas1p2.samsung.com>
 <20201104103657.18007-6-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104103657.18007-6-s.nawrocki@samsung.com>
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

T24gV2VkLCBOb3YgMDQsIDIwMjAgYXQgMTE6MzY6NTVBTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXMgZm9y
IEV4eW5vczQ0MTIgaW50ZXJjb25uZWN0Cj4gYnVzIG5vZGVzOgo+ICAtIGludGVyY29ubmVjdHM6
IHRvIGRlY2xhcmUgY29ubmVjdGlvbnMgYmV0d2VlbiBub2RlcyBpbiBvcmRlciB0bwo+ICAgIGd1
YXJhbnRlZSBQTSBRb1MgcmVxdWlyZW1lbnRzIGJldHdlZW4gbm9kZXMsCj4gIC0gI2ludGVyY29u
bmVjdC1jZWxsczogcmVxdWlyZWQgYnkgdGhlIGludGVyY29ubmVjdCBmcmFtZXdvcmssCj4gIC0g
c2Ftc3VuZyxkYXRhLWNsay1yYXRpbzogd2hpY2ggYWxsb3dzIHRvIHNwZWNpZnkgbWluaW11bSBk
YXRhIGNsb2NrCj4gICAgZnJlcXVlbmN5IGNvcnJlc3BvbmRpbmcgdG8gcmVxdWVzdGVkIGJhbmR3
aWR0aCBmb3IgZWFjaCBidXMuCj4gCj4gTm90ZSB0aGF0ICNpbnRlcmNvbm5lY3QtY2VsbHMgaXMg
YWx3YXlzIHplcm8gYW5kIG5vZGUgSURzIGFyZSBub3QKPiBoYXJkY29kZWQgYW55d2hlcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFN5bHdlc3RlciBOYXdyb2NraSA8cy5uYXdyb2NraUBzYW1zdW5nLmNv
bT4KPiAtLS0KPiBDaGFuZ2VzIGZvciB2ODoKPiAgLSBub25lLgo+IAo+IENoYW5nZXMgZm9yIHY3
Ogo+ICAtIGFkanVzdGVkIHRvIHRoZSBEVCBwcm9wZXJ0eSBjaGFuZ2VzOiAiaW50ZXJjb25uZWN0
cyIgaW5zdGVhZAo+ICAgIG9mICJzYW1zdW5nLGludGVyY29ubmVjdC1wYXJlbnQiLCAic2Ftc3Vu
ZyxkYXRhLWNsay1yYXRpbyIKPiAgICBpbnN0ZWFkIG9mICJidXMtd2lkdGgiLgo+IAo+IENoYW5n
ZXMgZm9yIHY2Ogo+ICAtIGFkZGVkIGJ1cy13aWR0aCBwcm9wZXJ0eSBpbiBidXNfZG1jIG5vZGUu
Cj4gCj4gQ2hhbmdlcyBmb3IgdjU6Cj4gIC0gYWRqdXN0IHRvIHJlbmFtZWQgZXh5bm9zLGludGVy
Y29ubmVjdC1wYXJlbnQtbm9kZSBwcm9wZXJ0eSwKPiAgLSBhZGQgcHJvcGVydGllcyBpbiBjb21t
b24gZXh5bm9zNDQxMi5kdHNpIGZpbGUgcmF0aGVyIHRoYW4KPiAgICBpbiBPZHJvaWQgc3BlY2lm
aWMgb2Ryb2lkNDQxMi1vZHJvaWQtY29tbW9uLmR0c2kuCj4gLS0tCj4gIGFyY2gvYXJtL2Jvb3Qv
ZHRzL2V4eW5vczQ0MTIuZHRzaSB8IDYgKysrKysrCgpUaGFua3MsIGFwcGxpZWQgd2l0aCBDaGFu
d29vJ3MgdGFncy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
