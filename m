Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F842C1767
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC776E0DC;
	Mon, 23 Nov 2020 21:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91D389612
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:13:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606166015; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MpPyix18w9A/YIkD3A/ihCcjBzXbm8kBCQdGFP27g6U=;
 b=ooR8nBaFD56aMaTnj8UKL4VGg8NNgwptISqlxmuSifewVKumEgFL4hvGKNSlIUo1p8IFvHeh
 pyhIJSIwxt3g/azjeEzb1Mzwchb4Z0KkwePHvFgBsvAfUg5zgCA81u0Vmv8SFF6mAeIwm3UC
 XvUSmJYAv69s81zBlkhcRovghEo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fbc25ffa5c560669cb0a3be (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:13:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AAEA1C43468; Mon, 23 Nov 2020 21:13:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7901AC43462;
 Mon, 23 Nov 2020 21:13:33 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:13:33 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 31/40] drm/msm/disp/dpu1/dpu_rm: Fix
 formatting issues and supply 'global_state' description
In-Reply-To: <20201123111919.233376-32-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-32-lee.jones@linaro.org>
Message-ID: <04c43a8bf76d7d44fb21add18697f470@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:19, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:247: warning: Excess function
> parameter 'Return' description in '_dpu_rm_check_lm_peer'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:283: warning: Function
> parameter or member 'global_state' not described in
> '_dpu_rm_check_lm_and_get_connected_blks'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c:283: warning: Excess function
> parameter 'Return' description in
> '_dpu_rm_check_lm_and_get_connected_blks'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Drew Davenport <ddavenport@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0ae8a36ffcff3..fd2d104f0a91d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -239,7 +239,7 @@ static bool _dpu_rm_needs_split_display(const
> struct msm_display_topology *top)
>   * @rm: dpu resource manager handle
>   * @primary_idx: index of primary mixer in rm->mixer_blks[]
>   * @peer_idx: index of other mixer in rm->mixer_blks[]
> - * @Return: true if rm->mixer_blks[peer_idx] is a peer of
> + * Return: true if rm->mixer_blks[peer_idx] is a peer of
>   *          rm->mixer_blks[primary_idx]
>   */
>  static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
> @@ -264,6 +264,7 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm
> *rm, int primary_idx,
>   *	proposed use case requirements, incl. hardwired dependent blocks 
> like
>   *	pingpong
>   * @rm: dpu resource manager handle
> + * @global_state: resources shared across multiple kms objects
>   * @enc_id: encoder id requesting for allocation
>   * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], 
> function checks
>   *      if lm, and all other hardwired blocks connected to the lm (pp) 
> is
> @@ -274,7 +275,7 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm
> *rm, int primary_idx,
>   *      mixer in rm->dspp_blks[].
>   * @reqs: input parameter, rm requirements for HW blocks needed in the
>   *      datapath.
> - * @Return: true if lm matches all requirements, false otherwise
> + * Return: true if lm matches all requirements, false otherwise
>   */
>  static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
>  		struct dpu_global_state *global_state,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
