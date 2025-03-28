Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FB9A750E5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 20:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF1310E1A9;
	Fri, 28 Mar 2025 19:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B6CplBUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AEB10E1A9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 19:39:27 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id
 71dfb90a1353d-52413efd0d3so1051259e0c.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 12:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743190766; x=1743795566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EgkjJnqFEchC7Uw8U+7qjzija67PQT0tBgVkDWBcANc=;
 b=B6CplBUpYVGo5Wg6eOigZfM15TKAMGtBhOZRtphxsNaZoLtA9nhSAM8qmgr0zZIL/U
 0U5ET35k9VSTDSnl94+Gc2wf7VY2VRRibwoSbQT13F/gy1WpAgsfoF83wFNRRZaN3yql
 BmX8680FfscL8yD5S8tTVG5f8T1iP3MH62Pcqj9S8GZAbMr248IElEYnzmnE3OJJdzB0
 v4EkHaaQclZY+rzn21FvTLFxExDp9PjsFJzCkPHuA4O14XPQxGkPt2vhd42QHBQPRdib
 rAfWvE38HLkgxqDtkxFynFezUnM9cCOKuMDJ9EINjLePur+3HPL6QYB0sIBinZIffauQ
 T4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743190766; x=1743795566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EgkjJnqFEchC7Uw8U+7qjzija67PQT0tBgVkDWBcANc=;
 b=Jz+0tbPAvpgOBdQ6ncNYDKB/1tjJk15E2heGBo1MBLg8wyhe9QrrB/UjoWttl0D1Xk
 S3WGrwlmihiEc8htdaJb0vNjEM2Lxo56NbsUXj2DLSrdq4qa1TRZhRVyTjx8yAaM0kMq
 vBBWNRFz13VjTNjiupZ9+RemxqPX/mMRHbDJg0QMFWWDNZFgJJ+mRvX/Z/sZxRsiDTcS
 2Z33dXsAbs/JnNFRGsAc9ypPq1Wz8DZtzmMN0WJwwTJs76DhVMYSLl9JBcKv4neRQZHC
 8IvCQ5v+g7LkZupJjLox3EKM5iHaF/y5KfNgyWaa2D6sJ9XIqtGDDJfRLVzaZiU2UHaP
 JYlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6uYS7gGTEn171Jn9bWiU3tTWXpYLAPDqLVjguvivOu/698vAdjCtOnKJcCsEmlAS5+VLHALlTDY0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ2hbeW1VqqyaZrLdiBsQOWfpkfr/WGo0wtpz3rY3P88/TRfY0
 VEFQJm3vJZu+nvy5IDYcVNNegS7ZXhcty4cTkiJ7+kL3GdFUaFlPAzZxGZ/UnypY2ZgTB7WlM3E
 Y8+5ZMj56jM7dzLDNlQc3zjzKKp8=
X-Gm-Gg: ASbGnctOMkIrCiPd853vJUFe3qo68Ji7twECVg0sfK1VBPbdOjVUzpKqWPT3NMPh2aR
 kVuspo332em8DU4UBqkRLgV6YqoLBCDiUDKMPQkKwL/vfBY3EN14CsMP6bGVHIs7OF+iUWwYrMN
 /CgZ6oWuHxnXq87cir388VUsffww==
X-Google-Smtp-Source: AGHT+IHpbv/U6+6YJj2QWHGtfTHwI7olzX0av85GpYULMDGfxNi3i/m6tL4/MfzJRKc2TR0lPZOn7qHt0I0UKXgWnpA=
X-Received: by 2002:a05:6122:792:b0:524:2fe2:46ba with SMTP id
 71dfb90a1353d-5261d4e2574mr768217e0c.11.1743190766048; Fri, 28 Mar 2025
 12:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 19:38:59 +0000
X-Gm-Features: AQ5f1Jr18tSjXNGROtwo7_8R3cPpi44uQxITRU3021Auc94cuA2FHXiWLRc0qLg
Message-ID: <CA+V-a8tFFWwOBNgXv2JhAKFi0e6pDt3_w75L_H7cOhu61aZVMg@mail.gmail.com>
Subject: Re: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
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

