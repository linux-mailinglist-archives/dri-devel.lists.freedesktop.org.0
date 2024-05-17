Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C498C8EDC
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 02:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770C310E037;
	Sat, 18 May 2024 00:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="IlOm3EsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C6210E037
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 00:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=tpXjH4wlI2gDEjHISCa0fJRzaI47j+Q15Jmn84/q5X8=; b=IlOm3EsPRkxGH6We
 T38EbWVr44PtyzFKIMsFIiAedB9vaeWKKEwxUlQICYGUeuEu42b4qw+WJVdQVnVuBWo0rKDydqqe9
 eQVGiPLf031INCWKiz5kXyCZabNAxJSGtqIkE0H/lhEkfnGnhoXjlCKjhTVq6TaJjH+e2QeCbueFN
 ZqSCJ5HNZJ9WbCb+mWrEizT37PkhXIhFlHp7B1cAJ+Mlh1Vt77f+P6HsQzYI/sgZTwAGKn/jTlX3q
 DA4efTeUoudxNrsEpxkS265YBGdJSQd6aO8eifez4vTJu4Zy1dtq09H5obggWcTZXU87HadEYpGI9
 GURs83BmyfydDd01kQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1s875R-001ToB-1x;
 Fri, 17 May 2024 23:34:05 +0000
Date: Fri, 17 May 2024 23:34:05 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <ZkfpbdOu9m41S1b1@gallifrey>
References: <20240517232427.230709-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240517232427.230709-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 23:33:35 up 9 days, 10:47,  1 user,  load average: 0.00, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(oops the patch numbering in these 3 are wrong, they're all independent
patches)

Dave

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'bridge_init' is unused, I think following:
> commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> (which is where a git --follow finds it)
> Remove it.
> 
> Build tested.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..1e03f3525a92 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -36,11 +36,6 @@
>  
>  static const bool verify_fast_training;
>  
> -struct bridge_init {
> -	struct i2c_client *client;
> -	struct device_node *node;
> -};
> -
>  static int analogix_dp_init_dp(struct analogix_dp_device *dp)
>  {
>  	int ret;
> -- 
> 2.45.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
