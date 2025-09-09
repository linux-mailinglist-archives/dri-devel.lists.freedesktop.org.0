Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646CB49DE2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 02:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE58110E5FD;
	Tue,  9 Sep 2025 00:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="HuD7i2Ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405F710E5FD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 00:11:19 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-32c54c31ed9so2583188a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 17:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1757376676; x=1757981476;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=itx043SjSdQPk+Kw357GK+7TP95N+sBwyskpiXa86jc=;
 b=HuD7i2Ew7tMzHdKhVTDlGmvWkDHG85y46mdHB0AP/Pun81GSRsPAxWSrNNd9kgcmnX
 CK43YUoaySSWsNTJ1JdX8kLDictkFNeYhoGiVv3xGzmGldnHbxlWuFQG3ivatztjAGOd
 tgo+z7TT2PhxIjauOoHi0Yf/hNeXzzd37eoYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757376676; x=1757981476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=itx043SjSdQPk+Kw357GK+7TP95N+sBwyskpiXa86jc=;
 b=GwFB0wdwZIEZ4DbYq51Rtm3pZVqbwLhpfHDx7/3TtCQcOuTTssZZ28Qyer3ENNa5Bg
 9MXMyc6dwYdpiGL2gu8oPbSivub+IWBRztoU29zMCt5cLXPwV5A66S+kH9vv8/vb+evK
 d7Efoz7trfdn0Mngsua4IMehpmBZZhlVDqj7QCuOz+hn1d39U/JA0JGoO/Qx4NrlQnCD
 wO0jSHhqSRBdrolVepBte+j+j76QZ0d03X2Etj5tB6Plzx0UIWA50jA3w3xxdkGl04ni
 4v0ELlYGMVAgYBkAsbjXRkDX5RagN5Vhad9c4YY45b3dmlMwzH4LRlzP1EFkLUV0ROc3
 dTZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX94y1voDzxdLu50NBamWx3t+k56/xLfLLkji0/6U+24DvJysayn2l5Wri6D7ZfHyhnQPwQtGgvkGg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyaZVvgMW9sgvTugwGAihoipuwzKF1ihlvp9UA7pzvzKOQ9I3W
 OZvhKoYgqmk8/abrBks7+gh0RyLSZm20dU8hiW8JM5clFeQT0Wrk+a+QEx7yqCCuNV6ehFtvScD
 i8uc=
X-Gm-Gg: ASbGncvlN02gaawR5s51Q2e3DNiytWBV0Vglw0li9yNoL99qMkPC0kLUHIBw9eaeMin
 633vvdflwvVGAsDw6T+Ka+qdDCjK3QjRr78MnThRZ/3AnXR/8VWi+kI72vbdtvABmSL2qd00VmJ
 0YoBrmaiZlmNthUZAEY8CVmQtO0RsGIRTWQ3ohjRNjOZx+GK5fMDor2AJNI9b2y56XI/BMBIpMD
 9P6hHq5gkgXyzLMTYbWbya9iNkOc0cDBups5Lcfox6ofpFOKu0M2me9EbYwsvDlWiMFeXkX0jaA
 WhHINj+NgoYzDAf+Bge+jc6Zqx6jP2aZfCi0LIucX5ZB2l9Csf0KaEGCWx6DBjh3BkjsSLO4WGC
 LwwMMEtOCMF077J7W6IcReUl8GJvsr/kvwiHkMBnpVtmR1eCNuo5HZrUscSer+cu0WA==
X-Google-Smtp-Source: AGHT+IFgLKusLp13oKy1q4aVu4uC//LU8jZN6c0tKYEDNEGZlTloSFXrlBP8iN3xqe1SYXsJ/JFftg==
X-Received: by 2002:a17:90b:1812:b0:325:7845:fc52 with SMTP id
 98e67ed59e1d1-32d43f7c115mr12207605a91.25.1757376676142; 
 Mon, 08 Sep 2025 17:11:16 -0700 (PDT)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com.
 [209.85.210.178]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-774660e76b1sm147750b3a.4.2025.09.08.17.11.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 17:11:14 -0700 (PDT)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7722c8d2694so4243513b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 17:11:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhs0Nr6UXg0L3N0NcyQAx/ofnbFyULfrrkySdOiJW6cvyPYT7WSm815KGc0ZfZrmg5CEYOuR1yV7s=@lists.freedesktop.org
