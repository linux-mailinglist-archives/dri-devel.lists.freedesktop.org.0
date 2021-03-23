Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FA345880
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:22:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A566E83A;
	Tue, 23 Mar 2021 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359736E83A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:21:58 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so688657pjb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=GHDhziE/oTUWgeSPv8hi2p61hONT45CsImRcE+t3T5A=;
 b=SsLOR4LLwLrU1iVER9axbrwghAGi/pvLvTPnSSXUOoTV7D0Lwh3AxSHyAGFiK7PUov
 dhZ4F2++AA74GPiPZZdkUVQIcM99ti83wNX60E8+k7l6Fm8IUCRoBU8qoFdQBlYKyx5A
 Bw1Yj6iuNWwhXKF1VD1xHn1+OcSP5t6IMT9MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=GHDhziE/oTUWgeSPv8hi2p61hONT45CsImRcE+t3T5A=;
 b=pSjZkmPEWdaWjjJPRCPtEiV55V8BIr5fcuDMTQ4c7F94VSQnkNWkMNY/TzZk3sqGCS
 zVUP2bCmUgIB4cHNNSmqgDeBHmqFwVv0hIT3CiYGuzKr9S0yoqqRcJ4cWQn3wmriQglq
 JcSfh2I6uBcALaiWxGLRtYtmvXaCzIbvRDng9kVX3G9po2N0wuAZH7mRBCu9pfMny+iD
 yZjipPwpzI8Q7GZ6SBDVrFWvUyvubc1D3lJtOgPT51cNQU+ZY7Km03uYz9oTzWYqOATT
 5DZveuWhuPQ8Ovz4cXVeh1fuNXmU8IOlHP5He5s6Z1GeB3scLaQ8TeEiQCFGi+GUsFP1
 pA9w==
X-Gm-Message-State: AOAM533YYBLFa6mKy6RQDuT7IpOpTKwrfkWGuob+IGAjTtVkwIhHZ9VK
 79XZ2wkaHyaop5qiB7fqs+eEwQ==
X-Google-Smtp-Source: ABdhPJyZ/CShxiXs/l+OsxBZaV1oLFVk9dmNR17PTSOGiZ0dB+BzqeABH9qtreIgoRyLynq5nl5BvA==
X-Received: by 2002:a17:90a:cb12:: with SMTP id
 z18mr3043096pjt.132.1616484117831; 
 Tue, 23 Mar 2021 00:21:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id w191sm17250565pfd.25.2021.03.23.00.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:21:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-12-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 11/11] drm/bridge: ti-sn65dsi86: Support hotplug
 detection
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:21:55 -0700
Message-ID: <161648411577.3012082.12552929328689935144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:28)
> When the SN65DSI86 is used in DisplayPort mode, its output is likely
> routed to a DisplayPort connector, which can benefit from hotplug
> detection. Support it in such cases, with polling mode only for now.
> 
> The implementation is limited to the bridge operations, as the connector
> operations are legacy and new users should use
> DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 46 +++++++++++++++++++--------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f792227142a7..72f6362adf44 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -890,6 +897,15 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
>         pm_runtime_put_sync(pdata->dev);
>  }
>  
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn_bridge *pdata = bridge_to_ti_sn_bridge(bridge);
> +       int val;
> +
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +       return val ? connector_status_connected : connector_status_disconnected;
> +}
> +
>  static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
>                                           struct drm_connector *connector)
>  {
> @@ -904,6 +920,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>         .enable = ti_sn_bridge_enable,
>         .disable = ti_sn_bridge_disable,
>         .post_disable = ti_sn_bridge_post_disable,
> +       .detect = ti_sn_bridge_detect,
>         .get_edid = ti_sn_bridge_get_edid,
>  };
>  
> @@ -1327,6 +1344,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
>                 return ret;
>         }
>  
> +       pdata->no_hpd = of_property_read_bool(pdata->dev->of_node, "no-hpd");

I see that we missed adding this property to the DTS file but skated by
because it was the default in the driver. I don't think it's a big deal
just something we should fix in sc7180-trogdor.dtsi before this patch is
merged.

> +
>         ti_sn_bridge_parse_lanes(pdata, client->dev.of_node);
>  
>         ret = ti_sn_bridge_parse_regulators(pdata);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
