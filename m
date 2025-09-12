Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7BB55751
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 22:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2725510E06A;
	Fri, 12 Sep 2025 20:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ltsnw83r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3721E10E06A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 20:03:10 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-b54a2ab01ffso1570438a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757707388; x=1758312188;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNPhp+ipV6YHy8ygdz2BuL9Dch2oYXGoWglyuscHFeY=;
 b=ltsnw83rxodt56zP0718/n1t8pAeIGkSATpCJDuZBsYCRT12+gg0/ruq5gRgAaz0Jv
 U9yoPuAkkCZrdXIYnAnKwpGWtPP99BzFhN8Y9Pg/3zBdlt6T3PxjJVizBRAuxMG41v9Y
 Nqpz4lcFrFUSOvdbV51xjKi4JGx0RASgkobAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757707388; x=1758312188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mNPhp+ipV6YHy8ygdz2BuL9Dch2oYXGoWglyuscHFeY=;
 b=FBU0We8+vDWeOwjdBe3VEDhapjKyMBt9anpfzgMpKbae9D3NdOAJPhrr5rV9Fuq3B/
 6cHy8frKecSM4OYNWfAJaB4+26bv225f7nah+WZ0El8p4Exam0zpS0FtrNK9ofeo37Yb
 zq08RCabGt796xVuWpoMnl4a7B4TKopXGHVjSrnDu6yNj4htXswJ+zg23rLlEjqNlFnE
 mkwqL6wJOTOj3yvB3Q1rVKkvh/HFjPBl4hHnXXvf/EwjslDAINOI+xgOMwSblkI6DJty
 3kQomjKjNR1OwiV8XEHRlwVYb1nq5N1l9QE0wgNwd0dARqJ+bziub3M/m7ieYkxN5YlD
 CLXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUojgqQ3LQ0CYkBLaHtzVazNL2vRVS4DgBCPaYmLuueiVW1TJHPr2OZtk534a0jstG/aEqJ2BbHMRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxgte1q+86SJiP6a7bhXB7BVx87d/1O+4dxYXukTR9EiEIZLz6A
 F4utSz8Q1Y0RlUWbyvXWoaNCEShEUYBWPY/c/c6WUVXsmWqiITw5vGZVI7UbcAjNPjcDmGzqr6B
 dKSE=
X-Gm-Gg: ASbGnctHLSOtQvfRzXBvAHi9MvC6Vc5S9Ed3ZHaDG/miysUxT1jeS4mde6udOFaENEu
 yI89h4Z5dUNn8cX2JKIS6ha2WDWiyvfOup6JBmwiF/c4F4UceN0za4zqurpcUC0JWg3FiGfOhOn
 /NGZectsNbFsg5M4TUCZyU3lYOY6ZvffhGUWB5e7zULEqdVQhBtsMlR2bPnfGZlUNgT3LAKT7Bo
 JejjlwvpexhhC8AuXvwnqVFiZg521wFW9RP9TzaiqjnQJhXHQcR0msQTrky0u+CzMpFQbBxsIAf
 S5g7DT0vxwWy/Z+jgQksL1R6pko2ENSxP4wA5jsDNe5LbCBvtmocrXt7GORoAcUFy7I/BncKTje
 WtMeAYuGv92JWRTh0vmXJ4aS23DNgvSNuOSoHLsbVNLWstlFKFabD5BxC2hg7gSkw87tpZolT0+
 YZ
X-Google-Smtp-Source: AGHT+IFM4IvUzfFKJAE3YwZiQw5x7fufc8M6MZdDs786H5j8G1uyNgWIslQUYyQg2x5bOSD6C9rdXw==
X-Received: by 2002:a17:903:2291:b0:24c:cc16:6c16 with SMTP id
 d9443c01a7336-25d24e9d39dmr55342255ad.19.1757707387793; 
 Fri, 12 Sep 2025 13:03:07 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3ad2fa37sm55177795ad.111.2025.09.12.13.03.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 13:03:06 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-244582738b5so20073425ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:03:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUj23+PNh62yfm+se808TnG4uiLp9rKehRado0ZMqzfxYIwmkrD/KXR3kcmHpua5kdFFJBu0tv5VFc=@lists.freedesktop.org
