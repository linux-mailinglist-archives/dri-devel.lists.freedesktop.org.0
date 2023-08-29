Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6130B78C319
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D3210E219;
	Tue, 29 Aug 2023 11:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118F810E219
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 11:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693307356; x=1724843356;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zk48XnzLI45QjFGV4yFzRO1caD/+FUs+/HoI+MM+GJs=;
 b=OY8brQFQ/3Wtzz7I1Kd5pKr3i4ML8hOkOUvP9PVfNgeZDUP4+YnM7W/j
 lodIBf6i8iTThiXCSrNBD79amEd1D2soiM3PLDOc/0bjRhAEbAT5ErQ3q
 vcqv/BcISsamZ+vKnsYI9TEMlajbkT5+fXYm5M9qF25cUg4Ai5klPz5ey
 +IoGuRbG50ooqgYrOT4/umr9EfGabdI5Q/JoNv00WWcAASl5Cn6b1kFJw
 /DYGk8XGRtX8fUv9xzNR8jfuRuuiWl8xiSPgkq0iVT6AY0Kutwrhf0Fsw
 d0YrwT5hOmwB3SZo0ubwS0s7OX5wlOJyO1pDEhwQS7agyZf9cfyKaSxPk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355661464"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="355661464"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853238574"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="853238574"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:09:15 -0700
Date: Tue, 29 Aug 2023 13:09:13 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 2/9] accel/ivpu: Remove duplicated error messages
Message-ID: <20230829110913.GA4086697@linux.intel.com>
References: <20230828094736.4137092-1-stanislaw.gruszka@linux.intel.com>
 <20230828094736.4137092-3-stanislaw.gruszka@linux.intel.com>
 <0b1f3c3a-cb46-fcce-2423-d8a4df852d69@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b1f3c3a-cb46-fcce-2423-d8a4df852d69@quicinc.com>
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

On Mon, Aug 28, 2023 at 02:41:50PM -0600, Jeffrey Hugo wrote:
> >   	ivpu_pm_enable(vdev);
> > @@ -651,10 +625,8 @@ static int ivpu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >   	pci_set_drvdata(pdev, vdev);
> >   	ret = ivpu_dev_init(vdev);
> > -	if (ret) {
> > -		dev_err(&pdev->dev, "Failed to initialize VPU device: %d\n", ret);
> > +	if (ret)
> >   		return ret;
> > -	}
> 
> Commit text doesn't mention anything about this change.

Will add to commit message info about this.


> >   	ret = drm_dev_register(&vdev->drm, 0);
> >   	if (ret) {
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
> Commit text doesn't mention anything about this.  Nor do I understand it as
> this function doesn't load the firmware.

I'll remove this change.

> Everything below this point seems to be not related to $SUBJECT and feels
> like should be a separate patch.

I'll add to commit massage that we also add missed prints 
in functions called from ivpu_dev_init().

And for remaining changes I'll prepare separate patches,
one for ivpu_mmu_context.c context and one for ivpu_pm_init().

Thanks
Stanislaw
