Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2B16D94BC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B20A10EB5E;
	Thu,  6 Apr 2023 11:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F910EB5E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:11:35 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-502208f7cb3so123921a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680779493;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvTlgXTtg2muM6L0bWnwM1nd3k3pfGEtq3SLskOcEH4=;
 b=Q7sbebb1085YqmJMre2lc3cnUIyqmALLCXpED1jXpDlet+AKsLNF++if93FQRKmy0o
 DiUYN18JR3m53dV51E6FzIskatHt8r9nUI9TANyhpyf2BZNRpU6Ff7FOhiwNMCdEou7w
 QDXgKfRjYOFyCloYSJ44VM5YQvngC+yvInI0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680779493;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DvTlgXTtg2muM6L0bWnwM1nd3k3pfGEtq3SLskOcEH4=;
 b=pVWH2vDnYIt4o0g0Kk/Sdkf5SwFoQaNZRWqR8S1kSiQjcM63+ct6XpXSIULMk+4v/I
 lpGzwJP29LyKBfDkbGDPnyDNAVPKWwxjmJPyuZQ5KiFTLQAXlnestHRUrP34DZPfDAqS
 IXc1sV0Ab3NG/Kn7YCfOdDdr1DpLutZMj6q0Z7qJ8WYzISmSOLzb+Q3ff6IqYa/Par0M
 ZVGk7NFnoPf3FXKmlVwC9syInl3OZM1OfCwgdwaU0Dg/UcQlJErq/uhuoDl3qpzaIdD2
 RqQ3USVpTsIzXIbm9M99PotpICDOdC4nw9BxsxmBNzdFXDVsk14mjBmtlDpCqbdRAnQS
 RALg==
X-Gm-Message-State: AAQBX9dXubBi7tQqNC886zza6cJq06i2FHhlvVznPSifD/nf41ZxozZ9
 pkwkleYxGz0ZkPhipo2mNbHz6Q==
X-Google-Smtp-Source: AKy350auhtgCzPObUrGlRmtHRAgcyfLCC/RuuO9vsiy2uaAlw7Q65OjzJxcLE9tG5F5SmSt+4fIuMA==
X-Received: by 2002:a17:906:2d7:b0:949:148d:82c0 with SMTP id
 23-20020a17090602d700b00949148d82c0mr3456530ejk.6.1680779492975; 
 Thu, 06 Apr 2023 04:11:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 mm25-20020a170906cc5900b0093e9fb91837sm680541ejb.76.2023.04.06.04.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:11:32 -0700 (PDT)
Date: Thu, 6 Apr 2023 13:11:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/2] drm/vkms: Drop vkms_connector_destroy() wrapper
Message-ID: <ZC6o4l7tzSIwFTKw@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230406110235.3092055-1-javierm@redhat.com>
 <20230406110235.3092055-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406110235.3092055-2-javierm@redhat.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <melissa.srw@gmail.com>, Marius Vlad <marius.vlad@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 01:02:34PM +0200, Javier Martinez Canillas wrote:
> This helper is just a wrapper that calls drm_connector_cleanup(), there's
> no need to have another level of indirection.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

On both patches:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Aside, would be a nice cleanup to move vkms output stuff (crtc and
connector) over to the drmm_ stuff. The plane already does that.

That should also simplify the multi-output work.
-Daniel

> ---
> 
>  drivers/gpu/drm/vkms/vkms_output.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 991857125bb4..4de6f8ae38be 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -6,14 +6,9 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
>  
> -static void vkms_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = vkms_connector_destroy,
> +	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -- 
> 2.40.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
