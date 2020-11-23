Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E60412C1765
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073B66E0E1;
	Mon, 23 Nov 2020 21:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DD06E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:13:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165991; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eWZ6QZkKfoZgGA0Z1xGVlAKN3o4fc7HBpyuUpR+spMA=;
 b=WSBF0DajJHV/tFWxtBExMHFs+R7D3sfeixnEYY7F5Yk5j+7Ax2P/aVlUZd5MqV7F0yt4mHPC
 hKcx8ZpFO+USjTLJT+ZJ+5whppODNp2vEN61kjRFNMYg+RfYcstwdeGQnBR/Bi2rx7p5HY6y
 xCGVlzt7+R9HR4bPglRUjAYVHEo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fbc25e60c9500dc7b2bbefd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:13:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 09B02C433C6; Mon, 23 Nov 2020 21:13:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DF725C43460;
 Mon, 23 Nov 2020 21:13:08 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:13:08 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 35/40] drm/msm/disp/dpu1/dpu_plane: Fix some
 spelling and missing function param descriptions
In-Reply-To: <20201123111919.233376-36-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-36-lee.jones@linaro.org>
Message-ID: <d30180faae8158c7a489f2e1c206e2f7@codeaurora.org>
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

On 2020-11-23 03:19, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function
> parameter or member 'plane' not described in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function
> parameter or member 'fb' not described in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Excess
> function parameter 'Plane' description in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Function
> parameter or member 'plane' not described in '_dpu_plane_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Excess
> function parameter 'Plane' description in '_dpu_plane_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Function
> parameter or member 'src_width' not described in
> '_dpu_plane_calc_fill_level'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Excess
> function parameter 'src_wdith' description in
> '_dpu_plane_calc_fill_level'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1060: warning: Function
> parameter or member 'error' not described in 'dpu_plane_set_error'
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c0b1d77369e53..cf0084d7cc7c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -142,7 +142,8 @@ static struct dpu_kms *_dpu_plane_get_kms(struct
> drm_plane *plane)
> 
>  /**
>   * _dpu_plane_calc_bw - calculate bandwidth required for a plane
> - * @Plane: Pointer to drm plane.
> + * @plane: Pointer to drm plane.
> + * @fb:   Pointer to framebuffer associated with the given plane
>   * Result: Updates calculated bandwidth in the plane state.
>   * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
>   * Prefill BW Equation: line src bytes * line_time
> @@ -192,7 +193,7 @@ static void _dpu_plane_calc_bw(struct drm_plane 
> *plane,
> 
>  /**
>   * _dpu_plane_calc_clk - calculate clock required for a plane
> - * @Plane: Pointer to drm plane.
> + * @plane: Pointer to drm plane.
>   * Result: Updates calculated clock in the plane state.
>   * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
>   */
> @@ -224,7 +225,7 @@ static void _dpu_plane_calc_clk(struct drm_plane 
> *plane)
>   * _dpu_plane_calc_fill_level - calculate fill level of the given 
> source format
>   * @plane:		Pointer to drm plane
>   * @fmt:		Pointer to source buffer format
> - * @src_wdith:		width of source buffer
> + * @src_width:		width of source buffer
>   * Return: fill level corresponding to the source buffer/format or 0 
> if error
>   */
>  static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
> @@ -1055,6 +1056,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>  /**
>   * dpu_plane_set_error: enable/disable error condition
>   * @plane: pointer to drm_plane structure
> + * @error: error value to set
>   */
>  void dpu_plane_set_error(struct drm_plane *plane, bool error)
>  {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
