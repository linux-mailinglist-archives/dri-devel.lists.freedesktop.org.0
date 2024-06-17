Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650090AFAD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFD210E3C8;
	Mon, 17 Jun 2024 13:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GH5cuBSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0054B10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:41:14 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-70435f4c330so3482677b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718631674; x=1719236474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0pp4nLuLDtvrTRt1gP/9BmZwggZYJPGQwgqI4bcf7s=;
 b=GH5cuBSnzUiAwODQoRTzxKy/ampJ3jrjlfAw0IoFN9tpCKm7CsQhd+95MBYApcnwNs
 GKo0G/mPvWGjka36SL3udMwSYgw5TzrOLJ6NP/Ix0Bi+1OSfwYgkFyaYXMtwDw3yAUmj
 4jLIfRCj7vLflSZPdBnIaQGTgdcEOLI3UBQjcuVm11+upobUymRmnwHhnktbutxjPN8I
 rxNz9Bad0qowFRkGyyBRGshBi/sqsiCIgIUz6/mnyxU6PDAJT+V2M8gp9CbnKAy7nDgG
 oIWEUGmo3de+4zcjCRcWm6oU/1jQlYQqzNcgLOIsGQ3drQAZcAEdxgZQQCorjhRxNvr+
 GF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718631674; x=1719236474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0pp4nLuLDtvrTRt1gP/9BmZwggZYJPGQwgqI4bcf7s=;
 b=Duo4pkcUMoH/gw5LJ1DG9l5ZW5smLyDoMDlVDT30nXU504GqHMsEv4kmHJXX/fgsXS
 M+niWfH1rYVnZ8Bm8d5oFW4+6n8CNP2tO59T+HtF/5LtlcOwOHKLOZ3qXwzKfakxo3ej
 tQTYl900A0ShkXoYvJLruC/PXjwTHUX1Ueh9knVQ9E+pKNlaAAp5jNByb6IGNFdAxa7q
 Xyd0da98t0mTrs9zY9f4i7BF/zRgOc2lxTTc0s9FSXYl/3gyzQ7XtzxaNjIsL3ZF8Gum
 u4TVu2sTEOO4bc83Fc+ChkOL1O2vZefjCK7wluPkRvwylSsfHmuRj7KZrmzgp8v21Z4Z
 sCNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQan/PhMp996m94Uy+kT9VajUxcsdFLa56bnhQkX7nGYk3vLsmqe5JdAnvJWG/EkggGWg1ttwzKBSrDgj+7bKBjfDvYZ2grV+GOOZyridz
X-Gm-Message-State: AOJu0Yw8bQXe88XUrI258N1q5krOCR1Wj0tj5c5XmfEwZv3vEhd3hef3
 IXx43QB3gpXRIi9qPGRQBglvxc0o9uudvwTqNA5C07Z3AudfqcKpRDK/Cf4tyRb/Os9QYOWIIfX
 oli93z+8afVXRoHjXZgc7dUVntLM=
X-Google-Smtp-Source: AGHT+IGL1B2BYMw+YBoulVZaQLRFpQouRVZZxGbMCWRau4ceu76A7i6GVVB7OO7b8w3Wvy9CS3LAD+elObIiA6nzxos=
X-Received: by 2002:a05:6a20:2448:b0:1b8:d79:55f3 with SMTP id
 adf61e73a8af0-1bae82a599bmr9569600637.54.1718631674103; Mon, 17 Jun 2024
 06:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240601132459.81123-1-aford173@gmail.com>
 <7015c544-14c3-40af-aa10-e3088eea5633@leemhuis.info>
 <CAHCN7xJfqcN=yqWAURuy-oF8EiwoB5i840Gct65xgqgxNSL_Ug@mail.gmail.com>
 <701edf2c-2c70-4031-9d6f-cd31cd082df7@leemhuis.info>
