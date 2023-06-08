Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03797276F3
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 07:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F5910E13E;
	Thu,  8 Jun 2023 05:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A52210E13E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686203879; x=1717739879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=C6YIdimhhCSqB2aOCNA+4fKVost7ygPqKS7gSVJy1DU=;
 b=hu6hlDeE6ao3lJQEHyR5uRyCq/bZk4kkkW30/PXaTFj/QS9RSiHJeun0
 FkbL4SIy2DB8kDuFbneiF6PSyLr8nqf6bCQd4UH1MZJ8Zic+k8GbMAV6o
 tw20A5FTioeJvoJCMPuZs15OWj3iJEMYQmOsrxSoWqU+xXtAPfB2qifoF
 fNA0+zDkAlFL+BXTt45bVyRMrTZjsdYk7nuVRfc+ZEoa7Abl+yvnlKPTZ
 R4cfaGooyECPfXdK5bHJ211Edy8TmLj+f9R+plGdE07apUZAGVLjXIaY7
 sH/3jiVk0cRkREuyUM7p+X/KTuwn4IQqRxY1Mr4iQvvNZYW4N69VGafk0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354703495"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354703495"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739563409"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="739563409"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:57:56 -0700
Date: Thu, 8 Jun 2023 07:57:54 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH] accel/ivpu: Use struct_size()
Message-ID: <20230608055754.GD324119@linux.intel.com>
References: <0ae53be873c27c9a8740c4fe6d8e7cd1b1224994.1685366864.git.christophe.jaillet@wanadoo.fr>
 <3475be3b-11d5-96fe-6bc4-26d0e3a270df@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3475be3b-11d5-96fe-6bc4-26d0e3a270df@redhat.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 05:58:48PM +0200, Marco Pagani wrote:
> 
> On 2023-05-29 15:28, Christophe JAILLET wrote:
> > Use struct_size() instead of hand-writing it. It is less verbose, more
> > robust and more informative.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: Marco Pagani <marpagan@redhat.com>
Applied to drm-misc-next

Thanks
Stanislaw

> 
> > ---
> >  drivers/accel/ivpu/ivpu_job.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
> > index 3c6f1e16cf2f..0a09bba8da24 100644
> > --- a/drivers/accel/ivpu/ivpu_job.c
> > +++ b/drivers/accel/ivpu/ivpu_job.c
> > @@ -289,15 +289,13 @@ ivpu_create_job(struct ivpu_file_priv *file_priv, u32 engine_idx, u32 bo_count)
> >  {
> >  	struct ivpu_device *vdev = file_priv->vdev;
> >  	struct ivpu_job *job;
> > -	size_t buf_size;
> >  	int ret;
> >  
> >  	ret = ivpu_rpm_get(vdev);
> >  	if (ret < 0)
> >  		return NULL;
> >  
> > -	buf_size = sizeof(*job) + bo_count * sizeof(struct ivpu_bo *);
> > -	job = kzalloc(buf_size, GFP_KERNEL);
> > +	job = kzalloc(struct_size(job, bos, bo_count), GFP_KERNEL);
> >  	if (!job)
> >  		goto err_rpm_put;
> >  
> 
