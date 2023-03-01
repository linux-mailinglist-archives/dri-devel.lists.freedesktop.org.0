Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED74A6A6A6B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 11:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB8A10E0B0;
	Wed,  1 Mar 2023 10:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D133810E0B0;
 Wed,  1 Mar 2023 10:06:08 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C56133F8BB;
 Wed,  1 Mar 2023 11:06:06 +0100 (CET)
Date: Wed, 1 Mar 2023 11:06:05 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v4 4/4] drm/msm/mdp4: Remove empty prepare_commit()
 function
Message-ID: <20230301100605.gnevoxc4xgxfbilu@SoMainline.org>
References: <20230221184256.1436-1-quic_jesszhan@quicinc.com>
 <20230221184256.1436-5-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221184256.1436-5-quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-21 10:42:56, Jessica Zhang wrote:
> Remove empty prepare_commit() function from MDP4 driver.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 9a1a0769575d..6e37072ed302 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -84,10 +84,6 @@ static void mdp4_disable_commit(struct msm_kms *kms)
>  	mdp4_disable(mdp4_kms);
>  }
>  
> -static void mdp4_prepare_commit(struct msm_kms *kms, struct drm_atomic_state *state)
> -{
> -}
> -
>  static void mdp4_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	/* TODO */
> @@ -154,7 +150,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>  		.disable_vblank  = mdp4_disable_vblank,
>  		.enable_commit   = mdp4_enable_commit,
>  		.disable_commit  = mdp4_disable_commit,
> -		.prepare_commit  = mdp4_prepare_commit,
>  		.flush_commit    = mdp4_flush_commit,
>  		.wait_flush      = mdp4_wait_flush,
>  		.complete_commit = mdp4_complete_commit,
> -- 
> 2.39.2
> 
