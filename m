Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19493172A8E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 22:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF3F6E0B7;
	Thu, 27 Feb 2020 21:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1F89BB3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 21:54:35 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j9so531152pfa.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+0IYi++vwthLQ5uajPvjEjpHHtTOH92Ozi2ToC54VL0=;
 b=KAkHE4e8tQ+bi2Skwt3+5etnTno6Zh5gXipu+VdnG6pVHAWRgIr1UQpOhGFWHPDieP
 7WtmzuwYqbtIeDybrv00r26KF6Mcbe36zp7sT6go8JEuId7dZudVR66c/tDhgq7e7gQC
 bODwYmOTz1WWVOk7VjZx8O6ju4TZGOz45T15k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+0IYi++vwthLQ5uajPvjEjpHHtTOH92Ozi2ToC54VL0=;
 b=ed6a3x3Q46UOGznm3XDuBlBsnY/GY/NNheH0+KheI5scY68OoDT7IkZoyF/AphFJWQ
 glp/FHLIF4N2G8uOqTOZY2K1DxNnD3fcCPcy38PuCgRVKrJrZs8AGK9DeN4SRhlDzYBN
 9swq/aGlHYi25OqWuGoWYLW4P6CH6hjn488Up/XYb/Az/lM7XidhGl+62n9rL2X604jZ
 pbili0FR4EdxJIIUKTrqnYjcsTHpy5Bsu83GTQvHl8//DbgujbzqegpFH+1M3Jstk/+c
 F4YXG5smSHTuhmtTZ+6PvBW7cY4ex7uGL9p0FC0TYFhTt/PGDm2GS9qulXXtsnEjADWv
 t1wg==
X-Gm-Message-State: APjAAAViRw4mQwqFSLkkyGC4NMGGUe1aMSpkLgK7o4MRp2Ct1fz3mSbK
 Uz0SjixX6yNkLumkWI+LWs9QDw==
X-Google-Smtp-Source: APXvYqyLnLDusW3NGVjQNpS9d9K/5/oRkpDv3IJt5GsUJhMBBZuHwD5k1HpU1eYbxibVTOyx0XoRaA==
X-Received: by 2002:a63:2cd6:: with SMTP id s205mr1332761pgs.258.1582840474892; 
 Thu, 27 Feb 2020 13:54:34 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id d69sm9088008pfd.72.2020.02.27.13.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 13:54:34 -0800 (PST)
Date: Thu, 27 Feb 2020 13:54:33 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
Message-ID: <20200227215433.GK24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, hoegsberg@google.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 02, 2019 at 01:48:57PM +0000, Chandan Uddaraju wrote:
> Add the needed displayPort files to enable DP driver
> on msm target.
> 
> "dp_display" module is the main module that calls into
> other sub-modules. "dp_drm" file represents the interface
> between DRM framework and DP driver.
> 
> changes in v2:
> -- Update copyright markings on all relevant files.
> -- Change pr_err() to DRM_ERROR()
> -- Use APIs directly instead of function pointers.
> -- Use drm_display_mode structure to store link parameters in the driver.
> -- Use macros for register definitions instead of hardcoded values.
> -- Replace writel_relaxed/readl_relaxed with writel/readl
>    and remove memory barriers.
> -- Remove unnecessary NULL checks.
> -- Use drm helper functions for dpcd read/write.
> -- Use DRM_DEBUG_DP for debug msgs.
> 
> changes in V3:
> -- Removed changes in dpu_io_util.[ch]
> -- Added locking around "is_connected" flag and removed atomic_set()
> -- Removed the argument validation checks in all the static functions
>    except initialization functions and few API calls across msm/dp files
> -- Removed hardcoded values for register reads/writes
> -- Removed vreg related generic structures.
> -- Added return values where ever necessary.
> -- Updated dp_ctrl_on function.
> -- Calling the ctrl specific catalog functions directly instead of
>    function pointers.
> -- Added seperate change that adds standard value in drm_dp_helper file.
> -- Added separate change in this list that is used to initialize
>    displayport in DPU driver.
> -- Added change to use drm_dp_get_adjust_request_voltage() function.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>
> ...
>
> +int dp_power_init(struct dp_power *dp_power, bool flip)
> +{
> +	int rc = 0;
> +	struct dp_power_private *power;
> +
> +	if (!dp_power) {
> +		DRM_ERROR("invalid power data\n");
> +		rc = -EINVAL;
> +		goto exit;
> +	}

drive-by comment:

this would lead to calling 'pm_runtime_put_sync(&power->pdev->dev)'
below with 'power' being NULL, which doesn't seem a good idea.

It is probably sane to expect that 'dp_power' is not NULL, if that's
the case the check can be removed. Otherwise the function should just
return -EINVAL instead of jumping to 'exit'.

> +
> +	power = container_of(dp_power, struct dp_power_private, dp_power);
> +
> +	pm_runtime_get_sync(&power->pdev->dev);
> +	rc = dp_power_regulator_enable(power);
> +	if (rc) {
> +		DRM_ERROR("failed to enable regulators, %d\n", rc);
> +		goto exit;
> +	}
> +
> +	rc = dp_power_pinctrl_set(power, true);
> +	if (rc) {
> +		DRM_ERROR("failed to set pinctrl state, %d\n", rc);
> +		goto err_pinctrl;
> +	}
> +
> +	rc = dp_power_config_gpios(power, flip);
> +	if (rc) {
> +		DRM_ERROR("failed to enable gpios, %d\n", rc);
> +		goto err_gpio;
> +	}
> +
> +	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> +	if (rc) {
> +		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> +		goto err_clk;
> +	}
> +
> +	return 0;
> +
> +err_clk:
> +	dp_power_disable_gpios(power);
> +err_gpio:
> +	dp_power_pinctrl_set(power, false);
> +err_pinctrl:
> +	dp_power_regulator_disable(power);
> +exit:
> +	pm_runtime_put_sync(&power->pdev->dev);
> +	return rc;
> +}
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
