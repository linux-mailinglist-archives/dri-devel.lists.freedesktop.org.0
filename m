Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AAE6E4828
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3310E4A5;
	Mon, 17 Apr 2023 12:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E096310E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681735626; x=1713271626;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FzP2vtu7DLOoRfUFGPx5Sd+wMWc7nV0hL5FksagcAvk=;
 b=gEFk6EbCCrZTCfKd766QTF6Nf3/+1MCNOsKrvqPJ/hWRgRlX4OUIHRZ0
 /U4k/JbZR0yVT9UnOTGADI5JtjqwbOH2rO/NQJrZwUsm9Ks+oN0ctwm3+
 uHsakfpyc9AIYYB4RkuvB11dhmZHJRAMtpw37FLgYP174oAgIfHMAnfVm
 LqUWQgJb+m8lRyYorP6gJOdDI2a33FwxExSN2G7F63v19eT6sRgDRUgoO
 Zxp+zZCp3CjbrZ+2ytlMK5T4G+9R7XA8TpUA3TGOKfiqkl6ilSJZsBW1H
 QJvPmV/L+KDtBZ1BSaZHxK3VnOU1vHdWdntBFmA6aeK5LdZOoiLm/dghF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="329050437"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="329050437"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 05:47:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="668111069"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="668111069"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by orsmga006.jf.intel.com with SMTP; 17 Apr 2023 05:47:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 15:47:01 +0300
Date: Mon, 17 Apr 2023 15:47:01 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v2 6/7] drm/vkms: add reflect-y property
Message-ID: <ZD0/xcx2E7cdFqme@intel.com>
References: <20230414135151.75975-1-mcanal@igalia.com>
 <20230414135151.75975-7-mcanal@igalia.com>
 <ZDliI+iEgQlDMZWJ@intel.com>
 <38df4fc1-b6ad-ae3d-daab-de09fde30ffc@igalia.com>
 <ZDlnTHCUqktMjGef@intel.com>
 <79f5c3bf-ac4d-18f5-4b09-2b9a2422202c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79f5c3bf-ac4d-18f5-4b09-2b9a2422202c@igalia.com>
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

On Fri, Apr 14, 2023 at 02:53:55PM -0300, Maíra Canal wrote:
> On 4/14/23 11:46, Ville Syrjälä wrote:
> > On Fri, Apr 14, 2023 at 11:37:17AM -0300, Maíra Canal wrote:
> >> On 4/14/23 11:24, Ville Syrjälä wrote:
> >>> On Fri, Apr 14, 2023 at 10:51:50AM -0300, Maíra Canal wrote:
> >>>> Currently, vkms only support the reflect-x property. Therefore, add the
> >>>> reflect-y property to vkms through a software implementation of the
> >>>> operation. This is possible by reverse reading the y axis during the
> >>>> blending.
> >>>>
> >>>> Now, vkms support all possible rotation values.
> >>>>
> >>>> Tested with igt@kms_rotation_crc@primary-reflect-y and
> >>>> igt@kms_rotation_crc@sprite-reflect-y [1].
> >>>>
> >>>> [1] https://patchwork.freedesktop.org/series/116025/
> >>>>
> >>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> >>>> ---
> >>>>    drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++++-
> >>>>    drivers/gpu/drm/vkms/vkms_plane.c    | 16 ++++------------
> >>>>    2 files changed, 10 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> >>>> index b05bd008aeab..19d1078e9d34 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >>>> @@ -92,8 +92,13 @@ static int get_y_pos(struct vkms_frame_info *frame_info, int y)
> >>>>    			return -1;
> >>>>    		return y + frame_info->dst.x1;
> >>>>    	default:
> >>>> -		return y;
> >>>> +		break;
> >>>>    	}
> >>>> +
> >>>> +	if (frame_info->rotation & DRM_MODE_REFLECT_Y)
> >>>> +		return drm_rect_height(&frame_info->dst) - y - 1;
> >>>> +
> >>>> +	return y;
> >>>>    }
> >>>>    
> >>>>    static bool check_limit(struct vkms_frame_info *frame_info, int pos)
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> >>>> index 11662afa9fe4..d08bda869a24 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> >>>> @@ -121,12 +121,8 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
> >>>>    	frame_info->fb = fb;
> >>>>    	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
> >>>>    	drm_framebuffer_get(frame_info->fb);
> >>>> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation,
> >>>> -						     DRM_MODE_ROTATE_0 |
> >>>> -						     DRM_MODE_ROTATE_90 |
> >>>> -						     DRM_MODE_ROTATE_180 |
> >>>> -						     DRM_MODE_ROTATE_270 |
> >>>> -						     DRM_MODE_REFLECT_X);
> >>>> +	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_MASK |
> >>>> +						     DRM_MODE_REFLECT_MASK);
> >>>
> >>> What are you trying to achieve with that?
> >>
> >> Yeah, seeing it right now I can see that this is not achieving anything.
> >> I will remove it in the next version.
> > 
> > I think using it might still make sense to eg. remove the 180/270
> > cases from your actual rendering code.
> 
> I will remove it on the next version.
> 
> > 
> > I'm also a bit uneasy about all that hand rolled coordinate calculation
> > stuff. Ideally drm_rect_rotate*() should handle all that for you, and
> > make sure the rotate vs. reflect actually get applied in the correct
> > order.
> > 
> 
> At first, I had a similar idea that drm_rect_rotate() would handle all the
> rotation. But, this turn out to be untrue. From what I can see, although
> the drm_rect_rotate() helps by performing the coordinates rotation, we also
> need to change the way the blending occurs. Although the coordinates have
> changed, the vmap stays the same and we will still start reading the vmap
> by the first line (y = 0). That's why we need to change the iteration
> boundaries in the blending loops.
> 
> So, drm_rect_rotate() is a part of the solution, but it is not able to handle
> it completely.
> 
> If you have any suggestions on how to perform the rotation without changing
> the way the blending occurs, I would be glad to hear. Unfortunately, just
> performing drm_rect_rotate() doesn't seem to be a solution.

Dunno how vkms does this currently, but the most straightforward
solution I can think of would be something like this:

struct drm_rect src;

drm_rect_fp_to_int(&src, plane_state->src);

drm_rect_rotate(&src, fb->width, fb->height, rotation);

for (dy = dst->y1; dy < dst->y2; dy++) {
	for (dx = dst->x1; dx < dst->x2; dx++) {
		int _sx = dx - dst->x1 + src.x1;
		int _sy = dy - dst->y1 + src.y1;
		struct drm_rect s;

		drm_rect_init(&s, _sx, _sy, 1, 1);

		drm_rect_rotate_inv(&s, fb->width, fb->height, rotation);

		output_pixel(dx, dy, s.x1, s.y1);
	}
}

-- 
Ville Syrjälä
Intel