On Fri, Mar 21, 2025 at 5:22=E2=80=AFPM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The RZ/G2L driver utilises the VSPD to read data from input sources.
>
> The rzg2l_du_kms component lists a restricted subset of the capabilities
> of the VSPd which prevents additional formats from being used for
> display planes.
>
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
>
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings
> between the supported DRM formats and the formats exposed by the VSP in
> rzg2l_du_vsp_formats, maintaining the same ordering in both tables.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
>  1 file changed, 136 insertions(+), 5 deletions(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> Prior to this patch, kmstest reports all of these formats as supported
> by the Planes, but using them fails during rzg2l_du_fb_create() as the
> corresponding format isn't found in rzg2l_du_format_info.
>
> This patch now lets me capture and render pixelformats from the Mali-C55
> direct to an attached DSI panel on the Kakip board.
>
> Patch tested with kms-tests:
>
> PYTHONPATH=3D/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/=
kms-test-formats.py
> Testing plane formats: SUCCESS
>
> admin@kakip:~/kms-tests$ cat FormatsTest.log
> U [66.967523] Testing plane formats
> U [66.975763] Testing connector DSI-1, CRTC 36, mode 720x1280
> U [66.978480] Testing format PixelFormat.RGB332
> U [70.143998] Testing format PixelFormat.ARGB4444
> U [73.357056] Testing format PixelFormat.XRGB4444
> U [76.574944] Testing format PixelFormat.ARGB1555
> U [79.805636] Testing format PixelFormat.XRGB1555
> U [83.016599] Testing format PixelFormat.RGB565
> U [86.230362] Testing format PixelFormat.BGR888
> U [89.444673] Testing format PixelFormat.RGB888
> U [92.677093] Testing format PixelFormat.BGRA8888
> U [95.904745] Testing format PixelFormat.BGRX8888
> U [99.119926] Testing format PixelFormat.ARGB8888
> U [102.350298] Testing format PixelFormat.XRGB8888
> U [105.579499] Testing format PixelFormat.UYVY
> U [108.878654] Testing format PixelFormat.YUYV
> U [112.176515] Testing format PixelFormat.YVYU
> U [115.470090] Testing format PixelFormat.NV12
> U [118.767513] Testing format PixelFormat.NV21
> U [122.065851] Testing format PixelFormat.NV16
> U [125.364001] Testing format PixelFormat.NV61
> U [128.662145] Testing format PixelFormat.YUV420
> U [131.978102] Testing format PixelFormat.YVU420
> U [135.292284] Testing format PixelFormat.YUV422
> U [138.623485] Testing format PixelFormat.YVU422
> U [141.955083] Testing format PixelFormat.YUV444
> U [145.336759] Testing format PixelFormat.YVU444
> U [148.761832] Test completed successfully
>
>
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_du_kms.c
> index b1266fbd9598..a5e96f863172 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -36,8 +36,61 @@
>
>  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] =3D {
>         {
> -               .fourcc =3D DRM_FORMAT_XRGB8888,
> -               .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +               .fourcc =3D DRM_FORMAT_RGB332,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB332,
> +               .bpp =3D 8,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_ARGB4444,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB444,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_XRGB4444,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB444,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_ARGB1555,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB555,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_XRGB1555,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB555,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_RGB565,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB565,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGR888,
> +               .v4l2 =3D V4L2_PIX_FMT_RGB24,
> +               .bpp =3D 24,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_RGB888,
> +               .v4l2 =3D V4L2_PIX_FMT_BGR24,
> +               .bpp =3D 24,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGRA8888,
> +               .v4l2 =3D V4L2_PIX_FMT_ARGB32,
> +               .bpp =3D 32,
> +               .planes =3D 1,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_BGRX8888,
> +               .v4l2 =3D V4L2_PIX_FMT_XRGB32,
>                 .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
> @@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_fo=
rmat_infos[] =3D {
>                 .planes =3D 1,
>                 .hsub =3D 1,
>         }, {
> -               .fourcc =3D DRM_FORMAT_RGB888,
> -               .v4l2 =3D V4L2_PIX_FMT_BGR24,
> -               .bpp =3D 24,
> +               .fourcc =3D DRM_FORMAT_XRGB8888,
> +               .v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +               .bpp =3D 32,
>                 .planes =3D 1,
>                 .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_UYVY,
> +               .v4l2 =3D V4L2_PIX_FMT_UYVY,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUYV,
> +               .v4l2 =3D V4L2_PIX_FMT_YUYV,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVYU,
> +               .v4l2 =3D V4L2_PIX_FMT_YVYU,
> +               .bpp =3D 16,
> +               .planes =3D 1,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV12,
> +               .v4l2 =3D V4L2_PIX_FMT_NV12M,
> +               .bpp =3D 12,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV21,
> +               .v4l2 =3D V4L2_PIX_FMT_NV21M,
> +               .bpp =3D 12,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV16,
> +               .v4l2 =3D V4L2_PIX_FMT_NV16M,
> +               .bpp =3D 16,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_NV61,
> +               .v4l2 =3D V4L2_PIX_FMT_NV61M,
> +               .bpp =3D 16,
> +               .planes =3D 2,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV420,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV420M,
> +               .bpp =3D 12,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU420,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU420M,
> +               .bpp =3D 12,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV422,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV422M,
> +               .bpp =3D 16,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU422,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU422M,
> +               .bpp =3D 16,
> +               .planes =3D 3,
> +               .hsub =3D 2,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YUV444,
> +               .v4l2 =3D V4L2_PIX_FMT_YUV444M,
> +               .bpp =3D 24,
> +               .planes =3D 3,
> +               .hsub =3D 1,
> +       }, {
> +               .fourcc =3D DRM_FORMAT_YVU444,
> +               .v4l2 =3D V4L2_PIX_FMT_YVU444M,
> +               .bpp =3D 24,
> +               .planes =3D 3,
> +               .hsub =3D 1,
>         }
>  };
>
> --
> 2.48.1
>
>
