Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9961634ADDD
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 18:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C786F45E;
	Fri, 26 Mar 2021 17:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 306 seconds by postgrey-1.36 at gabe;
 Fri, 26 Mar 2021 17:50:11 UTC
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE94D6F45E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 17:50:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616781012; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fqTXKlxaID5peJONj5y6klwSiiiIBugF/pSXxYmx9GI=;
 b=p9n3LNiRMiw10FrY0MERv0X0FnfyTIs9m5FwEvu19f/oLWrTtIp2iBc+4UDWLfSSEHt+ZggF
 TBEGcvCYEMfpa0ffenMD6ztyxU9UxrO49qAX5ZXR+nG5AMAv6kI+jgGpdumRjgztxnaLu0di
 +A77e0LRgecwM5a9uuQ0jOBs6GA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 605e1d8f853c0a2c463c8ba0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 17:44:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 180C8C43468; Fri, 26 Mar 2021 17:44:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0556C433ED;
 Fri, 26 Mar 2021 17:44:45 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 26 Mar 2021 10:44:45 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 02/28] clk: mux: provide
 devm_clk_hw_register_mux()
In-Reply-To: <20210324151846.2774204-3-dmitry.baryshkov@linaro.org>
References: <20210324151846.2774204-1-dmitry.baryshkov@linaro.org>
 <20210324151846.2774204-3-dmitry.baryshkov@linaro.org>
Message-ID: <d84149929b251ccaa5cacb9efdd52e22@codeaurora.org>
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
> Add devm_clk_hw_register_mux() - devres-managed version of
> clk_hw_register_mux().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/clk/clk-mux.c        | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 13 +++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index e54e79714818..20582aae7a35 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -8,6 +8,7 @@
>   */
> 
>  #include <linux/clk-provider.h>
> +#include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> @@ -206,6 +207,40 @@ struct clk_hw *__clk_hw_register_mux(struct
> device *dev, struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(__clk_hw_register_mux);
> 
> +static void devm_clk_hw_release_mux(struct device *dev, void *res)
> +{
> +	clk_hw_unregister_mux(*(struct clk_hw **)res);
> +}
> +
> +struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct
> device_node *np,
> +		const char *name, u8 num_parents,
> +		const char * const *parent_names,
> +		const struct clk_hw **parent_hws,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> +		u8 clk_mux_flags, u32 *table, spinlock_t *lock)
> +{
> +	struct clk_hw **ptr, *hw;
> +
> +	ptr = devres_alloc(devm_clk_hw_release_mux, sizeof(*ptr), 
> GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	hw = __clk_hw_register_mux(dev, np, name, num_parents, parent_names,
> parent_hws,
> +				       parent_data, flags, reg, shift, mask,
> +				       clk_mux_flags, table, lock);
> +
> +	if (!IS_ERR(hw)) {
> +		*ptr = hw;
> +		devres_add(dev, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}
> +
> +	return hw;
> +}
> +EXPORT_SYMBOL_GPL(__devm_clk_hw_register_mux);
> +
>  struct clk *clk_register_mux_table(struct device *dev, const char 
> *name,
>  		const char * const *parent_names, u8 num_parents,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> diff --git a/include/linux/clk-provider.h 
> b/include/linux/clk-provider.h
> index 58f6fe866ae9..3eb15e0262f5 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -868,6 +868,13 @@ struct clk_hw *__clk_hw_register_mux(struct
> device *dev, struct device_node *np,
>  		const struct clk_parent_data *parent_data,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
>  		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
> +struct clk_hw *__devm_clk_hw_register_mux(struct device *dev, struct
> device_node *np,
> +		const char *name, u8 num_parents,
> +		const char * const *parent_names,
> +		const struct clk_hw **parent_hws,
> +		const struct clk_parent_data *parent_data,
> +		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> +		u8 clk_mux_flags, u32 *table, spinlock_t *lock);
>  struct clk *clk_register_mux_table(struct device *dev, const char 
> *name,
>  		const char * const *parent_names, u8 num_parents,
>  		unsigned long flags, void __iomem *reg, u8 shift, u32 mask,
> @@ -902,6 +909,12 @@ struct clk *clk_register_mux_table(struct device
> *dev, const char *name,
>  	__clk_hw_register_mux((dev), NULL, (name), (num_parents), NULL, NULL, 
> \
>  			      (parent_data), (flags), (reg), (shift),	      \
>  			      BIT((width)) - 1, (clk_mux_flags), NULL, (lock))
> +#define devm_clk_hw_register_mux(dev, name, parent_names,
> num_parents, flags, reg, \
> +			    shift, width, clk_mux_flags, lock)		      \
> +	__devm_clk_hw_register_mux((dev), NULL, (name), (num_parents),	      
> \
> +			      (parent_names), NULL, NULL, (flags), (reg),     \
> +			      (shift), BIT((width)) - 1, (clk_mux_flags),     \
> +			      NULL, (lock))
> 
>  int clk_mux_val_to_index(struct clk_hw *hw, u32 *table, unsigned int 
> flags,
>  			 unsigned int val);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
