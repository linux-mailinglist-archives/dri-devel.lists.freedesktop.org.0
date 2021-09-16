Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1410B40E1A0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479C6EB7D;
	Thu, 16 Sep 2021 16:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D4E6EB7D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:37:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631810255; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gVEj4dzgzrzJlW1qXcUVinQb3TzvihTAGFLdLH6ovGk=;
 b=qPqMZvC+XG0dfAPTjhE8Sq3mmi5UWzeAzgXuDzY69nuZYd+ZRO29y2biM+Zw8sGR3Zffagwg
 BW43x3O9sH8JBsoswIwOqsmtP5t4bV940zsJTP5UXgRf5xMBSl8hPHHgeavdsjYjWiQ9wKKB
 tJsGPBH2NB8aGmEcbv3UlVqFdL8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 614372b5b585cc7d24dc38c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:37:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02683C0044B; Thu, 16 Sep 2021 16:37:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76447C43637;
 Thu, 16 Sep 2021 16:37:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Sep 2021 09:37:05 -0700
From: abhinavk@codeaurora.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, DRI mailing list
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, stable <stable@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Do not run snapshot on non-DPU
 devices
In-Reply-To: <CAOMZO5CgFFmKmKF0C_1okmu7N24=udevT3LE=0bRoZqUeDQSWg@mail.gmail.com>
References: <20210914174831.2044420-1-festevam@gmail.com>
 <96038e06b1141ad3348611a25544356e@codeaurora.org>
 <CAOMZO5BzU3_x7nb8sEF_NDeDOxYM0bQLEpbRzv39jayX=fudYg@mail.gmail.com>
 <5409ccef7ee4359d070eed3acd955590@codeaurora.org>
 <CAOMZO5CgFFmKmKF0C_1okmu7N24=udevT3LE=0bRoZqUeDQSWg@mail.gmail.com>
Message-ID: <f027fcafc30d922b64f954de213a583d@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fabio

Ah, I did not realize that amd compatible is present in the list and its 
quite a surprise.

/*
  * We don't know what's the best binding to link the gpu with the drm 
device.
  * Fow now, we just hunt for all the possible gpus that we support, and 
add them
  * as components.
  */
static const struct of_device_id msm_gpu_match[] = {
	{ .compatible = "qcom,adreno" },
	{ .compatible = "qcom,adreno-3xx" },
	{ .compatible = "amd,imageon" },
	{ .compatible = "qcom,kgsl-3d0" },
	{ },
};

https://github.com/torvalds/linux/commit/e6f6d63ed14c20528aa6df05a8f0707c183c6ba3

For this change itself,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

On 2021-09-16 09:24, Fabio Estevam wrote:
> Hi Abhinav,
> 
> On Thu, Sep 16, 2021 at 1:15 PM <abhinavk@codeaurora.org> wrote:
>> 
>> Hi Fabio
>> 
>> Thanks for confirming.
>> 
>> Although I have no issues with your change, I am curious why even msm 
>> is
>> probing and/or binding.
>> Your device tree should not be having any mdp/dpu nodes then.
> 
> The i.MX53 does have the following GPU node:
> 
> compatible = "amd,imageon-200.0", "amd,imageon";
> 
> That's why it probes the msm driver.
> 
> However, i.MX53 does not have any of the Qualcomm display controllers.
> 
> It uses the i.MX IPU display controller instead.
> 
> Hope that clarifies.
> 
> Please reply with a Reviewed-by if you are happy with my fix.
> 
> Thanks
