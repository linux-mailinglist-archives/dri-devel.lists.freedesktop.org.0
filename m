Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB7B02E91
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 05:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A726B10E0BD;
	Sun, 13 Jul 2025 03:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YMtWJHJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E60510E0BD
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 03:15:18 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-7170344c100so28256107b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 20:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752376517; x=1752981317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1l/K+IqHggnZgD2FOM2eEb6+GapEal3UYsodL2qel0=;
 b=YMtWJHJ2WMH2XH9BOeVG4r0Ll0EqFNbA5k4ldDl9Vf5I5T0Wd9zn8Fdu53qpE8xGOM
 cnbpAIgSoHiAl+2SBfrokBVltfejF896tHpYaq/c3Ogt393isZH9b9aXiPVVAhcirkRM
 LTdbCjBhrWn6rxqIQhqOBJpMXfjmaQ6uXQCzL845qfPI64cVRCNHKLQKvza9IVJXXw+d
 4gGedGcjC0UnQ7mX0ycVlw1kr4d9mZjE4jDuF0kAbvRBCz8/5snTfP60acPuP6P0JF+A
 r3pB0BBz6voZI5Beu+/xCnvbigWT+x4py1AJd5dNCuP22KKLmc1NjLl1SArROxaEaf85
 +PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752376517; x=1752981317;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1l/K+IqHggnZgD2FOM2eEb6+GapEal3UYsodL2qel0=;
 b=TXuxINh/OLQ+ydJ1a1hqcA3C3Iec53ddX3MNtd6LgW4dcNj3T9R4rpKpiP0L7VKfmX
 In8iD+8+XSHUs//H62cUzMZrBmXQqO725KwjSDQuYUBN8VxhZo/6C0ISMAosWH74a7ey
 Wgh/SfSfE5fyUN664wSSqhzcq1HQZtdUFH9pba/PYM3vE+ghlg5Uecsbkec1VT5CR2qf
 vgsc/5HduX6lj21YuHAIrqzotVaO2V60oxK+nT2Yk5Nyt7qh+h+h0ukqS3ecRNsH6r4v
 sMNKZl7oCY4Dr3gffEZ+K2SIgmY3FMm9fwJDBCEz3AFlwnGwy8FFbI1Sl2KYeMgkRseD
 bhbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDINGQj+KDuELe6OQ3oVGMVxaS4feRCe0of7VP4duHvqMxM7j/BGvA6UAsmoc8Uq6Yg/UKxmIBGms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Ae/Hvfk9gUfipljxQ7Kv0uxXjx3f6Q54cMwflIKxr89hrI6e
 /Djt0SYdgF5g0ub0Kc+o7tXiYuOCXGLvElqRNmV3mg9YcascEeWaFyyjwRsY48M0VapRhq4aauy
 weHJcXtvAwkIHKY3shuYGiylgGP2icjY=
X-Gm-Gg: ASbGncv6Miz1UBtBzV9h7Vd/zc6TZvaTdFlYK/SOqPW1/QftciulW1Q/5Orr/YkbKTl
 coVw9MNxa4lFJ7lkleQKiYuy9xpXUXnOTiVVR219LmbmNu8FkaqzjT2OPbggOAKtPzdkkIbTc17
 XdKHG4ACkkOCk+UeBeycSQA+bXSStYpGMw9VSbNTYvIpGlEFJC+ePcrXtBEF/gjl7fZnDW2400i
 s2a8U0Msbkb5GTFYSvkPRBNxKnMD/WfT3JcI6w=
X-Google-Smtp-Source: AGHT+IEGjUqaSB3UsgVl0/htAQhEKYX4HGo1vBA1pPGsrhp5eOwfpsBu4htmrwq7mUdGWj4IbgeV34xTm+uP2H4eXao=
X-Received: by 2002:a05:690c:a99:b0:70f:8883:eb1a with SMTP id
 00721157ae682-717d78af82amr146281137b3.6.1752376517287; Sat, 12 Jul 2025
 20:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250610235825.3113075-1-olvaffe@gmail.com>
In-Reply-To: <20250610235825.3113075-1-olvaffe@gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Sat, 12 Jul 2025 20:15:06 -0700
X-Gm-Features: Ac12FXxfcXlhxfzALMNhQnVRlmtPZ9HqTMZpm9-bPHhDJOMV7PioUFmwOsCuW3Y
Message-ID: <CAPaKu7Q4=fFGeXw27JqptmELX-XisMZG_M6jiRngyZihVooWxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: select REGMAP_I2C
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Can anyone help review this?  It is a trivial build fix.

On Tue, Jun 10, 2025 at 4:58=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote=
:
>
> Fix
>
>   aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/ite-it6505.o: in function =
`it6505_i2c_probe':
>   ite-it6505.c:(.text+0x754): undefined reference to `__devm_regmap_init_=
i2c'
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index b9e0ca85226a6..a6d6e62071a0e 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -122,6 +122,7 @@ config DRM_ITE_IT6505
>         select EXTCON
>         select CRYPTO
>         select CRYPTO_HASH
> +       select REGMAP_I2C
>         help
>           ITE IT6505 DisplayPort bridge chip driver.
>
> --
> 2.50.0.rc0.642.g800a2b2222-goog
>
