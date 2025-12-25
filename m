Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3818CDDA06
	for <lists+dri-devel@lfdr.de>; Thu, 25 Dec 2025 10:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFDE111B199;
	Thu, 25 Dec 2025 09:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jk5cbEvg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6C111B199
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C1AC40DDE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3FDC16AAE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766656504;
 bh=GilIDlHwNmX2DvdXTed0gVD0Xc+JrJf6zdMnLyNlqeI=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=jk5cbEvgYqzVwBWFCxmEF3jdg+Lh0ZwqE/XWjx0qq4BHivz1PU+vhK4zZwLPJ9Qi+
 7pb/KvqKMvPlt+xHJXj0jTyxSYTLQg2T+2xfqBj+KdTeS4TEg2CabmfzsmUy5xzH8X
 4MzvkMv50/D0q0cC9A07TiY2ykSxkmV7C71pRcwgbjOSuOx7Jyt75+NSrciVzy6Jky
 DApt18hwp6jgJq/Hn0YD6DBYH1gzSgtTL7ghG8wXiw0wQ7cQJA0DbjvIEPxjlp5mGw
 JAjpzD1to3mBmsM/5wJjfAC9TAlmTbL8H9X93f5mS0d9teXmZjASYD3rV4wa93e/cF
 fwMYGyxBxX+7w==
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-3e80c483a13so4550436fac.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Dec 2025 01:55:04 -0800 (PST)
X-Gm-Message-State: AOJu0YxowK0i8WFtXB2FEn3ytVRWHSbqTpC44L/flxxLyHa7rWXH/CJT
 MUsz7KyRQ51UKXFDFi1FRmSvj7Lt408qSM2z8gk1BisWAJcEoutxsKFXLHOnVsYRkYQdXxCIxJG
 dOS5Zs7Q6VmvciPx1CaViP+GdtINOi7k=
X-Google-Smtp-Source: AGHT+IFnkfQaJeM9o52pGeAsmGmsmCQF0mX9H8Ff5URtY5avsALv+90AlwsZ5jqSLRXCn8JBK6tiXl/piSwLMk1Yfvs=
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e5f with SMTP id
 006d021491bc7-65d0eaa75efmr6243347eaf.47.1766656503387; Thu, 25 Dec 2025
 01:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20251124033301.2987159-1-rdunlap@infradead.org>
In-Reply-To: <20251124033301.2987159-1-rdunlap@infradead.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:54:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
X-Gm-Features: AQt7F2r2EWPiUxRZoKWZgkAX6QaCio9hsu-zhnxn_qnEeaMgGQZAl08REyABcws
Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 24, 2025 at 11:33=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
>
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set=
'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
