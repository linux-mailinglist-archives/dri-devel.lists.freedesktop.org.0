Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70470B522C9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99910E099;
	Wed, 10 Sep 2025 20:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="D9WUTdc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337AA10E099
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:48:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7725147ec88so34855b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757537320; x=1758142120;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xT8JQ5MwN/AoQ1SPOJ05aLQv7X9XnNCuIU1qg5EIKK4=;
 b=D9WUTdc23W+mu7dj1eN3eAUrFUbeiJnuWJ8yILAFJiwMpeqXnAM5X2WpCPnla81kH+
 HINUocgANoZXFA0f3indBFP5k2CkpLykvRvVt/owyEEO6hpfwL6MCzoDZAfRGSJxL6BP
 Tgyh2LkcSG8BYMBjtHHQc8FQ9mspL+9M/8vdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537320; x=1758142120;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xT8JQ5MwN/AoQ1SPOJ05aLQv7X9XnNCuIU1qg5EIKK4=;
 b=OOhUwIgq51Q6yL8rRPDK3HyZ30LLjRr4tVqjcpIr/31Agr9Q11LTbMzd6Sasjsd5nC
 rCKxAYHpu1cp0SzFLDK0AJYrkWRksxrp/9+2NcCN29jF0luXyn9uTx/OjUZ69eJqlXBq
 E306qqqGw6k9MQL27Z8wdjHkftRUfjGU+CkazxwfwgbcqJZjYRKmpiKc2bqSW1WVZc1f
 YObKqYDfOVjmIv37PFFsdg3Vgp0HUfyk5qnEd9oyeElG++7qOhLgzOsQeGU/e/NzS/rm
 SVNXEfc5o+Wk+7PEOkrNrHVHgrRsu8JMunOBvVdPdU21607efKI7hhwKEXn+5y1Zvmzc
 229A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaMhjn1IKWVjwJqopGZi3oJLyt9pB2zaFiPn/MobkwSBarhmKocEMXnebFODGZgiOd4SOSEX3w3fk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzGRZ40ELD4z/vegZQxOXp6UL4SgwyGY5wN6L78G2cDH5uNduS
 zzHXt1n7Jo5oVveR+Klvli7M8aM6+PduQYrVHtl7RMgmyXAAGoNFfHqLqlxvW3+KrHs/4lzBvTM
 K2tw=
X-Gm-Gg: ASbGnctQNsgg2ZO0tNFZNTKJVfqLCg8pYaWchYPIlrcgYj8PzsK3RpjBLW+Izn4x5hZ
 74oi3RhwjwryzgK979uspe7yCIpSCMmO21ijXlI5QMhhu9ZF5ZuLf3huOa3WNOfwScwPALoo80d
 7+wqIdpT842E9nZG6LUgT8f0tFfeCR0NLsDSk9maUIJgkpyQ6ilAQ3xgDojAIoRcucpA0Dd2a3u
 YzT71/LL1MUbR7zm50i5nAEJfTci/a6RFNcT/e/xvtk/eg2PC8UqgbkqEqZEnbPOc6oO6uF88y0
 RRDDpVKHhhGg20hXT9+2jNgUtd555eeNOg2yRSfLQbf9PHpugrmqqnZ4tiwfYzHg6FDHI6BQXiE
 ZvcBHpHdDd7YRyxqnbxeeVN14uQmL/j/Is0DA4ASe0R7QO/pG7xT7fJgO6nueYbkAtKFP5GwEqk
 +c
X-Google-Smtp-Source: AGHT+IF1oXBcXlCRXAbEyMbePlfum67K30BnNfiDC/ofe0HrysEVkYwrm4pvdnuWnX47hOtRmrk9Ow==
X-Received: by 2002:a05:6a21:339b:b0:246:5be:ca90 with SMTP id
 adf61e73a8af0-25cf651ddfbmr999983637.10.1757537319855; 
 Wed, 10 Sep 2025 13:48:39 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com.
 [209.85.210.173]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25a27422ffdsm36723235ad.17.2025.09.10.13.48.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 13:48:39 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7728a8862ccso1149448b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:48:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV1bWFopYKIQkIutNdc6IMh25dCD1lInLTFUrwIc0kz6rTvA1My8rdkvpj8nzVDBapoGkmTFZbrqdQ=@lists.freedesktop.org
