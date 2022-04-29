Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1845146BB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF3110FC76;
	Fri, 29 Apr 2022 10:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7046510FC76
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:25:42 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18996488;
 Fri, 29 Apr 2022 12:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651227940;
 bh=1Xnk+9h8L/Uh9EPmBELuWhe3TE/MnwgMo8Cl0drwiSs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aN2FBRRqYbFGc2+KSsTRrmeegGxNSY6OtHnE6t6d5GSlEZYG84YDtzr22IlCAmmWt
 yjOttGB+euSvxEWzJywGe8SdPRxW7SNSYwgRcdGGBBGdQHs4OGxVFPIjoleUcCG7Fm
 gE9DKVsV+yE5XUzN3ecwHI8REqIrX4KHK+9ISxNI=
Message-ID: <3deffccf-1708-60bf-2b63-7a77305ec7e6@ideasonboard.com>
Date: Fri, 29 Apr 2022 13:25:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] omapdss: HDMI: simplify the return expression of
 hdmi_init_pll_data()
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220429090135.3852817-1-chi.minghao@zte.com.cn>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220429090135.3852817-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Minghao Chi <chi.minghao@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2022 12:01, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi_pll.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> index eea719243eaf..10c6b3e492d3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi_pll.c
> @@ -131,7 +131,6 @@ static int hdmi_init_pll_data(struct dss_device *dss,
>   {
>   	struct dss_pll *pll = &hpll->pll;
>   	struct clk *clk;
> -	int r;
>   
>   	clk = devm_clk_get(&pdev->dev, "sys_clk");
>   	if (IS_ERR(clk)) {
> @@ -151,11 +150,7 @@ static int hdmi_init_pll_data(struct dss_device *dss,
>   
>   	pll->ops = &hdmi_pll_ops;
>   
> -	r = dss_pll_register(dss, pll);
> -	if (r)
> -		return r;
> -
> -	return 0;
> +	return dss_pll_register(dss, pll);
>   }

This is a rather pointless change, and I personally like the current 
style better.

  Tomi
