Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7DB397C5F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 00:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043BF6E958;
	Tue,  1 Jun 2021 22:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BDA6EB23
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 22:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622586033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zNZ1OHz+pgy9lSJZpnW7dTMVx/2d5p7wzElxmNic5mo=;
 b=aT1Znn1Oe0+xL2jCGy8tMiuXHRbc56j8eikH1cNgSGxLIQ+ecNvVFdKB1gVaYNwc1TAS4Y
 yQAbCQ6XZcoSwQLJj9iK+kVTD2Q9u4dMQwB9F+iGSCUoxc6nS2tJqsbdKkrGqkSVw46/FW
 hBBeRfPL9gjN8+XWCY7PupXidENyHmc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-gPQhqhQkMBKAVsB3pbBISw-1; Tue, 01 Jun 2021 18:20:31 -0400
X-MC-Unique: gPQhqhQkMBKAVsB3pbBISw-1
Received: by mail-qv1-f69.google.com with SMTP id
 v7-20020a0ccd870000b0290219d3e21c4eso348066qvm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=zNZ1OHz+pgy9lSJZpnW7dTMVx/2d5p7wzElxmNic5mo=;
 b=rlRCBQG7w4WiqNtAn90lInQeSxCJPb/6nry7olhtV28yiMSq0UKT60meuT+1CtqR6l
 PQqObgKWzgiDtn4CtFBZ1jih2YjwbiEDxQTxj8f1kBh0J7/RcpT3AUM2hE3HsRqY4Ete
 FRu+PrDkEzwfivt0XVAubnmwNO9HCaJhyBxkNaG60sf/AgV2Jr4Q8yH0bZ4nk0hv+I2m
 nJrHFNCfUNIa5K0SUtbFxBdEA40cpYsDrpjVc4k7pkgzY3cHYWhln04/W5aeS2BgAuyK
 Z3RL4mh8haPD/xpFS3Rx44vBXdeSDJDFxO3+nWPC0mzD6qUp4iNz46JojE0jhUHoKip8
 nLbQ==
X-Gm-Message-State: AOAM530Tax7g/PlmKj1OUrBzvw5fjTf9G+b0K/hCll7qKWakl4HEVJ+G
 FisX/DbYGknMdKcpDEX+jCuYz/uLExBBzRYT+K3gXNckUDZPcGNWCraz2C4WXJGvfraTDZbV0AJ
 /cA0bs/Vv9A3PHWKWRFZLqs4RL7+9
X-Received: by 2002:a05:620a:4007:: with SMTP id
 h7mr23810759qko.257.1622586031305; 
 Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYa1qLyQ3m0UnCgsn0rF7qsVaI/mfTUhKZHlBTOPeAih4/7wa4I1RxpaoBnF8u9RQgUPIEog==
X-Received: by 2002:a05:620a:4007:: with SMTP id
 h7mr23810728qko.257.1622586031051; 
 Tue, 01 Jun 2021 15:20:31 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id f130sm161456qke.37.2021.06.01.15.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 15:20:30 -0700 (PDT)
Message-ID: <4df7dcddd5aca799361642ea91c37fa94e8a4fef.camel@redhat.com>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
From: Lyude Paul <lyude@redhat.com>
To: Rajeev Nandan <rajeevny@codeaurora.org>, y@qualcomm.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Date: Tue, 01 Jun 2021 18:20:29 -0400
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

oh-looks like my patches just got reviewed, so hopefully I should get a chance
to get a look at this in the next day or two :)

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

