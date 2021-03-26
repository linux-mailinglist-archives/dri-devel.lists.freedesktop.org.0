Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ABD34ADDF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB1B6F461;
	Fri, 26 Mar 2021 17:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DEE6F460
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:50:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781027; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3P5jYyIK/awWuVFoUzjX70WMvBZHGZktBN9ren2ZJqA=;
 b=WNEV+Cu9wSYY1OvWKqCZter/itmJqJSI2ddQZwwJHYTpItLMS5A9anxxR6ff+EG+OH97N622
 7yso3+C/Ypps2sgmtqNBpYoOaC9K8hhNsWzAifsClJ/DipfaLaceqgcEqP7lC0tduXN73QyW
 d8QQcXlWaIuEdFGmRTLAHWTceGA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 605e1dacc39407c3271b1c5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:45:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87AD9C433ED; Fri, 26 Mar 2021 17:45:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C2015C433CA;
 Fri, 26 Mar 2021 17:45:13 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:45:13 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 03/28] clk: divider: add
 devm_clk_hw_register_divider
In-Reply-To: <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-4-dmitry.baryshkov@linaro.org>
Message-ID: <17513743b70339aacf6bc86b9ea795f5@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-24 08:18, Dmitry Baryshkov wrote:
> Add devm_clk_hw_register_divider() - devres version of
> clk_hw_register_divider().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  include/linux/clk-provider.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/clk-provider.h 
> b/include/linux/clk-provider.h
> index 3eb15e0262f5..162a2e5546a3 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -785,6 +785,23 @@ struct clk *clk_register_divider_table(struct
> device *dev, const char *name,
>  				  (parent_data), (flags), (reg), (shift),     \
>  				  (width), (clk_divider_flags), (table),      \
>  				  (lock))
> +/**
> + * devm_clk_hw_register_divider - register a divider clock with the
> clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_name: name of clock's parent
> + * @flags: framework-specific flags
> + * @reg: register address to adjust divider
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_divider_flags: divider-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_divider(dev, name, parent_name, flags,
> reg, shift,    \
> +				width, clk_divider_flags, lock)		      \
> +	__devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), 
> NULL,   \
> +				  NULL, (flags), (reg), (shift), (width),     \
> +				  (clk_divider_flags), NULL, (lock))
>  /**
>   * devm_clk_hw_register_divider_table - register a table based divider 
> clock
>   * with the clock framework (devres variant)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
