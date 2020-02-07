Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DA1558B9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7616EAB6;
	Fri,  7 Feb 2020 13:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF5E6EAB6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:45:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m16so2716650wrx.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 05:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=W87WpaWUIMWEzf16nCu+kjtH/ULuExTweZWvlCZh9vo=;
 b=KweCKsSYFAeEB8nkF2obgfg6/ji+M1HIeZdvJCMGXICAfr2WhJFKLKFY1ccTotWH5i
 QnIpv+zv4NCsTq9wipeq9t/HGWV8bi2Bv4RjZTg34Xpm3yZNX9e7u7f72C+UYWhe/dm2
 RPbST5HLM1/etiFYjk3X24aJW/pKXWdcu5lmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=W87WpaWUIMWEzf16nCu+kjtH/ULuExTweZWvlCZh9vo=;
 b=X3XVgQosHO9IZzcz1S+BpvYzO6oOgrlDTDwpgvuYblMhzB+hvb6ee7sP0kLCFlZW5I
 s085W3WV+bNYbBUmTQof7p92kGdCOfg428qjKValGAYO48Is38jM/ItUkfuFz1deUvU2
 F3am06HQAD5d67ftbvmLGrUyEraCdl0cOes3b24sVerbfs4gsh4O1K1QIT3kmdHFN8lq
 O7FAQf1szL2a31HeVWlWktGsb+sUSz9jxoGbM+dLVeTYwMq17t6jd5KOO1M539+RjrwZ
 Qg3156rblKCRoRfLVohltGrC1evTB9pNyhQw3IN/WgbVyeTLLBgx2U0zBc27Y/uM82iY
 5Mtw==
X-Gm-Message-State: APjAAAXmSID6dArxJ79PAGbeDRE3Z2LsE0DHtabB8qcDed2GPMxoTnqQ
 9qI0P2Z6MLNla8KZn5Uf4/REDw==
X-Google-Smtp-Source: APXvYqxxNjn3TBVZ2sWHL8lxLoKYhY0lLxey0dpUSCuua134oriUvSkdZsxS7RB5Ee1iiSAGU8jz/g==
X-Received: by 2002:adf:db48:: with SMTP id f8mr4594950wrj.146.1581083138401; 
 Fri, 07 Feb 2020 05:45:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a5sm3399500wmb.37.2020.02.07.05.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:45:37 -0800 (PST)
Date: Fri, 7 Feb 2020 14:45:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/bochs: deinit bugfix
Message-ID: <20200207134536.GC43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
References: <20200207124348.21641-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207124348.21641-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 01:43:48PM +0100, Gerd Hoffmann wrote:
> Check whenever mode_config was actually properly
> initialized before trying to clean it up.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Really need to get managed drm cleanup going ...
-Daniel
> ---
>  drivers/gpu/drm/bochs/bochs_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index cc93ff74fbd8..3a755c911342 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -164,6 +164,9 @@ int bochs_kms_init(struct bochs_device *bochs)
>  
>  void bochs_kms_fini(struct bochs_device *bochs)
>  {
> +	if (!bochs->dev->mode_config.num_connector)
> +		return;
> +
>  	drm_atomic_helper_shutdown(bochs->dev);
>  	drm_mode_config_cleanup(bochs->dev);
>  }
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
