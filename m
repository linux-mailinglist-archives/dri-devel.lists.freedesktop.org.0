Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56EB3AC25
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE010EAD0;
	Thu, 28 Aug 2025 20:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vWeeHxWu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2944610EAD7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:59:54 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-336ada26e92so7010141fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756414792; x=1757019592; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vcH+lJXlXkzbWh1s+giYmvp9r3m+hUxJ894v+cf3nQo=;
 b=vWeeHxWuKaSFMsirX30ekwGor94XWmYuF/i3zcByitjl6+ORlgXDSFO0d8AYk9mmcM
 gntUGFnZK0AzlFTF+VS8hwk3HvJa+jrYrddjW2X6yn3EfMUC37obMNjM0O+PjJWwsyid
 yDlLBlCPdfoD9EKvPw1brWyzHCqXRgV74dwYvBW9V5IuxDEclp/PEcyaEfXv0FmxKa2T
 MqXvrfea2GkySPJ61d8/eNjzi9DddtNCId+XL+B42JlNPsL+WvuwhfHgNF0fOlgsSPBw
 lE2Zfv6/4dVfcSi0fUNMTYdnBYqFnk6/U/2du8OtRI3PRReWYW8E0Xsi78qadIchTW20
 x5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756414792; x=1757019592;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcH+lJXlXkzbWh1s+giYmvp9r3m+hUxJ894v+cf3nQo=;
 b=FoYwYNY92be59MauKkty2rMioUjKhCxq2HBoKDWZ5s6Mkp2+KGCapURClUDhG+Yz9O
 E4Jd6tKhkt0py0yzD75LUikphLescky+93nu4mvI6EOWHVaktI44zz+1aWjgT9U2X8yy
 OuJZh086ifVoED2e9AWDfEk1nRcu9x2BZ28EL9YkS36OQ3yWWtKcTJAJ+72oibozVTtB
 /UjFLTGnOUtl1We1KZlk6LtItBIidyIT685T1kGNN2tDMtINtC5oMapHN4Gzj+XOtwvs
 n31BkjkEFf/i5sr/nuOz8Q0JnsVWITgn7SBqEQL+pKcIOhZt7hLTiLzdKcSAEwQbvqwt
 glAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURp0+L63xViAHPrpcYVKl390l9J+KGkOedL2bFn5nlEPuQOpnCxbotEhhzsODIeHdxfTah9jERT5c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxz3+AA7sShWuHONXkizXyKzCm+LGx9hIGCPcYxxe/6GDz9UU/w
 r0PH1yPpsItxHIBha+qe2qlqjJ0KEojpVOisF04OXW1tdeTpITwcG/DI42/N3QNfNiy/AVaUc7b
 GYq44avvI2XgiQcpb8Oh6NSyj38DJ1fOydZh7LO8YOQ==
X-Gm-Gg: ASbGncueBTBzhpZtiFsJz2ofVmu6194Go28OKppkRq7YE9aryfXYaOaLfA/VghdvZTT
 S932DJpW0YHqvo24d0TQcfB/GgDIKjeyz6sNhVst1IE/45AgPMBp4RyhhdljYI4bmMoG5/8/vG5
 R5n0nE3eZEVCqzt7ZRr0h4VYxqYu3srvTR1k3Vrbq6lEWhICwvkf8t3nSBwVqQBb/0E1tSHJERR
 BWb0Mo=
X-Google-Smtp-Source: AGHT+IEvCK27Dx3T+NwB4QTV9UIlsAab63smCZ6D7uUks2NtQZowbM82iFbh3N6kvr8t1WPK8CdOU0xtB51L+4ds/dQ=
X-Received: by 2002:a05:651c:3256:10b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-33650ba8612mr48592831fa.0.1756414792241; Thu, 28 Aug 2025
 13:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-9-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-9-507ba4c4b98e@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:59:41 +0200
X-Gm-Features: Ac12FXyoYnYKNXDomZzl4EdS0dXvIhCV2tkZJGb1B6Y1kaQgUA-l_NpqH411N_c
Message-ID: <CACRpkdbg8KYcDpqDKn9fqs+rL9hLK9mGCj0PTXPBGDW7A_AZbw@mail.gmail.com>
Subject: Re: [PATCH 09/37] dt-bindings: pinctrl: apple,pinctrl: Add
 apple,t6020-pinctrl compatible
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>, 
 van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
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

On Thu, Aug 28, 2025 at 4:02=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pinctrl" anymore [1]. Use
> "apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
> and bindings were written for.
>
> The M2 Pro/Max/Ultra SoCs use the same pinctrl hardware, so just add its
> per-SoC compatible using the new base as fallback.
>
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
