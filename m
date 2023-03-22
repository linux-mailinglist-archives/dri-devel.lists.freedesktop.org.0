Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE16C4F18
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 16:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99110E129;
	Wed, 22 Mar 2023 15:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660D110E376
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679497903; x=1711033903;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sl7p9DSQce3gVFXKRJzAZpnFNy9Inir3vFbUAbViegw=;
 b=lQ8RsZqsJTjjikjDUs6p3XsA4EingF5sy8eODd4A2PKKHglABP0k7/fn
 pIKBOblOp/b3OCTnjMiUucggkZ/t6K6RgmIdqqMGSJQcZqlimIai/0h3H
 Ozc1DBjr9ayp1ZhOQYStUF9zNAbaKTKpeYSpols+t6OQOaXST1fNwILNY
 bQBdfpNmAjnW9MgzuYoLi/ohqQZ2iB78tRuZRfpjLDfg8sGHVNVSSgJk9
 6139TYoIJeSppa+xHL33ixRpQ4IVTeFQc1xRWhNqsUDeMnZdNPoxatkUY
 5so1dPSq/IvU5gvgcPSZg82bB4haTKTZJ0Q9/kH3mEyHp19IoG4HNepo6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339276132"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="339276132"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 08:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011386950"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; d="scan'208";a="1011386950"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 08:10:46 -0700
Date: Wed, 22 Mar 2023 16:10:44 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 3/7] accel/ivpu: Do not use SSID 1
Message-ID: <20230322151044.GB2130371@linux.intel.com>
References: <20230322091900.1982453-1-stanislaw.gruszka@linux.intel.com>
 <20230322091900.1982453-4-stanislaw.gruszka@linux.intel.com>
 <78fbafe5-6ae2-89ce-eb36-83c869ff7755@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fbafe5-6ae2-89ce-eb36-83c869ff7755@quicinc.com>
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
Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 08:25:09AM -0600, Jeffrey Hugo wrote:
> On 3/22/2023 3:18 AM, Stanislaw Gruszka wrote:
> > The SSID=1 is used by the firmware as default value in
> > case SSID mapping is not initialized. This allows
> > detecting use of miss-configured memory contexts.
> > The future FW versions may not allow using SSID=1.
> > 
> > Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> > Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_drv.c | 4 ++--
> >   drivers/accel/ivpu/ivpu_drv.h | 5 ++++-
> >   2 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index d9e311b40348..70245cf84593 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -474,8 +474,8 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >   	vdev->hw->ops = &ivpu_hw_mtl_ops;
> >   	vdev->platform = IVPU_PLATFORM_INVALID;
> > -	vdev->context_xa_limit.min = IVPU_GLOBAL_CONTEXT_MMU_SSID + 1;
> > -	vdev->context_xa_limit.max = IVPU_CONTEXT_LIMIT;
> > +	vdev->context_xa_limit.min = IVPU_USER_CONTEXT_MIN_SSID;
> > +	vdev->context_xa_limit.max = IVPU_USER_CONTEXT_MAX_SSID;
> >   	atomic64_set(&vdev->unique_id_counter, 0);
> >   	xa_init_flags(&vdev->context_xa, XA_FLAGS_ALLOC);
> >   	xa_init_flags(&vdev->submitted_jobs_xa, XA_FLAGS_ALLOC1);
> > diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> > index 1b2aa05840ad..ef12a38e06e1 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.h
> > +++ b/drivers/accel/ivpu/ivpu_drv.h
> > @@ -25,7 +25,10 @@
> >   #define PCI_DEVICE_ID_MTL   0x7d1d
> >   #define IVPU_GLOBAL_CONTEXT_MMU_SSID 0
> > -#define IVPU_CONTEXT_LIMIT	     64
> > +/* SSID 1 is used by the VPU to represent invalid context */
> > +#define IVPU_USER_CONTEXT_MIN_SSID   2
> > +#define IVPU_USER_CONTEXT_MAX_SSID   (IVPU_USER_CONTEXT_MIN_SSID + 63)
> 
> The old MAX was 64.  Now the MAX is 65.  I'm guessing the intent is to keep
> the number of valid SSIDs constant (63), but it is unclear if SSID 65 is
> valid for the FW.
> 
> Maybe the commit text could clarify this a bit?

Yes SSID=65 is valid, I'll update the changelog.

Regards
Stanislaw
> 
