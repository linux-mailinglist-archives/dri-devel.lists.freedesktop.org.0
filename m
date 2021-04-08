Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24635811C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0766EA86;
	Thu,  8 Apr 2021 10:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676626EA83
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:49:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a4so1628559wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=67+MEKdvuuMmCuXManwso7qCBU9d61GDUt3D3nSdJRI=;
 b=eZ9xAYZzhlN3bvWf644DlpRvCzmAZPi0nNpynvkef1+Qle1fiXDPl9fTbhK0wREdJh
 /8wyYg6JWjy+pE65hERPmb4qHPkSD79TuanL9t2j4dnhCK0OAPYA13niDKuRLReM+M3W
 rfU94T6nxv/HNjaJx5P3LatYYl/ftLIThBx6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=67+MEKdvuuMmCuXManwso7qCBU9d61GDUt3D3nSdJRI=;
 b=fALxSf7aKaKOFU6dIU2toNJDZHba1DFh7TZQ8d97higjsUytBToJReaaT7Jov+BSkv
 KjElAwaVTIvSgRwuxLvavCYtrNiwa8NS2ozJNgZ3xuqgVDRMYkIfEy70wZ5IZ+n3NRbw
 T7HdN3RK0Tqe0oz/XawKH93XLLiVHQ2PXXBT+3s5upQFwgZqnvUwC6MK5B8YGjoFjRGZ
 a9/qWP6zgkCnzKzN+pzTwLx8gtlaBxtvIl4pDrQIuhKAR9EvxQBrxaFgHbsMtNAjos1u
 QTGiIClpxKz1Bgm9FFVyZWGAwT2OdHojZhZEXQv9fXqC+LKVCWS1ik6s8n3dLL/UiGC5
 C6Vg==
X-Gm-Message-State: AOAM532rwrbNwJK1Yl5YvkpL3H3s3Lr8lfBaoMQWp0w6cpvvzsssIrV2
 9AkoLImoRszxKI5gB7rngkDh9A==
X-Google-Smtp-Source: ABdhPJx5Dx4A60v8D/m0vrvrUtVGA0fYNamrAGx3037txALHjxNqc+Py46j1tCroPoMc10toF/BU8w==
X-Received: by 2002:adf:c10a:: with SMTP id r10mr10792914wre.40.1617878994006; 
 Thu, 08 Apr 2021 03:49:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v3sm13108164wmj.25.2021.04.08.03.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:49:53 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:49:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 00/20] drm: Use new DRM printk funcs (like
 drm_dbg_*()) in DP helpers
Message-ID: <YG7fz5UmK/SaoY/U@phenom.ffwll.local>
References: <20210326203807.105754-1-lyude@redhat.com>
 <87blaym8by.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87blaym8by.fsf@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 04:40:33PM +0300, Jani Nikula wrote:
