Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A3392A865
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 19:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A1B10E1A9;
	Mon,  8 Jul 2024 17:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HRwouNCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF5710E135
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 17:50:10 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-df481bf6680so4080160276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jul 2024 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720461009; x=1721065809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nESyMzGZXBtAqIeO/AYycg3VVtY82ta3I2iF0FVP4cE=;
 b=HRwouNCh+Ek1qiIlujeHV2O5wHh1f5V39TrWGKHhqSf5a45KNNalPdAfwLcU8yA585
 lmyFA+/MGIgxdw73iC7yXjpbL0CHKKnlr7thfg2w/FJt9dEMD6MmD8IGhGMY1tLc2GLv
 aKsUwOQGPNuzFrKab55DXDP9lRLR7icyBrYuXQ2I0LQN2eXeE9JvWGiRjD9bTaGwh8xO
 4m38w9FVR9+DZw27DBCIV6y12FEle2T2ECDLwDOKFGarjRLCcgt5emhOsr0fNkFsiEeH
 2qx6qeTd6UtXq8J1dX0XfwRhatNYWNLbJQZmQg1u8vc4bsFkSZZtnk3s2Bz1W6jiY8ds
 Ckdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720461009; x=1721065809;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nESyMzGZXBtAqIeO/AYycg3VVtY82ta3I2iF0FVP4cE=;
 b=wIyhAZ4mP0EJTDKXb47pt3Q8oXblLk02wIwCoS7zz49jnDyzBjGff4rMb9WGaC5ljc
 t1cISRZVC4s+kE19xX/cINPfJo88o6sQlYKUl1aGC7wjRDNNzqXNJyjx7Wmmwa8IRG9V
 Unz773BQshoh77RMdCobqR2HVxvnVaIKO9owcBTB9EUH0luT4kR582ewvsBVw3xnNHxR
 kPtDni6lvG6445zt3UIZP3FikhHl5dtkBchH149nUfOR2Gm/Ae3zH1F8baUvx71StC//
 ekocxEHiH+lrCE1PT8i3OE12Ou3czn+05izqicwx3dGv21LJlZemorZrOhdRuL2VkiVu
 Fv1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWavBcsJQlX9eC2sM8RL2STJpKnCvO2BJttxf3Hd6xgcPD0wkchcHwePf9+cshLxH+SBrjq28Or+s7UgLCOZl/Ux9E1iroS/B2BOYB8+yfP
X-Gm-Message-State: AOJu0YyYN49a89BpAgv6cubnD7m5TEJRXYiSHAENkquRCO4v9y0hSFr7
 9NoR+dwlm/7ln3eye3ynLEqDnu4xbktCrdi1bOIWwCo5BGG/NBHdPK62B9unSjEA6STLjC9P/wY
 w2mjJZoNF9bM20mZs8uOFwqyV8WfBQYM+qGJH
X-Google-Smtp-Source: AGHT+IHcxq/i9rzCxsEN5hnVo4LPbu8O3jBlhcP+IANI38Pst6MQnmRwrHXpKPTOw9a59dfbicjTNMHGzlIpXAxgcP4=
X-Received: by 2002:a05:6902:1361:b0:e03:4e08:c93c with SMTP id
 3f1490d57ef6-e041b03995dmr571404276.13.1720461009288; Mon, 08 Jul 2024
 10:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240708134654.1725-1-yuzenghui@huawei.com>
In-Reply-To: <20240708134654.1725-1-yuzenghui@huawei.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 8 Jul 2024 10:49:57 -0700
Message-ID: <CABdmKX1CXWuw0-gRukZeSoF=SZFi3eRPELe=EU_-q3OVKQHZzw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Ensure the driver name is
 null-terminated
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 shuah@kernel.org, wanghaibin.wang@huawei.com
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

On Mon, Jul 8, 2024 at 6:47=E2=80=AFAM Zenghui Yu <yuzenghui@huawei.com> wr=
ote:
>
> Even if a vgem device is configured in, we will skip the import_vgem_fd()
> test almost every time.
>
>   TAP version 13
>   1..11
>   # Testing heap: system
>   # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   # Testing allocation and importing:
>   ok 1 # SKIP Could not open vgem -1
>
> The problem is that we use the DRM_IOCTL_VERSION ioctl to query the drive=
r
> version information but leave the name field a non-null-terminated string=
.
> Terminate it properly to actually test against the vgem device.

Hm yeah. Looks like drm_copy_field resets version.name to the actual
size of the name in the case of truncation, so maybe worth checking
that too in case there is a name like "vgemfoo" that gets converted to
"vgem\0" by this?

>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/t=
esting/selftests/dmabuf-heaps/dmabuf-heap.c
> index 5f541522364f..2fcc74998fa9 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -32,6 +32,8 @@ static int check_vgem(int fd)
>         if (ret)
>                 return 0;
>
> +       name[4] =3D '\0';
> +
>         return !strcmp(name, "vgem");
>  }
>
> --
> 2.33.0
>
