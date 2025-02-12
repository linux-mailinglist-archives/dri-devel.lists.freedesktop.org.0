Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698C3A32C22
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 17:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C40F10E92A;
	Wed, 12 Feb 2025 16:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FolZzdtr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922410E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:44:07 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7c81b8681so533511666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739378645; x=1739983445;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
 b=FolZzdtro5h+Ja0UJ1CnlujZHX3MWpIMvkJ9vtiIlxmeKp9900V92HAUAIddjhRRSe
 Zd0RW9W1SsMnGEY8xT2n3Y9gn44yb2cUWaXxpESrVDiERXMUUnFPiWpLUEOq6PhQ02Sg
 sGFfWzAqn+GZ/+HOmmuA1m8kSoMrXQFKEeibk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739378645; x=1739983445;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
 b=jeZr8Ut3gE6yuDn5zcFMWQXV0DyosDH3seKk4fjkVvp08bs2k+v8BOtKRReI5WcBvS
 v8EQn4Ogk8OnRrPNsMtYPNhNzxdtqmQ2U0CqZJizhNLRHmkVz0BmGus2wrBweGyrFvVF
 +m2RYCtCrV7BtWrTDvKtD6VKWgkXmkMzhaEZ2IsrpRKSv68GB2NhjPE7MX9iiwDQAoAR
 Q/V0XhbcHn26x/05ze3t/4uKssQjqSHgqhcSz8Kmg3TKMcRDIknODrdyEexhQ7Us9bIi
 S4OD5kVCl3dwFRETH98rywRYYTnbObNDRjmkEs7CeW2OvN2rPsWKnEZt4l5hXaBh8Dm9
 MT5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtTynBQhNRz3lgeW3G68NU3Fu3ZwpX/XhPOHFRT9l0agZW4Pq4SOOAsct+yMsBQqLTB/YpnwVBkRs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNLW+jWzo27LgNoC1xV4FN3jdeyW6Zvp/jxCXF2anW/fpu2SUN
 9i2QhSWHHmgBL6yal7fPIbJ5LF6DQ29pkZAJzBnY8Hr76w+1UHGTNYH5WLYXnWr+3ujz09hPgFH
 x1l2E
X-Gm-Gg: ASbGncs97BfYhLcjE5zvHPHLZ4qpfLHYoTHIdAaoynZFNtnPm7LO/ypEdN4ZDe8nTlx
 adDr0+j5+uJXvqV9SMSYeEq2UBFbWieO6DY4Rr2idV/feRqF6trN068/nX+mMPihl0JLrfP/9R3
 WMQ8nFJe36HOSqRNiAliHAtn/zwgzQY6IOFtH5nhA9vIpHeIhLD8gMBID/NsYpJNWhYDl6410O3
 eBl6tUYF2ZdvRW0wV5QXAhADKAGQQq2yH+ApXQHgg0HyIFO0T9jg6F6P3SEcHBJNR9flh4CWBcG
 YpZO67HSrfp/rggWey84D/PDakgzq7dORmAU8CXzLTuHoPtNrBug80U=
X-Google-Smtp-Source: AGHT+IGhtHMP/S3D6Cp4+lLwt0xAiXbEO6jgDXw7r63oiXfMoTaJX0nFaNSU5L12rZXvnrT+3OmPRA==
X-Received: by 2002:a17:907:7b86:b0:ab7:b424:dd14 with SMTP id
 a640c23a62f3a-ab7f3765a39mr375014466b.19.1739378644923; 
 Wed, 12 Feb 2025 08:44:04 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab78d5771easm1121186966b.83.2025.02.12.08.44.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 08:44:04 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-ab7c14b880dso724734566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 08:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKnhs1NULHURjhpGTmZ0iApPczbs7Bl2r9Drp3UN8+j0cuuBSoZjAS7jWzIS3vxgvyvsrohwl9YY=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
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

Hi,

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug
