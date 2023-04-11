Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A026DDE55
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9891110E281;
	Tue, 11 Apr 2023 14:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C886710E281
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:43:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2ef2d5c92f5so643610f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681224234;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bFrLw6zphVlz4pdr5/y9hU7mKuJn6EFgXAarb/1MgNg=;
 b=ZvwZhETovVk3TNd1NTc1Ua8qAcJSs/foIRtPU+hMn5Q7FURVX3wJ4Fd+t7q3IFFrba
 H1xdsCS1OSNc5YLTm3tftfl++EViYGf6qVGUDhKKuwZ7Y8T1iHzERzuLGwlkbXxAXUPE
 7oY0oKhiwLnCPPLnol2/uQ4Q6L0mQ80dsmFmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224234;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bFrLw6zphVlz4pdr5/y9hU7mKuJn6EFgXAarb/1MgNg=;
 b=6YHpbUEhJNwqyGVgkV6MxmkN7zatspLsQycc5cWkGFlRFd4dm3UL1EEsY0WJdy/85h
 Bj1MVyTZv3GpjTOYuFhfr5hwdMEW/9IWpNv7AzwC+jTFqiYhA4cpgBzftUBfNvTbSmzi
 iciyE+WbyvywZZzDGXleEoajsfVH7YWxRLcPELw9wa9VeGt7MV3JcARP9fb62VUaty9c
 G/PvuBnsOfzP5Tdb4gw9j4f/avXPLBZZQSCpmy+5uKK/lR1MVwcEtCG9k+pz+LFLSqeR
 7lhloWwdPzFcxvLrPP6kGcNoOq0irwz5gBQOeqCcGtMvLKjbuRqLgrl3e8wXv8IQMkND
 UI8A==
X-Gm-Message-State: AAQBX9f+Ha16KMhaxxNzgEp2ky6Zx5QDeFCN4yJ8N24hBwbTGbC2Kc/6
 S1oMI/NH6150ZOlUnsbbd2PPVw==
X-Google-Smtp-Source: AKy350YfCjAzBtozcHyDcYRR5tTo5Fu2xDGWfVpf+b9HpvPB8lFaCOrEdiiGsq5gGvLyZ2MSv4KFhQ==
X-Received: by 2002:a05:600c:4408:b0:3ed:793d:9dd6 with SMTP id
 u8-20020a05600c440800b003ed793d9dd6mr8083422wmn.1.1681224233907; 
 Tue, 11 Apr 2023 07:43:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c214700b003eb966d39desm17370123wml.2.2023.04.11.07.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:43:53 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:43:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH] drm/drm_plane.h: fix grammar of the comment
Message-ID: <ZDVyJ4AQLW7deNhH@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <15330273260@189.cn>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
References: <20230409131547.494128-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409131547.494128-1-15330273260@189.cn>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 09, 2023 at 09:15:47PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Applied to drm-misc-next, thanks

> ---
>  include/drm/drm_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 51291983ea44..79d62856defb 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -56,7 +56,7 @@ struct drm_plane_state {
>  	/**
>  	 * @crtc:
>  	 *
> -	 * Currently bound CRTC, NULL if disabled. Do not this write directly,
> +	 * Currently bound CRTC, NULL if disabled. Do not write this directly,
>  	 * use drm_atomic_set_crtc_for_plane()
>  	 */
>  	struct drm_crtc *crtc;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
