Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A32B9ABB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 19:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE1E890B8;
	Thu, 19 Nov 2020 18:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E06B890B8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 18:35:07 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A391A22255;
 Thu, 19 Nov 2020 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605810906;
 bh=bJya95Z1CX+o+B+3wr8vb6PON5dqknScWdUZYecD8RY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MsWxETebIKzGKBcYQlrhF/UiDv9lka8MDJqESPfFYr1ZkyeaAtFqbYFpvvRifTpTi
 xuFCTTb4z7kiHp49CkkgbP2QlrpUvfzFF2sm33sokEQfeEX6pgqTbrN5/TDF+BsuZT
 niEt4Jjh9v4YLFrR6vrNHJbHEPJSFtBjLE7M/wJ4=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kfols-00C36C-DX; Thu, 19 Nov 2020 18:35:04 +0000
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 18:35:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
In-Reply-To: <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
 <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
 <c76273f5fe483766e6a7f509f82d928a@kernel.org>
 <f59922c6-69f5-c70e-b424-0659bf91a4fd@collabora.com>
 <1jr1op8bbc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <00a10c12a4eb2a9cdd9f50e88a293c3f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jbrunet@baylibre.com, guillaume.tucker@collabora.com,
 narmstrong@baylibre.com, kernelci-results@groups.io, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 martin.blumenstingl@googlemail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: kernelci-results@groups.io, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-19 18:13, Jerome Brunet wrote:
> On Thu 19 Nov 2020 at 19:04, Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
> 
>> Hi Marc,
>> 
>> On 19/11/2020 11:58, Marc Zyngier wrote:
>>> On 2020-11-19 10:26, Neil Armstrong wrote:
>>>> On 19/11/2020 11:20, Marc Zyngier wrote:
>>>>> On 2020-11-19 08:50, Guillaume Tucker wrote:
>>>>>> Please see the automated bisection report below about some kernel
>>>>>> errors on meson-gxbb-p200.
>>>>>> 
>>>>>> Reports aren't automatically sent to the public while we're
>>>>>> trialing new bisection features on kernelci.org, however this one
>>>>>> looks valid.
>>>>>> 
>>>>>> The bisection started with next-20201118 but the errors are still
>>>>>> present in next-20201119.  Details for this regression:
>>>>>> 
>>>>>>   https://kernelci.org/test/case/id/5fb6196bfd0127fd68d8d902/
>>>>>> 
>>>>>> The first error is:
>>>>>> 
>>>>>>   [   14.757489] Internal error: synchronous external abort: 
>>>>>> 96000210
>>>>>> [#1] PREEMPT SMP
>>>>> 
>>>>> Looks like yet another clock ordering setup. I guess different 
>>>>> Amlogic
>>>>> platforms have slightly different ordering requirements.
>>>>> 
>>>>> Neil, do you have any idea of which platform requires which 
>>>>> ordering?
>>>>> The variability in DT and platforms is pretty difficult to follow 
>>>>> (and
>>>>> I don't think I have such board around).
>>>> 
>>>> The requirements should be the same, here the init was done before 
>>>> calling
>>>> dw_hdmi_probe to be sure the clocks and internals resets were 
>>>> deasserted.
>>>> But since you boot from u-boot already enabling these, it's already 
>>>> active.
>>>> 
>>>> The solution would be to revert and do some check in 
>>>> meson_dw_hdmi_init() to
>>>> check if already enabled and do nothing.
>>> 
>>> A better fix seems to be this, which makes it explicit that there is
>>> a dependency between some of the registers accessed from 
>>> meson_dw_hdmi_init()
>>> and the iahb clock.
>>> 
>>> Guillaume, can you give this a go on your failing box?
>> 
>> I confirm it solves the problem.  Please add this to your fix
>> patch if it's OK with you:
>> 
>>   Reported-by: "kernelci.org bot" <bot@kernelci.org>
>>   Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> 
>> 
>> For the record, it passed all the tests when applied on top of
>> the "bad" revision found by the bisection:
>> 
>>   
>> http://lava.baylibre.com:10080/scheduler/alljobs?search=v5.10-rc3-1021-gb8668a2e5ea1
>> 
>> and the exact same test on the "bad" revision without the fix
>> consistently showed the error:
>> 
>>   http://lava.baylibre.com:10080/scheduler/job/374176
>> 
>> 
>> Thanks,
>> Guillaume
>> 
>> 
>>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c 
>>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> index 7f8eea494147..52af8ba94311 100644
>>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>>> @@ -146,6 +146,7 @@ struct meson_dw_hdmi {
>>>      struct reset_control *hdmitx_ctrl;
>>>      struct reset_control *hdmitx_phy;
>>>      struct clk *hdmi_pclk;
>>> +    struct clk *iahb_clk;
>>>      struct clk *venci_clk;
>>>      struct regulator *hdmi_supply;
>>>      u32 irq_stat;
>>> @@ -1033,6 +1034,13 @@ static int meson_dw_hdmi_bind(struct device 
>>> *dev, struct device *master,
>>>      }
>>>      clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
>>> 
>>> +    meson_dw_hdmi->iahb_clk = devm_clk_get(dev, "iahb");
>>> +    if (IS_ERR(meson_dw_hdmi->iahb_clk)) {
>>> +        dev_err(dev, "Unable to get iahb clk\n");
>>> +        return PTR_ERR(meson_dw_hdmi->iahb_clk);
>>> +    }
>>> +    clk_prepare_enable(meson_dw_hdmi->iahb_clk);
> 
> If you guys are going ahead with this fix, this call to
> clk_prepare_enable() needs to be balanced with clk_disable_unprepare() 
> somehow

Yup, good point.

Although this driver *never* disables any clock it enables, and leaves 
it
to the main DW driver, which I guess makes it leak references.

So all 3 clocks need fixing.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
