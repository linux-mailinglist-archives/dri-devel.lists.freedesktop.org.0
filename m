Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F6E2F32D1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AA06E24E;
	Tue, 12 Jan 2021 14:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128266E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 14:20:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id e25so2287474wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 06:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lRZ3d22RXi2ViyjCaIZIVlAwq5J2EBopCK/yoHar0tk=;
 b=Tnor6WweTI6EMJ3JkUSAheTZoPtMvnhHIrNwk2GPdLYm+l8vUhui0OTuLf3VW2t7Zp
 LmrhMjocBU+y7mPLZkHzqBtelT3BCd/Js5+749EuC9BVTQcRZF3m0dMQyyg4QMYbGqze
 Wp+YMC/JMjblo0QMU4DCnvhZ+mVZmdkN7PQog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lRZ3d22RXi2ViyjCaIZIVlAwq5J2EBopCK/yoHar0tk=;
 b=phnKErPUpPdxzMTL9iGuk9QizT1B/+7O1cfofP6hcjBGxyE/zSooz38oeohd/2JN8K
 wf5cfIfdwPOfm300mtmx4eTtWyEMzV/LTjr182K8C2jSgXgX/ayxymxi/DcGPjtf22TK
 j7E4bNwaJdjgq8zH771mDO6j8Rl88W58akhdWhIVw/pAIssTwhwY5l5OnJjRX0/6nvdY
 NsDTr4MVek8HxHL5aiY90LpChL6cYEmb3g1s3nC6v5xD7oMmP2eo6t8lbH5BdFFtmePm
 lWepQAmkZpu1KZvgtffFP+QqQVJg/HpfaH9fuw55WgYD0W/ooaRZMYuRDqyI/DdrBtkc
 EPag==
X-Gm-Message-State: AOAM531zuQEIGU48Drk+wcVyxGgaTGmy2+56SHLwcatPOxne2mPI9F7h
 Vba5pmWL/RyKUH3Niu+quewCKg==
X-Google-Smtp-Source: ABdhPJy83/7uShpCX8AKV6iHS42oLbgL1kEyg4Xhn+9gXQjSyaPhkB95sv3erSdwA2vZlZOynSSvUQ==
X-Received: by 2002:a1c:a501:: with SMTP id o1mr3840543wme.44.1610461239793;
 Tue, 12 Jan 2021 06:20:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a17sm5486318wrs.20.2021.01.12.06.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:20:38 -0800 (PST)
Date: Tue, 12 Jan 2021 15:20:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
Subject: Re: [PATCH] drm: Improve the output_poll_changed  description
Message-ID: <X/2wNLjupzAS7O5c@phenom.ffwll.local>
Mail-Followup-To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210112104644.341345-1-zhangzhijie@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112104644.341345-1-zhangzhijie@loongson.cn>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 06:46:44PM +0800, ZhiJie.Zhang wrote:
> From: zhangzhijie <zhangzhijie@loongson.cn>
> 
> codeview the implementation of few Drivers.

I'm not really understanding what you're trying to say here.

> this callback was used by drm_kms_helper_hotplug_event()
> 
> Signed-off-by: zhangzhijie <zhangzhijie@loongson.cn>
> ---
>  include/drm/drm_mode_config.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..e01c4d0f07d1 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -104,7 +104,7 @@ struct drm_mode_config_funcs {
>  	 * changes.
>  	 *
>  	 * Drivers implementing fbdev emulation with the helpers can call
> -	 * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
> +	 * drm_kms_helper_hotplug_event() from this hook to inform the fbdev
>  	 * helper of output changes.

I think since we touch this, maybe better to revamp it complete. The best
way to handle all this is by registering a struct drm_client, since that
provides the &drm_client_funcs.hotplug callback. Also for fbdev support
drivers shouldn't even use that, but instead use the
drm_fbdev_generic_setup() function, which takes care of everything.

I think we can also remove the FIXME below, since with the drm_client
infrastructure and the generic fbdev emulation we've resolved this all
very neatly now.

Can you please respin with my suggestions taking into account somehow?

Thanks, Daniel

>  	 *
>  	 * FIXME:
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
