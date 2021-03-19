Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D4341F51
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0606EA19;
	Fri, 19 Mar 2021 14:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8356A6EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:27:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so6817505pjc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7mV4Rbx11jSwGIO7RFWexEM9wuc954Tc7xoZGSC8RY=;
 b=GLXyAn0MdFT42J6cb6YnfW63npT81/n7lhBa96/JtS7CxrjrH72B6rJtFaiqBzHLrA
 mTY3t6/8/oM5MxseEQRivmzslOGqSbjil+9paVlcpPb/o1mPG5c4EbQAun0rLLKbshdE
 HkXG7+PmRkqhA2NmGafsaYCjf5SYcu10XCFH8aDuYUbs7vv/CZv9ePX1VyOwWLjuba24
 sSyJ3g/wXIECiOK+bH4Ih8BIxlgkkhYn9ivIbEd2929m/OFYb/Z0XHf7gAMtdOPlU+lx
 VHucChxDfHeZCh5Wt0c5DLVlHmNJIwEg3VCmmYzXscKFmj5eJ71iM/WbtM1xz4oQApfz
 Orgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7mV4Rbx11jSwGIO7RFWexEM9wuc954Tc7xoZGSC8RY=;
 b=W/kjhsI7rVRg5meGNu4R/nvsP745zdOouQjV2xbZCPZGKIRz8AsB5XMOqEjqb7VR9K
 IWzIeot8ovy87EgOzyxivX0SKDAkBYuzDYMkjuHXSSYJNMPGj7P9Ox5u5rLRjZk/UuUl
 C8hrAIjUnJRRLLwEe1l6yMmrp3ffpcV4N+9Tfv7TgJG9CY7ziO7u1d3kPIfWypcXptFD
 YbEUmWLCF0o8uqX9excVBN0+AB1v62FS+BdYgjghsrtZFu6tN3JEqW9tMEF2QIh+hzcO
 U8a1ZPc0Fb5SLnB7xkjhGSJe5xpP9Q+XC6KBwHuZGepuQ6o9H8svOAb+Oqw8QRQ/yrQh
 XpNA==
X-Gm-Message-State: AOAM533LeScOhQYkzvZhSOOqQksMOXoE+yulkUcIFPY8VF8XU+wPxtWW
 oqobjQWmliB+aC+UWUNSQnH1Y1f7R/PQSF+7KamSgg==
X-Google-Smtp-Source: ABdhPJwnvR9UG2Yo3M+kYPqi3jAuQjulo9vJWylVtTTAmghGEpuzrJcoACdzlFVSdwttecpo72YGBTDHorwXzt+5IKQ=
X-Received: by 2002:a17:902:f68a:b029:e5:b17f:9154 with SMTP id
 l10-20020a170902f68ab02900e5b17f9154mr14411080plg.28.1616164046035; Fri, 19
 Mar 2021 07:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-5-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-5-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:27:15 +0100
Message-ID: <CAG3jFyuR6yH9bWzbmcZVRoyRUvu0qvEirVtxtcUmVEyVpeW_JQ@mail.gmail.com>
Subject: Re: [PATCH 04/30] drm/bridge/tc358767: Don't register DP AUX channel
 until bridge is attached
To: Lyude Paul <lyude@redhat.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

This patch looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:56, Lyude Paul <lyude@redhat.com> wrote:
>
> Since this is a bridge, we don't start out with a respective DRM device.
> Likewise this means we don't have a connector, which also means that we
> should be following drm_dp_aux_register()'s documentation advice and not
> call drm_dp_aux_register() until we have a matching connector. Instead,
> call drm_dp_aux_init() in tc_probe() and wait until tc_bridge_attach() to
> register our AUX channel. We also add tc_bridge_detach() to handle
> unregistering the AUX adapter once the bridge has been disconnected.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 34a3e4e9f717..da89922721ed 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1414,11 +1414,15 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>         if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
>                 return 0;
>
> +       ret = drm_dp_aux_register(&tc->aux);
> +       if (ret < 0)
> +               return ret;
> +
>         /* Create DP/eDP connector */
>         drm_connector_helper_add(&tc->connector, &tc_connector_helper_funcs);
>         ret = drm_connector_init(drm, &tc->connector, &tc_connector_funcs, tc->bridge.type);
>         if (ret)
> -               return ret;
> +               goto aux_unregister;
>
>         /* Don't poll if don't have HPD connected */
>         if (tc->hpd_pin >= 0) {
> @@ -1438,10 +1442,19 @@ static int tc_bridge_attach(struct drm_bridge *bridge,
>         drm_connector_attach_encoder(&tc->connector, tc->bridge.encoder);
>
>         return 0;
> +aux_unregister:
> +       drm_dp_aux_unregister(&tc->aux);
> +       return ret;
> +}
> +
> +static void tc_bridge_detach(struct drm_bridge *bridge)
> +{
> +       drm_dp_aux_unregister(&bridge_to_tc(bridge)->aux);
>  }
>
>  static const struct drm_bridge_funcs tc_bridge_funcs = {
>         .attach = tc_bridge_attach,
> +       .detach = tc_bridge_detach,
>         .mode_valid = tc_mode_valid,
>         .mode_set = tc_bridge_mode_set,
>         .enable = tc_bridge_enable,
> @@ -1680,9 +1693,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>         tc->aux.name = "TC358767 AUX i2c adapter";
>         tc->aux.dev = tc->dev;
>         tc->aux.transfer = tc_aux_transfer;
> -       ret = drm_dp_aux_register(&tc->aux);
> -       if (ret)
> -               return ret;
> +       drm_dp_aux_init(&tc->aux);
>
>         tc->bridge.funcs = &tc_bridge_funcs;
>         if (tc->hpd_pin >= 0)
> @@ -1702,7 +1713,6 @@ static int tc_remove(struct i2c_client *client)
>         struct tc_data *tc = i2c_get_clientdata(client);
>
>         drm_bridge_remove(&tc->bridge);
> -       drm_dp_aux_unregister(&tc->aux);
>
>         return 0;
>  }
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
