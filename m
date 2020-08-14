Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC1D244E42
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 19:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C946EA46;
	Fri, 14 Aug 2020 17:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB126EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 17:57:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597427824; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XT+q1w9uiKS96sq/j8DMN65NAPFFypW3SJhmAiivFh4=;
 b=YoLJjhweKbeAQ1+bAYo8N2NuI866d6U4WerHoW5sVrlrAu+KZbaDoVLD2eek+VAmoB2nwvSH
 1t9H6FtZLbYNdKX8BqAdv60ixAC6Q6k3A+QU3YtHtKEPAtHbzZOg2WGuzgqbw0ghLeVUPu5l
 KOYp9UVr1GYRBv+jE8Xh6zLqjJw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f36d067d96d28d61e2bd042 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 17:56:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36D4EC433CB; Fri, 14 Aug 2020 17:56:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EC35C433C9;
 Fri, 14 Aug 2020 17:56:53 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 14 Aug 2020 10:56:52 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v10 2/5] drm/msm/dp: add displayPort driver
 support
In-Reply-To: <324d61b6-fc26-03ea-f8af-ff74a9767da2@linaro.org>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-3-tanmay@codeaurora.org>
 <324d61b6-fc26-03ea-f8af-ff74a9767da2@linaro.org>
Message-ID: <db6a4104ba9fc00edaf5542693ac6bd9@codeaurora.org>
X-Sender: tanmay@codeaurora.org
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, seanpaul@chromium.org,
 abhinavk@codeaurora.org, Guenter Roeck <groeck@chromium.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-14 10:12, Dmitry Baryshkov wrote:
> Hello,
> 
> On 12/08/2020 07:42, Tanmay Shah wrote:
>> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> [skipped]
> 
>> +		} else if ((dp_parser_check_prefix("ctrl", clk_name) ||
>> +			   dp_parser_check_prefix("stream", clk_name))  &&
>> +			   ctrl_clk_index < ctrl_clk_count) {
>> +			struct dss_clk *clk =
>> +				&ctrl_power->clk_config[ctrl_clk_index];
>> +			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
>> +			ctrl_clk_index++;
>> +
>> +			if (!strncmp(clk_name, "ctrl_link",
>> +					strlen("ctrl_link")) ||
>> +					!strncmp(clk_name, "stream_pixel",
>> +					strlen("ctrl_pixel")))
> 
> This should be "stream_pixel", I believe. I don't like macros, but
> most probably it would help here. Also function/brace alignment could
> be better (sorry, it really hides the issue here).
> 

Thanks for reviews and good catch!! I completely missed it when I 
renamed "ctrl_pixel".
Use of "stream_pixel" is very limited. So, instead of macros direct name 
is used.
Fixing function and brace alignment sounds good idea insted.

> 

>> +				clk->type = DSS_CLK_PCLK;
>> +			else
>> +				clk->type = DSS_CLK_AHB;
>> +		}
>> +	}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
