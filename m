Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5409775C2C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 13:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAEB10E059;
	Wed,  9 Aug 2023 11:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B2A10E059
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 11:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691580272; x=1723116272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=o6cxglDItFEBEZmYCrNxz5kLHxD1s2AHDwTCJ0KGK6Y=;
 b=SvVOVUk7lXZZrXyWumZIFXixT+QxZo0suWj+N8wqqzQAn5JITgi9REUh
 gLKY+uPzMgJ6Nc0Q6/M2mWPS+KInje7qDdHkUyOjbnxCZvdnoaduvG4ai
 +UprXKIrTAhQEYY3HYoHXreupu1dBZbmsOuNgnV2zKPHZk7hp7LeVlUsb
 H2G89MSmo47+xbrAkcX9s/x5X77uDSeqqnNgokzYGFgkF6hxgbteot8yW
 Oiqvai3pMEgkz5ofZbL1Ibg4EtMjoj/jdwjyO0TSOtm0QLLiomAB2K8rt
 qs58I5HqJL0/aXCkO8E97TqK1YorpcfJ6sREVBRxG278yWJrqvsZWSYO4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="368552879"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="368552879"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 04:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801715941"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="801715941"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 04:24:30 -0700
Date: Wed, 9 Aug 2023 13:24:28 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 4/6] accel/ivpu: Add param ioctl to identify capabilities
Message-ID: <20230809112428.GB3049188@linux.intel.com>
References: <20230731161258.2987564-1-stanislaw.gruszka@linux.intel.com>
 <20230731161258.2987564-5-stanislaw.gruszka@linux.intel.com>
 <4d8e7269-f6d4-4d1a-8af3-70718adc0647@quicinc.com>
 <20230803083737.GA3023441@linux.intel.com>
 <20230808085219.GA3049188@linux.intel.com>
 <5089f2d7-35fd-ca17-ea8d-77ebd8749927@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5089f2d7-35fd-ca17-ea8d-77ebd8749927@quicinc.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Tue, Aug 08, 2023 at 06:45:51PM -0600, Jeffrey Hugo wrote:
> On 8/8/2023 2:52 AM, Stanislaw Gruszka wrote:
> > On Thu, Aug 03, 2023 at 10:37:37AM +0200, Stanislaw Gruszka wrote:
> > > > Seems like we might want to decide this now, because if we define a iVPU
> > > > specific ioctl as proposed here, but then switch to an Accel-wide mechanism
> > > > later, iVPU is going to be stuck supporting both.
> > > 
> > > For the record, we do not add new ioctl in this patch, we just extend
> > > existing DRM_IOCTL_IVPU_GET_PARAM one.
> > 
> > To avoid confusion, I'll change the topic and commit massage
> > before applying:
> > 
> > accel/ivpu: Extend get_param ioctl to identify capabilities
> > 
> > Add DRM_IVPU_PARAM_CAPABILITIES parameters to get_param ioctl to query
> > driver capabilities. For now use it for identify metric streamer and
> > new dma memory range features. Currently upstream version of intel_vpu
> > does not have those, they will be added it the future.
> 
> This is perhaps slightly better.  I didn't find the original one confusing.
> 
> Seems like no opinions on pushing this up to the framework.  You did point
> out DRM drivers have driver level ones, so carry-on I guess.
> 
> Seems ok to me.  I'd prefer to see some comments in the uapi header
> describing what the DRM_IVPU_CAP_* values mean.  A bit more than "device has
> metric streamer support" - what is metric streamer, and why might userspace
> care?

You have right, this should be documented. I'll send separate patch for
this. 

> However, as a uAPI change, is Oded's Ack not required?  I thought that was
> the rule.

I looked at git log from files in include/uapi/drm/ and seems that individual
driver uAPI changes are up to the driver maintainer for drm misc drivers.

At least there is no NACK from Oded so far :-) so I'm going to apply this,
since want the changes to be merged in 6.6 merge window.

Regards
Stanislaw
