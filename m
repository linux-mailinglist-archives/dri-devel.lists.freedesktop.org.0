Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 423FA144D84
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDD16FAEE;
	Wed, 22 Jan 2020 08:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BE26EE89
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 00:39:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i23so2402478pfo.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 16:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SZpsgyfgTg+rpsMj6itxLgYi2Mi1dgKH1+oFAHOSpN0=;
 b=NB2RKMZ732XQsFQzHnptmiW/oQQJiXyVAjkEF036D2HE3q2YoBbmXEgYZzaGw+929X
 2G3IGNXCqyCJSaKhFRl6T1hSSMtaMMR92nET1Q+81VUvLfg5cocDznowLKLoCv1ccSYa
 /G/1JLcEfeEmMFFXVyWT1i/qUs/jjo1/nUE8EFldsZAltWDW7NZKjW5RgtWGDQ2WBS6F
 28Qu7gE6FEgGwPmZRbTuA3i1Kh9KzpFZVc8E2DqP/+rWFNozXZ1K3GxLu5izOQItNkBY
 PpGn4PSUL4xDq6Do9KPt/QAPC2G/7+aLE35bi9+lGyTwVZTS8lfdakpulElBh3L8GLM9
 d2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SZpsgyfgTg+rpsMj6itxLgYi2Mi1dgKH1+oFAHOSpN0=;
 b=ngVNxLzPEqfi06i/o9QkfHjtwPNEPj28XUH/VtQivZprtVn3QHm7krv45KH8tkemsP
 XQN2bwq1s3InII1X86IOyBkVwZCbkcxDsqiNWXz8GymP7X4Ln+Fov//tI0Xz/ULTSKst
 giq6/WDW26NFcE6Iu1RoxRCSpCUVvelXvA9gGFmIdfdkAQIX4Z7DRIhUJHcu7oipWcux
 TkkovUovXUdz9gjVe2AqVy4jj/9kWxYXZVFlR2j1AlX4AnDNYKfuY/TKQy2tXXn8/evz
 io8JjAD6Z5LItZ7pdtm8VdVrk6iwpzT8RVQzJcm4dP2LiNyN6LA1rZdS1+qMtGZPxAvc
 uPUw==
X-Gm-Message-State: APjAAAXOzWxcsbe/Bl2VhFc/a6MP2mUN3z16OuDosQwtBZqVbdHdHscu
 EmNOg1Ldu+kWl0ielLB7Qtlwng==
X-Google-Smtp-Source: APXvYqwkN7biw9CpP0gW6qNJiifMwMv8JHW7EU+oQ5nGJ68k+VE9SDpQSxt9ZMLwqEZrqnOdhWikiQ==
X-Received: by 2002:a65:48cb:: with SMTP id o11mr8418173pgs.313.1579653575886; 
 Tue, 21 Jan 2020 16:39:35 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id o19sm736501pjr.2.2020.01.21.16.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 16:39:35 -0800 (PST)
Date: Tue, 21 Jan 2020 16:39:32 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next] backlight: qcom-wled: fix unsigned comparison to
 zero
Message-ID: <20200122003932.GA3948@builder>
References: <20200120130143.35363-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120130143.35363-1-chenzhou10@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
Cc: daniel.thompson@linaro.org, kgunda@codeaurora.org, b.zolnierkie@samsung.com,
 jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 20 Jan 05:01 PST 2020, Chen Zhou wrote:

> Fixes coccicheck warning:
> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
> 	WARNING: Unsigned expression compared with zero: string_len > 0
> 
> The unsigned variable string_len is assigned a return value from the call
> to wled_configure, which may return negative error code.
> 

Afaict string_len is the return value of
of_property_count_elems_of_size(), rather than wled_configure(). (And
please append () to function names to make it even more obvious)

Except for that your patch looks good, so please update the commit
message and add my Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
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
