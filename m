Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0ED172C6A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 00:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FF26ED8A;
	Thu, 27 Feb 2020 23:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CA96ED8D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 23:41:36 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y8so437030pll.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 15:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
 b=NgD9KMhGVNVhQUdRxhMPpfYcyj4KNSCvL5unnyCbaQTOPhFfKGRPgZ+HQFMfzKULX2
 aPNS2TYrdM+f3jXnVBZMXwXR3BpGH+Qs4QzCMeTaGA1XeJAChmSALB3gsedpMWHKl5I5
 7vSS6POjQckU5dQYHVECKTG9TVgtWw56n8PkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RPDn3VN9g8p/m7AP7o3uN1UNa8ewvoBqlcsK2XU14p4=;
 b=AY6pesELES+nSA6NbEjsCtok08MyQWtEiduN81Kniyu5P1K7+2WWDpeBTIgGBOLEeI
 vVZk8gUJ4yNcS+hSlhlhKvVwq5VSczOQSF52qvDj2jOn0LmGJx3juLwLCO+6uC+sYaoz
 /8vfAG3MyJqjdPu3WFAVQmD2boypAm1ngpQ8Gc/CzMAwil9QI1MThLBIR/BfxgntnS19
 j7jTegK1sTiVurC0H5hoBqFTnuu/AkU1fCX8jZlxGlv3bSY2+2eZIyb/4RGxUwWpFn1d
 qPrKiMJzNdlDyYPDFb33rNr5nmo+XQMQ0EfMrZOt5TODEwt6d37M2PZZ5wsdU8WFj40w
 oofQ==
X-Gm-Message-State: APjAAAWW8YRTYvD6GI/HTQE9U38P1KzK4m+WZutXWDtWgw55Uv/P6pD9
 4bvu2TnY41n8tyVx5vt2Y2yIFg==
X-Google-Smtp-Source: APXvYqwF7mXopVy4e3b74ONItwDUAaWOB6zck1YGUfvRN/uUanLfN7+dU7YIvhfbunorfy/XmpJlhw==
X-Received: by 2002:a17:902:aa49:: with SMTP id
 c9mr1254841plr.145.1582846896504; 
 Thu, 27 Feb 2020 15:41:36 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id u24sm7665466pgo.83.2020.02.27.15.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 15:41:35 -0800 (PST)
Date: Thu, 27 Feb 2020 15:41:34 -0800
From: Matthias Kaehlcke <mka@chromium.org>
To: Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [DPU PATCH v3 4/5] drm/msm/dp: add support for DP PLL driver
Message-ID: <20200227234134.GL24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0101016ec6de9b5b-cd61a0a2-9ae4-4ca1-a3a4-0ad2e8783e20-000000@us-west-2.amazonses.com>
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

On Mon, Dec 02, 2019 at 01:48:27PM +0000, Chandan Uddaraju wrote:
> Add the needed DP PLL specific files to support
> display port interface on msm targets.
> 
> The DP driver calls the DP PLL driver registration.
> The DP driver sets the link and pixel clock sources.
> 
> Changes in v2:
> -- Update copyright markings on all relevant files.
> -- Use DRM_DEBUG_DP for debug msgs.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
> new file mode 100644
> index 0000000..6ef2492
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/dp/pll/dp_pll_10nm.c
>
> ...
>
> +static u8 dp_mux_get_parent_10nm(struct clk_hw *hw)
> +{
> +	u32 auxclk_div = 0;
> +	struct dp_pll_10nm_pclksel *pclksel = to_pll_10nm_pclksel(hw);
> +	struct dp_pll_10nm *dp_res = pclksel->pll;
> +	u8 val = 0;
> +
> +	DRM_ERROR("clk_hw->init->name = %s\n", hw->init->name);

drive-by comment: DRM_ERROR doesn't seem the right level, DRM_DEBUG_DP
would probably be more adequate.

Also I found this line triggers a NULL pointer dereference on a SC7180
system, where clk_hw->init is NULL.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
