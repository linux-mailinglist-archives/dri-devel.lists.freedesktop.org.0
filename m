Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2563015397C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 21:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74586E235;
	Wed,  5 Feb 2020 20:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9225A6E235
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 20:20:24 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id v13so3024324iln.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JlLlxcQrpMkFUoU3hq5dL+E4UdUH5CDEd0YwvUejnVU=;
 b=oxenJqq82hLbOY7iPrO4DykFZo5N5e0MnyDP4aMCZ4rNnPVzW7PVckpP2qD7MWebBl
 Al2LFHbYZUmY6P3jBNPQTFTJATaNYQgghy5BquPjuhetKLPYg9SYNadMl/MB5nl7p4qg
 fP4YnhAj3q8n1AbMRpiGqJzn+4OeEEOrK6Re9bVBJ1d/IuaQkN3rb6jYEWcjVskRYLp5
 vWHG9YVnk4VtWVbENO1Fy3klZ4pRRQAwj+tfauQTnQrm5eYUVWtjg7IuVHH6cFLXArQ9
 PWBduhU9ZJSz1uDA/+UGLI7zagtMps7gLmNwuAHjyETzuhbO2L6Wzt2/DjinPhcQ6ge4
 Q1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JlLlxcQrpMkFUoU3hq5dL+E4UdUH5CDEd0YwvUejnVU=;
 b=nxPXslLCqg+smS94WQrMkm9mxmxB3RpkVQx0Pa9VWuZ5FKOyB5FegmU5CIF5ESMDNt
 qQsGWxX5bK5U6K9/qvpX6alb/IRRVwXsaOVE94QxIEybESTZDaVPg3vpkkVMXsxtyaje
 Y3mHurnfATCq/7N0lu2DySEELeXV6OymVDAR2+Cg+ZSMFgvgOD75TbeMUoHlH5b82E1o
 sSIWDaiZsTKCcN4ITlsG3DfuECPqA37S44DV3WYrYNmXSm2jKfNUw9NSvbj5iJ8GFR8t
 mO2csf56zMFvcceX+nqiHQUnCmqA71ATFKEJLewYBABvhIm7kvE8oGekbi5yDd5K8/d2
 Od3w==
X-Gm-Message-State: APjAAAUzw00ye8bNxw5O8LXuwjA09XxXbyq9YmfMfFbnlv0YAsHKqOF0
 HLfN8H/KhITaCbqDE9D/990oOIe8w8zanZHyuS4=
X-Google-Smtp-Source: APXvYqxFqY4hqvCjpu5bLrtVB9HF9X+Oiknt2AoIL2F6QzIYDbfIIZTO59osj5M/WRh4O2BVdm/STxVTgQlIrA90kSA=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr29405150ilk.139.1580934023820; 
 Wed, 05 Feb 2020 12:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20200205102552.21409-1-kraxel@redhat.com>
In-Reply-To: <20200205102552.21409-1-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 5 Feb 2020 12:20:12 -0800
Message-ID: <CAPaKu7SyqZU=ov4Atbedie6AGC52he0QQJZnGqr545mG-U7vvg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: ratelimit error logging
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 5, 2020 at 2:26 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Avoid flooding the log in case we screw up badly.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 5914e79d3429..83f22933c3bb 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -212,9 +212,9 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>                         if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
>                                 struct virtio_gpu_ctrl_hdr *cmd;
>                                 cmd = (struct virtio_gpu_ctrl_hdr *)entry->buf;
> -                               DRM_ERROR("response 0x%x (command 0x%x)\n",
> -                                         le32_to_cpu(resp->type),
> -                                         le32_to_cpu(cmd->type));
> +                               DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",
> +                                                     le32_to_cpu(resp->type),
> +                                                     le32_to_cpu(cmd->type));
>                         } else
>                                 DRM_DEBUG("response 0x%x\n", le32_to_cpu(resp->type));
>                 }
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
