Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F165347F06
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 18:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353F6EC98;
	Wed, 24 Mar 2021 17:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366B6EC98
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 17:14:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c8so12322787wrq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XkocXCL7QPBswRAkkibCzvQhEtkd5Tq9s+ul+FYND84=;
 b=Wp+jcfx20MhEJn3kmh7DUSV/kgkRF0MjEMWhC948VQJoWEaij2Xcxxw3WsnTJu8TT3
 bvFSPuPo8ewakBvSHSxFpWuZv4lA2t0+B6trgtlBTsBfqB/ipD/+5BvYCdjGT2a1EaX6
 VpTjlQrsh7w4WGPOvZl4E1xX8kTXD7NjJncek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkocXCL7QPBswRAkkibCzvQhEtkd5Tq9s+ul+FYND84=;
 b=mqjGC1x2S3vNvrNl8pTwBtEpgq2mDYvOLztf5YfJFgScPo0GIqsduCLMiS8+7+ZhV/
 H/BedBvdODigYJi0RHuSzGHDWixhSUfouWUEJVHQ6EDV9fGHkJqYmsEMU0R48HoteecN
 cyNgC7PKWIw4GCOyEIO6kpdWh/RIoONEHjhzS3bn1ZfkYQD7Uqo+xJwsTpfrPrlQl+M0
 o7Nc2fekFEEpgw186X2aZHK/uP6MCsMebywwEPVZgHBNZCpll2n4lT+OIMFT7zOM0IyL
 nMWTsol4tcKpH1hPXy/Zu2FMcnIktk36NDxfY+YgMXWYrtFan1ZZByjdleSl8hamEa6+
 kcfg==
X-Gm-Message-State: AOAM532SXZ9hz7u2Juph+FwMBw+JexQ/D71XcbuS6AgnzmjM5W8RRDkE
 lrwKwZwArnh90luVfEyBcJpdLw==
X-Google-Smtp-Source: ABdhPJzmnAetJMaG5iPsgO1zf8wilfjeS8udq/5tvPoV0OF/yIsiIEKu738aGPV8dhuf/i3+JyynKw==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr4783834wrt.115.1616606046872; 
 Wed, 24 Mar 2021 10:14:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x6sm3346370wmj.32.2021.03.24.10.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 10:14:06 -0700 (PDT)
Date: Wed, 24 Mar 2021 18:14:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 65/70] drm/i915: Fix pin_map in scheduler
 selftests
Message-ID: <YFtzXG813YBTCCeK@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-66-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-66-maarten.lankhorst@linux.intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:54PM +0100, Maarten Lankhorst wrote:
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Fixes a commit I'll drop anyway, so didn't bother with this one.
-Daniel

> ---
>  drivers/gpu/drm/i915/selftests/i915_scheduler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_scheduler.c b/drivers/gpu/drm/i915/selftests/i915_scheduler.c
> index f54bdbeaa48b..4c306e40c416 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_scheduler.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_scheduler.c
> @@ -645,7 +645,7 @@ static int __igt_schedule_cycle(struct drm_i915_private *i915,
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
>  
> -	time = i915_gem_object_pin_map(obj, I915_MAP_WC);
> +	time = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>  	if (IS_ERR(time)) {
>  		err = PTR_ERR(time);
>  		goto out_obj;
> -- 
> 2.31.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
