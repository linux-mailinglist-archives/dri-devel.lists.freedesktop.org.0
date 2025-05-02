Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64A9AA6973
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 05:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D633A10E0AC;
	Fri,  2 May 2025 03:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NwEknTjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8010E0AC
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 03:38:33 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2240b4de12bso26585805ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 20:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1746157110; x=1746761910;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPJbY5868L+3A1cDgA46X38/XlY0WsfhVjXq+7oUVv4=;
 b=NwEknTjK8gZPmnVkP4Nn68eFu6WLEpVO5xhTUFKxgIEWvxYhk+WhtTEVN6vsErRfig
 7QdtYJ02w7B4/HtGKgIx+HEUeanaE901Plo/asywjbgHl7mBRTJROGGXv8JXBQXoc5op
 za7DP7aKyuNK8bUHfPAAxv0sdbIQnpdPGCEL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746157110; x=1746761910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPJbY5868L+3A1cDgA46X38/XlY0WsfhVjXq+7oUVv4=;
 b=tHjRTXPH3ysTcrBiM2ePUkkHs38VejWipL47xgT4onmLn40QTlmRig1HA401sLuHVQ
 QuM6pi6sIerGKPRmAAdG3BKd2H6hCm/LkYp4zOnlwKWou5IvZAineij8RujMzmJGHjK6
 zXcv8Felqp+W4gxCL/KTH7pubsNiN47o4k4Ygf7gtU47CVUDnNXC4kkTG9Y9acwGcAtI
 XB6L7rjWsJVVUPHvOX3YeJzYQm4TDAmcD5JDWcEAhYWPdEUsueDoXluYJJU6Jy5ma4cr
 i65Re8zceo22054Y/AbR3LPvDIppJ49lIfYYb/aOQiEHcdMkhVoU2y4Jje1EBIy08B6q
 qQow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU47v3l57kzmDBtJ9y4tyKo9x1hdSDIgixOMt1BXJgT7iCuLa+mxsAZjpXclHfCkRbiqpijxf3ZHio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbAbRXeAjrbCKwiWS0uedg+9EUywZ9HtaEUXqrmFylJGqQvP6G
 Qz5nfZCX10U9N2rnYM06a4QM5UsBF5x6pI15Nq2ZrOFOeI1nwkoh3QcNoHILUN4E/7zo+HyCKw4
 =
X-Gm-Gg: ASbGncuOybnT1wFRJ+pvJVz/WQegOX+QH74fVRFXI6mKlLdH8xzLU2lOb0Dqb+S+rtn
 bsmr6Zg12axhCYgJD3aJNiexee0r7ZxZWjZnPj3PHQS4nKvDBxJwKUfQnQUkG833xi/M7BaMu9e
 qn9+3JN4mMDpNb7TtDRaV1zQ03us8JXc2GqIrd0x4zf1GKPlGDM09JtNn+xsd7OMLvRd23cd8wf
 VUKUOTL/JzYYvFwCyybCFnT9den1Cp7C8ykuwuXIQiQAd6uukxv36HxcnmUAJbIYzK6+BOnOQoH
 YkX1YaRAjTvldKlM0xs7NYilhzYGRtClszou2I03FTAR/YWtgtZ2HiQRqi8TtYm6DhJCFWM9KAM
 VfUmquCP2lc+iwgg=
X-Google-Smtp-Source: AGHT+IF+AqkregepnL8O19TwPFG4LYSkL3e0XmqQPPQe8/9W04Gvxb5iGOCLVCU2Ap9M1gNHKD+g0g==
X-Received: by 2002:a17:902:d487:b0:224:191d:8a79 with SMTP id
 d9443c01a7336-22e102e39e4mr18762925ad.27.1746157110522; 
 Thu, 01 May 2025 20:38:30 -0700 (PDT)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1084959csm4321105ad.5.2025.05.01.20.38.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 20:38:28 -0700 (PDT)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-306b6ae4fb3so1819794a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 20:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU8NQbRaIIAbQHn5GKWDmcYWft4zfmZ37JC/ImZ4BvcboyeroOOc72XbcfmIjdGqO0k/bR9F2gAfOQ=@lists.freedesktop.org
X-Received: by 2002:a17:90a:f944:b0:2ff:6aa6:47a3 with SMTP id
 98e67ed59e1d1-30a4e686b6amr2145034a91.25.1746157107521; Thu, 01 May 2025
 20:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
In-Reply-To: <20250501074805.3069311-1-max.oss.09@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 1 May 2025 20:38:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
X-Gm-Features: ATxdqUFyowe41v3nrLRGFu76N4r5nn_xrMaypod_FFNLGmwvMmshLREDILcpah8
Message-ID: <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Jayesh Choudhary <j-choudhary@ti.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, May 1, 2025 at 12:48=E2=80=AFAM <max.oss.09@gmail.com> wrote:
>
> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> The bridge driver currently disables handling the hot plug input and
> relies on a always connected eDP panel with fixed delays when the
> panel is ready.

Not entirely correct. In some cases we don't have fixed delays and
instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
code.


> If one uses the bridge for a regular display port monitor this
> assumption is no longer true.
> If used with a display port monitor change to keep the hot plug
> detection functionality enabled and change to have the bridge working
> during runtime suspend to be able to detect the connection state.
>
> Note that if HPD_DISABLE is set the HPD bit always returns connected
> independent of the actual state of the hot plug pin. Thus
> currently bridge->detect() always returns connected.

If that's true, it feels like this needs:

Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
connector operations for DP")

...and it would be nice to get Laurent to confirm. Seems weird that he
wouldn't have noticed that.


> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>
> ---
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 01d456b955ab..c7496bf142d1 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65=
dsi86 *pdata)
>          * If HPD somehow makes sense on some future panel we'll have to
>          * change this to be conditional on someone specifying that HPD s=
hould
>          * be used.
> +        * Only disable HDP if used for eDP.
>          */
> -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE=
,
> -                          HPD_DISABLE);
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_eDP)
> +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> +                                  HPD_DISABLE, HPD_DISABLE);
>
>         pdata->comms_enabled =3D true;
>
> @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct=
 device *dev)
>         struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(dev);
>         int ret;
>
> +       if (pdata->bridge.type =3D=3D DRM_MODE_CONNECTOR_DisplayPort &&
> +           pdata->comms_enabled)
> +               return 0;
> +

I don't understand this part of the patch. You're basically making
suspend/resume a no-op for the DP case? I don't think that's right...

First, I don't _think_ you need it, right? ...since "detect" is
already grabbing the pm_runtime reference this shouldn't be needed
from a correctness point of view.

Second, if you're looking to eventually make the interrupt work, I
don't think this is the right first step. I think in previous
discussions about this it was agreed that if we wanted the interrupt
to work then we should just do a "pm_runtime_get_sync()" before
enabling the interrupt and then a "pm_runtime_put()" after disabling
it. That'll keep things from suspending.

Does that sound correct, or did I goof up on anything?

-Doug
