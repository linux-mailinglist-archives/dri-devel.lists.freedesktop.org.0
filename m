Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 475021E109D
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB7189E5F;
	Mon, 25 May 2020 14:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFC689E5F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:35:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c3so13005343wru.12
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3OU2lYvY+SgqrcHfEfITErhSII62zeceqi2ma+ikPJY=;
 b=X1hTfLoD64dbKVoSZ+vwSnV9fWQwb8cTzyukLe5M1BtHLmVBqrtcEIzfnkBf0/IVjB
 25zaYqXUbaLAJ4EW2Wk4l/pEJnYzaZD3uvLuyqHus2MwSc0OITjhfOnFKNAnWUioWLQS
 CpvRiIGR12yq9kOr25XfcmcBgA8J7bVvjwPF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3OU2lYvY+SgqrcHfEfITErhSII62zeceqi2ma+ikPJY=;
 b=ZkIEDVimTTrvx9X5AHDvKWnswFRIIbCOAhiRAm/GtIQ0mA+z6i8571wWBm5LicKBtL
 olHeHRi55t6GO7DKfMqyxjL/3ma3N6PQ8gijtsAaveXRSe1iuNKZyXhEauoEMsXNnn2H
 UgbaY+QrrsQw+crU4Yp28t7HRffHmAKE19CwBfy9YfSLsw3WpN0973VkDd4U7JnKzUiq
 CFPdQlITELW4TOT0SYqkQdex4QYL0ymLFc/fEQsIwxCY8sD9bbMjuCto7fCAMnZCH34j
 vT+MpjqVt8xOl8z8GSVl+pXLN5wUe/dEUt/S9CwjUey2e4CTxkpMBoB/PiWIU6CCzMoJ
 YzPg==
X-Gm-Message-State: AOAM533jN1kX08qzL20DAREw/kVNFw3FjBJ2EA9a9B7bd6IWav0PZvpq
 yxY2ILvpPviNU8Qr6ruafyiOCZdRog0=
X-Google-Smtp-Source: ABdhPJwBXEHr/oPTzKNcxF+wDGOoNbeb15FlnUtmBXIYPHPQJpdKoGoFjeAH8PP4KrvL6dakayuN5g==
X-Received: by 2002:a5d:56c7:: with SMTP id m7mr15249258wrw.256.1590417341101; 
 Mon, 25 May 2020 07:35:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i3sm13285293wrm.83.2020.05.25.07.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:35:40 -0700 (PDT)
Date: Mon, 25 May 2020 16:35:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] drm/auth: remove redundant assignment to variable
 ret
Message-ID: <20200525143538.GH206103@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200524222715.27305-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200524222715.27305-1-colin.king@canonical.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 24, 2020 at 11:27:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued up, but probably for 5.9. Thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 800ac39f3213..74ce0c29c960 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -282,7 +282,7 @@ static void drm_drop_master(struct drm_device *dev,
>  int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_priv)
>  {
> -	int ret = -EINVAL;
> +	int ret;
>  
>  	mutex_lock(&dev->master_mutex);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
