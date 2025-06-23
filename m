Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0BAE4AA9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 18:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E6B10E431;
	Mon, 23 Jun 2025 16:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SXXeo1iP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9A610E42E;
 Mon, 23 Jun 2025 16:24:23 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-312f53d0609so481402a91.1; 
 Mon, 23 Jun 2025 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750695863; x=1751300663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1HXxEgsvpcVOGzEhHDysn3u3lzhqwIm266G2/TbSC1o=;
 b=SXXeo1iPuNskqS+kk0xPYM+bjjtbYqbaDhKHR3CFedAhTgQbK/pLGynEsOh6rHmVJV
 EIDUx7425Yr6TvvtceEcuXcB0fewfvDSTb5w1j9ULmytl4/yWOIfzwludZaIW1bbj/TW
 ovBokEHVDHwlE4GyGSiyqTN2x/oe0mYUMrb5XErOXnUD/CJUz3qJ/dJvQJ4a+MtZAUab
 LaMaYyElflpK+lSud7B1X/npmv9oKSq+XRsgK/WnPj20ZxhKbLN2eKwtilD0B7JPJfEP
 tHSJmDEUECRHv6D+6XdpQGQXVNL6WVqKSQyEUtGcjFME+Uyb+CAicEZ95DFnn96Hrw4R
 SUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750695863; x=1751300663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1HXxEgsvpcVOGzEhHDysn3u3lzhqwIm266G2/TbSC1o=;
 b=DwBhSy8uDixdDw5v1viJCR0Bu+00DywW2oqorjF3YulbDLIRc2plrFXZiDQy+3EWvz
 uEW78zA61YDp16XGdE/P7MgIi9M+YqaIxVv08vz4XzGoNv/Taevcj2rEt3wW1uc7p+oS
 ZZcI0CHqrA/XkKaJEtN6BaCYI7tFkejR6xbc+m3mURodF6N0fs+JGczlDwLF3NjZia38
 ZAeq+WMRMRJXbZ/ZB8ZsXlLrxBbbkV8e356MXrg8UGhQhM0gEWGe919rRVkxSkL7CBCQ
 wY8ns26fF0C0Uc/8r75ulKzMxUqiatsIDM6y2F7KwNeiv0f/Y3twt6r44ucjXuGZDifB
 EljA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzEo9+cadsURF3GF7JcoStaX26VPyZgkKL9vRthrWB+9O2TNK8rTWwLWFbIjH0VOhevWCEv4rMA8ew@lists.freedesktop.org,
 AJvYcCW0IBSuIoJEk4FvHyMf6s7vSr10ATEiaDPOEkUwtw86fMAPeX6LWuOk+y7PNwJqIUL0mWD6izdS@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzi8J5ffxPegdiy1ojpB9BuAuefGE1L48n8Vp5fGQsddQEtzRkq
 6JJ8Z6e2avmkMSUTYp0BspiWznpsJl1WLEp0GZE56pKGC1aqdaSP/Vh2o1tN9oy6iVAvULryq+s
 Iw3ciflppgp92JSqCgziF5VVZIVzbCRU=
X-Gm-Gg: ASbGncu7v8wdbQh4wINnW5IPv6X1IVRvN3LcpNHAnbNMHCKAdOTFwAdHcATmilgBFZe
 Qnm+NWjDLsAYFXbbmoAqZGEWQUqlLJoYpIb0tAgZh06g4PLSmB8EXReLmpqKCwNxgxKRR5afS0u
 IjeShznKNNy10zb6QbnUovIs5C6bw/H+MFbcqWlgm/BVy/
X-Google-Smtp-Source: AGHT+IHRBD5NsjWiDv+77SKSa7pKnaFs1NEZIqgFAICeUK481K54Myl2oxEEp7SX2igzgN7bTePX9jgv/Vq40226rOg=
X-Received: by 2002:a17:90b:6c4:b0:312:e9d:4001 with SMTP id
 98e67ed59e1d1-3159d8f9d84mr7720373a91.8.1750695863302; Mon, 23 Jun 2025
 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250623084108.29627-1-colin.i.king@gmail.com>
In-Reply-To: <20250623084108.29627-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Jun 2025 12:24:11 -0400
X-Gm-Features: AX0GCFtNfLLS8D_rr8yg1ilZOe8LQ0F3ff5f3iHikmyfb7k5C8NYRXQQOBwEkBc
Message-ID: <CADnq5_Pnxgp92v+gKupG+8985d_NCU7kvO+VpC0b0yqoHoZa8A@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd: Fix spelling mistake "correctalbe" ->
 "correctable"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Mario Limonciello <mario.limonciello@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks.

Alex

On Mon, Jun 23, 2025 at 4:41=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a pr_info message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 7f8fa69300bf..eaf95ee5148a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2281,7 +2281,7 @@ static void amdgpu_init_debug_options(struct amdgpu=
_device *adev)
>         }
>
>         if (amdgpu_debug_mask & AMDGPU_DEBUG_DISABLE_RAS_CE_LOG) {
> -               pr_info("debug: disable kernel logs of correctalbe errors=
\n");
> +               pr_info("debug: disable kernel logs of correctable errors=
\n");
>                 adev->debug_disable_ce_logs =3D true;
>         }
>  }
> --
> 2.50.0
>
