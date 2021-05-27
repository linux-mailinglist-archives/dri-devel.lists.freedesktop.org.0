Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF90392DD8
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 14:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8636E03B;
	Thu, 27 May 2021 12:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849396E03B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 12:21:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622118084; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DieTgRu32lytZi03S2vK0P2h9aBw6RLzcOc7IB5/jYs=;
 b=AwOYngJX0F1MUKQlhpDf8rfqdN3TVamVx0dj4YPBQXc9Bu6cQihG/Q7ilXEIz8mkPLZYJVOo
 YzJCKLBv8c0WpeYBZHkfv5rU2HoC0x3HNJoNt1h6NTsHMxR0nmCHOqQ4onOIGMCsv5rW9f8c
 ReljlNkqjG2MgEMTkDJLktLhnEU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60af8ebf063320cd13bd4e04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 May 2021 12:21:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AC8F2C4338A; Thu, 27 May 2021 12:21:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6B7A4C433F1;
 Thu, 27 May 2021 12:21:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 27 May 2021 17:51:15 +0530
From: rajeevny@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
In-Reply-To: <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
 <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
 <CAD=FV=WzQ0Oc=e3kmNeBZUA+P1soKhBk8zt7bG1gqJ-Do-Tq_w@mail.gmail.com>
Message-ID: <42db3a26684a5329287d57e1e78d0475@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, mkrishn@codeaurora.org,
 Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 25-05-2021 22:48, Doug Anderson wrote:
