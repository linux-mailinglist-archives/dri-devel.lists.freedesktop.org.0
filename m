Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D455C87D67A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 23:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02C2112603;
	Fri, 15 Mar 2024 22:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4zPEIrt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C543D112603
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 22:19:22 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-43095dcbee6so95471cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 15:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1710541161; x=1711145961;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uGbXyxh9lPDMGwwcLAjwgGrEcCAIj7UP9zCDYhA4zzQ=;
 b=4zPEIrt14HTsvs7ubjqoyimVxYvs2rBGhKmAPOsCTmVlrkv37ItS7mNPmolAOL97S/
 O4i8g6ZRPV1GlmZtjHrz7ch8rq+Ate/RG+te3S9Zbkp9dqkq1qz0t1KaVj8jT+WrfwFT
 wqx27+U1jS4a4/GswCzJV31NayLYFxUsizwlgvooDhXb7pIVwyhon4q7q6hq3WqG25nE
 s5FqO4yWWQZu0XLff5tvCiLEf5WadDhtjKms+daKxufBKaEFgWJy1K4tcGmoLHjEzdSM
 rEEaRk4U9usoPwe9eV4V/fFaCWoALx740UI8hIpd7DnrF7cmVOqFz5O6uD4V680se7EL
 4MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710541161; x=1711145961;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uGbXyxh9lPDMGwwcLAjwgGrEcCAIj7UP9zCDYhA4zzQ=;
 b=S22YMNPs3vGarjyalJFhovau/9coXXJcDUNq62CEXmLvB33MlHtGPUeId/q6jJzu40
 JeCgtOK95yYEOeT7SbrWHEIVXVEEaEmpS73iMX9fmEsd8X2NnzpEWVEa8Apnp/WOwEjv
 zDR6WqaVwZBTKl4xrdewMf7jfB5VDRAi9QV40TEeXMpzZk3d2FDodfDfd9E0evxyPsht
 a4bdtD6BDj6Q2OaF3RyXUlkYtjEwxfr4hkM91pYpRABLAvkasiVxBTCaDqtrwTRh0PKX
 0bhPM7cr7WAFaA0mkczMxsSbK10e7+EZrreVFXkmKnJpqWgIC13pTRcn8ZRve5JEPh9y
 CV5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWarqBVw9+fqlGggtPzFGod385yjpplfiEGHXdiVbD1w7mji9XULi2j4idAWFyVMQc4gGr/IafTDkZR3rjiPDPRSzUlnHoQASRiB4DX1jFp
X-Gm-Message-State: AOJu0YzNrnu8zRVeaV9zZAue+P9n6ArmwABiVbGeohEVBIygrWXMarHV
 wIBHBUYKVK1LRDBjYCUZdVVhK2hxcrQ5BLHZ8bp98Bfq45KOHM/5psSTcjhU66nqiuWSM8q5pqw
 mGTwqkW90sEdzdiY1kyA0xS9xboLweMNU+E3l
X-Google-Smtp-Source: AGHT+IF5aE3FAQmefnHVNwEtb6k1Zffv9Um1vh+H3378WyxNWP45BWPFL4v4HGvSMNt4R1eN2uzB4Tld6uV0gxwIAD0=
X-Received: by 2002:a05:622a:1a97:b0:430:b7dd:c175 with SMTP id
 s23-20020a05622a1a9700b00430b7ddc175mr3086qtc.23.1710541161346; Fri, 15 Mar
 2024 15:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
In-Reply-To: <20240315143621.v2.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 15 Mar 2024 15:19:07 -0700
Message-ID: <CABXOdTcfb9F8mKSNnQKWRCAgANyJMNn1yzk4n_E_MpUgH23KCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm/dp: Avoid a long timeout for AUX transfer
 if nothing connected
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>, 
 Vara Reddy <quic_varar@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, Mar 15, 2024 at 2:37=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> As documented in the description of the transfer() function of
