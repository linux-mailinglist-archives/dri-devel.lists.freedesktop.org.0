Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5EB90AED0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F94910E0A3;
	Mon, 17 Jun 2024 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UIUlva21";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5510E0A3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:14:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-6e3ff7c4cc8so3177045a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718630094; x=1719234894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zPpuo+CDs0eM0LA7bPoQtMex24IJPtVQOpYyzHo8wQ=;
 b=UIUlva21Bk+H1apMApYmmHv1TQB7j77gU0/buRtmFDAXT08HUmF4/XvJZ/223mgCsN
 KLv6BkM/EHWSTZSGj1O5wFXiV4COPP4QW2PyIPZdBGvyTZNoFmnZb23e1XBH8VUzN5T7
 N/FdhzPy9c1i2KS8KBakh18nMiuScNexh4ymJw9leUwwbaw3KAI34rDtE0Q2cSDW9aqy
 yZkfyBnUDZ8Xu9NHIZEqjd067iXHwsOjkaMEihEPFmNtUGknryb5lx9FNd2pSYyF12Qt
 hze19V8eYjbvp92btMso9M+TqMAskWvK7nIkgR3JkC1GgIlRM9jVf08AcGUXkaYrLV8g
 5s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718630094; x=1719234894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zPpuo+CDs0eM0LA7bPoQtMex24IJPtVQOpYyzHo8wQ=;
 b=JFGdSH2P6gjXGe3F9b8ffQRiQqjVSSpH4pI7YE53su5pYF2Qa0LVMRJ59jb/JobfnS
 30BUzFL4g2iy5E7qOtpVWLwcayWMPpnE36LeoXadM9N+K2rUxzSPELdnmdyGr8DrEwmr
 6EWQU+cb0YqF6SI7Qh/O2a0uidqNMOgizt4kEJsFaMRJecHvQjrN5Gl2v3Y86jBwwRPT
 BzkSDJvgiveqXgI4z2pS+ATJNIdrDI/pRklutfDVPu9+JA2AhPzM6J+mRYt6S6iGrfUm
 DyT3LKwNERSI5TPsUn1UrQOhcg98rJYwFn/wOW+obkPDUcruQ0ZLKcSORqhRmV+TLm5B
 Eosg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmvlho+VY8CSMg0qYuz/nY2K0yp5p6gCN+sdJ4hh97BqPMwS9Ccciom7fUZk27PJN1H4aCj0HKI3NleJvbb4DNjRzxoPL1zrSdvAfFQ9Xh
X-Gm-Message-State: AOJu0YxpS/XPHeCWgmafNU+FPEMVAIiwlFyIgUfMdEkBypzokc6dE5jT
 +YM1IuIgCqF4g2iy4Y2Pbok0nQJAU/f1did2wVvD8lIq9OaqZajxxEiEAfNeq6UPf4uEfyo+UFd
 2hezomfED/peL/usqpRjQ4O81i/Y=
X-Google-Smtp-Source: AGHT+IFI7N0581urBHdxi21Z7/cG3Jr5D1/48li0S0yh2RX7x3pBEvua4YDdatMFekw++9wWC7A7tkRWSf/7dhHyrbU=
X-Received: by 2002:a17:90a:ab8a:b0:2c4:b0f0:8013 with SMTP id
 98e67ed59e1d1-2c4db24b894mr8585594a91.11.1718630093378; Mon, 17 Jun 2024
 06:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240601132459.81123-1-aford173@gmail.com>
 <7015c544-14c3-40af-aa10-e3088eea5633@leemhuis.info>
In-Reply-To: <7015c544-14c3-40af-aa10-e3088eea5633@leemhuis.info>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Jun 2024 08:14:41 -0500
Message-ID: <CAHCN7xJfqcN=yqWAURuy-oF8EiwoB5i840Gct65xgqgxNSL_Ug@mail.gmail.com>
Subject: Re: [PATCH V2] drm/bridge: adv7511: Fix Intermittent EDID failures
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: dmitry.baryshkov@linaro.org, victor.liu@nxp.com, sui.jingfeng@linux.dev, 
 aford@beaconembedded.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Mon, Jun 17, 2024 at 8:00=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> Hi! Top-posting for once, to make this easily accessible to everyone.
