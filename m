Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8412B25BE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 21:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F816E835;
	Fri, 13 Nov 2020 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0A36E835
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 20:45:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 33so11553235wrl.7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 12:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iEq53tDK9TxRXDnQ/1dirbrb4PL0wbKgM/db/S9Ynt0=;
 b=kOqQPua3J5UZeO5nCycKFQG3Cq8g44foA1OkeBUHrXSfdccTl9GVRPtm1S/YFRku/x
 sdXg8YkCLKS8fRTOndeAp97UyLEJykzopw0WlSdxfowk9IZhPd73N5tdlQr8gWrxjcnk
 5ecQCM4Ly3nZ8ruLTmQwpJmPfbigpDzpUKuJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iEq53tDK9TxRXDnQ/1dirbrb4PL0wbKgM/db/S9Ynt0=;
 b=JcSDLx315+NxDfBzNIN+b4rXqgTDgHf/ESYbpgHHbWw8YoqxU4XVe1rzBvfRZjcCMk
 NGCL85IDlhgahG6+TQLP7H3Xc7JhACFkW3LPlE8GaoA2fXWv9mTyUjpV7sVxR1ifmOfe
 vMMr1YuRfDkTR1o0v6QaFPWBAwZ4RJetjGoobHf50BVdXGwb1uFHw++y9+JSxTnqKCmw
 zvXxqBwoFuXeoWQU/XYGRye9ESyD7P25ueiBRNd7UE1HnBGJqz5lElmF9nNfrqtTHVER
 pTrfj0m50ORF7Aqq1VBD8mpHE4UgTPeULFu2evA77oZFBtEwRZD9otkEDlcfsd11Evu0
 oOnA==
X-Gm-Message-State: AOAM532Pgq/DGl7FFM0FS8kllq7x3640FRlulGGQ6i8Mt5kUkVeuQZgo
 V0bfv/BhEd4yYzpZK8BJZb0nMnVs21bCsw==
X-Google-Smtp-Source: ABdhPJwzAxNKNhFPx9nHKMhmZE94CSs/NAhz/xPzP6WuZoQmHa7XtzBVzLVqPJs2h5dhb/d1nLGD8g==
X-Received: by 2002:a05:6000:10cd:: with SMTP id
 b13mr6033603wrx.220.1605300328502; 
 Fri, 13 Nov 2020 12:45:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 89sm12533021wrp.58.2020.11.13.12.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 12:45:27 -0800 (PST)
Date: Fri, 13 Nov 2020 21:45:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Veera Sundaram Sankaran <veeras@codeaurora.org>
Subject: Re: [PATCH RESEND 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
Message-ID: <20201113204525.GV401619@phenom.ffwll.local>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
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
Cc: airlied@linux.ie, gustavo@padovan.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, abhinavk@codeaurora.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 10:27:23AM -0800, Veera Sundaram Sankaran wrote:
> The explicit out-fences in crtc are signaled as part of vblank event,
> indicating all framebuffers present on the Atomic Commit request are
> scanned out on the screen. Though the fence signal and the vblank event
> notification happens at the same time, triggered by the same hardware
> vsync event, the timestamp set in both are different. With drivers
> supporting precise vblank timestamp the difference between the two
> timestamps would be even higher. This might have an impact on use-mode
> frameworks using these fence timestamps for purposes other than simple
> buffer usage. For instance, the Android framework uses the retire-fences
> as an alternative to vblank when frame-updates are in progress Set the
> fence timestamp during send vblank event to avoid discrepancies.

I think a reference to the exact source code in android that does this
would be really useful. Something in drm_hwcomposer or whatever is doing
this.

Aside from documenting why we want to do this I think this all looks
reasonable.
-Daniel

> 
> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index b18e1ef..b38e50c 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -24,6 +24,7 @@
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/dma-fence.h>
>  #include <linux/export.h>
>  #include <linux/kthread.h>
>  #include <linux/moduleparam.h>
> @@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device *dev,
>  		e->event.seq.time_ns = ktime_to_ns(now);
>  		break;
>  	}
> +
> +	/*
> +	 * update fence timestamp with the same vblank timestamp as both
> +	 * are signaled by the same event
> +	 */
> +	if (e->base.fence)
> +		e->base.fence->timestamp = now;
> +
>  	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
>  	drm_send_event_locked(dev, &e->base);
>  }
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
