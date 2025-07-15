Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FBB05E5F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C21810E5DB;
	Tue, 15 Jul 2025 13:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CeQ0y7oD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1199F10E5DA;
 Tue, 15 Jul 2025 13:53:15 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-312f53d0609so981513a91.1; 
 Tue, 15 Jul 2025 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752587594; x=1753192394; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lS3uvd0FvDhLuDBdDTs7gr2vxjnybyZrnKvixcqLzg=;
 b=CeQ0y7oDmbutxRLdDrJbNXPSqdpl1XyCFMYN6PJBIBvTwA05Ub9EAlJYA3CPD2wX+l
 j8SlsPXMeGV2lTKTOGP04FfZN569nPCdZ84Uky9335xeLnGCj7AGRE6T+qi/RmQ3IamU
 UyBi4Zimn1rBLYnpL9DIPraH9/ILo0hc2VSOpkiJPe7EZKw9D6CJWN1hpFSkSxCeVqTZ
 5Gp9NIJd3HvHy+2GtAjYNZ1c67vOfrXC55PZnSj9ozald0NztJ+romhM/u0a5pd70tnR
 d9ZRK2j+xn1R+DzbVgpHuCPVdLEsw2CgOXnZ5C6OUluY3SyF1M1tRXxMQByZFAYlmrmi
 fL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752587594; x=1753192394;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lS3uvd0FvDhLuDBdDTs7gr2vxjnybyZrnKvixcqLzg=;
 b=Y+KC6dGVOQtnC9NMcRV0mERTrmzEsBKImYVxEcwWvbNseo9Mo61kYPs3npxJv1OSD+
 ZmHQTHddGrYUDUPWPm/IVvsJUYHNojtvlAi6OjkWoBe7/X0zP66hzZfmGQExw2qJYPmA
 BstcEDd1PAiYh23wERNkBJ7/O9O8xngkC9BpOz4iJklmQ26eF370TwjMMulag7aq8OW8
 vrbC55mWJbnLxNU7xwOWpJwqsXNsaFrayTxoOucIw4KZoT0wS76wEP2GBe6cZhS0h9Ly
 huWSgL5f/Fvpe1606STxZZzfpof5qHV8ZYc8SgKGP/BGmeRyoby+4siH5JS6fMPyiFF3
 yjaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNAJNer93d06SHiQ9KfZuYdIFATcJU5DPoK570qO+7J2QhDpao0+RV08RMD15N3cOKRMcwO8g2EsOi@lists.freedesktop.org,
 AJvYcCUTDyec3DqGjIzkQrQaZkTVslii9DcWsKtpmf7qFrmZerW7Ryxo5RuYkCcTrY8ym5Iz3hbDblC8@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMeh5iYZwX5OnNpyXk6CUbPCeBcS+AYELgpfKitIDDQKoxPLbb
 OcA43oDugeNw0/fh7RBTmZ9wnfFR7fOACe6BhCYSVfs9M1kwroDZAOvOqPMVGYYWeJ59B6bom3O
 C0caVuosBVEWNIDxBmiSwjgcaquzw9jM=
X-Gm-Gg: ASbGncuawAqigTndMctu3oGantAQ4W9dupNNi73RQLKcpWKQzIvi7RTnHF1+cHY2A6a
 gwBNHHv9H3eGSwcSUR7qc16DnWq++0LBZGYudRteCu1gv9QJcmZs0iCyBIXYHxGy0QjN4NODSW/
 sANaPuPWkJotnWP6CZ8S7HZMYwa10XRK/buS42BJe8A5F5EIdycB60D9ow0nKhn9lapHcf0ddWz
 irkV5RI
X-Google-Smtp-Source: AGHT+IFShvV8WR/svQcBOd9dLjJQvWNmtvK1o8+GBY32wOUjUOTlMABVY81NEAiaSwFaU1KRLisHJIi9Gwr0PqgbOKM=
X-Received: by 2002:a17:90b:3d89:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-31c94dffef4mr840457a91.7.1752587594449; Tue, 15 Jul 2025
 06:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250715095536.58757-1-tzimmermann@suse.de>
 <20250715095536.58757-2-tzimmermann@suse.de>
In-Reply-To: <20250715095536.58757-2-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jul 2025 09:53:02 -0400
X-Gm-Features: Ac12FXwP0PB6aaMusaVSFIpkSJpSQQ1tWLHBx9YoJReoAifiR-j9lovKW7e2E1w
Message-ID: <CADnq5_N=w-LpxiTnEYnNY3qQTno0-P44Q3nQN1dacB_VsZA31g@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/radeon: Do not hold console lock while suspending
 clients
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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

Applied the series.  Thanks!

Alex

On Tue, Jul 15, 2025 at 5:58=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> The radeon driver holds the console lock while suspending in-kernel
> DRM clients. This creates a circular dependency with the client-list
> mutex, which is supposed to be acquired first. Reported when combining
> radeon with another DRM driver.
>
> Therefore, do not take the console lock in radeon, but let the fbdev
> DRM client acquire the lock when needed. This is what all other DRM
> drivers so.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Closes: https://lore.kernel.org/dri-devel/0a087cfd-bd4c-48f1-aa2f-4a3b125=
93935@oss.qualcomm.com/
> Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/radeon/radeon_device.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/rad=
eon/radeon_device.c
> index bbd39348a7ab..6f50cfdfe5a2 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1635,11 +1635,9 @@ int radeon_suspend_kms(struct drm_device *dev, boo=
l suspend,
>                 pci_set_power_state(pdev, PCI_D3hot);
>         }
>
> -       if (notify_clients) {
> -               console_lock();
> -               drm_client_dev_suspend(dev, true);
> -               console_unlock();
> -       }
> +       if (notify_clients)
> +               drm_client_dev_suspend(dev, false);
> +
>         return 0;
>  }
>
> --
> 2.50.0
>
