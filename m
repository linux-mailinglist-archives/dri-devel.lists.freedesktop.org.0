Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF1E21BEF0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 23:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C976ED0A;
	Fri, 10 Jul 2020 21:03:50 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B2A6ED0A
 for <dri-devel@freedesktop.org>; Fri, 10 Jul 2020 21:03:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594415029; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/Y+F2VRKOW+F7AotxxwUsOTyOLysK88Rj1ETIuOMgCU=;
 b=mVSKclKNU243urM4nF3vjHZompX4Xgk6oFdXbWzrIiJqiCC3bJq4bM6IqjTgxKETIlDlhhHr
 83/wHdqhiLBNK21ZvvdBmNCwbhBr7jB8pge8wbVqEoGfKmddoZf8mDFYwwFwSJXyjL0UMsdh
 buYecK/RZ/zVdO3AwlN8xWL4RJc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5f08d7b403c8596cdb045583 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 21:03:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F2CCC433CA; Fri, 10 Jul 2020 21:03:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.9] (unknown [117.210.185.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 599D8C433C6;
 Fri, 10 Jul 2020 21:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 599D8C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [Freedreno] [PATCH v4 4/7] drm: msm: a6xx: use dev_pm_opp_set_bw
 to scale DDR
To: Rob Clark <robdclark@gmail.com>
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGv4Nc6ZAxGoCC1s5KT=rxLR6uZDHfDnWZRnnLhqnegOpA@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <17afba8b-dae5-d724-4c8c-8b4c79fcfb84@codeaurora.org>
Date: Sat, 11 Jul 2020 02:33:40 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv4Nc6ZAxGoCC1s5KT=rxLR6uZDHfDnWZRnnLhqnegOpA@mail.gmail.com>
Content-Language: en-US
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 7/11/2020 1:11 AM, Rob Clark wrote:
> On Thu, Jul 9, 2020 at 1:01 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>> From: Sharat Masetty <smasetty@codeaurora.org>
>>
>> This patches replaces the previously used static DDR vote and uses
>> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
>> GPU frequency. Also since the icc path voting is handled completely
>> in the opp driver, remove the icc_path handle and its usage in the
>> drm driver.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
>>   1 file changed, 17 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index b547339..6fbfd7d 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -123,7 +123,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>
>>          if (!gmu->legacy) {
>>                  a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
>> -               icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> +               dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> What is the status of the patch to add dev_pm_opp_set_bw()?  If it is
> ready to go, and I get an ack-by from the OPP maintainer, I suppose I
> could merge it via drm/msm.
>
> Otherwise should we consider pulling in a private copy of it into
> drm/msm (and then drop it to use the helper in, hopefully, the next
> cycle)?
>
> I'm pulling the patches preceding this one into msm-next-staging to do
> some testing.  And the dt patches following this one would normally
> get merged via Bjorn.  At the moment, I'm not sure what to do with
> this one.
>
> BR,
> -R
I see Sibi's patch is already picked in opp/linux-next branch.
https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+/b466542f331e221a3628c1cfe5ccff307d7d787f 


Thanks,
-Akhil

>>                  return;
>>          }
>>
>> @@ -149,11 +149,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>>          if (ret)
>>                  dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>>
>> -       /*
>> -        * Eventually we will want to scale the path vote with the frequency but
>> -        * for now leave it at max so that the performance is nominal.
>> -        */
>> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>> +       dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>>   }
>>
>>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>> @@ -840,6 +836,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>>          dev_pm_opp_put(gpu_opp);
>>   }
>>
>> +static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>> +{
>> +       struct dev_pm_opp *gpu_opp;
>> +       unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
>> +
>> +       gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
>> +       if (IS_ERR_OR_NULL(gpu_opp))
>> +               return;
>> +
>> +       dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
>> +       dev_pm_opp_put(gpu_opp);
>> +}
>> +
>>   int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>   {
>>          struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>> @@ -864,7 +873,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>>          }
>>
>>          /* Set the bus quota to a reasonable value for boot */
>> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
>> +       a6xx_gmu_set_initial_bw(gpu, gmu);
>>
>>          /* Enable the GMU interrupt */
>>          gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
>> @@ -1040,7 +1049,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>>                  a6xx_gmu_shutdown(gmu);
>>
>>          /* Remove the bus vote */
>> -       icc_set_bw(gpu->icc_path, 0, 0);
>> +       dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
>>
>>          /*
>>           * Make sure the GX domain is off before turning off the GMU (CX)
>> --
>> 2.7.4
>>
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
