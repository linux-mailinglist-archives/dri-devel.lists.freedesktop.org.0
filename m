Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62350777ACA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAAE810E1A4;
	Thu, 10 Aug 2023 14:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7AE10E1A4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691677968; x=1723213968;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4QpmRJGx3DgpyGJJUgsvoiDNPeYcRzKtnHnrpoPL8gg=;
 b=lp3RS5SgFqSWP2IGPC95ilqQO4Me2T94U2BwIHyIUI5CagJE09Sw9o1N
 SCSWkvnIYqMJau4DnatY4XaRSDod0MiOG8lLVWkVOL0XXoOyBOr5ZifHY
 cWrBk2+R6jKa+3UStpfLjz9qMSBqlROjVz2rEEDrDp+qK7Tok3FJDg1s1
 KiW1A+fEduMGx3ryJZcPsqt6C1ctZnju4JGnewyI63NK378sFGVYUKHWR
 siR118qfs4SMJ2oaVO0EfCaCUbTrg3Es1OPGM1k3496TdpcE7qy2zmIQB
 TJbdiYi/nS0wb7hJL9TCynp33ApXApLX3KJGE3Jv4TSJ6WJwwE3lswlmF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361555670"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="361555670"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 07:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802238002"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="802238002"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 07:32:46 -0700
Date: Thu, 10 Aug 2023 16:32:44 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/ivpu: Document DRM_IVPU_PARAM_CAPABILITIES
Message-ID: <20230810143244.GB3329046@linux.intel.com>
References: <20230810080707.3545883-1-stanislaw.gruszka@linux.intel.com>
 <6bbd1cc5-f85b-2b42-22f9-4fd313a6ebfc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bbd1cc5-f85b-2b42-22f9-4fd313a6ebfc@quicinc.com>
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

On Thu, Aug 10, 2023 at 08:27:08AM -0600, Jeffrey Hugo wrote:
> On 8/10/2023 2:07 AM, Stanislaw Gruszka wrote:
> > Add comments regarding new DRM_IVPU_PARAM_CAPABILITIES param.
> > 
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   include/uapi/drm/ivpu_accel.h | 19 +++++++++++++++++--
> >   1 file changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
> > index a58a14c9f222..7d1ecc5bbac3 100644
> > --- a/include/uapi/drm/ivpu_accel.h
> > +++ b/include/uapi/drm/ivpu_accel.h
> > @@ -69,8 +69,21 @@ extern "C" {
> >   #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS	    2
> >   #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
> > -#define DRM_IVPU_CAP_METRIC_STREAMER	    1
> > -#define DRM_IVPU_CAP_DMA_MEMORY_RANGE       2
> > +/**
> > + * DRM_IVPU_CAP_METRIC_STREAMER
> > + *
> > + * Metric streamer support, provides sampling of various hardware
> > + * performance metrics (like DMA bandwidth, cache miss/hits),
> > + * can be used for profiling.
> 
> Feels like this is a run-on sentence.  I think this reads better -
> 
> Metric streamer support.  Provides sampling of various hardware performance
> metrics like DMA bandwidth and cache miss/hits.  Can be used for profiling.
> 
> What do you think?

Looks better :-)

Thanks
Stanislaw

