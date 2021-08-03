Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E583D3DE3D2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 03:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757B76E218;
	Tue,  3 Aug 2021 01:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAE589F19
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 01:05:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627952755; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7bOpFp7obdoq6Euoam+mDRvGfl+5Uird7in8uKDL+WM=;
 b=M4NcI7IUm4dJCsQnuUdqVl3DYJv3t9nCQOKadr9Iy0bHHkr2ZnU5Dw11tRa6vEMMHPVIIar8
 YLmyiuXMv1qWU5BXyCeq9r0eh2cX5X4volsktmnXHMBf3pyUlYVe8WZYI1fTwO6Ef1yQWx7a
 eHXahBsbqqtvvLmq5qCsIvnv+jc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61089670e81205dd0aa32971 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 01:05:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7DF8EC43460; Tue,  3 Aug 2021 01:05:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8849EC433F1;
 Tue,  3 Aug 2021 01:05:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 18:05:50 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 09/11] drm/msm/disp/dpu1: Add support for DSC
 in topology
In-Reply-To: <20210715065203.709914-10-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-10-vkoul@kernel.org>
Message-ID: <3fd739ca72c5704a3ca15a20492c5eac@codeaurora.org>
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
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions upto 4k. For more resolutions like 8k this 
> won't
> work.
> 
> The topology information is provided by DTS so we try to deduce the
> topology required for DSC.
> Furthermore, we can use 1 DSC encoder in lesser resolutions, but that 
> is
> not power efficient according to Abhinav, it is better to use 2 mixers
> as that will split width/2 and is proven to be power efficient.

I think now that we have added the technical reason of why it is better 
to use
2-2-1 ( using 2 LMs is better than one as it will half layer width), we 
can drop my name from the commit text
as it holds less value than the actual reason itself :)
You can still keep my signed-off and co-developed by tag

> 
> Also, the panel has been tested only with 2,2,1 configuration, so for
> now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since RFC:
>  - Add more details in changelog
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 41140b781e66..8f0a8bd9c8ff 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -573,6 +573,8 @@ static struct msm_display_topology 
> dpu_encoder_get_topology(
>  			struct drm_display_mode *mode)
>  {
>  	struct msm_display_topology topology = {0};
> +	struct drm_encoder *drm_enc;
> +	struct msm_drm_private *priv;
>  	int i, intf_count = 0;
> 
>  	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
> @@ -607,8 +609,22 @@ static struct msm_display_topology
> dpu_encoder_get_topology(
>  	topology.num_enc = 0;
>  	topology.num_intf = intf_count;
> 
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
> +	if (priv && priv->dsc) {
if dsc is moved to the encoder, this will need to be changed too
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive upto (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>  	return topology;
>  }
> +
>  static int dpu_encoder_virt_atomic_check(
>  		struct drm_encoder *drm_enc,
>  		struct drm_crtc_state *crtc_state,
