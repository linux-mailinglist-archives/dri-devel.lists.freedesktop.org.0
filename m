Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4793C9FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 22:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292D410E8C4;
	Thu, 25 Jul 2024 20:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ctpkLevM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6A910E87A;
 Thu, 25 Jul 2024 20:59:29 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-70d25b5b6b0so249548b3a.2; 
 Thu, 25 Jul 2024 13:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721941169; x=1722545969; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4gCniBGiUh7RbvIXsajAgjTfTdLghfosUa+OF1HFMA=;
 b=ctpkLevMkm4CeTyQrJFzXE4TkfpJKJ241c4UWHCVYib53XYEH3rzWi/PcozzJYAz2j
 EQIyDb4SEDCxDbv+RIvBumoIwepyKzyi7eux+rsFVrASdxpFHX+OVZYztP4NG0ZaBM2P
 IIATaQ22+PfyBY966riNHVg9nTptZYJTP2IMnVZ9++75exPR40xPwnvgts4b/SWyRdjy
 OC6iWm1a1wX0WsvHiL1mWUkJ3GnyBK7vw4Xbak23nxFxr/Os/ZYCApDL7paD4a87zl/0
 z80pt93AqadSNU1+Om1sx3tH6+vUzM9cuV0rhwD5aCPL8POaZVRRWrj8HQ07SJ1Kddaq
 45XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721941169; x=1722545969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4gCniBGiUh7RbvIXsajAgjTfTdLghfosUa+OF1HFMA=;
 b=k8l+sQWXKoD2+UqNZN65xEkpGqlRsrIFgA5gndyoz8sdGrS6gP0xJ68oqybcqXHHi+
 wElOT1iZvK4UJwrZjoY1jwvzLy8ezTax7HINopB40E28/iGY9NyBzwVOAdiCZvfavJn2
 p5oz3gNvN8jnhw0RYiqtMTDtbWfT5yupjd5rFRZveaRkiV2ffmGu5nm+EpvGxCVbgNcE
 joca0rx7exxTarXdq9ZsFJlmYX7u6ndDJ7xkkW0ZQ1Nx5EAnfDiYqjYUPQr7RbBRf8JV
 vs12tIq67P6Ebxtvp7PEQ0xRI9xDXl3zdkQ/Gj4t+hsU0KNe5qifc1aszO4V+e357O/z
 sVXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqaYIsjn9ggww6jaWZpJYZnDBIeH29U4uMdHgeGSCCDOGbx8iwUuOYogXYpuHe6W9I7/ZpfBe2cQVELMxV9URrHFdER0irLwoI1Sig7R6r7hQkZjCRLUdkY9UVaAFuip997ZpZqdjDGutmLBWryA==
X-Gm-Message-State: AOJu0YxXM9JGWB6Drk9yhh550Pz43i9RVMskzLWt/Kjgy3ttJzIl1CFN
 qhMjWCswuFcav/+JoFrf25gNJ4Vpvh++AWGJyeQ2IYnEP4mQjV4ZXH1PpYaHdLxHdOo4mboRCXB
 vWcAmh+ZpiUqmcM7kcW5ec7c2vDiKjg==
X-Google-Smtp-Source: AGHT+IFA0VZ111JxLn9HdP00YaL4Z9quBI2prN0idkkDGmhMU4bZZeeTu2CxFkR1MXDUXDfcRnEz5m1mcFb+wqqyzHE=
X-Received: by 2002:a05:6a20:7494:b0:1c0:bf35:ef4c with SMTP id
 adf61e73a8af0-1c4727aad83mr5501536637.11.1721941168624; Thu, 25 Jul 2024
 13:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Jul 2024 16:59:16 -0400
Message-ID: <CADnq5_NuAL4=hMyc6G0QkbSrjCXa6qFM-bFtt3A7DY6cCmCt9w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
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

Applied.  Thanks!

Alex

