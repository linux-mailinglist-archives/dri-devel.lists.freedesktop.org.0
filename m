Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7578253959
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 22:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADC06EAE1;
	Wed, 26 Aug 2020 20:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F8D6EAE1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 20:50:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x9so3192099wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 13:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9BaKjLl1F4E3WG9x32pZx6L6jhUxxfqUOzRaIPS/D6E=;
 b=nymJ5+tO1YbnKkRM6ldq0ucFxtXQI6RGWyaXiSrMjx8eo4S5NB1wQK+6i9tf1RAJlZ
 v9TsyVWBeaf0bR/w01DZBM1tm3mo9pXF4Ix5dlbr5cXMVqO3DjptiwYuwlcQcq7u+pHI
 b6fytSdIKh94YcyMPAWrZsy+hk0lRGShtLNRFvhA2bUD6NiADs8Ab89nx+w4hHQhkB/R
 mwDrJoyEOtf6VUweXzJOnaL4XxZjh4NVTV7WbNVa42viMex5DhMkV9tt1jrK1Zuoj3fU
 2eMjukQiW71GOcmlbb6mIjQExf0cP8IouXhYqr4TMDIIC1cBkOKmrqpQhy5fN+zs4D3y
 qYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9BaKjLl1F4E3WG9x32pZx6L6jhUxxfqUOzRaIPS/D6E=;
 b=ss5GlxnsWwxk3as2OEDC5WAc9HBRcVwdcaA8KAOUiOcoxxnvSjkPLMeewG8oFKlqZg
 Ubv8n1hK1iB5vY4Xt1fRrl3esPDGIt7P27MgfDgYxxW60gXr1RH25nUkERu12wudtKNp
 tE/5lnlC/IsrAD71sKqxPEMq5gTsiD7BX2swHDFbbn/CBSyVHerVrdeEfmHuOQzcFUhZ
 6pYv+Af1vh57qedurR3vx6ypvr7+xGFjF9RKHjf0xwWX6zqBBXYggbCVxLCSUL7RJyK5
 cRfPrYOc/Rssisrtb9SJTmFYsQFalwY3C/x+urRywZFI59eT/UWLY8b6s9hksyD+W7ZJ
 0d4w==
X-Gm-Message-State: AOAM532xpoJHCaANCcJB2YykhG9TPh7IXoKQWtaMcw5tKVmqNGl6dZkA
 rcuZeUZ9xhJ0590cCpZ5/Kk=
X-Google-Smtp-Source: ABdhPJz3HjRuL1A3zOhrETsONMNElibpsRplzpBg6UruDUil6V+PW+KHVLHLDaytHVipTY65dWhR4w==
X-Received: by 2002:a1c:c20a:: with SMTP id s10mr1426600wmf.55.1598475002040; 
 Wed, 26 Aug 2020 13:50:02 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id e2sm509657wrt.66.2020.08.26.13.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 13:50:01 -0700 (PDT)
Date: Wed, 26 Aug 2020 17:49:54 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] drm/vkms: fix warning in vkms_get_vblank_timestamp
Message-ID: <20200826204954.u6aqwcmwpsudrkh4@smtp.gmail.com>
References: <20200825144248.1751-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825144248.1751-1-realwakka@gmail.com>
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
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sidong,

Thanks for this patch.

The code looks good to me; however, I see some issues in the patch
format and commit message. Please, see inline comments.

On 08/25, Sidong Yang wrote:
> From: Sidong Yang <realwakka@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>

You need to fix the Author name.
> 
> When vkms_get_vblank_timestamp() is called very first time without
> enabling vblank before, vblank time has just intial value and it makes
> warning message. this patch prevents warning message by setting vblank
> time to current time.

I consider *fix* a somewhat strong term to this change. In my opinion,
it would be better to choose another term in the commit message like
*avoid* timestamp warning when vblanks aren't enabled.

In the body of the commit message, I think interesting to include the
exactly warning message that this patch addresses. You could also
describe the initial values that triggers this warning and why this
approach is reasonable, as VKMS has fake clocks.

> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index ac85e17428f8..09c012d54d58 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  
> +	if (!READ_ONCE(vblank->enabled)) {
> +		*vblank_time = ktime_get();
> +		return true;
> +	}
> +

Apart from issues in commit message and format, I checked the code and it
works fine.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

>  	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
>  
>  	if (WARN_ON(*vblank_time == vblank->time))
> -- 
> 2.17.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
