Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7EA1AEEB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 04:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E51910E2AB;
	Fri, 24 Jan 2025 03:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cehgFUAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7085910E2AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 03:14:15 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso1811250e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737688451; x=1738293251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EU/PQ4VJf1HAvGTZSkAiUG1imY6cPU+66kZ1BUgwrQI=;
 b=cehgFUAGo73cxYiyUvMyaO/oAbR9izg9w5kbhxChA7vMZWDDoIoWtoVAh030tmChvn
 r3urkZ34mQ/FfDbXbd2GpKHE2hn94ztibRJFh8fMIvL/tnkr7F637UUN1v+UlV9hrgia
 3aVfJeg42VVnYlGpcglbfY7WrBqKqk2KVCOO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737688451; x=1738293251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EU/PQ4VJf1HAvGTZSkAiUG1imY6cPU+66kZ1BUgwrQI=;
 b=UUBhajuFjG5ioAPNMH1WQJQkOMvpcbd8gnfdmKtSH3sCjWzOhVQ+CQPHr0G9WL9uo3
 l3LktpFwrHFWKNuO5Ujfytae45yx4/WSuBojf/AGzfQVspsURcJmD+QMjJdLGMybD7Xc
 2gXMqrLj/5bMXFsCthOpBNYWpzDO2K2ybyBK86F/HTkcDz2abpTGgPMEPV3TfDwqzpja
 pfxTqPxFmiZBxZrBCBtkHXb9InnhQrDKGiB8U8MUYuh5ktep/ixl6qSJPVjKt5o8QaeB
 0TKPtH9bepf4F/4WBJPNEZvtFGhD/fE7QyCP2oOqFXlcuv2c0sxQ1SeBeWez1D2Jnfiv
 IFhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1WiRCw4kk2svOA0cHpS5J1AfB0FZLo26iqX4/2K74Mat5ZE2U+fGpF95rGrwAxL/kUnHnSRuIQ6Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfWq0a+t0NPm5FfVzfX1y3PB9jCdktVvnk/7nvifLe1ViHlHR/
 HVHlZ7RdPvOU+26lx6UPCTb4EEPOqjvYMmYpb8WT6FspdWququFSSwPcBybg2leeyoFCAyF8BdJ
 qU3Ye
X-Gm-Gg: ASbGncsF/mq7Lj9Pbh2tRNScevNTs2Zsag1jR+eI1B0+PsJK0bfzpKvjYU96aSLBYay
 spO+NI5XPOs2nHPm6xhqZhoMc57wGyesEVzzqvo2CyaAcf493yl5Yk2kin25Hgu9bzuzTi4VHud
 7Oy9vcaHLZmUTdChsaHg10TQyhtnMk7ZV1Pp2V3JhIS5uD+PNEwmHnFfRw6O3U/VnudpvyK3e+h
 KO5o9liuJT2eZrFpGyLZ7Ajfwv4Ca9aI6r0GnTWp9ggfA0zYuqOafP9cFnsoil6IHgcWyzwxnc8
 ewrNjI7QJf1aqzaVieU21HjFIub/WU4mVORDtYokcWzyqMZV
X-Google-Smtp-Source: AGHT+IEJ/Q9nKEy1mzOeTetl05kiw1tV1xkYg+9/HZ8c6bgVEKQND96B7qs4A0C6uoPGvMdTSjk7Vw==
X-Received: by 2002:a05:6512:3c92:b0:53e:39ed:85e6 with SMTP id
 2adb3069b0e04-5439c27fa73mr11511150e87.32.1737688451386; 
 Thu, 23 Jan 2025 19:14:11 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8228975sm140082e87.20.2025.01.23.19.14.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 19:14:10 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30229d5b229so15593201fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 19:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkO92j6Ie4gDAFLgRbVcPcP5axeSFLeAnHqDwpLbZwQv9EQQ62oa4gz0H5274G/Ikmjzlftg4U83U=@lists.freedesktop.org
X-Received: by 2002:a2e:bc1d:0:b0:302:264e:29dd with SMTP id
 38308e7fff4ca-3072cb0d869mr106369041fa.24.1737688449583; Thu, 23 Jan 2025
 19:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-8-damon.ding@rock-chips.com>
 <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
In-Reply-To: <fw74xd2hgwc7iodhh5wb3ovd26tzlsomgypx4hqlqrxl4k2mdf@pycb5ugojyhr>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Jan 2025 19:13:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
X-Gm-Features: AWEUYZmpYwl-43yyRfoSU5RN5Ja9L4Ubzk8XqMfyXD01azhGO7qYiYCgtmJtrGo
Message-ID: <CAD=FV=Ubi11ejFO8asRF57OYGb3fGEFo0mz_04-5yQ89PPw3_A@mail.gmail.com>
Subject: Re: [PATCH v6 07/14] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, 
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 algea.cao@rock-chips.com, kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
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

On Thu, Jan 23, 2025 at 3:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Jan 23, 2025 at 06:07:40PM +0800, Damon Ding wrote:
> > The main modification is moving the DP AUX initialization from function
> > analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> > eDP panel during probing, it is also needed to advance PM operaions to

