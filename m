Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68574B0D81C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 13:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBB210E65C;
	Tue, 22 Jul 2025 11:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dss6uvAj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
 [209.85.217.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917EA10E65C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 11:25:38 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id
 ada2fe7eead31-4f2efa7524dso459434137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 04:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753183537; x=1753788337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crTrKK7Fv8oEkT7Vw14WQxZmxE8sWQSgGRs4hNZ3Hf8=;
 b=dss6uvAjS9UpDHpmNxLWXbE/GpyOFAZ++U+pgB/UdxLR0k9T5n+96ARYfejTRgzueN
 XXn9Bz7Fuf3hLXE3/qL3EjTjez2rX9FCk9x12LX5nJiS53S/PaglxRoFLhrA/jhU/Rn3
 qGEnzHcR0r+YBJm7xa/rXBL/YGZCoOtWwlN6jzKVdwuQj3x8myNFhfI03aXI4jRrHmHZ
 //u7WDUOqtBuXlBPuwRQzB4w4KBS95+Blk2RuhJ95WQOGo5edUyZKw2WSdDExomcYBOe
 DtOVWW+V7C8QuvaKYpC2zBZwLyfe2N4v7Cd1CBWS6VsmdECfynZO1WYnF2Aoze1Z658A
 Whxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753183537; x=1753788337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crTrKK7Fv8oEkT7Vw14WQxZmxE8sWQSgGRs4hNZ3Hf8=;
 b=WIcpY3V4luVUj9CSSolNhmRz6pIfYdpv4sPbB+YHZtpfuE43VUo/8gW5fU8hO9Odzl
 zDebPS5n0YI6aejhxoqAprNxA3GUSR5M7PKjXo7zt2C/UiKZHMy3NDQ0K1EUGGi6IkRL
 BVWoQR6zeBuf3INuV1TdKVjqS9K6OBA0x49+ihyspGCmGNyOMMdYnMHI16B98kmQCLVe
 xW6Q46qsIV0WG26SEG1sX1G3aZKqNtoifHU4pP0uqyg6gIwceaqPr4nec2tPwAJheWjh
 H7x9ECS4Fx4Pgip/jaXMQ7OoeVpGRtDrvvQK9VtUCNXuOCLQrduPYOiHAamAJxLqR5xw
 QHGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW87xZEHJc9ktu5sxi4TH5dN5bOPTVLDmjyGx4KeOX/fkxDPAJMSVwlw150s4FCZ8dXbbdPoPhzwMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxce0Kydehej3hdLPf5w4eGxn5OL0LEvB/BPGPX9AWL+LTd0LO
 HLXZwXEpJUc16bHPJMvoxrBA3dKisNn8q8SvrJPxXlaH7ZxcYK+DuKib9+qPIrTSKGN/mjvmbls
 LoHovfzFoOCgu0HOW+jASBPzl/nqV6IA=
X-Gm-Gg: ASbGnctSzypbhCsp91dlQsujBAS6+I1PzKnXdsRZrHSo07JARK0ghIplJiOFDsT0ktf
 RPWdPjztcEOmkiY1fRRnVafO0Wxs00TT5m3xiWpKpRBXC9LUSXHCuardTGQPGAC1JuP4a9AJ/dg
 IQbS4vDxOLcPJW34bPpzYISKWpPMeSvvjtKca2xTNhxPsOJArqZBovqIjL2B2pHTdCtYd9M48sp
 GV8
X-Google-Smtp-Source: AGHT+IGBGW1NdHmoHUfa8aAEY3c8SNcPSI/VawRsJ44yRxDkRqQovc+wfZlxzFhug4UAYnDAuP0fvet8e45XcgOHBIs=
X-Received: by 2002:a05:6102:d94:b0:4de:d08f:6727 with SMTP id
 ada2fe7eead31-4f9980fc7f4mr9967163137.13.1753183536999; Tue, 22 Jul 2025
 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250722112050.909616-1-uwu@icenowy.me>
In-Reply-To: <20250722112050.909616-1-uwu@icenowy.me>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 22 Jul 2025 19:25:25 +0800
X-Gm-Features: Ac12FXxLmNaOOyB0s5JDwxeuilIksRxnGlyAFtVocFnRD_Uc6fPCEhU9HDxosSQ
Message-ID: <CAAT7Ki9DUJhZgqW7e4ggcgHM9K21ExAEMbK=WjOiVged0+=fCA@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: add pgprot handling for RISC-V
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
 Yao Zi <ziyao@disroot.org>
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

On Tue, Jul 22, 2025 at 7:21=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> The RISC-V Svpbmt privileged extension provides support for overriding
> page memory coherency attributes, and, along with vendor extensions like
> Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
>
> Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> access attributes.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_m=
odule.c
> index b3fffe7b5062..aa137ead5cc5 100644
> --- a/drivers/gpu/drm/ttm/ttm_module.c
> +++ b/drivers/gpu/drm/ttm/ttm_module.c
> @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching=
, pgprot_t tmp)
>  #endif /* CONFIG_UML */
>  #endif /* __i386__ || __x86_64__ */
>  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> -       defined(__powerpc__) || defined(__mips__) || defined(__loongarch_=
_)
> +       defined(__powerpc__) || defined(__mips__) || defined(__loongarch_=
_) || \
> +       defined(__riscv)
>         if (caching =3D=3D ttm_write_combined)
>                 tmp =3D pgprot_writecombine(tmp);
>         else
> --
> 2.50.1
>

Tested-by: Han Gao <rabenda.cn@gmail.com>

Thanks.