X-Received: by 2002:a17:902:d482:b0:248:e3fb:4dc8 with SMTP id
 d9443c01a7336-25173118fb5mr124363715ad.39.1757376673765; Mon, 08 Sep 2025
 17:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=WiORm+rawNZoinXFZWdt_yqKQfTFWCiBcJFyJKXj4spQ@mail.gmail.com>
 <20250908203627.3750794-1-john.ripple@keysight.com>
In-Reply-To: <20250908203627.3750794-1-john.ripple@keysight.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 Sep 2025 17:11:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWhDtFWegUUeACxcrSTFh7kbmwVFy3sioboh2fgk3Evw@mail.gmail.com>
X-Gm-Features: Ac12FXxgUiei5XfyMjceUTcGSF-nx0Z4PTKi6M9_GZuINaaxVjXQ9SGSjiI2sNs
Message-ID: <CAD=FV=XWhDtFWegUUeACxcrSTFh7kbmwVFy3sioboh2fgk3Evw@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: ti-sn65dsi86: Add support for DisplayPort
 mode with HPD
To: John Ripple <john.ripple@keysight.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org, 
 jernej.skrabec@gmail.com, jonas@kwiboo.se, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, blake.vermeer@keysight.com, matt_laubhan@keysight.com
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

On Mon, Sep 8, 2025 at 1:37=E2=80=AFPM John Ripple <john.ripple@keysight.co=
m> wrote:
>
> Add support for DisplayPort to the bridge, which entails the following:
> - Get and use an interrupt for HPD;
> - Properly clear all status bits in the interrupt handler;
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---
> V1 -> V2: Cleaned up coding style and addressed review comments
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 93 +++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index ae0d08e5e960..ad0393212279 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -106,10 +106,24 @@
>  #define SN_PWM_EN_INV_REG                      0xA5
>  #define  SN_PWM_INV_MASK                       BIT(0)
>  #define  SN_PWM_EN_MASK                                BIT(1)
> +
> +#define SN_IRQ_EN_REG                          0xE0
> +#define  IRQ_EN                                        BIT(0)
> +
> +#define SN_IRQ_EVENTS_EN_REG                   0xE6
> +#define  IRQ_HPD_EN                            BIT(0)
> +#define  HPD_INSERTION_EN                      BIT(1)
> +#define  HPD_REMOVAL_EN                                BIT(2)
> +#define  HPD_REPLUG_EN                         BIT(3)
> +#define  PLL_UNLOCK_EN                         BIT(5)
> +
>  #define SN_AUX_CMD_STATUS_REG                  0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT          BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT              BIT(5)
>  #define  AUX_IRQ_STATUS_NAT_I2C_FAIL           BIT(6)
> +#define SN_IRQ_STATUS_REG                      0xF5
> +#define  HPD_REMOVAL_STATUS                    BIT(2)
> +#define  HPD_INSERTION_STATUS                  BIT(1)
>
>  #define MIN_DSI_CLK_FREQ_MHZ   40
>
> @@ -221,6 +235,19 @@ static const struct regmap_config ti_sn65dsi86_regma=
p_config =3D {
>         .max_register =3D 0xFF,
>  };
>
> +static int ti_sn65dsi86_read(struct ti_sn65dsi86 *pdata, unsigned int re=
g,
> +                            unsigned int *val)

This is reading a byte, right? So "val" should be an "u8 *". Yeah,
that means you need a local variable to adjust for the generic regmap
call, but it makes a cleaner and more obvious API to the users in this
file.


