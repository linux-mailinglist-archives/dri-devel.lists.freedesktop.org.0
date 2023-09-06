Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633E7794483
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 22:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1894010E1C7;
	Wed,  6 Sep 2023 20:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30F10E1C7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 20:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=FLTOwwr5W43vbiGYl2v2rKXXuVv9T2DL3IE1Nf+wFh4=; b=TmD8pgRJhAchnJvuzfhT5jRS7w
 AfJO/UhAW/m4rOUw/qZ7914fzD+kvfDaF06viiN5wAm/qrqfrZgiYhr8gia6w09jmB0lyGWctoRpG
 SaPzgLvKgpqHmGhH3JrakBfc7UOS67ChNDTCfGxqOMwzFy8XnxH3VDFigRiQdpUvmJaZSkBiBsprL
 wCrKAngc1/yhzYfVuK/xAiLROJSlX88apCtXVcDcT9z5OF+xFt//qAvuOhydgGIMjjoJHR0OJpEZx
 407g22zbK1c8kAkUc9MBneL/uwjlh5sRFzjurjcvhBiVAPlZracCBw5kO7hy+BZ6Bh0nWKa9AZrmk
 ZQQO4BPQ==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qdz8i-00AqvX-1z; Wed, 06 Sep 2023 20:28:40 +0000
Message-ID: <555ac3b5-93ee-efca-45d7-f34b5e91d891@infradead.org>
Date: Wed, 6 Sep 2023 13:28:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/connector: document supported_colorspaces and
 DRM_MODE_COLORIMETRY_COUNT
Content-Language: en-US
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230906-topic-drm_connector_doc-v1-1-f4ce7ad0150c@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230906-topic-drm_connector_doc-v1-1-f4ce7ad0150c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/6/23 11:19, Javier Carrasco wrote:
> The supported_colorspaces parameter was added to the following
> functions without documenting it:
> 
> drm_mode_create_dp_colorspace_property
> drm_mode_create_hdmi_colorspace_property
> 
> The missing descriptions generate warnings when compiling the
> documentation. Add the descriptions to document the
> supported_colorspaces parameter.
> 
> The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
> properly documented by moving the description out of the enum to the
> member description list to get rid of an additional warning and improve
> documentation clarity.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> The supported_colorspaces parameter was added to the following
> functions without documenting it:
> 
> drm_mode_create_dp_colorspace_property
> drm_mode_create_hdmi_colorspace_property
> 
> The missing descriptions generate warnings when compiling the
> documentation. Add the descriptions to document the
> supported_colorspaces parameter.
> 
> The drm_colorspace enum member DRM_MODE_COLORIMETRY_COUNT has been
> properly documented by moving the description out of the enum to the
> member description list to get rid of an additional warning and improve
> documentation clarity.
> ---
>  drivers/gpu/drm/drm_connector.c | 2 ++
>  include/drm/drm_connector.h     | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index bf8371dc2a61..77bfe17dcf98 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c

These (2) are already fixed in linux-next.

> @@ -2203,6 +2203,7 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
>  /**
>   * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: colorspaces supported by the driver.
>   *
>   * Called by a driver the first time it's needed, must be attached to desired
>   * HDMI connectors.
> @@ -2227,6 +2228,7 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
>  /**
>   * drm_mode_create_dp_colorspace_property - create dp colorspace property
>   * @connector: connector to create the Colorspace property on.
> + * @supported_colorspaces: colorspaces supported by the driver.
>   *
>   * Called by a driver the first time it's needed, must be attached to desired
>   * DP connectors.
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index d300fde6c1a4..18cf46e3478b 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h

This one still needs to be fixed/applied.
You can add:

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> @@ -498,6 +498,8 @@ enum drm_privacy_screen_status {
>   *   ITU-R BT.601 colorimetry format
>   *   The DP spec does not say whether this is the 525 or the 625
>   *   line version.
> + * @DRM_MODE_COLORIMETRY_COUNT:
> + *   Not a valid value; merely used four counting
>   */
>  enum drm_colorspace {
>  	/* For Default case, driver will set the colorspace */
> @@ -522,7 +524,6 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
>  	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
> -	/* not a valid value; merely used for counting */
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
>  
> 
> ---
> base-commit: 65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
> change-id: 20230906-topic-drm_connector_doc-42dae3ba43c6
> 
> Best regards,

-- 
~Randy
