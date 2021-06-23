Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC93B13CA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 08:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B871B89C6B;
	Wed, 23 Jun 2021 06:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977E289C6B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 06:15:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624428927; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YgXZ6VNhDITS6yDaGx56LtlJqbhq7xTELt1tz8y6TYM=;
 b=QceX7wa0eTmmXzY7lkWOAkSV1PiGgZN6m6/lxGjUAMBzxTgfYs3CZWGYbo1//ZVuXwtTKvY6
 9VcxH2cIJ82xAA2lmgRgIxcU/nPpUXOJ15ey7lE/XBi6VJGhS4sI9D5wzNda3+CmEv6f6pHv
 RY2SxTtNFx2kqH6ENVedPDTxzp8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60d2d17e01dd9a943150670b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Jun 2021 06:15:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7AC20C43460; Wed, 23 Jun 2021 06:15:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 93D9CC433D3;
 Wed, 23 Jun 2021 06:15:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 23 Jun 2021 11:45:24 +0530
From: rajeevny@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [v7 1/5] drm/panel: add basic DP AUX backlight support
In-Reply-To: <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
 <1624099230-20899-2-git-send-email-rajeevny@codeaurora.org>
 <20210620093141.GA703072@ravnborg.org>
 <ebf5581759daee9596c2f092ca836ecb@codeaurora.org>
 <20210621183828.GA918146@ravnborg.org>
 <CAD=FV=WJiA+RxaQA9xt7Tik_2pCEJo0+6b39Di8cfnSWGuKkJQ@mail.gmail.com>
Message-ID: <c15947bb1566f176a2f534c52a7c3183@codeaurora.org>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 23-06-2021 00:03, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 21, 2021 at 11:38 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>> 
>> > > I cannot see why you need the extra check on ->enabled?
>> > > Would it be sufficient to check backlight_is_blank() only?
>> >
>> > This extra check on bl->enabled flag is added to avoid enabling/disabling
>> > backlight again if it is already enabled/disabled.
>> > Using this flag way can know the transition between backlight blank and
>> > un-blank, and decide when to enable/disable the backlight.
>> 
>> My point is that this should really not be needed, as it would cover 
>> up
>> for some other bug whaere we try to do something twice that is not
>> needed. But I am less certain here so if you think it is needed, keep
>> it as is.
> 
> I haven't tested this myself, but I believe that it is needed. I don't
> think the backlight update_status() function is like an enable/disable
> function. I believe it can be called more than one time even while the
> backlight is disabled. For instance, you can see that
> backlight_update_status() just blindly calls through to update the
> status. That function can be called for a number of reasons. Perhaps
> Rajeev can put some printouts to confirm but I think that if the
> backlight is "blanked" for whatever reason and you write to sysfs and
> change the backlight level you'll still get called again even though
> the backlight is still "disabled".
> 
Yes, sysfs write will always try to update the backlight even though the 
backlight is "blanked".

The "bl->enabled" check is also required to prevent unnecessary calls to 
drm_edp_backlight_enable() during every backlight level change.

To confirm this, I have added few prints in 
dp_aux_backlight_update_status() function and collected the logs.
(Copying the code here to make the review easy)


static int dp_aux_backlight_update_status(struct backlight_device *bd)
{
         struct dp_aux_backlight *bl = bl_get_data(bd);
         u16 brightness = backlight_get_brightness(bd);
         int ret = 0;

+        pr_err("%s: brightness %d, _is_blank %d, bl->enabled %d\n", 
__func__,
+                brightness, backlight_is_blank(bd), bl->enabled);

         if (!backlight_is_blank(bd)) {
                 if (!bl->enabled) {
+                        pr_err("%s: enabling backlight\n", __func__);
                         drm_edp_backlight_enable(bl->aux, &bl->info, 
brightness);
                         bl->enabled = true;
                         return 0;
                 }
                 ret = drm_edp_backlight_set_level(bl->aux, &bl->info, 
brightness);
         } else {
                 if (bl->enabled) {
+                       pr_err("%s: disabling backlight\n", __func__);
                         drm_edp_backlight_disable(bl->aux, &bl->info);
                         bl->enabled = false;
                 }
         }

         return ret;
}


LOGS
====

During boot
-----------
[    4.752188] dp_aux_backlight_update_status: brightness 102, _is_blank 
0, bl->enabled 0
[    4.760447] dp_aux_backlight_update_status: enabling backlight
[    5.503866] dp_aux_backlight_update_status: brightness 102, _is_blank 
0, bl->enabled 1
[    6.897355] dp_aux_backlight_update_status: brightness 103, _is_blank 
0, bl->enabled 1
[    6.938617] dp_aux_backlight_update_status: brightness 104, _is_blank 
0, bl->enabled 1
[    6.980634] dp_aux_backlight_update_status: brightness 105, _is_blank 
0, bl->enabled 1


Turning Panel OFF
-----------------
localhost ~ # set_power_policy --ac_screen_dim_delay=5 
--ac_screen_off_delay=10
localhost ~ #

[  106.555140] dp_aux_backlight_update_status: brightness 145, _is_blank 
0, bl->enabled 1
...
...
[  111.679407] dp_aux_backlight_update_status: brightness 7, _is_blank 
0, bl->enabled 1
[  111.700302] dp_aux_backlight_update_status: brightness 4, _is_blank 
0, bl->enabled 1
[  111.720805] dp_aux_backlight_update_status: brightness 2, _is_blank 
0, bl->enabled 1
[  111.747486] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 1
[  111.755580] dp_aux_backlight_update_status: disabling backlight
[  111.792344] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0


Changing brightness from sysfs while panel is off
--------------------------------------------------
(it will do nothing)

localhost ~ # echo 100 > 
/sys/class/backlight/dp_aux_backlight/brightness
[  352.754963] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0

localhost ~ # echo 200 > 
/sys/class/backlight/dp_aux_backlight/brightness
[  364.708048] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0

localhost ~ # echo 0 > /sys/class/backlight/dp_aux_backlight/brightness
[  378.850978] dp_aux_backlight_update_status: brightness 0, _is_blank 
1, bl->enabled 0


Turning Panel ON
----------------
[  553.381745] dp_aux_backlight_update_status: brightness 0, _is_blank 
0, bl->enabled 0
[  553.418133] dp_aux_backlight_update_status: enabling backlight
[  553.426397] dp_aux_backlight_update_status: brightness 159, _is_blank 
0, bl->enabled 1

====



Thanks,
Rajeev

