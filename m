Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AF70FB89
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 18:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE50E10E068;
	Wed, 24 May 2023 16:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D210E068
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 16:19:45 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-563874afe98so16473837b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684945184; x=1687537184;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=018YvOWAcdcg4cdLKbpOufJYj9QVDv2gy3gIrmoKQKg=;
 b=Wa8V5gJIuIi/HjdB5F4Y2PGvisVrMUAJnFGvrzfD1u2HXdR6zXxboSfOC1sUrut5po
 7bNg7le53ocLYAGxLB05/n58D3uLqxmro6+YJyffgM0QGKXc205MLe7yimmoHPz3LkIA
 4PGEYMHODtR+rC9x/mlREd5X3+sMDCl8fU9vHYdEcn4j7SGUvL4HPIuTyW8+lEOpHUT8
 pdNDwfTyhOh6hEokocrgODZqf6OL8KJ1K4BKRlDJmsYfq69c53iCESicsHUoztZ/S3lk
 mrdl5jHlthTHZSX6bD05vLPbatIlgri3J+u3Z+s0zkUIl9ccWUgq0lkwwEkDxk7ch6I0
 7Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684945184; x=1687537184;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=018YvOWAcdcg4cdLKbpOufJYj9QVDv2gy3gIrmoKQKg=;
 b=XynSAsz1oJrrGfFDXIegDjPEoPsAWXcgH2cVo92gMREc67I6i+iQCldwNmvC0Iwakn
 sGR/lIXIiHn7hXCUxWNBV/CzKrLLje57x96b3PxsadZbZKW9IiA9w0HeYxspaQJWkMyh
 zsP8K+d1Si+RACLjPKQ3/fnsQOeS9q1zMlEWXyvMSqzFRDGOIBZz8dH3Q/SAezWefPGz
 ERDa+EODC1lKFxj1nkxfPip+rsp21YCQFzQOH7GCEOC9HuUk2leHlif1AZqrBLtJkrRZ
 hZXW4Dro3hgPmu8WB1FJoPtnd7LumF8aJRiHcztU0L3soTDrEYL1j3JG5F6NcuOEnONM
 RgrQ==
X-Gm-Message-State: AC+VfDx3EiJUquhuEXe60kHqB2euyhc93biVAGKlYLWSHXUVtbKax38k
 +rL0vnS+xiWh2/2nVLoJFy0=
X-Google-Smtp-Source: ACHHUZ7vhhqH0VHsvmRA7Q5a/lNB0v3XWfrfsCFRB6Atoya+E5v9ROZaj2cmk3czG9umDFUahZwTOQ==
X-Received: by 2002:a0d:cc95:0:b0:561:7ec:cf90 with SMTP id
 o143-20020a0dcc95000000b0056107eccf90mr19259741ywd.42.1684945184195; 
 Wed, 24 May 2023 09:19:44 -0700 (PDT)
Received: from neuromancer. ([75.28.21.198]) by smtp.gmail.com with ESMTPSA id
 r63-20020a815d42000000b00555df877a4csm3768852ywb.102.2023.05.24.09.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:19:43 -0700 (PDT)
Message-ID: <646e391f.810a0220.214ce.d680@mx.google.com>
X-Google-Original-Message-ID: <ZG45HLgD+PiDZlqX@neuromancer.>
Date: Wed, 24 May 2023 11:19:40 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in
 drm_panel
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
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
Cc: dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-input@vger.kernel.org,
 hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 12:27:56PM -0700, Douglas Anderson wrote:
> In a whole pile of panel drivers, we have code to make the
> prepare/unprepare/enable/disable callbacks behave as no-ops if they've
> already been called. It's silly to have this code duplicated
> everywhere. Add it to the core instead so that we can eventually
> delete it from all the drivers. Note: to get some idea of the
> duplicated code, try:
>   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> 
> NOTE: arguably, the right thing to do here is actually to skip this
> patch and simply remove all the extra checks from the individual
> drivers. Perhaps the checks were needed at some point in time in the
> past but maybe they no longer are? Certainly as we continue

For some reason I haven't dug into in greater detail on my RK3326 and
RK3568 boards I hit an issue on suspend/shutdown whereby the unprepare
is called multiple times. I suspect it's the dw-mipi-dsi-rockchip.c
driver and the dw-mipi-dsi.c drivers both calling the unprepare, but
I haven't been able to debug it completely yet.

