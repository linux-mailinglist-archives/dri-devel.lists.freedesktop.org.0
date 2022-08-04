Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334EA5899FF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3933934BB;
	Thu,  4 Aug 2022 09:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17A7393517
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 09:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659605948; x=1691141948;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=EzlvO4S9NPky88tJ6/nhFB6/N9vviFQAvXYNpMkV2DU=;
 b=YUKJT3icFjct8vdz71Wv+R7y+SNum3S+8I5FL0YsQ8CzR7hXbYqLSoCD
 bB09u9uiNRUbUpkc+93xocpIDYhVBWJwyh6LUV5m6z6nvscDj8iQZYR4N
 9eTtx7xSnJ8cR3cRN55G0J2WM6fjDDJi0elJbXrpwwILQErQrrKlOIrmz
 VD9Vf6ceds/QIwbxBqXp0IMd8nM48VkWxdvHYT/8zhuzDn7amYWDqVtlg
 1F0AMA42JVJKqGKZle1IwcYzi0DpUhbaPSvAC7a9yNJFKCGNWmlM3k97p
 BhxiFqEACXvGTI726D5noV6gjtZjX+u3xkp6bDeZJgPc8DJn+rkacdlKl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="353889544"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="353889544"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:39:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; d="scan'208";a="631514684"
Received: from wujunyox-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2022 02:39:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: fix whitespace in drm_plane_create_color_properties()
In-Reply-To: <20220803204240.33409-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220803204240.33409-1-contact@emersion.fr>
Date: Thu, 04 Aug 2022 12:39:02 +0300
Message-ID: <87bkt0pcuh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 03 Aug 2022, Simon Ser <contact@emersion.fr> wrote:
> The drm_property_create_enum() call for "COLOR_RANGE" contains a tab
> character in the middle of the argument list.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 17c6c3eefcd6..d021497841b8 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -575,7 +575,7 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  		len++;
>  	}
>  
> -	prop = drm_property_create_enum(dev, 0,	"COLOR_RANGE",
> +	prop = drm_property_create_enum(dev, 0, "COLOR_RANGE",
>  					enum_list, len);
>  	if (!prop)
>  		return -ENOMEM;

-- 
Jani Nikula, Intel Open Source Graphics Center