In-Reply-To: <701edf2c-2c70-4031-9d6f-cd31cd082df7@leemhuis.info>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Jun 2024 08:41:02 -0500
Message-ID: <CAHCN7x+LasjE8NgkKzXZbxUZXLnhJhnuzfXPgbBKgtWeD0rEXA@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 8:29=E2=80=AFAM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 17.06.24 15:14, Adam Ford wrote:
> > On Mon, Jun 17, 2024 at 8:00=E2=80=AFAM Linux regression tracking (Thor=
sten
> > Leemhuis) <regressions@leemhuis.info> wrote:
> >>
> >> [CCing the regression list, as it should be in the loop for regression=
s:
> >> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>
> >> Hi! Top-posting for once, to make this easily accessible to everyone.
> >>
> >> Hmm, seem nobody took a look at below fix for a regression that seems =
to
> >> be caused by f3d9683346d6b1 ("drm/bridge: adv7511: Allow IRQ to share
> >> GPIO pins") [which went into v6.10-rc1].
> >>
> >> Adam and Dimitry, what are your stances on this patch from Adam? I'm
> >> asking, as you authored respectively committed the culprit?
> >
> > I learned of the regression from Liu Ying [...]
>
> Ohh, I'm very sorry, stupid me somehow missed that the Adam that was
> posting the fix was the same Adam that authored the culprit. :-( Seems I
> definitely need more coffee (or green tea in my case) or reduce the
> number or regressions on the stack. Please accept my apologies.
>
> Thx for the update anyway.

No problem.  Sent out a few e-mails and/or patches while tired and I
when I read them again when I was awake, I had to ask myself 'what
what was I thinking'

>
> > Dimitry had given me some suggestions, and from that,  I posted a V1.
> > Dmitry had some more followup suggestions [2] which resulted in the
> > V2.
> >> As far as I know, Liu was satisfied that this addressed the regression
> > he reported.
>
> So in that case the main question afaics is why this fix did not make
> any progress for more than two weeks now (at least afaics -- or did I
> miss something in that area, too?).

I have not seen anything either which is why I sent out the gentle
nudge last week.

adam
>
> Ciao, Thorsten
>
> >> On 01.06.24 15:24, Adam Ford wrote:
> >>> In the process of adding support for shared IRQ pins, a scenario
> >>> was accidentally created where adv7511_irq_process returned
> >>> prematurely causing the EDID to fail randomly.
> >>>
> >>> Since the interrupt handler is broken up into two main helper functio=
ns,
> >>> update both of them to treat the helper functions as IRQ handlers. Th=
ese
> >>> IRQ routines process their respective tasks as before, but if they
> >>> determine that actual work was done, mark the respective IRQ status
> >>> accordingly, and delay the check until everything has been processed.
> >>>
> >>> This should guarantee the helper functions don't return prematurely
> >>> while still returning proper values of either IRQ_HANDLED or IRQ_NONE=
.
> >>>
> >>> Reported-by: Liu Ying <victor.liu@nxp.com>
> >>> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pi=
ns")
> >>> Signed-off-by: Adam Ford <aford173@gmail.com>
> >>> Tested-by: Liu Ying <victor.liu@nxp.com> # i.MX8MP EVK ADV7535 EDID r=
etrieval w/o IRQ
> >>> ---
> >>> V2:  Fix uninitialized cec_status
> >>>      Cut back a little on error handling to return either IRQ_NONE or
> >>>      IRQ_HANDLED.
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/d=
rm/bridge/adv7511/adv7511.h
> >>> index ea271f62b214..ec0b7f3d889c 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> >>> @@ -401,7 +401,7 @@ struct adv7511 {
> >>>
> >>>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> >>>  int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511);
> >>> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int i=
rq1);
> >>> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int ir=
q1);
> >>>  #else
> >>>  static inline int adv7511_cec_init(struct device *dev, struct adv751=
1 *adv7511)
> >>>  {
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c b/drivers/g=
pu/drm/bridge/adv7511/adv7511_cec.c
> >>> index 44451a9658a3..651fb1dde780 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_cec.c
> >>> @@ -119,7 +119,7 @@ static void adv7511_cec_rx(struct adv7511 *adv751=
1, int rx_buf)
> >>>       cec_received_msg(adv7511->cec_adap, &msg);
> >>>  }
> >>>
> >>> -void adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int i=
rq1)
> >>> +int adv7511_cec_irq_process(struct adv7511 *adv7511, unsigned int ir=
q1)
> >>>  {
> >>>       unsigned int offset =3D adv7511->info->reg_cec_offset;
> >>>       const u32 irq_tx_mask =3D ADV7511_INT1_CEC_TX_READY |
> >>> @@ -130,17 +130,21 @@ void adv7511_cec_irq_process(struct adv7511 *ad=
v7511, unsigned int irq1)
> >>>                               ADV7511_INT1_CEC_RX_READY3;
> >>>       unsigned int rx_status;
> >>>       int rx_order[3] =3D { -1, -1, -1 };
> >>> -     int i;
> >>> +     int i, ret =3D 0;
> >>> +     int irq_status =3D IRQ_NONE;
> >>>
> >>> -     if (irq1 & irq_tx_mask)
> >>> +     if (irq1 & irq_tx_mask) {
> >>>               adv_cec_tx_raw_status(adv7511, irq1);
> >>> +             irq_status =3D IRQ_HANDLED;
> >>> +     }
> >>>
> >>>       if (!(irq1 & irq_rx_mask))
> >>> -             return;
> >>> +             return irq_status;
> >>>
> >>> -     if (regmap_read(adv7511->regmap_cec,
> >>> -                     ADV7511_REG_CEC_RX_STATUS + offset, &rx_status)=
)
> >>> -             return;
> >>> +     ret =3D regmap_read(adv7511->regmap_cec,
> >>> +                     ADV7511_REG_CEC_RX_STATUS + offset, &rx_status)=
;
> >>> +     if (ret < 0)
> >>> +             return irq_status;
> >>>
> >>>       /*
> >>>        * ADV7511_REG_CEC_RX_STATUS[5:0] contains the reception order =
of RX
> >>> @@ -172,6 +176,8 @@ void adv7511_cec_irq_process(struct adv7511 *adv7=
511, unsigned int irq1)
> >>>
> >>>               adv7511_cec_rx(adv7511, rx_buf);
> >>>       }
> >>> +
> >>> +     return IRQ_HANDLED;
> >>>  }
> >>>
> >>>  static int adv7511_cec_adap_enable(struct cec_adapter *adap, bool en=
able)
> >>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/g=
pu/drm/bridge/adv7511/adv7511_drv.c
> >>> index 66ccb61e2a66..c8d2c4a157b2 100644
> >>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >>> @@ -469,6 +469,8 @@ static int adv7511_irq_process(struct adv7511 *ad=
v7511, bool process_hpd)
> >>>  {
> >>>       unsigned int irq0, irq1;
> >>>       int ret;
> >>> +     int cec_status =3D IRQ_NONE;
> >>> +     int irq_status =3D IRQ_NONE;
> >>>
> >>>       ret =3D regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0)=
;
> >>>       if (ret < 0)
> >>> @@ -478,29 +480,31 @@ static int adv7511_irq_process(struct adv7511 *=
adv7511, bool process_hpd)
> >>>       if (ret < 0)
> >>>               return ret;
> >>>
> >>> -     /* If there is no IRQ to handle, exit indicating no IRQ data */
> >>> -     if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >>> -         !(irq1 & ADV7511_INT1_DDC_ERROR))
> >>> -             return -ENODATA;
> >>> -
> >>>       regmap_write(adv7511->regmap, ADV7511_REG_INT(0), irq0);
> >>>       regmap_write(adv7511->regmap, ADV7511_REG_INT(1), irq1);
> >>>
> >>> -     if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.e=
ncoder)
> >>> +     if (process_hpd && irq0 & ADV7511_INT0_HPD && adv7511->bridge.e=
ncoder) {
> >>>               schedule_work(&adv7511->hpd_work);
> >>> +             irq_status =3D IRQ_HANDLED;
> >>> +     }
> >>>
> >>>       if (irq0 & ADV7511_INT0_EDID_READY || irq1 & ADV7511_INT1_DDC_E=
RROR) {
> >>>               adv7511->edid_read =3D true;
> >>>
> >>>               if (adv7511->i2c_main->irq)
> >>>                       wake_up_all(&adv7511->wq);
> >>> +             irq_status =3D IRQ_HANDLED;
> >>>       }
> >>>
> >>>  #ifdef CONFIG_DRM_I2C_ADV7511_CEC
> >>> -     adv7511_cec_irq_process(adv7511, irq1);
> >>> +     cec_status =3D adv7511_cec_irq_process(adv7511, irq1);
> >>>  #endif
> >>>
> >>> -     return 0;
> >>> +     /* If there is no IRQ to handle, exit indicating no IRQ data */
> >>> +     if (irq_status =3D=3D IRQ_HANDLED || cec_status =3D=3D IRQ_HAND=
LED)
> >>> +             return IRQ_HANDLED;
> >>> +
> >>> +     return IRQ_NONE;
> >>>  }
> >>>
> >>>  static irqreturn_t adv7511_irq_handler(int irq, void *devid)
> >>> @@ -509,7 +513,7 @@ static irqreturn_t adv7511_irq_handler(int irq, v=
oid *devid)
> >>>       int ret;
> >>>
> >>>       ret =3D adv7511_irq_process(adv7511, true);
> >>> -     return ret < 0 ? IRQ_NONE : IRQ_HANDLED;
> >>> +     return ret < 0 ? IRQ_NONE : ret;
> >>>  }
> >>>
> >>>  /* -----------------------------------------------------------------=
------------
> >
> >