X-Received: by 2002:a17:902:e890:b0:24c:e372:9ddd with SMTP id
 d9443c01a7336-25d243eff6bmr44065315ad.10.1757707385774; Fri, 12 Sep 2025
 13:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250910183353.2045339-1-john.ripple@keysight.com>
 <20250912192457.2067602-1-john.ripple@keysight.com>
In-Reply-To: <20250912192457.2067602-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 12 Sep 2025 13:02:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X531iXsAkoGMd9Lr=wbzUx2MM9uXV_Azkj-ww6jjLaVw@mail.gmail.com>
X-Gm-Features: Ac12FXwJF6xPZ6MPSlPKll3tMfGq-zDPLP1Lehz4iQdkPaHJnfcDsI0EcPTDY74
Message-ID: <CAD=FV=X531iXsAkoGMd9Lr=wbzUx2MM9uXV_Azkj-ww6jjLaVw@mail.gmail.com>
Subject: Re: [PATCH V4] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
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

On Fri, Sep 12, 2025 at 12:25=E2=80=AFPM John Ripple <john.ripple@keysight.=
com> wrote:
>
> @@ -153,6 +164,8 @@
>   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG=
.
>   * @comms_enabled: If true then communication over the aux channel is en=
abled.
>   * @comms_mutex:   Protects modification of comms_enabled.
> + * @hpd_enabled:   If true then HPD events are enabled.
> + * @hpd_mutex:     Protects modification of hpd_enabled.

nit: order should match the order of elements in the struct, so
hpd_enabled should be above comms_mutex.


> @@ -1219,11 +1261,33 @@ static void ti_sn_bridge_hpd_enable(struct drm_br=
idge *bridge)
>          */
>
>         pm_runtime_get_sync(pdata->dev);
> +
> +       if (client->irq) {
> +               /* Enable HPD events. */

nit: the comment probably doesn't buy us too much...


> +               ret =3D regmap_set_bits(pdata->regmap, SN_IRQ_EVENTS_EN_R=
EG,
> +                                     HPD_REMOVAL_EN | HPD_INSERTION_EN);
> +               if (ret)
> +                       pr_err("Failed to enable HPD events: %d\n", ret);
> +       }
> +       mutex_lock(&pdata->hpd_mutex);
> +       pdata->hpd_enabled =3D true;
> +       mutex_unlock(&pdata->hpd_mutex);

For enable, I think you want this _above_ the setting of the bits.
Then if an interrupt fires right off the bat you'll see it. That also
matches the intuition that usually enable and disable should be mirror
images of each other (they should do things in the opposite order).


>  }
>
>  static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>  {
>         struct ti_sn65dsi86 *pdata =3D bridge_to_ti_sn65dsi86(bridge);
> +       const struct i2c_client *client =3D to_i2c_client(pdata->dev);
> +
> +       if (client->irq) {
> +               /* Disable HPD events. */
> +               regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG, 0);

To make it symmetric to ti_sn_bridge_hpd_enable(), you should probably
use regmap_clear_bits(). Then if we later enable other interrupt
sources then they'll stay enabled.


> +               regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN, =
0);

I don't think you need to clear this. It can just stay enabled but no
interrupts will fire since there are no interrupt sources. This will
make things work right if we later enable other interrupt sources.


> @@ -1309,6 +1373,38 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
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
> +       ret =3D ti_sn65dsi86_read_u8(pdata, SN_IRQ_STATUS_REG, &status);
> +       if (ret)
> +               pr_err("Failed to read IRQ status: %d\n", ret);

You should not only print but return IRQ_NONE here IMO. If there are
constant errors (for whatever reason) the interrupt will eventually
get disabled by the system which is better than storming. It also
means that later code doesn't access a bogus "status".


> +       else
> +               hpd_event =3D status & (HPD_REMOVAL_STATUS | HPD_INSERTIO=
N_STATUS);
> +
> +       if (status) {
> +               pr_debug("(SN_IRQ_STATUS_REG =3D %#x)\n", status);
> +               ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, st=
atus);
> +               if (ret)
> +                       pr_err("Failed to clear IRQ status: %d\n", ret);
> +       } else {
> +               return IRQ_NONE;
> +       }

FWIW: Linux conventions usually are to handle error cases in the "if"
case to avoid indentation (because you don't need an "else"). AKA:

if (!status)
  return IRQ_NONE;

pr_debug(...)
ret =3D ...
...
