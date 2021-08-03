Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035D3DE3F1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 03:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37B389FA5;
	Tue,  3 Aug 2021 01:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB1789FC0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 01:22:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627953757; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=69oMaUQoA4ReczOKXAVfPDBIj5MKdJ/GxjJmCjK/vaw=;
 b=MAF4iY2eEm5OJ9ICKEdt8pXLaomn/9VDxcVu69acGZt5judvlHca7dG6qpDU0hki+i46jPne
 fpoYmHKrbXFMzB4Zth7iQUVVnX+YT3fBaRKsaPE2DEBN0AJnreQBeLPXTDVMFIQec6wME/ss
 UB1SIYH5MIcPZet2OoGSjFs4/AU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61089a3c1dd16c87882ba162 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 01:22:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AA103C4323A; Tue,  3 Aug 2021 01:22:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D6302C433D3;
 Tue,  3 Aug 2021 01:22:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 18:22:02 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 11/11] drm/msm/dsi: Pass DSC params to
 drm_panel
In-Reply-To: <20210715065203.709914-12-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-12-vkoul@kernel.org>
Message-ID: <d2fd4c9b0fd9a1e67ac5372803ed3853@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-14 23:52, Vinod Koul wrote:
> When DSC is enabled, we need to pass the DSC parameters to panel driver
> as well, so add a dsc parameter in panel and set it when DSC is enabled
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

based on the comments on prev patches in the series, this will need to 
be reworked
too as there wont be any priv->dsc anymore.

Also, can you also post the panel changes? Would like to see how you 
will use the
dsc param there.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++++++++-
>  include/drm/drm_panel.h            |  7 +++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 4e8ab1b1df8b..ee21cda243a7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2193,6 +2193,7 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	struct platform_device *pdev = msm_host->pdev;
>  	struct msm_drm_private *priv;
> +	struct drm_panel *panel;
>  	int ret;
> 
>  	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> @@ -2212,8 +2213,21 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  	}
> 
>  	msm_host->dev = dev;
> +	panel = msm_dsi_host_get_panel(&msm_host->base);
>  	priv = dev->dev_private;
> -	priv->dsc = msm_host->dsc;
> +
> +	if (panel && panel->dsc) {
> +		struct msm_display_dsc_config *dsc = priv->dsc;
> +
> +		if (!dsc) {
> +			dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = panel->dsc;
> +			priv->dsc = dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
> 
>  	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>  	if (ret) {
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 33605c3f0eba..27a7808a29f2 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -171,6 +171,13 @@ struct drm_panel {
>  	 * Panel entry in registry.
>  	 */
>  	struct list_head list;
> +
> +	/**
> +	 * @dsc:
> +	 *
> +	 * Panel DSC pps payload to be sent
> +	 */
> +	struct drm_dsc_config *dsc;
>  };
> 
>  void drm_panel_init(struct drm_panel *panel, struct device *dev,
