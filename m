Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D364DA16
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF12A10E52A;
	Thu, 15 Dec 2022 11:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED9610E52A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:10:33 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1447c7aa004so20453065fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aRto0bZxVVcjkpJwpAaqpQJPNIkhGaRdbAHEq1bO1W4=;
 b=tguM4k0ZVIq7MU6CANzSDbUbT8H5e9aNxOzp+qDUd5q5zsp2P5k8iBa2SMlTOQTeLe
 mpIqpdPvPWzmZThOeMVVwSBI9D0/2V0qDtCb0JQx93xw1j5pR7h4M1zGL8s0P46Ha+Pp
 1KAN8cqTnT9RczsO38nIDF+1OxIGOYEhUqZRZ2batQgmoRxrkxplV63iwj54NthqLVxh
 Zbq002RWJpPzm6Ebgc0UXX9K1E+i5l6VoieK+aLzbertOiRlt0Cq9h84H4SNmR772p1z
 47Luk6LdxO2NnAwvGcegP2/gNmqKwyshy/pmdZQZWzFGXPEovVmVxcmcMcLjGsfJ+jHY
 7GOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aRto0bZxVVcjkpJwpAaqpQJPNIkhGaRdbAHEq1bO1W4=;
 b=BQjN7Pqn8G3yJkcyXA5+QndIOvD2sV4XAN1gAGpdZS3sh3RMccZHKM4M4vLzGn0L3/
 pLHdez4HLoSCNsp5tV452U5hAb2XZeADt/dJoFQXOZpCD9B+MLltGsvR7vVynSCVChnq
 4wwRdQZ7PYsRkZAoUIMW5ui7YsJmZUFVm/d8jtDDsLLoJjFGPf+SBSrgM1xlx8otxdrr
 7q8n4F618VdPwQ9oDHZR1A1wbpEYRlwQALCoeFz6zWXxLgY8d6lR77W1a0mFoo9OkdIZ
 LKoRZAdmspDeApF3cAViZLxYpcnHK+3STbGrX1PlTnWd3Ak6YVeq9vQmMKKHXqvqUES5
 d+jw==
X-Gm-Message-State: AFqh2kogqDllOzua/s5JuEgNtA8HXTcGJfFGmdJI6WQKcCyZAN3CYWOg
 gbVgXDUW4U5TH0GlvxNLIdtSrApr65FOwCKzfgWyww==
X-Google-Smtp-Source: AA0mqf68Sk+5tLWaXbcHhE/bSQNqfhEV2ngdiH+3BTGVVdHM1vDmMlOvk1gMHnYUv8mmj005k0gjGg/4n7TupCvCbD0=
X-Received: by 2002:a05:6870:2393:b0:144:b04d:1669 with SMTP id
 e19-20020a056870239300b00144b04d1669mr182044oap.155.1671102632452; Thu, 15
 Dec 2022 03:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-5-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-5-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:10:21 +0100
Message-ID: <CAG3jFyubct-L6vr3G0r+1+DX7D43raG-Rgx2-xi+JP7bVPesNQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm: bridge: it66121: Write AVI infoframe with
 regmap_bulk_write()
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:58, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Since all AVI infoframe registers are contiguous in the address space,
> the AVI infoframe can be written in one go with regmap_bulk_write().
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index 12222840df30..0a4fdfd7af44 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -773,24 +773,9 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>                              const struct drm_display_mode *mode,
>                              const struct drm_display_mode *adjusted_mode)
>  {
> -       int ret, i;
>         u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
>         struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
> -       const u16 aviinfo_reg[HDMI_AVI_INFOFRAME_SIZE] = {
> -               IT66121_AVIINFO_DB1_REG,
> -               IT66121_AVIINFO_DB2_REG,
> -               IT66121_AVIINFO_DB3_REG,
> -               IT66121_AVIINFO_DB4_REG,
> -               IT66121_AVIINFO_DB5_REG,
> -               IT66121_AVIINFO_DB6_REG,
> -               IT66121_AVIINFO_DB7_REG,
> -               IT66121_AVIINFO_DB8_REG,
> -               IT66121_AVIINFO_DB9_REG,
> -               IT66121_AVIINFO_DB10_REG,
> -               IT66121_AVIINFO_DB11_REG,
> -               IT66121_AVIINFO_DB12_REG,
> -               IT66121_AVIINFO_DB13_REG
> -       };
> +       int ret;
>
>         mutex_lock(&ctx->lock);
>
> @@ -810,10 +795,12 @@ void it66121_bridge_mode_set(struct drm_bridge *bridge,
>         }
>
>         /* Write new AVI infoframe packet */
> -       for (i = 0; i < HDMI_AVI_INFOFRAME_SIZE; i++) {
> -               if (regmap_write(ctx->regmap, aviinfo_reg[i], buf[i + HDMI_INFOFRAME_HEADER_SIZE]))
> -                       goto unlock;
> -       }
> +       ret = regmap_bulk_write(ctx->regmap, IT66121_AVIINFO_DB1_REG,
> +                               &buf[HDMI_INFOFRAME_HEADER_SIZE],
> +                               HDMI_AVI_INFOFRAME_SIZE);
> +       if (ret)
> +               goto unlock;
> +
>         if (regmap_write(ctx->regmap, IT66121_AVIINFO_CSUM_REG, buf[3]))
>                 goto unlock;
>
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