On Thu, Jul 25, 2024 at 2:20=E2=80=AFPM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Several cs track offsets (such as 'track->db_s_read_offset')
> either are initialized with or plainly take big enough values that,
> once shifted 8 bits left, may be hit with integer overflow if the
> resulting values end up going over u32 limit.
>
> Some debug prints take this into account (see according dev_warn() in
> evergreen_cs_track_validate_stencil()), even if the actual
> calculated value assigned to local 'offset' variable is missing
> similar proper expansion.
>
> Mitigate the problem by casting the type of right operands to the
> wider type of corresponding left ones in all such cases.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling inf=
ormations v11")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
> P.S. While I am not certain that track->cb_color_bo_offset[id]
> actually ends up taking values high enough to cause an overflow,
> nonetheless I thought it prudent to cast it to ulong as well.
>
>  drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/rade=
on/evergreen_cs.c
> index 1fe6e0d883c7..d734d221e2da 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct rade=
on_cs_parser *p, unsigned i
>                 return r;
>         }
>
> -       offset =3D track->cb_color_bo_offset[id] << 8;
> +       offset =3D (unsigned long)track->cb_color_bo_offset[id] << 8;
>         if (offset & (surf.base_align - 1)) {
>                 dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned wi=
th %ld\n",
>                          __func__, __LINE__, id, offset, surf.base_align)=
;
> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct rade=
on_cs_parser *p, unsigned i
>                                 min =3D surf.nby - 8;
>                         }
>                         bsize =3D radeon_bo_size(track->cb_color_bo[id]);
> -                       tmp =3D track->cb_color_bo_offset[id] << 8;
> +                       tmp =3D (unsigned long)track->cb_color_bo_offset[=
id] << 8;
>                         for (nby =3D surf.nby; nby > min; nby--) {
>                                 size =3D nby * surf.nbx * surf.bpe * surf=
.nsamples;
>                                 if ((tmp + size * mslice) <=3D bsize) {
> @@ -476,10 +476,10 @@ static int evergreen_cs_track_validate_cb(struct ra=
deon_cs_parser *p, unsigned i
>                         }
>                 }
>                 dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %=
d, "
> -                        "offset %d, max layer %d, bo size %ld, slice %d)=
\n",
> +                        "offset %ld, max layer %d, bo size %ld, slice %d=
)\n",
>                          __func__, __LINE__, id, surf.layer_size,
> -                       track->cb_color_bo_offset[id] << 8, mslice,
> -                       radeon_bo_size(track->cb_color_bo[id]), slice);
> +                       (unsigned long)track->cb_color_bo_offset[id] << 8=
,
> +                       mslice, radeon_bo_size(track->cb_color_bo[id]), s=
lice);
>                 dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d =
%d %d %d %d %d)\n",
>                          __func__, __LINE__, surf.nbx, surf.nby,
>                         surf.mode, surf.bpe, surf.nsamples,
> @@ -608,7 +608,7 @@ static int evergreen_cs_track_validate_stencil(struct=
 radeon_cs_parser *p)
>                 return r;
>         }
>
> -       offset =3D track->db_s_read_offset << 8;
> +       offset =3D (unsigned long)track->db_s_read_offset << 8;
>         if (offset & (surf.base_align - 1)) {
>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not alig=
ned with %ld\n",
>                          __func__, __LINE__, offset, surf.base_align);
> @@ -627,7 +627,7 @@ static int evergreen_cs_track_validate_stencil(struct=
 radeon_cs_parser *p)
>                 return -EINVAL;
>         }
>
> -       offset =3D track->db_s_write_offset << 8;
> +       offset =3D (unsigned long)track->db_s_write_offset << 8;
>         if (offset & (surf.base_align - 1)) {
>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld not ali=
gned with %ld\n",
>                          __func__, __LINE__, offset, surf.base_align);
> @@ -706,7 +706,7 @@ static int evergreen_cs_track_validate_depth(struct r=
adeon_cs_parser *p)
>                 return r;
>         }
>
> -       offset =3D track->db_z_read_offset << 8;
> +       offset =3D (unsigned long)track->db_z_read_offset << 8;
>         if (offset & (surf.base_align - 1)) {
>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not alig=
ned with %ld\n",
>                          __func__, __LINE__, offset, surf.base_align);
> @@ -722,7 +722,7 @@ static int evergreen_cs_track_validate_depth(struct r=
adeon_cs_parser *p)
>                 return -EINVAL;
>         }
>
> -       offset =3D track->db_z_write_offset << 8;
> +       offset =3D (unsigned long)track->db_z_write_offset << 8;
>         if (offset & (surf.base_align - 1)) {
>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld not ali=
gned with %ld\n",
>                          __func__, __LINE__, offset, surf.base_align);
