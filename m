Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E22A12279
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 12:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFC410E5E5;
	Wed, 15 Jan 2025 11:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PNjfUYrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3DB10E61C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:23:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3061513d353so37716431fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736940135; x=1737544935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
 b=PNjfUYrXtUDnCf/yqz5MHEKacbMG785gMn4r05+w/sRy+VsKFn1AfdiE2q/7PqLeDO
 qv8uL76Tk/e8QYvAhPPH9iqjQLcwpM2CqRYe1ugKHPdirFxuF2lTG1xo8bv0XzbTVvKt
 VddTDX0flTBqz1Y4MrOU9tk4LNf3ROk2oYSjziJyhpmDWqpySrKPMb90jP0PX1LeiEfI
 sRYNz+lnbVqsFrN1IFkorZm/x0yAE+fzl2T7ohaPOHxp5/GpmGgC+16k17ulD7i2wUzA
 JgXut/JgPPwMJHQXPQVRkNQY3cPIvBZSlBX5WPA2GajLza1NPTdT/qh+gr83zGD7rWqf
 txeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736940135; x=1737544935;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4mhub1WX6NRFjMXtQbcreIaC8K21PQR5uxWQxNvn/uQ=;
 b=JzzLIFDoXXF1Ezp2JDaGjtC+1LMXKlr+Jx+9qvhp6WpZUvw6fjD0aRmTUH1OPd8CQ6
 sPoFoPGhevJXEsD9QXStP88tjnKUZzmvu8o66wHlA88NwDLVRE0CpMuewzxiD11ukfzv
 9dmrMD7gvzknn59Kvw6nnt46Puglw7OdkKZkQEAX4HUtygAj1IcEDAl32NWWLDgMZD0g
 RGzsSOFRTrXfMY6S7GCLYfgAqrdVWKblc0GtJ7dMD1cMYqvwtCSZq8OOb1Zw7ZGDVNpO
 k7QWnPePV/gRtYSCnE8UcLJ6t4pdSWKE7v4lsyNmZMvcayLYtQIUZoP7IjItUy/kmwZe
 u3vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUD3mFDoyYceMhM0wfSZnXnH3/Fx91HumToPiOi95KD3R7112clGhqklY5svKbeLcGq+UVbhsk1K0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXE0h2FvX6X3mThuIlMECVWDYrxB5VW2ax1ca4D88ux3StJAcZ
 /fvOlDd4rUtyERDP3RxRDTc11fZ1BJcZsrAp2rcH3+KPYuqwh4PwZBU77PSUUYooGt6aRsVNhfV
 ELIS31nNcGYMgEbu0yu/03Us5SER9I9X8uJiEpQ==
X-Gm-Gg: ASbGnctMA8WX0ZyNQuLZwPoJ+IDDBiGdXSDFue/vomkPcrJ4ASfiZtuGKsxHpH+xbJP
 vJXEA7n3hUB6Ni667jD9n6b1b4SkJdhnQ7erevg==
X-Google-Smtp-Source: AGHT+IFi9OUFsDG/HwAOWZDy5wxB1IFMes6uWrSDrSs8fqZfUq6g94ydbqgtsgXawPRPPFqiHwnnVYJjpekX/j3mPrc=
X-Received: by 2002:a05:651c:2124:b0:300:15f1:cd5c with SMTP id
 38308e7fff4ca-305f45cccbfmr89843831fa.17.1736940135230; Wed, 15 Jan 2025
 03:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com>
 <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:22:03 +0100
X-Gm-Features: AbW1kvZR9tBuaRtZ7bNclb8qOifwSWdiMNHG0XPYW6GVaemjAImZEkZB8O3eBOg
Message-ID: <CACRpkdbZYFaTHoOAy7DYpaV77Tf31H4bF179OrperU6UGys2ew@mail.gmail.com>
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for
 a100/a133
To: Andre Przywara <andre.przywara@arm.com>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2025 at 5:00=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:

> Linus, in contrast to what I originally thought, this patch *is* fine, so
> feel free to keep it in your tree.
> Sorry for the noise!

Phew thanks Andre, I would have pulled it out otherwise so it's no
big deal, I'm just happy about active maintainers!

Yours,
Linus Walleij
