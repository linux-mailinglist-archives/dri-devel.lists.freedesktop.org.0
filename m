Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A479F9289
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906CD10E117;
	Fri, 20 Dec 2024 12:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YMD5nzf1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A538510E117
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 12:50:27 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e399e3310so1994619e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 04:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734699026; x=1735303826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23yyLAUmU38oAd1esFZmS79hTf3OpT0gcNBA6YL/4Qk=;
 b=YMD5nzf1qlHyqAWCGmi4wgvYHjnTy2YHd+tQcjI59idwwNNWCzq3fqHxo7PSHkavtP
 K5rGOJsGMSzuASZMWxS6wnxqESqK8+eCQC/yx9Fhz911UIPhCFaaKs248PB3rW6M8+q8
 QGeUs1YN+qy6JiRu5hUlJxBQLQ1FJY14KkjX0rvo6M4sH2PEO5TRQvzTi2KpAewS+VrF
 8g29X6q9eWm0qr9mP1DfVAY6sIElpreCfiPa+Q8og8fUR5YKbqqvc3od0iEf5o9blFn+
 VK0YWRPx8TJvV4G5CUNNiru2ZVcmpARf0udfoGtXRN2cQc5PHfGq7cGIzA+8juzGaEH3
 i+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734699026; x=1735303826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23yyLAUmU38oAd1esFZmS79hTf3OpT0gcNBA6YL/4Qk=;
 b=aQfzUUwwmQLMgbTNAsDmX0riVMY41ijO+zi6yNobQhXnLZCYPq6fFdpFMi6NU3Ioy0
 8tWGTWKMocRIgme4pG29pJYn1duqOdyO0zFsoVp3jo9KFI0WueZqq7JMnjTWWuyp1N9d
 FW8O2VCwlZJcN669Ojw1ia+9EFKNnBwSUm4G6MigtNMbnJdigor8NZf78/803a0RtJ3G
 A7zOZFvlsaB+JG02wbi1KFUt0zQJfKn8rbO2ThxuBokkTEQ102uoalQ/wAtmY+9wNJhz
 F7wDGCHnpib62ZLwgtUnj4X2OGy23h0FmG5S/7oBp4PsQh3T8e7ccUKvq7l0EmrXRKpd
 LTrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMaQxrqVjvdQCoxj1GLZVItLOCIMWwMD8e+Pg44q6/ybYjHfpfiHFDX6LCBUYUxqYUftyuORA+Uak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqFhosXlTJuovDdXi0T676MLpZkZqc8s+9ngOOUIUF3/oS61ga
 8/xRNT4lOmPr+/fhQEEz0AkYr7N6nqJjXLRwX8PT9iJNjMQD542C6glqb8mdeiLV4OzHqqR5qJN
 5xRc4RYXLrT0yuysEEYiYvLsLF9A66NEt8Axwag==
X-Gm-Gg: ASbGncuKapp/XBvvLZNgUX49oEUgGoFgDw7KMxQkrWYSpGYIr+eLNUd7xWLUVdkEk3D
 sMRv7oqHs62jBN3UT8SJHRZIXNmk4EP3vLR8P8w==
X-Google-Smtp-Source: AGHT+IEq0umBuo+QunFadHysq7OsYI2Y7tvIXeWw5zlZVNnR52GFnztmzdoIaD2+Oknhcicnm0deL9Ked/qTjsh4Vwo=
X-Received: by 2002:a05:6512:3a91:b0:540:2a6e:3882 with SMTP id
 2adb3069b0e04-5422953c3a4mr859365e87.29.1734699025929; Fri, 20 Dec 2024
 04:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:50:14 +0100
Message-ID: <CACRpkdaB9kqcjmhaXd5RxpYvqdSVMZkj0wHAtEgdqDs03+wzJg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit gpio-line-names
 property
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org
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

On Thu, Dec 12, 2024 at 7:36=E2=80=AFPM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:

> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
>
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Perhaps Bartosz can just apply this one patch separately?

Yours,
Linus Walleij
