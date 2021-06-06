Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EB39CCFD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 06:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974916E0C9;
	Sun,  6 Jun 2021 04:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160C56E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 04:40:44 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so12291267otu.6
 for <dri-devel@lists.freedesktop.org>; Sat, 05 Jun 2021 21:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JI7upzqrUET2Bw9ERWz7Ucuib2MpTzv7uE/K5kjhd9o=;
 b=OnXmZWC8yV7/jJQuufOilPOMYrrpZUlUcz8m23YVX8bBq7nznj+R906MWCMo8CIsU2
 dcrSYThA0c1TTanNGw1CY2FUz/wIA03BRu4pdBkJN83mzVQ/d6dqmjjaXdrjDBFUj2ok
 1DPCFiXBcZt6Zlv8GfvqRdu7Ea9Z1DKG0oRVKzyh0xCInPgfXwpsZ7yE50JUJuI4N/eL
 Y4BARMSi+I/c9bRHm2GWRfAiysdKngI3dA/SKhzKJK6A0mAkgTjbxBBpWmgSvyPVdoHg
 q84KLFIb0yeKzJPXucFGp5kkMJQlTB0KarLlyD4jvGrkgHVI3Hw87gOSagiSkidb9h+Z
 LfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JI7upzqrUET2Bw9ERWz7Ucuib2MpTzv7uE/K5kjhd9o=;
 b=FqpnwxejXUnQVQAi4SgMitLRhngSAfX97e8RF++jCldIEJLeDeW4okk7UqhKj4H1dD
 JPIrIqKbD6TRUu6xGK8kAfEOI3NcIQWz512rgJzZ0wRsuPFej6bgNsI7ATWAzhX+ewKs
 jxEAspxdkUzwmXWYsvbeRVQrkTy9CpuwiZ2i4tx+xINc494UDao+0uBKjHVy2jxVudA2
 anNGuyOnEYehWKio7tQDajLfKtMp25zPeP2N3orMRTX/oYzdDpb+/wS7lYvUS5VV4E1b
 8zGJTN50QRdvd9v3ejNHq+LISkqP0u/rx8uDtiadZoDkDS3Bh5rbdqJWrYvEcAaoSndS
 wv4g==
X-Gm-Message-State: AOAM532BnUD/xa5p4kp1+T2iGWHt6sM7JVG+AHNfEr/8r7qRu2T5Fy1U
 G4MI+Qy3Sb7gNnyVD4tn+3dbmA==
X-Google-Smtp-Source: ABdhPJzQLi035TqiMeszPyisAX9XxsVN8U7132M6/Zex0Zq8qbMOXAZNk/+kJrJf8Xmr8T3wwwH0xQ==
X-Received: by 2002:a05:6830:2703:: with SMTP id
 j3mr9495211otu.140.1622954443284; 
 Sat, 05 Jun 2021 21:40:43 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l20sm1423931oop.3.2021.06.05.21.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 21:40:42 -0700 (PDT)
Date: Sat, 5 Jun 2021 23:40:40 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v8 08/11] drm/bridge: ti-sn65dsi86: Promote the AUX
 channel to its own sub-dev
Message-ID: <YLxRyC9eNlg+Uex3@builder.lan>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.8.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.8.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 24 May 19:01 CDT 2021, Douglas Anderson wrote:

