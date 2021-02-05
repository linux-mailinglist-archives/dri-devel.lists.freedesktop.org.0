Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485503105FD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 08:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A97C6F3ED;
	Fri,  5 Feb 2021 07:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02E86F3ED
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 07:42:24 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id b187so5826360ybg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 23:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aSpfLkF/ij3s2gh42g+FyW7GPnjIVsUi/InXL83F+CI=;
 b=khu5n8zof/YLgW30jVewG+qIYV8ZJBFd+3TICC0xZsJ6LemvfI5SpqmDdgDVaTIgVo
 WSs7urrfCjqegA/eIQIYgFpYToi00Daufg070GieCRsRa9omiZ7LvH/pvwVJKc6SXpER
 VEa+5JHVV/cTKH/c+uWCOCnQoU0p7BjnYsEN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSpfLkF/ij3s2gh42g+FyW7GPnjIVsUi/InXL83F+CI=;
 b=LfKQPwirpuYvxFm3M4hVIRaC/4Fd+96ySs4GRRTaXHZY5VP0WkpF/kei/ymY+47AKr
 rQ7Urya+qyvw/GkQrWp1ku8Z2a+qWTdg4r3tJLTalCK6dLGBo5ZKWXGBDZvIKD+ycdRu
 y+7K3ZJ//emehD3I0NYENEgmsLadbbqb69WO02k4EzNmNY/frxQzVpen958zUpXu8u8R
 InpT90PsiRM+q+6c7As55K4StjgpcM/LfL3/kn68vq3Nd4qjp3lj79CGMfq6umGrrbzy
 hjh6RNvgRJc41Kwh7AxNIgdZ6nYBJ6KbzZunyP5Hlou2z8jv2amZL2hfSc2FpzVnnoVx
 XMew==
X-Gm-Message-State: AOAM533OubZD54JVijesIcF+SbbhpDTPO8pXzqjiaA/QiF+YUHncD7zZ
 JfH1XWG8G6EyfQmaFkd/I7QpVbf3s3c6Aa6vW1AWmg==
X-Google-Smtp-Source: ABdhPJyDulVRWRAk44LiiNIGP31VHgLuAf9nUzaPY0lmq8bt2k5sXfIsCIM+MajnNZMD8VhID1SxvEMTGJYuRp+6AhM=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr4328880ybc.41.1612510943572; 
 Thu, 04 Feb 2021 23:42:23 -0800 (PST)
MIME-Version: 1.0
References: <20200923121320.v3.1.I8693156f555875e5c8342e86ab37ce968dfdd277@changeid>
 <20200923121320.v3.3.I6c917ff82a1d2ae2253a3bd4d750d58879387cac@changeid>
 <a4a9ec24a6d4a646e22fb5c63e285d4d1bb50a0d.camel@redhat.com>
In-Reply-To: <a4a9ec24a6d4a646e22fb5c63e285d4d1bb50a0d.camel@redhat.com>
From: Sam McNally <sammc@chromium.org>
Date: Fri, 5 Feb 2021 18:41:46 +1100
Message-ID: <CAJqEsoBtYCSRvjKWMBKPyHV8StXbxvJQeJB1tfYFbyLfmkpW8g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm_dp_mst_topology: export two functions
To: lyude@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Hans Verkuil <hans.verkuil@cisco.com>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Feb 2021 at 09:03, Lyude Paul <lyude@redhat.com> wrote:
>
> On Wed, 2020-09-23 at 12:13 +1000, Sam McNally wrote:
> > From: Hans Verkuil <hans.verkuil@cisco.com>
> >
> > These are required for the CEC MST support.
> >
> > Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Sam McNally <sammc@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 6 ++----
> >  include/drm/drm_dp_mst_helper.h       | 4 ++++
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index 0d753201adbd..c783a2a1c114 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -62,8 +62,6 @@ struct drm_dp_pending_up_req {
> >  static bool dump_dp_payload_table(struct drm_dp_mst_topology_mgr *mgr,
> >                                   char *buf);
> >
> > -static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
> > -
> >  static int drm_dp_dpcd_write_payload(struct drm_dp_mst_topology_mgr *mgr,
> >                                      int id,
> >                                      struct drm_dp_payload *payload);
> > @@ -1864,7 +1862,7 @@ static void drm_dp_mst_topology_get_port(struct
> > drm_dp_mst_port *port)
> >   * drm_dp_mst_topology_try_get_port()
> >   * drm_dp_mst_topology_get_port()
> >   */
> > -static void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
> > +void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port)
>
> Mhhhhhh-can you think of some way around this? I really don't think it's a good
> idea for us to be exposing topology references to things as-is, the thing is
> they're really meant to be used for critical sections in code where it'd become
> very painful to deal with an mst port disappearing from under us. Outside of MST
> helpers, everyone else should be dealing with the expectation that these things
> can disappear as a result of hotplugs at any moment.
>
> Note that we do expose malloc refs, but that's intentional as holding a malloc
> ref to something doesn't cause it to stay around even when it's unplugged - it
> just stops it from being unallocated.
>
>

Yes, it turns out we won't need this after all.

> >  {
> >         topology_ref_history_lock(port->mgr);
> >
> > @@ -1935,7 +1933,7 @@ drm_dp_mst_topology_get_port_validated_locked(struct
> > drm_dp_mst_branch *mstb,
> >         return NULL;
> >  }
> >
> > -static struct drm_dp_mst_port *
> > +struct drm_dp_mst_port *
> >  drm_dp_mst_topology_get_port_validated(struct drm_dp_mst_topology_mgr *mgr,
> >                                        struct drm_dp_mst_port *port)
> >  {
> > diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> > index c7c79e0ced18..d036222e0d64 100644
> > --- a/include/drm/drm_dp_mst_helper.h
> > +++ b/include/drm/drm_dp_mst_helper.h
> > @@ -754,6 +754,10 @@ drm_dp_mst_detect_port(struct drm_connector *connector,
> >                        struct drm_dp_mst_topology_mgr *mgr,
> >                        struct drm_dp_mst_port *port);
> >
> > +struct drm_dp_mst_port *drm_dp_mst_topology_get_port_validated
> > +(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
> > +void drm_dp_mst_topology_put_port(struct drm_dp_mst_port *port);
> > +
> >  struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct
> > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
> >
> >
>
> --
> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>
> Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email to check
> on my status. I don't bite!
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
