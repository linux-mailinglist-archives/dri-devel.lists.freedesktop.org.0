Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031AA54733
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 11:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F0610E92E;
	Thu,  6 Mar 2025 10:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BLN//5Tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1244510E92E
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 10:02:27 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3f674610374so276848b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 02:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741255346; x=1741860146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjlyJFGbEZ5AGo1PtX3zO+4PQA4fvsT0t5eYe3h3Qgw=;
 b=BLN//5Tr4FtV3qM/Uwf3FyOV47zzgs0AXofAxN374n9dPrkqmeJIP6oJAhcrjaeJmr
 8GeEWdP1V4ztxuk5G/8d96U3wZNY8E0XRGAkk1Xb62BRzW8f9UwAAMbitT+0vCDNQqEq
 Nl95Qqca9HUGNTaqafaLQC2jlyH5W/lpnrJbF8+NsBVDxkl0n0Q0EzZMFmwsBqxgAVno
 nKOspnyMS4US7F+Y+6X1vEgJKfTg1zXIlHMnHGizJYhF3X0KzM189GLcT2Y5Mtb9Tvgd
 xkPVQVow/05wLIZ9M8NwbBUR9jtCvEPwgBOSIOiH5p+oBeF7dvqeWBKqs/UGn1R3fU+x
 I+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741255346; x=1741860146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BjlyJFGbEZ5AGo1PtX3zO+4PQA4fvsT0t5eYe3h3Qgw=;
 b=dg8lSLDo21sk6DiqYMJAnnu8uZl4RDhD3Vs2ikNV7vODB4uaJPYJvZsoQooO+SH41o
 D3OKeG2oId57M1RCas+/GCroyba5PZH0TbOxJEKvRp9NmHrYPJVPL3ldq2XAGEY83UI6
 eYNRvAw0elshE5Fz9NXtyuTzv941WKUyQtSEBedtf6JnjbGfFNHgORUwggI6hf4HK1KF
 JwOhM7keoVqTGW0d7/OFp/9RdmPnLNy3pcIhrvEo246tJH4yboq+0KNA7pu83X5Xm1Jr
 ikWUvPPGchoEsm5jymsMtgOVsxoEzv38LwHoBWw8piNDhvuwxsOd3Rd/FrMw6HyywZBg
 HWWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoBcWibyld83yfAL+cBVFB/hHY+03HojZHQRq9hugjqzto6YSTx1hzqXAe36x2bEuOHIMzSHFh/YU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPEI5YLttS87wCwZxpkAjLzlOC5wLZE0fAqJSMFAXJ8Efcbp8G
 afVytJXEZAUbuTba+QlywqFn2NrHdhkz7nkyj8fTRbmIrtNQjV90opE/XoW9IKLXsoVpcjC7raf
 mqBT6QO4frKDjqm1lUjzV8DCXvVw=
X-Gm-Gg: ASbGncsrpr+1OLw/vTDqdvp9abL8MLw5PQX9oc2jSLfGk0qfgLxRyfR/J4dh4n5rpJd
 VOGRxA6zFuKOA85UDDqwsYoZFqddvddENvMdx+9PrPV1nLaZgeFdVDquzRXQzFJbQ1haJ9NN5MD
 YZmEKvuYNB7Sq/tUpf2AarhR79
X-Google-Smtp-Source: AGHT+IGktwl8RHqxyYhUIgJi6CiDGuwav2mr9f9ZxPvSiuh2DPm3TXfAG1Nj1w++8u4AXmmRlftDeAZPpvCYOXbu9zY=
X-Received: by 2002:a05:6808:3a0b:b0:3f4:9e6:fd6 with SMTP id
 5614622812f47-3f68316d410mr4124510b6e.23.1741255346176; Thu, 06 Mar 2025
 02:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20250305112038.43852-1-i.abramov@mt-integration.ru>
In-Reply-To: <20250305112038.43852-1-i.abramov@mt-integration.ru>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 6 Mar 2025 11:02:14 +0100
X-Gm-Features: AQ5f1JrBT3mLoOQn49e3Z1XJM2wsj6BZo-pbHKXZ26bJSLKWAVr7Xp_R-lJsWXA
Message-ID: <CAMeQTsYVnBFiirGLKfG+pDt0Aagr0sjanPafKCygUou0s+iB=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Add NULL check for pci_gfx_root in
 mid_get_vbt_data()
To: Ivan Abramov <i.abramov@mt-integration.ru>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <helgaas@kernel.org>, Sinan Kaya <okaya@codeaurora.org>, 
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

On Wed, Mar 5, 2025 at 12:20=E2=80=AFPM Ivan Abramov
<i.abramov@mt-integration.ru> wrote:
>
> Since pci_get_domain_bus_and_slot() can return NULL, add NULL check for
> pci_gfx_root in the mid_get_vbt_data().
>
> This change is similar to the checks implemented in mid_get_fuse_settings=
()
> and mid_get_pci_revID(), which were introduced by commit 0cecdd818cd7
> ("gma500: Final enables for Oaktrail") as "additional minor
> bulletproofing".
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: ba99d8348864 ("drm/gma500: Deprecate pci_get_bus_and_slot()")

Patch looks good but pci_get_bus_and_slot() also returned a struct
pci_dev so the issue was present before ba99d8348864.
The correct fixes tag should be:
Fixes: f910b411053f ("gma500: Add the glue to the various BIOS and
firmware interfaces")

-Patrik

>
> Signed-off-by: Ivan Abramov <i.abramov@mt-integration.ru>
> ---
>  drivers/gpu/drm/gma500/mid_bios.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/m=
id_bios.c
> index 7e76790c6a81..cba97d7db131 100644
> --- a/drivers/gpu/drm/gma500/mid_bios.c
> +++ b/drivers/gpu/drm/gma500/mid_bios.c
> @@ -279,6 +279,11 @@ static void mid_get_vbt_data(struct drm_psb_private =
*dev_priv)
>                                             0, PCI_DEVFN(2, 0));
>         int ret =3D -1;
>
> +       if (pci_gfx_root =3D=3D NULL) {
> +               WARN_ON(1);
> +               return;
> +       }
> +
>         /* Get the address of the platform config vbt */
>         pci_read_config_dword(pci_gfx_root, 0xFC, &addr);
>         pci_dev_put(pci_gfx_root);
> --
> 2.48.1
>
