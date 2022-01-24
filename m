Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C3C4985D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 18:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BD510E385;
	Mon, 24 Jan 2022 17:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9E610E385
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643043998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UErGN2T0IhE+6OhawTY+/XFQm12Pkh6aUTIrM8GlvyY=;
 b=BiueDXrIy0qb2Vud2J4YJqQuB456jE7Qhx3x57/2/1vHcDm9AOk+V6cmJpcPOggBmpjo3J
 m6bfK+Pes54TZif+JdyrN53HpPb2cQqsMDOaHkVSf40ZPMadzPOQSG/ZtYFG0OKYN9r5+c
 NoBgp23kjSnynG4cFt0y8knAMZRFCLI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-PZiUMeacM0mYFI3wjuXY_w-1; Mon, 24 Jan 2022 12:06:35 -0500
X-MC-Unique: PZiUMeacM0mYFI3wjuXY_w-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b0034c29cad547so15329093wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 09:06:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UErGN2T0IhE+6OhawTY+/XFQm12Pkh6aUTIrM8GlvyY=;
 b=pqqnsV5j2ZN7mfzqLd6Y0NmDD/AOLCP9kDnyE0t2pS7NlSmBLBIZdXLCxWz32DkJNp
 A6oO6cwF9bGgRbgwd7e+yUwDIU87K+i0Fi46F5Z6kJxGAGemxeo3xAvt+jzlZ31f1RaA
 9Q0kQ4etqy2hqTPVBwIP+VKck0PjYdQi+DkIJuPlSbKgbubDrhP5M7r1xZ0+XKSAIx00
 MQzAr3U8I9liLVXsMacrqFzee+nNz8HPsz8pivvQRkSwq7yWvu5U+1cXMK6vD/r1sUIx
 DMKaB3HLaoGo10uErTgP5SUyyJHMFFzY/6PGOL1wriivFpl8U/K/+vT3Y0VcMfHzdyU2
 c9hw==
X-Gm-Message-State: AOAM530cktCRpklTU5u1w5xBnShbQm0Gh8xNdBdFC3L3TcXsIdIiKDW0
 12Hz3oC4Rk9KVBp2Z4eioSyWiUTdHffePz9MrhGg6/uF+ZGzc7o79GMJxayp6Dj4y6nVrkTGQHk
 jVhh1vMpjhA2rLoFRjFOyv1oFaBRwqjLI7i6TQtMUWWRF
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr2611282wmj.74.1643043994645; 
 Mon, 24 Jan 2022 09:06:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT7CfJ63GZsHay5dLvTT5HRfgE2bs1/YXBmB4qhn6Hh7jRm2+hTv8xtS0EyMSkutgb5mMRV/U1cokQPOQC5cA=
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr2611264wmj.74.1643043994378; 
 Mon, 24 Jan 2022 09:06:34 -0800 (PST)
MIME-Version: 1.0
References: <20220122081906.2633061-1-github@glowingmonkey.org>
In-Reply-To: <20220122081906.2633061-1-github@glowingmonkey.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 24 Jan 2022 18:06:23 +0100
Message-ID: <CACO55tvQrOeF4oXLa2kCKv_Sz5JmEgeQjoPe5MNPB=FToGj_zA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix off by one in BIOS boundry checking
To: Nick Lopez <github@glowingmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 22, 2022 at 11:44 AM Nick Lopez <github@glowingmonkey.org> wrote:
>
> Bounds checking when parsing init scripts embedded in the BIOS reject
> access to the last byte. This causes driver initialization to fail on
> Apple eMac's with GeForce 2 MX GPUs, leaving the system with no working
> console.
>
> This is probably only seen on OpenFirmware machines like PowerPC Macs
> because the BIOS image provides by OF is only the used parts of the ROM,
> not a power-of-two blocks read from PCI directly so PCs always have
> empty bytes at the end that are never accesseed.
>

small typo nitpicks: provided and accessed

Also, I think it makes sense to add

Fixes: 4d4e9907ff572 "drm/nouveau/bios: guard against out-of-bounds
accesses to image"
Cc: <stable@vger.kernel.org> # v4.10+

so it gets automatically backported to applicable stable kernels

Anyway, whoever picks the patch can make those adjustments as well.

Reviewed-by: Karol Herbst <kherbst@redhat.com>


> Signed-off-by: Nick Lopez <github@glowingmonkey.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> index d0f52d59fc2f..64e423dddd9e 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> @@ -38,7 +38,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
>                 *addr += bios->imaged_addr;
>         }
>
> -       if (unlikely(*addr + size >= bios->size)) {
> +       if (unlikely(*addr + size > bios->size)) {
>                 nvkm_error(&bios->subdev, "OOB %d %08x %08x\n", size, p, *addr);
>                 return false;
>         }
> --
> 2.30.2
>

