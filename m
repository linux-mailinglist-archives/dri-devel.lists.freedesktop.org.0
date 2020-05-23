Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6161DF556
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 08:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4896E0A6;
	Sat, 23 May 2020 06:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F0F6E0A6
 for <dri-devel@lists.freedesktop.org>; Sat, 23 May 2020 06:54:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A356C20027;
 Sat, 23 May 2020 08:54:14 +0200 (CEST)
Date: Sat, 23 May 2020 08:54:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH] drm/vblank: Fix -Wformat compile warnings on some arches
Message-ID: <20200523065412.GA1591726@ravnborg.org>
References: <20200521204647.2578479-1-lyude@redhat.com>
 <20200521210924.GA1056842@ravnborg.org>
 <7db8ff3ee32bddfb6f82760468caa86388bee9bd.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7db8ff3ee32bddfb6f82760468caa86388bee9bd.camel@redhat.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=SkMT5Nvf8EpqA8CG8aMA:9 a=CjuIK1q_8ugA:10
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude.

> > > *dev, unsigned int pipe,
> > >  
> > >  	DRM_DEBUG_VBL("updating vblank count on crtc %u:"
> > >  		      " current=%llu, diff=%u, hw=%u hw_last=%u\n",
> > > -		      pipe, atomic64_read(&vblank->count), diff,
> > > +		      pipe, (unsigned long long)atomic64_read(&vblank->count),
> > > diff,
> > >  		      cur_vblank, vblank->last);
> > 
> > While touching this you could consider introducing drm_dbg_vbl().
> > An maybe as a follow-up patch replace all logging in this file with the drm_*
> > variants.
> 
> ok - no promises when I can actually get to this though, I've got a lot on my
> plate ATM

I wnet ahead and applied this patch (after fixing a too long line),
and then I updated the logging functions as suggested above.
I applied the patch to drm-misc-next.

Patches with updated logging coming.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
