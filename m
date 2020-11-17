Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF12B7026
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAF96E069;
	Tue, 17 Nov 2020 20:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549156E067
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 20:34:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605645298; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=B5UuYlGm/Tc1iL48YeEinA+NtRG1i1qyUD8YV4GrWcw=;
 b=s9mx6bjLC1HasZuUZJ+wnLW8k3proxMOpni+YbiI8Wj1Af+Pr2O+PqHG44RmKtJI3kTDaYaZ
 pUKkGe1RwBaJiC9E9MQWI78ARO77Zma5jHbFSZ/6ZlSSAaihQY3NkhAAsND1P1d244h9PO0T
 i/iRUbh4AZvzC/8qJXn0nKnSL8k=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fb433f18bd2e3c222bee77e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 20:34:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49E2EC43460; Tue, 17 Nov 2020 20:34:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DCB1BC433C6;
 Tue, 17 Nov 2020 20:34:56 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 17 Nov 2020 12:34:56 -0800
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Remove chatty vbif debug print
In-Reply-To: <20201117172608.2091648-1-swboyd@chromium.org>
References: <20201117172608.2091648-1-swboyd@chromium.org>
Message-ID: <71aebca216babf4010c92d4d1ce9a9b4@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kalyan_t@codeaurora.org, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-17 09:26, Stephen Boyd wrote:
> I don't know what this debug print is for but it is super chatty,
> throwing 8 lines of debug prints in the logs every time we update a
> plane. It looks like it has no value. Let's nuke it so we can get
> better logs.
> 
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> index 5e8c3f3e6625..5eb2b2ee09f5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> @@ -245,9 +245,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms 
> *dpu_kms,
>  	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, 
> true);
> 
>  	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
> -		DPU_DEBUG("vbif:%d xin:%d lvl:%d/%d\n",
> -				params->vbif_idx, params->xin_id, i,
> -				qos_tbl->priority_lvl[i]);

Instead of getting rid of this print, we should optimize the caller of 
this. This is what
we are doing in downstream. So we need to update the property only if we 
are switching from a RT client
to non-RT client for the plane and vice-versa. So we should try to do 
the same thing here.

  	is_rt = sde_crtc_is_rt_client(crtc, crtc->state);
  	if (is_rt != psde->is_rt_pipe) {
  		psde->is_rt_pipe = is_rt;
  		pstate->dirty |= SDE_PLANE_DIRTY_QOS;
  	}


  	if (pstate->dirty & DPU_PLANE_DIRTY_QOS)
  		_dpu_plane_set_qos_remap(plane);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
