Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5A623119
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0026A10E5FF;
	Wed,  9 Nov 2022 17:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A944910E5F7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668013752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=upBhh3tf2YeJs0Ui54TR2IQ+XSYjRkdPr1fWGChfdYU=;
 b=KlpN8OusSYsLPc4uXdeIpNjRaEG7D1KCsAcRqua9bUDWR960cLYRH9gZbubLMxmd3mhuPF
 sbWvSiogCBsyaVWI5G6pILW1YzWJteddkSxkPoWGp0liI/VMGzpey+Wnf9HJ6MIbeDQO16
 Um5Dw2rOaVXvmho+RAb4bC+VmUdoNJg=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-5hYeQyuXMGKMqgBvkk2feA-1; Wed, 09 Nov 2022 12:09:11 -0500
X-MC-Unique: 5hYeQyuXMGKMqgBvkk2feA-1
Received: by mail-qv1-f71.google.com with SMTP id
 z18-20020a0cfed2000000b004bc28af6f7dso12045884qvs.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 09:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upBhh3tf2YeJs0Ui54TR2IQ+XSYjRkdPr1fWGChfdYU=;
 b=BXUTLUnjLaCmf2yX3DrMEMiwB6RZUY6k+Qow3b+vadkhDFz8npI5O0eN/unLsAQC6w
 naqYHHGjcD72ZdE758wPX9/MpYy3iY7rCDo/UxFtBgo9mm63uZB325sVyTudMLLUq3+5
 MipYlS/FCkBj2TwdpWmmuoLr1siYwzoVP46jMrtK1MEhMFnOxtmmrkhSbwfpfsn40DuB
 YZsWKHLDXHTlvVmGVqFvZh9qiPGW39kZOaDvlbSTUtpeE0KX/SUwzsQnydQCB4SmLCJu
 7JESYlOlu6uHqSZ02ksYQo4lqVnQ09hZ4uO1XiwEms9T8IuiYvgnwZlWs2F7r9vexcLo
 UCYA==
X-Gm-Message-State: ACrzQf2Cty25dWAghae/P5ZK5+pR48BGrDiqSO6tXZb8R/Lr4vQzdBgU
 WPNVs21L2UcLAuy2TeA4y0viTRCyBpAgM85hzQWPIX5OKMqPKHuRspmjregFz3QvAhgSk8GZe1T
 6Da53swBx9cCo/RdrbOgxKnmNXFtA6R61q4xDAtLoTfFQ
X-Received: by 2002:a05:622a:1015:b0:3a4:f0c4:e8ff with SMTP id
 d21-20020a05622a101500b003a4f0c4e8ffmr49327079qte.141.1668013750480; 
 Wed, 09 Nov 2022 09:09:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6CER2NjfL6gW2cHCg7k6TFxpFj9M4CDm+qG78yLBTsXX/dUFY9/GnHR1vrOryl4ljnTR9BetCm7ikms3WUPIU=
X-Received: by 2002:a05:622a:1015:b0:3a4:f0c4:e8ff with SMTP id
 d21-20020a05622a101500b003a4f0c4e8ffmr49327064qte.141.1668013750303; Wed, 09
 Nov 2022 09:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20221031163211.13228-1-antoniospg100@gmail.com>
 <20221104220424.41164-1-antoniospg100@gmail.com>
In-Reply-To: <20221104220424.41164-1-antoniospg100@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Nov 2022 18:08:59 +0100
Message-ID: <CACO55tt0skPqe2YNrq3qnMvsUa1cT2db2zt718yF4S4hLnqC0Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/nouveau: Add support to control backlight using
 bl_power for nva3.
To: Antonio Gomes <antoniospg100@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 4, 2022 at 11:04 PM Antonio Gomes <antoniospg100@gmail.com> wrote:
>
> From: antoniospg <antoniospg100@gmail.com>
>
> Summary:
>
> * Add support to turn on/off backlight when changing values in bl_power
>   file. This is achieved by using function backlight_get_brightness()
>   in nva3_set_intensity to get current brightness.
>
> Test plan:
>
> * Turn off:
> echo 1 > /sys/class/backlight/nv_backlight/bl_power
>
> * Turn on:
> echo 0 > /sys/class/backlight/nv_backlight/bl_power
>
> Signed-off-by: antoniospg <antoniospg100@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a2141d3d9b1d..5c82f5189b79 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -263,7 +263,11 @@ nva3_set_intensity(struct backlight_device *bd)
>         u32 div, val;
>
>         div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
> -       val = (bd->props.brightness * div) / 100;
> +
> +       val = backlight_get_brightness(bd);
> +       if (val)
> +               val = (val * div) / 100;
> +
>         if (div) {
>                 nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
>                           val |
> --
> 2.25.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

btw, i'll fix up the name with the one from the Email From field, so
you won't have to send it out again.

