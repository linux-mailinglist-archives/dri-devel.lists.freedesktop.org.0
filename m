Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC871983E6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFBE6E1F1;
	Mon, 30 Mar 2020 19:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D95D6E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 19:05:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6359520039;
 Mon, 30 Mar 2020 21:05:03 +0200 (CEST)
Date: Mon, 30 Mar 2020 21:05:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v1 5/6] drm/dp_mst: add kernel-doc for
 drm_dp_mst_port.fec_capable
Message-ID: <20200330190501.GD7594@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-6-sam@ravnborg.org>
 <ed9c46fd0274eabd79cc3219ae9b031d32d7b386.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed9c46fd0274eabd79cc3219ae9b031d32d7b386.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=8PAXpj6NHXDAEfU6hg0A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude.

On Mon, Mar 30, 2020 at 11:01:12AM -0400, Lyude Paul wrote:
> On Sat, 2020-03-28 at 14:20 +0100, Sam Ravnborg wrote:
> > Fix kernel-doc warnings for drm_dp_mst_port.fec_capable.
> > This fixed the following warning:
> > drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable'
> > not described in 'drm_dp_mst_port'
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: David Francis <David.Francis@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Mikita Lipski <mikita.lipski@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  include/drm/drm_dp_mst_helper.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/drm/drm_dp_mst_helper.h
> > b/include/drm/drm_dp_mst_helper.h
> > index bf5e65d2303e..d93e628ebc84 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -157,6 +157,10 @@ struct drm_dp_mst_port {
> >  	 */
> >  	bool has_audio;
> >  
> > +	/**
> > +	 * @fec_capable: bool indicating if FEC can be supported
> > +	 * up to that point in the MST network.
> 
> s/network/topology, but I can just fix that locally and push this in just a
> moment. Thanks!
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks for fixing and applying!

Can you also take a look at PATCH 1/6 and if OK provide your s-o-b
that should follow the Co-developed-by: ...
I know the text has seen a few changes but the original source came from
you.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
