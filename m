Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4E27529F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C4F89D86;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA816E400
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 02:16:47 +0000 (UTC)
Received: from mail-oi1-f198.google.com ([209.85.167.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <koba.ko@canonical.com>) id 1kKuKr-0007Jx-WB
 for dri-devel@lists.freedesktop.org; Wed, 23 Sep 2020 02:16:46 +0000
Received: by mail-oi1-f198.google.com with SMTP id k78so8573933oib.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y8KnY5LD0NHhoP43zjX0d7M1I3RNfGZr68FzzWqbIXA=;
 b=TfX1oN4VyR6D4XduQ/O5nNE827ZaaQ7/gBmYPtj/4scImvNi7bBOeypGI2GeF3HSoV
 pWsjNRyF+wG0YBkppyQX8UlbB+otEDAonuN41SBGQedy8w77bXYBRJvJw0dKjEcSYjSc
 0C6xkygABAAP84yUozXyXT59hOrbW7jQ4jRWs5Fc7+1jcpJNRoM/EWgpL3RHzr/2/ST8
 7x+PqFfKSd9LiMXnGLdsB9m2pAg13Cab2qidI8L6ZfTxb7sn3aimesX8qcng+8bCZbME
 IulpkyJzVzlbV8/jDPqgnhILMcjaKJz814I+6e2MozLjv7ML+1/Bbt6VcnIfggKR42tw
 ZYdw==
X-Gm-Message-State: AOAM533FdVj58YxFD+NYIzpwEAx/8wSC0YAYJwP1nJa6bRoRojMBj1Z1
 4se5+06YpstvfAOW+VRqiCbDyPpdRWiGUy0QaWELs62p5hxvALc3F1YPWw5PfS2Ys0yaCEN/yBH
 qDcLQAmU8SO6UprcG+YwoYTXnZxrIEEBKDjqPZRVW0ap6GyOyi8CbJara6v21DQ==
X-Received: by 2002:a9d:6491:: with SMTP id g17mr4419893otl.326.1600827404800; 
 Tue, 22 Sep 2020 19:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNu3+Q2WaRNqHQicrUqSqPPGJLJGS/Wbrczh0WSxJi0/l5DO7fl633zoEHsWNGUXegasqKvoowP0DcxiurA40=
X-Received: by 2002:a9d:6491:: with SMTP id g17mr4419879otl.326.1600827404471; 
 Tue, 22 Sep 2020 19:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200922065313.4794-1-koba.ko@canonical.com>
 <7231e2199a19aa6c8ecbecf5e80725e2a1aded73.camel@redhat.com>
In-Reply-To: <7231e2199a19aa6c8ecbecf5e80725e2a1aded73.camel@redhat.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Wed, 23 Sep 2020 10:16:33 +0800
Message-ID: <CAJB-X+U0M1YXUyAX2nDxddwwxnPygfkk47PFrFnvERh4fUBxiw@mail.gmail.com>
Subject: Re: [PATCH V4] drm/dp_mst: Retrieve extended DPCD caps for topology
 manager
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Anthony Wong <anthony.wong@canonical.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for the review.
Sorry for that I thought the review tag should be appended by myself.
One thing to confirm with you, will you or I push this patch to drm-misc-next ?

Thanks a lot.

On Wed, Sep 23, 2020 at 2:01 AM Lyude Paul <lyude@redhat.com> wrote:
>
> One last change I realized we should do is print the name of the AUX adapter
> in question. I don't mind just adding that myself before I push it though so
> you don't need to send a respin.
>
> Going to go push this to drm-misc-next, thanks!
>
> On Tue, 2020-09-22 at 14:53 +0800, Koba Ko wrote:
> > As per DP-1.3, First check DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 1,read the DP_DP13_DPCD_REV to
> > get the faster capability.
> > If DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is 0,read DP_DPCD_REV.
> >
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/drm_dp_mst_topology.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > index e87542533640..63f8809b9aa4 100644
> > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > @@ -3686,9 +3686,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct
> > drm_dp_mst_topology_mgr *mgr, bool ms
> >               WARN_ON(mgr->mst_primary);
> >
> >               /* get dpcd info */
> > -             ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd,
> > DP_RECEIVER_CAP_SIZE);
> > -             if (ret != DP_RECEIVER_CAP_SIZE) {
> > -                     DRM_DEBUG_KMS("failed to read DPCD\n");
> > +             ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
> > +             if (ret < 0) {
> > +                     drm_dbg_kms(mgr->dev, "failed to read DPCD, ret %d\n",
> > ret);
> >                       goto out_unlock;
> >               }
> >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Software Engineer at Red Hat
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
