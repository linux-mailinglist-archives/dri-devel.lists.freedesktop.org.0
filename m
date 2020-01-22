Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88B145329
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 11:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E927A6F4A2;
	Wed, 22 Jan 2020 10:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1EF6F4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 10:55:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t23so2683173wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
 b=rocHCsiCeMC1gpXVMEd5t5GK6MZu9gxeI/GUSwU8+8FCQI16R2LHI3G4MWOh1lr3g3
 i1wiLGTmuLwe05mlGIErWGWzGoqLVAABV3NaILq2JqpGu7mjVMG0VWhHTkzHQYAGnHNW
 w5UKpjmG4Gd1NbGZRzJrNdIP/C0xnSuRunOmteVNAKpUcHu5mklqKMhQn+wY5GlzLYaj
 zeQwQ2vkEOUjwaMVA0Tjz2cECH5crF8FweVqeBt52Eur64fEAaeJKGW7XhCjUe0/IUTI
 B/X/CNzrO1eWv0TSaH0s7OQ+Zv9Ob8TeRHde5yOBtBPlR1dWivNW/PIeEIc/nhgezLE8
 ju5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yy5Pm6Chzs3nZ800EbMSsW7jSH1HwjtkYzsQKIFnm8w=;
 b=J/cgvqVCXO0Z1y68nefKgisCJZpg32ntei+f+8t7dJO4A+Qfj45qE4SZRTJTiRcoun
 Nqt3xLUWsxoM/+H562lEsrBq+bw5f6LKBMQeMjBogDYLg061UeLL6LtImvtd5i9vHyMs
 W0KCBZNUwLqJ92k9hQGL/L9nf8ft2Z3ZdjPIyhFIDNeeI/JFCV0Odwz90H+aYGCuhmXW
 bEjQAA7xqDBuuZARzwhXrewiCHpeMmzmbh+Lng5Oho4HBNYlCU0M6+bccUSvhMrDz/l/
 kAC7Jcqsp5H1g4JM+L75q2d6WzPfVuECrqfp1SDqFFT/RD6wUh973dYpLUNJz+fzBeDn
 U4Vg==
X-Gm-Message-State: APjAAAUEP9a8KB9UCxoU/i1tVpS4dLNeDRNlW2u0I7OtqiC9p7mWSZK6
 RL5WBEBFDL+PZv/wtemGHizn0A==
X-Google-Smtp-Source: APXvYqzNbQ3MeYMpzTRW08neyXYjeyY3mAyF76V58Qsal/cqNuXZMYb5EXT6tBXSUfJrJImtvdHofw==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr2227038wmi.146.1579690542801; 
 Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z133sm1370588wmb.7.2020.01.22.02.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 02:55:42 -0800 (PST)
Date: Wed, 22 Jan 2020 10:55:40 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison
 to zero
Message-ID: <20200122105540.w5vrvs34zxmhkjae@holly.lan>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122013240.132861-1-chenzhou10@huawei.com>
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
Cc: linux-fbdev@vger.kernel.org, kgunda@codeaurora.org,
 b.zolnierkie@samsung.com, jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 09:32:40AM +0800, Chen Zhou wrote:
> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to of_property_count_elems_of_size(), which may return negative error code.
> 
> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> 
> changes in v2:
> - fix commit message description.
> 
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index d46052d..3d276b3 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int version)
>  	struct wled_config *cfg = &wled->cfg;
>  	struct device *dev = wled->dev;
>  	const __be32 *prop_addr;
> -	u32 size, val, c, string_len;
> -	int rc, i, j;
> +	u32 size, val, c;
> +	int rc, i, j, string_len;
>  
>  	const struct wled_u32_opts *u32_opts = NULL;
>  	const struct wled_u32_opts wled3_opts[] = {
> -- 
> 2.7.4
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
