Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 900E91F72C4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 06:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12D56E109;
	Fri, 12 Jun 2020 04:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69A26E109
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 04:16:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591935386; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=9jW2UZWQi53Kk3w5fHkJfOEaqlYtV6xo4Hhqo7akco4=;
 b=b66AsCHANaOkz5jp9EXHAEZjLusozXF2TOTTsamfjOBLPpNPm6jrcij52ppb2BA7lxC2iFOK
 yyzBPgoTEEgM9QdYvs11/mjVjrqsJouD+HD86UtTWe0sghUvKnnxwFxYa5TV5vF1/aqQM2iy
 Kp8hjzPqY9uwllrjjO9wPCpVmp8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ee301716bebe35debcee722 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 04:15:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64D9CC43387; Fri, 12 Jun 2020 04:15:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC032C433C8;
 Fri, 12 Jun 2020 04:15:44 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 21:15:44 -0700
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm: call drm_mode_config_reset before
 drm_dev_register
In-Reply-To: <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
References: <20200610004659.10401-1-abhinavk@codeaurora.org>
 <CAF6AEGsOX_QoOnMhqKuUHhhNjL_PgxF_5O7sYKi1Hkj5FmRpGw@mail.gmail.com>
Message-ID: <f99fefebb7a0a92c7e07afceb6abad4c@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, pdhaval@codeaurora.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 aravindh@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob

Thanks for the review.

Yes, this was a cleanup we noticed.

Abhinav
On 2020-06-11 20:35, Rob Clark wrote:
> On Tue, Jun 9, 2020 at 5:47 PM Abhinav Kumar <abhinavk@codeaurora.org> 
> wrote:
>> 
>> As per the documentation of drm_dev_register, all drivers should
>> call drm_dev_register after all the initialization is completed.
>> This also means that drm_mode_config_reset should be done before
>> drm_dev_register.
>> 
>> Change the sequence to align with this documentation.
>> 
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> I assume this is just a cleanup you noticed, and not fixing a bug you
> are hitting (in which case I'll pick it up next merge window, rather
> than -fixes)
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>
> 
>> ---
>>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
>> b/drivers/gpu/drm/msm/msm_drv.c
>> index 29295dee2a2e..9e77cc7f1fa4 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.c
>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>> @@ -538,12 +538,12 @@ static int msm_drm_init(struct device *dev, 
>> struct drm_driver *drv)
>>                 }
>>         }
>> 
>> +       drm_mode_config_reset(ddev);
>> +
>>         ret = drm_dev_register(ddev, 0);
>>         if (ret)
>>                 goto err_msm_uninit;
>> 
>> -       drm_mode_config_reset(ddev);
>> -
>>  #ifdef CONFIG_DRM_FBDEV_EMULATION
>>         if (kms && fbdev)
>>                 priv->fbdev = msm_fbdev_init(ddev);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
