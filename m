Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777A1E1098
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 16:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BF189EB4;
	Mon, 25 May 2020 14:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067F789EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 14:34:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u13so203444wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 07:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uF/4fHZuH4O2kAyZbFgHJMIKMxQSq2SpjuNJFiGzN3c=;
 b=A1PSXXHPnm4Ueqyin/tvwZ7Rw+EyRVcQ72yjHH2tOIZWkZdm260BiD248y5u2VThdf
 esrRZqJYtt1Cc02PGRWeL0C7PcY4OwdjR9P8MVyQ+1pKNR8zkcA4uAq15zikLHkmz6bO
 S+MSQa8dGaDGRX3CRZlQZ66t6bAtkDLjOvX2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uF/4fHZuH4O2kAyZbFgHJMIKMxQSq2SpjuNJFiGzN3c=;
 b=nXDpfwdZiU5G0zsG93zKHMh9bUbtLcpPsS74Rb40oJJFJqzAsX8L0Tk/bUfieXtttr
 i2td+XSZZx9FlQuAOjdwExpSt9dlY/Ja8K+brXV4ynCuwW0wzk6IDxvq8CPTx4gNleOY
 Dcc4XYKo5Ns7rDxBT+66KHwLlvN1UMUO0k1uSNNAZKiSxUugfTrnPpciDc4oD0YlJilk
 Gs5GHhdyhCDK2lFINfiDkTcMYt8bNYLi3oqw/pQwF0u5/7qXNQ64sgaU0UYW9MjhDBcN
 fBGBtVnsJrfeu4v13300LyUuh7YF8PUpQFu3QPHl8X0mdAYysEB0FQRnLWUjmovcI7WD
 Aulw==
X-Gm-Message-State: AOAM531ucDgTHpl3ebFafHzhKa+RWzQxqi9rUYCEH9OIkdInTk953VcJ
 yvsH2/Y+2OalLEaWsejBbbGB9w==
X-Google-Smtp-Source: ABdhPJz6GW+J1xSrZI8dXuAtuxH1sDs6MqBa5pe6rLiXeB5g2ICOVcpjJLrHZ29PpphGyfBsHzuRgA==
X-Received: by 2002:a1c:9654:: with SMTP id y81mr24769147wmd.46.1590417270737; 
 Mon, 25 May 2020 07:34:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n1sm4595258wrp.10.2020.05.25.07.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 07:34:30 -0700 (PDT)
Date: Mon, 25 May 2020 16:34:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: chenxb_99091@126.com
Subject: Re: [PATCH] drm: fix setting of plane_mask in pan_display_atomic()
 function for linux-4.4
Message-ID: <20200525143428.GG206103@phenom.ffwll.local>
Mail-Followup-To: chenxb_99091@126.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <1590205747-19599-1-git-send-email-chenxb_99091@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590205747-19599-1-git-send-email-chenxb_99091@126.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 23, 2020 at 11:49:07AM +0800, chenxb_99091@126.com wrote:
> From: Xuebing Chen <chenxb_99091@126.com>
> 
> The <include/drm/drm_crtc.h> provides drm_for_each_plane_mask macro and
> plane_mask is defined as bitmask of plane indices, such as
> 1<<drm_plane_index(plane). This patch fixes error setting of plane_mask
> in pan_display_atomic() function.
> 
> Signed-off-by: Xuebing Chen <chenxb_99091@126.com>

What kernel is this patch against? Latest upstream doesn't have any such
code anymore ... I'm assuming that Ville fixed this in one of his patches,
but I can't find the right one just now.
-Daniel

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e449f22..6a9f7ee 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -1256,7 +1256,7 @@ retry:
>  			goto fail;
>  
>  		plane = mode_set->crtc->primary;
> -		plane_mask |= drm_plane_index(plane);
> +		plane_mask |= 1 << drm_plane_index(plane);
>  		plane->old_fb = plane->fb;
>  	}
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
