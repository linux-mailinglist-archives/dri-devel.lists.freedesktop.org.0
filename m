Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44675778942
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 10:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7210E08B;
	Fri, 11 Aug 2023 08:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0225310E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691743979; x=1723279979;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cCVp2Bnwi6/2FPlKJfCGZTvgDQWpoyP8lmlU37N1zxs=;
 b=c2VjQuExD7UQNbPpwUrjGydk0+aVnxxURRgwf4phwHBvOqR+KTuP+JYa
 9nDsL0SZpYFoJJYpSloCywyfMGN2WhIVEW7dMZjs36Jty+R2gCODlZmW6
 1Z9oG63IKS8pd2pOsTn7niXtUXyJzSLvMUn0UZT161BPTmUOULu0oCxaX
 yrH4N5xlSTd5tYlA99i4BTZQdDygxYAMZDetcmNfIONJLzxUndv4SPOIA
 DRpc10kZz8iFRP7gUWCM5cd8xk078PNwnYuJk5FdcDcJRHsiNUDQ9BvnT
 eLHyaWdjR9bWye/fW8Ebk5euPLxzqiwwz+3fsFSitT8OySjOZUUrTOQ6d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="369102785"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="369102785"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 01:52:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="906364876"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="906364876"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 01:52:40 -0700
Date: Fri, 11 Aug 2023 10:52:38 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
Message-ID: <20230811085238.GC3329046@linux.intel.com>
References: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
 <6bbd1cc5-f85b-2b42-22f9-4fd313a6ebfc@quicinc.com>
 <20230810143244.GB3329046@linux.intel.com>
 <aa7495a6-50b6-908a-ee1f-e9fccb916b3f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa7495a6-50b6-908a-ee1f-e9fccb916b3f@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 08:49:00AM -0600, Jeffrey Hugo wrote:
> On 8/10/2023 8:32 AM, Stanislaw Gruszka wrote:
> > On Thu, Aug 10, 2023 at 08:27:08AM -0600, Jeffrey Hugo wrote:
> > > On 8/10/2023 2:07 AM, Stanislaw Gruszka wrote:
> > > > Add comments regarding new DRM_IVPU_PARAM_CAPABILITIES param.
> > > > 
> > > > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > > > ---
> > > >    include/uapi/drm/ivpu_accel.h | 19 +++++++++++++++++--
> > > >    1 file changed, 17 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> > > > index a58a14c9f222..7d1ecc5bbac3 100644
> > > > --- a/include/uapi/drm/ivpu_accel.h
> > > > +++ b/include/uapi/drm/ivpu_accel.h
> > > > @@ -69,8 +69,21 @@ extern "C" {
> > > >    #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
> > > >    #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
> > > > -#define DRM_IVPU_CAP_METRIC_STREAMER	    1
> > > > -#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
> > > > +/**
> > > > + * DRM_IVPU_CAP_METRIC_STREAMER
> > > > + *
> > > > + * Metric streamer support, provides sampling of various hardware
> > > > + * performance metrics (like DMA bandwidth, cache miss/hits),
> > > > + * can be used for profiling.
> > > 
> > > Feels like this is a run-on sentence.  I think this reads better -
> > > 
> > > Metric streamer support.  Provides sampling of various hardware performance
> > > metrics like DMA bandwidth and cache miss/hits.  Can be used for profiling.
> > > 
> > > What do you think?
> > 
> > Looks better :-)
> 
> Ok.  I guess with that
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Thanks, applied to drm-misc-next

Regards
Stanislaw