> Hi,
> 
> On Tue, May 25, 2021 at 12:31 AM Rajeev Nandan 
> <rajeevny@codeaurora.org> wrote:
>> 
>> @@ -171,6 +172,19 @@ struct panel_desc {
>> 
>>         /** @connector_type: LVDS, eDP, DSI, DPI, etc. */
>>         int connector_type;
>> +
>> +       /**
>> +        * @uses_dpcd_backlight: Panel supports eDP dpcd backlight 
>> control.
>> +        *
>> +        * Set true, if the panel supports backlight control over eDP 
>> AUX channel
>> +        * using DPCD registers as per VESA's standard.
>> +        */
>> +       bool uses_dpcd_backlight;
>> +};
>> +
>> +struct edp_backlight {
>> +       struct backlight_device *dev;
> 
> Can you pick a name other than "dev". In my mind "dev" means you've
> got a "struct device" or a "struct device *".

In the backlight.h "bd" is used for "struct backlight_device". I can use 
"bd"?

> 
> 
>> +       struct drm_edp_backlight_info info;
>>  };
>> 
>>  struct panel_simple {
>> @@ -194,6 +208,8 @@ struct panel_simple {
>> 
>>         struct edid *edid;
>> 
>> +       struct edp_backlight *edp_bl;
>> +
> 
> I don't think you need to add this pointer. See below for details, but
> basically the backlight device should be in base.backlight. Any code
> that needs the containing structure can use the standard
> "container_of" syntax.
> 

The documentation of the "struct drm_panel -> backlight" mentions
"backlight is set by drm_panel_of_backlight() and drivers shall not 
assign it."
That's why I was not sure if I should touch that part. Because of this, 
I added
backlight enable/disable calls inside panel_simple_disable/enable().

> 
>>         struct drm_display_mode override_mode;
>> 
>>         enum drm_panel_orientation orientation;
>> @@ -330,10 +346,14 @@ static void panel_simple_wait(ktime_t 
>> start_ktime, unsigned int min_ms)
>>  static int panel_simple_disable(struct drm_panel *panel)
>>  {
>>         struct panel_simple *p = to_panel_simple(panel);
>> +       struct edp_backlight *bl = p->edp_bl;
>> 
>>         if (!p->enabled)
>>                 return 0;
>> 
>> +       if (p->desc->uses_dpcd_backlight && bl)
>> +               drm_edp_backlight_disable(p->aux, &bl->info);
>> +
> 
> It feels like this shouldn't be needed. I would have expected that
> your backlight should be in 'panel->backlight'. Then
> drm_panel_enable() will call backlight_enable() on your backlight
> automatically after calling the panel's enable function.

Yes, this is not needed if the backlight is part of panel->backlight.

> 
> 
>>         if (p->desc->delay.disable)
>>                 msleep(p->desc->delay.disable);
>> 
>> @@ -496,6 +516,7 @@ static int panel_simple_prepare(struct drm_panel 
>> *panel)
>>  static int panel_simple_enable(struct drm_panel *panel)
>>  {
>>         struct panel_simple *p = to_panel_simple(panel);
>> +       struct edp_backlight *bl = p->edp_bl;
>> 
>>         if (p->enabled)
>>                 return 0;
>> @@ -505,6 +526,10 @@ static int panel_simple_enable(struct drm_panel 
>> *panel)
>> 
>>         panel_simple_wait(p->prepared_time, 
>> p->desc->delay.prepare_to_enable);
>> 
>> +       if (p->desc->uses_dpcd_backlight && bl)
>> +               drm_edp_backlight_enable(p->aux, &bl->info,
>> +                                        bl->dev->props.brightness);
>> +
> 
> Similar to disable, this shouldn't be needed.

Will remove this too.

> 
> 
>>         p->enabled = true;
>> 
>>         return 0;
>> @@ -565,6 +590,59 @@ static const struct drm_panel_funcs 
>> panel_simple_funcs = {
>>         .get_timings = panel_simple_get_timings,
>>  };
>> 
>> +static int edp_backlight_update_status(struct backlight_device *bd)
>> +{
>> +       struct panel_simple *p = bl_get_data(bd);
>> +       struct edp_backlight *bl = p->edp_bl;
>> +
>> +       if (!p->enabled)
>> +               return 0;
>> +
>> +       return drm_edp_backlight_set_level(p->aux, &bl->info, 
>> bd->props.brightness);
> 
> I notice that the "nouveau" driver grabs a whole pile of locks around
> this. Do we need some of those? I guess perhaps checking "p->enabled"
> isn't so valid without holding some of those locks.
> 
> Actually, I guess you probably can't look at "p->enabled" anyway if
> this gets moved out of panel-simple as I'm suggesting.
> 
> ...but do you even need something like this check? Shouldn't it be
> handled by the fact that drm_panel will handle enabling/disabling the
> backlight at the right times?
> 

The idea behind this check was to avoid the backlight update operation
(avoid DP aux access) when the panel is disabled. In case, if someone 
sets the
brightness from the sysfs when the panel is off. I should have used
backlight_get_brightness() or backlight_is_blank().

As we are moving this function out of the panel-simple, and going to use
panel->backlight, I will remove this check.

> 
>> +}
>> +
>> +static const struct backlight_ops edp_backlight_ops = {
>> +       .update_status = edp_backlight_update_status,
>> +};
>> +
>> +static int edp_backlight_register(struct device *dev, struct 
>> panel_simple *panel)
>> +{
>> +       struct edp_backlight *bl;
>> +       struct backlight_properties props = { 0 };
>> +       u16 current_level;
>> +       u8 current_mode;
>> +       u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
>> +       int ret;
>> +
>> +       bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
>> +       if (!bl)
>> +               return -ENOMEM;
>> +
>> +       ret = drm_dp_dpcd_read(panel->aux, DP_EDP_DPCD_REV, edp_dpcd,
>> +                              EDP_DISPLAY_CTL_CAP_SIZE);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       ret = drm_edp_backlight_init(panel->aux, &bl->info, 0, 
>> edp_dpcd,
>> +                                    &current_level, &current_mode);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       props.type = BACKLIGHT_RAW;
>> +       props.brightness = current_level;
>> +       props.max_brightness = bl->info.max;
>> +
>> +       bl->dev = devm_backlight_device_register(dev, "edp_backlight",
>> +                                               dev, panel,
>> +                                               &edp_backlight_ops, 
>> &props);
>> +       if (IS_ERR(bl->dev))
>> +               return PTR_ERR(bl->dev);
>> +
>> +       panel->edp_bl = bl;
>> +
>> +       return 0;
>> +}
>> +
> 
> I expect there to be quite a bit of pushback to putting this directly
> into panel-simple. How about if you move edp_backlight_register() into
> drm_panel.c, parallel to drm_panel_of_backlight(). Maybe you'd call it
> drm_panel_dp_aux_backlight() to make it look symmetric?
> 
> If you do that then the amount of code / complexity being added to
> "simple" panel is quite small. I think it would just come down to
> adding the boolean flag and the patch to probe that you have below.
> 
> Actually, now that I think about it, you could maybe even get by
> _without_ the boolean flag? I think you could use these rules
> (untested!):
> 
> 1. Call drm_panel_of_backlight() always, just like we do today. If a
> backlight was specified in the device tree then we should use it.
> 
> 2. If no backlight was specified in the device tree then, I believe,
> drm_panel_of_backlight() will return with no errors but will have
> panel->backlight set to NULL.
> 
> 3. If there was no backlight specified in the device tree and you have
> the DP AUX channel and drm_edp_backlight_supported() then create a DP
> AUX backlight.
> 
> The one feature that wouldn't be supported by the above would be
> "DP_EDP_BACKLIGHT_AUX_PWM_PRODUCT_CAP". Presumably that's fine. If
> someone later wants to figure out how to solve that then they can.
> 

This looks perfect. I will make the changes.

> 
>>  static struct panel_desc panel_dpi;
>> 
>>  static int panel_dpi_probe(struct device *dev,
>> @@ -796,9 +874,24 @@ static int panel_simple_probe(struct device *dev, 
>> const struct panel_desc *desc,
>> 
>>         drm_panel_init(&panel->base, dev, &panel_simple_funcs, 
>> connector_type);
>> 
>> -       err = drm_panel_of_backlight(&panel->base);
>> -       if (err)
>> -               goto disable_pm_runtime;
>> +       if (panel->desc->uses_dpcd_backlight) {
>> +               if (!panel->aux) {
>> +                       dev_err(dev, "edp backlight needs DP aux\n");
>> +                       err = -EINVAL;
>> +                       goto disable_pm_runtime;
>> +               }
>> +
>> +               err = edp_backlight_register(dev, panel);
>> +               if (err) {
>> +                       dev_err(dev, "failed to register edp backlight 
>> %d\n", err);
>> +                       goto disable_pm_runtime;
>> +               }
>> +
>> +       } else {
> 
> nit: get rid of the blank line above the "} else {"
Oops! I will fix this.

> 
> 
>> +               err = drm_panel_of_backlight(&panel->base);
>> +               if (err)
>> +                       goto disable_pm_runtime;
>> +       }
> 
> See above where I'm suggesting some different logic. Specifically:
> always try the drm_panel_of_backlight() call and then fallback to the
> AUX backlight if "panel->base.backlight" is NULL and "panel->aux" is
> not NULL.

What I understood:
1. Create a new API drm_panel_dp_aux_backlight() in drm_panel.c
1.1. Register DP AUX backlight if "struct drm_dp_aux" is given and
     drm_edp_backlight_supported()
2. Create a call back function for backlight ".update_status()" inside 
drm_panel.c ?
   This function should also handle the backlight enable/disable 
operations.
3. Use the suggested rules to call drm_panel_dp_aux_backlight() as a 
fallback, if
    no backlight is specified in the DT.
4. Remove the @uses_dpcd_backlight flag from panel_desc as this should 
be auto-detected.

Thanks, for the review.

-Rajeev
