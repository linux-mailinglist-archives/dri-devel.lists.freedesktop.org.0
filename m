Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D98C9A1C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 11:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E986610E52D;
	Mon, 20 May 2024 09:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cWOFRpBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3748010E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 09:08:47 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-df1cfa7f124so2384875276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716196126; x=1716800926; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rsXIdnEGMK6jEQXuJEcWV+3QDrgp423KVVA+wYoTsTk=;
 b=cWOFRpBTW32v37xh48JmTV+xqVn+X3liGEHdkcHxWdYMbhd1xHrzaKipPd24uW/VNp
 Xve+XylCLo85TrIz92FxzxCUbfyRV032DJcJOqWu0rVBzPsarfdut1SQOA8RsB1QJJ8R
 u6JEqkpC+6XqbFYMgOoPY2204cZif10op5rAeKqiIgl01zyE3jO1KcgFn257VBrrqhNt
 sZmgPM49bO+iMumDxv+gAwBxQ7WSJjjlsDRiBJGaXIHbr2LT/DjJI2MHbLtBAmSgTfQ5
 YV8Zo6XjHWG6diiWrFK9XBqWzBGp9aVXZBBNRUQVbrmIfWCJPIl4l9A7jwz1BnA2E+ZR
 skrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716196126; x=1716800926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsXIdnEGMK6jEQXuJEcWV+3QDrgp423KVVA+wYoTsTk=;
 b=Jz1uKrC85xSOU/cCZcmVqGYblPjtzJZ8QnxiCNqV77+GqvOjtj2fegog6PXsWuIgq9
 WZEqY+zQQngWtg+wSLWYhIG8MRaqlPhCdWZ7V0U4gxove+nPxoO++wj9PrETHt0n9yvl
 9L39nFic7aWH7ZarJ96YBpy9Rl6aGKWDeJkI7bchHLF6d+hedc+vb+A4FMV4zO66z3DR
 nMgjYz/7np/6MddA2acuSKIzI2mWazQjkKbvwOtQuPCcuH9nHYotcQL8Jcqo3AA7VGNt
 kJI0oyVY2P3I5Vft0z/i30xxzuYnXUVF6AJgkLkAGjKXNCGHg6+PEkOQJ2d5+eW4teu7
 elRg==
X-Gm-Message-State: AOJu0YyuFHnJ2Tp6GO8pyyLSBHBYvg4+WXbWCPBr5wg1+xGIg8g0I3xM
 S6yoSXCeMHDbw9jgwsXF5hgmIlFLKdNV0c0huDoMstUrT/nDOPUWTWG3IOea1du4dWZwTHsYuae
 xxAUjlYq5H7WVJ+LvhyZCGN6gp0dOLY40fOLBtQ==
X-Google-Smtp-Source: AGHT+IHNVEhnihEzvQfFRep3JcNSMShmxc2WAoOrCzTZfseWMCDTcy0PJ24ZzIcLimohwaU6t1G4RC2Jwd5WaS/Am1A=
X-Received: by 2002:a25:f403:0:b0:de5:4b1f:7e00 with SMTP id
 3f1490d57ef6-dee4f2ce7bcmr24641867276.15.1716196125854; Mon, 20 May 2024
 02:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240516101006.2388767-1-victor.liu@nxp.com>
 <evnxopqt5be56vxuxqdj4l3mcd5nrrvucio7jhwgg4emraai3t@gherubdynyip>
 <5efe29a7-441f-4d70-b17c-5327c0a9f600@nxp.com>
In-Reply-To: <5efe29a7-441f-4d70-b17c-5327c0a9f600@nxp.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 12:08:34 +0300
Message-ID: <CAA8EJpqZPQUcqm2U+T7AK74qxo9J0kggS4g484OfoNPAEZPNBw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Exit interrupt handling when
 necessary
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, biju.das.jz@bp.renesas.com, 
 u.kleine-koenig@pengutronix.de, aford173@gmail.com, jani.nikula@intel.com, 
 bli@bang-olufsen.dk, sui.jingfeng@linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 20 May 2024 at 06:29, Liu Ying <victor.liu@nxp.com> wrote:
>
> On 5/20/24 06:11, Dmitry Baryshkov wrote:
> > On Thu, May 16, 2024 at 06:10:06PM +0800, Liu Ying wrote:
> >> Commit f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >> fails to consider the case where adv7511->i2c_main->irq is zero, i.e.,
> >> no interrupt requested at all.
> >>
> >> Without interrupt, adv7511_wait_for_edid() could return -EIO sometimes,
> >> because it polls adv7511->edid_read flag by calling adv7511_irq_process()
> >> a few times, but adv7511_irq_process() happens to refuse to handle
> >> interrupt by returning -ENODATA.  Hence, EDID retrieval fails randomly.
> >>
> >> Fix the issue by checking adv7511->i2c_main->irq before exiting interrupt
> >> handling from adv7511_irq_process().
> >>
> >> Fixes: f3d9683346d6 ("drm/bridge: adv7511: Allow IRQ to share GPIO pins")
> >> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >> ---
> >>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> index 6089b0bb9321..2074fa3c1b7b 100644
> >> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> >> @@ -479,7 +479,8 @@ static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
> >>              return ret;
> >>
> >>      /* If there is no IRQ to handle, exit indicating no IRQ data */
> >> -    if (!(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >> +    if (adv7511->i2c_main->irq &&
> >> +        !(irq0 & (ADV7511_INT0_HPD | ADV7511_INT0_EDID_READY)) &&
> >>          !(irq1 & ADV7511_INT1_DDC_ERROR))
> >>              return -ENODATA;
> >
> > I think it might be better to handle -ENODATA in adv7511_wait_for_edid()
> > instead. WDYT?
>
> Then, adv7511_cec_irq_process() will have less chance to be called from
> adv7511_irq_process() (assuming CONFIG_DRM_I2C_ADV7511_CEC is defined)
> if adv7511->i2c_main->irq is zero.
>
> But, anyway, it seems that commit f3d9683346d6 ("drm/bridge: adv7511:
> Allow IRQ to share GPIO pins") is even more broken to handle the CEC case,
> as adv7511_cec_adap_enable() may enable some interrupts for CEC.
>
> This is a bit complicated.  Thoughts?

Send a revert and do it properly?

>
> Regards,
> Liu Ying
>
>
>
>
>


-- 
With best wishes
Dmitry
