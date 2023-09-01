Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9B578FF6C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 16:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED1610E7F3;
	Fri,  1 Sep 2023 14:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48910E7F3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693579538; x=1725115538;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cq53W5eg/gL7FSBimY3svi1vPDUgqbdF7OBjVw9XHf4=;
 b=exEUmDCVhkSIfgISNfHNjX8Vbk/WKna/8ufaOuK6WMgs6Bs6Lbj6t0Rk
 /kfKgzwf/gSv2aPtyCfGwqAGwSSNK2dTpweb0c0CsgeH2AVqeGv2c81RQ
 uoXy7PizHD96nb1laQfU1n6JTmZT+Lr4W8iZ/72ORlj9ODrrsrUOB25ON
 jp8yo+2aZ2u3CfgHrvoA21x8aQ2gQ84jli6HGsVza8m4Zwe4SWALD6lum
 DB/Pb6JJY/6PIlARhh3RhaoNUnFA2qTbVNPxQaEgkszfowbllWOd+C4Lj
 nHQg75K7HPs4XpZYWM0u9dG+0uXhrxTcgWa5o96udSs6uFkHlyZrxtG60 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366461738"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="366461738"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854726620"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="854726620"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:45:36 -0700
Date: Fri, 1 Sep 2023 16:45:34 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v3 03/11] accel/ivpu: Make ivpu_pm_init() void
Message-ID: <20230901144534.GA4161840@linux.intel.com>
References: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
 <20230901094957.168898-4-stanislaw.gruszka@linux.intel.com>
 <9cbef01f-9887-d7ed-b351-f3fef79bf1fb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cbef01f-9887-d7ed-b351-f3fef79bf1fb@quicinc.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 01, 2023 at 08:22:07AM -0600, Jeffrey Hugo wrote:
> On 9/1/2023 3:49 AM, Stanislaw Gruszka wrote:
> > ivpu_pm_init() does not return any error, make it void.
> > 
> > Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_drv.c | 4 +---
> >   drivers/accel/ivpu/ivpu_fw.c  | 2 +-
> >   drivers/accel/ivpu/ivpu_pm.c  | 4 +---
> >   drivers/accel/ivpu/ivpu_pm.h  | 2 +-
> >   4 files changed, 4 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index 4b344ab614f6..b10b2909f05f 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -551,9 +551,7 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
> >   	if (ret)
> >   		goto err_fw_fini;
> > -	ret = ivpu_pm_init(vdev);
> > -	if (ret)
> > -		goto err_ipc_fini;
> > +	ivpu_pm_init(vdev);
> >   	ret = ivpu_job_done_thread_init(vdev);
> >   	if (ret)
> > diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> > index 9827ea4d7b83..9b6ecd3e9537 100644
> > --- a/drivers/accel/ivpu/ivpu_fw.c
> > +++ b/drivers/accel/ivpu/ivpu_fw.c
> > @@ -78,7 +78,7 @@ static int ivpu_fw_request(struct ivpu_device *vdev)
> >   		}
> >   	}
> > -	ivpu_err(vdev, "Failed to request firmware: %d\n", ret);
> > +	ivpu_err(vdev, "Failed to load firmware: %d\n", ret);
> 
> I feel that this is unrelated to $SUBJECT.  With this dropped or moved to
> where it fits -
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Yes, I supposed to drop this, not sure why it's still there.
Will remove before applying.

Thanks
Stanislaw

