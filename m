Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C2B130B75
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 02:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E81A6E200;
	Mon,  6 Jan 2020 01:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C289C56;
 Mon,  6 Jan 2020 01:25:21 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id l6so16517273uap.13;
 Sun, 05 Jan 2020 17:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nu8fJALn3OtDId//kVWFVwQiTK77BxaFQ6V9m6riC0s=;
 b=jdT1yl8zEYB5hOQLZqcGNe0kNW2746jtEKCtOTkRzqAcJFej9tdz6gOvSP2C6TtJQI
 BwKVWXek9m6CeNW01rMmcCMuxSyRBPVveWHGyt1IKxzTSjes/5nkcwZ6J5Q/ccFKqz8q
 SeuiHDSarWVFd/tLEl9Ydz6ob2R1Z0BRJKkp2K4SebRuAnBp4nNTL5Jkx1ZY9avXnPkj
 MDvEFDbHjrP3Z2DwBi4Phj/d4ewsuHyS2nojF/tgwXrTe3L9Bo4uQh76Krwz0heWy0VI
 P+KjolkpDSrO/4I+3VfLqyTwVgGAHWb9A2wl1rNFCkBB+8xPR9T7cIA4bOo/aIpsUv0g
 3dTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nu8fJALn3OtDId//kVWFVwQiTK77BxaFQ6V9m6riC0s=;
 b=g12kut7vNpy5qeY5P9/p+NobOD07eC3+5BHk10Ytp99wXUm25dTExQJhEe3dOTX77E
 K8iQYIkvf4AVSswgOM6GoOvcHoRPUZmL2l5SbM9Nljoq2tVD5I2/UDbruJy9w0aXMthT
 VfWYy+3pIxNDi4Gc5bPCCkYLPML+9xLqSxycxRl61saec0l3P8ueOeixO29qEmzOXXJy
 kg+eajb7Ga/joY8irlhQhZSf3+hoyNCnLjRndU6uOa2+K9atcfJ19RZlvAuQkXbV87zi
 ovOYW1Wt6TR7jp9dKDoTACbBDq3hPCRg+h0d8M3GSt2DapdYjiKpp3UTqomo8I6JQUmL
 4bWA==
X-Gm-Message-State: APjAAAXPtowEOdasr/vVVH2O2jPtxwX/rfzBc4MckZFh8zt91LK0gXxw
 ClrEwT/q0H3cGoMZnIv1CayuSzhbX30A0ywwN5w=
X-Google-Smtp-Source: APXvYqzm/ySduv+3rFh3J8zJqlMnuo8q1pBkc1YDLR4HUxRcIfDqGESBrglP6/lbFkm3OduOZmxZg5ofDrvyHBA13/s=
X-Received: by 2002:ab0:6029:: with SMTP id n9mr57325791ual.35.1578273920484; 
 Sun, 05 Jan 2020 17:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20191217004520.2404-1-jajones@nvidia.com>
 <20191217004520.2404-3-jajones@nvidia.com>
In-Reply-To: <20191217004520.2404-3-jajones@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Mon, 6 Jan 2020 11:25:09 +1000
Message-ID: <CACAvsv656x+PL7pP=_JVgkJXnLaoUJOD=-H_6k2-UVwXSsREnA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2 2/3] drm/nouveau: Check framebuffer size
 against bo
