Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD082DB976
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 03:54:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096B589C55;
	Wed, 16 Dec 2020 02:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2BF89BA5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:54:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36DF82CF;
 Wed, 16 Dec 2020 03:54:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608087273;
 bh=lWCVVFq1wbxmdUtEm9sHbp+Fi/kTlKfJSAOefeunGjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DivsqCe6nkH4Z6V8RUhBqcFvq3//iNjzrUtjaAtX6cWIl35btIZNBrWE504SV7an/
 Xx3fNMQYZJ5wlXSZqMHXhJzRPNgvB8kjplz6TOnRyjLiJQzDICQGk+9hIYLeyCFAY1
 t83FarBe88EUhD7NLiK6Rp7kC/0mf4av78LuuZN8=
Date: Wed, 16 Dec 2020 04:54:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 15/19] drm/msm: Remove prototypes for non-existing
 functions
Message-ID: <X9l24sND7KFXodtw@pendragon.ideasonboard.com>
References: <20190221103212.28764-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190221103212.28764-16-laurent.pinchart+renesas@ideasonboard.com>
 <20190221103924.GI3451@pendragon.ideasonboard.com>
 <20190313000028.GE891@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313000028.GE891@pendragon.ideasonboard.com>
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
Cc: Liviu Dudau <Liviu.Dudau@arm.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 13, 2019 at 02:00:28AM +0200, Laurent Pinchart wrote:
> On Thu, Feb 21, 2019 at 12:39:24PM +0200, Laurent Pinchart wrote:
> > Forgot to CC Rob, sorry about that.
> 
> Rob, could you take this in your tree ?

Gentle ping.

> > On Thu, Feb 21, 2019 at 12:32:08PM +0200, Laurent Pinchart wrote:
> > > The msm_atomic_state_clear() and msm_atomic_state_free() functions are
> > > declared but never defined. Remove their prototypes.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_drv.h | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > > index 4e0c6c2f9a86..8f0287e75efb 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.h
> > > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > > @@ -240,8 +240,6 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
> > >  			  struct drm_plane_state *new_state);
> > >  void msm_atomic_commit_tail(struct drm_atomic_state *state);
> > >  struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
> > > -void msm_atomic_state_clear(struct drm_atomic_state *state);
> > > -void msm_atomic_state_free(struct drm_atomic_state *state);
> > >  
> > >  int msm_gem_init_vma(struct msm_gem_address_space *aspace,
> > >  		struct msm_gem_vma *vma, int npages);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
