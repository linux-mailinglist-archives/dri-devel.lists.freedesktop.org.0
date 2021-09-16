Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BF640DFEC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 18:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11B06EE28;
	Thu, 16 Sep 2021 16:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B98F6EE29
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:15:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631808935; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VopVy3p4TBJI0nA0siqV1XpbK3ZcX0Kn9uhei4SlZuU=;
 b=egNTKZ9yHhgUuvlUfNpAX4M174WQWS4FQwzkdmeKNrzimksqwHEj5lNC9KUYoVCH2QIMgBn8
 GMfoo2Ah1HygctLMOW5ZL2ZsuPjHdqHC7NpBxQpje4Vkn5Q9X8ez8JCH/VIVrt+h4a082Mu7
 og1HpztMI+sZWf62YIpEbRLOWgk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61436d98bd6681d8ed92e170 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:15:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0885C4361B; Thu, 16 Sep 2021 16:15:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CE32C4360D;
 Thu, 16 Sep 2021 16:15:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 16 Sep 2021 09:15:16 -0700
From: abhinavk@codeaurora.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, DRI mailing list
 <dri-devel@lists.freedesktop.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, stable <stable@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH] drm/msm: Do not run snapshot on non-DPU
 devices
In-Reply-To: <CAOMZO5BzU3_x7nb8sEF_NDeDOxYM0bQLEpbRzv39jayX=fudYg@mail.gmail.com>
References: <20210914174831.2044420-1-festevam@gmail.com>
 <96038e06b1141ad3348611a25544356e@codeaurora.org>
 <CAOMZO5BzU3_x7nb8sEF_NDeDOxYM0bQLEpbRzv39jayX=fudYg@mail.gmail.com>
Message-ID: <5409ccef7ee4359d070eed3acd955590@codeaurora.org>
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

Thanks for confirming.

Although I have no issues with your change, I am curious why even msm is 
probing and/or binding.
Your device tree should not be having any mdp/dpu nodes then.

Thanks

Abhinav
On 2021-09-16 04:42, Fabio Estevam wrote:
> Hi Abhinav,
> 
> On Wed, Sep 15, 2021 at 11:22 PM <abhinavk@codeaurora.org> wrote:
> 
>> Are you not using DPU or are you not using mdp4/mdp5 as well? Even if
>> you are using any of mdps, kms should
>> not be NULL. Hence wanted to check the test case.
> 
> I am running i.MX53, which is an NXP SoC, not Qualcomm's.
> 
> It does not use DPU, nor MDP4/5 and kms is NULL in this case.
> 
> Some debug prints to confirm:
> 
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -557,18 +557,22 @@ static int msm_drm_init(struct device *dev,
> const struct drm_driver *drv)
>         case KMS_MDP4:
>                 kms = mdp4_kms_init(ddev);
>                 priv->kms = kms;
> +               pr_err("******** KMS_MDP4\n");
>                 break;
>         case KMS_MDP5:
>                 kms = mdp5_kms_init(ddev);
> +               pr_err("******** KMS_MDP5\n");
>                 break;
>         case KMS_DPU:
>                 kms = dpu_kms_init(ddev);
> +               pr_err("******** KMS_DPU\n");
>                 priv->kms = kms;
>                 break;
>         default:
>                 /* valid only for the dummy headless case, where 
> of_node=NULL */
>                 WARN_ON(dev->of_node);
>                 kms = NULL;
> +               pr_err("******** KMS is NULL\n");
>                 break;
>         }
> 
> # dmesg | grep KMS
> [    3.153215] ******** KMS is NULL