> +{
> +       int ret;
> +
> +       ret =3D regmap_read(pdata->regmap, reg, val);
> +       if (ret)
> +               dev_err(pdata->dev, "fail to read raw reg %x: %d\n",
> +                       reg, ret);

nit: use %#x so that the 0x is included.


> @@ -1219,12 +1246,28 @@ static void ti_sn_bridge_hpd_enable(struct drm_br=
idge *bridge)
>          */
>
>         pm_runtime_get_sync(pdata->dev);
> +
> +       /* Enable HPD and PLL events. */
> +       regmap_write(pdata->regmap, SN_IRQ_EVENTS_EN_REG,
> +                    PLL_UNLOCK_EN |
> +                    HPD_REPLUG_EN |
> +                    HPD_REMOVAL_EN |
> +                    HPD_INSERTION_EN |
> +                    IRQ_HPD_EN);

* Shouldn't this be `regmap_update_bits()` to just update the bits
related to HPD?

* why enable "PLL_UNLOCK_EN" when you don't handle it?

* I also don't think your IRQ handler handles "replug" and "irq_hpd",
right? So you shouldn't enable those either?

Also: should the above only be if the IRQ is enabled? AKA obtain a
pointer to the i2c_client and check `client->irq`?


> +
> +       regmap_update_bits(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN,
> +                          IRQ_EN);

I guess this is OK to be here if you want, but I would maybe consider
putting it in `ti_sn65dsi86_resume()` if `client->irq` is set. Then if
we ever enable more interrupts it'll already be in the correct place.


> @@ -1309,6 +1352,32 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
n65dsi86 *pdata)
>         return 0;
>  }
>
> +static irqreturn_t ti_sn_bridge_interrupt(int irq, void *private)
> +{
> +       struct ti_sn65dsi86 *pdata =3D private;
> +       struct drm_device *dev =3D pdata->bridge.dev;

I'm unsure if accessing "dev" here without any sort of locking is
safe... It feels like, in theory, "detach" could be called and race
with the IRQ handler? Maybe you need a spinlock to be sure?


> +       u32 status =3D 0;
> +       bool hpd_event =3D false;
> +       int ret =3D 0;

Don't initialize variables unless they're needed. In this case it's
obvious that both `hpd_event` and `ret` don't need to be initialized.
Maybe you could argue that `status` should be initialized since it's
passed by reference, but even that's iffy...


> +
> +       ret =3D ti_sn65dsi86_read(pdata, SN_IRQ_STATUS_REG, &status);
> +       if (ret)
> +               return ret;

The return for this function is not an error code but an
`irqreturn_t`. You need to account for that.


> +       hpd_event =3D status & (HPD_REMOVAL_STATUS | HPD_INSERTION_STATUS=
);
> +       if (status) {
> +               drm_dbg(dev, "(SN_IRQ_STATUS_REG =3D %#x)\n", status);
> +               ret =3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, st=
atus);
> +               if (ret)
> +                       return ret;

Same--you can't just return an error code.


> +       }
> +
> +       /* Only send the HPD event if we are bound with a device. */
> +       if (dev && hpd_event)
> +               drm_kms_helper_hotplug_event(dev);
> +
> +       return IRQ_HANDLED;

If "status" gives back 0 (which would be weird), you probably want to
return IRQ_NONE, right?


> +}
> +
>  static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>                               const struct auxiliary_device_id *id)
>  {
> @@ -1971,6 +2040,30 @@ static int ti_sn65dsi86_probe(struct i2c_client *c=
lient)
>         if (strncmp(id_buf, "68ISD   ", ARRAY_SIZE(id_buf)))
>                 return dev_err_probe(dev, -EOPNOTSUPP, "unsupported devic=
e id\n");
>
> +       if (client->irq) {
> +               enum drm_connector_status status;
> +
> +               ret =3D devm_request_threaded_irq(pdata->dev, client->irq=
, NULL,
> +                                               ti_sn_bridge_interrupt,
> +                                               IRQF_TRIGGER_RISING |
> +                                               IRQF_TRIGGER_FALLING |
> +                                               IRQF_ONESHOT,
> +                                               "ti_sn65dsi86", pdata);
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
occurs

nit: s/occurs/occur


> +                */
> +               ret =3D ti_sn65dsi86_read(pdata, SN_IRQ_STATUS_REG, &stat=
us);
> +               ret |=3D regmap_write(pdata->regmap, SN_IRQ_STATUS_REG, s=
tatus);
> +               if (ret)
> +                       pr_warn("Failed to clear IRQ initial state: %d\n"=
, ret);

Do you even need to read? Can't you just write all possible bits and
that should be safe?