> "struct drm_dp_aux", the transfer() function can be called at any time
> regardless of the state of the DP port. Specifically if the kernel has
> the DP AUX character device enabled and userspace accesses
> "/dev/drm_dp_auxN" directly then the AUX transfer function will be
> called regardless of whether a DP device is connected.
>
> For eDP panels we have a special rule where we wait (with a 5 second
> timeout) for HPD to go high. This rule was important before all panels
> drivers were converted to call wait_hpd_asserted() and actually can be
> removed in a future commit.
>
> For external DP devices we never checked for HPD. That means that
> trying to access the DP AUX character device (AKA `hexdump -C
> /dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
> system:
>   $ time hexdump -C /dev/drm_dp_aux0
>   hexdump: /dev/drm_dp_aux0: Connection timed out
>   real    0m8.200s
> We want access to the drm_dp_auxN character device to fail faster than
> 8 seconds when no DP cable is plugged in.
>
> Let's add a test to make transfers fail right away if a device isn't
> plugged in. Rather than testing the HPD line directly, we have the
> dp_display module tell us when AUX transfers should be enabled so we
> can handle cases where HPD is signaled out of band like with Type C.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> Changes in v2:
> - Don't look at the HPD line directly; have dp_display call us.
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  4 ++++
>  3 files changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
> index 03f4951c49f4..e67a80d56948 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -35,6 +35,7 @@ struct dp_aux_private {
>         bool no_send_stop;
>         bool initted;
>         bool is_edp;
> +       bool enable_xfers;
>         u32 offset;
>         u32 segment;
>
> @@ -301,6 +302,17 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp=
_aux,
>                 goto exit;
>         }
>
> +       /*
> +        * If we're using DP and an external display isn't connected then=
 the
> +        * transfer won't succeed. Return right away. If we don't do this=
 we
> +        * can end up with long timeouts if someone tries to access the D=
P AUX
> +        * character device when no DP device is connected.
> +        */
> +       if (!aux->is_edp && !aux->enable_xfers) {
> +               ret =3D -ENXIO;
> +               goto exit;
> +       }
> +
>         /*
>          * For eDP it's important to give a reasonably long wait here for=
 HPD
>          * to be asserted. This is because the panel driver may have _jus=
t_
> @@ -433,6 +445,14 @@ irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
>         return IRQ_HANDLED;
>  }
>
> +void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled)
> +{
> +       struct dp_aux_private *aux;
> +
> +       aux =3D container_of(dp_aux, struct dp_aux_private, dp_aux);
> +       aux->enable_xfers =3D enabled;
> +}
> +
>  void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
>  {
>         struct dp_aux_private *aux;
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_=
aux.h
> index 511305da4f66..f3052cb43306 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -12,6 +12,7 @@
>  int dp_aux_register(struct drm_dp_aux *dp_aux);
>  void dp_aux_unregister(struct drm_dp_aux *dp_aux);
>  irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
> +void dp_aux_enable_xfers(struct drm_dp_aux *dp_aux, bool enabled);
>  void dp_aux_init(struct drm_dp_aux *dp_aux);
>  void dp_aux_deinit(struct drm_dp_aux *dp_aux);
>  void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp=
/dp_display.c
> index 4c72124ffb5d..b0f3e2ef5a6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -565,6 +565,8 @@ static int dp_hpd_plug_handle(struct dp_display_priva=
te *dp, u32 data)
>         int ret;
>         struct platform_device *pdev =3D dp->dp_display.pdev;
>
> +       dp_aux_enable_xfers(dp->aux, true);
> +
>         mutex_lock(&dp->event_mutex);
>
>         state =3D  dp->hpd_state;
> @@ -629,6 +631,8 @@ static int dp_hpd_unplug_handle(struct dp_display_pri=
vate *dp, u32 data)
>         u32 state;
>         struct platform_device *pdev =3D dp->dp_display.pdev;
>
> +       dp_aux_enable_xfers(dp->aux, false);
> +
>         mutex_lock(&dp->event_mutex);
>
>         state =3D dp->hpd_state;
> --
> 2.44.0.291.gc1ea87d7ee-goog
>
