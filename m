Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392B226DA74
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 13:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F7E6EC03;
	Thu, 17 Sep 2020 11:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777456EC03
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:39:39 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x14so1674960wrl.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 04:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KdFRPp8G7Pc9SANwQvVH7RQh6a6fZvMww6ZKYFFkVQY=;
 b=lHcbmlaLVlPUVyyMuL4iwsSq8Ccq7spAK6UKimuI1yegpPn0s1GjfbR9AkCnZiGdM0
 599RO5gGKhOGacOuqHDQ/uAW+XC6uEtHQBLSU7t3oYlP+IeIL73Gg/B5d9CxX0APH/02
 DlzcwyiEEJWV/ZvC3Dp3Z8aDR+JhWdb/p0egI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KdFRPp8G7Pc9SANwQvVH7RQh6a6fZvMww6ZKYFFkVQY=;
 b=EBP7WJBJomxwgcK4C2dpAwVIeNeQBASJc1h87MElD77pwvBeuG3mj3888BJZZLCF/r
 z0FtBS3R8sTiGiuBsbyKVStor6cQsM4/IcYxa0s1v49gqjkqV2Q+MNggvLIvWJcJLlMi
 QVr/i5qK4fbH8AcPHlQdWbR54NTILqSSI7EJCyrlQi4hBqX6aNL0jWNM9bQD9S6nx7NV
 a7UtOHCMT+vkUIPusY1PM15/OEipIXxkR/ofchA8isRNNQZoNeEsARPQktGDX4muFcHg
 /DNzPCYyCyKD8eSW/0f18nV9J5m1Sh58bYv583dvp8vFt85FAyO8+nPgfcTTAnuiAE1Z
 m+uA==
X-Gm-Message-State: AOAM533YxY4tYUQDXoTqDKUrRLRbHFdKBrDa+ejokOuq1xalzmtZHiKv
 NeX/S/fv86PXsoLl8Q62SbCBxQ==
X-Google-Smtp-Source: ABdhPJyaII+8Is2mvRxKGZmyejd6O40gRKrgf+kBPOVDl57wSAqMifjNZaFkSV15TYfCxkEYc6WMIw==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr28769336wrq.151.1600342778142; 
 Thu, 17 Sep 2020 04:39:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m13sm36802384wrr.74.2020.09.17.04.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 04:39:37 -0700 (PDT)
Date: Thu, 17 Sep 2020 13:39:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drm: fix spelling error in comments
Message-ID: <20200917113935.GU438822@phenom.ffwll.local>
Mail-Followup-To: Wang Qing <wangqing@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1600308275-32094-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1600308275-32094-1-git-send-email-wangqing@vivo.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 10:04:32AM +0800, Wang Qing wrote:
> Change the comment typo: "manger" -> "manager".
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  include/drm/drm_mm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index a01bc6f..9b4292f
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -338,7 +338,7 @@ static inline u64 drm_mm_hole_node_end(const struct drm_mm_node *hole_node)
>  
>  /**
>   * drm_mm_nodes - list of nodes under the drm_mm range manager
> - * @mm: the struct drm_mm range manger
> + * @mm: the struct drm_mm range manager
>   *
>   * As the drm_mm range manager hides its node_list deep with its
>   * structure, extracting it looks painful and repetitive. This is
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
