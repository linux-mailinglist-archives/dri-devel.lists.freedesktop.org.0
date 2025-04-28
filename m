Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E5A9F74C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6341110E636;
	Mon, 28 Apr 2025 17:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmdIFGhf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC1B10E636;
 Mon, 28 Apr 2025 17:26:53 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2ff6b9a7f91so477567a91.3; 
 Mon, 28 Apr 2025 10:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745861213; x=1746466013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRRpRkZSvOkRGfLbThuRN6s/DKswi9Znb1ZKqEIbpb4=;
 b=cmdIFGhfrNM+juwnvU7VHfm/vtkGs6BpIIe1/OTLw9mT4FrIin0iJHMXWR5wpfveUY
 TivJ5VaKZm0umYpn08/Lqm47pmj9F+JN/QSe2FK6Au1aClGxZlEvJI+ReLaKt8lLp3mz
 GksW5LsH1Cout8MArO4o3jTX6Xrh34RBoKTouFgZJtaIhbdnpLkM7jWl99bIvwUoSbsq
 0ItOmP+4p/eB2Bobduot7JCyI6JXI+ulmg314eYZd1O5m4yy8NrcuLKvScy8bwAqasGU
 JFJ8CBD+WsCySOf6KuT7t66mfGoC0/qvr01UhEZkJtPy/E4AumZTqlCsZgS5JOlGE2mT
 AokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745861213; x=1746466013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vRRpRkZSvOkRGfLbThuRN6s/DKswi9Znb1ZKqEIbpb4=;
 b=m/CcGVRbWcy4oqvg6vUuG+i38SfDrbVH5ILZSHkAGyVKC7f5XMOwlsbRCQ48DQiLf0
 z7unTUP2UdftWjElTxLDTZ7Nywcqhy9nHaXIJJVdVAZGwiIlDE+4bEGrdYLOzAQfjHIU
 teG9ArppbbQhlxCspgsORscmn0G6vCThwsGzEVzdezV4SyfXROSJFuqcXqXJVgSv0A8/
 41PJK8gCzcHQBLZT8ElOmzuQVnsx+QZMvRu/LuNm+frKpqbN7auRdeg6JcNvwoBERqKf
 9xomeTMiTCdMx1KZTdBl24Kymlg7g59ZoAb532AxRHbdHAKdTxJRh/qBIPpvr0XfAr4r
 VSRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzKmRXtvmguN3jwOPR0urPQ89FY8GnEb1rzuXvq7mU1TvKeDm2oKqXx784DO1ICyfks3UBi4Djulc9@lists.freedesktop.org,
 AJvYcCXZaLaYtjOFfMsyFi43pt+uvFjUr07klsHhj50s+HtpyVthv+fOnDOc5IPHzvy5HYZWXIB+Zcb/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/v5L7V8h4cxBflU9HCum4RSJL5JLnbBOiiEsspKm8hsjb1WOz
 WwFbi46xSoZkCJgpH6Y+zP862C1m2B3YHB3t2U+dGEeGPTS3sbPGZ2RyakdrF6mi5TPT2xoU8Qa
 Qsi+TLLpp7R4wm2QsTKAin7ustngvhQ==
X-Gm-Gg: ASbGncsnwYcbynK2AhFCdjuigCpUskaJJSgDHmbAeAic04EAgXsypbeOmiUjnmz0/qQ
 fUZ+kNkVjJ54cBqN2ybE83y+soo/ZgvlHnywxlguFYuMO7G1etobHgA4OgvObuR7q0CRd5gdw3B
 AQNGvV+oN4d6ydxEvzZ3IqZw==
X-Google-Smtp-Source: AGHT+IHqDjJkfJR4DtyStA8z8/DstOOvTIwPHnHU+nlRgn190Mwia3pBgMb6g4BVjMeJDnyZ9gmvCov+/FaAprE4xPk=
X-Received: by 2002:a17:90b:38c9:b0:2ff:4be6:c5bd with SMTP id
 98e67ed59e1d1-309f7ec76f5mr6947847a91.8.1745861212890; Mon, 28 Apr 2025
 10:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250427023625.14327-2-bagasdotme@gmail.com>
In-Reply-To: <20250427023625.14327-2-bagasdotme@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:26:41 -0400
X-Gm-Features: ATxdqUHOPGCxsMpNTL-FiIUGq0AA51NTliFGGx7x0GccxVRPmLRNZoEaL_D7Qas
Message-ID: <CADnq5_ONJ0wyExs33aSt_jWZQ9RmL2q=nE6OkzN_4HoS3vZ9+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/userq: fix user_queue parameters list
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>, 
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>, 
 Arvind Yadav <Arvind.Yadav@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

Applied.  Thanks.

Alex

On Sat, Apr 26, 2025 at 10:37=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> Sphinx reports htmldocs warning:
>
> Documentation/gpu/amdgpu/module-parameters:7: drivers/gpu/drm/amd/amdgpu/=
amdgpu_drv.c:1119: ERROR: Unexpected indentation. [docutils]
>
> Fix the warning by using reST bullet list syntax for user_queue
> parameter options, separated from preceding paragraph by a blank
> line.
>
> Fixes: fb20954c9717 ("drm/amdgpu/userq: rework driver parameter")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250422202956.176fb590@canb.a=
uug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b9a1ef343c79cf..ec8057597c5aad 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1115,11 +1115,12 @@ module_param_named(rebar, amdgpu_rebar, int, 0444=
);
>
>  /**
>   * DOC: user_queue (int)
> - * Enable user queues on systems that support user queues.
> - * -1 =3D auto (ASIC specific default)
> - *  0 =3D user queues disabled
> - *  1 =3D user queues enabled and kernel queues enabled (if supported)
> - *  2 =3D user queues enabled and kernel queues disabled
> + * Enable user queues on systems that support user queues. Possible valu=
es:
> + *
> + * - -1 =3D auto (ASIC specific default)
> + * -  0 =3D user queues disabled
> + * -  1 =3D user queues enabled and kernel queues enabled (if supported)
> + * -  2 =3D user queues enabled and kernel queues disabled
>   */
>  MODULE_PARM_DESC(user_queue, "Enable user queues (-1 =3D auto (default),=
 0 =3D disable, 1 =3D enable, 2 =3D enable UQs and disable KQs)");
>  module_param_named(user_queue, amdgpu_user_queue, int, 0444);
>
> base-commit: 127e612bf16726620e431b6e0f771424916492be
> --
> An old man doll... just what I always wanted! - Clara
>
