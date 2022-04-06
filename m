Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2284F5A67
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3364F10E60E;
	Wed,  6 Apr 2022 10:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7E510E60E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:04:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 n63-20020a1c2742000000b0038d0c31db6eso1291972wmn.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gsn/KVUZ2ef93UgRqhOePHB9TxRguehEszYRtNa4ZMI=;
 b=NCWYdNcW45PTe6kKF0w+n8KY1aKTNCTcXWUn9Vd1Y+0HeE5v6VGX56SvDvtTWTcwvn
 foA/h57PkpDokJjifQ0W/rTHCw6AxOfDck6Yq/ES/yfX94n8dRjUnemTpjYP1qPqPEci
 fNfHE77j5zc+jbDIO9yC9EKgcCtmpjWmjQJ5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Gsn/KVUZ2ef93UgRqhOePHB9TxRguehEszYRtNa4ZMI=;
 b=3Ty5bxTXBbINB8oK8ekzPDJajWAZACr+U+K9edMhszZTv2j5JKPbGU38ps32RpK9SJ
 GIoIMB+gi39shGRUSpFuzVuPQEPnU6MJkiYi5NrsDu7LmAVjzuBd6b0+IIaqi5SsGsPP
 QKDZqj+MhlMo5G+6aUpTwjP35WyoRP2xutQUaPseqpcuFel5DS8bs8/ic9+5JAghxv5f
 UrN/N5vM9/O4bp/TsSukYQIyAtT70z565UwXlFKXjQNT/WlIW9O3fxO0ZFv0qer1X6W+
 yXMP41ZtT56RX2qZptKdBXwyp9sRXsJM44W6ZaU9q2Mh5MwWOTv5wvc1Gh/jIxK2H03V
 6/Og==
X-Gm-Message-State: AOAM5327LYa/E1LR0vj0KAFXRn1pLySx6HwK9u/xkfLi+2bGol5yMXFo
 218ftl9KYDmG0ZfcBpbMWnhv4w==
X-Google-Smtp-Source: ABdhPJxpJ2B8ipfnst6KF5vUfg2vrUjZLgS+eJ7m2geRcChNtFKQ+Ox79lRxUALgsfwgkDOKI1RUvQ==
X-Received: by 2002:a05:600c:a47:b0:37c:965:2b6f with SMTP id
 c7-20020a05600c0a4700b0037c09652b6fmr6743785wmq.31.1649239448406; 
 Wed, 06 Apr 2022 03:04:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 bk1-20020a0560001d8100b002061d6bdfd0sm5286345wrb.63.2022.04.06.03.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 03:04:08 -0700 (PDT)
Date: Wed, 6 Apr 2022 12:04:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH] drm/drm_modeset_helper_vtables.h: fix a typo
Message-ID: <Yk1llmSuQEmtCk1Y@phenom.ffwll.local>
Mail-Followup-To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220406073036.276288-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406073036.276288-1-15330273260@189.cn>
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

On Wed, Apr 06, 2022 at 03:30:36PM +0800, Sui Jingfeng wrote:
>  change upate to update
> 
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
>  include/drm/drm_modeset_helper_vtables.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index fdfa9f37ce05..fafa70ac1337 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1384,7 +1384,7 @@ struct drm_mode_config_helper_funcs {
>  	 * starting to commit the update to the hardware.
>  	 *
>  	 * After the atomic update is committed to the hardware this hook needs
> -	 * to call drm_atomic_helper_commit_hw_done(). Then wait for the upate
> +	 * to call drm_atomic_helper_commit_hw_done(). Then wait for the update
>  	 * to be executed by the hardware, for example using
>  	 * drm_atomic_helper_wait_for_vblanks() or
>  	 * drm_atomic_helper_wait_for_flip_done(), and then clean up the old
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
