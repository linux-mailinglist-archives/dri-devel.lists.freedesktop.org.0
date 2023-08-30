Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086278D2E7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 07:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893BA10E0A0;
	Wed, 30 Aug 2023 05:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A710E0A0;
 Wed, 30 Aug 2023 05:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=zW7btOlt2K11qPsWxiHaKJSAiy+S4wAiIVnsHPn6fd0=; b=cUmOXIY0aE/IlImLNPprIrDQE1
 GOiZtwCWlf5W9BZ3hDZT9ISC5B5ikbRE1+1XpE2G0JuIrZYUoqEJxX9F5PC+AuFcooXMqdgoq9k6Q
 ABliNVk7NWBFvInDGIFAxmxIr/Sfpts6BZxACrqcbadL2oLYs1tV7cYrlDDn3MrBLgLdsfI5bYh3D
 5Tl5sVvGJoFqHaxdPZ8LdQnBMO424tTkG5eQABt9q9S2yH1scb5OhvJolRiG1DeazcXRdTaiQ7CEB
 d3G44W0nPla9H+SNm0zZmwQY+n6BcUESMJVic0D7zl4kjOFPDXZ81O2ZXbs+LrnCMeY5GDVtWTO6F
 6fpZhDJQ==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qbDPH-00Cq5a-1f; Wed, 30 Aug 2023 05:06:19 +0000
Message-ID: <2b26d9e6-262c-0cd5-d390-e3b52f55e760@infradead.org>
Date: Tue, 29 Aug 2023 22:06:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] drm/connector: mark enum counter value as private
Content-Language: en-US
To: linux-kernel@vger.kernel.org
References: <20230716004616.21838-1-rdunlap@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230716004616.21838-1-rdunlap@infradead.org>
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
Cc: amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/15/23 17:46, Randy Dunlap wrote:
> Mark the DRM_MODE_COLORIMETRY_COUNT enum value as private in
> kernel-doc to prevent a build warning:
> 
> include/drm/drm_connector.h:527: warning: Enum value 'DRM_MODE_COLORIMETRY_COUNT' not described in enum 'drm_colorspace'
> 
> Fixes: c627087cb164 ("drm/connector: Use common colorspace_names array")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  include/drm/drm_connector.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20230714.orig/include/drm/drm_connector.h
> +++ linux-next-20230714/include/drm/drm_connector.h
> @@ -522,7 +522,7 @@ enum drm_colorspace {
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FIXED	= 13,
>  	DRM_MODE_COLORIMETRY_RGB_WIDE_FLOAT	= 14,
>  	DRM_MODE_COLORIMETRY_BT601_YCC		= 15,
> -	/* not a valid value; merely used for counting */
> +	/* private: not a valid value; merely used for counting */
>  	DRM_MODE_COLORIMETRY_COUNT
>  };
>  

Any comments on this patch?
The warning is still present in mainline.
The "private:" marker tells kernel-doc not to expect documentation for it.

thanks.
-- 
~Randy