> transitioning over to "panel_bridge" then we expect there to be much
> less variety in how these calls are made. When we're called as part of
> the bridge chain, things should be pretty simple. In fact, there was
> some discussion in the past about these checks [1], including a
> discussion about whether the checks were needed and whether the calls
> ought to be refcounted. At the time, I decided not to mess with it
> because it felt too risky.
> 
> Looking closer at it now, I'm fairly certain that nothing in the
> existing codebase is expecting these calls to be refcounted. The only

Regulator unbalanced disables are a bane of my existence. For the
panel-newvision-nv3051d.c driver I upstreamed a few releases ago I was
told to not include the is_enabled logic and as a result I get a
warning on suspend or shutdown when it disables the panel. Unprepare
gets called twice and that results in an unbalanced regulator disable.

> real question is whether someone is already doing something to ensure
> prepare()/unprepare() match and enabled()/disable() match. I would say
> that, even if there is something else ensuring that things match,
> there's enough complexity that adding an extra bool and an extra
> double-check here is a good idea. Let's add a drm_warn() to let people
> know that it's considered a minor error to take advantage of
> drm_panel's double-checking but we'll still make things work fine.
> 
> [1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++-----
>  include/drm/drm_panel.h     | 14 +++++++++++
>  2 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..4e1c4e42575b 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
>   */
>  int drm_panel_prepare(struct drm_panel *panel)
>  {
> +	int ret;
> +
>  	if (!panel)
>  		return -EINVAL;
>  
> -	if (panel->funcs && panel->funcs->prepare)
> -		return panel->funcs->prepare(panel);
> +	if (panel->prepared) {
> +		dev_warn(panel->dev, "Skipping prepare of already prepared panel\n");
> +		return 0;
> +	}
> +
> +	if (panel->funcs && panel->funcs->prepare) {
> +		ret = panel->funcs->prepare(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->prepared = true;
>  
>  	return 0;
>  }
> @@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
>   */
>  int drm_panel_unprepare(struct drm_panel *panel)
>  {
> +	int ret;
> +
>  	if (!panel)
>  		return -EINVAL;
>  
> -	if (panel->funcs && panel->funcs->unprepare)
> -		return panel->funcs->unprepare(panel);
> +	if (!panel->prepared) {
> +		dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");
> +		return 0;
> +	}
> +
> +	if (panel->funcs && panel->funcs->unprepare) {
> +		ret = panel->funcs->unprepare(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->prepared = false;
>  
>  	return 0;
>  }
> @@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
>  	if (!panel)
>  		return -EINVAL;
>  
> +	if (panel->enabled) {
> +		dev_warn(panel->dev, "Skipping enable of already enabled panel\n");
> +		return 0;
> +	}
> +
>  	if (panel->funcs && panel->funcs->enable) {
>  		ret = panel->funcs->enable(panel);
>  		if (ret < 0)
>  			return ret;
>  	}
> +	panel->enabled = true;
>  
>  	ret = backlight_enable(panel->backlight);
>  	if (ret < 0)
> @@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
>  	if (!panel)
>  		return -EINVAL;
>  
> +	if (!panel->enabled) {
> +		dev_warn(panel->dev, "Skipping disable of already disabled panel\n");
> +		return 0;
> +	}
> +
>  	ret = backlight_disable(panel->backlight);
>  	if (ret < 0)
>  		DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d\n",
>  			     ret);
>  
> -	if (panel->funcs && panel->funcs->disable)
> -		return panel->funcs->disable(panel);
> +	if (panel->funcs && panel->funcs->disable) {
> +		ret = panel->funcs->disable(panel);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	panel->enabled = false;
>  
>  	return 0;
>  }
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 432fab2347eb..c6cf75909389 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -198,6 +198,20 @@ struct drm_panel {
>  	 * the panel is powered up.
>  	 */
>  	bool prepare_prev_first;
> +
> +	/**
> +	 * @prepared:
> +	 *
> +	 * If true then the panel has been prepared.
> +	 */
> +	bool prepared;
> +
> +	/**
> +	 * @enabled:
> +	 *
> +	 * If true then the panel has been enabled.
> +	 */
> +	bool enabled;
>  };
>  
>  void drm_panel_init(struct drm_panel *panel, struct device *dev,
> -- 
> 2.40.1.698.g37aff9b760-goog
> 

Thank you for looking into this more. It's one of the last QOL bugs
for some devices I'm working on, even if the end result is no big
deal (the other QOL bug involves a WARN on probing a rotated panel).
