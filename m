Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FE397757
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 17:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF0489FE3;
	Tue,  1 Jun 2021 15:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EC189FE3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 15:59:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id g204so5296234wmf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 08:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6xFJljKh/VKYCN+Kfygu/s32l1KydCSKLrHBzDgIsUQ=;
 b=XywxzmO4yZbQcU79UNPHabpY1t8vUubLitM8dw8Iw4EjphXsc2INt+OrchZzTrPa2a
 S/zc2fiOSqWR0twOamcSt2lt5SnHh1ife7Q8KrS4EtNdVIuB0pOZK0W41BYSI02sj8A6
 Oz1sJblwRD1EwWaSB3x8QDHhqY8ggB04GiptA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6xFJljKh/VKYCN+Kfygu/s32l1KydCSKLrHBzDgIsUQ=;
 b=EIdeJX2CggzE2oxG8q8FKqrsTO4D9gA206CsAcqIDQpuCnkniBLm9pMNrlc5Mdr8Ow
 fz3PRNjWGPfDvUCG2821IRRo12dZOb8J6eoQWAEmvcnodLBGj9QthVZR/H+tYVVNqxIT
 2aWsPQt+Fe2za7VeRLvcnnoXSUNyoxZXc2Ci4kD/tfAYQNXxLCdfJAA9J45TAdgy4ncd
 r6pZcsJv8MMja7iP2te9UsCmN1XXfj0y0rqjv7RHkpYJKCqT5P3+L3hxSTOoNocXjHQd
 6Dbi6mzM1gUb/agjthjWTV5G+abhG+KDw4cqn1mBtXoT5n9PLhnc+WpP+T29B+pdtwdM
 t5Ig==
X-Gm-Message-State: AOAM530okT1QirOs7OQr0PSvNtOhbk3c3B7vsqinKfx/Hcj0UC1GkrAS
 LNpk4wUj8Zu7byX7Cj/3TOfqE31uc5vj5w==
X-Google-Smtp-Source: ABdhPJwOl6GbgGtBVyVgcwtU2+dqd6SJDoDQuTzDQJYUndfTnlQv2u+DpSWkyHIH6m5ogzvIEy5Wdw==
X-Received: by 2002:a1c:3b42:: with SMTP id i63mr624125wma.62.1622563152736;
 Tue, 01 Jun 2021 08:59:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j101sm4152894wrj.66.2021.06.01.08.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:59:12 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:59:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH] drm/sched: Fix inverted comment for hang_limit
Message-ID: <YLZZTrLH6UDaXe6c@phenom.ffwll.local>
References: <20210528235152.38447-1-alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528235152.38447-1-alyssa.rosenzweig@collabora.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 28, 2021 at 07:51:52PM -0400, Alyssa Rosenzweig wrote:
> The hang_limit is the threshold after which the kernel no longer
> attempts to schedule a job. Its documentation stated the opposite due to
> a typo. Correct the wording to indicate the actual purpose of the field.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Not a drm/scheduler expert myself, but makes more sense than what's there.

Thanks for your patch, pushed to drm-misc-next.
-Daniel

> ---
>  include/drm/gpu_scheduler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 10225a0a3..d18af49fd 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -275,7 +275,7 @@ struct drm_sched_backend_ops {
>   * @pending_list: the list of jobs which are currently in the job queue.
>   * @job_list_lock: lock to protect the pending_list.
>   * @hang_limit: once the hangs by a job crosses this limit then it is marked
> - *              guilty and it will be considered for scheduling further.
> + *              guilty and it will no longer be considered for scheduling.
>   * @score: score to help loadbalancer pick a idle sched
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
