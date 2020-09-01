Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1A2258BF8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 11:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF00389C6B;
	Tue,  1 Sep 2020 09:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39D689C55
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 09:46:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598953569; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=b2eZhuFSLo8S06dwvehEezfz44wgJ9E7gdBWdQThQNc=;
 b=Q98wE3cDVWHDyMim2ykccKi0fVTIWvbW+q3A80BJYx4AIbALUchgP0hC2Q2TuYcSEXllm0BY
 +dmzhyWTcKyTn5j2M5DJf7fys6ixy6Uz9OZMEq/bw1JrJl8vQkXn49IpgQM8C6WaA7hoibUZ
 1ZGo1i962F3iNKCQbLvd0+X6/P8=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f4e184673afa3417e732cb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 09:45:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 33D4BC433AF; Tue,  1 Sep 2020 09:45:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
 SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.16] (unknown [61.1.231.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rnayak)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 42FFAC433CB;
 Tue,  1 Sep 2020 09:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 42FFAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
 <20200901083806.a2wz7idmfce2aj3a@vireshk-i7>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <fceb0b09-30cd-5084-0d0e-e7795cfc5fc9@codeaurora.org>
Date: Tue, 1 Sep 2020 15:15:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200901083806.a2wz7idmfce2aj3a@vireshk-i7>
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 saiprakash.ranjan@codeaurora.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/1/2020 2:08 PM, Viresh Kumar wrote:
> On 01-09-20, 13:01, Rajendra Nayak wrote:
>> So FWIU, dpu_unbind() gets called even when dpu_bind() fails for some reason.
> 
> Ahh, I see.
> 
>> I tried to address that earlier [1] which I realized did not land.
> 
> I don't think that patch was required, as you can call
> dev_pm_opp_put_clkname() multiple times and it will return without any
> errors/crash.

We did see a crash (Sai had reported it), perhaps with dsi [1] and not this
driver. But it was the same scenario that was possible here as well, which is
dev_pm_opp_put_clkname() getting called without dev_pm_opp_set_clkname()
being done. I think we ended up passing a NULL as opp_table in that case
and the function tries de-referencing it.

> 
>> But with these changes
>> it will be even more broken unless we identify if we failed dpu_bind() before
>> adding the OPP table, while adding it, or all went well with opps and handle things
>> accordingly in dpu_unbind.
> 
> Maybe not as dev_pm_opp_of_remove_table() can be called multiple times
> as well without any errors or crash.

Can it be called without the driver ever doing a dev_pm_opp_of_add_table()?

[1] https://lore.kernel.org/patchwork/patch/1275628/
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
