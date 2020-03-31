Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8BC198D86
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174366E5A3;
	Tue, 31 Mar 2020 07:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82C46E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:54:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a25so24699223wrd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gvz3GQ1RMEPStxdr13lCEex9B91GOeTShqCsPDnnxQM=;
 b=dSfOZKBl47xF+2V/D8B5DBtvHMfNGGeqS+2Yi8Mv8UE/3FxFiKdwQMpjOPj4Ahx5Bu
 +Gagcce+p8uwM8yll7DZzyGJ7TZNMGc6TjOpQT3sN8dMQlkMC7o/nI6OuSmEGncrffVn
 ewcArP1LYxpH6XSIzJVx2+qwyKwdoWb0BBUqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gvz3GQ1RMEPStxdr13lCEex9B91GOeTShqCsPDnnxQM=;
 b=pRcRZ0LJ/Rc13JpD0C5H1zi3vZjQvqcMYt/beETYpSdd8ThBYT0iOaaUpg+thQS+Df
 EsLvJ9wQAAhaIz4pMByvf3s4stw8CseatpHoD4TkEUJ1f8Z9MF66V7CN217EjOoFEsOU
 98XnO2tJcasLmcEw7UILOGvSg2R7LsiBCBXB8jKOjd5PtDLzKZMIgia0Z/80tiMJdMA7
 4MaxvpE8FvDmxF3HHM/TbILRhSOPOwbFst3o8K+vB0tyUFoW3KRAprK4LEvU2/jqJ+gK
 Pr8YiTQgVunZqfnRuOKxlVOFmmBP7CjZbEBtHAYQOzF112JC1+JFBEP48s8qR7rF2Wr2
 Iv4g==
X-Gm-Message-State: ANhLgQ2ZObpJ3DhupEWFWmMZ69oTtdJQxlQpem3jtX3CuZ2m1xl4bsfX
 8Wc62UPFsj/HMNRPkyekoUgLgw==
X-Google-Smtp-Source: ADFU+vuUQhzSqlT9NlG7iXSgaOr9DEeV8OdGKHKhQBQzklwRJs4jbglZeTnsdKgQnK77e0/4qP27KQ==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr19143796wro.415.1585641251388; 
 Tue, 31 Mar 2020 00:54:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm26525046wrq.33.2020.03.31.00.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:54:10 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:54:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 3/6] drm/sched: fix kernel-doc in gpu_scheduler.h
Message-ID: <20200331075408.GG2363188@phenom.ffwll.local>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-4-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 02:20:22PM +0100, Sam Ravnborg wrote:
> Fix following warning:
> gpu_scheduler.h:103: warning: Function parameter or member 'priority' not described in 'drm_sched_entity'
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Nirmoy Das <nirmoy.das@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Inline struct comments would be really nice here. Otherwise

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/drm/gpu_scheduler.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 26b04ff62676..a21b3b92135a 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -56,6 +56,7 @@ enum drm_sched_priority {
>   *              Jobs from this entity can be scheduled on any scheduler
>   *              on this list.
>   * @num_sched_list: number of drm_gpu_schedulers in the sched_list.
> + * @priority: priority of the entity
>   * @rq_lock: lock to modify the runqueue to which this entity belongs.
>   * @job_queue: the list of jobs of this entity.
>   * @fence_seq: a linearly increasing seqno incremented with each
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
