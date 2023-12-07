Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF88094CD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DABD10E9A7;
	Thu,  7 Dec 2023 21:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB510E995
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 21:40:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54ce02c1ba2so390569a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 13:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701985207; x=1702590007; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9fUJrtt8hiC5dDJ9xGUum8RIXakW414MAvm9NwuGgAg=;
 b=VCpxXW4lPsubVDwJJhuF//GMZs7D8BSNvNkw3OA2d0pV3gGTEHi+orj3EsokzhriqO
 VKCCFxDX6X6FTBbJiOIZEGJpJXxuG0AFaGWj99GUyHpXPlpbJSOb5YUm10ClT3cgiOUu
 HmypK2TTeRxJY/FG6UYIe0aBlUHWww8SMBmkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701985207; x=1702590007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fUJrtt8hiC5dDJ9xGUum8RIXakW414MAvm9NwuGgAg=;
 b=v9catr6eCwkgoZSZM2jNrruJViXfF/OirxzvwgutLVCVzT0BUe5ZizWdiTHnlpMPNG
 2qvfwucioc5eNQRKWK2ZI1sxL8Bsyg7zBBVEdKe8NvP6fJaDLwtuXqCAoA7Sl3arN+sb
 FZojlrmfOyaF/UO/D5Qcbrd6LJW0cjhZfBElVlk9GCt+Gzb+U71U03nYJXgMg1Puoaqe
 AkaMjP10pKxin9NldpaV+CGa6V3GRXLeKkwSOwUBhm1FtmX8oaqabnNRZMy4BHaeIPZ2
 LwaZveMFfiL6sD2kiDZw2QldKB6ng5/ZaoKXkIFPt8eTTYFlZCDz+49IKiKHx++CVnbc
 ttWw==
X-Gm-Message-State: AOJu0YxBILNW7CfuGOIDlh7fmH0h7lIzEDeZtmxdfJ7D+8FjV3XfQhgB
 OSHuudQVb/GnY/11vOoQ4rmg3g==
X-Google-Smtp-Source: AGHT+IEEv0NEhT6UWPtxcsbvr/fcNyH9Pa74WiFw4BFfRVUhbXsrrpfIh1q7qtXO/9i31ZadN4by9Q==
X-Received: by 2002:a17:906:7f92:b0:a1d:5c34:2ce7 with SMTP id
 f18-20020a1709067f9200b00a1d5c342ce7mr2881523ejr.6.1701985207181; 
 Thu, 07 Dec 2023 13:40:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 vx12-20020a170907a78c00b00a1ddb5a2f7esm223027ejc.60.2023.12.07.13.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:40:06 -0800 (PST)
Date: Thu, 7 Dec 2023 22:40:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 2/5] drm/atomic: Remove inexistent reference
Message-ID: <ZXI7tPmDWAlNT8Kw@phenom.ffwll.local>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-2-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204121707.3647961-2-mripard@kernel.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 01:17:04PM +0100, Maxime Ripard wrote:
> The num_connectors field documentation mentions a connector_states field
> that has never been part of this structure.

Not entirely correct, this is an oversight from 63e83c1dba54 ("drm:
Consolidate connector arrays in drm_atomic_state"). With the commit
message suitably updated.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 2a08030fcd75..13cecdc1257d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -413,7 +413,7 @@ struct drm_atomic_state {
>  	struct __drm_crtcs_state *crtcs;
>  
>  	/**
> -	 * @num_connector: size of the @connectors and @connector_states arrays
> +	 * @num_connector: size of the @connectors array
>  	 */
>  	int num_connector;
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
