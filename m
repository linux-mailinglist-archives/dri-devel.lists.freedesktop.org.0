Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98C669D4F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 17:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D1810E047;
	Fri, 13 Jan 2023 16:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBC610E047
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8XxBKcDuOtsuk8YVDqT970Sa+mjrDos0+wtBaGSDppc=; b=TOPr6uw4j6MrOL8sxWggUAVibX
 rCJCtezTQSUXaHHq0EKFLwAoUinUag//vM7JJDULlvMeVe6wRmFzMkSVFyuTW/UJAacMpLeYTIGXj
 PTUEUQfZedT7jJIpmEhIITPVrbyAMz1r50hR3Qya+yCICfx7tmAhkYzkk+v2jbvAeGtnwz8FUI8Vb
 UQow9/N5lcuehn3l5c5qWlhzoG+VhR5Kkx1dd3O1BQhxAEmbFJc4Gjs4iwFe8gyFkJfRtq83+6iB4
 cv3lIvjzUf92PT8T9S2JS/8OdFXr6m20LQsp2Psvn3bFhinPxDigd7Z/0ZpwDAG/K9ZqFEGowj88i
 XuaraaHQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pGMd5-007G4D-HZ; Fri, 13 Jan 2023 17:10:07 +0100
Message-ID: <e4aad2af-8286-7a23-3399-14cdbfffc761@igalia.com>
Date: Fri, 13 Jan 2023 13:10:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/vc4: bo: Fix unused variable warning
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20230113154637.1704116-1-maxime@cerno.tech>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230113154637.1704116-1-maxime@cerno.tech>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/23 12:46, Maxime Ripard wrote:
> Commit 07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")
> removed the only user of the ret variable, but didn't remove the

s/user/use

> variable itself leading to a unused variable warning.
> 
> Remove that variable.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 07a2975c65f2 ("drm/vc4: bo: Fix drmm_mutex_init memory hog")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

With that small nit:

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra Canal

> ---
>   drivers/gpu/drm/vc4/vc4_bo.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index 29ce2fa72cc4..c5947ed8cc81 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -395,7 +395,6 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
>   {
>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
>   	struct vc4_bo *bo;
> -	int ret;
>   
>   	if (WARN_ON_ONCE(vc4->is_vc5))
>   		return ERR_PTR(-ENODEV);
