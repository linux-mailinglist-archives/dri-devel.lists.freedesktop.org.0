Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4F8A39757
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28F410E2AD;
	Tue, 18 Feb 2025 09:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FI01hGr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BA410E294;
 Mon, 17 Feb 2025 23:46:54 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30737db1ab1so44778251fa.1; 
 Mon, 17 Feb 2025 15:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739836012; x=1740440812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FM8gssIggd7QB1mF6kqIFjET31jYUzg6Outzr1oqKbM=;
 b=FI01hGr0Ll/Y3JbfSt0J5zjY70u+ITG+q01LJCsYx+HcUiStnh5tQH7AjjxwW9vFaB
 jOTe40CzLgiwXpxCaAhjE9OEgAkDYLiddVNLW/EPhC9euth8H8hi+TBzahlazI6hfavD
 gxcDxGdBLAgN8HN+ha+QsqvEBdfSR0T3rysQU341E3Mr7RQwoTt9J9SijO5MnTTXrKa/
 1w/cXNzScyJ7ODlCBSphnsZOF0YLc4g94zFqIBtlcFuFYsLcbGFe2t1zE7fnVK3ENk0Q
 AgnXb+eojoe0HzYl2ohYSP8SXzIoEK2IeF/M43rZj+SJFgieSdqZAB6eK5J6RU2jFEB/
 O6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739836012; x=1740440812;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FM8gssIggd7QB1mF6kqIFjET31jYUzg6Outzr1oqKbM=;
 b=V/nOMPwGzb5UVUDvZN0WSPaauqg+BXx05RKf2gb1AeWSvthgbkCNnKr5NP0EazqEsK
 Gxaw6yHqQtMLWkrgG5g3ITjNCSG07kRZHSsx3t3RTgGmPi+DSKt9k/QTZUqgxr6JhupU
 ON+oskJJUIkG1zbtVxo5EK06WeQjIuDZO87HIE00vovRhaZre67XH/2SbqqBlXKFVDp9
 gPPjiTDPT/h0j9tzgLITf2L5K9Hq8JA36jL5JQQc2xO2SlJ4HzeVjrVLIeJscEC/5Kc9
 8AqsR/MY7HFCD4NoEeURUXZ+UvfAyTT4TACSaZ2MCamB/Piqr4Vp+g4QyUZWgHVcbNNJ
 i4yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7CACAsNIPrC446r2J9FgYy6cW1oqS9jk77FK8jf40/yvatJkdzV99muWc8oozjWLuOxjFq0nIlA==@lists.freedesktop.org,
 AJvYcCXNlVMln3ui1gipMTUhz2psvXwAwq3RWghh7AHXr/HyEsDA4DwdYUfa8Le6O/+SORUpAjp0B0Bqu0g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1zeZbJyCEoqqLAwjK3ifHIL31VV+LCV3Uq0IXNKIgrvnghGHv
 Z94vDaz4CyF2xjeBS/NJrxCQXztV1/5HSlDphj3zauclD9N5VORpe3EtHbqCkSALhiiTWXa6Bzb
 34G65zbm7dhLuffD9kzGpckv72uk=
X-Gm-Gg: ASbGncthBmw2osMfRP5nRNlItk3v0mxHXm0Gd+pxii6tY3gnzZtqGoq9CDF6ERRvcL5
 ymnDC9An/ZwDhR2NxtNQZJ57Vg6GrmqywVupS3K4i1NZyJyLKWRA2i14+YiHNWZTByDPrzktR
X-Google-Smtp-Source: AGHT+IEN5bTcsmKi2lfEIiRMKXu9LKo1SwbpnnYE7Q+3zxcf8RfOO11Rwp61iWEkvk7mMEmMRKSWDwyxuUtYVqZV69c=
X-Received: by 2002:a2e:8615:0:b0:308:f6cf:3607 with SMTP id
 38308e7fff4ca-30927a59acdmr29272921fa.3.1739836012177; Mon, 17 Feb 2025
 15:46:52 -0800 (PST)
MIME-Version: 1.0
References: <20250217-nouveau-gm10b-guard-v1-1-0d96f0068570@gmail.com>
In-Reply-To: <20250217-nouveau-gm10b-guard-v1-1-0d96f0068570@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 17 Feb 2025 17:46:41 -0600
X-Gm-Features: AWEUYZmJtDHUMPg6NAkLDss-aidiECufB4dsJAFV7McUhunlncLVMlVRtKKZwog
Message-ID: <CALHNRZ99cs=rcR07jqsZE7Q3ndLqteKG8K8zpAm4vaEhsYwTLw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/pmu: Fix gp10b firmware guard
To: webgeek1234@gmail.com
Cc: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 18 Feb 2025 09:45:17 +0000
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

On Mon, Feb 17, 2025 at 5:43=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on ava=
ilable firmware")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> index a6f410ba60bc94ec9d52fc78868acddfc6770e19..d393bc540f8628812990dffe4=
c2f7e9014be07c5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> @@ -75,7 +75,7 @@ gp10b_pmu_acr =3D {
>         .bootstrap_multiple_falcons =3D gp10b_pmu_acr_bootstrap_multiple_=
falcons,
>  };
>
> -#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
>  MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
>
> ---
> base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
> change-id: 20250217-nouveau-gm10b-guard-a438402b5022
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>
>
>

Apologies to the maintainers for the multiple resends. For some reason
the lists weren't accepting my submissions. Looks like it went through
with b4, so hopefully I won't have more trouble in the future.

Sincerely,
Aaron Kling