X-Received: by 2002:a05:6a21:99a9:b0:246:1e3:1f7e with SMTP id
 adf61e73a8af0-25cf5f1d580mr1027298637.5.1757537318041; Wed, 10 Sep 2025
 13:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250908203627.3750794-1-john.ripple@keysight.com>
 <20250910183353.2045339-1-john.ripple@keysight.com>
In-Reply-To: <20250910183353.2045339-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 10 Sep 2025 13:48:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Um5NKHFZJJkC6eC0rnea0xSPeWVpK91PwGcrRjri28NA@mail.gmail.com>
X-Gm-Features: Ac12FXwYIEESDkT-zb7rIJeqLVKJJ9SFgSrURKxbWC5dUsSzlebV9madmjHaYek
Message-ID: <CAD=FV=Um5NKHFZJJkC6eC0rnea0xSPeWVpK91PwGcrRjri28NA@mail.gmail.com>
Subject: Re: [PATCH V3] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, blake.vermeer@keysight.com, 
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 matt_laubhan@keysight.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
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

On Wed, Sep 10, 2025 at 11:34=E2=80=AFAM John Ripple <john.ripple@keysight.=
com> wrote:
>
> @@ -221,6 +236,23 @@ static const struct regmap_config ti_sn65dsi86_regma=
p_config =3D {
>         .max_register =3D 0xFF,
>  };
>
> +static int ti_sn65dsi86_read_u8(struct ti_sn65dsi86 *pdata, unsigned int=
 reg,
> +                            u8 *val)

nit: indentation is slightly off. checkpatch --strict yells:

CHECK: Alignment should match open parenthesis
#79: FILE: drivers/gpu/drm/bridge/ti-sn65dsi86.c:240:
+static int ti_sn65dsi86_read_u8(struct ti_sn65dsi86 *pdata, unsigned int r=
eg,
+                            u8 *val)


> @@ -413,6 +446,13 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>         if (pdata->refclk)
>                 ti_sn65dsi86_enable_comms(pdata, NULL);
>
> +       if (client->irq) {
> +               ret =3D regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, =
IRQ_EN,
> +                       IRQ_EN);

nit: checkpatch --strict yells:

CHECK: Alignment should match open parenthesis
#112: FILE: drivers/gpu/drm/bridge/ti-sn65dsi86.c:451:
+               ret =3D regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IR=
Q_EN,
+                       IRQ_EN);


> @@ -1219,11 +1262,32 @@ static void ti_sn_bridge_hpd_enable(struct drm_br=
idge *bridge)
>          */
>
>         pm_runtime_get_sync(pdata->dev);
> +
> +       mutex_lock(&pdata->hpd_mutex);
> +       if (client->irq) {
> +               /* Enable HPD events. */
> +               val =3D HPD_REMOVAL_EN | HPD_INSERTION_EN;
> +               ret =3D regmap_update_bits(pdata->regmap, SN_IRQ_EVENTS_E=
N_REG, val, val);

nit: regmap_set_bits() ?

...and then you don't need the "val" temporary variable.


> +               if (ret)
> +                       pr_err("Failed to enable HPD events: %d\n", ret);
> +       }
> +       pdata->hpd_enabled =3D true;
> +       mutex_unlock(&pdata->hpd_mutex);

So I _think_ you only need the mutex around the set of "hpd_enabled".
Really the only things you're trying to do are:

* Make sure that by the time ti_sn_bridge_hpd_disable() returns that
no more HPD callback will be made

* Make sure that after ti_sn_bridge_hpd_enable() is called that the
next interrupt will notice the update.

So I'd make the enable case look something like this:

  mutex_lock(&pdata->hpd_mutex);
  pdata->hpd_enabled =3D true;
  mutex_unlock(&pdata->hpd_mutex);

  if (client->irq) {
    /* Enable HPD events. */
    val =3D HPD_REMOVAL_EN | HPD_INSERTION_EN;
    ret =3D regmap_update_bits(pdata->regmap, SN_IRQ_EVENTS_EN_REG, val, va=
l);
    if (ret)
      pr_err("Failed to enable HPD events: %d\n", ret);
  }

