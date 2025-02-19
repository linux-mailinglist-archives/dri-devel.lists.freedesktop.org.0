Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E9A3C056
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A9110E800;
	Wed, 19 Feb 2025 13:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="i3ualNyq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC4910E806
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:45:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4396a4d5e3bso51239225e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1739972758; x=1740577558; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DuYKGunih/1L7qghmHwZtUXwVHPv8FTzBZm71QJC0w8=;
 b=i3ualNyqmlIVVDSfy7VSk/wQceyqVhp8mjHj2NNJJrjouhUDIQNd3hCJhgwxez+Atd
 Pe1CT7WLil7ALxwrpQRzD8tUwMEad39ayS2NgatSEdYF9I3/9BmIQU8BBuyzevas/YYF
 i5cGQDylW9/mxdYHh9XMBpchLabAFht+81ZAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972758; x=1740577558;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuYKGunih/1L7qghmHwZtUXwVHPv8FTzBZm71QJC0w8=;
 b=dak6/TcbVUTyAqzadlZ+uJPgMDbcmKYq78Qp6+z0fADGETd+5NiAlF+0GDgNfM0b3W
 d0d03D0aNULcqaznaQ+iHB8ggMwPCF1ZiBHYgj69VsaF4wrByXC1Zej7kVdpLeY8jFax
 k9X3bKa0I5sXaA8tHdqseguW9AFhjEAgunTnOw6JViIUKeutdgONoPKfC3n2NyYxnP+x
 xIHzK9IxiUBHY/DkX1Rnu5QT7H0vQRAR8eDzVzWrwlzDx6fo0OLvLP32uD6StYtaLeiV
 Mma8kHTjZ1q5ohvrc6A7mtGXgUzYGmrOJtWb2Awo0FyghqQMuqrMDc6NFWfU3QkSLUnu
 QDXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5ijVJydP4AwvxOfiYcTpJsLI8D0LBVs0URrU6RxBIfONb4B/HwYa95C+pe2k88ny7tdoyt4DPl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoHyOXpuvlwbj9d4n4VWwr5ltNU9mLyzyqf+n6dAfAay+rDjLS
 IOkgK5psDm3QT6aEDmJQxKD6h470LV8NEoqJtgWBfz2oP5HdB6ARsxsj4x9x2+Q=
X-Gm-Gg: ASbGncv118EdYtPEOUYM/NopHXKnXv2tvhAVKFMM+KVfrT7/B9VVs9mgWu/4Iilup9t
 VIThLYfshPMpjBJHIjKpF+BJ5vGcbOa0mrTw7fIs8vhCCJ8DQUQTe6cSbQ/C7IbxjcblNxA0Ctb
 +3vRhV5p7iJl+/osH7Rs6Qbb2h0HOCfiCca4J/30FkG1vv86npYMvYdz5dN34GKWCvUY4J/UaJf
 XpKHXW9zUJ9meXEpABwt2zyf2CQXuU9zn799WySYtH1bloUFBSQc6So7xRjvxTs7iGoYdOGy6Nu
 1VZrOOP8kZWpX4vwCj4TZjIUu20=
X-Google-Smtp-Source: AGHT+IH4kKKjtDXYSX9scCgOQ16qrB1fFgMinnqkrYVtnqwj+dIRd3oTn+oT0szj9qoO3HIErghv6A==
X-Received: by 2002:a05:600c:1c08:b0:439:608b:c4ad with SMTP id
 5b1f17b1804b1-43999d75759mr34740595e9.3.1739972757953; 
 Wed, 19 Feb 2025 05:45:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439930a9966sm53808365e9.15.2025.02.19.05.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:45:57 -0800 (PST)
Date: Wed, 19 Feb 2025 14:45:55 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 saurabhg.gupta@intel.com, alex.zuo@intel.com,
 joonas.lahtinen@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH 4/4] drm/xe/xe_drm_client: Add per drm client reset stats
Message-ID: <Z7Xgk1YYxVfgL1jn@phenom.ffwll.local>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
 <20250214203757.27895-5-jonathan.cavitt@intel.com>
 <0bda0535-3c83-46ef-b40f-8b2be1ead6cc@ursulin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bda0535-3c83-46ef-b40f-8b2be1ead6cc@ursulin.net>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Feb 18, 2025 at 06:45:30PM +0000, Tvrtko Ursulin wrote:
> 
> On 14/02/2025 20:37, Jonathan Cavitt wrote:
> > Add a counter to xe_drm_client that tracks the number of times the
> > engine has been reset since the drm client was created.
> > 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
> >   drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
> >   3 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> > index f15560d0b6ff..ecd2ce99fd19 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.c
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> > @@ -492,6 +492,8 @@ static void show_blames(struct drm_printer *p, struct drm_file *file)
> >   	client = xef->client;
> > +	drm_printf(p, "drm-client-reset-count:%u\n",
> > +		   atomic_read(&client->reset_count));
> 
> When drm- prefix is used keys have to be agreed in drm-usage-stats.rst.
> Therefore I suggest exploring across different drivers and seeing if anyone
> else would be interested. Maybe people who worked on the DRM common wedged
> event for example.

+1 on standardizing wedge/reset tracking across drivers more. I guess
ideally we could integrate this into one thing to make sure it's
consistently reported across all drivers.
-Sima

> 
> Or in cases when new stats are not universally useful drivers can prefix
> with xe-. We had this discussion recently with some panthor internal memory
> stats.
> 
> Regards,
> 
> Tvrtko
> 
> >   	drm_printf(p, "\n");
> >   	drm_printf(p, "- Exec queue ban list -\n");
> >   	spin_lock(&client->blame_lock);
> > diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> > index d21fd0b90742..c35de675ccfa 100644
> > --- a/drivers/gpu/drm/xe/xe_drm_client.h
> > +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> > @@ -53,6 +53,8 @@ struct xe_drm_client {
> >   	 * Protected by @blame_lock;
> >   	 */
> >   	struct list_head blame_list;
> > +	/** @reset_count: number of times this drm client has seen an engine reset */
> > +	atomic_t reset_count;
> >   #endif
> >   };
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index d9da5c89429e..8810abc8f04a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >   		return -EPROTO;
> >   	hwe = q->hwe;
> > -
> > +#ifdef CONFIG_PROC_FS
> > +	atomic_inc(&q->xef->client->reset_count);
> > +#endif
> >   	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> >   		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
