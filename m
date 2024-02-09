Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A384FBA6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224810F8E0;
	Fri,  9 Feb 2024 18:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qp6Axi/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0C310F8E0;
 Fri,  9 Feb 2024 18:11:18 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2046b2cd2d3so843660fac.0; 
 Fri, 09 Feb 2024 10:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707502277; x=1708107077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c4ya9imxm+TuQuQYyUyALfBi5EmklrNTGbvgYwUYgc8=;
 b=Qp6Axi/qhdmuY1+7MxMxUfKzxanjWzF/dNndVT6E5ELCeFRbi9VwnXNg9u0DD4bNZB
 zlxNIDMz0ZqE66WPZ9AEcmlVqGewsoRI7A1oKNiksIoroNbsJ15BCzIu4CmMTvQ5jWU6
 qAEeQRhuNuSFa0PIXUzfdZ1cjSb1d2UpaI4zQcaDDa/IDl1TP5iCGXTNmqA/J6eT1x2o
 L5wH3H7PFp70I4hrVhgUtPvEPbQ/brw+wsJyOpx1Erz9CpvXT8xU/Gsr/mqzaw4PfzEL
 zCk+sk7CmRtVDGNrE/PqlLBFOVVfPggrpkXYCjCefvIziqqO4rn6ma8G2EKYUEkoY11p
 hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707502277; x=1708107077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4ya9imxm+TuQuQYyUyALfBi5EmklrNTGbvgYwUYgc8=;
 b=ZTeSWM15rrUPSpKD8yIzFInkoCgeEMaOCq0NRUQor3V1dWvlfQFGAI44Paep2/bmH2
 W+2TXV1XLKiwOjwlIC5oW+vBpjBKbkfk7KbscfSlI7RNpYVVYH/KrRmaLVMSMMdVDenO
 X7YKQIErhvwU4kYpvwZP3GVPGM+JGQKC6QDzSqo+ocV8SyZgEDnIkEd8lrVB1eTbXf4p
 etBHWxag4/bEhjhw7azzBNYX592TBPb9TVI5/nEYE1tBN/InE5YF16ZCIAXfN6ft9U7S
 /3TQQjPqTMlvbOSbVdZcWq+Hcuok++/jWWGhlCWpoFqdEnwaH7o1a30tWPyHllQ1bTYw
 HmmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIpRpNGeDkSrrOqarZ1S2cBUMJFAWImfAatQrErbGUxvBkHF0+cS5C23AypaBb5i4+htdLV+qgw1E3DI4bl2RVrx4nBz52ICuPnSHNVVW+uS7MWNShwZgQg6kA/MJaYkmkjlamLRQWHYyQJfSipg==
X-Gm-Message-State: AOJu0YztamZdTCliaBD001dLocWJIWvMBvFurgLIMDp5UbVg1bPe4qgV
 pmRavTO/XW32lYYtvmz4AskVSWnwtVCYf67CLWzVgHF2tRfdP1U3KML/ssoCTivdu0E16vYIn1h
 qtWAhE10DO4wYNe69ZhdwO8AO630=
X-Google-Smtp-Source: AGHT+IHjbqI0G2xXOJ3F6PHDREr7s65q7Y+7GFw1OkWfxUwFoS3FacLdVLGrqBP9xfDmK0z+HtY1ppgkxEPUle1apt8=
X-Received: by 2002:a05:6870:b50b:b0:219:88b7:f9cb with SMTP id
 v11-20020a056870b50b00b0021988b7f9cbmr2890691oap.28.1707502277452; Fri, 09
 Feb 2024 10:11:17 -0800 (PST)
MIME-Version: 1.0
References: <20240206165056.47116-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240206165056.47116-1-n.zhandarovich@fintech.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Feb 2024 13:11:06 -0500
Message-ID: <CADnq5_Mj5aj10VyamcXUDuijDPYm9-nmrqR6z1YDhuYmiN7fkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix NULL checks for adev->dm.dc in
 amdgpu_dm_fini()
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
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

On Tue, Feb 6, 2024 at 11:51=E2=80=AFAM Nikita Zhandarovich
<n.zhandarovich@fintech.ru> wrote:
>
> Since 'adev->dm.dc' in amdgpu_dm_fini() might turn out to be NULL
> before the call to dc_enable_dmub_notifications(), check
> beforehand to ensure there will not be a possible NULL-ptr-deref
> there.
>
> Also, since commit 1e88eb1b2c25 ("drm/amd/display: Drop
> CONFIG_DRM_AMD_DC_HDCP") there are two separate checks for NULL in
> 'adev->dm.dc' before dc_deinit_callbacks() and dc_dmub_srv_destroy().
> Clean up by combining them all under one 'if'.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 81927e2808be ("drm/amd/display: Support for DMUB AUX")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d292f290cd6e..46ac3e6f42bb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1938,17 +1938,15 @@ static void amdgpu_dm_fini(struct amdgpu_device *=
adev)
>                 adev->dm.hdcp_workqueue =3D NULL;
>         }
>
> -       if (adev->dm.dc)
> +       if (adev->dm.dc) {
>                 dc_deinit_callbacks(adev->dm.dc);
> -
> -       if (adev->dm.dc)
>                 dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
> -
> -       if (dc_enable_dmub_notifications(adev->dm.dc)) {
> -               kfree(adev->dm.dmub_notify);
> -               adev->dm.dmub_notify =3D NULL;
> -               destroy_workqueue(adev->dm.delayed_hpd_wq);
> -               adev->dm.delayed_hpd_wq =3D NULL;
> +               if (dc_enable_dmub_notifications(adev->dm.dc)) {
> +                       kfree(adev->dm.dmub_notify);
> +                       adev->dm.dmub_notify =3D NULL;
> +                       destroy_workqueue(adev->dm.delayed_hpd_wq);
> +                       adev->dm.delayed_hpd_wq =3D NULL;
> +               }
>         }
>
>         if (adev->dm.dmub_bo)
> --
> 2.25.1
>
