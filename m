Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E13640D9
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598A16E25A;
	Mon, 19 Apr 2021 11:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5076E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nly+1DO6xtNI7xIJZQr0CwBL9odu8O2pnwWHw5PL2Fk=;
 b=MKQjWyX1GCbbIZOR+D19XiXnFCm63I4OpmIinfMXUQ1c9CAdrG6P8Pvf27kWkA2zMmiOlL
 GXwhimq0bJttSYl7Ox+RfhYgSbq5MY8jovn9HV5QNWymcPZOKYyzLuBkROa0FOiInYImkM
 KxJmH6+ccbpGCaYlKeBqLtcQb4pnwko=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-pHbqZh64NNuJZhF1kF8aTg-1; Mon, 19 Apr 2021 07:49:26 -0400
X-MC-Unique: pHbqZh64NNuJZhF1kF8aTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 l18-20020a0560000232b02901026f4b8548so8941881wrz.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nly+1DO6xtNI7xIJZQr0CwBL9odu8O2pnwWHw5PL2Fk=;
 b=RtAEmFX9LxVd77T1iYbYD37M9Q98ZZoszrN0jnXKakxz5ylVYuWrcun3MsbIuGnxUZ
 GdcwgjawiwqONDMzpI3x/T59dm+/eOTavfQw6syhva+b+fGQt1pECX2JYJHjIXK59Q16
 Dol7eR7WWzBjf8PJkrzBmdsjnwF0z1YSGn83JD568BC4SCJKX7eEE57lxCVOAN5M+NTu
 UY5U1rKTRLFIoNHSSB4B9FlZ/BDZelqzePKY0DKTdyG/kKumV3gnqiTLXv0uCg53wgol
 +i9Ve8zuT3T5lWhysFyIl+mqzJGR9AzjGsc0oaS+0E0DLz4sjsi5VNmee53Ayp742Sop
 4qIg==
X-Gm-Message-State: AOAM532HsTf7vYMWJndh3OUQtehfgzMIsu8sgtByukZeJoJGhTkYyoah
 7NHPmqwDNs22VS0zCoPRmOCucn+vNKfvcA8Hck2+eG+kCtZR+KcwQUyT6RkDG8CtLV7/d5zMn8Q
 mGyUVs8VcSOfyonp1yWHFfEawVpBrjg+vCgIr68GsQKAX
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14503022wrc.113.1618832965217; 
 Mon, 19 Apr 2021 04:49:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo70JbUkSOXLnCMJ/q0c/kasxJbjovwmjfD+BmIDk5mqXW5hGpIhL7aPNl6r8rZpHGwg8WLg/vphWP4pcCf1U=
X-Received: by 2002:a5d:524d:: with SMTP id k13mr14503007wrc.113.1618832965102; 
 Mon, 19 Apr 2021 04:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-17-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-17-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:49:14 +0200
Message-ID: <CACO55tsRq3dMrmw+msxnGf4e5=30m0R+XyAX4AMtgNrMNv284w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 16/40] drm/nouveau/nouveau_ioc32: Demote
 kernel-doc abuse to standard comment block
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

On Fri, Apr 16, 2021 at 4:38 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> index 8ddf9b2325a42..2af3615c5205c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> @@ -38,7 +38,7 @@
>
>  #include "nouveau_ioctl.h"
>
> -/**
> +/*
>   * Called whenever a 32-bit process running under a 64-bit kernel
>   * performs an ioctl on /dev/dri/card<n>.
>   *
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
