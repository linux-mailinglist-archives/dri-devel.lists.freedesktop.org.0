Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF958A9B181
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CD310E315;
	Thu, 24 Apr 2025 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Nr4pd4D2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A3F10E315;
 Thu, 24 Apr 2025 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=YjpXgRpWlie3nhUpkIBO8PbIJqJF6f6xuXD5Vo6dKLk=; b=Nr4pd4D2RRdqU3qS
 FoRqDTjUb3bVXqrUZ4Utexrrlomo82+grWdiEb+9+iB7IIvVw51zUGq1eJ61E5cJF5HbXZGc3NGjW
 uONY7rAWk+Ag9Ly0cTZvzj0NdtkWaj++mYLni+mScGQKRQpIOXozGDCv+3Kpq8XuB+n0MKdm+ta8V
 uVhKmqpNHq8YhVI2H06NACBPCai6RkKI1YareY2dRcfj9EGJtUzLAUz05ptxtoUi9wz0FK1In5CIv
 dWNq19qsvCJAEInsyxdXwswM8vf5JKqgdztdkFGgkMD5CKo2oXXOx5PxC3NvLi0CYKEnYrpJbAoAE
 v/As6Gk3CpU0LfrjBw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1u7xts-00Ddmv-1u;
 Thu, 24 Apr 2025 14:50:04 +0000
Date: Thu, 24 Apr 2025 14:50:04 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 alexander.deucher@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/radeon: Remove unused radeon_doorbell_free
Message-ID: <aApPnAA_QLYhNn71@gallifrey>
References: <20250418002117.130612-1-linux@treblig.org>
 <20250418002117.130612-3-linux@treblig.org>
 <ab85b3c9-46cc-4148-9de5-dcaabea130ea@wanadoo.fr>
 <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MrEQ2XGbNho6xd9Um0R6kEEpZBeu0e-97o6-D=juD0gw@mail.gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 14:49:51 up 351 days,  2:03,  1 user,  load average: 0.04, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Alex Deucher (alexdeucher@gmail.com) wrote:
> On Fri, Apr 18, 2025 at 2:18 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > Le 18/04/2025 à 02:21, linux@treblig.org a écrit :
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > >
> > > radeon_doorbell_free() was added in 2013 by
> > > commit 75efdee11b5d ("drm/radeon: implement simple doorbell page
> > > allocator")
> > > but never used.
> >
> > Hi,
> >
> > I think than instead of being removed, it should be used in the error
> > handling path of cik_init() and in cik_fini().
> 
> Yes, ideally.  Care to make a patch to fix that?

I can have a look at that.

Dave

> Thanks,
> 
> Alex
> 
> >
> > CJ
> >
> > >
> > > Remove it.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >   drivers/gpu/drm/radeon/radeon.h        |  1 -
> > >   drivers/gpu/drm/radeon/radeon_device.c | 14 --------------
> > >   2 files changed, 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > > index 8605c074d9f7..58111fdf520d 100644
> > > --- a/drivers/gpu/drm/radeon/radeon.h
> > > +++ b/drivers/gpu/drm/radeon/radeon.h
> > > @@ -686,7 +686,6 @@ struct radeon_doorbell {
> > >   };
> > >
> > >   int radeon_doorbell_get(struct radeon_device *rdev, u32 *page);
> > > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell);
> > >
> > >   /*
> > >    * IRQS.
> > > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> > > index bbd39348a7ab..4127ffb4bb6f 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > > @@ -392,20 +392,6 @@ int radeon_doorbell_get(struct radeon_device *rdev, u32 *doorbell)
> > >       }
> > >   }
> > >
> > > -/**
> > > - * radeon_doorbell_free - Free a doorbell entry
> > > - *
> > > - * @rdev: radeon_device pointer
> > > - * @doorbell: doorbell index
> > > - *
> > > - * Free a doorbell allocated for use by the driver (all asics)
> > > - */
> > > -void radeon_doorbell_free(struct radeon_device *rdev, u32 doorbell)
> > > -{
> > > -     if (doorbell < rdev->doorbell.num_doorbells)
> > > -             __clear_bit(doorbell, rdev->doorbell.used);
> > > -}
> > > -
> > >   /*
> > >    * radeon_wb_*()
> > >    * Writeback is the method by which the GPU updates special pages
> >
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