...and the disable case:

  if (client->irq) {
    /* Disable HPD events. */
    regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG, 0);
    regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN, 0);
  }

  mutex_lock(&pdata->hpd_mutex);
  pdata->hpd_enabled =3D false;
  mutex_unlock(&pdata->hpd_mutex);


Does that seem reasonable?


> @@ -1309,6 +1373,44 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
n65dsi86 *pdata)
>         return 0;
>  }
>
> +static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
> +{
> +       struct ti_sn65dsi86 *pdata =3D private;
> +       struct drm_device *dev =3D pdata->bridge.dev;
> +       u8 status;
> +       int ret;
> +       bool hpd_event =3D false;
> +
> +       mutex_lock(&pdata->hpd_mutex);
> +       if (!pdata->hpd_enabled) {
> +               mutex_unlock(&pdata->hpd_mutex);
> +               return IRQ_HANDLED;
> +       }

I also think you _always_ want to Ack all status interrupts so there's
no way you could end up with an interrupt storm, so you shouldn't do
this early return.


> +       ret =3D ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
> +       if (ret)
> +               pr_err("Failed to read IRQ status: %d\n", ret);
> +       else
> +               hpd_event =3D status & (HPD_REMOVAL_STATUS | HPD_INSERTIO=
N_STATUS);
> +
> +       if (status) {
> +               drm_dbg(dev, "(SN_IRQ_STATUS_REG =3D %#x)\n", status);
> +               ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, st=
atus);
> +               if (ret)
> +                       pr_err("Failed to clear IRQ status: %d\n", ret);
> +       } else {
> +               mutex_unlock(&pdata->hpd_mutex);
> +               return IRQ_NONE;
> +       }
> +
> +       /* Only send the HPD event if we are bound with a device. */
> +       if (dev && hpd_event)
> +               drm_kms_helper_hotplug_event(dev);
> +       mutex_unlock(&pdata->hpd_mutex);

I think you only want the mutex to protect your checking of hpd_mutex
and sending the "drm_kms_helper_hotplug_event()". I don't think you
need it for the whole IRQ routine. AKA:

mutex_lock(&pdata->hpd_mutex);
if (hpd_event && pdata->hpd_enabled)
  drm_kms_helper_hotplug_event(dev);
mutex_unlock(&pdata->hpd_mutex);

...and you don't need to check for "dev" being NULL because there's no
way "hpd_enabled" could be true with "dev" being NULL. At least this
is my assumption that the core DRM framework won't detach a bridge
while HPD is enabled. If nothing else, I guess you could call
ti_sn_bridge_hpd_disable() from ti_sn_bridge_detach()


> @@ -1971,6 +2075,28 @@ static int ti_sn65dsi86_probe(struct i2c_client *c=
lient)
>         if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
>                 return dev_err_probe(dev, -EOPNOTSUPP, "unsupported devic=
e id\n");
>
> +       if (client->irq) {
> +               ret =3D devm_request_threaded_irq(pdata->dev, client->irq=
, NULL,
> +                                               ti_sn_bridge_interrupt,
> +                                               IRQF_TRIGGER_RISING |
> +                                               IRQF_TRIGGER_FALLING |
> +                                               IRQF_ONESHOT,
> +                                               "ti_sn65dsi86", pdata);
> +
> +               if (ret) {
> +                       return dev_err_probe(dev, ret,
> +                                            "failed to request interrupt=
\n");
> +               }
> +
> +               /*
> +                * Cleaning status register at probe is needed because if=
 the irq is
> +                * already high, the rising/falling condition will never =
occur
> +                */
> +               ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, 0x=
FF);
> +               if (ret)
> +                       pr_warn("Failed to clear IRQ initial state: %d\n"=
, ret);

Actually, wait. Why do you want "rising" and "falling". Isn't this a
level-triggered interrupt? Then you also don't need this bogus clear
of interrupts here...

...and also, I seem to recall it's usually better to not specify a
type here and rely on the type in the device tree. I seem to remember
there being some weird corner cases (maybe around remove / reprobe or
maybe about deferred probes?) if an interrupt type is specified in
both code and device tree and those types don't match...

-Doug
