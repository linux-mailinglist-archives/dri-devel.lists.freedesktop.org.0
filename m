Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779776E260D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 16:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C12710E119;
	Fri, 14 Apr 2023 14:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0210E119
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681483609; x=1713019609;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XxWpp4sh6hWBGX6vqCfJsYSwM94lWxqibLcIBWFt/Gc=;
 b=Hwatuf06VpUST9gQZxXpDtvng4slT8B9EJuv2kY0PEV+j6yc+Rex7tws
 1Mh5IpHMdQm/htUk+7Hw4z+r0X9PqLtAG0TGZCIOM2fUjVAzEwDNz1wt8
 XJyFW7fGZ/CjBSFyKe/nK7ywmlO4QjdcTJsdlQU45X21B00vSor7CeDIl
 V5Knpcc4ckAY5AA0PUa8hbmFztjW20Lu7/HlXSUB9kRt9tWUi/TXl67/6
 UyOlDUiT1yJ1b2VmWclmsMjvP5Zp68h6gCIS1WKhS/oHCqYan0akECq6x
 LLKmavVQyS2SK0xMtgxf4qHOqsAOqZXvE8Cnne0cPb5uk03ef+30ueng9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="341976355"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="341976355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 07:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="720307674"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="720307674"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga008.jf.intel.com with SMTP; 14 Apr 2023 07:46:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 17:46:36 +0300
Date: Fri, 14 Apr 2023 17:46:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 6/7] drm/vkms: add reflect-y property
Message-ID: <ZDlnTHCUqktMjGef@intel.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
 <20230414135151.75975-7-mcanal@igalia.com>
 <ZDliI+iEgQlDMZWJ@intel.com>
 <38df4fc1-b6ad-ae3d-daab-de09fde30ffc@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38df4fc1-b6ad-ae3d-daab-de09fde30ffc@igalia.com>
X-Patchwork-Hint: comment
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 11:37:17AM -0300, Maíra Canal wrote:
> On 4/14/23 11:24, Ville Syrjälä wrote:
> > On Fri, Apr 14, 2023 at 10:51:50AM -0300, Maíra Canal wrote:
> >> Currently, vkms only support the reflect-x property. Therefore, add the
> >> reflect-y property to vkms through a software implementation of the
> >> operation. This is possible by reverse reading the y axis during the
> >> blending.
> >>
> >> Now, vkms support all possible rotation values.
> >>
> >> Tested with igt@kms_rotation_crc@primary-reflect-y and
> >> igt@kms_rotation_crc@sprite-reflect-y [1].
> >>
> >> [1] https://patchwork.freedesktop.org/series/116025/
> >>
> >> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> >> ---
> >>   drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++++-
> >>   drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++------------
> >>   2 files changed, 10 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> >> index b05bd008aeab..19d1078e9d34 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >> @@ -92,8 +92,13 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> >>   			return -1;
> >>   		return y + frame_info->dst.x1;
> >>   	default:
> >> -		return y;
> >> +		break;
> >>   	}
> >> +
> >> +	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> >> +		return drm_rect_height(&frame_info->dst) - y - 1;
> >> +
> >> +	return y;
> >>   }
> >>   
> >>   static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> >> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> >> index 11662afa9fe4..d08bda869a24 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> >> @@ -121,12 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >>   	frame_info->fb = fb;
> >>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> >>   	drm_framebuffer_get(frame_info->fb);
> >> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
> >> -						     DRM_MODE_ROTATE_0 |
> >> -						     DRM_MODE_ROTATE_90 |
> >> -						     DRM_MODE_ROTATE_180 |
> >> -						     DRM_MODE_ROTATE_270 |
> >> -						     DRM_MODE_REFLECT_X);
> >> +	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_MASK |
> >> +						     DRM_MODE_REFLECT_MASK);
> > 
> > What are you trying to achieve with that?
> 
> Yeah, seeing it right now I can see that this is not achieving anything. 
> I will remove it in the next version.

I think using it might still make sense to eg. remove the 180/270
cases from your actual rendering code.

I'm also a bit uneasy about all that hand rolled coordinate calculation
stuff. Ideally drm_rect_rotate*() should handle all that for you, and
make sure the rotate vs. reflect actually get applied in the correct
order.

-- 
Ville Syrjälä
Intel
