Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F232ADDE0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 19:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE4689B33;
	Tue, 10 Nov 2020 18:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5860E89B33
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 18:12:31 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v22so3421552edt.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 10:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zVEeBWH4boLoYPklqBLn+QKdlMMMbgHaDTwk4KlhWWs=;
 b=Li4XDRHTakjrDbVZQ2bKwmsB5NCm82pSsM/tNHMYYL+RF/eiGFk6WMolFirb6mSg8K
 K6EagWV4cw9dhzmQgC8z77njTQN+WoprO5r16dNqd8f2VO7P8QGHxoTxW+5ufAUjrpxR
 episNB/yvrqpsFK8f0vJhUPCt5dY0FNo5f/0ykGHciVvJvJSyHZ5CAZpOh7y862SDB5J
 UVoiZ+VnpMJV3UMISc0KNYV9OYw7Chnz1G1Iga3TXpyFoLcyOa8gZWg4/A5Eoc8ExkPZ
 EGIrYtpigeiJZbspcUJfW5sUZALSE1ZNjLQykROF3/rtkegZHk6EUItVMCc0SZ49gYzH
 WC6g==
X-Gm-Message-State: AOAM530bcuXIH7/8hMSmvJAzcW6NSgfD15OA/+ns7/tCIY+U/juD8vdW
 E6+xrZ2PNnVcKabcmggU+eU=
X-Google-Smtp-Source: ABdhPJxgbiurBs3VssnS4U50mTvuqR5WeodLBeUgTpzriGzhl6pyvF7kFoWZWHNfMdQRwfXTVx9n2Q==
X-Received: by 2002:aa7:c546:: with SMTP id s6mr611498edr.114.1605031949981;
 Tue, 10 Nov 2020 10:12:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id qx6sm7768963ejb.10.2020.11.10.10.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 10:12:28 -0800 (PST)
Date: Tue, 10 Nov 2020 19:12:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v8 6/7] ARM: dts: exynos: Add interconnects to Exynos4412
 mixer
Message-ID: <20201110181227.GA23147@kozik-lap>
References: <20201104103657.18007-1-s.nawrocki@samsung.com>
 <CGME20201104103728eucas1p2f671f29ed9eb06d4c6c991b073be092e@eucas1p2.samsung.com>
 <20201104103657.18007-7-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104103657.18007-7-s.nawrocki@samsung.com>
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

T24gV2VkLCBOb3YgMDQsIDIwMjAgYXQgMTE6MzY6NTZBTSArMDEwMCwgU3lsd2VzdGVyIE5hd3Jv
Y2tpIHdyb3RlOgo+IEZyb206IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4K
PiAKPiBUaGlzIHBhdGNoIGFkZHMgYW4gJ2ludGVyY29ubmVjdHMnIHByb3BlcnR5IHRvIEV4eW5v
czQ0MTIgRFRTIGluIG9yZGVyIHRvCj4gZGVjbGFyZSB0aGUgaW50ZXJjb25uZWN0IHBhdGggdXNl
ZCBieSB0aGUgbWl4ZXIuIFBsZWFzZSBub3RlIHRoYXQgdGhlCj4gJ2ludGVyY29ubmVjdC1uYW1l
cycgcHJvcGVydHkgaXMgbm90IG5lZWRlZCB3aGVuIHRoZXJlIGlzIG9ubHkgb25lIHBhdGggaW4K
PiAnaW50ZXJjb25uZWN0cycsIGluIHdoaWNoIGNhc2UgY2FsbGluZyBvZl9pY2NfZ2V0KCkgd2l0
aCBhIE5VTEwgbmFtZSBzaW1wbHkKPiByZXR1cm5zIHRoZSByaWdodCBwYXRoLgo+IAo+IFJldmll
d2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogU3lsd2VzdGVyIE5hd3JvY2tpIDxzLm5hd3JvY2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+IENo
YW5nZXMgZm9yIHY4Li4udjU6Cj4gIC0gbm9uZS4KPiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNDQxMi5kdHNpIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoK
VGhhbmtzLCBhcHBsaWVkIHdpdGggQ2hhbndvbydzIHRhZ3MuCgpCZXN0IHJlZ2FyZHMsCktyenlz
enRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
