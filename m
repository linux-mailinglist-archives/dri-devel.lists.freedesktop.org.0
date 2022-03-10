Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD544D5514
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 00:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1E10E1B9;
	Thu, 10 Mar 2022 23:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C641210E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 23:10:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s10so8959828edd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FdRD7UqyvIUj279CEK1jZhIkgCE+xn41rfRl2yq1BwA=;
 b=T/q56MG2EY5bFCFeahW25OmtAXtMaEF5rZwoAkIuXrQ+H+ausHtpVCkE4IGxGnitV9
 7wuejt/lAn4WozekwFbX/ISvBi2gQ2dmVE7m0S3Ug4eXsNJ9DfMOqauA+agFNy33+qN1
 xyrawS89u6mWz1ZMfZ9rS/OTtQw2YrBmH8MXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FdRD7UqyvIUj279CEK1jZhIkgCE+xn41rfRl2yq1BwA=;
 b=Ulc9UjjmQWpHHdJnrwOQLMDLBIp1lXIeQ7bq9ltn6eptCb8vixZo6hrCE+8r1QccFF
 LCaFN3fJ9Y64/eVWI4ovugJEC3ChEfI8+r16howxxhEkB0wrLnQKLS2nZMoSszvHs8eq
 JCuTmapNwz0p6bYBFTZ8EBuur+2kCO0ooV/nd0FeBuFH/Q8yG5/amuvAwKlN8FnviIS4
 EpkZQFQmkxiMEcJbBfjj1YdRnus3GiFRS93xaasMqm3t0SevX+AKxXlQAXhECuFcxw9t
 gXu9m9lrzrluxxRgrGeafXexYdJWsxSQTyDMy0ylUKQLxEpzzunLWQW0tOjCPi1w4rVY
 rmsQ==
X-Gm-Message-State: AOAM530uDjOAHxDFBvgmAmdoE7SElYn0vA/sFPCoYVReQSChU02XiLKs
 1WpUF2oBArR8kbSspgJM8HvHVa5R9Nb/Pe0o
X-Google-Smtp-Source: ABdhPJxL5Q8rbmrDU59G4Ue2oNJcC3WbMlK8QtFSmdqNDG4bOPJ/YiKZmE4QgPdFDfr0c74fQqWpAA==
X-Received: by 2002:a50:cfc4:0:b0:413:b19d:d9c0 with SMTP id
 i4-20020a50cfc4000000b00413b19dd9c0mr6527173edk.384.1646953834975; 
 Thu, 10 Mar 2022 15:10:34 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 bm5-20020a170906c04500b006ce6f8892a5sm2242136ejb.7.2022.03.10.15.10.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 15:10:34 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id t11so10389409wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 15:10:33 -0800 (PST)
X-Received: by 2002:adf:e983:0:b0:1f1:f52b:8328 with SMTP id
 h3-20020adfe983000000b001f1f52b8328mr5208098wrm.513.1646953833413; Thu, 10
 Mar 2022 15:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Mar 2022 15:10:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
Message-ID: <CAD=FV=UcfrWLQdCOx5dCfjvjrLzkdLDeoAROmMtqFWB_X90rwQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 10, 2022 at 7:22 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Changes since v1:
>
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
>
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 93b54fcba8ba..d581c820e5d8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1135,10 +1135,24 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +                                         struct drm_connector *connector)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       struct edid *edid;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       edid = drm_get_edid(connector, &pdata->aux.ddc);
> +       pm_runtime_put_autosuspend(pdata->dev);

I'm 99% sure that the pm_runtime calls here are not needed and can be
removed.. The AUX transfer function handles the pm_runtime_get_sync()
and it also does the "put" with autosuspend so that the whole EDID can
be read without constantly powering the bridge up and down again.
