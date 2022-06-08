Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBF543E41
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800B71123A5;
	Wed,  8 Jun 2022 21:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D3411242B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:09:29 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-f16a3e0529so28842408fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uhJJ7vGk8+Id10EIAj/9LMT1XbZWpMVxVhaQKdTBSfI=;
 b=V020tV+I/mDPHoYM1HEFkw22NgeFtDVa6EthaBqZoe+LpxeJCsQ8cSsZ2s4++JFQq3
 SJEv7RTD3tYo2Av+75eI5RN4f54ceE0ALuZzobRmNLAlLJ7IhBWlSsOi+h/ARFzyNS45
 Mgt1wgcm/9Q57wlH4EIX5rwi4ivD+8FPlSin8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uhJJ7vGk8+Id10EIAj/9LMT1XbZWpMVxVhaQKdTBSfI=;
 b=0JWPI6TcHdH9IFOX+zzLoGBHHnsSlwjYmpNPlUMYbbZArRrhMEVKZ7mepeV41k5u/j
 u9h+IvdxHl/G96vRwP9kl23N3XPnNS2VWwZ4YxP7MN+r66mCz3Q76FL76eRhJ3wyGfjO
 aj4/8mDSqgWFV5mBzAKutIc/N8XOzdIfV44EgHzRzQdYeAammXCFSSVnsZ2i+xsQWOgZ
 zPFy93rwO6Wlnwxca/4hAgBzKBwC3Sfa7zvXkcqpH+scmUA6qeztUjt5flzJwf5Dwnkq
 tvvsqoHc52J8Wx//+uYebvSzDlNlffZJRI7Z6ItcdLRtPuEXG/uzKvgVfPcFEZABH0Qb
 M77w==
X-Gm-Message-State: AOAM533PI8bYT6/BsIVvPvUzOIjVzdTXWdJtGtPQeE2Lm/Q6sVUdK11s
 26m/qh4SvSPhf9e4dNmrc3+F+tzAOIqSV3muKQj3SQ==
X-Google-Smtp-Source: ABdhPJzmx5Jd5m5hQL9PhU8wNcpObqIaY2q01hyfKAhi3HtRM5VXK73tcALRVlIHY0kXpNrHVdt1VibRfTVZboooaCo=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1782835oap.63.1654722568598; Wed, 08 Jun
 2022 14:09:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:09:28 -0700
MIME-Version: 1.0
In-Reply-To: <20220608094816.2898692-2-hsinyi@chromium.org>
References: <20220608094816.2898692-1-hsinyi@chromium.org>
 <20220608094816.2898692-2-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:09:28 -0700
Message-ID: <CAE-0n51CMu3LxSewwxN64LwbMoARq54TPdpODpz-Bp5uUi_QZg@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/panel: Add an API to allow drm to set
 orientation from panel
To: Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Hsin-Yi Wang (2022-06-08 02:48:09)
> index 1c48d162c77e..859165a1c8f1 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2389,6 +2393,34 @@ int drm_connector_set_panel_orientation_with_quirk(
>  }
>  EXPORT_SYMBOL(drm_connector_set_panel_orientation_with_quirk);
>
> +/**
> + * drm_connector_set_orientation_from_panel -
> + *     set the connector's panel_orientation from panel's callback.
> + * @connector: connector for which to init the panel-orientation property.
> + * @panel: panel that can provide orientation information.
> + *
> + * Drm drivers should call this function before drm_dev_register().
> + * Orientation is obtained from panel's .get_orientation() callback.
> + *
> + * Returns:
> + * Zero on success, negative errno on failure.
> + */
> +int drm_connector_set_orientation_from_panel(
> +       struct drm_connector *connector,
> +       struct drm_panel *panel)
> +{
> +       enum drm_panel_orientation panel_orientation;

s/panel_orientation/orientation/

> +
> +       if (panel && panel->funcs && panel->funcs->get_orientation)
> +               panel_orientation = panel->funcs->get_orientation(panel);
> +       else
> +               panel_orientation = DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> +
> +       return drm_connector_set_panel_orientation(connector,
> +                                                  panel_orientation);

Then this fits on one line:

	return drm_connector_set_panel_orientation(connector, orientation);

> +}
> +EXPORT_SYMBOL(drm_connector_set_orientation_from_panel);
> +

Otherwise

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
