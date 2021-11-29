Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B94613B3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 12:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8716EDF0;
	Mon, 29 Nov 2021 11:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7B36ECBC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 11:13:27 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB2542A5;
 Mon, 29 Nov 2021 12:13:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638184406;
 bh=Vqb1oHTQtyBRFwbOpBRC7xMjgT/agFiiWNLHyTSNiW4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DitiWpoqutdhGqNOLXyNpxyNHGKwhsscj/LbEe5rGbIIy86rFXA7fwgeCjRGBYYtI
 +sHjBnxSz5SS9Neff+Eza0Y9Gnon8bWQ496hEr/FaRXp+nDt/eZcMXmqaCOdSQxq6j
 PzPX0KJOnJxegeRnfC1e+4I+/+vreBvQSmj1xloM=
Subject: Re: [PATCH] drm/tidss: Fix warning: unused variable 'tidss_pm_ops'
To: Cai Huoqing <caihuoqing@baidu.com>
References: <20211129063347.404-1-caihuoqing@baidu.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <bc1a7d47-2afc-9385-d465-4d7fc1c59b21@ideasonboard.com>
Date: Mon, 29 Nov 2021 13:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129063347.404-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, Jyri Sarha <jyri.sarha@iki.fi>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2021 08:33, Cai Huoqing wrote:
> Mark 'tidss_pm_ops' as __maybe_unused to avoid
> the warning: unused variable 'tidss_pm_ops'
> 
> Fixes: 6e120594631f ("drm/tidss: Make use of the helper macro SET_RUNTIME_PM_OPS()")
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>   drivers/gpu/drm/tidss/tidss_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 4366b5c798e0..7c784e90e40e 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -88,7 +88,7 @@ static int __maybe_unused tidss_resume(struct device *dev)
>   	return drm_mode_config_helper_resume(&tidss->ddev);
>   }
>   
> -static const struct dev_pm_ops tidss_pm_ops = {
> +static __maybe_unused const struct dev_pm_ops tidss_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
>   	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
>   };

Thanks, I'll push to drm-misc-next.

  Tomi
