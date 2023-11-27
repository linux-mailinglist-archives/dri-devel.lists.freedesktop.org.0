Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6417FAC2D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9E510E30E;
	Mon, 27 Nov 2023 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D75C10E30E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:03:25 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1efabc436e4so3188097fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119004; x=1701723804; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Aa6rn4QSESCXZ4uZuj04juWlgMJNNPni80vALOapvI=;
 b=WalTnc4+KQ4nF9cDmB/YfwZ5ppLxOIV53SM/4q9bp2bP6gN/5YhsvxyB9eSjNbZe8d
 IyuTh2iJs26ej9LbAb9aI8GAQGMcggRrzF/atfSxCLgS7djYvbuxhLgrXlMQeEDfVa7Q
 1CFcs5snLIowKDQiiJRGrwTIF4bjDMCcr3FRY6JnbKUQYEIRx7dLW8l0/2IxkI4PqgKS
 YDtiSIRmcWMgoZ/fjzu1mCeXoVTnF0/AFofqiXBUalxr0Jd5zZWzS9Rf55AwO5WK1JyI
 Rr8HUSJr8SZx0UJHOBNbnUmM+A2421T/zTxCY1GnfrN94yt4F7kdPqsajRTGfDTbJFqW
 fDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119004; x=1701723804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Aa6rn4QSESCXZ4uZuj04juWlgMJNNPni80vALOapvI=;
 b=ZdWPwmXz7BxbCWFmBgZe8PtmZ+J4aaEmzTGM0XA9rMWVDcqf9aTRfUkgPJGgczlm3J
 opWl86o4uay+zq+7D9eA2nadl8jNd0n57xFavFhJgB4c1s4rOFOEDWULMgH8EklTpbZg
 t26LgqonE1Wq04rNJiIrnP8Qc/OoxtrGyFLhtVNLpsjC9qEP0aczYG+LEvRM2F5I0XF9
 RpDfYD6QVgJuI6XV61W7Tsl0Um4/pjCQh+J3RuusrWiTLLA2yJ3Zgf5xYV6AR0hdXMNk
 L0g2yshVA8JwoAjXUzJc8TUU/J9AKGUn/yy2pF1jXuoJOwQ0H6wymkXcPs/mRLDrvNpd
 93aA==
X-Gm-Message-State: AOJu0Yw5T6bvFvZFURtqXalOa6VAs4H4efpwHbLU2bIxVAzU5Qk/scQV
 ++Gp7hedR8cbRy1sICM/tCBzbWera0l39f6QetY=
X-Google-Smtp-Source: AGHT+IFVr5OYuN9z83by811NFmKiLXLGQ7FGfF+G4E9qT6Dp+kZr19WCQu4ycyzcrs02YojX/TH1xEE46m1EFibxKK8=
X-Received: by 2002:a05:6871:e719:b0:1fa:2ddc:4a4d with SMTP id
 qa25-20020a056871e71900b001fa2ddc4a4dmr11760995oac.14.1701119004456; Mon, 27
 Nov 2023 13:03:24 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-4-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-4-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:03:13 -0500
Message-ID: <CADnq5_P8-7iJvbtDFyA6WQ5tAOSndMfKaDjjZdp7hyGUTge2Lw@mail.gmail.com>
Subject: Re: [PATCH 03/14] drm: Include <drm/drm_auth.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> One of the source files includes <drm/drm_auth.h> via <drm/drm_legacy.h>,
> which will be removed. Include drm_auth.h directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_pci.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 39d35fc3a43bc..67907dd427214 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -29,6 +29,7 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>
> +#include <drm/drm_auth.h>
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
> --
> 2.42.1
>
