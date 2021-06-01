Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E9397A18
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 20:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A1B46EAC8;
	Tue,  1 Jun 2021 18:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69586EAC8
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 18:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622572095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOsIlqxl6eH239Kciu24BWgBMb9sBjim1wXteqsp/Pc=;
 b=YhocKkBWKehYRy8yhI1B7sSDRnrmo24+0VGeqRk1TZqBQme6zwZXNDUji/03f0+MMmDGsL
 O5F76sA7WiZNwGDo0bDcUkOE5nRrxmlQ51B6dCt/6Le89Os69VkfoOeH/OuQSZJw/uSB8e
 FX5DIh39P9zNrKO7/wv0ckDH09eIeqM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-vu6tfYumO9qTKh_L30aZ1A-1; Tue, 01 Jun 2021 14:28:12 -0400
X-MC-Unique: vu6tfYumO9qTKh_L30aZ1A-1
Received: by mail-qk1-f198.google.com with SMTP id
 s4-20020a3790040000b02902fa7aa987e8so12484872qkd.14
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 11:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=NOsIlqxl6eH239Kciu24BWgBMb9sBjim1wXteqsp/Pc=;
 b=cwqBcYUHNFEWwTtNaMr0QTnw0MC6zFGXofDONKYL39IX4ghzyPnyDmxvJkSdQw8cJT
 0a1bHg1uAYY2Io5PcAKokiy6NvUlNY5/td49FQgwnFELJKFx+gfN79BBNMew+fyC7UcC
 lkDYRCBYKtLMqkHehPjg+mIip/5rJwQKwrMlG0by3+GrJcPLKczkOO6qO2WlzbASyVqu
 aJN4VDZmpNSa3XUMAk7MXPF5FLQKIcGnYRnmqSXluRZygM5Zus7yCsz1qkkfJEyQJz4Y
 zn3GvDWIeMrqmM/Ktd8oX8MVyFOSrFqTQc7SmGZmDW/UEKXeZcgtXBsAtqDsfA0TJNHX
 HQZQ==
X-Gm-Message-State: AOAM530CostHj/w2wQdmdi0K1U0DLfTkRak2waLr8/+AyOiHOVG8tUc/
 7OYUFGt1+4UJcXgr3fNZfYBlacWuwZCL6eTXhYhyPATMUKMBwRBAbdQitUljF71GxdQ3yn2m+in
 cjR168Uyl4T8x+zIh0v2L2cQiv4Wc
X-Received: by 2002:a0c:e148:: with SMTP id c8mr9666328qvl.18.1622572091667;
 Tue, 01 Jun 2021 11:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytSZnefoM3XSTSKdxOIOsXny4+VC2C+Z/p3WaHhH0IWvNmokJ6MGvgRHfSYxb86PPeGka/Rg==
X-Received: by 2002:a0c:e148:: with SMTP id c8mr9666307qvl.18.1622572091422;
 Tue, 01 Jun 2021 11:28:11 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id e19sm10809288qtr.45.2021.06.01.11.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 11:28:11 -0700 (PDT)
Message-ID: <366f2fe575003487da4c2bd63c70abc16051dcb2.camel@redhat.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
From: Lyude Paul <lyude@redhat.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, y@qualcomm.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Tue, 01 Jun 2021 14:28:09 -0400
In-Reply-To: <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: daniel.thompson@linaro.org, mkrishn@codeaurora.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, dianders@chromium.org,
 a.hajda@samsung.com, thierry.reding@gmail.com, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, kalyan_t@codeaurora.org,
 hoegsberg@chromium.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry-I've been waiting to review this, but the DPCD backlight support helper
series is -still- blocked on getting reviews upstream :\

