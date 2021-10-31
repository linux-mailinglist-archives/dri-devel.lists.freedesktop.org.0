Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F4440CCD
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 06:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3288689E47;
	Sun, 31 Oct 2021 05:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB5A89E47;
 Sun, 31 Oct 2021 05:07:18 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id 19so11511484qtt.7;
 Sat, 30 Oct 2021 22:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eb8wG7VESVJ41IlH+dmBVfD+bW8IuQQJ2Vx5tzLsW+I=;
 b=N713hNmlZpdXv19TXT5xPg9NVyB78zOKheMzEMChQpjXMpd9lW3ArxW3br548tOWtG
 1QCgJpATgtHLRhUXvmsPusBj5q4il5GYTpUP5lvp2LgBPKbxaSqjD9o/H5CLjCpC3Vuw
 kIWXmSb1MJHcWzChxQaHFAv2O/PaTO26/38Tn1a/PCP25QklZg43YPsoOjxC/wZYk2QT
 7qSaueWCaoExRcRxkCEv6hGIQ/zepU1uOj/f0kRfcCPE9ZmwYnBY91klv/aEJUE2KQLE
 zffaHU+ve9px3l56yXmZWyI1LkHi4GO8h4TydtrINvlTvcD+BZf9ZlAe29XuGi5J5814
 Ug6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eb8wG7VESVJ41IlH+dmBVfD+bW8IuQQJ2Vx5tzLsW+I=;
 b=5ab3dibo4k7isiMd+TUoVuL9hQhWVtWqQ+9f52YbBRXnJ9kpltMeZiTYe8LhInA2bh
 fQrLPbn8lYU0lim+Lhsg8HVmf+rLZcNVh9091IWYqIlZBIV652LE/5H18hlA1KeIrS7E
 vCccb7iLkzGmvTfdb6pOist56fH/6SMVqQcowf7SQitb2HMifJEZnW0mVD7/7gy7LmRm
 41fGIMH7u+G0YlKmJFCeFWMZvRlt/jTuUVTY9k1m0ktRcq7WNN/w+jQy8HyzE8kf6N6K
 1NlEJb3CbHGbj6thVhSDTniZHSAi/U2wrU0Z8479EEyjGMUBTL5DWWsGuADxfvFLg666
 c7Dg==
X-Gm-Message-State: AOAM532Gak9KdgZPfv+vkO8med1CDUzGIVyLSXfgR5Gklcd+lfhkvNtw
 U+UD+ahYhfRs8XSv2SnPicOMtjZdDxFc3p5lBno=
X-Google-Smtp-Source: ABdhPJwaD6+SLX7hc0yCvUZXrNARWGcMVGFCWkkUloq1VF1a3cEUsdwFX2sJj4lE9MoreK8n+7qKI6YTZRu7bbyYBiw=
X-Received: by 2002:ac8:7e90:: with SMTP id w16mr22011210qtj.164.1635656837033; 
 Sat, 30 Oct 2021 22:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211031041604.187216-1-yuq825@gmail.com>
In-Reply-To: <20211031041604.187216-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 30 Oct 2021 22:06:51 -0700
Message-ID: <CA+E=qVe0vaSyXkY+xn4+kVEqv94PWrrGQj-vgrw7Vf5Lv+r9dQ@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: fix warning when CONFIG_DEBUG_SG=y &
 CONFIG_DMA_API_DEBUG=y
To: Qiang Yu <yuq825@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Erico Nunes <nunes.erico@gmail.com>, 
 Andreas Baierl <ichgeh@imkreisrum.de>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 30, 2021 at 9:16 PM Qiang Yu <yuq825@gmail.com> wrote:
>
> Otherwise get following warning:
>
> DMA-API: lima 1c40000.gpu: mapping sg segment longer than device claims to support [len=4149248] [max=65536]
>
> See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/5496
>
> Reported-by: Roman Stratiienko <r.stratiienko@gmail.com>

Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>

> Signed-off-by: Qiang Yu <yuq825@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
> index 65fdca366e41..36c990589427 100644
> --- a/drivers/gpu/drm/lima/lima_device.c
> +++ b/drivers/gpu/drm/lima/lima_device.c
> @@ -357,6 +357,7 @@ int lima_device_init(struct lima_device *ldev)
>         int err, i;
>
>         dma_set_coherent_mask(ldev->dev, DMA_BIT_MASK(32));
> +       dma_set_max_seg_size(ldev->dev, UINT_MAX);
>
>         err = lima_clk_init(ldev);
>         if (err)
> --
> 2.25.1
>
