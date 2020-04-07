Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B41A10A8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 17:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFABF6E8A7;
	Tue,  7 Apr 2020 15:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14989C55
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 15:51:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 07C9380462;
 Tue,  7 Apr 2020 17:51:56 +0200 (CEST)
Date: Tue, 7 Apr 2020 17:51:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/3] drm/writeback: wire drm_writeback.h to kernel-doc
Message-ID: <20200407155155.GB24075@ravnborg.org>
References: <20200406194746.26433-1-sam@ravnborg.org>
 <20200406194746.26433-4-sam@ravnborg.org>
 <20200407080851.GH3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407080851.GH3456981@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=25-AhOLfAAAA:8
 a=JbJgYhgYaR88VrxWCWoA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=AjGcO6oz07-iQ99wixmX:22 a=dnuY3_Gu-P7Vi9ynLKQe:22
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 10:08:51AM +0200, Daniel Vetter wrote:
> On Mon, Apr 06, 2020 at 09:47:46PM +0200, Sam Ravnborg wrote:
> > drm_writeback.h included a lot of nice kernel-doc comments.
> > Wire it up so the header file is included in the kernel-doc
> > generated documentation.
> > 
> > Added a few simple comments to the two structs so they
> > get picked up by kernel-doc.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Brian Starkey <brian.starkey@arm.com>
> > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Maxime Ripard <mripard@kernel.org>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks. Applied to drm-misc-next and pushed out.

	Sam

> > ---
> >  Documentation/gpu/drm-kms.rst | 3 +++
> >  include/drm/drm_writeback.h   | 9 +++++++++
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> > index e1f685015807..397314d08f77 100644
> > --- a/Documentation/gpu/drm-kms.rst
> > +++ b/Documentation/gpu/drm-kms.rst
> > @@ -397,6 +397,9 @@ Connector Functions Reference
> >  Writeback Connectors
> >  --------------------
> >  
> > +.. kernel-doc:: include/drm/drm_writeback.h
> > +  :internal:
> > +
> >  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
> >    :doc: overview
> >  
> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > index 777c14c847f0..9697d2714d2a 100644
> > --- a/include/drm/drm_writeback.h
> > +++ b/include/drm/drm_writeback.h
> > @@ -15,7 +15,13 @@
> >  #include <drm/drm_encoder.h>
> >  #include <linux/workqueue.h>
> >  
> > +/**
> > + * struct drm_writeback_connector - DRM writeback connector
> > + */
> >  struct drm_writeback_connector {
> > +	/**
> > +	 * @base: base drm_connector object
> > +	 */
> >  	struct drm_connector base;
> >  
> >  	/**
> > @@ -78,6 +84,9 @@ struct drm_writeback_connector {
> >  	char timeline_name[32];
> >  };
> >  
> > +/**
> > + * struct drm_writeback_job - DRM writeback job
> > + */
> >  struct drm_writeback_job {
> >  	/**
> >  	 * @connector:
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
