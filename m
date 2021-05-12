Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A937D3DA
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 21:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25A76E1E6;
	Wed, 12 May 2021 19:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E476E1E6;
 Wed, 12 May 2021 19:28:50 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id di13so28427202edb.2;
 Wed, 12 May 2021 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HimVdGYNuDFmeFfGkz9uf17qGXHCnZx8wVlqXRaVfR8=;
 b=fI7pm3pIf7CfDEM5BrDDJwBIyffdqB3flQLis93YPSJHHj4DaF0eRy8JFd0aDnyVUC
 vBrIse5NM/CLGy8QuQBXpd4iwCaBFGpJs7T+rVIe/hENNUPPY2DkQBCqqauifL0hUdLX
 RJL1S2o/W+j02X56MxMk8vzktqeVuXuLHCtX5heObAPcdP5w/M2fQ9rBcdNi12jMR5g0
 V9yg8bp00NCecqNJNMr3WrD7o0YMySaqd9XE5x82rQ+tEEKCdhxo6QHNusxn1w6plSTh
 kmWYPpTF6CvC3SsPAukccXnp/m8qRyN1uPTjqqxD/uccvjZWg0JD3b0rq7leVwjTA2D2
 6C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HimVdGYNuDFmeFfGkz9uf17qGXHCnZx8wVlqXRaVfR8=;
 b=OeTAIk79CX8k3f+zL8IVZ61fQ0UgroSH8PMJ2QW8cZay2wN+ytuWgNZA2TuLifcK0r
 1wN7VM/PXTBgSTNkmSqqk0zuKd1kEHLp8zmcUcTbZ/1Osntlm17lLzng7pJFqLCr4qW+
 TBWlRNVFXohtjncJs6af1tZzCNLw2VgFPsQYtep4a4gLvlDz3viWNIf6qmBmLBdjrkJv
 TrEG8H9SennRyitoXerKgRF2QTXvxVGHiZWfwAUvuw5hQNIYsE1MAj7D32RCmarPcLJC
 HoOKGrR8hXbH2uCbNGmHlEqcvPxqSYgBBux0kx5uaNfEG/hchBiD0o80bhz9P3PlFKMv
 RBpg==
X-Gm-Message-State: AOAM531X9RpgK7FgUOvJEv10B2NayD7KnZzNoGA23Rf4rbH+Z1L2D9G3
 NvFnUsiM6vRWFzYvRBr7WZsIYbhAbomYc5FMeuU=
X-Google-Smtp-Source: ABdhPJwEthJpDtHTFSpcOsRAg0L+JXU+pxmFnXubLa6FGoNLWhkzErcyFoD5El3zH0vlIFdSKv3bgKVfqZCvYxmzS54=
X-Received: by 2002:a05:6402:341:: with SMTP id
 r1mr45254463edw.113.1620847728585; 
 Wed, 12 May 2021 12:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210512185527.26050-1-tzimmermann@suse.de>
In-Reply-To: <20210512185527.26050-1-tzimmermann@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 13 May 2021 05:28:37 +1000
Message-ID: <CAPM=9tymkJyVN4f9ivLaz7U=Mqhu2CuWGEk8RxbPFrQOc8wBzg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: Remove invalid reference to struct
 drm_device.pdev
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 May 2021 at 04:55, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The pdev field got removed from struct drm_device recently. Replace
> the invalid reference with an upcast from the struct's dev field.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: b347e04452ff ("drm: Remove pdev field from struct drm_device")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Dave Airlie <airlied@redhat.com>

> ---
> This patch should be merged through drm-misc-next.

please land asap.

Thanks,
Dave.
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 7f38788a6c2b..2a298c171d4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -460,7 +460,8 @@ nouveau_connector_of_detect(struct drm_connector *connector)
>         struct drm_device *dev = connector->dev;
>         struct nouveau_connector *nv_connector = nouveau_connector(connector);
>         struct nouveau_encoder *nv_encoder;
> -       struct device_node *cn, *dn = pci_device_to_OF_node(dev->pdev);
> +       struct pci_dev *pdev = to_pci_dev(dev->dev);
> +       struct device_node *cn, *dn = pci_device_to_OF_node(pdev);
>
>         if (!dn ||
>             !((nv_encoder = find_encoder(connector, DCB_OUTPUT_TMDS)) ||
> --
> 2.31.1
>
