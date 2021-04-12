Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DAF35D252
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 23:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0618972D;
	Mon, 12 Apr 2021 21:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DFC8972D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 21:03:17 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AQheAC670fbcrMD9lGwPXwBDXdLJzesId70hD?=
 =?us-ascii?q?6mlaTxtJfsuE0/20lPMA2hPuzBoXUncsmdePUZPvfVr385lp7Y4NeYqzRQWOgg?=
 =?us-ascii?q?SVBaxr8IeK+VHdMgLk8Oo178xdWoxfLPG1MlRgl8b952CDcuoI+9WM/KC2ieq2?=
 =?us-ascii?q?9R4EcShRd6pi4w1lYzz3LmRKQmB9b6YEKA=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.82,216,1613430000"; d="scan'208";a="502866038"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 23:03:15 +0200
Date: Mon, 12 Apr 2021 23:03:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Outreachy kernel] Re: [PATCH 1/2] gpu: drm: Replace "unsigned"
 with "unsigned int"
In-Reply-To: <CAKMK7uEzf64xB5TLS7VvyLVJmX4MBNnHcr3_n1zDq3hOVAm1Rg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2104122301470.19780@hadrien>
References: <20210412122056.28351-1-fmdefrancesco@gmail.com>
 <20210412122056.28351-2-fmdefrancesco@gmail.com>
 <CAKMK7uEzf64xB5TLS7VvyLVJmX4MBNnHcr3_n1zDq3hOVAm1Rg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel <outreachy-kernel@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Mon, 12 Apr 2021, Daniel Vetter wrote:

> On Mon, Apr 12, 2021 at 2:21 PM Fabio M. De Francesco
> <fmdefrancesco@gmail.com> wrote:
> >
> > Replaced "unsigned with "unsigned int" since the latter is preferred.
> >
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
>
> Nit for the subjects: In drm we generally don't have the gpu prefix,
> but just the level below + what component. So for these two patches it
> would be drm/atomic-helpers: as prefix in the patch summary lines. Can
> you pls adjust that? Patches look good otherwise.

Fabio, you should select the subject line by looking at what others have
done on the same file (git log --oneline file.c).  Different parts of the
kernel have different strategies, so it is better to check every time.

julia


> Thanks, Daniel
>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index f2b3e28d938b..cd748ff61162 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -106,7 +106,7 @@ static int handle_conflicting_encoders(struct drm_atomic_state *state,
> >         struct drm_connector *connector;
> >         struct drm_connector_list_iter conn_iter;
> >         struct drm_encoder *encoder;
> > -       unsigned encoder_mask = 0;
> > +       unsigned int encoder_mask = 0;
> >         int i, ret = 0;
> >
> >         /*
> > @@ -609,7 +609,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >         struct drm_connector *connector;
> >         struct drm_connector_state *old_connector_state, *new_connector_state;
> >         int i, ret;
> > -       unsigned connectors_mask = 0;
> > +       unsigned int connectors_mask = 0;
> >
> >         for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> >                 bool has_connectors =
> > @@ -1478,7 +1478,7 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
> >         struct drm_crtc *crtc;
> >         struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> >         int i, ret;
> > -       unsigned crtc_mask = 0;
> > +       unsigned int crtc_mask = 0;
> >
> >          /*
> >           * Legacy cursor ioctls are completely unsynced, and userspace
> > @@ -2575,7 +2575,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
> >         struct drm_crtc_state *new_crtc_state =
> >                 drm_atomic_get_new_crtc_state(old_state, crtc);
> >         struct drm_plane *plane;
> > -       unsigned plane_mask;
> > +       unsigned int plane_mask;
> >
> >         plane_mask = old_crtc_state->plane_mask;
> >         plane_mask |= new_crtc_state->plane_mask;
> > --
> > 2.31.1
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/CAKMK7uEzf64xB5TLS7VvyLVJmX4MBNnHcr3_n1zDq3hOVAm1Rg%40mail.gmail.com.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
