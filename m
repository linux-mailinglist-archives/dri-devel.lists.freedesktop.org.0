Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48442A750F2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 20:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83610EAB9;
	Fri, 28 Mar 2025 19:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jl7CMrNr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB3B10EAB9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 19:41:25 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-5240317b3e0so973478e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743190885; x=1743795685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/NoPne95PeNRqfSL2kQ5aRNc23KzqX62VCe2+DAeJpo=;
 b=Jl7CMrNr58akyl18qjREO8fho6e7cWbmpgISDvfsrelyzgdFU3/LY6m7ZUBCwDCC68
 hbzGf8iKX8QOXKPFsTOPJOXBdlWgDnTmEdeRS4MjQIaOpckkEjVzrNCmJXOyy9ZFyVI6
 7qBgEuzJjMH4Cmlj5DwW0bZUjvOnVKU122GyEvx600IP8N3/drytVFnlvqF2Fjvr4k1O
 AlzdPOJeVQ3bL79NfIXHltBLtSDx+JV18a6xe10EEdsSaE/a6I1Bw/mGhbY+KFneK3wp
 1eDdWXG76oPtQ8/CEykQ5sxvpz9nCx/snr0B3vk/uDNEc/3UR3bQ/m1uDRUwt9ryG0se
 zfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743190885; x=1743795685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/NoPne95PeNRqfSL2kQ5aRNc23KzqX62VCe2+DAeJpo=;
 b=FUyL4+B0jljoBhQZ9oopdb2J16qVmmzHRryTwGNw+ZvKzL1/3mM5Uaq0am+qPbGkr5
 MZMXj8OUIfPrFuWyMVlnLBubwWSoRfrN7rNRQGgRKXa5pFyLtx+/8sYhArloSUgZGf/I
 8Sm6mRi0cBTNalaPZQ5lFfXUCLlPAMyBou/MJybEo1v0qiPCmp97RmVJEw9nyxIscwLQ
 ngMx7yuBmi5wQejjS1BMpjn7kdfojEjnLR+eUpkjdx13lHIdxrojpnPwPuT2hE2yHn7h
 rcc9P/A23ONUUmQrIdqm4ryxzoW5/ymqr70BzFGygO4VPP6ZIE4KxkzPsI4EpOfvFSl6
 DwGA==
X-Gm-Message-State: AOJu0YzYvX5pYobHJTjlW2dBdNc1PgJ0n55Ixv/we0PEkPUD59/6eBLm
 0T9tNnF1RfbLEM0r7/JVd4LGqIU3z4bl8bZljoLe3nM83/3o/MBDGDcv7wbUFg6yPgrM47GGdlM
 d+DeL20ISshF/PS+29w3omU0Rdvg=
X-Gm-Gg: ASbGncu6wbQqYoLDc2AfSn4cucIVqPqjlUB+RQoZEfa9HePtDfU+zGQ/InDUI4pDesY
 L34SPpbbkFqAwG2g0YXLFyXk6bfvkYpNe8puPMNFaOfIYS+bikqbIJwpLqTik/3z5Q6XSk551Eh
 kWDmQkT/VYPlssFiNsGlstLNpebg==
X-Google-Smtp-Source: AGHT+IGu/2M/u25bMuHp/7lCn90wiE8VZXQ9xoSz1IRIii6UCJpoMMadrwmisI65aizqNBNXoTvsotIsZHDXeDFJWfY=
X-Received: by 2002:a05:6122:2510:b0:518:7ab7:afbb with SMTP id
 71dfb90a1353d-5261d4abd25mr667685e0c.8.1743190884643; Fri, 28 Mar 2025
 12:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 19:40:56 +0000
X-Gm-Features: AQ5f1JqHesO1v78XwaxcUxGIDj07x9EfJkMKbiIqWamRzhZMu4oJqeTf7G6F1rM
Message-ID: <CA+V-a8ufxNEa416CpDX5+hHyJqC+Bb44Fqr=xzTu4evpCZq55w@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Support dmabuf import
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 21, 2025 at 10:46=E2=80=AFAM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The rz-du driver uses GEM DMA helpers, but does not implement the
> drm_driver .gem_prime_import_sg_table operation. This  prevents
> importing dmabufs. Fix it by implementing the missing operation using
> the DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() helper macro.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Kieran, would you be able to test this ?
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_drv.c
> index cbd9b9841267..5e40f0c1e7b0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -79,7 +79,7 @@ DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
>
>  static const struct drm_driver rzg2l_du_driver =3D {
>         .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
ATOMIC,
> -       .dumb_create            =3D rzg2l_du_dumb_create,
> +       DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(rzg2l_du_dumb_create),
>         DRM_FBDEV_DMA_DRIVER_OPS,
>         .fops                   =3D &rzg2l_du_fops,
>         .name                   =3D "rzg2l-du",
>
> base-commit: 9e75b6ef407fee5d4ed8021cd7ddd9d6a8f7b0e8
> --
> Regards,
>
> Laurent Pinchart
>
>
