Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A34194F728
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F0310E28D;
	Mon, 12 Aug 2024 19:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OziNeQLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0BC10E289;
 Mon, 12 Aug 2024 19:05:34 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-70d1d6369acso3836281b3a.0; 
 Mon, 12 Aug 2024 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723489534; x=1724094334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYzk9ajK0qkvS9HudnEJV1OJXQlLDLt8xYzX5H6+jVY=;
 b=OziNeQLqWUd1QyY8a6ZVTjzzpxBHGhVfMAI0QJJYieDDL5nEsXhHCb7zubOT9V70QA
 0dZ29zPWYErGt1CYv+acgIVYLl0f4YKATi4ASXHkTtFp88+nbIyMVUaKFXuFDyUP3rW9
 2JEUN479HJgTIBeV7E913D8hTACb4nD1Xa+FrOASNfPcyQoqxmqcXiHu83GHMoFLJluI
 kpn41D3I9iuFjaE6rnKEQUP87fq7ldr6ikq4m4W+bAy8PY/mOcP307TeuS4fTLVQznKs
 iyMB1w7RNc1tPJ0WSXdfyFiV2mchhDZsRK9B1qgRZDC4hgIhs3YmMxpWH3DmUAHW5RSE
 gXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723489534; x=1724094334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYzk9ajK0qkvS9HudnEJV1OJXQlLDLt8xYzX5H6+jVY=;
 b=m0n6cjaSuZ49SuPJD661RuR/HcPk9xBc3WI/20R4DZlRPrXlYwm1Ak1nYPWYEBeNsv
 NVTi3Paj5BNfQxevhZ3FJ4w+ydzpefpZi1hbx4DJBPKKdsDhZOl3n7k4fw974/UFUNjs
 im94+vUqWCKQtcfTeDeKz+q4CPMez8U3B0VFBQuAb/qbETH1yDEymTTLxCjOnAPlONtC
 IgZyG6bH6r5qtDuKLWt4/1e1kO4A2kEBLqGUFJpcIFGAibtl1LEc2zEu0wJIFTBAUpga
 0kaxiOWEnffxsLG/rOSi4B02BSvchJ7mclHH0vuHujMYzgubYm54JJIQndO2KaRzYSdV
 d5Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWPrbb/DYXhc/9+kp3MR2VmSqB++9tsguWtCxzniR5NLidRaOd4ldj8NJfUfMTn/BX2E5DuLYjhbM1V+SEaiSwpp10GaHunXw1m+8kQOtlZBtKCLQ+1T+Flx9/JhJ5VM7xGcRGZLBxjfMDX1mXusDRrsMhQZFWLWmITMJ560q8Sq6SIMYuqgTu6VsoH2I=
X-Gm-Message-State: AOJu0YxeDaHj1YxZCSh3YY0SKeQRXzZyw6gkwi8VsbMXoePskxZgI9vM
 fan3dn9ZdZysJ25Ioc3XRimrXARHehT6X3mVJGRVslKlwmoYXjOeAflhELqSls5qRxKPq3aMjbt
 u3h1UQtCA+S2yw6Pe4TCfCe80mXg=
X-Google-Smtp-Source: AGHT+IH5VhC6U8Qp+4bvBRGJzRnuovDNQCmdWCOZIiIfYBTYRAjIa4lVC2Jz5IR0rcbQXF5yDius11P9O8tM7Bft9yY=
X-Received: by 2002:a17:902:fc87:b0:1fb:80a3:5826 with SMTP id
 d9443c01a7336-201cbba9816mr8618925ad.4.1723489533877; Mon, 12 Aug 2024
 12:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-2-tzimmermann@suse.de>
In-Reply-To: <20240812083000.337744-2-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 12 Aug 2024 15:05:22 -0400
Message-ID: <CADnq5_MM4h3XSKCHViXbdJPTKPjy0QwSsYixpiXd-Cv4O-w-eg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] drm: Do delayed switcheroo in drm_lastclose()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
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

On Mon, Aug 12, 2024 at 4:30=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
> their lastclose callbacks. Call it from drm_lastclose(), so that the
> driver functions can finally be removed. Only PCI devices with enabled
> switcheroo do the delayed switching. The call has no effect on other
> hardware.
>
> v2:
> - move change to drm_lastclose() (Sima)
> - update docs for vga_switcheroo_process_delayed_switch()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_file.c       | 4 ++++
>  drivers/gpu/vga/vga_switcheroo.c | 3 +--
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b05108..513bef816ae9 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
>
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
>         drm_dbg_core(dev, "driver lastclose completed\n");
>
>         drm_client_dev_restore(dev);
> +
> +       if (dev_is_pci(dev->dev))
> +               vga_switcheroo_process_delayed_switch();
>  }
>
>  /**
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switc=
heroo.c
> index 365e6ddbe90f..18f2c92beff8 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct vgasr_=
priv *priv)
>  /**
>   * vga_switcheroo_process_delayed_switch() - helper for delayed switchin=
g
>   *
> - * Process a delayed switch if one is pending. DRM drivers should call t=
his
> - * from their ->lastclose callback.
> + * Process a delayed switch if one is pending.
>   *
>   * Return: 0 on success. -EINVAL if no delayed switch is pending, if the=
 client
>   * has unregistered in the meantime or if there are other clients blocki=
ng the
> --
> 2.46.0
>
