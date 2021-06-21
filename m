Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317D73AE512
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 10:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F5089805;
	Mon, 21 Jun 2021 08:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EF789805
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 08:38:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624264719; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zkZFX1WS+/7fa88RZ+e2bW+9prmrxb8QWu3yvtkdX7c=;
 b=pZ02K5BSOVRYtd+mBjIxCI/tj0jEJLX/JlYdZF8GhNXtiXM+3JK9ib1RRr9AllhUJezFm4A3
 MIx/ia/uOCkF2ylQxtn+AVA1kBHw1kvS5dk4NGwPx58IwPeJF2RtXngn7IVPfxy99OM1Piim
 u4se8F1ZJ7fImNMd5rGjPl0gx40=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60d04ffcea2aacd729233c9a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 08:38:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28BDAC4338A; Mon, 21 Jun 2021 08:38:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B591AC433F1;
 Mon, 21 Jun 2021 08:38:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jun 2021 14:08:17 +0530
From: rajeevny@codeaurora.org
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [v7 1/5] drm/panel: add basic DP AUX backlight support
In-Reply-To: <20210620093141.GA703072@ravnborg.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
Message-ID: <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, hoegsberg@chromium.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, devicetree@vger.kernel.org,
 jani.nikula@intel.com, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 seanpaul@chromium.org, kalyan_t@codeaurora.org, mkrishn@codeaurora.org,
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org, robdclark@gmail.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 20-06-2021 15:01, Sam Ravnborg wrote:
> Hi Rajeev
> 
> On Sat, Jun 19, 2021 at 04:10:26PM +0530, Rajeev Nandan wrote:
>> Some panels support backlight control over DP AUX channel using
>> VESA's standard backlight control interface.
>> Using new DRM eDP backlight helpers, add support to create and
>> register a backlight for those panels in drm_panel to simplify
>> the panel drivers.
>> 
>> The panel driver with access to "struct drm_dp_aux" can create and
>> register a backlight device using following code snippet in its
>> probe() function:
>> 
>> 	err = drm_panel_dp_aux_backlight(panel, aux);
>> 	if (err)
>> 		return err;
> 
> IT very good to have this supported by drm_panel, so we avoid
> bolierplate in various drivers.
> 
>> 
>> Then drm_panel will handle backlight_(enable|disable) calls
>> similar to the case when drm_panel_of_backlight() is used.
>> 
>> Currently, we are not supporting one feature where the source
>> device can combine the backlight brightness levels set through
>> DP AUX and the BL_PWM_DIM eDP connector pin. Since it's not
>> required for the basic backlight controls, it can be added later.
>> 
>> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> ---
>> 
>> (no changes since v6)
>> 
>> Changes in v5:
>> - New
>> 
>> Changes in v6:
>> - Fixed ordering of memory allocation (Douglas)
>> - Updated word wrapping in a comment (Douglas)
>> 
>>  drivers/gpu/drm/drm_panel.c | 108 
>> ++++++++++++++++++++++++++++++++++++++++++++
>>  include/drm/drm_panel.h     |  15 ++++--
>>  2 files changed, 119 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
>> index f634371..9e65342 100644
>> --- a/drivers/gpu/drm/drm_panel.c
>> +++ b/drivers/gpu/drm/drm_panel.c
>> @@ -26,12 +26,20 @@
>>  #include <linux/module.h>
>> 
>>  #include <drm/drm_crtc.h>
>> +#include <drm/drm_dp_helper.h>
>>  #include <drm/drm_panel.h>
>>  #include <drm/drm_print.h>
>> 
>>  static DEFINE_MUTEX(panel_lock);
>>  static LIST_HEAD(panel_list);
>> 
>> +struct dp_aux_backlight {
>> +	struct backlight_device *base;
>> +	struct drm_dp_aux *aux;
>> +	struct drm_edp_backlight_info info;
>> +	bool enabled;
>> +};
>> +
>>  /**
>>   * DOC: drm panel
>>   *
>> @@ -342,6 +350,106 @@ int drm_panel_of_backlight(struct drm_panel 
>> *panel)
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_panel_of_backlight);
>> +
>> +static int dp_aux_backlight_update_status(struct backlight_device 
>> *bd)
>> +{
>> +	struct dp_aux_backlight *bl = bl_get_data(bd);
>> +	u16 brightness = backlight_get_brightness(bd);
> backlight_get_brightness() returns an int, so using u16 seems wrong.
> But then drm_edp_backlight_enable() uses u16 for level - so I guess it
> is OK.
> We use unsigned long, int, u16 for brightness. Looks like something one
> could look at one day, but today is not that day.
> 
>> +	int ret = 0;
>> +
>> +	if (brightness > 0) {
> Use backlight_is_blank(bd) here, as this is really what you test for.

The backlight_get_brightness() used above has the backlight_is_blank() 
check and returns brightness 0 when the backlight_is_blank(bd) is true.
So, instead of calling backlight_is_blank(bd), we are checking 
brightness value here.
I took the reference from pwm_backlight_update_status() of the PWM 
backlight driver (drivers/video/backlight/pwm_bl.c)

Yes, we can change this _if_ condition to use backlight_is_blank(bd), as 
this is an inline function, and is more meaningful.
With this, there would be one change in the behavior of 
_backlight_update_status function in the following case:

- Setting brightness=0 when the backlight is not blank:
In the current case setting brightness=0 is disabling the backlight.
In the new case, setting brightness=0 will set the brightness to 0 and 
will do nothing to backlight disable.

I think that should not be a problem?

> 
> I cannot see why you need the extra check on ->enabled?
> Would it be sufficient to check backlight_is_blank() only?

This extra check on bl->enabled flag is added to avoid 
enabling/disabling backlight again if it is already enabled/disabled.
Using this flag way can know the transition between backlight blank and 
un-blank, and decide when to enable/disable the backlight.

> 
>> +		if (!bl->enabled) {
>> +			drm_edp_backlight_enable(bl->aux, &bl->info, brightness);
>> +			bl->enabled = true;
>> +			return 0;
>> +		}
>> +		ret = drm_edp_backlight_set_level(bl->aux, &bl->info, brightness);
>> +	} else {
>> +		if (bl->enabled) {
>> +			drm_edp_backlight_disable(bl->aux, &bl->info);
>> +			bl->enabled = false;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
> 
> 	Sam

Thanks,
Rajeev
