Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910211E1159
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 17:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083989FC5;
	Mon, 25 May 2020 15:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A089FC5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 15:12:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r15so62080wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 08:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=KghFKwFNl8hSzWv6Z3aLFWWGHd6AyG7zrRq1WhzsXps=;
 b=IFiDyfUZy5oc/M4ulHtx3QHrQiW6cXKRM2Hm/B9gkaxJQMEWlwFbZCaUGxuwCdtiWB
 gfeqF0PVnaSY0nIZuKdlSI/79Wnw9rlFpIkKqSFdmAuS797eTF0j0poklJ3m4nlHsrpH
 pAm08eQ4EIXQUsDEwNCs/i7cGi7TxfUaGvUEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=KghFKwFNl8hSzWv6Z3aLFWWGHd6AyG7zrRq1WhzsXps=;
 b=ULOPXZGepaxCiJfh07jNyt3QuvWzpwSO3wzZ8YS+96lx1PiQbWOlCc7SXJteygRylA
 QEDFvepdnePK13NxM2/+9wkAmqdwbL7sZQfNc8Eca/xKX1/A6t1y2zbIDTkiNWLpdchQ
 6iHeOx1CmTZusist8Cl9MZYYRfJbd5UlulG61QBVM3boVhmh58xZeaOYHUwcG3YyrSLs
 JvxtqU3Q0w1tyknliGnegeXzXdwpaTG+LKOBy5t1SGRMIsz3BniiWZF7qUY+dBrQmv+0
 0sdGH8X4qmwV+mNmori31NC5V+SJdVLyHpI5JBSQ9vaVkFeYJeKEpULCAg/2ployRSng
 BWrQ==
X-Gm-Message-State: AOAM530C6ilQVSCfaNQcZ5/XuDfdGC2zHXoE9czAJBwHVvPtoLpsrVyO
 zz2FT9Qk9aF8WZ3ZxvseXKY4AdUmK64=
X-Google-Smtp-Source: ABdhPJzLOtSxrGWcgJ4Qgx6WeEYNjCzlux5W9q5Zb384uoob1qCpIHD5u6Y9fJgukZs6BL0UHiL1gg==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr24742315wmj.40.1590419559650; 
 Mon, 25 May 2020 08:12:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g6sm18344983wrp.75.2020.05.25.08.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 08:12:38 -0700 (PDT)
Date: Mon, 25 May 2020 17:12:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [RESEND PATCH] drm/vc4: hdmi: Silence pixel clock error on
 -EPROBE_DEFER
Message-ID: <20200525151237.GJ206103@phenom.ffwll.local>
Mail-Followup-To: James Hilliard <james.hilliard1@gmail.com>,
 dri-devel@lists.freedesktop.org, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20200525012859.267433-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200525012859.267433-1-james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 24, 2020 at 07:28:59PM -0600, James Hilliard wrote:
> If the vc4 hdmi driver loads before the pixel clock is available we
> see a spurious "*ERROR* Failed to get pixel clock" error.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> no response in over 2 weeks

Thanks for poking again, not sure who exactly is supporting drm/vc4
nowadays. Eric at least doesn't work at broadcom anymore.

I queued up the patch in drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 340719238753..6d4ee3f6b445 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1338,8 +1338,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  
>  	hdmi->pixel_clock = devm_clk_get(dev, "pixel");
>  	if (IS_ERR(hdmi->pixel_clock)) {
> -		DRM_ERROR("Failed to get pixel clock\n");
> -		return PTR_ERR(hdmi->pixel_clock);
> +		ret = PTR_ERR(hdmi->pixel_clock);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_ERROR("Failed to get pixel clock\n");
> +		return ret;
>  	}
>  	hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
>  	if (IS_ERR(hdmi->hsm_clock)) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
