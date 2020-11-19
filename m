Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C32B9A65
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 19:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20786E5D1;
	Thu, 19 Nov 2020 18:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ED76E5D1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 18:13:14 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so7455406wru.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=i+JS9nIAw+GECBNSoIwtkPpHIDmmFYQRGIixkpNJ1pw=;
 b=zg6rI6FjWtx5yXqCC3eLHjTWvBWBjg1h2q5QYfvH2FmSPWi64lw4J4yqCKxsAOikhQ
 tzatBgAynf2r72trUribQ+sF17eI4FYvcxa6wH6GTY+rt81q/N2RItEeLEuAENcle01k
 CHhlKNpdsW5aUypWfT1vJf47i2TaWTh0MkkO0lkx/nIaS4Zdi1r9aytKDGORWIyWXO3a
 CBGnycWSk3Md5BGDVTtO+X/7KV3EoZbKHyPjnGiAVFWa+H4eZfZmWs1IRG8f7gq+LCO5
 5M1rbmYd8wXa76/+VCuj1+MRTu+6hoHfG/+LhHOvw+FqGKBPFelQ+JjKXQUJR++G70Zc
 uwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=i+JS9nIAw+GECBNSoIwtkPpHIDmmFYQRGIixkpNJ1pw=;
 b=UZW7++xTe6eDMrYzlXyVbibr3SzLh+zqzh8WKkah4i7KfYb7IJoFznGYiCAVgEt6eX
 bszSUDd8Ama66H30nxCrL3INgMw+fMvgSiRWwdgfX9cukRq/MLs7O2BUYYQey0LOtN4L
 kvWeuYtl+3jFvmPot8OdpWHskHaN+mlVu7bOpKOGKQvTzwAdd3qd5GTze1N0pWcYGMWc
 BshwrkoJhNkpMT22yDUWxGDCCXddhwAdlk/nJDGaO1wfWV4vv6R/8GJxrgBlpdcGnTXv
 p/xcn3S2vVDyvjEa1Sp4E9Bk0SCvP+jT8fNjlhrw2F5TFZNJH32f2BWbFf3FcKUrlEq4
 CW7A==
X-Gm-Message-State: AOAM5300cbBHvt6A9bwlviTXS/zYKjLHNulqAITwfA05AAboDaXMbbT3
 26DJqvbMzpBLt1J/nLleTnP2ug==
X-Google-Smtp-Source: ABdhPJzsKDmON4o/OFAQF109oAW2KjCYCtZryKNUSxju9G/qMlZIa1InhW5YzsVRVjcRJsvkGCD7uQ==
X-Received: by 2002:a5d:4bc7:: with SMTP id l7mr12495950wrt.105.1605809593341; 
 Thu, 19 Nov 2020 10:13:13 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id 90sm1029734wrl.60.2020.11.19.10.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:13:12 -0800 (PST)
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
 <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, Marc Zyngier
 <maz@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-reply-to: <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
Message-ID: <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
Date: Thu, 19 Nov 2020 19:13:11 +0100
MIME-Version: 1.0
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu 19 Nov 2020 at 19:04, Guillaume Tucker <guillaume.tucker@collabora.com> wrote:

> Hi Marc,
>
> On 19/11/2020 11:58, Marc Zyngier wrote:
>> On 2020-11-19 10:26, Neil Armstrong wrote:
>>> On 19/11/2020 11:20, Marc Zyngier wrote:
>>>> On 2020-11-19 08:50, Guillaume Tucker wrote:
>>>>> Please see the automated bisection report below about some kernel
>>>>> errors on meson-gxbb-p200.
>>>>>
>>>>> Reports aren't automatically sent to the public while we're
>>>>> trialing new bisection features on kernelci.org, however this one
>>>>> looks valid.
>>>>>
>>>>> The bisection started with next-20201118 but the errors are still
>>>>> present in next-20201119.  Details for this regression:
>>>>>
>>>>>   https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/
>>>>>
>>>>> The first error is:
>>>>>
>>>>>   [   14.757489] Internal error: synchronous external abort: 96000210
>>>>> [#1] PREEMPT SMP
>>>>
>>>> Looks like yet another clock ordering setup. I guess different Amlogic
>>>> platforms have slightly different ordering requirements.
>>>>
>>>> Neil, do you have any idea of which platform requires which ordering?
>>>> The variability in DT and platforms is pretty difficult to follow (and
>>>> I don't think I have such board around).
>>>
>>> The requirements should be the same, here the init was done before calling
>>> dw_hdmi_probe to be sure the clocks and internals resets were deasserted.
>>> But since you boot from u-boot already enabling these, it's already active.
>>>
>>> The solution would be to revert and do some check in meson_dw_hdmi_init() to
>>> check if already enabled and do nothing.
>> 
>> A better fix seems to be this, which makes it explicit that there is
>> a dependency between some of the registers accessed from meson_dw_hdmi_init()
>> and the iahb clock.
>> 
>> Guillaume, can you give this a go on your failing box?
>
> I confirm it solves the problem.  Please add this to your fix
> patch if it's OK with you:
>
>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
>   Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>
>
> For the record, it passed all the tests when applied on top of
> the "bad" revision found by the bisection:
>
>   http://lava.baylibre.com:10080/scheduler/alljobs?search=v5.10-rc3-1021-gb8668a2e5ea1
>
> and the exact same test on the "bad" revision without the fix
> consistently showed the error:
>
>   http://lava.baylibre.com:10080/scheduler/job/374176
>
>
> Thanks,
> Guillaume
>
>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 7f8eea494147..52af8ba94311 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -146,6 +146,7 @@ struct meson_dw_hdmi {
>>      struct reset_control *hdmitx_ctrl;
>>      struct reset_control *hdmitx_phy;
>>      struct clk *hdmi_pclk;
>> +    struct clk *iahb_clk;
>>      struct clk *venci_clk;
>>      struct regulator *hdmi_supply;
>>      u32 irq_stat;
>> @@ -1033,6 +1034,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>      }
>>      clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
>> 
>> +    meson_dw_hdmi->iahb_clk = devm_clk_get(dev, "iahb");
>> +    if (IS_ERR(meson_dw_hdmi->iahb_clk)) {
>> +        dev_err(dev, "Unable to get iahb clk\n");
>> +        return PTR_ERR(meson_dw_hdmi->iahb_clk);
>> +    }
>> +    clk_prepare_enable(meson_dw_hdmi->iahb_clk);

If you guys are going ahead with this fix, this call to
clk_prepare_enable() needs to be balanced with clk_disable_unprepare() somehow

>> +
>>      meson_dw_hdmi->venci_clk = devm_clk_get(dev, "venci");
>>      if (IS_ERR(meson_dw_hdmi->venci_clk)) {
>>          dev_err(dev, "Unable to get venci clk\n");
>> @@ -1071,6 +1079,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>> 
>>      encoder->possible_crtcs = BIT(0);
>> 
>> +    meson_dw_hdmi_init(meson_dw_hdmi);
>> +
>>      DRM_DEBUG_DRIVER("encoder initialized\n");
>> 
>>      /* Bridge / Connector */
>> @@ -1095,8 +1105,6 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>      if (IS_ERR(meson_dw_hdmi->hdmi))
>>          return PTR_ERR(meson_dw_hdmi->hdmi);
>> 
>> -    meson_dw_hdmi_init(meson_dw_hdmi);
>> -
>>      next_bridge = of_drm_find_bridge(pdev->dev.of_node);
>>      if (next_bridge)
>>          drm_bridge_attach(encoder, next_bridge,
>> 
>> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
