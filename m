Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43E7A93CA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590AB10E5C5;
	Thu, 21 Sep 2023 11:13:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577BB10E5C5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 11:13:05 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-27499bb759cso520552a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695294785; x=1695899585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZHuj74zr5O7M0Foj5k6KMyTCs/48FNRoBqEZQgLVbvY=;
 b=gSL1gEUqy8InC7n2hdCWyfjhlYicb4YUxMrgTjAmlWgzWN4KKqyzKwNGR7SniXy1Q8
 EzcVyHvCw0yClp8PNRtYKEG/lx2O7gSlNY7DWfqrC4qEf929TGt2m9wHEnB4KJoQpixM
 TvPN6R5pxzXMYjPzNCTvUz1KS3RL/aftZjv4u8YTdsIZ1AAylPb9/yQ0DiauIyvNqEAK
 zxdvpodyQetVdkB9rb17gkhUi8jgcxMnUipqgzgH4Wn2EEzZX1XZdBom+S7OfubkbASp
 2bODXb1ZVdLMDq8XgRuYJLsTgzvrdA5rRp/QHvGTxIesH1J3x+gpJpDNL2ULIhC6vCAy
 E0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695294785; x=1695899585;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZHuj74zr5O7M0Foj5k6KMyTCs/48FNRoBqEZQgLVbvY=;
 b=ApBCWW4tDOX65pVViJ9v5cj9lojGFVgSBFIREKsj/yxrxxd3Woli2We0834vkwmO4n
 5FVTnVjv2kQFVKU79xREWwzzENMItJHJFkCRIQhQahdp+Vprl0mxxfJSPtlKQAMye4eR
 waZQz3sLEOVc3hFuF0PlF8/K66Hbo+NdhH6xTcktkWHnJgp5fC8WRFaKfl2SlzHVtEho
 QiChdU2ZSWoYVy68JkSlHXXBtvdWBFz4JsKLa6cmzF+7TQYP76Z0jvBQEjWaZ5pJCC/+
 WQsEtsPY4/srs3Wed+wpVgqJy1jMnPiknbYNepDlRL1SyI2kV9jjA2Cvmz3e8LVIjELD
 ceIg==
X-Gm-Message-State: AOJu0YyG1OYEaJ5QdROYQALgCmVx6SYEII95ma2WZ1XZ/0i8cBZbQLWf
 Yi8OE6CtJXwGKPNf+ek33uHIzSUeMJhPKbtbBLM=
X-Google-Smtp-Source: AGHT+IF5ewAmJQS65Bw6YbkoJTj8+mhT2FlY3Qq/P7lowuuM0o/STylWes/mI0TlTXZmVGwH6EdiYlH2qSiAsDXmPSI=
X-Received: by 2002:a17:90a:cb86:b0:271:ae4f:dd12 with SMTP id
 a6-20020a17090acb8600b00271ae4fdd12mr5190477pju.26.1695294784824; Thu, 21 Sep
 2023 04:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230921110038.2613604-1-mripard@kernel.org>
In-Reply-To: <20230921110038.2613604-1-mripard@kernel.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 21 Sep 2023 13:12:53 +0200
Message-ID: <CAMeQTsbpfYw14oyr7UiDBox2Rho08v8x7SggeRFydpe-Cu+A7Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update gma500 git repo
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 1:00=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The GMA500 driver has been handled through drm-misc for a while but the
> git repo hasn't been updated. Make sure it points to the right place.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> ---
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1012402dada5..5ebcf85bcbdb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6970,7 +6970,7 @@ DRM DRIVERS FOR GMA500 (Poulsbo, Moorestown and der=
ivative chipsets)
>  M:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
> -T:     git git://github.com/patjak/drm-gma500
> +T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     drivers/gpu/drm/gma500/
>
>  DRM DRIVERS FOR HISILICON
> --
> 2.41.0
>
