Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C989D6AD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540110F47A;
	Tue,  9 Apr 2024 10:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajvumatU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7636A10F47A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712657889; x=1744193889;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u2U8gJTN1Y6/tkA6R0gZXY/7BUyF0iITDQkVEsbOAnA=;
 b=ajvumatU/MGHXpxFzrswG24et95j7b6keOdZ/fZQR5C7aXYiYxQ4Sl2P
 nOvISVvROVcRluOdmhT/mMFp9AsviEte7zp4b/gH8/KKvHyzGdBzB5xqy
 genozE5v4FiCkJYzBmVdNIKmvjoqGdR3yO23nczLM7JRgsIkUKG0CP84H
 jt4XfkJ4Lvr1xihRI3pY0XMQIezcj0P3mIYgeiyDDv898L1DiEl+Un795
 XQhmi6vLwITcA+Eq0byKpcchm7ANCUGkdiwUI0/MOlkEaOhD+ZMpBfVqn
 GU6eApbpe0dHFPO0kPD4cadspiJyP5u8dS81ab/5OQn5jjnbEQIlgN3Hy A==;
X-CSE-ConnectionGUID: 0VLk/SsjT/Sbjq+R5WM1lg==
X-CSE-MsgGUID: yhB5gH3bTPmmaXqpPwpiVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7810007"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7810007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:18:08 -0700
X-CSE-ConnectionGUID: LTf4sdfZTz6UbXVmVZS56A==
X-CSE-MsgGUID: qxFEr1dPQ6GxCjqgjB5/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20754976"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:18:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 0/3] drm: Multiple documentation update
In-Reply-To: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
Date: Tue, 09 Apr 2024 13:18:00 +0300
Message-ID: <87msq296w7.fsf@intel.com>
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

On Tue, 09 Apr 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> PATCH 1 and PATCH 2 focus on the rotation property. The rotation property 
> can be challenging to understand, especially when it is combined with 
> reflections. These patches aim to provide clearer explanations and 
> examples to aid in comprehension.
>
> Patch 3 relates to the fourcc property. It includes additional details 
> about block and char_per_block to provide a more comprehensive 
> understanding of this feature.
>
> Regarding PATCH 1, I would appreciate some feedback on the expected 
> behavior. During a recent VKMS refactor, I used drm_rect_rotate as a 
> reference for the rotation. However, during my testing phase, I noticed 
> that the original VKMS implementation interpreted the rotation 
> differently. Therefore, I kindly request that someone validate or 
> invalidate my interpretation before proceeding with the merge.

Did you run 'make htmldocs' and check the results after your changes?
I'm almost certain this botches up the layout.

BR,
Jani.

>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Louis Chauvet (3):
>       drm: drm_blend.c: Add precision in drm_rotation_simplify kernel doc
>       drm: drm_blend.c: Improve drm_plane_create_rotation_property kernel doc
>       drm/fourcc: Add documentation around drm_format_info
>
>  drivers/gpu/drm/drm_blend.c | 57 ++++++++++++++++++++++++++++++++++-----------
>  include/drm/drm_fourcc.h    | 45 +++++++++++++++++++++++++++++------
>  2 files changed, 81 insertions(+), 21 deletions(-)
> ---
> base-commit: e495e523b888a6155f82c767d34c8d712a41ee54
> change-id: 20240327-google-drm-doc-cd275291792f
>
> Best regards,

-- 
Jani Nikula, Intel
