Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B74B66C4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 09:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A796889FEC;
	Tue, 15 Feb 2022 08:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD0B89FEC;
 Tue, 15 Feb 2022 08:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644915521; x=1676451521;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2tcfDxeDAVM/eJu/wovPGYvQnd2sBsEVvR4TYdoGVlQ=;
 b=JxxKMoioi2Ew9izQjAUVO8jHBBI5dJp73IPSKIRwkcAVhm29Mpd1YwnH
 qbA3OwfksiG+hbeSUt8JzEVcQoRnbkD+Pl2ufK5hz+hzo82uRswrw7szT
 MhI6pwbRq6TE36pY/ZRsrYgmujOgAPWpxpY19h0ilXWmd3L7z1p8OcX0O
 oObkwMDy3xyKnbh/KPahFR0qdvjdWyEXS9LxeDypDHK8rTcXAIGz8EzU7
 p73ec2d4DGWBMSxbIpBlmYmMhJz3JJglalrmIj5zTiwTsGzzL7JpOwpyT
 Ws82GsLaKSLwJzoERUZ1mBeLRWX/OHDezXE5XnosVUbGvLn+NTkS/3HOU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="230924962"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="230924962"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 00:58:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="680924474"
Received: from ylian16-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.20.230])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 00:58:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH v3 0/3] Add connector_type to debug info to
 differentiate between eDP and DP
In-Reply-To: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
Date: Tue, 15 Feb 2022 10:58:33 +0200
Message-ID: <87v8xg5ww6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 02 Feb 2022, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> 1) Add connector_type to debug info to differentiate between eDP and DP
> 2) add more debug info to cover dp Phy
> 3) repalce DRM_DEBUG_DP with drm_debug_dp

In the future, please include the drm/msm/dp prefix also in the cover
letter. Thanks.

BR,
Jani.


>
> Kuogee Hsieh (3):
>   drm/msm/dp: add connector type to enhance debug messages
>   drm/msm/dp: enhance debug info related to dp phy
>   drm/msm/dp:  replace DRM_DEBUG_DP marco with drm_dbg_dp
>
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  34 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 116 +++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c | 103 ++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>  drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>  drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>  9 files changed, 283 insertions(+), 187 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
