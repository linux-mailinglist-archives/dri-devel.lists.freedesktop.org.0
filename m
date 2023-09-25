Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BBF7ACF79
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 07:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3221A10E1DF;
	Mon, 25 Sep 2023 05:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE87310E1DF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695619755; x=1727155755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QDUrwTkDkQNP8XNXoTAATjBMu17KlACcN1K+rahAc78=;
 b=P4ENwVYfYFTwnKR22zRRnbe9lGTuFChR5I9ywvO8Xb7vy3tdVpdfErO6
 +ZCSg7LhdW5rT7+xpR7F9f7VjjMrfvHnNL3n5x8IzRvuZN/KqPpIdCiNy
 tO6MiyfPZffoKCamN0T3jk1r879Z5V0n5YIP8Big3XGccfVzec8Sa3EoR
 v/3KI6ni1av9jxbNnrC8myQIfxepRL8AqfGDlyjRyEKtlbycPFc5KD4YT
 4NNjOhXbzjab94yQmpqIx8dw83GTKo/zucI5s6dUVtZASrom+cPsegxYb
 2vrnklB/izG07vOuwSqkEcFhTiYzlMqldx9DGSJ7Z7ceBKbgeeAMV3SRO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378439002"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="378439002"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 22:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995238972"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="995238972"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2023 22:29:13 -0700
Date: Mon, 25 Sep 2023 07:29:11 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/ivpu: Add Arrow Lake pci id
Message-ID: <20230925052911.GA846747@linux.intel.com>
References: <20230922132206.812817-1-stanislaw.gruszka@linux.intel.com>
 <910010d3-3bed-ef7f-2420-a284461d30fc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910010d3-3bed-ef7f-2420-a284461d30fc@quicinc.com>
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
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 09:24:08AM -0600, Jeffrey Hugo wrote:
> On 9/22/2023 7:22 AM, Stanislaw Gruszka wrote:
> > Enable VPU on Arrow Lake CPUs.
> > 
> > Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> > Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> > Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> > ---
> >   drivers/accel/ivpu/ivpu_drv.c | 1 +
> >   drivers/accel/ivpu/ivpu_drv.h | 2 ++
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> > index ba79f397c9e8..aa7314fdbc0f 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.c
> > +++ b/drivers/accel/ivpu/ivpu_drv.c
> > @@ -634,6 +634,7 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
> >   static struct pci_device_id ivpu_pci_ids[] = {
> >   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_MTL) },
> > +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_ARL) },
> >   	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
> >   	{ }
> >   };
> > diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> > index 9e8c075fe9ef..03b3d6532fb6 100644
> > --- a/drivers/accel/ivpu/ivpu_drv.h
> > +++ b/drivers/accel/ivpu/ivpu_drv.h
> > @@ -23,6 +23,7 @@
> >   #define DRIVER_DATE "20230117"
> >   #define PCI_DEVICE_ID_MTL   0x7d1d
> > +#define PCI_DEVICE_ID_ARL   0xad1d
> >   #define PCI_DEVICE_ID_LNL   0x643e
> 
> I'm curious, how are these ordered?  Release date?  Doesn't seem like it is
> alphabetical nor numerical by DID.

Yes, it's release date based.

> Not a problem, just something I'd like to know.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Thanks
Stanislaw