> On Fri, 26 Mar 2021, Lyude Paul <lyude@redhat.com> wrote:
> > Since it's been asked quite a few times on some of the various DP
> > related patch series I've submitted to use the new DRM printk helpers,
> > and it technically wasn't really trivial to do this before due to the
> > lack of a consistent way to find a drm_device for an AUX channel, this
> > patch series aims to address this. In this series we:
> >
> > * Clean-up potentially erroneous usages of drm_dp_aux_init() and
> >   drm_dp_aux_register() so that actual AUX registration doesn't happen
> >   until we have an associated DRM device
> > * Clean-up any obvious errors in drivers we find along the way
> > * Add a backpointer to the respective drm_device for an AUX channel in
> >   drm_dp_aux.drm_dev, and hook it up in every driver with an AUX channel
> >   across the tree
> > * Add a new ratelimited print helper we'll need for converting the DP
> >   helpers over to using the new DRM printk helpers
> > * Fix any inconsistencies with logging in drm_dp_helper.c so we always
> >   have the aux channel name printed
> > * Prepare the various DP helpers so they can find the correct drm_device
> >   to use for logging
> > * And finally, convert all of the DP helpers over to using drm_dbg_*()
> >   and drm_err().
> >
> > Series-wide changes in v2:
> > * Address most checkpatch issues ('most' as in all except for one line
> >   going two chars over 100 in "drm/dp_mst: Pass drm_dp_mst_topology_mgr
> >   to drm_dp_get_vc_payload_bw()" as this was the style in use
> >   previously, and 2 chars over the limit looks nicer then trying to
> >   line-wrap this
> > * Don't rewrap comments
> 
> For anything touching i915, and for merging via whichever tree or branch
> seems best,
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> 
> That said, gut feeling says there will be conflicts before latest
> drm-misc-next and drm-intel-next have been merged to drm-next, and
> drm-next has been backmerged to drm-misc-next and drm-intel-next.
> 
> It just might be a good idea to wait for those (as well as other driver
> feature pulls) to settle, do a topic branch with a common ancestor
> between drm-next and drm-misc-next, apply there, merge the topic branch
> to drm-misc-next, and let all drivers merge the topic branch as
> needed. Due to the timing, otherwise we might have to carry the
> conflicts for quite a while.

I think Dave caught up on pulls to drm-next, so after a backmerge of that
to drm-misc-next I think should be all fine to apply directly, no need for
topic branch.
-Daniel

> 
> BR,
> Jani.
> 
> 
> >
> > Lyude Paul (20):
> >   drm/dp: Fixup kernel docs for struct drm_dp_aux
> >   drm/tegra: Don't register DP AUX channels before connectors
> >   drm/bridge/cdns-mhdp8546: Register DP aux channel with userspace
> >   drm/nouveau/kms/nv50-: Move AUX adapter reg to connector late
> >     register/early unregister
> >   drm/dp: Add backpointer to drm_device in drm_dp_aux
> >   drm/dp: Clarify DP AUX registration time
> >   drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
> >   drm/dp: Pass drm_dp_aux to drm_dp_link_train_clock_recovery_delay()
> >   drm/dp: Pass drm_dp_aux to drm_dp*_link_train_channel_eq_delay()
> >   drm/dp: Always print aux channel name in logs
> >   drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_detect()
> >   drm/dp_dual_mode: Pass drm_device to
> >     drm_dp_dual_mode_set_tmds_output()
> >   drm/dp_dual_mode: Pass drm_device to drm_dp_dual_mode_max_tmds_clock()
> >   drm/dp_dual_mode: Pass drm_device to
> >     drm_dp_dual_mode_get_tmds_output()
> >   drm/dp_dual_mode: Pass drm_device to drm_lspcon_(get|set)_mode()
> >   drm/dp_mst: Pass drm_dp_mst_topology_mgr to drm_dp_get_vc_payload_bw()
> >   drm/dp: Convert drm_dp_helper.c to using drm_err/drm_dbg_*()
> >   drm/dp_dual_mode: Convert drm_dp_dual_mode_helper.c to using
> >     drm_err/drm_dbg_kms()
> >   drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in
> >     drm_dp_mst_handle_up_req()
> >   drm/dp_mst: Convert drm_dp_mst_topology.c to drm_err()/drm_dbg*()
> >
> >  drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   5 +-
> >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   1 +
> >  .../drm/bridge/analogix/analogix-anx6345.c    |   1 +
> >  .../drm/bridge/analogix/analogix-anx78xx.c    |   1 +
> >  .../drm/bridge/analogix/analogix_dp_core.c    |   1 +
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  12 +-
> >  drivers/gpu/drm/bridge/tc358767.c             |   1 +
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   1 +
> >  drivers/gpu/drm/drm_dp_aux_dev.c              |   6 +
> >  drivers/gpu/drm/drm_dp_dual_mode_helper.c     |  68 ++--
> >  drivers/gpu/drm/drm_dp_helper.c               | 181 +++++----
> >  drivers/gpu/drm/drm_dp_mst_topology.c         | 381 +++++++++---------
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 +
> >  .../drm/i915/display/intel_dp_link_training.c |   6 +-
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   3 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     |   7 +-
> >  drivers/gpu/drm/i915/display/intel_lspcon.c   |  17 +-
> >  drivers/gpu/drm/msm/dp/dp_ctrl.c              |   6 +-
> >  drivers/gpu/drm/msm/edp/edp.h                 |   3 +-
> >  drivers/gpu/drm/msm/edp/edp_aux.c             |   5 +-
> >  drivers/gpu/drm/msm/edp/edp_ctrl.c            |   8 +-
> >  drivers/gpu/drm/nouveau/nouveau_connector.c   |  27 +-
> >  drivers/gpu/drm/radeon/atombios_dp.c          |   5 +-
> >  drivers/gpu/drm/tegra/dpaux.c                 |  12 +-
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c              |   5 +-
> >  include/drm/drm_dp_dual_mode_helper.h         |  14 +-
> >  include/drm/drm_dp_helper.h                   |  61 +--
> >  include/drm/drm_dp_mst_helper.h               |   3 +-
> >  include/drm/drm_print.h                       |  20 +-
> >  29 files changed, 478 insertions(+), 384 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
