Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF9750AB5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 16:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912E310E54B;
	Wed, 12 Jul 2023 14:22:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8DF10E54B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 14:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hNojfaeHD+yrJAfrSYxA2Q8X5xc6RjcCbY6fFnfWjYM=; b=M/htLnYcOEEz6NgTH+HZW+QcUA
 x/3Mp/J1pnIq2n0pbpPrWbFvIeah8PsS71ml9hc7Ob649/zxzzSMxORszXK5KFQVtnS2rqWDJNO1z
 dzI40Vd9EQIkF+KXfbf4JuA2ZYYU1Izue4Lb2N/I9Csghpqh5z8Knh4BSO2/8Oun77HDsarSgzKms
 bAUjxUO7lmplmiTwb0V5BMdnf4jGZxPr6gnxVG84vR3RtgibMgSVdYs3cYE9sHQ9/Fp4NXeQNgOwo
 xJFnMN7tqfezvYv/QTqyIwyfuo5dy0zwNdtgfza3Ou/VITW3bcVu8DZvZsZeplfzOMKjlmjmuT/6T
 NePXFHMA==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qJaiz-00D93L-Iw; Wed, 12 Jul 2023 16:21:49 +0200
Message-ID: <598d39ca-c1be-a57f-9ab5-d90403c78cd0@igalia.com>
Date: Wed, 12 Jul 2023 11:21:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/gem-fb-helper: Consistenly use drm_dbg_kms()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <7c2182b365c5b0a574744a2832e0209aa1fc009e.1689169087.git.geert+renesas@glider.be>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <7c2182b365c5b0a574744a2832e0209aa1fc009e.1689169087.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 7/12/23 10:42, Geert Uytterhoeven wrote:
> All debug messages in drm_gem_framebuffer_helper.c use drm_dbg_kms(),
> except for one, which uses drm_dbg().
> Replace the outlier by drm_dbg_kms() to restore consistency.
> 
> Fixes: c91acda3a380bcaf ("drm/gem: Check for valid formats")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Thanks for sending this fix!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index b8a615a138cd675f..3bdb6ba37ff42fb6 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -168,8 +168,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>   	if (drm_drv_uses_atomic_modeset(dev) &&
>   	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
>   				      mode_cmd->modifier[0])) {
> -		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> -			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
> +		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
> +			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
>   		return -EINVAL;
>   	}
>   
