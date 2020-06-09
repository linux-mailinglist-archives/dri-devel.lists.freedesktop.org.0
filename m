Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA931F48AC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 23:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7406E33F;
	Tue,  9 Jun 2020 21:13:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A51D6E33F
 for <dri-devel@freedesktop.org>; Tue,  9 Jun 2020 21:13:06 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h5so22899352wrc.7
 for <dri-devel@freedesktop.org>; Tue, 09 Jun 2020 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBBmHR2NoyS+QubiimzU0L7IU6wBl9P6zD1sO/eVLGc=;
 b=Oi+ddU+KAostZNA7j8ckAf8r8iW8aejXRo9X76srcypk86YhXkzhGOxjFXXc0005P7
 +WoogoWvbqj89f+yWzWTpW/KjV9MJ775/x9PwEc9BSxBSwEKq0YVOjEirdhM4sYgg3es
 CqRFvkHFPnJNMDdpbDLNBsTkys4vOI++PJ2IPGWA1lwY+OV6AHUlEozM5e7sLLteR8c2
 9rsStwOoxj45zTonoNxhGgIRKrV3ydF6O+ohWUNjbW8SEkeKmUybcKQ60BRj7eDZpasz
 H4jet7oKEHYWNjxIj7hA75lTyL+U27Y9jn2IxD6TA7AQq3FLJCyxpK9z8VK+qUSIVrtZ
 FbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBBmHR2NoyS+QubiimzU0L7IU6wBl9P6zD1sO/eVLGc=;
 b=fFIbGQbrsy80bEt5tMvxOzG1rWihu8P5eis8BUOQwXwqAsn0ui7bw3jbBJuon9jy6m
 YkPTyVIdHT+y7u8sdd+XRvcehBhvP5QpNDkhcT+801JCqjYqPVxuY7Rcrj6iw280XlI6
 ahuP1eyaJqxWyEk8xvgLVLbocdElDFcwJutXL33JSWBT6gFHqw2vSZw04m9M/b0aNr6T
 /gZ8TUDqFcxDTr0P34Uryys7o4yTDQ9Ct0+/ab7vO36XFoJV8yLgV2SkfVukhAzrUynR
 EtBoEcfx1E6llEIKuTSOm93j8YLq3HaqeDv38o1sLPnCl5uB5pnL6QIKWRJrXjUG6xwa
 O8Vg==
X-Gm-Message-State: AOAM532drysPjACpVk6NwLT/muNGARPiUlKMGI4Q1iILdU7g3cfSm0f+
 QNvFVMELed9zKQ4R7XjL8XFlMgyb1mKM25Z0M+4=
X-Google-Smtp-Source: ABdhPJyNy9PlI0JBIt6oQt6LnRG30WaBY2+s+0BRyOS1BS6/BUJnE3JQVi0bmQKfkf9xq6zQZJ6oA80MJU4Vd1jWoK8=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr6940219wru.124.1591737184932; 
 Tue, 09 Jun 2020 14:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200609003810.1656842-1-colton.w.lewis@protonmail.com>
 <20200609003810.1656842-2-colton.w.lewis@protonmail.com>
In-Reply-To: <20200609003810.1656842-2-colton.w.lewis@protonmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jun 2020 17:12:53 -0400
Message-ID: <CADnq5_OYL6yCh0vn0syWRub-JUtRGF6M1ePkq9FP65vvGnnr0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd: correct trivial kernel-doc inconsistencies
To: Colton Lewis <colton.w.lewis@protonmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Jiri Kosina <trivial@kernel.org>, dri-devel@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 3:35 AM Colton Lewis
<colton.w.lewis@protonmail.com> wrote:
>
> Silence documentation warnings by correcting kernel-doc comments.
>
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3388: warning: Excess function parameter 'suspend' description in 'amdgpu_device_suspend'
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:3485: warning: Excess function parameter 'resume' description in 'amdgpu_device_resume'
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'tbo' description in 'amdgpu_vram_mgr_del'
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:418: warning: Excess function parameter 'place' description in 'amdgpu_vram_mgr_del'
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'tbo' description in 'amdgpu_gtt_mgr_del'
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c:279: warning: Excess function parameter 'place' description in 'amdgpu_gtt_mgr_del'
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:332: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:332: warning: Function parameter or member 'cached_dc_state' not described in 'amdgpu_display_manager'
>
> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       | 2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      | 2 --
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 2 ++
>  4 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a027a8f7b281..dd7da7b4b696 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3377,7 +3377,6 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
>   * amdgpu_device_suspend - initiate device suspend
>   *
>   * @dev: drm dev pointer
> - * @suspend: suspend state
>   * @fbcon : notify the fbdev of suspend
>   *
>   * Puts the hw in the suspend state (all asics).
> @@ -3474,7 +3473,6 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
>   * amdgpu_device_resume - initiate device resume
>   *
>   * @dev: drm dev pointer
> - * @resume: resume state
>   * @fbcon : notify the fbdev of resume
>   *
>   * Bring the hw back to operating state (all asics).
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 627104401e84..bc01a06546aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -268,8 +268,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_mem_type_manager *man,
>   * amdgpu_gtt_mgr_del - free ranges
>   *
>   * @man: TTM memory type manager
> - * @tbo: TTM BO we need this range for
> - * @place: placement flags and restrictions
>   * @mem: TTM memory object
>   *
>   * Free the allocated GTT again.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index d399e5893170..97ad8ffe6c6c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -407,8 +407,6 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
>   * amdgpu_vram_mgr_del - free ranges
>   *
>   * @man: TTM memory type manager
> - * @tbo: TTM BO we need this range for
> - * @place: placement flags and restrictions
>   * @mem: TTM memory object
>   *
>   * Free the allocated VRAM again.
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index d61186ff411d..86c132ddc452 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -139,10 +139,12 @@ struct amdgpu_dm_backlight_caps {
>   * @backlight_link: Link on which to control backlight
>   * @backlight_caps: Capabilities of the backlight device
>   * @freesync_module: Module handling freesync calculations
> + * @hdcp_workqueue: AMDGPU content protection queue
>   * @fw_dmcu: Reference to DMCU firmware
>   * @dmcu_fw_version: Version of the DMCU firmware
>   * @soc_bounding_box: SOC bounding box values provided by gpu_info FW
>   * @cached_state: Caches device atomic state for suspend/resume
> + * @cached_dc_state: Cached state of content streams
>   * @compressor: Frame buffer compression buffer. See &struct dm_comressor_info
>   */
>  struct amdgpu_display_manager {
> --
> 2.26.2
>
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
