Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7449B9582
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 18:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DD56FD56;
	Fri, 20 Sep 2019 16:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC5B6FD56
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:23:55 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA6B920C01
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:23:54 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id b2so6651488otq.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:23:54 -0700 (PDT)
X-Gm-Message-State: APjAAAU899JXYi05GVfBESTqTO6H9yvtoBROKfShil10jrxLZ/mt47yQ
 3A8SuHh6HKI+vMlxxgn87PYggdB7q/H2yFvJXhU=
X-Google-Smtp-Source: APXvYqzVXOyysg9607AyFbe3o2oRNE6mFVRauJhZAfa1N2RVl6I/Rt2f5iakVGo4VwLzm014Px6jKLwO2nAgy6rn4nA=
X-Received: by 2002:a9d:6c9a:: with SMTP id c26mr12313571otr.241.1568996634274; 
 Fri, 20 Sep 2019 09:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190918173141.4314-1-krzk@kernel.org>
 <20190918173141.4314-5-krzk@kernel.org>
In-Reply-To: <20190918173141.4314-5-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 20 Sep 2019 18:23:41 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfQFg5wC-JcHUs8btYJRfpC=NW2FOpWTHkTD6zekzHV0A@mail.gmail.com>
Message-ID: <CAJKOXPfQFg5wC-JcHUs8btYJRfpC=NW2FOpWTHkTD6zekzHV0A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-pwm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568996635;
 bh=SDWrzZuVG71v0J2X6nPbnKE1kFEZUtHXnpXPTYAQdcM=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=Y0NPYxXS5lxvCc5BrOJBS+38DHx4Vw4tGLuccuPjWhQHZjLN1+SP2QJbwffe6Fo6R
 SGaBxYr0YFTOcZZ74KP24FDLyP9h6k+pQ2VXu9tF4gCqFBfBD4s3DyPTPENUcLZ1/t
 wlNhYEZpL/2F2pyw54AFDUqkleli+20BjzwXfEhY=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAxOCBTZXAgMjAxOSBhdCAxOTozMiwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IENvbnZlcnQgU2Ftc3VuZyBTM0MvUzVQL0V4eW5vcyB3YXRj
aGRvZyBiaW5kaW5ncyB0byBEVCBzY2hlbWEgZm9ybWF0Cj4gdXNpbmcganNvbi1zY2hlbWEuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4K
PiAtLS0KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gSW5kZW50IGV4YW1wbGUgd2l0aCBmb3Vy
IHNwYWNlcyAobW9yZSByZWFkYWJsZSksCj4gMi4gUmVtb3ZlIHVubmVlZGVkIHRpbWVvdXQtc2Vj
IGRlc2NyaXB0aW9uLgoKU3VwZXJzZWRlZCBieSB2MyAoYWx0aG91Z2ggbmFtZWQgdjIuLi4pLgoK
QmVzdCByZWdhcmRzLApLcnp5c3p0b2YKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
