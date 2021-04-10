Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51FB35ACF6
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 13:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B3736E183;
	Sat, 10 Apr 2021 11:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AAB6E183
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 11:33:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 g18-20020a7bc4d20000b0290116042cfdd8so6076092wmk.4
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fvdzUEOBZnrRgws5JVo7yfOmTexEa+PsOPP655oivsE=;
 b=UBP1bbhv47oJHLt6G6DWDz4KPZiLYyi/H7xlN2PMJM4kHddpto3q+cnuXfnWKHjSbo
 e3Obl7L368/7VqTBSrXJXF9WjGLRhDUVqps8KOoZXsfThB0T+JuqhZmhtqOkUxiJUTwL
 3zkLNhMDaoMAfcx8uI7bMwfHQAJc1VXfF0OzQ8F7vnm9X68SNwrSLn0pGxv6CQ0eh65z
 KLQilvSfiVQzSQwWHy4eonhQ9YClUaIAQCToc8Vw6GOshEYwmYdclgW3s04UOPk7Dtzz
 jhK8cOHvuLB71U2/ozCZouAoAte34UFuOwdGDo0JkoJ/G+7ZFxyNqWcSYeMW+PPyS3Oy
 ARIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fvdzUEOBZnrRgws5JVo7yfOmTexEa+PsOPP655oivsE=;
 b=ap2vHMUc0eYz2JB/CGpMtVLDrCOtpQ3/4y1BeO+OdHW9MAGM48Q1iE6QMHFflHC/8l
 ifefXcC/9RqD1wRB/0PYepxzdUfBZrDEuKT0dZEvgdEEb+eQtm9ZJmYFqfBhegPeCJQL
 mckJRFDjB6SuE2ciVJl8zTfevPDfI+tvBGaPKrqSTGDwtlmGpWEsGHw9dF0z8MPeXTij
 rPjK6/6JpAktbBbI4MjSHMeIHmMBUmiOQhusHab1yd8lxuPZJ1MuOcqNUTJlbJHoJylW
 oQv1Mj94dqWyXQU1jaKmI5loTz7GONjI+DJMokXn2HZhLRcOruYnA4ZX8s0ZKFFvwo+q
 qsTQ==
X-Gm-Message-State: AOAM533xVUxaN/YRcrgQ4POxYtmlxCD8aWZq+m888pNUVhPxzESiyWMI
 SqnfpzA4DMFTxmuLqkglktE=
X-Google-Smtp-Source: ABdhPJy5M4zou8GJe5SFLivC59/pu7Ie4GkBi5tmaEVlo+EhWnaCDMuIqzYiqMey8Gg6U9IGVgn5pA==
X-Received: by 2002:a1c:804d:: with SMTP id b74mr2980631wmd.15.1618054397124; 
 Sat, 10 Apr 2021 04:33:17 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id w22sm7576006wmc.13.2021.04.10.04.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:33:16 -0700 (PDT)
Date: Sat, 10 Apr 2021 08:33:09 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V4 1/2] drm/vkms: Refactor vkms_composer_worker() to prep
 for virtual_hw mode
Message-ID: <20210410113309.4tgdkqgooixgou3q@smtp.gmail.com>
References: <cover.1617602076.git.sylphrenadin@gmail.com>
 <ab3492843ea631c51a3ff8dcf8e3f7af96aaed60.1617602076.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab3492843ea631c51a3ff8dcf8e3f7af96aaed60.1617602076.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05, Sumera Priyadarsini wrote:
> Add two new functions vkms_composer_common() and vkms_crtc_composer().
> The actual plane composition work has been moved to the helper function,
> vkms_composer_common() which is called by both vkms_composer_worker()
> and vkms_crtc_composer(). vkms_crtc_composer() can be used when we
> implement virtual_hw mode.

Hi Sumera,

At this point, vkms_crtc_composer is never called. You should move this
function to the patch where you actually add virtual_hw mode, giving
meaning to create a different function (suitable for composition on
vblank-less mode). keep here only the prep work to add virtual hardware.

Thanks,

Melissa

> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in V4:
> - Fix warning
> Changes in V3:
> - Refactor patchset (Melissa)
> Change in V2:
> - Add vkms_composer_common() (Daniel)
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 88 +++++++++++++++++-----------
>  drivers/gpu/drm/vkms/vkms_drv.h      |  3 +
>  2 files changed, 58 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 66c6842d70db..0d2bad3ff849 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -169,6 +169,44 @@ static int compose_planes(void **vaddr_out,
>  	return 0;
>  }
>  
> +int vkms_composer_common(struct vkms_crtc_state *crtc_state,
> +			 struct vkms_output *out, bool wb_pending, uint32_t *crc32)
> +{
> +	struct vkms_composer *primary_composer = NULL;
> +	struct vkms_composer *cursor_composer = NULL;
> +	void *vaddr_out = NULL;
> +	int ret;
> +
> +	if (crtc_state->num_active_planes >= 1)
> +		primary_composer = crtc_state->active_planes[0]->composer;
> +	if (crtc_state->num_active_planes == 2)
> +		cursor_composer = crtc_state->active_planes[1]->composer;
> +	if (!primary_composer)
> +		return -EINVAL;
> +	if (wb_pending)
> +		vaddr_out = crtc_state->active_writeback;
> +
> +	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
> +	if (ret) {
> +		if (ret == -EINVAL && !wb_pending)
> +			kfree(vaddr_out);
> +		return -EINVAL;
> +	}
> +
> +	*crc32 = compute_crc(vaddr_out, primary_composer);
> +
> +	if (wb_pending) {
> +		drm_writeback_signal_completion(&out->wb_connector, 0);
> +		spin_lock_irq(&out->composer_lock);
> +		crtc_state->wb_pending = false;
> +		spin_unlock_irq(&out->composer_lock);
> +	} else {
> +		kfree(vaddr_out);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * vkms_composer_worker - ordered work_struct to compute CRC
>   *
> @@ -185,12 +223,9 @@ void vkms_composer_worker(struct work_struct *work)
>  						composer_work);
>  	struct drm_crtc *crtc = crtc_state->base.crtc;
>  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> -	struct vkms_composer *primary_composer = NULL;
> -	struct vkms_composer *cursor_composer = NULL;
>  	bool crc_pending, wb_pending;
> -	void *vaddr_out = NULL;
> -	u32 crc32 = 0;
>  	u64 frame_start, frame_end;
> +	u32 crc32 = 0;
>  	int ret;
>  
>  	spin_lock_irq(&out->composer_lock);
> @@ -210,36 +245,9 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!crc_pending)
>  		return;
>  
> -	if (crtc_state->num_active_planes >= 1)
> -		primary_composer = crtc_state->active_planes[0]->composer;
> -
> -	if (crtc_state->num_active_planes == 2)
> -		cursor_composer = crtc_state->active_planes[1]->composer;
> -
> -	if (!primary_composer)
> -		return;
> -
> -	if (wb_pending)
> -		vaddr_out = crtc_state->active_writeback;
> -
> -	ret = compose_planes(&vaddr_out, primary_composer, cursor_composer);
> -	if (ret) {
> -		if (ret == -EINVAL && !wb_pending)
> -			kfree(vaddr_out);
> +	ret = vkms_composer_common(crtc_state, out, wb_pending, &crc32);
> +	if (ret == -EINVAL)
>  		return;
> -	}
> -
> -	crc32 = compute_crc(vaddr_out, primary_composer);
> -
> -	if (wb_pending) {
> -		drm_writeback_signal_completion(&out->wb_connector, 0);
> -		spin_lock_irq(&out->composer_lock);
> -		crtc_state->wb_pending = false;
> -		spin_unlock_irq(&out->composer_lock);
> -	} else {
> -		kfree(vaddr_out);
> -	}
> -
>  	/*
>  	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
>  	 */
> @@ -247,6 +255,20 @@ void vkms_composer_worker(struct work_struct *work)
>  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
>  }
>  
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state)
> +{
> +	struct drm_crtc *crtc = crtc_state->base.crtc;
> +	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> +	u32 crc32 = 0;
> +	int ret;
> +
> +	ret = vkms_composer_common(crtc_state, out, crtc_state->wb_pending, &crc32);
> +	if (ret == -EINVAL)
> +		return;
> +
> +	drm_crtc_add_crc_entry(crtc, true, 0, &crc32);
> +}
> +
>  static const char * const pipe_crc_sources[] = {"auto"};
>  
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 35540c7c4416..538315140585 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -125,8 +125,11 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
>  			   size_t *values_cnt);
>  
>  /* Composer Support */
> +int vkms_composer_common(struct vkms_crtc_state *crtc_state, struct vkms_output *out,
> +			 bool wb_pending, uint32_t *crcs);
>  void vkms_composer_worker(struct work_struct *work);
>  void vkms_set_composer(struct vkms_output *out, bool enabled);
> +void vkms_crtc_composer(struct vkms_crtc_state *crtc_state);
>  
>  /* Writeback */
>  int vkms_enable_writeback_connector(struct vkms_device *vkmsdev);
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
