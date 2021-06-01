Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B27639731F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5A06E53E;
	Tue,  1 Jun 2021 12:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916C86EA15
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:22:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622550181; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JAcNP7Uo9zJKWgXCjvCXGiHUwrw7I6s+Af9UbfhFRic=;
 b=PApF6lOYOMic5cUOhoBioOxlGMEkzndBWUn5AW57eKPR+/L3omXsI2v9q2QRrvK1xzRWVwLI
 ZzbiyTb9BMVOuFaYdxd5b9cypwJTy8prLYCuNiphq8ndU+WupZLCNXT5HxbL3HlMrYo5M6Ll
 QVqDkM3TeLlu7TtnKJ07aChXd2A=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60b62695ed59bf69cceb716a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Jun 2021 12:22:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2B315C43217; Tue,  1 Jun 2021 12:22:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B0A4C433F1;
 Tue,  1 Jun 2021 12:22:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 01 Jun 2021 17:52:44 +0530
From: rajeevny@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [v1 2/3] drm/msm/dsi: Add PHY configuration for SC7280
In-Reply-To: <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-3-git-send-email-rajeevny@codeaurora.org>
 <7a3facb5-d118-f81b-65f8-381b0d56a23b@linaro.org>
Message-ID: <b37617c61fbdb11dc2c903878c05e0ac@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, mkrishn@codeaurora.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31-05-2021 23:27, Dmitry Baryshkov wrote:
> On 31/05/2021 16:33, Rajeev Nandan wrote:


>> +	.min_pll_rate = 600000000UL,
>> +	.max_pll_rate = (5000000000ULL < ULONG_MAX) ? 5000000000ULL : 
>> ULONG_MAX,
> 
> Could you please follow the patch by Arnd here?
> https://lore.kernel.org/linux-arm-msm/20210514213032.575161-1-arnd@kernel.org/
> 
> 
> 
>> +	.io_start = { 0xae94400, 0xae96400 },
>> +	.num_dsi_phy = 2,
> 
> Judging from the next patch, you have one DSI host and one DSI PHY.
> Could you please correct io_start / num_dsi_phy here?
> 
>> +	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>> +};
> 
> 
> With these two issues fixed:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you very much for your review :) I have incorporated the
review comments. I am waiting for comments on my DT bindings patch (1/3) 
and
will send v2 in a day or two.

Thanks,
Rajeev
