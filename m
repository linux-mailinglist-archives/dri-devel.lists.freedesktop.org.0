Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588F0246E49
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 19:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781BC8951B;
	Mon, 17 Aug 2020 17:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87CE8951B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 17:27:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597685235; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=JmxeOCVIHQVo+Zeifx/78oNUHBmLeZEDsBLUSMTLYlo=;
 b=RDI0OdwpmQxUDDoMAhBFQnYrrsv7kLRr7J34GQvcCV+i2FXNMv7wSNNgwcghXbkObKMidCRP
 1VmxVChZBaRZPIZQuBHOi2/z0xfrpZa5mBoqhHTU5Eb+uVYecIL+1NpyqqqiaimYtVHSgDgI
 K8Kal6z2387IBpIHjrZkxNbMyiQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f3abdd385672017518a200f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 17:26:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 91B01C433A0; Mon, 17 Aug 2020 17:26:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A1FCAC433CA;
 Mon, 17 Aug 2020 17:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1FCAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 11:26:36 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: remove return value of
 function XX_print
Message-ID: <20200817172636.GC7438@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Bernard Zhao <bernard@vivo.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20200814081747.8624-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200814081747.8624-1-bernard@vivo.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 01:17:44AM -0700, Bernard Zhao wrote:
> XX_print like pfp_print/me_print/meq_print/roq_print are just
> used in file a5xx_debugfs.c. And these function always return
> 0, this return value is meaningless.
> This change is to make the code a bit more readable.

This is reasonable.  I'm always for negative lines.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_debugfs.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> index 68eddac7771c..fc2c905b6c9e 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_debugfs.c
> @@ -11,7 +11,7 @@
>  
>  #include "a5xx_gpu.h"
>  
> -static int pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
> +static void pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
>  {
>  	int i;
>  
> @@ -22,11 +22,9 @@ static int pfp_print(struct msm_gpu *gpu, struct drm_printer *p)
>  		drm_printf(p, "  %02x: %08x\n", i,
>  			gpu_read(gpu, REG_A5XX_CP_PFP_STAT_DATA));
>  	}
> -
> -	return 0;
>  }
>  
> -static int me_print(struct msm_gpu *gpu, struct drm_printer *p)
> +static void me_print(struct msm_gpu *gpu, struct drm_printer *p)
>  {
>  	int i;
>  
> @@ -37,11 +35,9 @@ static int me_print(struct msm_gpu *gpu, struct drm_printer *p)
>  		drm_printf(p, "  %02x: %08x\n", i,
>  			gpu_read(gpu, REG_A5XX_CP_ME_STAT_DATA));
>  	}
> -
> -	return 0;
>  }
>  
> -static int meq_print(struct msm_gpu *gpu, struct drm_printer *p)
> +static void meq_print(struct msm_gpu *gpu, struct drm_printer *p)
>  {
>  	int i;
>  
> @@ -52,11 +48,9 @@ static int meq_print(struct msm_gpu *gpu, struct drm_printer *p)
>  		drm_printf(p, "  %02x: %08x\n", i,
>  			gpu_read(gpu, REG_A5XX_CP_MEQ_DBG_DATA));
>  	}
> -
> -	return 0;
>  }
>  
> -static int roq_print(struct msm_gpu *gpu, struct drm_printer *p)
> +static void roq_print(struct msm_gpu *gpu, struct drm_printer *p)
>  {
>  	int i;
>  
> @@ -71,8 +65,6 @@ static int roq_print(struct msm_gpu *gpu, struct drm_printer *p)
>  		drm_printf(p, "  %02x: %08x %08x %08x %08x\n", i,
>  			val[0], val[1], val[2], val[3]);
>  	}
> -
> -	return 0;
>  }
>  
>  static int show(struct seq_file *m, void *arg)
> @@ -81,10 +73,11 @@ static int show(struct seq_file *m, void *arg)
>  	struct drm_device *dev = node->minor->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct drm_printer p = drm_seq_file_printer(m);
> -	int (*show)(struct msm_gpu *gpu, struct drm_printer *p) =
> +	void (*show)(struct msm_gpu *gpu, struct drm_printer *p) =
>  		node->info_ent->data;
>  
> -	return show(priv->gpu, &p);
> +	show(priv->gpu, &p);
> +	return 0;
>  }
>  
>  #define ENT(n) { .name = #n, .show = show, .data = n ##_print }
> -- 
> 2.26.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
