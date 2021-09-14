Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564F40B400
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BEC89E36;
	Tue, 14 Sep 2021 15:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A989E36
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 15:59:32 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id s16so29460841ybe.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FoVXUrSFqza5z6xmI4Vx2XiJyPuuquNbXVDbGTe13yM=;
 b=DojXOMl95bKQeqh17s8gzjTTGcUXQ5BRT1T21CKvIuc+JIuispGSSzruAlvH6YsovA
 r1IdlrQ9rLbC5q46Pyth5q/jMldqy3aUSgLUCqhZ/bmfC3kwQc6p3Sq300tnEy7JBEiy
 bFAvx5KhhDw1d3MyMmBI5zpH4EXW6Y0LoCqy/tMI95euT059CbmLf/Xux5yfJiaPdeGu
 QReZLPGK42wXhIkbJd7XGeX5eayQXzE8HcPE2kikhi0pnagQ6UtPBljbfDOJhLTCVWyN
 jk2sW974RYX97nK43+bANteYnDzBA8+JFW6jyL6zr0HrpGjCaVy+FFLy57QTkYdktXRv
 u3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FoVXUrSFqza5z6xmI4Vx2XiJyPuuquNbXVDbGTe13yM=;
 b=oLPd8iNWRrEHuw22yX+iPjNcz9FDSfZVvrA2uQtzGTyqiZmf1dWfiGl/Xo23Meou3i
 j8J6RVHsgjOmLZNqnqmvuw9HDywt8NR27ExJqSheLYwnIzJejRQAhobhR5PopzsZ3//C
 jEYqR+AjUF5JmOD5IJ+9H0P69boO6yYcG3DmcUhSLBIPLRPEmWuNCs3Amu6z70qXZMRs
 2pSHx13lXOnzaMOOxjpKUz0VpcuiM8rUFe2n217rRNJbpJ9QOl5gcGXgrpBOAoz67+DK
 SlP5bT9IwH5yyo6xcXSIHmO1ZtLjNhKz7SUvNrTGXTfVM1+H2nIZhDxCF+KW7eDwEc+P
 XkwA==
X-Gm-Message-State: AOAM533D3Hha/UNOg6KQizTq0bhBzUgUXIS5d1asKXVWliwXfCmYMNdr
 pcDTI2A3TgRRvWnUdEuDVRP/X7VF4hUPfedcYKQ=
X-Google-Smtp-Source: ABdhPJx5uR8ciTFFDPbUdDkgnTGeOCtu6WH0lc7zFp6Db6UDho52cbFzaED+3nycinhcWuA0PDydjVJPJbqLdB4bMX0=
X-Received: by 2002:a05:6902:1545:: with SMTP id
 r5mr25480786ybu.255.1631635171815; 
 Tue, 14 Sep 2021 08:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210913182645.17075-1-decui@microsoft.com>
In-Reply-To: <20210913182645.17075-1-decui@microsoft.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Tue, 14 Sep 2021 08:59:20 -0700
Message-ID: <CAHFnvW0iX1FMTcJzQQtjHGosavSJ6-9wkRb7C0Ljv3c+BBUEXQ@mail.gmail.com>
Subject: Re: [PATCH] drm/hyperv: Fix double mouse pointers
To: Dexuan Cui <decui@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Thanks Dexuan, for the patch. A minor comment below.

