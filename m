Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3B4AEFAA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 12:09:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACE010E138;
	Wed,  9 Feb 2022 11:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26CB10E138
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 11:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N4o+LNJaYo3X9fH4YBPRei9jJzogxbgFD0IPNn+FC5s=;
 b=UVtpIO7ukuVPnkgt1MDabbpG74v2Ut9yrwF10lF1ssqq/bYWdOXSWM0XwWuvT1XNNj7SYO
 jMXpduCx/Imw3XAbxOC9/bKN3A5mGNIPbmRd0NSPdMF1QyikvkV26JA2Dhu3qWQPJfFAEQ
 94boUtHrnCq49th+mji6uzMXWyw1qbk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-58qNJOKvPUKIGrlQyHioLQ-1; Wed, 09 Feb 2022 06:09:39 -0500
X-MC-Unique: 58qNJOKvPUKIGrlQyHioLQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 w26-20020adf8bda000000b001e33dbc525cso948729wra.18
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 03:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N4o+LNJaYo3X9fH4YBPRei9jJzogxbgFD0IPNn+FC5s=;
 b=KELtYiNRjznjeJaubEuTvEKSJZMr8HOWCB167oAif3IetMbYWKS8P8v6UgqTeadngI
 NC2NHca3uEFsGl8cSoaHTMFrFqSaeM7GAnl7pdyw2Efk0bMkUBZMnvfUUGNLzdS+EdPr
 0e9GCbZA0+irxOYssexSG+6P7FI/Fx2crqMGGdp8RnuBIN8tGrIQp8kOdqUJ2XdP0Jg+
 mTS0uksx2Ng+CZYKI/0vZgyHs0ROnt5RSQvq/QIC9etuiyAoanjXKjGmzqqWxvpOf+6C
 uI9IiGQkjWCIltGZ8qp5/8rEyVBJZnvl25VwA6APlKpsddzvLM7nfIzxLW2EMeodm9s/
 oXLQ==
X-Gm-Message-State: AOAM530WwuRbDvyCbORjq+esbcNOCuh2E6WKLzEy/QeNHjzzHxORFTCI
 fXg9gbzBXJuy1vI2fDCZHTKKNNQG3r3W6J3yB2pfyGGIp5atEOE/k+s090hwd1RShSqbjTWBndL
 SlfELJH9IgDaJXPphc+M8Pl1+qzH8
X-Received: by 2002:a5d:6888:: with SMTP id h8mr1624177wru.57.1644404978319;
 Wed, 09 Feb 2022 03:09:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDoPHULtn9/QeN9cxKfJa/NBq5uBR0MOWtO02HJst3Wn/rODCXZx/njzQuiRqWSRFEvsDVvA==
X-Received: by 2002:a5d:6888:: with SMTP id h8mr1624160wru.57.1644404978143;
 Wed, 09 Feb 2022 03:09:38 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id r2sm6140234wmq.24.2022.02.09.03.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 03:09:37 -0800 (PST)
Message-ID: <5234738a-fce6-6df1-1200-94ae1ad1f5b9@redhat.com>
Date: Wed, 9 Feb 2022 12:09:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] drm/fb-helper: Clip damage area to written memory
 range
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 sam@ravnborg.org, noralf@tronnes.org
References: <20220206192935.24645-1-tzimmermann@suse.de>
 <20220206192935.24645-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220206192935.24645-5-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/22 20:29, Thomas Zimmermann wrote:
> Write helpers used to mark the complete screen as dirty. This is
> wasteful for writes that only change a small portion of the screen.
> Fix the problem by computing the damaged area from the written
> memory range and perform damage handling accordingly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

>  drivers/gpu/drm/drm_fb_helper.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ae98990c7b66..bed58be1b205 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -754,11 +754,18 @@ EXPORT_SYMBOL(drm_fb_helper_sys_read);
>  ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
>  				size_t count, loff_t *ppos)
>  {
> +	loff_t pos = *ppos;
>  	ssize_t ret;
> +	struct drm_rect damage_area;
>  
>  	ret = fb_sys_write(info, buf, count, ppos);
> -	if (ret > 0)
> -		drm_fb_helper_damage(info, 0, 0, info->var.xres, info->var.yres);
> +	if (ret <= 0)
> +		return ret;
> +

I also like how you cleaned up the error checking here and below
to just return early, instead of checking if ret > 0 to perform
the damage handling.

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

