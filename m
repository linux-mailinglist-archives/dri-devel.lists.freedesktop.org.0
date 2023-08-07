Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494CE772C85
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519E810E33E;
	Mon,  7 Aug 2023 17:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE0210E33C;
 Mon,  7 Aug 2023 17:16:30 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1bfce114ef9so1226031fac.1; 
 Mon, 07 Aug 2023 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428590; x=1692033390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5CtEHiWVLExiLVk/Ne/a8yYfKyE9Ijl7i0zdyKzVeI=;
 b=bFnA5CRZh30H13fPfTiRB9CyHKmj6VXYz6mZb10lO47T83aui8WKz54b7HBYXQKRmX
 tHqydMMWzQ3Rp8IG9fZpFhjbSaPZ8o2AtkuwIUCGjEqeHOO74XtyufkznPjDBnYnxmyP
 6Uze5+AAEDoiUhSoVnqIoIwMpFthPtd+2+3Vhhm0gdhrrfNYNa8TwfmuUDWy2loprJSh
 WVowGlJflo9UVI8RcUSlkm7aKDAqjRZgFzNzT+Q+EcdFZzeCdSZvirtgct2MgUSJcVgm
 AQgJi7EfDVYO918UNryeBExbQfITp8iMXZ2zCPlof+0Vaj8kcewBr6pjrk7jE27EZTuA
 R1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428590; x=1692033390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5CtEHiWVLExiLVk/Ne/a8yYfKyE9Ijl7i0zdyKzVeI=;
 b=THplDVD6JicSWNWh9g2VqBi6ehIqj2XSt6lpCfmDUhcjPxlYW2Hd59F55U+qJ1YFHP
 v6pn9icsiy/8V8I4OVLJovPZOpaomJOuCYC3m056m3ngiRY2kMPe3ivaRT9F4YMkPdaI
 87EIG/xiMRMXkkHoMcxOIiWEv+xT8QhDE6L6l8mQH6gKhtMnvozim6Q9HBcjkIWRvIoO
 qie+DcBD10ik4ooL/MvjO3d8i/zhd0AA3af6fjpQ3dOaJn3qSNKrpr96CeNviC7BRidb
 4iA3DRS7aUU9yk8F49G7JwQiTWTADicoYXe/zis+3+ccTER3cvHcGxSa3Z5LJM9k+3om
 GwEA==
X-Gm-Message-State: AOJu0Yx2dmrZ3xrsBw5hknFPY6kcy55SnW8gjP9hMfDNfMm9dEB31gIB
 PqQ5rAkdBRb5o5UWsbkVY16/BXkQl54f+eOO5Jk+QSwZ
X-Google-Smtp-Source: AGHT+IEgTjnK9hGLkMHPf4Qxenexm4p/7TOxnImfbCWdfyqCojlj2U0TGwweco9fJe4H8S2um4LGUggd+ojUPFqpTKM=
X-Received: by 2002:a05:6870:350f:b0:1b4:685d:55e4 with SMTP id
 k15-20020a056870350f00b001b4685d55e4mr11894587oah.39.1691428589952; Mon, 07
 Aug 2023 10:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230802063529.11608-1-sunran001@208suo.com>
In-Reply-To: <20230802063529.11608-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:16:19 -0400
Message-ID: <CADnq5_Pf4A=ABS+QJp9DkNxV1PGdSSpQtRQFZLuDpJqDAZ+0HQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in cik_ih.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 2:35=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/am=
dgpu/cik_ih.c
> index df385ffc9768..6f7c031dd197 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
> @@ -442,8 +442,7 @@ static void cik_ih_set_interrupt_funcs(struct amdgpu_=
device *adev)
>         adev->irq.ih_funcs =3D &cik_ih_funcs;
>  }
>
> -const struct amdgpu_ip_block_version cik_ih_ip_block =3D
> -{
> +const struct amdgpu_ip_block_version cik_ih_ip_block =3D {
>         .type =3D AMD_IP_BLOCK_TYPE_IH,
>         .major =3D 2,
>         .minor =3D 0,
> --
> 2.17.1
>
