Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A17724673
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3815B10E361;
	Tue,  6 Jun 2023 14:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A455B10E361
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:39:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23665AB;
 Tue,  6 Jun 2023 16:39:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686062355;
 bh=qyqmnSxwDwLrbxk8+vjpFN2vWJrjzLzmUBFrL48Rkfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O4smJqs5dEKcDVHCfkFXhvvZxlZ37wGv8k7loP11UwO+eQEJjJv11rrjS/a9/JlDD
 L+RlpZsRVK8FkPZhlAJ+QiL+70D/6XtzH0RHbEBLfnJtZ8Itfu8ZfPf+Dzo+HFjYwZ
 qJvMdz7dyCVBQtyMGYZRL8EHzvAurt88+U0VvGZw=
Date: Tue, 6 Jun 2023 17:39:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 4/8] drm: Remove usage of deprecated DRM_NOTE
Message-ID: <20230606143937.GD5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <91d957dd92b41dda42da912397df195e3565866a.1686047727.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <91d957dd92b41dda42da912397df195e3565866a.1686047727.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Tue, Jun 06, 2023 at 04:15:18PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_NOTE is deprecated in favor of drm_notice().
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

With the commit message fixed as mentioned in the review of an earlier
patch in this series,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_displayid.c         | 2 +-
>  drivers/gpu/drm/drm_kms_helper_common.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
> index 9edc111be7ee..27ffeee09e4f 100644
> --- a/drivers/gpu/drm/drm_displayid.c
> +++ b/drivers/gpu/drm/drm_displayid.c
> @@ -42,7 +42,7 @@ validate_displayid(const u8 *displayid, int length, int idx)
>  	for (i = 0; i < dispid_length; i++)
>  		csum += displayid[idx + i];
>  	if (csum) {
> -		DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
> +		drm_notice(NULL, "DisplayID checksum invalid, remainder is %d\n", csum);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 0bf0fc1abf54..7a41373b67dc 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -41,7 +41,7 @@ MODULE_LICENSE("GPL and additional rights");
>  /* Backward compatibility for drm_kms_helper.edid_firmware */
>  static int edid_firmware_set(const char *val, const struct kernel_param *kp)
>  {
> -	DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
> +	drm_notice(NULL, "drm_kms_helper.edid_firmware is deprecated, please use drm.edid_firmware instead.\n");
>  
>  	return __drm_set_edid_firmware_path(val);
>  }

-- 
Regards,

Laurent Pinchart
