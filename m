Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A821F3640B0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F146E214;
	Mon, 19 Apr 2021 11:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE66E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIAlb9HdBCrRLbA00IatqDn0EvB3C3eeDIiT2Wrei18=;
 b=Q3SZUKFOsTnrOUi9nnu0tAcbqxq7hZOamqv+c0P9nxL+9hDtEsg+43/z/+qO3XF9+aTAoY
 BScKPrpU3i2to/dzX0CKt+7Q0+j7Q0wO0KpgngUfJN/5PaTF6ljKCTM9iM77AZmAhGx4db
 MdjfKt95O3+0NUDt9pkENQ7aurUszDA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-fvDUvefvMwuJkbd0UBoaHQ-1; Mon, 19 Apr 2021 07:43:51 -0400
X-MC-Unique: fvDUvefvMwuJkbd0UBoaHQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s9-20020a5d51090000b02901028ea30da6so8887489wrt.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIAlb9HdBCrRLbA00IatqDn0EvB3C3eeDIiT2Wrei18=;
 b=dUWkLb2DVXwuprVLJI4CrzEvd4cOGrk0Bv1zxqreCen3/S03R7huekI31a2SDFBXUm
 835VntOnePOul0W89GHSkyiDVE+mdnEtExMC2Le/Nd/feXkFZLB5rvFm+uEvNLPYmQIt
 H5n4EqNF/APNrlJNkulajk9gtfzouO0zP8C2tNvXKZ+StYsA83j6lfArMso0VB/VMXoi
 EikHSjS5uTWTqIdU/FVhvEOuSSIkjtfHZ/D+J0qTfibyTESBoHsGjWwplCUVuE7kIiM2
 4z0588gtq24xMbYQV57YNvoKkRLCNQB6XmsVzGsTE/r8qnRFepqXaFqOlv8zArd77aeQ
 Tjyw==
X-Gm-Message-State: AOAM5318rZB79x0mySX+IHnbLTCEQJTU32KR1gEjn2gtVI9gmSj5Sfyx
 DkpvNhGdiolsG6F1skGB2eU0TDFGHt/3oSo1C8ctjslHdptD2wI8M30PALQKfjQoKwWPt3Nv6MZ
 K2xfmNDtoYdDJdOYe3UWeV7gp4pq5F/bMiupbbFle4yoL
X-Received: by 2002:a5d:4689:: with SMTP id u9mr13938295wrq.10.1618832630667; 
 Mon, 19 Apr 2021 04:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZFUZPXmteljMabJNWgNVI9Opvidiv/0XIcrby9r0EikNzgvp6/EpF3Cg7Zaq7P9Vbfx4BOYpgUjju1Vgg2Kc=
X-Received: by 2002:a5d:4689:: with SMTP id u9mr13938282wrq.10.1618832630547; 
 Mon, 19 Apr 2021 04:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-6-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-6-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:43:40 +0200
Message-ID: <CACO55tt+J=xmEPB=4HsDdNGrw9c5UaY_2R7BTwqYrLyiLNK6og@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 05/40] drm/nouveau/nvkm/subdev/volt/gk20a:
 Demote non-conformant kernel-doc headers
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> index 8c2faa9645111..ccac88da88648 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> @@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
>         /* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
>  };
>
> -/**
> +/*
>   * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
>   */
>  static inline int
> @@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
>         return mv;
>  }
>
> -/**
> +/*
>   * cvb_t_mv =
>   * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
>   * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
