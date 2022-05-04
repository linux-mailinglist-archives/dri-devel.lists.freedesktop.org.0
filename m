Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D49519A39
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26DB10EA1A;
	Wed,  4 May 2022 08:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B0210EA1A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:44:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id m20so1512563ejj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=9yrR8ovN4e3vCdcrotHqbMZyniAFA2hJaExlKiyLR0s=;
 b=eI7jxaZSMLwCY2OAs01SylkNgsWduEeZXZRm5XGuOXNe3dRTvAwu7GDdoryvNkMaWb
 t32vu73C4DTnUYXHeOy15quDXT8YG7pcr94Mu224ZzdLXH7iAmKkJMKZK2OlCzKLnD2w
 moEwaBMKbS7QixK1dbVoRbJ3ewKzg0nKLMboo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=9yrR8ovN4e3vCdcrotHqbMZyniAFA2hJaExlKiyLR0s=;
 b=v2oZEDU7ZVSfIIuQCXRhAm3Ewlwn8cz3AunSwHkxJBSQ34JabBU6L6D5DWrkewe8dL
 XeXvmQoBUW+rqzVh9AtgRTrvMrRV96zgvNvSSQsSTkMn+X7YNllbgF9V/NjtLPxHoZzE
 msM2z2Jm4a8HtZY5lZ040uiJS/wY07wgZxiad2i4W9m3sFCPHdQgPgPPOSdE9jRIU/5Z
 L3Z/VD/mdHXfFCjdw8zU/4I8uQynZZkRXNGdjooHJhcvsAssnGBsSkfRlTrIOPtoV4rG
 7arrfPctJe8CLCijYmgdDCTV77tWrK6A3QSf8fwdgsv9dfxVjE16pAYQH5ps/ND3m/70
 5DIQ==
X-Gm-Message-State: AOAM5334doN+aWhMaGT1dovK0R+w/NWwrU8QSX9i1KhlMEDcrNjFlyol
 5oduoc6wxxCtllAQ5iKi6IhaqD0FiMMhJA==
X-Google-Smtp-Source: ABdhPJwdcKXaclQibk4WK6+dvYH/xaBfefFDYZnwUfRYHtNB0ZZItrraRdczZDB+V/3ZPThwsyl9mw==
X-Received: by 2002:a17:907:d05:b0:6f4:3729:8e36 with SMTP id
 gn5-20020a1709070d0500b006f437298e36mr13907086ejc.475.1651653845541; 
 Wed, 04 May 2022 01:44:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j12-20020aa7de8c000000b0042617ba63b2sm8859632edv.60.2022.05.04.01.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 01:44:05 -0700 (PDT)
Date: Wed, 4 May 2022 10:44:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH] drm: fix typo in comment
Message-ID: <YnI809cYMm1Uo20R@phenom.ffwll.local>
Mail-Followup-To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220426131912.3850354-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426131912.3850354-1-raphael.gallais-pou@foss.st.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 26, 2022 at 03:19:12PM +0200, Raphael Gallais-Pou wrote:
> Fix typo in a doxygen comment (replaced green by blue) in drm_color_mgmt.c
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks for your patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 9079fbe21d2f..17c6c3eefcd6 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -259,7 +259,7 @@ static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
>   * @crtc: CRTC object
>   * @red: red correction table
>   * @green: green correction table
> - * @blue: green correction table
> + * @blue: blue correction table
>   * @size: size of the tables
>   * @ctx: lock acquire context
>   *
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
