Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D51CADED
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 20:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFF76EA37;
	Thu,  3 Oct 2019 18:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB6A56EA37
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 18:16:00 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6F22070B;
 Thu,  3 Oct 2019 18:16:00 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20191002164047.14499-1-krzk@kernel.org>
References: <20191002164047.14499-1-krzk@kernel.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: pwm: Convert PWM bindings to
 json-schema
User-Agent: alot/0.8.1
Date: Thu, 03 Oct 2019 11:15:59 -0700
Message-Id: <20191003181600.7D6F22070B@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1570126560;
 bh=nY0LFXVk/SNSsj/nGuYEk8lLimBHZ/kip/5QktLE30M=;
 h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
 b=2gRfkDNay4GQ8GVL40xt/FVRFNW/T6303w/jbXj7QQJVtdz7LzvfbC54mYR4mS8r6
 KQrbne3Qg2j5ZURd8qpfR/Rh1gEJ2uKXn/h1RYTKEuhbn9SwE6Q8jFz72JIOLIqf2W
 RxAgIOfeWXuJqXwwCg4HHAy4gJrGQtAqfIWHrd38=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBLcnp5c3p0b2YgS296bG93c2tpICgyMDE5LTEwLTAyIDA5OjQwOjQ2KQo+IENvbnZl
cnQgZ2VuZXJpYyBQV00gYmluZGluZ3MgdG8gRFQgc2NoZW1hIGZvcm1hdCB1c2luZyBqc29uLXNj
aGVtYS4gIFRoZQo+IGNvbnN1bWVyIGJpbmRpbmdzIGFyZSBzcGxpdCB0byBzZXBhcmF0ZSBmaWxl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4KPiAKPiAtLS0KPiAKPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IDEuIENoYW5nZSBhbHNvIHB3bS1z
cHJkLnR4dAo+IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gSW5kZW50IGV4YW1wbGUgd2l0aCBm
b3VyIHNwYWNlcyAobW9yZSByZWFkYWJsZSksCj4gMi4gQ2hhbmdlIHBhdHRlcm4gZm9yIHB3bSBu
b2RlcywKPiAzLiBSZW1vdmUgJHJlZiBmcm9tICNjZWxscy4KPiAtLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svcHdtLWNsb2NrLnR4dCAgIHwgIDIgKy0KCkFja2VkLWJ5OiBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
