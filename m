Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932CCB1419A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 20:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708BD10E566;
	Mon, 28 Jul 2025 18:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PSXnJeKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830C310E563;
 Mon, 28 Jul 2025 18:00:19 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-31306794b30so874330a91.2; 
 Mon, 28 Jul 2025 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753725619; x=1754330419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpQI1KC2wT9XgfPGyH/YYdG0R2fOTfMKCCLWUgTuwGA=;
 b=PSXnJeKH6Gz7WvQgisIdvSzqYLXeh86plnNnajlqUVueLXBKeeucwaxRbjaPTFmOkp
 E3q+aqR9WBTbLeQIjArgZFETn4QSbobWcT4ogM3nO6n7x985JwePehzfnBqgHZh11WQY
 PBGJvBy2v9mbBDoLRR284FAQ0siWYHcL4k3UKhidRkr4OCHC61wx9L39hUiqqfS1c0PW
 Tvji9Kx4pFKZLZBlebGxsrBwdnMDO0x5tVgo3l/A766WAfILmdVXkSmzCBvDgvUW1JUo
 nOksjrDf+rhv/c5BZmli0JB2vsQeO+hclSfEfzZC3MXdx2NjnzMK4Iu5qSGFwzUSPJ/Y
 2QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753725619; x=1754330419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpQI1KC2wT9XgfPGyH/YYdG0R2fOTfMKCCLWUgTuwGA=;
 b=eL6hU+OrIOq0WOXXX9kVT7e5HStNlwTCdZ3Ae6qchDMOZP/sW//R+KSsvcBYYwagZg
 f/QfrVWn3Re2zqXBNiY/y7JUBKQg3rmmsjPd7JVSBOfJgK/2n+615MwEz+zirsACvwYD
 vLSW9ZgML0UNzUL1WWH6H8yh6J35XUjSzRdES5vdUQr5ktg1KA5tvj86A6+3/EYIgS9B
 YoSatS9drdFx6zRbEHgZBaoWPSU+uAjoe9YFo0kCPrE9nOHFu6brrJbbHMr42V0VUZe/
 z8IZcNG9sFjqyXHjpm7gixsL8ATYDnih+AjYfTeq2zJgOabmkV0Fl0+7JMTEXsfBkXA5
 rmrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5CVpKbI2lG8wApse6zNu0W44rXGalIeadVqgzd1TRMR5LOMXBfFRs82BuklbUEuil1t63GiJ47vo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi1XTTZFiVyEqKp+jP3rrqvgGDwQS304Z7cvUNUlSDnqv67FKm
 vhuFhpIstNI0GxcpEmtkaMciUm9du1US2DXTxaE5Zl55IcZ6g2bTdtN4VE0IThfQGA5HDEC0fdE
 MraOWnSYE388NyfQzY4t1IscD5OXpI+Y=
X-Gm-Gg: ASbGncuVOgctXw2ildRZHIkqa6VN+j0A56RDSrUpAvq+NJzh46tswPOkU1NbJ83lgZm
 3qO5Dz4pyQFjCqtb9aIPYMqYBAombtaC8+1oWHV0r/rXdFZ7xf4L9PBbdyPNuLwcgWVsAGUwlfh
 jj2G45MlSI0MaUwZ0KLE0Pt4M8v7d08qHDqJbjdZwDkycqjcIZgCZCob/cYLFQgW15uYtcUt+b7
 19y+C3QzMLH+m5QEaY=
X-Google-Smtp-Source: AGHT+IHBm3pi71ZB60sCHLcv253sYMpKAC6ID9mYMI42Pb8OWFlem/usUnV5ejHcNAk6JQ5qW9JjpS6TpnOmaDXSY1k=
X-Received: by 2002:a17:90b:52cd:b0:31f:3d6:6d98 with SMTP id
 98e67ed59e1d1-31f03d66f70mr1657869a91.5.1753725618831; Mon, 28 Jul 2025
 11:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250718195738.2919761-1-alexander.deucher@amd.com>
