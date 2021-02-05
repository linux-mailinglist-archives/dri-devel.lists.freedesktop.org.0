Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3092310FF8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 19:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5726E09E;
	Fri,  5 Feb 2021 18:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494416F49E;
 Fri,  5 Feb 2021 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=08/9eUYrON8JjgNfSMvnJtGPuDDsOmQbDO2HePIMB/Q=; b=ebzoSt+d2x4Dn+mrVLeczYcm2O
 PyJ1PE4gCqwN0xjgVnEQsl3+4UXMZK7M+KeoKbdsFQH3qfNvFgyOw8WqMxbnzufp2c2p3XbabtPOl
 cwvBvy1rDIAoZ0roobw6O4AGPu37ol+D2tlfLxW8AzZCsztgkaq6uZZsUD2EwNNw7b1aZOpbK0oS5
 eLRNo6+hrS8Q9NTyyzg/Bzu0Ay3LusTcbpd2PFln1F8UQOIk616M5thi14c4pNu5jYPCHjBJJKnY6
 SjfK1KXbyHh9VVXKzfwmL0BOUZa+sGS92978yOE2o76pjWtiGHBdxnBUtSxAhBbOCJdU6GK81s5w2
 eumII7jw==;
Received: from [2601:1c0:6280:3f0::aec2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8595-000862-PJ; Fri, 05 Feb 2021 17:43:52 +0000
Subject: Re: [PATCH] drivers: gpu: drm: msn: disp: dpu1: Fixed couple of
 spellings in the file dpu_hw_top.h
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, jonathan@marek.ca,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210205084758.354509-1-unixbhaskar@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <638f6e0c-cf14-a113-b1cf-5d07299c7332@infradead.org>
Date: Fri, 5 Feb 2021 09:43:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210205084758.354509-1-unixbhaskar@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Feb 2021 18:33:55 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/5/21 12:47 AM, Bhaskar Chowdhury wrote:
> 
> 
> s/confguration/configuration/
> s/Regsiters/Registers/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index 8018fff5667a..3aa10c89ca1b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -30,7 +30,7 @@ struct traffic_shaper_cfg {
> 
>  /**
>   * struct split_pipe_cfg - pipe configuration for dual display panels
> - * @en        : Enable/disable dual pipe confguration
> + * @en        : Enable/disable dual pipe configuration
>   * @mode      : Panel interface mode
>   * @intf      : Interface id for main control path
>   * @split_flush_en: Allows both the paths to be flushed when master path is
> @@ -76,7 +76,7 @@ struct dpu_vsync_source_cfg {
>   * @setup_traffic_shaper : programs traffic shaper control
>   */
>  struct dpu_hw_mdp_ops {
> -	/** setup_split_pipe() : Regsiters are not double buffered, thisk
> +	/** setup_split_pipe() : Registers are not double buffered, thisk

	                                                            this

>  	 * function should be called before timing control enable
>  	 * @mdp  : mdp top context driver
>  	 * @cfg  : upper and lower part of pipe configuration
> --
> 2.30.0
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
