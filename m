Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D689D94E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F8C10E5F4;
	Tue,  9 Apr 2024 12:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Mkp1pZBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4D210E5F4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 12:38:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5300C0010;
 Tue,  9 Apr 2024 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712666308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDC9y8yg1w7TUtcR7cDgK9v1QjlEuUY3vT4zIP9tPKc=;
 b=Mkp1pZBc5NPA8ktwgX7l0wIa2yX3BVpVfn2dD+MBazWv3JwvSjyA9lOBu61J+DKyy+/lRl
 Jj3ZKU44PgeZCXk6Wxv5Dd6vejHxWo7y4IhDevpd4tq/p66svxzZZRhONDFceXhDJN3vOG
 eSn1YBIdcoh1TSqjBnE5eB0HBViKxVeCZdXTnPNWHfMDvi+zlYhWGuDt62DiSuvBn8yZZj
 VVdM1d+cnFSoKBS8Jz4qqY+GkL0WUUScGPIkEgVypd635QGUlt0s2Qa7ODPSOR0CiBkpbg
 7NTZ5vsFtSZ2bAOi9SH6WYMTTaFmad7O+98tR3LRNOr4q/g3c6aKDfk7KIrmmQ==
Date: Tue, 9 Apr 2024 14:38:26 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 0/3] drm: Multiple documentation update
Message-ID: <ZhU2wuD7whR06ijf@louis-chauvet-laptop>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <87msq296w7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msq296w7.fsf@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 09/04/24 - 13:18, Jani Nikula a écrit :
> On Tue, 09 Apr 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > PATCH 1 and PATCH 2 focus on the rotation property. The rotation property 
> > can be challenging to understand, especially when it is combined with 
> > reflections. These patches aim to provide clearer explanations and 
> > examples to aid in comprehension.
> >
> > Patch 3 relates to the fourcc property. It includes additional details 
> > about block and char_per_block to provide a more comprehensive 
> > understanding of this feature.
> >
> > Regarding PATCH 1, I would appreciate some feedback on the expected 
> > behavior. During a recent VKMS refactor, I used drm_rect_rotate as a 
> > reference for the rotation. However, during my testing phase, I noticed 
> > that the original VKMS implementation interpreted the rotation 
> > differently. Therefore, I kindly request that someone validate or 
> > invalidate my interpretation before proceeding with the merge.
> 
> Did you run 'make htmldocs' and check the results after your changes?
> I'm almost certain this botches up the layout.

I did not think about htmldocs. I have a new version ready where the 
layout is fixed. Sorry about that.

I'll wait for more reviews before submitting it.

Thanks,
Louis Chauvet
 
> BR,
> Jani.
> 
> >
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Louis Chauvet (3):
> >       drm: drm_blend.c: Add precision in drm_rotation_simplify kernel doc
> >       drm: drm_blend.c: Improve drm_plane_create_rotation_property kernel doc
> >       drm/fourcc: Add documentation around drm_format_info
> >
> >  drivers/gpu/drm/drm_blend.c | 57 ++++++++++++++++++++++++++++++++++-----------
> >  include/drm/drm_fourcc.h    | 45 +++++++++++++++++++++++++++++------
> >  2 files changed, 81 insertions(+), 21 deletions(-)
> > ---
> > base-commit: e495e523b888a6155f82c767d34c8d712a41ee54
> > change-id: 20240327-google-drm-doc-cd275291792f
> >
> > Best regards,
> 
> -- 
> Jani Nikula, Intel

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
