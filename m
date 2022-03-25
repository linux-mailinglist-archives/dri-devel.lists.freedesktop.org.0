Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3462D4E6CD5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 04:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BA610EAE3;
	Fri, 25 Mar 2022 03:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 590 seconds by postgrey-1.36 at gabe;
 Fri, 25 Mar 2022 03:22:49 UTC
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1A210EAE3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 03:22:49 +0000 (UTC)
Date: Fri, 25 Mar 2022 11:12:25 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1648177974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSnl462JoNiMZLMQN3qva88FZOsk+DZtdNDO1IBwIjs=;
 b=m46wG9j+V2PkTxDMurasClQF+bLz1TsSrsR7n5XtoL1WLKKhzLJ9OTw7sizrFxV9GcDAia
 UC9dp6XYq4jIBvDrGBaUK3voc4BzVHsmZJyYD5hvFwGGKHu78QJFhnlpSYBYONgNAqr0sp
 VIEPTwxawOg/0ztDfO2BjxLwY3XlCQo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Cai Huoqing <cai.huoqing@linux.dev>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mm: Fix the param description for 'size' tag
Message-ID: <20220325031225.GA9073@chq-T47>
References: <20220317022631.10570-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220317022631.10570-1-cai.huoqing@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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

On 17 3月 22 10:26:31, Cai Huoqing wrote:
> Using "size of" instead of  "end of" to fix the description for 'size' tag.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
> ---
>  drivers/gpu/drm/drm_mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
> index 8257f9d4f619..c2eedfd264f8 100644
> --- a/drivers/gpu/drm/drm_mm.c
> +++ b/drivers/gpu/drm/drm_mm.c
Ping :)
> @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_mm_scan_color_evict);
>   * drm_mm_init - initialize a drm-mm allocator
>   * @mm: the drm_mm structure to initialize
>   * @start: start of the range managed by @mm
> - * @size: end of the range managed by @mm
> + * @size: size of the range managed by @mm
>   *
>   * Note that @mm must be cleared to 0 before calling this function.
>   */
> -- 
> 2.25.1
> 