> On its own, this change looks a little strange and doesn't do too much
> useful. To understand why we're doing this we need to look forward to
> future patches where we're going to probe our panel using the new DP
> AUX bus. See the patch ("drm/bridge: ti-sn65dsi86: Add support for the
> DP AUX bus").
> 
> Let's think about the set of steps we'll want to happen when we have
> the DP AUX bus:
> 
> 1. We'll create the DP AUX bus.
> 2. We'll populate the devices on the DP AUX bus (AKA our panel).
> 3. For setting up the bridge-related functions of ti-sn65dsi86 we'll
>    need to get a reference to the panel.
> 
> If we do #1 - #3 in a single probe call things _mostly_ will work, but
> it won't be massively robust. Let's explore.
> 
> First let's think of the easy case of no -EPROBE_DEFER. In that case
> in step #2 when we populate the devices on the DP AUX bus it will
> actually try probing the panel right away. Since the panel probe
> doesn't defer then in step #3 we'll get a reference to the panel and
> we're golden.
> 
> Second, let's think of the case when the panel returns
> -EPROBE_DEFER. In that case step #2 won't synchronously create the
> panel (it'll just add the device to the defer list to do it
> later). Step #3 will fail to get the panel and the bridge sub-device
> will return -EPROBE_DEFER. We'll depopulate the DP AUX bus. Later
> we'll try the whole sequence again. Presumably the panel will
> eventually stop returning -EPROBE_DEFER and we'll go back to the first
> case where things were golden. So this case is OK too even if it's a
> bit ugly that we have to keep creating / deleting the AUX bus over and
> over.
> 
> So where is the problem? As I said, it's mostly about robustness. I
> don't believe that step #2 (creating the sub-devices) is really
> guaranteed to be synchronous. This is evidenced by the fact that it's
> allowed to "succeed" by just sticking the device on the deferred
> list. If anything about the process changes in Linux as a whole and
> step #2 just kicks off the probe of the DP AUX endpoints (our panel)
> in the background then we'd be in trouble because we might never get
> the panel in step #3.
> 
> Adding an extra sub-device means we just don't need to worry about
> it. We'll create the sub-device for the DP AUX bus and it won't go
> away until the whole ti-sn65dsi86 driver goes away. If the bridge
> sub-device defers (maybe because it can't find the panel) that won't
> depopulate the DP AUX bus and so we don't need to worry about it.
> 
> NOTE: there's a little bit of a trick here. Though the AUX channel can
> run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
> can't run without the AUX channel. We could come up a complicated
> signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
> while or wait on some sort of completion), but it seems simple enough
> to just not even bother creating the bridge device until the AUX
> channel probes. That's what we'll do.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> 
> (no changes since v7)
> 
> Changes in v7:
> - Beefed up commit message in context of the DP AUX bus.
> - Remove use of now-dropped drm_dp_aux_register_ddc() call.
> - Set the proper sub-device "dev" pointer in the AUX structure.
> 
> Changes in v6:
> - Use new drm_dp_aux_register_ddc() calls.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 80 +++++++++++++++++++++++----
>  1 file changed, 69 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 45a2969afb2b..1ea07d704705 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -116,6 +116,7 @@
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
>   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
> + * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
>   *
>   * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
> @@ -148,6 +149,7 @@
>  struct ti_sn65dsi86 {
>  	struct auxiliary_device		bridge_aux;
>  	struct auxiliary_device		gpio_aux;
> +	struct auxiliary_device		aux_aux;
>  
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -1333,11 +1335,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>  	if (ret)
>  		return ret;
>  
> -	pdata->aux.name = "ti-sn65dsi86-aux";
> -	pdata->aux.dev = pdata->dev;
> -	pdata->aux.transfer = ti_sn_aux_transfer;
> -	drm_dp_aux_init(&pdata->aux);
> -
>  	pdata->bridge.funcs = &ti_sn_bridge_funcs;
>  	pdata->bridge.of_node = np;
>  
> @@ -1432,6 +1429,53 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>  	return ret;
>  }
>  
> +static int ti_sn_aux_probe(struct auxiliary_device *adev,
> +			   const struct auxiliary_device_id *id)
> +{
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> +	int ret;
> +
> +	/*
> +	 * We couldn't do this pre-probe because it would confuse pinctrl.
> +	 * It would have tried to grab the same pins that the main device had.
> +	 * Set it now so that we can put the proper (sub) device in the aux
> +	 * structure and it will have the right node.
> +	 */
> +	adev->dev.of_node = pdata->dev->of_node;

I suspect the refcount of the of_node will be wrong here and upon
removing the aux device things will be off...

Instead, I think you're looking for device_set_of_node_from_dev(), which
also sets of_node_reused, which in turn causes pinctrl_bind_pins() to be
skipped - i.e. it seems to deal with the problem your comment describes.

Regards,
Bjorn
