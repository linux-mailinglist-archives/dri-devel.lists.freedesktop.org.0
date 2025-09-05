Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123A1B453DF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BB810EB61;
	Fri,  5 Sep 2025 09:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ebQxaQjd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6403710EB61
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:58:49 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-b049bd81ce5so84365866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757066328; x=1757671128; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Fbkrslrl/U4EHGtpNkUJapA11UFx/rFpQL4PlMt2+o=;
 b=ebQxaQjd/veHmueiHIbjpSI0zaZOp67AWk4rgMjUV30SEBlA3iHN4zzDxwSpJd5DAh
 L9Y9wzJvMX2WUgME/hGiQ5ej1ML1mcoRlmLxIJ1R2J/TLbVoF1iLAJ+A9K6p1KN43lzr
 owF+1KOXQkP69CGga7usvaTIgDOJMf8P4vtDGo1GCMeeS9SHwm11EX6T2nP1Ktx6z2nj
 kG/S165xKLiJ5XfiPMrlZZagmsFHB3kNS5MLyGT2iEnBIu8UDVH+8v+Ghpd8pcX9+tkr
 seHelfX5ikkyEJN57M+1onHV7z5u/Skb9MpkRCXyNlWy4MDh5tP2/FxI98kmPfkp8LZn
 ofOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757066328; x=1757671128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Fbkrslrl/U4EHGtpNkUJapA11UFx/rFpQL4PlMt2+o=;
 b=TajBaOMHKeEtrzy2hF2r0pcXNpbNbquQzvPRV0duJu/aqNt2mqGw8zGyDymmW2V/jA
 xZ1bVMihmmWQIzJ+NzKbnCACp6FTGVkAuHgezMH98bu+k7ZZ03qQDk+tQG/SIKpio+0A
 /z0xPex0IOSVuMPifngDObQy9owu/Ls15Y8aRzd5fAJGzlMPS8ZUPbhbnnjdfTymo40J
 UovOz136vsZ8fc2EhGeHJqKu4lhnzVw8mqiSVNq5hc6qHF5wUvzF2S7BGCQPivsUUlTf
 AOzKiXLl6C9hrB8vp0jEZlv79N3hOH9Q1CvgyboW7m9iwLvD8PxavHaLxxf+pD6ooTAH
 ryfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw4UUqvzmylt81+jMqG96gBLO47nz9x3nnUN4xjiCeVzk1BdKKMFcXP/K6Rsy7nWFbWAkUKNgcG2c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJuzytZg3pEufEqJwdgYjiz4Zute8FvOn9BVJ6LA2U/SrupSA6
 Ix6V+cTu1a2Q7BfNHi/XYULEeMV/wuryCbWXVDpB5nvHOvD7t6M/4i1Fzr4iPxCblG/a6yGzbiW
 bwjSX6HKYiZ3QMC8tCNn6mNi15HsbxaI=
X-Gm-Gg: ASbGncvRGClQEHW9vVriTrScozUexQ+EUR4drerwJQs1t3QftNxypwEfxTIbHt0r5+M
 Pa3HzxtX/vW1+dr7FjvgHX4k9GDcErmPJuUH4EdAaWmK2SxNOberssJiq2aKx0Rtku8NcI6Ia0J
 gpe88HQxDYzO9/wS2FxIOjjoRqqhjJoEUbAwkAQQtjdHqjAIgsrH/P3sFLsWVFVvL0J12i6kATz
 gvKPHiNh1btaMjeAFyU
X-Google-Smtp-Source: AGHT+IG+T0I2sVJ76wcpIaEPBSRBiZu3omKGiXauTUn6MdjpxAu1nCa0lZ8hdCy65HkLKv48pMVIExJVfsOtu7NoIlE=
X-Received: by 2002:a17:906:b24e:b0:afd:eb4f:d5d2 with SMTP id
 a640c23a62f3a-b04931b6715mr244720966b.31.1757066327695; Fri, 05 Sep 2025
 02:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
 <20250905-leds-v2-3-ed8f66f56da8@vinarskis.com>
In-Reply-To: <20250905-leds-v2-3-ed8f66f56da8@vinarskis.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:58:11 +0300
X-Gm-Features: Ac12FXxgVWw8at73QOgiZhDzD-M5RC_p2kCHNqId-Qnd1EcmDzHOPtVe7B7RZ5s
Message-ID: <CAHp75VfSoDHX-zy3Kdk0=oBA64mKddXqHh7v6RwfzRJo8Az_1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] leds: led-class: Add devicetree support to
 led_get()
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel.thompson@linaro.org>, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
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

On Fri, Sep 5, 2025 at 11:00=E2=80=AFAM Aleksandrs Vinarskis <alex@vinarski=
s.com> wrote:

> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> devicetree by either name or index.
>
> And use this modified function to add devicetree support to the generic
> (non devicetree specific) [devm_]led_get() function.
>
> This uses the standard devicetree pattern of adding a -names string array
> to map names to the indexes for an array of resources.

...

> +       if (dev->of_node) {

This check is not needed.

Currently of_led_get() returns -ENOENT if the np is NULL or index is
invalid (negative value).
Same will be with the added index search as in case of error it will
hold a negative value.

> +               led_cdev =3D of_led_get(dev->of_node, -1, con_id);
> +               if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) !=3D -ENOENT)
> +                       return led_cdev;
> +       }

--=20
With Best Regards,
Andy Shevchenko
