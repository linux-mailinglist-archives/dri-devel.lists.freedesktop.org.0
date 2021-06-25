Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BFC3B472F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF6A6EE0A;
	Fri, 25 Jun 2021 16:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143096EE11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:07:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624637277; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/KpohStlUJvTiEQ4iqkocQH8jbpoCZ87P2EttCttYgQ=;
 b=VJgxhJi/FmTVMAFc8X3wdeXbTGvZP3mk2yisk2Iu4e9MsaX+GCMF+TpHmbz0/rQAbweQHFx3
 XNcIqA2u1jKyEumhK2rAMKbCgt8+L5w7UW6KtwgMeCcc4eCn0rOTELxREIHX2bSOWXnJwkDX
 8exgATe5EB6WNmAXtBQF1kDhoaE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60d5ff5b7e5ba0fdc03501df (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Jun 2021 16:07:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 899D9C43460; Fri, 25 Jun 2021 16:07:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 96F94C433F1;
 Fri, 25 Jun 2021 16:07:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 25 Jun 2021 09:07:54 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add missing drm_device backpointer
In-Reply-To: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
References: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
Message-ID: <b585ae0c9e2e241f7f0494ae09809392@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-24 20:47, Bjorn Andersson wrote:
> '6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")'
> introduced a mandator drm_device backpointer in struct drm_dp_aux, but
mandatory
> missed the msm DP driver. Fix this.
> 
> Fixes: 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in 
> drm_dp_aux")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
apart from that nit,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     | 2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b590b0..88659ed200b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -441,7 +441,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>  	dp_catalog_aux_enable(aux->catalog, false);
>  }
> 
> -int dp_aux_register(struct drm_dp_aux *dp_aux)
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device 
> *drm_dev)
>  {
>  	struct dp_aux_private *aux;
>  	int ret;
> @@ -455,6 +455,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
> 
>  	aux->dp_aux.name = "dpu_dp_aux";
>  	aux->dp_aux.dev = aux->dev;
> +	aux->dp_aux.drm_dev = drm_dev;
>  	aux->dp_aux.transfer = dp_aux_transfer;
>  	ret = drm_dp_aux_register(&aux->dp_aux);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h 
> b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 0728cc09c9ec..7ef0d83b483a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -9,7 +9,7 @@
>  #include "dp_catalog.h"
>  #include <drm/drm_dp_helper.h>
> 
> -int dp_aux_register(struct drm_dp_aux *dp_aux);
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device 
> *drm_dev);
>  void dp_aux_unregister(struct drm_dp_aux *dp_aux);
>  void dp_aux_isr(struct drm_dp_aux *dp_aux);
>  void dp_aux_init(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index c26562bd85fe..2f0a5c13f251 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -259,7 +259,7 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  		return rc;
>  	}
> 
> -	rc = dp_aux_register(dp->aux);
> +	rc = dp_aux_register(dp->aux, drm);
>  	if (rc) {
>  		DRM_ERROR("DRM DP AUX register failed\n");
>  		return rc;