nit: s/operaions/operations


> > ensure that eDP controller and phy are prepared for AUX transmission.
>
> This doesn't sound right. Per the documentation of
> drm_dp_aux::transfer(), the device should power itself up if transfer()
> is called when it is powered off. The caller must only ensure that the
> panel is on.
>
> Doug, what's your opinion?

I think maybe the CL description is a bit confusing, but looking at
the patch I think that the general idea is correct. drm_dp_aux_init()
is expected to be called in probe() and not in bind(). ...and in order
for it to work then pm_runtime needs to be enabled at probe and not at
bind. So both of those two things that this patch does are (in my
opinion) correct.


> > In addtion, add a new function analogix_dp_remove() to ensure symmetry
> > for PM operations.
> >
> > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >
> > ---
> >
> > Changes in v4:
> > - Use done_probing() to call drm_of_find_panel_or_bridge() and
> >   component_add() when getting panel from the DP AUX bus
> >
> > Changes in v5:
> > - Advance PM operations to make eDP AUX work well
> >
> > Changes in v6:
> > - Use devm_pm_runtime_enable() instead of devm_add_action_or_reset()
> > - Add a new function analogix_dp_remove() to ensure symmetry for PM
> >   operations
> > ---
> >  .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++---------
> >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  4 ++
> >  include/drm/bridge/analogix_dp.h              |  1 +
> >  3 files changed, 34 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drive=
rs/gpu/drm/bridge/analogix/analogix_dp_core.c
> > index 8251adfce2f9..30da8a14361e 100644
> > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > @@ -1658,14 +1658,42 @@ analogix_dp_probe(struct device *dev, struct an=
alogix_dp_plat_data *plat_data)
> >       }
> >       disable_irq(dp->irq);

not related to your patch, but probably needs to be a prerequisite of
your patch: instead of calling disable_irq() here, you should OR in
"IRQF_NO_AUTOEN" to the "irq_flags" of devm_request_threaded_irq().
That not only closes a potential race condition but also makes all the
error handling much more robust.


> > +     dp->aux.name =3D "DP-AUX";
> > +     dp->aux.transfer =3D analogix_dpaux_transfer;
> > +     dp->aux.dev =3D dp->dev;
> > +     drm_dp_aux_init(&dp->aux);

FWIW: I would highly encourage you to (in a separate patch) add
wait_hpd_asserted() support here. It is deprecated to not implement
wait_hpd_asserted(). See the definition of "wait_hpd_asserted" in
"struct drm_dp_aux" if you're going to support eDP panels.


> > +     if (IS_ENABLED(CONFIG_PM)) {

Do we really truly need this? Is there anyone actually using this
driver without "CONFIG_PM", or can we just assume CONFIG_PM. For the
most part drivers I've interacted with just assume CONFIG_PM and
they're a lot simpler because of it. If there's truly a need then we
can keep this complexity, but I'd rather wait until there is a user.
Maybe you could add this as a dependency in the Kconfig if needed.


> > +             pm_runtime_use_autosuspend(dp->dev);
> > +             pm_runtime_set_autosuspend_delay(dp->dev, 100);
> > +             ret =3D devm_pm_runtime_enable(dp->dev);
> > +             if (ret)
> > +                     goto err_disable_pm_runtime;
> > +     } else {
> > +             ret =3D analogix_dp_resume(dp);
> > +             if (ret)
> > +                     goto err_disable_clk;

IMO: if analogix_dp_resume() succeeds, use devm_add_action_or_reset()
to have a function call analogix_dp_suspend(). Then you can keep using
"devm" for everything and totally get rid of the need for the
analogix_dp_remove() function.


> > +     }
> > +
> >       return dp;
> >
> > +err_disable_pm_runtime:
> > +     pm_runtime_dont_use_autosuspend(dp->dev);

You don't need to call pm_runtime_dont_use_autosuspend(). If you
enabled pm_runtime with devm_pm_runtime_enable() then it's documented
to handle calling pm_runtime_dont_use_autosuspend() for you. See the
kernel doc comment for devm_pm_runtime_enable(). So you can get rid of
this.


> >  err_disable_clk:
> >       clk_disable_unprepare(dp->clock);
> >       return ERR_PTR(ret);

Huh? Why would you call "err_disable_clk" here? The only thing that
enables the clock is analogix_dp_resume(), right? There's something
fishy here and it predates your patch. I suspect there were problems
in commit f37952339cc2 ("drm/bridge: analogix_dp: handle clock via
runtime PM"). You should fix that in a separate patch before yours.


> > +void analogix_dp_remove(struct analogix_dp_device *dp)
> > +{
> > +     if (IS_ENABLED(CONFIG_PM))
> > +             pm_runtime_dont_use_autosuspend(dp->dev);
> > +     else
> > +             analogix_dp_suspend(dp);
> > +}
> > +EXPORT_SYMBOL_GPL(analogix_dp_remove);

See above. Proper use of "devm" should mean you don't need a remove() funct=
ion.
