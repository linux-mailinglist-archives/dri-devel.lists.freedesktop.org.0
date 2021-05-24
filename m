Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690538F3E9
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 21:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6396E19A;
	Mon, 24 May 2021 19:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C055B6E19A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 19:57:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621886242; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3PgdOwZHHK2LbackkccgQl1/jIrQovrjITcU10//viA=;
 b=W2e4gMt43a7GDiJmxZtgM5F4gkEyR4Lx6m6YGgnO6lJ2+UjizCegvdzZtox07YwRCrMblVnZ
 uDCdi4TBJqULJvh8r5lFdflsOqg/4hkA9Z06MmK6yNHaqRVC3+E6kChkyNaZ06D0NM5juy7w
 /ivM5I+W+qIuaFlAiJdj4fiVxd0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60ac051f5f788b52a5a47f5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 19:57:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2C99FC4338A; Mon, 24 May 2021 19:57:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA6DFC433F1;
 Mon, 24 May 2021 19:57:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 May 2021 12:57:17 -0700
From: khsieh@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/3] drm/msm/dp: Handle aux timeouts, nacks, defers
In-Reply-To: <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
References: <20210507212505.1224111-1-swboyd@chromium.org>
 <20210507212505.1224111-4-swboyd@chromium.org>
 <1133b2c21eb8f385c16c610638a17d9c@codeaurora.org>
 <CAE-0n51G2NGyE4w1ebdBd1svVPA3QvPZX6kivKA1m9o1XhE26A@mail.gmail.com>
Message-ID: <6ed169ecd2d1c91005b848fc486afa75@codeaurora.org>
X-Sender: khsieh@codeaurora.org
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-24 12:19, Stephen Boyd wrote:
> Quoting khsieh@codeaurora.org (2021-05-24 09:33:49)
>> On 2021-05-07 14:25, Stephen Boyd wrote:
>> > @@ -367,36 +347,38 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
>> > *dp_aux,
>> >       }
>> >
>> >       ret = dp_aux_cmd_fifo_tx(aux, msg);
>> > -
>> >       if (ret < 0) {
>> >               if (aux->native) {
>> >                       aux->retry_cnt++;
>> >                       if (!(aux->retry_cnt % MAX_AUX_RETRIES))
>> >                               dp_catalog_aux_update_cfg(aux->catalog);
>> >               }
>> > -             usleep_range(400, 500); /* at least 400us to next try */
>> > -             goto unlock_exit;
>> > -     }
>> 
>> 1) dp_catalog_aux_update_cfg(aux->catalog) will not work without
>> dp_catalog_aux_reset(aux->catalog);
>> dp_catalog_aux_reset(aux->catalog) will reset hpd control block and
>> potentially cause pending hpd interrupts got lost.
>> Therefore I think we should not do
>> dp_catalog_aux_update_cfg(aux->catalog) for now.
>> reset aux controller will reset hpd control block probolem will be 
>> fixed
>> at next chipset.
>> after that we can add dp_catalog_aux_update_cfg(aux->catalog) followed
>> by dp_catalog_aux_reset(aux->catalog) back at next chipset.
> 
> Hmm ok. So the phy calibration logic that tweaks the tuning values is
> never used? Why can't the phy be tuned while it is active? I don't
> understand why we would ever want to reset the aux phy when changing 
> the
> settings for a retry. Either way, this is not actually changing in this
> patch so it would be another patch to remove this code.
ok,
> 
>> 
>> 2) according to DP specification, aux read/write failed have to wait 
>> at
>> least 400us before next try can start.
>> Otherwise, DP compliant test will failed
> 
> Yes. The caller of this function, drm_dp_dpcd_access(), has the delay
> already
> 
>                 if (ret != 0 && ret != -ETIMEDOUT) {
>                         usleep_range(AUX_RETRY_INTERVAL,
>                                      AUX_RETRY_INTERVAL + 100);
>                 }
> 
> so this delay here is redundant.
yes, you are right. This is enough.

