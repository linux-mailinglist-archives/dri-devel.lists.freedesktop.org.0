Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B585AB583B3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 19:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A6310E2E1;
	Mon, 15 Sep 2025 17:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Hb9nGp6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64010E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 17:33:16 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2639bffd354so12032745ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757957594; x=1758562394;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nV61ttDYdkC8rDeXwENJv1WcBg+55bTMtOKecEsDHFk=;
 b=Hb9nGp6tv+BNssvf1rNiX93QhnDdW4UuacMwlHLRE/G6hAmgswPvKtiYN2eNchxMpY
 1eDY5p8hmn1niaZEVcR82aXg5rUsVEHh1gD3cIwm8WMDVZI+P6Cd8MNDXMirS610nyJJ
 asX8H+N9K3xQ560LnQcbaVVdAAJKfOYdBcs8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757957594; x=1758562394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nV61ttDYdkC8rDeXwENJv1WcBg+55bTMtOKecEsDHFk=;
 b=p9SFt+BAGRbd0yI56ADcZDCNK7WEB8BlvRfHxoAAEfd/l31RIjMWVLAgDsKiiu7N6/
 Qx+dKYlN99kL0/uUXgUCdQJQzOCUwmSNIctU117Vg3Ju+8ynPWWzsOtsk9Umm1VGbwFn
 V0cva3Qt8UKh2JgZn074EUlep2UsI9WaEb9abTx7wrduSKFtwNiCf1sxSl7c13FeAboJ
 pP8k2+PN0UGY/7kRSFvpo4Z+I7M10dMuHK5zOmzdbiO0PZ3lROy4o3E3jw4kkzr2BjO6
 OnNpU1QhTJXyMHSH5NlGWQuNhmG81wPwvkzI4sZ0BsEABhOdrwz3147RnJClvz18OcoN
 f4yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSh2GeWCZMhGdXRIeWzYodbFjRYdtSVMnBweDwcpulvRCoJbZrhBh4fj3UzilHd3qEJIwwZWAJYew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2FWCXtfeLTxrkZxl8qDHYFedILMhYvP9XchWm4NSVuTeGD11F
 jjsjs4YfiEQJIG7+GPdVqv+Szbkd/TplA2vkYqyGKhRUSDNphoUrNZSIOQQCxikfrwhJucBwZ/V
 rRMU=
X-Gm-Gg: ASbGncs+2mQqvMoTUM2UpUYP7aF81fQ6NkD+d5VKUUVHcaKdUHqoXwNdjqPN10ngaPc
 anUpGKFJYGKuOarHOuDAmNyrA7fK2HnknKp0ooUCzh/+fxpPIkjKv9a/rXCiGD/Y1yJT9KR9vkr
 ZdHpMXPafMqqyA8i6W0jQ2UzCSpBn2OJ0cmcrxYV5m6irjfEU1PtKn0ixfyjYD6ULoEKdgCvGGG
 IW9BNdIs0Kcd0vG629baGE5N2HQiNpObn2GOE+xpQLJzNDWZjezXS416XIkL9n0RPjpVdTeRFaY
 lA+lJ88peaiElygh6GWCETVwxRoSLd6LlJ0N0yB14RKNrUSnJv7yzi2pPYvviiAef6qkMm1ZhrU
 pCHfxd+T8cu1DFmh7NaMfS62o4NIWcSmE91rGR+RcadcfTp+f+tmgVvtrBBO1MRtv9qLpHCVVuo
 mu
X-Google-Smtp-Source: AGHT+IEif0K8Y7EDwgzoODYgT2PcA/Txo8WewrjrsIcRiH20+y6ckaSNCRihCnp+AjVdNeesuYzZdA==
X-Received: by 2002:a17:902:da83:b0:266:d648:bf53 with SMTP id
 d9443c01a7336-266d648c2a0mr40915565ad.7.1757957594144; 
 Mon, 15 Sep 2025 10:33:14 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25fc8285639sm84024375ad.134.2025.09.15.10.33.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 10:33:13 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2445824dc27so40586305ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVrNFQeSZ4lWJZFJrnCb3MgvMaBL0dPNhca0xd7a3S5+7wz/U2q0oqAKAfsVq9MwDzQHJnDxqEHDDs=@lists.freedesktop.org
X-Received: by 2002:a17:902:e74c:b0:249:44b5:d5b6 with SMTP id
 d9443c01a7336-25d26b51b96mr161569375ad.40.1757957592247; Mon, 15 Sep 2025
 10:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250912210805.2910936-1-john.ripple@keysight.com>
 <20250915165055.2366020-1-john.ripple@keysight.com>
In-Reply-To: <20250915165055.2366020-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 15 Sep 2025 10:33:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wij7MjyuS0b+4jn65Oq7Ee+2-__+5GjhfURBBk9G3kpQ@mail.gmail.com>
X-Gm-Features: Ac12FXx6NsK6AOefg4Q0kBS_Lj8jjSNLunysKqc5tXmxBH1qNHJVLHe-q4hbDEc
Message-ID: <CAD=FV=Wij7MjyuS0b+4jn65Oq7Ee+2-__+5GjhfURBBk9G3kpQ@mail.gmail.com>
Subject: Re: [PATCH V6] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
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

On Mon, Sep 15, 2025 at 9:51=E2=80=AFAM John Ripple <john.ripple@keysight.c=
om> wrote:
>
> @@ -1309,6 +1375,41 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
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
> +       bool hpd_event;
> +
> +       ret =3D ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
> +       if (ret) {
> +               dev_err(pdata->dev, "Failed to read IRQ status: %d\n", re=
t);
> +               return IRQ_NONE;
> +       }
> +
> +       hpd_event =3D status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS=
);
> +
> +       dev_dbg(pdata->dev, "(SN_IRQ_STATUS_REG =3D %#x)\n", status);
> +       ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, status);
> +       if (ret) {
> +               dev_err(pdata->dev, "Failed to clear IRQ status: %d\n", r=
et);
> +               return IRQ_NONE;
> +       }
> +
> +       if (!status)
> +               return IRQ_NONE;
> +
> +       /* Only send the HPD event if we are bound with a device. */
> +       mutex_lock(&pdata->hpd_mutex);
> +       if (pdata->hpd_enabled && hpd_event)
> +               drm_kms_helper_hotplug_event(dev);
> +       mutex_unlock(&pdata->hpd_mutex);

The order above wasn't quite what I was suggesting. I was suggesting:

ret =3D ti_sn65dsi86_read_u8(...);
if (ret) {
 ...
}
dev_dbg(..., status);
if (!status)
  return IRQ_NONE;

ret =3D regmap_write(..., status);
if (ret) {
 ...
}

/* Only send ... */
hpd_event =3D status & ...;
mutex_lock(...);
...
mutex_unlock(...);

...but it doesn't really matter. I guess it's a little weird that your
current code still writes status even if it's 0, but it shouldn't
really hurt. There's no need to spin with that change unless you feel
like it.

At this point I'm happy with things. Thanks for putting up with the
review process!

Reviewed-by: Douglas Anderson <dianders@chromium.org>


I'll plan to give this a week or so in case anyone else wants to jump
in, then apply it. I'll also try to find some time this week to test
this on a device using ti-sn65dsi86 to make sure nothing breaks,
though I don't expect it to.

-Doug
