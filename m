Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A272C1743
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6286E6E0DA;
	Mon, 23 Nov 2020 21:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89FAA6E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:10:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165815; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Nm9BEOZ5tiTsuXja+bIt51N7aLpyrz2R8XTJmsYaLQM=;
 b=CD/3/ktASHTU75BhtiNtBl9KBjAm1W9UxK5eqopvEmp09f3A8qo4U2qOd6em2xSzGovoYj6p
 VXq8YkIdmMrqF7Wuv2BmYEOZf586p82hD3Nj7cqAfHYbMY4wGL+LakYbwi2CRLEzyZiddvrq
 phEvO5ahL4D5xds2VPJRH3CW8j0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5fbc252dba50d14f885dd03f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:10:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DADEFC43461; Mon, 23 Nov 2020 21:10:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D0879C433ED;
 Mon, 23 Nov 2020 21:10:03 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:10:03 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 18/40] drm/msm/disp/dpu1/dpu_encoder: Fix a
 few parameter/member formatting issues
In-Reply-To: <20201123111919.233376-19-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-19-lee.jones@linaro.org>
Message-ID: <df03422ed2b9bb2addd5af02348916bf@codeaurora.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'cur_slave' not described in 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'hw_pp' not described in 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'intfs_swapped' not described in
> 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'drm_enc' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'phys' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'extra_flush_bits' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1481: warning: Function
> parameter or member 'phys' not described in
> '_dpu_encoder_trigger_start'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1564: warning: Function
> parameter or member 'dpu_enc' not described in
> '_dpu_encoder_kickoff_phys'
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 289bfb6f1861c..288e95ee8e1d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -132,9 +132,10 @@ enum dpu_enc_rc_states {
>   * @phys_encs:		Container of physical encoders managed.
>   * @cur_master:		Pointer to the current master in this mode. 
> Optimization
>   *			Only valid after enable. Cleared as disable.
> - * @hw_pp		Handle to the pingpong blocks used for the display. No.
> + * @cur_slave:		As above but for the slave encoder.
> + * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> - * @intfs_swapped	Whether or not the phys_enc interfaces have been 
> swapped
> + * @intfs_swapped:	Whether or not the phys_enc interfaces have been 
> swapped
>   *			for partial update right-only cases, such as pingpong
>   *			split where virtual pingpong does not generate IRQs
>   * @crtc:		Pointer to the currently assigned crtc. Normally you
> @@ -1436,9 +1437,9 @@ static void dpu_encoder_off_work(struct 
> work_struct *work)
> 
>  /**
>   * _dpu_encoder_trigger_flush - trigger flush for a physical encoder
> - * drm_enc: Pointer to drm encoder structure
> - * phys: Pointer to physical encoder structure
> - * extra_flush_bits: Additional bit mask to include in flush trigger
> + * @drm_enc: Pointer to drm encoder structure
> + * @phys: Pointer to physical encoder structure
> + * @extra_flush_bits: Additional bit mask to include in flush trigger
>   */
>  static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
> @@ -1475,7 +1476,7 @@ static void _dpu_encoder_trigger_flush(struct
> drm_encoder *drm_enc,
> 
>  /**
>   * _dpu_encoder_trigger_start - trigger start for a physical encoder
> - * phys: Pointer to physical encoder structure
> + * @phys: Pointer to physical encoder structure
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> @@ -1558,7 +1559,7 @@ static void dpu_encoder_helper_hw_reset(struct
> dpu_encoder_phys *phys_enc)
>   *	encoder rather than the individual physical ones in order to handle
>   *	use cases that require visibility into multiple physical encoders 
> at
>   *	a time.
> - * dpu_enc: Pointer to virtual encoder structure
> + * @dpu_enc: Pointer to virtual encoder structure
>   */
>  static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt 
> *dpu_enc)
>  {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
