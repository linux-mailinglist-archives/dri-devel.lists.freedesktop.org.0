Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B174819BC6B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF116E9E0;
	Thu,  2 Apr 2020 07:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4014B6E907
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 09:32:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585733551; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=O4mfO68j0oUFthZ8BDymyBRZQeDPJ5DqwOJdqb9xXjc=;
 b=Pk0X3Ada9U+D2p3ZzCfdTrUP5wfUktvxx1Ic3FPnYSOqqQusDj/+wecyDVfBs1Xip+SB7lNv
 131MOWaMIXAxvGeePKZ2aYs6ef7JrXRINEPUpjiRHEMSHoIeDG5pUo8kx4puJ5L5UjyKW5vg
 /LJiSYpL6rBmCN2YvBA+lnVH5Vs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e845fa5.7ff7beefeed8-smtp-out-n05;
 Wed, 01 Apr 2020 09:32:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C2A60C433F2; Wed,  1 Apr 2020 09:32:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16FF4C433D2;
 Wed,  1 Apr 2020 09:32:21 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 01 Apr 2020 15:02:21 +0530
From: kalyan_t@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
In-Reply-To: <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
References: <1585663107-12406-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=Up4y6GUkJc8NNJBdC28L+6LvUs7pCUg4pyMCgHMGEkug@mail.gmail.com>
Message-ID: <2922a0c64ec61c3d74d516e44dca2d71@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-31 21:30, Doug Anderson wrote:
> Hi,
> 
> On Tue, Mar 31, 2020 at 6:58 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> "The PM core always increments the runtime usage counter
>> before calling the ->suspend() callback and decrements it
>> after calling the ->resume() callback"
>> 
>> DPU and DSI are managed as runtime devices. When
>> suspend is triggered, PM core adds a refcount on all the
>> devices and calls device suspend, since usage count is
>> already incremented, runtime suspend was not getting called
>> and it kept the clocks on which resulted in target not
>> entering into XO shutdown.
>> 
>> Add changes to force suspend on runtime devices during pm sleep.
>> 
>> Changes in v1:
>>  - Remove unnecessary checks in the function
>>     _dpu_kms_disable_dpu (Rob Clark).
>> 
>> Changes in v2:
>>  - Avoid using suspend_late to reset the usagecount
>>    as suspend_late might not be called during suspend
>>    call failures (Doug).
>> 
>> Changes in v3:
>>  - Use force suspend instead of managing device usage_count
>>    via runtime put and get API's to trigger callbacks (Doug).
>> 
>> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 ++
>>  drivers/gpu/drm/msm/dsi/dsi.c           | 2 ++
>>  drivers/gpu/drm/msm/msm_drv.c           | 4 ++++
>>  3 files changed, 8 insertions(+)
> 
> This looks much saner to me.  Thanks!  I assume it still works fine
> for you?  I'm still no expert on how all the pieces of DRM drivers
> work together, but at least there's not a bunch of strange fiddling
> with pm_runtime state and hopefully it will avoid weird corner
> cases...
> 
--- Yes, verified the change on trogdor device, and display can suspend 
with the change.
> 
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index ce19f1d..b886d9d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -1123,6 +1123,8 @@ static int __maybe_unused 
>> dpu_runtime_resume(struct device *dev)
>> 
>>  static const struct dev_pm_ops dpu_pm_ops = {
>>         SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, 
>> NULL)
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                               pm_runtime_force_resume)
>>  };
>> 
>>  static const struct of_device_id dpu_dt_match[] = {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c 
>> b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 55ea4bc2..62704885 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -161,6 +161,8 @@ static int dsi_dev_remove(struct platform_device 
>> *pdev)
>> 
>>  static const struct dev_pm_ops dsi_pm_ops = {
>>         SET_RUNTIME_PM_OPS(msm_dsi_runtime_suspend, 
>> msm_dsi_runtime_resume, NULL)
>> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                               pm_runtime_force_resume)
>>  };
>> 
>>  static struct platform_driver dsi_driver = {
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 7d985f8..2b8c99c 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -1051,6 +1051,8 @@ static int msm_pm_suspend(struct device *dev)
>>                 return ret;
>>         }
>> 
>> +       pm_runtime_force_suspend(dev);
> 
> nit: check return value of pm_runtime_force_suspend()?
> 
> 
>> +
>>         return 0;
>>  }
>> 
>> @@ -1063,6 +1065,8 @@ static int msm_pm_resume(struct device *dev)
>>         if (WARN_ON(!priv->pm_state))
>>                 return -ENOENT;
>> 
>> +       pm_runtime_force_resume(dev);
> 
> nit: check return value of pm_runtime_force_resume()?
> 
> 
> -Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
