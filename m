Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECB151626
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 07:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A066E09C;
	Tue,  4 Feb 2020 06:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA726E09C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 06:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580799025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=22kb15mmv1EYeXchEbGXju0n59leWD6QvntmJYNiXts=;
 b=IbpeinGtNz8UHnuFPlM50ODNyxzlthwgirbpXTeZVCFnYKDI11nsu51EvyJVwD7ue32IAX
 Pzp2fyfXuLzpigmUvp7ZCTPHFYTMVW4MLoXyevi5E2jyua1jVPeJYpYQsNMeLP6OW3EgfF
 dgL3lER5EMHbgXgzUGc2KeqgaVCbauI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-qTcub06rPP20Prqjm6CzyQ-1; Tue, 04 Feb 2020 01:50:21 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733A1189F760;
 Tue,  4 Feb 2020 06:50:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC925D9C5;
 Tue,  4 Feb 2020 06:50:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DD358A1E0; Tue,  4 Feb 2020 07:50:16 +0100 (CET)
Date: Tue, 4 Feb 2020 07:50:16 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/4] drm/bochs: Implement struct
 drm_mode_config_funcs.mode_valid
Message-ID: <20200204065016.kcuynrnrk5zwnkdf@sirius.home.kraxel.org>
References: <20200203155258.9346-1-tzimmermann@suse.de>
 <20200203155258.9346-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200203155258.9346-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: qTcub06rPP20Prqjm6CzyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Cc: airlied@linux.ie, puck.chen@hisilicon.com, z.liuxinliang@hisilicon.com,
 hdegoede@redhat.com, kong.kongxinwei@hisilicon.com,
 dri-devel@lists.freedesktop.org, zourongrong@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 03, 2020 at 04:52:56PM +0100, Thomas Zimmermann wrote:
> The implementation of struct drm_mode_config_funcs.mode_valid verifies
> that enough video memory is available for a given display mode. This
> replaces similar functionality in bochs_connector_mode_valid().
> 
> v2:
> 	* remove bochs_connector_mode_valid(), which now serves no purpose
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

> ---
>  drivers/gpu/drm/bochs/bochs_kms.c | 21 +--------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index ff275faee88d..cc93ff74fbd8 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -83,28 +83,8 @@ static int bochs_connector_get_modes(struct drm_connector *connector)
>  	return count;
>  }
>  
> -static enum drm_mode_status bochs_connector_mode_valid(struct drm_connector *connector,
> -				      struct drm_display_mode *mode)
> -{
> -	struct bochs_device *bochs =
> -		container_of(connector, struct bochs_device, connector);
> -	unsigned long size = mode->hdisplay * mode->vdisplay * 4;
> -
> -	/*
> -	 * Make sure we can fit two framebuffers into video memory.
> -	 * This allows up to 1600x1200 with 16 MB (default size).
> -	 * If you want more try this:
> -	 *     'qemu -vga std -global VGA.vgamem_mb=32 $otherargs'
> -	 */
> -	if (size * 2 > bochs->fb_size)
> -		return MODE_BAD;
> -
> -	return MODE_OK;
> -}
> -
>  static const struct drm_connector_helper_funcs bochs_connector_connector_helper_funcs = {
>  	.get_modes = bochs_connector_get_modes,
> -	.mode_valid = bochs_connector_mode_valid,
>  };
>  
>  static const struct drm_connector_funcs bochs_connector_connector_funcs = {
> @@ -148,6 +128,7 @@ bochs_gem_fb_create(struct drm_device *dev, struct drm_file *file,
>  
>  const struct drm_mode_config_funcs bochs_mode_funcs = {
>  	.fb_create = bochs_gem_fb_create,
> +	.mode_valid = drm_vram_helper_mode_valid,
>  	.atomic_check = drm_atomic_helper_check,
>  	.atomic_commit = drm_atomic_helper_commit,
>  };
> -- 
> 2.25.0
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
