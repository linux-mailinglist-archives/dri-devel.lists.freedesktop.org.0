Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9733B3418EF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:57:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC1B6E9D2;
	Fri, 19 Mar 2021 09:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC716E9D2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0PczpDbwsPC5lQkBB89vq5oDLbkXKIf3dA1wCttmZ0=;
 b=hha9aVk8CgJWMmc5rukCMr29PPMMr2FxK5NwAhUKnaiKHb1jjbhlkjP8nBEVgzfXv/LEJq
 t24LN1oF0ZVNlAdgu5Co14WTOQAsUSDZKV2PcltLFmUFoaP9zVVGVErcuyRfGXzNXJcgie
 fNT3n4JlxZOzdlr9ALixqUCxZrM+/qo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-49rdMoDOOWuRNZBOmxadsw-1; Fri, 19 Mar 2021 05:57:22 -0400
X-MC-Unique: 49rdMoDOOWuRNZBOmxadsw-1
Received: by mail-wr1-f71.google.com with SMTP id o11so5553802wrc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0PczpDbwsPC5lQkBB89vq5oDLbkXKIf3dA1wCttmZ0=;
 b=VW3KWdOA/faV8Xips6ZN6S2RvbggeZlwHQdYqgjf1kUjThq3atsy2qg8mLLZAvu2/a
 IVoKb6fQns4YgN/Nuyt/jCBUOd5QVTAC9RKBvp7VhOUtIFep+juCfFgyu/C55LOCGXR4
 xYJbeunR/OyCfM1jP5GF32aZGM2exOuuL9kmfMFlPx82phRZ1+lUyZ+BKjECcNGjBrVc
 TjM9c3/4eyfo2W72aGEUWiBnDp+yv64qa/U/LVHZ0ja+tkEWjtDvkKPZ0U7GpjR8UODh
 G4DcB2ILe7/DNtJFq6uNMilPBCrbXybdEAMCIdrsQ4l8r8RXp8XP9rl2lVR+0DbGhrrB
 nSwg==
X-Gm-Message-State: AOAM533SIeVuEF6UDHZ7Ve54gA+7dEo19RSzMrHlahPNZeXgh7UNDKch
 b4VHfvxzVglPAim+BgHXfOlhAXlVyvZqKz9PIhnxeWwJLXYoXG+5w59oWg6Cb+HqHIeMhjt+Oby
 4clu1SsgIAA+Nb5d9hjTLVbFeF6GYwDUTyhEJDhsEOBkN
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr2955172wml.1.1616147841801; 
 Fri, 19 Mar 2021 02:57:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOEla5BNWHU1g97Pq8e92rbVtjZyisiqoILIxYNfkNvpqjWZOUdjVvSJ1zyfBh+8SUEzzYdsvjQ9RNg/izpQU=
X-Received: by 2002:a05:600c:220d:: with SMTP id
 z13mr2955164wml.1.1616147841683; 
 Fri, 19 Mar 2021 02:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-20-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-20-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:11 +0100
Message-ID: <CACO55tuB4ACS=zFmUCj=q+V0cRScW8N-HgCcejAB5P=n_uNnCQ@mail.gmail.com>
Subject: Re: [PATCH 19/19] drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse
 to standard comment block
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

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
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
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
