Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C305325F50
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D20F6E8F7;
	Fri, 26 Feb 2021 08:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975286E8F7;
 Fri, 26 Feb 2021 08:42:52 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id l192so4366123vsd.5;
 Fri, 26 Feb 2021 00:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14VFYof0i1qhYtG6IP3r3atV1+gp0vez9of+ccnZeiE=;
 b=Pvz10iUnUx+4sFedZ1zNZsUQN9/Tg5jsorHKwE5wPtgKu2OdoFe6xaPGMf/ZPeypRz
 vefchTEm94QXlj14JNWU7ghRDx00Bqb2W6xr+TViDYKU7eR9XBzIjgQPhfcI/7ojMqf6
 pu6K6G3IbLqVA54ULc5B6KrL6Qjbkej1K1Lz5m1D4qJmHMAYq5iBpjo1W3VDcl/n81lk
 s8XP+U1ClndLU1PdJJhT/XCfpjFhTcEUl3VW1Zt91BuNPicIUtMyQ8H5HVrKHZSVVuwq
 t6ICl/YtnM0DiaVshCwX3UZp8Y7OcfvnEWSey3vvwZNxp3DX5si9gbm+XS6QUVsyQYzN
 lwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14VFYof0i1qhYtG6IP3r3atV1+gp0vez9of+ccnZeiE=;
 b=Tn5mtXFo4cDCHG2H1PnEeTcbVgU3gAD8+g2jLA2w/qlk5vFOAVJcdsH2KphGsgnZyX
 vw/9jPKvjHDPH3WmHLM2yIIHN7WMlXd74/zxglLzkRhwYZ1PIzhFK/m/Agp/NpLuT9/M
 c0mXcd0CBTz8q3tLdWxEIReiy3DK0PUH7CbTXz4roY7/1U1XLyqTurQ6BnX+wTHevGZT
 iL8mKU4U+wx4iAtB7jOzpetypdLmiaa4SnfSpUTseGN+HJZ4rydJOIiY2Miq00hHbVi2
 e+OASOs4Nc+sZRFRo7uZxPvLVDuxkRHCK/yL/boiZpfR3WogPVtgsOwWV9iYuzv8K7RR
 IMkg==
X-Gm-Message-State: AOAM531NuQGEqVRGrLhfPTEVftDWsp5wFNgj0AiWt/JdZ/sH9PtoMNdY
 6KdFue8eU6ghlnSJuI2GBRw4I6VQrwf90I4QyzM+JLy1nu0=
X-Google-Smtp-Source: ABdhPJwqY2uMfng18zKynwKhtRhcp3b3XhyOloQlQZfTjQMtZko7IIBA3ZXlv8cLMdnjrnAMFJ7YNI1/1r2EoOEsuFY=
X-Received: by 2002:a67:fad5:: with SMTP id g21mr974561vsq.29.1614328971759;
 Fri, 26 Feb 2021 00:42:51 -0800 (PST)
MIME-Version: 1.0
References: <20210224155500.4187550-1-l.stach@pengutronix.de>
In-Reply-To: <20210224155500.4187550-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 26 Feb 2021 09:42:40 +0100
Message-ID: <CAH9NwWff6CCebmowLLfNC6gGCNv1ZKK8sfF7=BBx3djQYfLEYA@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: add HWDB entry for GC7000 rev 6204
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Sascha Hauer <kernel@pengutronix.de>, patchwork-lst@pengutronix.de,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mi., 24. Feb. 2021 um 16:55 Uhr schrieb Lucas Stach <l.stach@pengutronix.de>:
>
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> This is the 3D GPU found on the i.MX8MP SoC.
>
Can you provide some information about where you have taken these
values (galcore version,
database entry name)?

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> index 167971a09be7..dfc0f536b3b9 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
> @@ -37,6 +37,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
>                 .minor_features10 = 0x0,
>                 .minor_features11 = 0x0,
>         },
> +       {
> +               .model = 0x7000,
> +               .revision = 0x6204,
> +               .product_id = ~0U,
> +               .customer_id = ~0U,
> +               .eco_id = 0,
> +               .stream_count = 16,
> +               .register_max = 64,
> +               .thread_count = 512,
> +               .shader_core_count = 2,
> +               .vertex_cache_size = 16,
> +               .vertex_output_buffer_size = 1024,
> +               .pixel_pipes = 1,
> +               .instruction_count = 512,
> +               .num_constants = 320,
> +               .buffer_size = 0,
> +               .varyings_count = 16,
> +               .features = 0xe0287c8d,
> +               .minor_features0 = 0xc1589eff,
> +               .minor_features1 = 0xfefbfad9,
> +               .minor_features2 = 0xeb9d4fbf,
> +               .minor_features3 = 0xedfffced,
> +               .minor_features4 = 0xdb0dafc7,
> +               .minor_features5 = 0x3b5ac333,
> +               .minor_features6 = 0xfcce6000,
> +               .minor_features7 = 0xfffbfa6f,
> +               .minor_features8 = 0x00e10ef3,
> +               .minor_features9 = 0x04c8003c,
> +               .minor_features10 = 0x00004060,
> +               .minor_features11 = 0x00000024,
> +       },
>         {
>                 .model = 0x7000,
>                 .revision = 0x6214,
> --
> 2.29.2
>

I really would love to see a hwdb in mesa instead of adding more
entries to the kernel one.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