In-Reply-To: <20250718195738.2919761-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Jul 2025 14:00:07 -0400
X-Gm-Features: Ac12FXwOiEzK_HLSS7Jwlp1MFXxgc1-hOKYkCbBW6MwLe27KMi_CWu0K31rD6bY
Message-ID: <CADnq5_P=FECmi3idc15pzcQ4PFquBypzAj_PVpJO76WL1dutfA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: update mmhub 3.0.1 client id mappings
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

ping?

On Fri, Jul 18, 2025 at 4:08=E2=80=AFPM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> Update the client id mapping so the correct clients
> get printed when there is a mmhub page fault.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c | 57 +++++++++++++----------
>  1 file changed, 32 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c b/drivers/gpu/drm/=
amd/amdgpu/mmhub_v3_0_1.c
> index 134c4ec108878..910337dc28d10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0_1.c
> @@ -36,40 +36,47 @@
>
>  static const char *mmhub_client_ids_v3_0_1[][2] =3D {
>         [0][0] =3D "VMC",
> +       [1][0] =3D "ISPXT",
> +       [2][0] =3D "ISPIXT",
>         [4][0] =3D "DCEDMC",
>         [5][0] =3D "DCEVGA",
>         [6][0] =3D "MP0",
>         [7][0] =3D "MP1",
> -       [8][0] =3D "MPIO",
> -       [16][0] =3D "HDP",
> -       [17][0] =3D "LSDMA",
> -       [18][0] =3D "JPEG",
> -       [19][0] =3D "VCNU0",
> -       [21][0] =3D "VSCH",
> -       [22][0] =3D "VCNU1",
> -       [23][0] =3D "VCN1",
> -       [32+20][0] =3D "VCN0",
> -       [2][1] =3D "DBGUNBIO",
> +       [8][0] =3D "MPM",
> +       [12][0] =3D "ISPTNR",
> +       [14][0] =3D "ISPCRD0",
> +       [15][0] =3D "ISPCRD1",
> +       [16][0] =3D "ISPCRD2",
> +       [22][0] =3D "HDP",
> +       [23][0] =3D "LSDMA",
> +       [24][0] =3D "JPEG",
> +       [27][0] =3D "VSCH",
> +       [28][0] =3D "VCNU",
> +       [29][0] =3D "VCN",
> +       [1][1] =3D "ISPXT",
> +       [2][1] =3D "ISPIXT",
>         [3][1] =3D "DCEDWB",
>         [4][1] =3D "DCEDMC",
>         [5][1] =3D "DCEVGA",
>         [6][1] =3D "MP0",
>         [7][1] =3D "MP1",
> -       [8][1] =3D "MPIO",
> -       [10][1] =3D "DBGU0",
> -       [11][1] =3D "DBGU1",
> -       [12][1] =3D "DBGU2",
> -       [13][1] =3D "DBGU3",
> -       [14][1] =3D "XDP",
> -       [15][1] =3D "OSSSYS",
> -       [16][1] =3D "HDP",
> -       [17][1] =3D "LSDMA",
> -       [18][1] =3D "JPEG",
> -       [19][1] =3D "VCNU0",
> -       [20][1] =3D "VCN0",
> -       [21][1] =3D "VSCH",
> -       [22][1] =3D "VCNU1",
> -       [23][1] =3D "VCN1",
> +       [8][1] =3D "MPM",
> +       [10][1] =3D "ISPMWR0",
> +       [11][1] =3D "ISPMWR1",
> +       [12][1] =3D "ISPTNR",
> +       [13][1] =3D "ISPSWR",
> +       [14][1] =3D "ISPCWR0",
> +       [15][1] =3D "ISPCWR1",
> +       [16][1] =3D "ISPCWR2",
> +       [17][1] =3D "ISPCWR3",
> +       [18][1] =3D "XDP",
> +       [21][1] =3D "OSSSYS",
> +       [22][1] =3D "HDP",
> +       [23][1] =3D "LSDMA",
> +       [24][1] =3D "JPEG",
> +       [27][1] =3D "VSCH",
> +       [28][1] =3D "VCNU",
> +       [29][1] =3D "VCN",
>  };
>
>  static uint32_t mmhub_v3_0_1_get_invalidate_req(unsigned int vmid,
> --
> 2.50.1
>