>
> Hmm, seem nobody took a look at below fix for a regression that seems to
> be caused by f3d9683346d6b1 ("drm/bridge: adv7511: Allow IRQ to share
> GPIO pins") [which went into v6.10-rc1].
>
> Adam and Dimitry, what are your stances on this patch from Adam? I'm
> asking, as you authored respectively committed the culprit?
>

I learned of the regression from Liu Ying when he posted a proposed
fix [1] which then resulted in some further discussion on how to
better solve the issue.   I felt like I should be the one to fix the
issue, since I accidentally caused it when trying to allow for shared
GPIO IRQ's.  The shared GPIO IRQ was required on the imx8mp-beacon-kit
because the interrupt GPIO for the hot-plug-detect IRQ is shared with
a GPIO expander which also serves as an interrupt controller.

Dimitry had given me some suggestions, and from that,  I posted a V1.
Dmitry had some more followup suggestions [2] which resulted in the
V2.

As far as I know, Liu was satisfied that this addressed the regression
he reported.

adam


[1] - https://lore.kernel.org/linux-kernel/2f41a890-915b-4859-8ac9-5436da14=
fe22@nxp.com/T/
[2] - https://lore.kernel.org/all/7bb4d582-5d90-465e-a241-1ee8439a5057@nxp.=
com/T/

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke
>
> On 01.06.24 15:24, Adam Ford wrote:
> > In the process of adding support for shared IRQ pins, a scenario
> > was accidentally created where adv7511_irq_process returned
> > prematurely causing the EDID to fail randomly.
> >
> > Since the interrupt handler is broken up into two main helper functions=
,
> > update both of them to treat the helper functions as IRQ handlers. Thes=
e
> > IRQ routines process their respective tasks as before, but if they
> > determine that actual work was done, mark the respective IRQ status
> > accordingly, and delay the check until everything has been processed.
> >
> > This should guarantee the helper functions don't return prematurely
> > while still returning proper values of either IRQ_HANDLED or IRQ_NONE.
> >
> > Reported-by: Liu Ying <victor.liu@nxp.com>
> > Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins=
")
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID ret=
rieval w/o IRQ
> > ---
> > V2:  Fix uninitialized cec_status
> >      Cut back a little on error handling to return either IRQ_NONE or
> >      IRQ_HANDLED.
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm=
/bridge/adv7511/adv7511.h
> > index ea271f62b214..ec0b7f3d889c 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > @@ -401,7 +401,7 @@ struct adv7511 {
> >
> >  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> >  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> > -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq=
1);
> > +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1=
);
> >  #else
> >  static inline int adv7511_cec_init(struct device *dev, struct adv7511 =
*adv7511)
> >  {
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_cec.c
> > index 44451a9658a3..651fb1dde780 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> > @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv7511,=
 int rx_buf)
> >       cec_received_msg(adv7511->cec_adap, &msg);
> >  }
> >
> > -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq=
1)
> > +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int irq1=
)
> >  {
> >       unsigned int offset =3D adv7511->info->reg_cec_offset;
> >       const u32 irq_tx_mask =3D ADV7511_INT1_CEC_TX_READY |
> > @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *adv7=
511, unsigned int irq1)
> >                               ADV7511_INT1_CEC_RX_READY3;
> >       unsigned int rx_status;
> >       int rx_order[3] =3D { -1, -1, -1 };
> > -     int i;
> > +     int i, ret =3D 0;
> > +     int irq_status =3D IRQ_NONE;
> >
> > -     if (irq1 & irq_tx_mask)
> > +     if (irq1 & irq_tx_mask) {
> >               adv_cec_tx_raw_status(adv7511, irq1);
> > +             irq_status =3D IRQ_HANDLED;
> > +     }
> >
> >       if (!(irq1 & irq_rx_mask))
> > -             return;
> > +             return irq_status;
> >
> > -     if (regmap_read(adv7511->regmap_cec,
> > -                     ADV7511_REG_CEC_RX_STATUS + offset, &rx_status))
> > -             return;
> > +     ret =3D regmap_read(adv7511->regmap_cec,
> > +                     ADV7511_REG_CEC_RX_STATUS + offset, &rx_status);
> > +     if (ret < 0)
> > +             return irq_status;
> >
> >       /*
> >        * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order of=
 RX
> > @@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv751=
1, unsigned int irq1)
> >
> >               adv7511_cec_rx(adv7511, rx_buf);
> >       }
> > +
> > +     return IRQ_HANDLED;
> >  }
> >
> >  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool enab=
le)
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index 66ccb61e2a66..c8d2c4a157b2 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *adv7=
511, bool process_hpd)
> >  {
> >       unsigned int irq0, irq1;
> >       int ret;
> > +     int cec_status =3D IRQ_NONE;
> > +     int irq_status =3D IRQ_NONE;
> >
> >       ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
> >       if (ret < 0)
> > @@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *ad=
v7511, bool process_hpd)
> >       if (ret < 0)
> >               return ret;
> >
> > -     /* If there is no IRQ to handle, exit indicating no IRQ data */
> > -     if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> > -         !(irq1 & ADV7511_INT1_DDC_ERROR))
> > -             return -ENODATA;
> > -
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
> >       regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> >
> > -     if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder)
> > +     if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.enc=
oder) {
> >               schedule_work(&adv7511->hpd_work);
> > +             irq_status =3D IRQ_HANDLED;
> > +     }
> >
> >       if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_ERR=
OR) {
> >               adv7511->edid_read =3D true;
> >
> >               if (adv7511->i2c_main->irq)
> >                       wake_up_all(&adv7511->wq);
> > +             irq_status =3D IRQ_HANDLED;
> >       }
> >
> >  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> > -     adv7511_cec_irq_process(adv7511, irq1);
> > +     cec_status =3D adv7511_cec_irq_process(adv7511, irq1);
> >  #endif
> >
> > -     return 0;
> > +     /* If there is no IRQ to handle, exit indicating no IRQ data */
> > +     if (irq_status =3D=3D IRQ_HANDLED || cec_status =3D=3D IRQ_HANDLE=
D)
> > +             return IRQ_HANDLED;
> > +
> > +     return IRQ_NONE;
> >  }
> >
> >  static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> > @@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, voi=
d *devid)
> >       int ret;
> >
> >       ret =3D adv7511_irq_process(adv7511, true);
> > -     return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> > +     return ret < 0 ? IRQ_NONE : ret;
> >  }
> >
> >  /* -------------------------------------------------------------------=
----------
