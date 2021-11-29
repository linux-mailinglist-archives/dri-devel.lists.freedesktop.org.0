Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB7C461FC8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 20:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C106E0ED;
	Mon, 29 Nov 2021 19:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C96E0ED;
 Mon, 29 Nov 2021 19:02:29 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id o20so75803850eds.10;
 Mon, 29 Nov 2021 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHIcZ4ajJxCRfp6TfnnK3m4uOLsqq/PnoEl1uZz7+2M=;
 b=LHqpOuZ9bbPhm6BAEqNPiFiqNjqndKV4zQZgjWjGtAQXoprCwWKIcC6/fyMFaSBQ6N
 k+M+udaeBPxQSV/sqCPS8gOOdZr6WhSxUEYATlnHbqTy8naDBiledHzWmwVMy0eMdV+o
 X5fV9bcsNEZcXKYY4M9flL9DfU4JNrNc6Wi7tlanU/9oSP6XRf2M7zmjO2MmRwlLoDOr
 l81B3g2OMpp7EXMM9gbQ8nJGhZw5Emg0VQ/KMNogBPSu8XxQJOS5ddNYZXRxAQ4FwNN+
 lE8Wv32IPzfNJ+SGajHs4GHojQXuYFahcQ72Q/jolrV3T85hGnbS+/eM/1yqCW1k9cfP
 kAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHIcZ4ajJxCRfp6TfnnK3m4uOLsqq/PnoEl1uZz7+2M=;
 b=7Bcbcwo+pFNuyr3SPP1xnCRP9/FTgeehwivXNNqpztsa71Ag36XAqY7LPxpmD8fHtt
 5wf94OW5DzZwxmsbKaiPBjw1VKjrk1McFU9XPux823TULAA0qGswfwFm2qmvgyiPElSF
 zVOi4YstAy+eUaRemDryY6SWghR7kfp+4njxpAZccPvNJokrLxKnbknZEw2UINF/fIDD
 i3wifh+3KVnW8jUZg/76D4CWSmEGtWEMekYMmBdNwh8n9rr87ob+d65Y6SnDauOV9hEx
 C2S/WDmbtezhwKgh1/OQ3D21J12PxfGDSPYIhMREYE4jOAiliy40/0kf1ZwnBSbZ5ThE
 JWdg==
X-Gm-Message-State: AOAM532Yc32Xq0fU7xQSYs1fzquLYDiGGYpXOsOWzRlywzH9dLkgVq0E
 689T8hjMfau+1786YPZhjnaGV66scm7LtHheq3c=
X-Google-Smtp-Source: ABdhPJxGlKZy56+YMwTdyV8+MSNj2EB5bGzBFj/T14hqS9VsMurjSEHNZMxWqn+sj4E8NhGcq44MS8KxUYhtEUSU9i4=
X-Received: by 2002:aa7:c846:: with SMTP id g6mr76715007edt.75.1638212547798; 
 Mon, 29 Nov 2021 11:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20211128201916.10230-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20211128201916.10230-1-rikard.falkeborn@gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 29 Nov 2021 20:02:16 +0100
Message-ID: <CAH9NwWfhtYKsPMsiTN-pYc3CQ5XcA9TyX3R4yZch7ZHL2+Soyg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: constify static struct cooling_ops
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am So., 28. Nov. 2021 um 21:20 Uhr schrieb Rikard Falkeborn
<rikard.falkeborn@gmail.com>:
>
> The only usage of cooling_ops is to pass its address to
> thermal_of_cooling_device_register(), which takes a pointer to const
> struct thermal_cooling_device_ops as input. Make it const to allow the
> compiler to put it in read-only memory.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 06bde46df451..37018bc55810 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1658,7 +1658,7 @@ etnaviv_gpu_cooling_set_cur_state(struct thermal_cooling_device *cdev,
>         return 0;
>  }
>
> -static struct thermal_cooling_device_ops cooling_ops = {
> +static const struct thermal_cooling_device_ops cooling_ops = {
>         .get_max_state = etnaviv_gpu_cooling_get_max_state,
>         .get_cur_state = etnaviv_gpu_cooling_get_cur_state,
>         .set_cur_state = etnaviv_gpu_cooling_set_cur_state,
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
