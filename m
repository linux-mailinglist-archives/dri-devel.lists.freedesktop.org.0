Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B986E5AB4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2555410E6BA;
	Tue, 18 Apr 2023 07:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BC910E6BA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:45:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC6D7802;
 Tue, 18 Apr 2023 09:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681803948;
 bh=WXMqNLcsMzBdrCjOVU5w+1j2mj02wBkgJYuHzWk/1D4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fzNEKPtbSmPORakCx1oG+/uQWTelnSYg29fmE1KU+0dGA+AXDDnieD3kn+f3xLFJf
 MSoilFG1a3qC6p9dvTB2bvYoCmSh1Bx1g+4FlC0ArX7nvJyUfb4yPy62IYl4q7of7L
 rMljMSO+dEJBgDY6Joa3aPlOiY9/6rQyoAqRqUzM=
Date: Tue, 18 Apr 2023 10:46:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 1/5] drm: shmobile: Use %p4cc to print fourcc codes
Message-ID: <20230418074605.GE4703@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
 <71cbb983e0d6b153f5c4e0664b795421b34b10fb.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <71cbb983e0d6b153f5c4e0664b795421b34b10fb.1681734821.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Mon, Apr 17, 2023 at 03:40:21PM +0200, Geert Uytterhoeven wrote:
> Replace the printing of hexadecimal fourcc format codes by
> pretty-printed format names, using the "%p4cc" format specifier.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
>   - Add Reviewed-by.
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c | 4 ++--
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> index d354ab3077cecf94..713a7612244c647a 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> @@ -355,8 +355,8 @@ static int shmob_drm_crtc_mode_set(struct drm_crtc *crtc,
>  
>  	format = shmob_drm_format_info(crtc->primary->fb->format->format);
>  	if (format == NULL) {
> -		dev_dbg(sdev->dev, "mode_set: unsupported format %08x\n",
> -			crtc->primary->fb->format->format);
> +		dev_dbg(sdev->dev, "mode_set: unsupported format %p4cc\n",
> +			&crtc->primary->fb->format->format);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> index 60a2c8d8a0d947d2..3c5fe3bc183c7c13 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
> @@ -96,8 +96,8 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>  
>  	format = shmob_drm_format_info(mode_cmd->pixel_format);
>  	if (format == NULL) {
> -		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
> -			mode_cmd->pixel_format);
> +		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
> +			&mode_cmd->pixel_format);
>  		return ERR_PTR(-EINVAL);
>  	}
>  

-- 
Regards,

Laurent Pinchart
