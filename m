Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36419EDF6
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 22:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851E189D87;
	Sun,  5 Apr 2020 20:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7849089D87
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Apr 2020 20:38:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C623180475;
 Sun,  5 Apr 2020 22:38:36 +0200 (CEST)
Date: Sun, 5 Apr 2020 22:38:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v1 3/6] drm/sched: fix kernel-doc in gpu_scheduler.h
Message-ID: <20200405203835.GB5692@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-4-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-4-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=zd2uoN0lAAAA:8 a=MyB9EfPb8k4nnraBYA8A:9 a=Wir6wQGF8Om1h1bK:21
 a=XMuKuJXJIIdsW_dj:21 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mikita Lipski <mikita.lipski@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
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
> ---
>  include/drm/gpu_scheduler.h | 1 +
>  1 file changed, 1 insertion(+)

Committed to drm-misc-next

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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
