Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B970C1BE
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 17:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6009A10E34B;
	Mon, 22 May 2023 15:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282B610E34B;
 Mon, 22 May 2023 15:01:32 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-54f92ee633bso2980671eaf.0; 
 Mon, 22 May 2023 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684767691; x=1687359691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LskgHOf5lGt4WW6mhU+hd1LEcknlCNNiGlqCh79E5+g=;
 b=eJzekwbN+X72DkwCy+MOL+AkfzJw7Ouu2/fbRJx9LwCWIVKelYH2d8MSf9QgxtSp6+
 90uO/nFEaG0ZiIddOXSJLoceP7eYcL122SdBLfmwHkvlUmArTt2kdZnhLCABvDe03kFS
 fJaHkNd+pgUhfqdZdYAWkHDHfYJSDbyoR/yJ1OTGGGTe6RsecWWyQtPl4cMQQRnuzmTN
 LPzCuRaHN8Sn78z1ALkb7vU6IpgMAOp0CGV/06AIuha/Fz7B5TB/oeZ53l1yRiasL28i
 yeuXTEswRs3gfO/2VTu7UrF1LyfgDU7qlqR0Yf1JRiROTEeGhSr06JJuN5cxlhrAkX8m
 qkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684767691; x=1687359691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LskgHOf5lGt4WW6mhU+hd1LEcknlCNNiGlqCh79E5+g=;
 b=fDjt0e5zdyIWpCGMIRXkZG+DG+KwZLmZwiPits1xH469Rq9KcToVCmEojCEM2QT93E
 +/ZpvC8M+ap7z+QcqsTwAqr2KI6sfAWInOh7Z/sUMGXf6JeP6VzlGZNYm+vpDKFSSTSb
 qZJ/RPUsg6RfVZhGzGMgkv4vTeDlvVAQUv5uXAoZL/8ZRmK9w95e0izxkdBd8TyRH3/N
 w5CUHB6zcUWtfbIzcW4FG6Kh9sqXURbbLyvFfaqHX8/g6+0Wvw58xUXj1gSm0TrixR6O
 NB1as1d2vUFmJ46qz0Wkkip6oeJi94vuJSEIRvVxxdp1lGCjOmJe93BAi6Q6ueDXzPFO
 XvYQ==
X-Gm-Message-State: AC+VfDw4RFoSvqd1GgSugw6LKipxDU0rUo4zeHJYQj5PmLDbea4Xo8dh
 5mV59pJqrFYTvxZTwqWh0MZE4prxnlZFzz3Snlc=
X-Google-Smtp-Source: ACHHUZ75G0qJhT/m2qSgb9+WWMdeqH1Ah7M89gkxZtrFtqS2/ByNyxqosAJRpSfrrKPHtBuX0EyH1sTv0kdmIoQQWRE=
X-Received: by 2002:a4a:6f45:0:b0:546:ecb3:f42 with SMTP id
 i5-20020a4a6f45000000b00546ecb30f42mr4416072oof.8.1684767690994; Mon, 22 May
 2023 08:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230522090252.913910-1-colin.i.king@gmail.com>
In-Reply-To: <20230522090252.913910-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 May 2023 11:01:20 -0400
Message-ID: <CADnq5_NMdZWU0ES1aKfmr-8-5VOK_Gfve-12ieKwtABuNkzCfg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix a couple of spelling mistakes in
 info and debug messages
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, May 22, 2023 at 5:02=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There are a couple of spelling mistakes, one in a dev_info message
> and the other in a dev_debug message. Fix them.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 59b8b26e2caf..789cc16e1be7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -1007,7 +1007,7 @@ int psp_spatial_partition(struct psp_context *psp, =
int mode)
>         cmd->cmd_id =3D GFX_CMD_ID_SRIOV_SPATIAL_PART;
>         cmd->cmd.cmd_spatial_part.mode =3D mode;
>
> -       dev_info(psp->adev->dev, "Requesting %d paritions through PSP", m=
ode);
> +       dev_info(psp->adev->dev, "Requesting %d partitions through PSP", =
mode);
>         ret =3D psp_cmd_submit_buf(psp, NULL, cmd, psp->fence_buf_mc_addr=
);
>
>         release_psp_cmd_buf(psp);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_xcp.c
> index daeb6bcc9245..e9586a0dc335 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
> @@ -359,7 +359,7 @@ int amdgpu_xcp_open_device(struct amdgpu_device *adev=
,
>                                                 file_priv->minor->index, =
i);
>                                 return -ENOENT;
>                         }
> -                       dev_dbg(adev->dev, "renderD%d partition %d openne=
d!",
> +                       dev_dbg(adev->dev, "renderD%d partition %d opened=
!",
>                                         file_priv->minor->index, i);
>                         fpriv->xcp_id =3D i;
>                         break;
> --
> 2.30.2
>
