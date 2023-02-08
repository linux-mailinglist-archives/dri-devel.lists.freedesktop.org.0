Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDA68EDA3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 12:18:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D94010E74D;
	Wed,  8 Feb 2023 11:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC6D10E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 11:17:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54772B81D47;
 Wed,  8 Feb 2023 11:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85CA9C4339B;
 Wed,  8 Feb 2023 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675855075;
 bh=W+jHaO0cROq4vVeNZVaXt3Zy0zJwl6B2g61Uhefsx0o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pUAfyq0fRC9eQoEh2Lk4HVmMRTIhpTXi9SbIVBV5VFJPPTN8aZZlOow1TUxapGS+m
 aqLst5ascTzTpXp+1smXpzfpjACcovSRh3U2tlw3Tu9SUtL/qNTuwzO2h0BUB8OTMI
 LGJB5nLozVcVHqrbsZVU51BLpv8WT9GTgZ0qodpvqs88+QqHFiMv3YYME4F8EeAA/L
 om9hhTH+Ot7pYkRqAvgVXtAESqSP3A2I49vtsmi0lWAGd2fdAE8vP8QigwHQ/KUR2R
 cbJ5vVglgOd2Srm5MpdFp76hyA52jYO++AYVD1JkBYA6Gp/l3wKN+8gzMeQd+wg917
 J85D9U5kVkJ5Q==
Date: Wed, 8 Feb 2023 12:17:50 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: Fix building pdfdocs
Message-ID: <20230208121750.1b4ac5cd@coco.lan>
In-Reply-To: <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <Y+NnRvQ8X04tuurf@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Akira Yokosawa <akiyks@gmail.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Wed, 8 Feb 2023 11:11:34 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Feb 08, 2023 at 10:29:16AM +0200, Tomi Valkeinen wrote:
> > Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
> > documatation for a few new RGB formats. For some reason these break the  
> 
> s/documatation/documentation/
> 
> > pdfdocs build, even if the same style seems to work elsewhere in the
> > file.
> > 
> > Remove the trailing empty dash lines, which seems to fix the issue.
> > 
> > Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
> > Reported-by: Akira Yokosawa <akiyks@gmail.com>
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>  
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> > ---
> > 
> > Note: the offending patch was merged via drm tree, so we may want to
> > apply the fix to the drm tree also.  
> 
> Sounds good to me. Mauro, could you ack this patch ?

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> >  Documentation/userspace-api/media/v4l/pixfmt-rgb.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > index d330aeb4d3eb..ea545ed1aeaa 100644
> > --- a/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > +++ b/Documentation/userspace-api/media/v4l/pixfmt-rgb.rst
> > @@ -868,7 +868,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-RGBA1010102:
> >  
> >        - ``V4L2_PIX_FMT_RGBA1010102``
> > @@ -909,7 +908,6 @@ number of bits for each component.
> >        - r\ :sub:`4`
> >        - r\ :sub:`3`
> >        - r\ :sub:`2`
> > -      -
> >      * .. _V4L2-PIX-FMT-ARGB2101010:
> >  
> >        - ``V4L2_PIX_FMT_ARGB2101010``
> > @@ -950,7 +948,6 @@ number of bits for each component.
> >        - r\ :sub:`6`
> >        - r\ :sub:`5`
> >        - r\ :sub:`4`
> > -      -
> >  
> >  .. raw:: latex
> >    
> 



Thanks,
Mauro
