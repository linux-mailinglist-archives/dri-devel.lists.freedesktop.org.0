Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887713991B3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0A46EE1A;
	Wed,  2 Jun 2021 17:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF206EE1A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 17:29:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622654996; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rWyDRLYvTj153Y6LMqrDm4b5DQDQp0JKt+VaaEm4PFg=;
 b=skX9RolMz/diaos+AAv5MKjV5pAQbjRXRAcsnGzY7uUZgb+xhGBtLt/cleFyRiyqLPOA/lg+
 Fl5nMSMnlx88bb5iao13QCz+nm60cQfssndlzfWeoReIZqPDzvo30qKU2JTx1xik4Rz2cE1x
 u3bU49avJIhABORVUaON4tM6HHY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60b7c00881efe91cdae734d7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 17:29:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A1F33C433D3; Wed,  2 Jun 2021 17:29:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 888C3C433F1;
 Wed,  2 Jun 2021 17:29:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Jun 2021 10:29:41 -0700
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [RESEND 11/26] drm/msm/disp/dpu1/dpu_plane: Fix a
 couple of naming issues
In-Reply-To: <20210602143300.2330146-12-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-12-lee.jones@linaro.org>
Message-ID: <686bffdf7fd5cb5dcec7155559a74258@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 07:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:373: warning: expecting
> prototype for _dpu_plane_set_panic_lut(). Prototype was for
> _dpu_plane_set_danger_lut() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:498: warning: expecting
> prototype for _dpu_plane_set_vbif_qos(). Prototype was for
> _dpu_plane_set_qos_remap() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 7a993547eb751..ed05a7ab58f53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -364,7 +364,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane 
> *plane,
>  }
> 
>  /**
> - * _dpu_plane_set_panic_lut - set danger/safe LUT of the given plane
> + * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
>   * @plane:		Pointer to drm plane
>   * @fb:			Pointer to framebuffer associated with the given plane
>   */
> @@ -491,7 +491,7 @@ static void _dpu_plane_set_ot_limit(struct 
> drm_plane *plane,
>  }
> 
>  /**
> - * _dpu_plane_set_vbif_qos - set vbif QoS for the given plane
> + * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
>   * @plane:		Pointer to drm plane
>   */
>  static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
