Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BE92F7DA4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C576E40A;
	Fri, 15 Jan 2021 14:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C2B6E40A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:06:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a12so9376461wrv.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=UPMlJO4UTyJchtTDyOaRwmLeb/v0M+Q+kKVn0zhDYy4=;
 b=b7dTXqm7YcuokeqHifpnNRd94kbQAZo0jyg/IaPVC9bajGq92qNPy2m4f0Pf33hq8j
 AaAIRG+QTlBjNb1CiA2RW02MzhEvKXtN6hreJ3gx0yW/otTXkHXNwhrX+9jQfOGwyr/z
 nP1z9em+MC7fDaYEafcK3aEljTVRj1JWu4dfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=UPMlJO4UTyJchtTDyOaRwmLeb/v0M+Q+kKVn0zhDYy4=;
 b=Oq6kbJnkeJu/kJ2PvrxU4OMsST+mPKpJJZrUcVkgJ4AH9wn25V4VXy1nooI1JJLE5M
 eVjKDBJcWZ312tReKa/Vh6QxHjRwPWyDfC1AGy6ymusXplte3/pVcW6/IArsrk+xKEfS
 BuKk0jSy+40HMoaxouWLmajhKLeL4IT6Jqou2tv2Cbl/O0PZYcQi9qYz4vBFRFoy+Fa1
 CWb5tJXEXqM4RQMqDoVW3PZGUxZxxdH7H0er8Bax7vgp2tjppXJmOJqou1iBmlgkeA3x
 mYC9OXMCZDUz41fl/iMhT+6gSAnPo/6abG7zAYFJN4UV4ZwbdOTcE27qlJL4XYKSJj35
 4+1A==
X-Gm-Message-State: AOAM5300Y0CnbMiq7bjql7xRKh+4wHl6vjQcD28YDQw/UJPSbM5baAqk
 yQQh1YnyBtJJycq0wyajDTaLQA==
X-Google-Smtp-Source: ABdhPJxW1WgQpSNdRjSyFIn+j2kGkas48b58kNNX4M1ZvcdRga9YAe1posPH9U9hdlysMaufwXPBMQ==
X-Received: by 2002:adf:e54a:: with SMTP id z10mr13647251wrm.1.1610719561768; 
 Fri, 15 Jan 2021 06:06:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b13sm14234499wrt.31.2021.01.15.06.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:06:01 -0800 (PST)
Date: Fri, 15 Jan 2021 15:05:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
Subject: Re: [PATCH v2] drm: Improve the output_poll_changed description
Message-ID: <YAGhRz0ac6GDBFDI@phenom.ffwll.local>
Mail-Followup-To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210115033328.1799514-1-zhangzhijie@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115033328.1799514-1-zhangzhijie@loongson.cn>
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

On Fri, Jan 15, 2021 at 11:33:28AM +0800, ZhiJie.Zhang wrote:
> From: zhangzhijie <zhangzhijie@loongson.cn>
> 
> this callback was used by drm_kms_helper_hotplug_event()
> 
> V2: (Thanks for Daniel's suggestions)
> - remove the FIXME below.since with the drm_client
> - infrastructure and the generic fbdev emulation we've
> - resolved this all very neatly now.
> 
> Signed-off-by: zhangzhijie <zhangzhijie@loongson.cn>
> Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
> ---
>  include/drm/drm_mode_config.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index ab424ddd7665..50541980f7f2 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -104,13 +104,8 @@ struct drm_mode_config_funcs {
>  	 * changes.
>  	 *
>  	 * Drivers implementing fbdev emulation with the helpers can call
> -	 * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
> +	 * drm_kms_helper_hotplug_event() from this hook to inform the fbdev

Hm I looked at this again, and this change is actually wrong. Both
functions exists, but calling drm_kms_helper_hotplug_event() from this hook
would result in an endless loop until we crash somewhere.

>  	 * helper of output changes.

Ah I meant not just removing this, but explaining what to do now instead.
Suggestion:

	 * This hook is deprecated, drivers should instead use
	 * drm_fbdev_generic_setup() which takes care of any necessary
	 * hotplug event forwarding already without further involvement by
	 * the driver.

Can you pls respin, with the function change dropped and the fixme
replaced with the above?

Thanks, Daniel


> -	 *
> -	 * FIXME:
> -	 *
> -	 * Except that there's no vtable for device-level helper callbacks
> -	 * there's no reason this is a core function.
>  	 */
>  	void (*output_poll_changed)(struct drm_device *dev);
>  
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
