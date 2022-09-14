Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63535B9714
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 11:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F410EACC;
	Thu, 15 Sep 2022 09:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862810E9E8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 19:26:59 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id k21so5586581pls.11
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 12:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Q8h0EfFmy9ME9NWCOd5pepImjm1NXwHplGPDhrk7Zac=;
 b=YvvHBUvMo5+APTJ0vuQJIk3u2vaBMg0aE+Q7/3s7UXYMx6Kp8ndTE2bsFSBBh45xhF
 oPnIaCZ8KXXIxEOrdVU2k92FYWJbcV6jrDqGrUPXY31huH7qImUJqb9JJmS6e7idvpMr
 gvYCH7KuqN3r9y7eaOWWVgZ2OpfCLyYQ2XqzY8nuD82Ihwi9Jx7l2H8XYLDibXJmw2tH
 nY49trvWLChEbtDBxlo7S1DJ+eRKp3xydkGgWcfh8R3y1uobf0WMLyAxtc1Zw/y6htFQ
 OzY9ep3ltYgRuv2pCSqPcOlcUzK+nDGlv3qzcL5VuPLfK8L9jrDQbW1a73vxFHm9REgS
 pJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=Q8h0EfFmy9ME9NWCOd5pepImjm1NXwHplGPDhrk7Zac=;
 b=qI2jtVtPLwi9VZBH1ejIJ2TlzCGsN241W8ArbwcydEtk+kdVLvD2TjSf07CBVm3M1Q
 /O6mT7/oZsncK5dNmJltv5PNh1NmMpOEMc66vmuaXlZd9XeFGrfxnM9QgF40ID0hOJBi
 ndyV42X2FMY9+UMtJK2vhxxVsdJEJBN0Oh+0fJB7wx5fo94/mn0zXG6Y0nnKbMVGrNba
 XpYiD+Natyp9Ir2Zl1Av2hgOfLXp0qjcodnL7doYGJP4oRDDGLxWiYhgBepAsO1t2qev
 IbvWQ7evoKHrrKdZSnRvO+xjfIWFLkJTFbypfQt/ecTp6wbsUFsiexmzbgHcpL4oohq2
 i5zQ==
X-Gm-Message-State: ACrzQf0fJBBlz5xGOmv2iGNBOEbcjfFrjtF3sSj3ZsHVJQdy9uMQ9U0H
 2CM/bP67TpKa9oC0mAuoMng=
X-Google-Smtp-Source: AMsMyM5eEsEPcXICb+9qrRpuMHh6AEaHYdB5Vuf77d3bjAajvRX5YULa77s2KQMieb/3VrJ3PIIf3w==
X-Received: by 2002:a17:902:c949:b0:178:323f:6184 with SMTP id
 i9-20020a170902c94900b00178323f6184mr536785pla.130.1663183619119; 
 Wed, 14 Sep 2022 12:26:59 -0700 (PDT)
Received: from autolfshost ([2409:4041:d9d:79ec:78cd:7d4c:66f8:5f42])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a170902a40900b00176953f7997sm11055422plq.158.2022.09.14.12.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 12:26:58 -0700 (PDT)
Date: Thu, 15 Sep 2022 00:56:42 +0530
From: Anup K Parikh <parikhanupk.foss@gmail.com>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 skhan@linuxfoundation.org, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH] A simple doc fix
Message-ID: <YyIq8mXKXP1kCoLS@autolfshost>
References: <YyGuwqpuwq+PT3K1@autolfshost>
 <5372b154-dc25-a917-9908-c59555afc865@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5372b154-dc25-a917-9908-c59555afc865@amd.com>
X-Mailman-Approved-At: Thu, 15 Sep 2022 09:11:47 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 14, 2022 at 10:24:36AM -0400, Andrey Grodzovsky wrote:
> 
> On 2022-09-14 06:36, Anup K Parikh wrote:
> > Fix two warnings during doc build which also results in corresponding
> > additions in generated docs
> > 
> > Warnings Fixed:
> > 1. include/drm/gpu_scheduler.h:462: warning: Function parameter or member
> >     'dev' not described in 'drm_gpu_scheduler'
> > 2. drivers/gpu/drm/scheduler/sched_main.c:1005: warning: Function
> >     parameter or member 'dev' not described in 'drm_sched_init'
> > 
> > Signed-off-by: Anup K Parikh <parikhanupk.foss@gmail.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_main.c | 1 +
> >   include/drm/gpu_scheduler.h            | 1 +
> >   2 files changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index 68317d3a7a27..875d00213849 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -994,6 +994,7 @@ static int drm_sched_main(void *param)
> >    *		used
> >    * @score: optional score atomic shared with other schedulers
> >    * @name: name used for debugging
> > + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
> 
> 
> Why multiple GPUs scenario ? It's also used in single GPU scenario.
> 
> Andrey
> 
> 
Hello Mr. Andrey Grodzovsky,

Thanks for the quick review and response.

My documentation string (same for both files) is based on commit id
8ab62eda177bc350f34fea4fcea23603b8184bfd. It seemed that both warnings
might've been introduced by the addition of that device pointer.

Also, the commit message specifically mentions this addition for use with
DRM_DEV_ERROR() to make life easier under a multiple GPU scenario. So, I
used cscope to look for DRM_DEV_ERROR() and then for drm_dev_printk(). I
also checked previous versions of both files and noticed DRM_ERROR() in
drivers/gpu/drm/scheduler/sched_main.c changed to DRM_DEV_ERROR().

Perhaps, I wrongly correlated my cscope/history findings with the commit
message and used absolute wording. I guess that this might be (I usually
avoid absolute wording) useful not only in a single GPU scenario (to print
better standardized messages with dev when available) but also in non-error
printing such as with KERN_NOTICE, KERN_INFO, etc. I'm still not sure if
the added device pointer could be used for something else besides printing.

Please let me know if my understanding is correct and whether I should
change the wording to:

A device pointer - primarily useful for printing standardized messages with
DRM_DEV_ERROR().
> >    *
> >    * Return 0 on success, otherwise error code.
> >    */
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index addb135eeea6..920b91fd1719 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
> >    * @_score: score used when the driver doesn't provide one
> >    * @ready: marks if the underlying HW is ready to work
> >    * @free_guilty: A hit to time out handler to free the guilty job.
> > + * @dev: A device pointer for use in error reporting in a multiple GPU scenario.
> >    *
> >    * One scheduler is implemented for each hardware ring.
> >    */