On Tue, 2021-05-25 at 13:00 +0530, Rajeev Nandan wrote:
> Add basic support of panel backlight control over eDP aux channel
> using VESA's standard backlight control interface.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
> 
> This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus; 
> allow using it for DDC) 
> 
> Changes in v4:
> - New
> 
> [1]
> https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/
> 
>  drivers/gpu/drm/panel/panel-simple.c | 99
> ++++++++++++++++++++++++++++++++++--
>  1 file changed, 96 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c
> b/drivers/gpu/drm/panel/panel-simple.c
> index b09be6e..f9e4e60 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/iopoll.h>
> @@ -171,6 +172,19 @@ struct panel_desc {
>  
>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
>         int connector_type;
> +
> +       /**
> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight control.
> +        *
> +        * Set true, if the panel supports backlight control over eDP AUX
> channel
> +        * using DPCD registers as per VESA's standard.
> +        */
> +       bool uses_dpcd_backlight;
> +};
> +
> +struct edp_backlight {
> +       struct backlight_device *dev;
> +       struct drm_edp_backlight_info info;
>  };
>  
>  struct panel_simple {
> @@ -194,6 +208,8 @@ struct panel_simple {
>  
>         struct edid *edid;
>  
> +       struct edp_backlight *edp_bl;
> +
>         struct drm_display_mode override_mode;
>  
>         enum drm_panel_orientation orientation;
> @@ -330,10 +346,14 @@ static void panel_simple_wait(ktime_t start_ktime,
> unsigned int min_ms)
>  static int panel_simple_disable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>  
>         if (!p->enabled)
>                 return 0;
>  
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_disable(p->aux, &bl->info);
> +
>         if (p->desc->delay.disable)
>                 msleep(p->desc->delay.disable);
>  
> @@ -496,6 +516,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  static int panel_simple_enable(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
> +       struct edp_backlight *bl = p->edp_bl;
>  
>         if (p->enabled)
>                 return 0;
> @@ -505,6 +526,10 @@ static int panel_simple_enable(struct drm_panel *panel)
>  
>         panel_simple_wait(p->prepared_time, p->desc-
> >delay.prepare_to_enable);
>  
> +       if (p->desc->uses_dpcd_backlight && bl)
> +               drm_edp_backlight_enable(p->aux, &bl->info,
> +                                        bl->dev->props.brightness);
> +
>         p->enabled = true;
>  
>         return 0;
> @@ -565,6 +590,59 @@ static const struct drm_panel_funcs panel_simple_funcs
> = {
>         .get_timings = panel_simple_get_timings,
>  };
>  
> +static int edp_backlight_update_status(struct backlight_device *bd)
> +{
> +       struct panel_simple *p = bl_get_data(bd);
> +       struct edp_backlight *bl = p->edp_bl;
> +
> +       if (!p->enabled)
> +               return 0;
> +
> +       return drm_edp_backlight_set_level(p->aux, &bl->info, bd-
> >props.brightness);
> +}
> +
> +static const struct backlight_ops edp_backlight_ops = {
> +       .update_status = edp_backlight_update_status,
> +};
> +
> +static int edp_backlight_register(struct device *dev, struct panel_simple
> *panel)
> +{
> +       struct edp_backlight *bl;
> +       struct backlight_properties props = { 0 };
> +       u16 current_level;
> +       u8 current_mode;
> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +       int ret;
> +
> +       bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
> +       if (!bl)
> +               return -ENOMEM;
> +
> +       ret = drm_dp_dpcd_read(panel->aux, DP_EDP_DPCD_REV, edp_dpcd,
> +                              EDP_DISPLAY_CTL_CAP_SIZE);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = drm_edp_backlight_init(panel->aux, &bl->info, 0, edp_dpcd,
> +                                    &current_level, &current_mode);
> +       if (ret < 0)
> +               return ret;
> +
> +       props.type = BACKLIGHT_RAW;
> +       props.brightness = current_level;
> +       props.max_brightness = bl->info.max;
> +
> +       bl->dev = devm_backlight_device_register(dev, "edp_backlight",
> +                                               dev, panel,
> +                                               &edp_backlight_ops, &props);
> +       if (IS_ERR(bl->dev))
> +               return PTR_ERR(bl->dev);
> +
> +       panel->edp_bl = bl;
> +
> +       return 0;
> +}
> +
>  static struct panel_desc panel_dpi;
>  
>  static int panel_dpi_probe(struct device *dev,
> @@ -796,9 +874,24 @@ static int panel_simple_probe(struct device *dev, const
> struct panel_desc *desc,
>  
>         drm_panel_init(&panel->base, dev, &panel_simple_funcs,
> connector_type);
>  
> -       err = drm_panel_of_backlight(&panel->base);
> -       if (err)
> -               goto disable_pm_runtime;
> +       if (panel->desc->uses_dpcd_backlight) {
> +               if (!panel->aux) {
> +                       dev_err(dev, "edp backlight needs DP aux\n");
> +                       err = -EINVAL;
> +                       goto disable_pm_runtime;
> +               }
> +
> +               err = edp_backlight_register(dev, panel);
> +               if (err) {
> +                       dev_err(dev, "failed to register edp backlight
> %d\n", err);
> +                       goto disable_pm_runtime;
> +               }
> +
> +       } else {
> +               err = drm_panel_of_backlight(&panel->base);
> +               if (err)
> +                       goto disable_pm_runtime;
> +       }
>  
>         drm_panel_add(&panel->base);
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

