Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CD6BCD722
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB8E10EC1F;
	Fri, 10 Oct 2025 14:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="h2KBJvCQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F71110EC17;
 Fri, 10 Oct 2025 14:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+VhsLPPRitBk5ko9UKTXYdcxMS9zZUcxcVfqzmv8ga0=; b=h2KBJvCQ4x4AFQnOROD78OVyYQ
 bLti6cpIgKn2DQUnsqBiRC3476g8l4XNce95mHF2ZWcx4R9u5twmVKtokRNvN31mIPOXZmidqOde2
 fE5HejelhPlqyzzDvaaQKePmpq+7N0wKy/bVCBPv/pnkFCzJ4mR9Xf+po5UTEs2xd2z96GcVpaq2A
 mY80n6nIgaqkynbDkE2FMlgQDpOqwLEkLWR37MnwTbXZ51++ZzYT69AtW5k0mFqNeTnD1jobsfdp7
 xWf/BbYR3+ZS59sBnEXDEJeh9odI9N6vp8XiCK5ETrVc0C7gxdmM4m91aHyUbln9OIMcxt95Hq1xy
 FYNwg8Gg==;
Received: from [189.6.29.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v7Du9-007uFd-8e; Fri, 10 Oct 2025 16:15:33 +0200
Message-ID: <02343ea2-5065-4edd-8fb6-7a50112d789f@igalia.com>
Date: Fri, 10 Oct 2025 11:15:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/28] drm/v3d: Remove drm_sched_init_args->num_rqs usage
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-27-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20251008085359.52404-27-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 08/10/2025 05:53, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.
Acked-by: Melissa Wen <mwen@igalia.com>
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 0ec06bfbbebb..8978b21d6aa3 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -868,7 +868,6 @@ v3d_queue_sched_init(struct v3d_dev *v3d, const struct drm_sched_backend_ops *op
>   		     enum v3d_queue queue, const char *name)
>   {
>   	struct drm_sched_init_args args = {
> -		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
>   		.credit_limit = 1,
>   		.timeout = msecs_to_jiffies(500),
>   		.dev = v3d->drm.dev,

