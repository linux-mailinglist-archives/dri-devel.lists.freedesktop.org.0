Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1FB2C1748
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBBE89612;
	Mon, 23 Nov 2020 21:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653DB6E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:10:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165847; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M0DxBOKAap3NrjXCKDI/Y28+aJ2ultye9c2JTUJ/7us=;
 b=ZPMGE5s2Fq8Ui3PNo9q80y7v9DX8tjKVajVN41GNFhL6cnGXyozo70DRGJmc0zzsAknOEyXf
 4FnA6t21PUOTjGK7I1JPip3mY/IM58MBzk/ZgsppF+t0f2MKF5vbeqktmIvSJHuuFy6gxny8
 GoUcg/3hmDk52Rs5ykpdt/9bZfk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fbc254e9e87e1635251040b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:10:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EEE33C43464; Mon, 23 Nov 2020 21:10:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D8A24C433C6;
 Mon, 23 Nov 2020 21:10:36 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:10:36 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 10/40] drm/msm/disp/dpu1/dpu_core_perf: Fix
 kernel-doc formatting issues
In-Reply-To: <20201123111919.233376-11-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-11-lee.jones@linaro.org>
Message-ID: <89313cae90a84d7d64f32977dec5006e@codeaurora.org>
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
 dri-devel@lists.freedesktop.org, Kalyan Thota <kalyan_t@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:31: warning: Enum value
> 'DPU_PERF_MODE_MAX' not described in enum 'dpu_perf_mode'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:34: warning: Cannot
> understand  * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'kms' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'crtc' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'state' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:249: warning: Cannot
> understand  * @dpu_core_perf_crtc_release_bw() - request zero
> bandwidth
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Kalyan Thota <kalyan_t@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 36927fc04a388..b6b3bbab03336 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -22,6 +22,7 @@
>   * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
>   * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
>   * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> + * @DPU_PERF_MODE_MAX: maximum value, used for error checking
>   */
>  enum dpu_perf_mode {
>  	DPU_PERF_MODE_NORMAL,
> @@ -31,9 +32,9 @@ enum dpu_perf_mode {
>  };
> 
>  /**
> - * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
> - * @kms -  pointer to the dpu_kms
> - * @crtc - pointer to a crtc
> + * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> + * @kms:  pointer to the dpu_kms
> + * @crtc: pointer to a crtc
>   * Return: returns aggregated BW for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
> @@ -63,9 +64,9 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms 
> *kms,
> 
>  /**
>   * _dpu_core_perf_calc_clk() - to calculate clock per crtc
> - * @kms -  pointer to the dpu_kms
> - * @crtc - pointer to a crtc
> - * @state - pointer to a crtc state
> + * @kms:  pointer to the dpu_kms
> + * @crtc: pointer to a crtc
> + * @state: pointer to a crtc state
>   * Return: returns max clk for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
> @@ -246,8 +247,8 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  }
> 
>  /**
> - * @dpu_core_perf_crtc_release_bw() - request zero bandwidth
> - * @crtc - pointer to a crtc
> + * dpu_core_perf_crtc_release_bw() - request zero bandwidth
> + * @crtc: pointer to a crtc
>   *
>   * Function checks a state variable for the crtc, if all pending 
> commit
>   * requests are done, meaning no more bandwidth is needed, release
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
