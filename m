Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DD7B3AC1A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 22:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E631B10EACB;
	Thu, 28 Aug 2025 20:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o9FD5qD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2575610EACB
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 20:59:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-55f467f3c06so1158527e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756414773; x=1757019573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
 b=o9FD5qD3arYqPd852n6F0X0AxfHCnUpCR9yNXRIZVsk/9saetXuOfe/S5/IMfOS7Pc
 7i83JdomtL/50Tjw2UoklfJp8NfSakqNomowdcperAsdL3uvphJUbidvCfFQF+Vn9DZz
 amtnXkBZB36JOk/OEimlmN8RehPKsoG6HEF0GPpXxqdBVB4t0aUXc/x0R7I3eD+J9LhT
 fr7tuLRW2Gx9QW3SRFfE4/p3NsPkit/7EV2+WfPcL81hGGQcfG68zr4yrxmuVdofi/V6
 OzDBkZ9x/SAwGCKs8dfTcj0ibUN3MgLhIdSYoZwVI2ptau1o0rp1Wci83g8sX+fhBo/y
 HD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756414773; x=1757019573;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
 b=vr8oIUOHe4X15YjBIajO6PLL7NUKcN8mK4lWP0SSsoAF20QE+1Vzh6vFaBXwgWBaq4
 lj0vR/u1hsj06TThz9tHGUUbqrm8dZGDBGH2150FEdiAOt6Ha8lLENwDBkVOajYqtS2g
 KHR7jDecyUOdR+73sFXhQhZfudwWJq2Ullzx6xqCLobPAEMu+fW0D2SLspBEGxb56dt8
 7Q5EE//6SAGbCngI/umW74ynwFUD8VNDXWcWmPHbCQ6rrlDZhomc7UJ9CrB2Br4x4g2f
 7PjRiwXiszKqun78E0rGF5mWVpBeyQiHULLp45ZwuLo9EGPrkXKRFLyFW/R898ofAxrI
 C1DA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzaAcGQmvQrB6DGH66ULg1Ji8QDlbL3O+ixnZrIeza59vI90iJbxLaM/ciFMVuxysnKpC03EJj5MM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdLC4iS2XVtjLK0o2K5dyJLY8RgWrULNCsjCOG0GwBLH1aD4H4
 lQcOnB8lCpryCZTdgGM8QlPwP5DedvugpyGXJ1gU3xWwoJPaZ9xjRUzga81bGqCQnMTVlt1ZoBD
 eoNLRDQT3YGVjMyTgYeHGj1NxBUc/jzuSBra0vqz0ow==
X-Gm-Gg: ASbGncufYJjSmvs+Mf6wHo+F1RPAhx0WZRNq6pZ91asHqM2IhR7twFoqYIjlsc9ZrI5
 fODlX0p4jykSGGLX+9AadvWTMv7ETgo0r2gQaLGT+fPpkozcwy6vdu4LikjtejdQOMeO2IoBFji
 5cRL4xL2CCV7oPOME58k4tWuVVHoRkTe0eA3Dq0tr2mTuGC6qrbxAEX0Jw7I4KxthzmOmXMEjp4
 KGA10A=
X-Google-Smtp-Source: AGHT+IGkAeRfSepttrAWspST3WxeFhzvmsQkOJn8zGWgyydoFU7mfe7dFpmDKHnPoU/jmN1MyfkA6699WvyfKPSV4Ms=
X-Received: by 2002:a05:6512:6301:b0:55f:503c:d322 with SMTP id
 2adb3069b0e04-55f503cd585mr2344975e87.40.1756414773211; Thu, 28 Aug 2025
 13:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:59:22 +0200
X-Gm-Features: Ac12FXwdi56r5WxKQlnuWh0e5CWqxbReZCdYkWbkMywpfjpFF5zgYMlMEAzYzgg
Message-ID: <CACRpkdbvLhTQ8EujGg9QMbuGVRDnH9ApVxVt1NdmSmPw77QXdA@mail.gmail.com>
Subject: Re: [PATCH 08/37] pinctrl: apple: Add "apple,
 t8103-pinctrl" as compatible
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
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
