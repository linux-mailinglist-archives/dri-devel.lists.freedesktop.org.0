Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FEDC83274
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 03:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF7210E0CD;
	Tue, 25 Nov 2025 02:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xRQEC/e1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C22A10E0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 02:58:58 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b73545723ebso940546966b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 18:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764039537; x=1764644337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1i9Pg1fYcoYDqOODigoVmyIThtWa9hBRCsH4xTUzek=;
 b=xRQEC/e1xcPhjJaQNmEruXgcYREIAYUe0je82r6CDN2blk9LIJjCyX95sEVSxCTIrM
 ToNb2QKW3z2y0Qw/0UgSX6VH9A1cyA1fHDvflhFh5NBuAmXe6m03E+f5DhqxAH4HTfem
 AaqfrBL+NQpEYLre/qONV3POunpQc+ZXp42+FdIqIIqG/sPct8lLyBZ86gcrPgPNYy5N
 D5ZL1rsmWtzYeND1t9kw36kcgd3G1zYTxsPA151/OmBm2PMwmDrvmevvAKUSx5zCHoey
 lzdgM/Fjljd0sDE2LMDmDXTQa20M5m5WqIyEGOF2JazPWqbU4qVxsPe0Lp5K93/87BNW
 N2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764039537; x=1764644337;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O1i9Pg1fYcoYDqOODigoVmyIThtWa9hBRCsH4xTUzek=;
 b=nl5DHyV2Rp3uJc7LRcGruv5W5VjWFun0wRoQmO2l8wSL6VKDtLO9PvfAwFuEB2oKdv
 t+QK50y5BqOdUGuUiWRhh5E0d8GxlFLr0p7XDcG5ArDe1BPhAo/ZUJwtXwU/6BGDysiN
 ezrTWyIwZR0tBJlNci4cTqqKCX8TcvWXadOgreMLaERWhIhkagp/Di5tDMrLXdU4uReZ
 ZEbM7vM+jokO+rlmGrpI4zMuyhCBV0ydUTQNnv/aklNNC3TyIhvaRHb16UPBPl2IFvAf
 LrcyqUT5tPSNM+ljPIYnJsNK6ACKFsChStPsRBTquY3NJHmcl9bgKuUIZpFgB2ILqf+4
 oZVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoPG1TYbC2mXpJ6+5Imscsu/LEYG88+rDGugm1u4bUOjzGhzZVd6TeSDKMvFO8HIwu96BOtYz3SDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwicC2uOdgQ3mpQEa5AtGdPHXn9HysXiEv9Y7alHHqnPYiRA6uc
 /1O7WnJ/eVn0SkOVA88b7vXlRJidMzL3glwER9dhK6N2e68LUz0flF6ZxN094GPTGr2w3onKphi
 +ic5fERwyDpkU4GMm1pigXnw0kWm5BMqAgxhBcSYqdQ==
X-Gm-Gg: ASbGnctF48JvmiT3ad17v/+McxLcUt7mRed68HfKCaP3oPP7uYds3x7jHJ9j43kSIjn
 FC5StvX9Gy64yfz9BFF6IprDQSPeeJ8zAw6cwYTdD9dZ6xtwhc6qYBlSB0XW4DnBMCKN1cDKQL/
 NnnwjozoZQ0Ni8FTeP9Yxc17Zo5d3lH9ytuQ1LhvDCtAUXqgJ4hpsmlAKC0tpX9/LwcYqfU+5WC
 PIw6vda3YbsQaQ1J32Jj+78YKjytBR98Mnxg0R/wvqN+1a0BDKpylM5HLXOXoEtiNif/SS9XlMz
 zHbPiQxKaIfyVgcxApD1+IP/FQ==
X-Google-Smtp-Source: AGHT+IH8TKpWAl3cxKGE3BUMxD7JPkRqm1DINKGxjicrIV47HJpJIe+DlpAHS/xEdgIv2iv1G1UOLkU7O+UC2H/ECyU=
X-Received: by 2002:a17:907:d05:b0:b73:6b24:14b5 with SMTP id
 a640c23a62f3a-b7671a47bafmr1669135966b.31.1764039536812; Mon, 24 Nov 2025
 18:58:56 -0800 (PST)
MIME-Version: 1.0
References: <20251120150018.27385-1-christian.koenig@amd.com>
 <20251120150018.27385-3-christian.koenig@amd.com>
In-Reply-To: <20251120150018.27385-3-christian.koenig@amd.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 25 Nov 2025 08:28:45 +0530
X-Gm-Features: AWmQ_bnX2P8Wmw4BNAKuGGkDxfDoHUIjU3-BJv6sxg3jqhoaKkIwPebVtDP3Rfw
Message-ID: <CAO_48GH=9Vym+o4Nn4JkEK2Qummn_VxscRqzS-vf5ZURXr-w_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] dma-buf/sw-sync: always taint the kernel when sw-sync
 is used
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 faith@gfxstrand.net, linaro-mm-sig@lists.linaro.org, 
 dri-devel@lists.freedesktop.org
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

Hi Christian,

On Thu, 20 Nov 2025 at 20:30, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The SW-sync functionality should only be used for testing and debugging
> since it is inherently unsave.

Thank you for this patch, LGTM.

Please feel free to add:
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Best,
Sumit.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/sw_sync.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 3c20f1d31cf5..6f09d13be6b6 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -8,6 +8,7 @@
>  #include <linux/file.h>
>  #include <linux/fs.h>
>  #include <linux/uaccess.h>
> +#include <linux/panic.h>
>  #include <linux/slab.h>
>  #include <linux/sync_file.h>
>
> @@ -349,6 +350,9 @@ static long sw_sync_ioctl_create_fence(struct sync_ti=
meline *obj,
>         struct sync_file *sync_file;
>         struct sw_sync_create_fence_data data;
>
> +       /* SW sync fence are inherently unsafe and can deadlock the kerne=
l */
> +       add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
> +
>         if (fd < 0)
>                 return fd;
>
> --
> 2.43.0
>