On Mon, Sep 13, 2021 at 11:27 AM Dexuan Cui <decui@microsoft.com> wrote:
>
> It looks like Hyper-V supports a hardware cursor feature. It is not used
> by Linux VM, but the Hyper-V host still draws a point as an extra mouse
> pointer, which is unwanted, especially when Xorg is running.
>
> The hyperv_fb driver uses synthvid_send_ptr() to hide the unwanted pointer.
> When the hyperv_drm driver was developed, the function synthvid_send_ptr()
> was not copied from the hyperv_fb driver. Fix the issue by adding the
> function into hyperv_drm.
>
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
> Signed-off-by: Dexuan Cui <decui@microsoft.com>
> Cc: Deepak Rawat <drawat.floss@gmail.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm.h         |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  1 +
>  drivers/gpu/drm/hyperv/hyperv_drm_proto.c   | 39 ++++++++++++++++++++-
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm.h b/drivers/gpu/drm/hyperv/hyperv_drm.h
> index 886add4f9cd0..27bfd27c05be 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm.h
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm.h
> @@ -46,6 +46,7 @@ int hyperv_mode_config_init(struct hyperv_drm_device *hv);
>  int hyperv_update_vram_location(struct hv_device *hdev, phys_addr_t vram_pp);
>  int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
>                             u32 w, u32 h, u32 pitch);
> +int hyperv_send_ptr(struct hv_device *hdev);
>  int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect);
>  int hyperv_connect_vsp(struct hv_device *hdev);
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index 3aaee4730ec6..e21c82cf3326 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -101,6 +101,7 @@ static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
>         struct hyperv_drm_device *hv = to_hv(pipe->crtc.dev);
>         struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
>
> +       hyperv_send_ptr(hv->hdev);
>         hyperv_update_situation(hv->hdev, 1,  hv->screen_depth,
>                                 crtc_state->mode.hdisplay,
>                                 crtc_state->mode.vdisplay,
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> index 6d4bdccfbd1a..1ea7a0432320 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_proto.c
> @@ -299,6 +299,40 @@ int hyperv_update_situation(struct hv_device *hdev, u8 active, u32 bpp,
>         return 0;
>  }
>
> +/* Send mouse pointer info to host */
> +int hyperv_send_ptr(struct hv_device *hdev)
> +{
> +       struct synthvid_msg msg;
> +
> +       memset(&msg, 0, sizeof(struct synthvid_msg));
> +       msg.vid_hdr.type = SYNTHVID_POINTER_POSITION;
> +       msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +               sizeof(struct synthvid_pointer_position);
> +       msg.ptr_pos.is_visible = 1;

"is_visible" should be 0 since you want to hide the pointer. Maybe
better, accept these from the caller.

> +       msg.ptr_pos.video_output = 0;
> +       msg.ptr_pos.image_x = 0;
> +       msg.ptr_pos.image_y = 0;
> +       hyperv_sendpacket(hdev, &msg);
> +
> +       memset(&msg, 0, sizeof(struct synthvid_msg));
> +       msg.vid_hdr.type = SYNTHVID_POINTER_SHAPE;
> +       msg.vid_hdr.size = sizeof(struct synthvid_msg_hdr) +
> +               sizeof(struct synthvid_pointer_shape);
> +       msg.ptr_shape.part_idx = SYNTHVID_CURSOR_COMPLETE;
> +       msg.ptr_shape.is_argb = 1;
> +       msg.ptr_shape.width = 1;
> +       msg.ptr_shape.height = 1;
> +       msg.ptr_shape.hot_x = 0;
> +       msg.ptr_shape.hot_y = 0;
> +       msg.ptr_shape.data[0] = 0;
> +       msg.ptr_shape.data[1] = 1;
> +       msg.ptr_shape.data[2] = 1;
> +       msg.ptr_shape.data[3] = 1;
> +       hyperv_sendpacket(hdev, &msg);
> +

Is it necessary to send SYNTHVID_POINTER_SHAPE here? Perhaps we should
separate SYNTHVID_POINTER_POSITION and SYNTHVID_POINTER_SHAPE into
different functions.

> +       return 0;
> +}
> +
>  int hyperv_update_dirt(struct hv_device *hdev, struct drm_rect *rect)
>  {
>         struct hyperv_drm_device *hv = hv_get_drvdata(hdev);
> @@ -392,8 +426,11 @@ static void hyperv_receive_sub(struct hv_device *hdev)
>                 return;
>         }
>
> -       if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE)
> +       if (msg->vid_hdr.type == SYNTHVID_FEATURE_CHANGE) {
>                 hv->dirt_needed = msg->feature_chg.is_dirt_needed;
> +               if (hv->dirt_needed)
> +                       hyperv_send_ptr(hv->hdev);
> +       }
>  }
>
>  static void hyperv_receive(void *ctx)
> --
> 2.25.1
>
