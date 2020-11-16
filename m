Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1812B4A6F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 17:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5532589DCF;
	Mon, 16 Nov 2020 16:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91EA89DA5;
 Mon, 16 Nov 2020 16:13:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so19258911wrc.8;
 Mon, 16 Nov 2020 08:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T5xCEFEIuus5wOItNxs6c+4OLXVH+uv1c1Qldfoa9ek=;
 b=Xws+I2IH1QKq+OM2Za+n9wuPswoBDk1ydSa7yxkU0aqGnv8tpNg4ybZw6gR3E7M/aD
 iDyIeCYEscZhcBpT9Ua25OX3ZsHJTvxfV9ICztpLa6KDk444i0GVEUA0S9M8qWz2ghk0
 tYYIBQZi7KbXBUxyTtsgRQG8ZATLEO3jmxFULZIHolFiq+VRayD9EcSHI3S3g0OAGoRD
 phdTlzyN288jzlb7VXW4iRhHJPoJU8WDgqlVTsHdmbYeAs4rJc79ZOkUYgwsjm6Kos5X
 Waoa+vSH7WaD6xarn3idQ6rL/jaGaNmMeLVWO94Jk1aX/Wqkzom+7I/Q7AV3N1raFylC
 8sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T5xCEFEIuus5wOItNxs6c+4OLXVH+uv1c1Qldfoa9ek=;
 b=rBuRX+vQTQl8RjG0em/7hIQZYgLDeah3VXg14R091gRGbmdHdw2Oto8+fktHbr7EPB
 dPedpfGaKDePEsdeKOkcgdB03MsdCdOo3hJVwLz65j2jmJtbchApL7yLDcb+QL1BC1Qu
 U+C47o6RkISyddabpbvQ8Del2vNMuaq6cY8nIE9uCbOu3MChJQYOg0wvj0KIS3Qwb4pC
 fGZIiuqgLJqnx0fT3cI00cUiKxl/c0tw6vqNAqG8tvl5CVdmYM0r00Xksx87/EEoSoKD
 cR8q8KCHy+XltwmhzOjIaZoZ3yaRHeOQZzZCuEqHkMo9v4S5ACMi+aV0YLwaXuUjgG89
 xuGg==
X-Gm-Message-State: AOAM532BGxmu2TOjymrppruEHN9+Gv/aBdvU16XL3+E09S6bILJaakKp
 xopqXsT3UvTMG0uOSgY/VScVr57Vso/cMnSoKLiClhrf
X-Google-Smtp-Source: ABdhPJzrgPgLmWReOaGtlfUeNGeqFiEs//dU0EYbWFROnTdUegoZadtpaWRO01Wo8KYzHeJasaqENzy/+YnNyJrOrqg=
X-Received: by 2002:adf:9144:: with SMTP id j62mr3401456wrj.419.1605543238573; 
 Mon, 16 Nov 2020 08:13:58 -0800 (PST)
MIME-Version: 1.0
References: <6NXsveJa7IUiRftZcOguXi1dj0UifPcrDRtR1oOgrU@cp3-web-009.plabs.ch>
 <CAP+8YyHLjEe718h2LZUNCYKx4VBw9J2=0BO9-ogzu9NTzCGdng@mail.gmail.com>
In-Reply-To: <CAP+8YyHLjEe718h2LZUNCYKx4VBw9J2=0BO9-ogzu9NTzCGdng@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 11:13:47 -0500
Message-ID: <CADnq5_ODTaco1DFzWgGyrYzLoh0EEX6iqZXXHfXQYi9-iXtjLA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: fix AMD modifiers PACKERS field doc
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied and updated based on the corrected layout.

Thanks!

Alex


On Sun, Nov 15, 2020 at 10:48 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>
> On Sun, Nov 15, 2020 at 10:39 AM Simon Ser <contact@emersion.fr> wrote:
> >
> > This field doesn't alias with BANK_XOR_BITS: PACKERS is bits 26:28 while
> > BANK_XOR_BITS is bits 23:25.
> >
> > Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  include/uapi/drm/drm_fourcc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> > index ca48ed0e6bc1..29c7a8694479 100644
> > --- a/include/uapi/drm/drm_fourcc.h
> > +++ b/include/uapi/drm/drm_fourcc.h
> > @@ -1196,7 +1196,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
> >  #define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
> >  #define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
> >  #define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
> > -#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
> > +#define AMD_FMT_MOD_PACKERS_SHIFT 26
> >  #define AMD_FMT_MOD_PACKERS_MASK 0x7
> >  #define AMD_FMT_MOD_RB_SHIFT 29
> >  #define AMD_FMT_MOD_RB_MASK 0x7
> > --
> > 2.29.2
> >
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
