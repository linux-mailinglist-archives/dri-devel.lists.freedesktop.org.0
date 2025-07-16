Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E06B07B3E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 18:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA73D10E2C1;
	Wed, 16 Jul 2025 16:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qu1foTA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D310E2A7;
 Wed, 16 Jul 2025 16:33:27 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-313290ea247so18923a91.3; 
 Wed, 16 Jul 2025 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752683607; x=1753288407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6kvfz6qI7DeZGGpdbs/tIzaH7qf+aL2nFfg6lLF3So=;
 b=Qu1foTA5QD2aCw4LUJBn3/FstXmq0ks1pbuQG3Bo6XYZQhCzq8X9x9TTKZqi23bXKB
 A6eVpCi/vlsY974lruDI/eMDUW3IVcIYd/L5ipnEk95stnAjER647EAJlbRYaiKyuwdd
 AjTocEwSz5F0sfkDf09hxeAaiXuv/DfDJKFeSK16he5n0vNj5PT2zk+7sjHbGAuVQkmb
 ISJU9oMDZPGxTH2prhaNTU5Z7zSk7+GdGsAtEMHupertI+NdbfxY/z6axwYyK6M92Qhv
 extDF+8F1bqkBeYcAiGYZYlgsZZHh3KVq1OqNACerUmIbkKb4ctlfMrv02hXeY7oDzRu
 KRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752683607; x=1753288407;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6kvfz6qI7DeZGGpdbs/tIzaH7qf+aL2nFfg6lLF3So=;
 b=wKKfth3KayczM4n2wxKcWDgyLPpnq5rB80x8MH7K1EfWORSWMJOe+qCEeGAOU9zGFf
 p1u47zUzLxEMr+FvEB/QBILaQcd939y9QeNNtU/fAT0JyOtPCeouOM4CQnfTyF9XeZs0
 gX9cZg9OT5hdBHOZVMw2GUccqW0t4rqWf3rONmJuanjQpGWZohvwy8g7F2gbhYSHfaIl
 Mln57XK4G/1JOyKF9j9eNHuYA7Dh1akIHSxhSY8/3a2wkv2OQKjDelOdWIX90FsnMD7w
 yclcCY0BKLssS+jYyZPq1lna9ospCuMDPPczG6TVTiykTumx/nLnJkvKUw5mjtW0lnam
 QU6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGMafLPa+qGlZkK8BblsR22ExXqEC5mSrsTaa0vwfmYHcx0ts7KmB8om3IUH/9f4g6Gyjr4oh9@lists.freedesktop.org,
 AJvYcCVvwwRm2h20l2PBDFulwaMIq++JYOnXseaiY/ilZwOVHyta1iqfWJ8UpOVXXMLwlo82/oToNvnajaVs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlKqtqHRURqUbHEzzsMAOnwJzZBvImgo8tYoCx71ZWeMn68koX
 rk4rgDvdckUUWV9K1AT86gnm7lkh+E5+d+KR95bAGi7/WsB3YB327i90ujMMm/DM1beEF/xp1FE
 QPI/vQzPtFr2RjYBa0585JbICbcj5DQc=
X-Gm-Gg: ASbGnctvDvP6Tbfc0G4jv3QbcT4yD5CJUg391yYYjMCJpAC2nOeHNdqBJSMbx2Elyo5
 DYLkgssZrh4ImG8eUZ4poyZYW4Mq0kIdfLmV4AbLMeEpmKDinGGqJGXlRLHDzXInt8rcxH8HWsx
 BIgpLUPtL/Y0431B+80cZkTNi+CPu8ddcAMDmvA1ocK6i+KSHh30Yf11o9+A79VO7UAVVykJvUD
 KIK68aYIqTxpFNTFL0=
X-Google-Smtp-Source: AGHT+IGH02kK3nf0wBnxEd6jFb8Tsf0f+O7BQ8LAJmQ7cLUtzxcWAGs+OU1waCN/Gja7YYGXXxQ/tdPDawx20M8+Yx8=
X-Received: by 2002:a17:90b:5610:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31c9e6048aamr2513820a91.0.1752683606488; Wed, 16 Jul 2025
 09:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250716161753.231145-1-bgeffon@google.com>
In-Reply-To: <20250716161753.231145-1-bgeffon@google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Jul 2025 12:33:15 -0400
X-Gm-Features: Ac12FXynnQtGo7k60pqb-2x03E1O-iBR7bwfy-E4dA6mxcK93JHx0XXz9lriT9c
Message-ID: <CADnq5_P+a2g_YzKW7S4YSF5kQgXe+PNrMKEOAHuf9yhFg98pSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Raven: don't allow mixing GTT and VRAM
To: Brian Geffon <bgeffon@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Yunxiang Li <Yunxiang.Li@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Prike Liang <Prike.Liang@amd.com>, 
 Pratap Nirujogi <pratap.nirujogi@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Garrick Evans <garrick@google.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, stable@vger.kernel.org
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

On Wed, Jul 16, 2025 at 12:18=E2=80=AFPM Brian Geffon <bgeffon@google.com> =
wrote:
>
> Commit 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)=
")
> allowed for newer ASICs to mix GTT and VRAM, this change also noted that
> some older boards, such as Stoney and Carrizo do not support this.
> It appears that at least one additional ASIC does not support this which
> is Raven.
>
> We observed this issue when migrating a device from a 5.4 to 6.6 kernel
> and have confirmed that Raven also needs to be excluded from mixing GTT
> and VRAM.

Can you elaborate a bit on what the problem is?  For carrizo and
stoney this is a hardware limitation (all display buffers need to be
in GTT or VRAM, but not both).  Raven and newer don't have this
limitation and we tested raven pretty extensively at the time.

Alex

>
> Fixes: 81d0bcf99009 ("drm/amdgpu: make display pinning more flexible (v2)=
")
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: stable@vger.kernel.org # 6.1+
> Tested-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Signed-off-by: Brian Geffon <bgeffon@google.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 73403744331a..5d7f13e25b7c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1545,7 +1545,8 @@ uint32_t amdgpu_bo_get_preferred_domain(struct amdg=
pu_device *adev,
>                                             uint32_t domain)
>  {
>         if ((domain =3D=3D (AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GT=
T)) &&
> -           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_type =
=3D=3D CHIP_STONEY))) {
> +           ((adev->asic_type =3D=3D CHIP_CARRIZO) || (adev->asic_type =
=3D=3D CHIP_STONEY) ||
> +            (adev->asic_type =3D=3D CHIP_RAVEN))) {
>                 domain =3D AMDGPU_GEM_DOMAIN_VRAM;
>                 if (adev->gmc.real_vram_size <=3D AMDGPU_SG_THRESHOLD)
>                         domain =3D AMDGPU_GEM_DOMAIN_GTT;
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