To: James Jones <jajones@nvidia.com>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 at 10:45, James Jones <jajones@nvidia.com> wrote:
>
> Make sure framebuffer dimensions and tiling
> parameters will not result in accesses beyond the
> end of the GEM buffer they are bound to.
>
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 93 +++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 6f038511a03a..f1509392d7b7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -224,6 +224,72 @@ static const struct drm_framebuffer_funcs nouveau_framebuffer_funcs = {
>         .create_handle = nouveau_user_framebuffer_create_handle,
>  };
>
> +static inline uint32_t
> +nouveau_get_width_in_blocks(uint32_t stride)
> +{
> +       /* GOBs per block in the x direction is always one, and GOBs are
> +        * 64 bytes wide
> +        */
> +       static const uint32_t log_block_width = 6;
> +
> +       return (stride + (1 << log_block_width) - 1) >> log_block_width;
> +}
> +
> +static inline uint32_t
> +nouveau_get_height_in_blocks(struct nouveau_drm *drm,
> +                            uint32_t height,
> +                            uint32_t log_block_height_in_gobs)
> +{
> +       uint32_t log_gob_height;
> +       uint32_t log_block_height;
> +
> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
> +
> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> +               log_gob_height = 2;
> +       else
> +               log_gob_height = 3;
> +
> +       log_block_height = log_block_height_in_gobs + log_gob_height;
> +
> +       return (height + (1 << log_block_height) - 1) >> log_block_height;
> +}
> +
> +static int
> +nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
> +                     uint32_t offset, uint32_t stride, uint32_t h,
> +                     uint32_t tile_mode)
> +{
> +       uint32_t gob_size, bw, bh;
> +       uint64_t bl_size;
> +
> +       BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
> +
> +       if (drm->client.device.info.chipset >= 0xc0)
> +               tile_mode >>= 4;
> +
> +       BUG_ON(tile_mode & 0xFFFFFFF0);
As far as I can tell, tile_mode can be fed into this function
unsanitised from userspace, so we probably want something different to
a BUG_ON() here.

> +
> +       if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
> +               gob_size = 256;
> +       else
> +               gob_size = 512;
> +
> +       bw = nouveau_get_width_in_blocks(stride);
> +       bh = nouveau_get_height_in_blocks(drm, h, tile_mode);
> +
> +       bl_size = bw * bh * (1 << tile_mode) * gob_size;
> +
> +       DRM_DEBUG_KMS("offset=%u stride=%u h=%u tile_mode=0x%02x bw=%u bh=%u gob_size=%u bl_size=%llu size=%lu\n",
> +                     offset, stride, h, tile_mode, bw, bh, gob_size, bl_size,
> +                     nvbo->bo.mem.size);
> +
> +       if (bl_size + offset > nvbo->bo.mem.size)
> +               return -ERANGE;
> +
> +       return 0;
> +}
> +
>  int
>  nouveau_framebuffer_new(struct drm_device *dev,
>                         const struct drm_mode_fb_cmd2 *mode_cmd,
> @@ -232,6 +298,8 @@ nouveau_framebuffer_new(struct drm_device *dev,
>  {
>         struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nouveau_framebuffer *fb;
> +       const struct drm_format_info *info;
> +       unsigned int width, height, i;
>         int ret;
>
>          /* YUV overlays have special requirements pre-NV50 */
> @@ -254,6 +322,31 @@ nouveau_framebuffer_new(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> +       info = drm_get_format_info(dev, mode_cmd);
> +
> +       for (i = 0; i < info->num_planes; i++) {
> +               width = drm_format_info_plane_width(info,
> +                                                   mode_cmd->width,
> +                                                   i);
> +               height = drm_format_info_plane_height(info,
> +                                                     mode_cmd->height,
> +                                                     i);
> +
> +               if (nvbo->kind) {
> +                       ret = nouveau_check_bl_size(drm, nvbo,
> +                                                   mode_cmd->offsets[i],
> +                                                   mode_cmd->pitches[i],
> +                                                   height, nvbo->mode);
> +                       if (ret)
> +                               return ret;
> +               } else {
> +                       uint32_t size = mode_cmd->pitches[i] * height;
> +
> +                       if (size + mode_cmd->offsets[i] > nvbo->bo.mem.size)
> +                               return -ERANGE;
> +               }
> +       }
> +
>         if (!(fb = *pfb = kzalloc(sizeof(*fb), GFP_KERNEL)))
>                 return -ENOMEM;
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
