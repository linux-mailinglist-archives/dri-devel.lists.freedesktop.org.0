Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FECDD11F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664DD10F0B0;
	Wed, 24 Dec 2025 21:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hG2EiDEi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BE710F0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:10:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8689F60134
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1C5C4AF0B
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766610625;
 bh=O7eCH9tPEjjkiX50GxW0iQ29YK5JDvfbNAIYkyh5Icg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hG2EiDEiFOJCgMv4+ot2aCQCyWzAU+71d683nOQFe8JZMmWnl+FjO6z9iI9O/HB7g
 3MGRSw3tl6n42Vn8z8iK0FmWv3Eqoly+4bfYFq/tT7k2kBs99GMivrqZFRsSbiW3i2
 MJnl6BREUV/06qIpjP9YYp3BEf/InCaFhcMRhsUL+0Az7W/XBnAwMk3kurjRpgJp7S
 ptTa/n6gAT+bXFbPA2EiQyYYa9EjgUarbh8tpv4eBIubkEOfAtFz9oxQ3+WJ0pTmiO
 1HDWcYbOw3/80vYcyxryPPsGTK1UcKdfrL6sPwv4F84pET06q30X4ZHdnR9/iY0Iwr
 839YCubD/Vs8g==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-37b8aa5adf9so38555831fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 13:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX5+k1Y30T41MWzOtz3TqPaIKss5Wg9UJxqlhzfMqPYcWKsBGWVH0g4G5x2Yn2YEdorXIp8x3inUVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwO4k8uKYPde3yGfuNpYuzNEv18+EY2JBqj33oA2zESL1T6ru/5
 SdosJpcwolZbxW6e6P5pRS2lMv7VsButljSvCN431ITl81OhGSUSyxYfHhY24Ub1ZqlApaWHijL
 wI+iZjmyKTzUuT4Jb3w+9iraSUzKX3bc=
X-Google-Smtp-Source: AGHT+IFIxgk+Gyj5ygMCEwdfG0MjJMXY9lrj6c9bWQ4tQlhYFfdfk0UKHDUO5Ra/PXCP7MKHIi/yzB36tFRBgfF15n8=
X-Received: by 2002:a2e:be1b:0:b0:37a:2dfa:c76a with SMTP id
 38308e7fff4ca-38121619c8dmr60585201fa.28.1766610623618; Wed, 24 Dec 2025
 13:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20251223115949.32531-1-dakr@kernel.org>
In-Reply-To: <20251223115949.32531-1-dakr@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Wed, 24 Dec 2025 22:09:47 +0100
X-Gmail-Original-Message-ID: <CAJ-ks9nVz_YtkYQuNGy1CUC8M4JL=KC26TyYmU5bZ2U7vbeJ8g@mail.gmail.com>
X-Gm-Features: AQt7F2oqUMCJJ8rcyTDJex4flA3uriK0niIKrJxszkb1JddNDDnlGrrgdqjTcyY
Message-ID: <CAJ-ks9nVz_YtkYQuNGy1CUC8M4JL=KC26TyYmU5bZ2U7vbeJ8g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, aliceryhl@google.com, 
 boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com, 
 beata.michalska@arm.com, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Dec 23, 2025 at 1:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
> prevent script/get_maintainer.pl to properly work and pick up the
> corresponding maintainers.
>
> Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GP=
Us")
> Reported-by: Tamir Duberstein <tamird@kernel.org>
> Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_=
ramNY-oh-0X+ayA@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9d..fe1e8da6c2bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2158,7 +2158,7 @@ M:        Alice Ryhl <aliceryhl@google.com>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Supported
>  W:     https://rust-for-linux.com/tyr-gpu-driver
> -W      https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> +W:     https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
>  B:     https://gitlab.freedesktop.org/panfrost/linux/-/issues
>  T:     git https://gitlab.freedesktop.org/drm/rust/kernel.git
>  F:     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> --
> 2.52.0

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
