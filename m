Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C813984243
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:34:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88A810E68D;
	Tue, 24 Sep 2024 09:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="B9+ocu2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF48C10E68F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:34:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso12107100a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1727170470; x=1727775270; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7RRWBWG57uA44GUBQrsl15WkC/o180aGwukpCqRC5go=;
 b=B9+ocu2JuwouIbBG7n1rFExomPNwAXuuMK2w89g3LmgC7klGb3vEy4zjgJZlHnscag
 4dfjWhqNtQCZCByRyjQM1rdfPPcyYaCd8n2/PSD72FcR5/hzC+/XhC+/dF4sEwF6cntG
 vTDMBdGPrxSsSBMfldgXAporq/EJbGYp+1+Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727170470; x=1727775270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RRWBWG57uA44GUBQrsl15WkC/o180aGwukpCqRC5go=;
 b=q2w+MxbpoWePA5vSDmCt/5qcG4Mc2x7hFvoA3VQgXUeC2f9BO12inGsrEP0wOpNvp+
 nGiTjQOrZCDXbrklVKbBX5qxrZXz+HLJtqqM9o6Vop1O2uVsPpqq+t8DI7MxskajtKM+
 hgaTkrw0wDVhnMIaryjlI0wCuKfC8qgSxheNZfmgcRA68edl4QFsXQ9axM8ba4o0agdX
 yMHpkVnWhrFS6aaLuHZ7UuSdotlD/7AKcEGoJF7+a2xrElx3jqaAx8/uT/Uw5m2hXFrw
 TmINQTk7LeF/QSqQpQhhVGGSHTMYOuEeRXUcm3wZJgJpl5MoM3x8KB4NWIQR4BSFrUt8
 sETg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8JQmPgKoRbAGcxNEdecYpmQ60Dq5z02x76tYFogXdrqjBa9lip1vybut63CjQCvAONlz505IgQZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj2l9uBenJYKNbAarF+dPQP98Din2L+yK6DYmwNYXkeXLgTYOf
 JbvB3s6lfluRPHiPRsMTiPwG4FMrZmLVOAMzf21LrEDOa8oTe29LAKAaLo6dvr8=
X-Google-Smtp-Source: AGHT+IEOxJA4K3EQDLC2Qw1CU57RkmkkueV4+nPdX+F6ALYfAW9umNjOTw7OR9IAvGlwaRx1iKqULg==
X-Received: by 2002:a17:907:971f:b0:a8a:9243:486 with SMTP id
 a640c23a62f3a-a92c4878f6bmr279763566b.21.1727170470052; 
 Tue, 24 Sep 2024 02:34:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f54141sm62309866b.83.2024.09.24.02.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:34:29 -0700 (PDT)
Date: Tue, 24 Sep 2024 11:34:27 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Don't add write fences to the shared BOs
Message-ID: <ZvKHowqMfvwvHsRl@phenom.ffwll.local>
References: <20240905070155.3254011-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905070155.3254011-1-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 6.10.6-amd64 
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

On Thu, Sep 05, 2024 at 09:01:54AM +0200, Boris Brezillon wrote:
> The only user (the mesa gallium driver) is already assuming explicit
> synchronization and doing the export/import dance on shared BOs. The
> only reason we were registering ourselves as writers on external BOs
> is because Xe, which was the reference back when we developed Panthor,
> was doing so. Turns out Xe was wrong, and we really want bookkeep on
> all registered fences, so userspace can explicitly upgrade those to
> read/write when needed.
> 
> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

fwiw Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 9a0ff48f7061..41260cf4beb8 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3423,13 +3423,8 @@ void panthor_job_update_resvs(struct drm_exec *exec, struct drm_sched_job *sched
>  {
>  	struct panthor_job *job = container_of(sched_job, struct panthor_job, base);
>  
> -	/* Still not sure why we want USAGE_WRITE for external objects, since I
> -	 * was assuming this would be handled through explicit syncs being imported
> -	 * to external BOs with DMA_BUF_IOCTL_IMPORT_SYNC_FILE, but other drivers
> -	 * seem to pass DMA_RESV_USAGE_WRITE, so there must be a good reason.
> -	 */
>  	panthor_vm_update_resvs(job->group->vm, exec, &sched_job->s_fence->finished,
> -				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
> +				DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
>  }
>  
>  void panthor_sched_unplug(struct panthor_device *ptdev)
> -- 
> 2.46.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
