Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2982458341
	for <lists+dri-devel@lfdr.de>; Sun, 21 Nov 2021 13:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D1E6EA5F;
	Sun, 21 Nov 2021 12:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54486EA2F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 12:18:29 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.171.122]) by smtp.orange.fr with ESMTPA
 id olnZmM9iGMxZuolnamk7Oo; Sun, 21 Nov 2021 13:18:27 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 21 Nov 2021 13:18:27 +0100
X-ME-IP: 86.243.171.122
Subject: Re: [PATCH linux-next] drm/i915/request: Remove unused variables
To: cgel.zte@gmail.com, jani.nikula@linux.intel.com
References: <20211121101309.23577-1-yong.yiran@zte.com.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <80173779-5c91-a56e-6bac-ad4ff7c435f7@wanadoo.fr>
Date: Sun, 21 Nov 2021 13:18:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211121101309.23577-1-yong.yiran@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: airlied@linux.ie, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yong yiran <yong.yiran@zte.com.cn>, rodrigo.vivi@intel.com,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 21/11/2021 à 11:13, cgel.zte@gmail.com a écrit :
> From: yong yiran <yong.yiran@zte.com.cn>
> 
> The clang_analyzer complains as follows:
> drivers/gpu/drm/i915/i915_request.c:2119:2 warning:
> Value stored to 'x' is never read
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: yong yiran <yong.yiran@zte.com.cn>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 820a1f38b271..5e4420f461e9 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -2047,7 +2047,6 @@ void i915_request_show(struct drm_printer *m,
>   {
>   	const char *name = rq->fence.ops->get_timeline_name((struct dma_fence *)&rq->fence);
>   	char buf[80] = "";
> -	int x = 0;
>   
>   	/*
>   	 * The prefix is used to show the queue status, for which we use
> @@ -2079,8 +2078,6 @@ void i915_request_show(struct drm_printer *m,
>   	 *      from the lists
>   	 */
>   
> -	x = print_sched_attr(&rq->sched.attr, buf, x, sizeof(buf));
> -

Seriously?

CJ


>   	drm_printf(m, "%s%.*s%c %llx:%lld%s%s %s @ %dms: %s\n",
>   		   prefix, indent, "                ",
>   		   queue_status(rq),
> 

