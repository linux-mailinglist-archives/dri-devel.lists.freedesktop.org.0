Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC3A47E2C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 13:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF61410EAC3;
	Thu, 27 Feb 2025 12:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YMy5q+m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9E10EAC3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 12:47:11 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5ded368fcd9so1389780a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740660430; x=1741265230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvqGa2htjWCzP2pH+g/TGswl5kcWxTHqgNmoSeJM+0U=;
 b=YMy5q+m3Ofn5NBHBSF86Mu/1ElFf0GRhqitganmVaXbHkm2a8tHeKiYSAWG5DDVyfC
 yt4OD+RmxvacjrX6Xr8p9I4+jNan2+eobsVeNSVoS3z0u5VvBFiZ7I0V9lG0nE1jAXu3
 VXP8kEd/d1FSCHHdcIFRSdO1Okb23VJ8lCklfREHId++JpggJr9kZxy+7uH+FrVspdVF
 5r4UTssDU7TO8ozmxzNP0LmPps0Hi3L3/5JIyajj89+ahmwwgn4O+1gcl1rP48G6Wj+B
 2TSYW0xpLFlKm+e8Ll1owpflyZZWATttIWM5lscw3QtQgHVGkKXZRkmjROTJ6bHiIGUe
 On6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740660430; x=1741265230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvqGa2htjWCzP2pH+g/TGswl5kcWxTHqgNmoSeJM+0U=;
 b=ZhBAPVa6w0ROz2aTivPZR0zUnFVPAaLy0yO/frIIM/UuiWTGG/sUY8lFsvbBqBZLDE
 c35+A6JvdTqg8bmz2iNf66THCybMWcHJwS2Es3YNTo3Uu0kgwNSF3kjUcr/A/2ux5OKC
 k9UuPCAEcwyurItaI0QeqJ2uLaxY4dZ8e8stoAcXtHPfAjd0YhHA/TQgxaBbOtEcyVId
 n2FD4IFcle8Vjylmyffo+uuznBbBmouc75k8LyRSEqDmMBswhG/HXC1p8YdTmy2Oy2uZ
 aJOgeM8nPjNHyefLdDPGUnVKv0bOQ8nmOPaCMq5xbkDpDk/16357ryZ3vySmlSOYpLQv
 VdMw==
X-Gm-Message-State: AOJu0YydlA6Mn865Z0BeGKPI97zrrs8zEnk7qLslUksC0Hf/onQYAV+e
 fi7W2EkwPdg8YAMrVHCO9HKboIQUpm7LSj5rf8DDLzEEIGvfUQLusynQIHx3EZHdwPmAeiUp6B4
 +qoEIgso1djIc1iOs0XM8HyGpxVC/yJiERlA=
X-Gm-Gg: ASbGnctcLyoIFJTkIl/AIxLQIuQTYmsN9C/3GRgrCva/ROsP1tM46Mw2lfwUCmEZ0bO
 Pox8vS8pS0uuTdEHdmYOvGcQketMhgF9Yp8c3/Xg/tgnvl9E4Z0QUHqUuYYZ+Zmdt/Bc+AyJVLY
 ZUItg1iUcJYuqWH85od9e71PluZ3Acb5n5cjlXWA==
X-Google-Smtp-Source: AGHT+IF5pHJNn+tt/WfllGhbNqS4qLd4mb6/LfonGkNV4Oa8GE6ZIsw0d+OoyLIIjPpLDYr6fDaJJccyenyFvF2Bjw4=
X-Received: by 2002:a05:6402:350e:b0:5dc:c9ce:b029 with SMTP id
 4fb4d7f45d1cf-5e4a0d45cd5mr9264486a12.5.1740660429726; Thu, 27 Feb 2025
 04:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20250227042058.409003-1-vignesh.raman@collabora.com>
In-Reply-To: <20250227042058.409003-1-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Thu, 27 Feb 2025 09:46:58 -0300
X-Gm-Features: AQ5f1Jq7lUOKGmVudQItPekhexMxviW5zGUOt-yAkW-BhET87g_wogjP2LmxMqI
Message-ID: <CAPW4XYagd1TPQ6j6uEzOrcPpyA_+Ldpx86-MTzpb5iV+b+zRaQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ci: fix merge request rules
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, dmitry.baryshkov@linaro.org, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
 valentine.burley@collabora.com, linux-kernel@vger.kernel.org
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

Em qui., 27 de fev. de 2025 =C3=A0s 01:21, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Merge request pipelines were only created when changes
> were made to drivers/gpu/drm/ci/, causing MRs that
> didn't touch this path to break. Fix MR pipeline rules
> to trigger jobs for all changes.
>
> Run jobs automatically for marge-bot and scheduled
> pipelines, but in all other cases run manually. Also
> remove CI_PROJECT_NAMESPACE checks specific to mesa.
>
> Fixes: df54f04f2020 ("drm/ci: update gitlab rules")
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

> ---
>
> v2:
>   - Run jobs automatically for marge-bot and scheduled
>     pipelines, but in all other cases run manually. Also
>     remove CI_PROJECT_NAMESPACE checks specific to mesa.
>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab=
-ci.yml
> index f04aabe8327c..f4e324e156db 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -143,11 +143,11 @@ stages:
>      # Pre-merge pipeline
>      - if: &is-pre-merge $CI_PIPELINE_SOURCE =3D=3D "merge_request_event"
>      # Push to a branch on a fork
> -    - if: &is-fork-push $CI_PROJECT_NAMESPACE !=3D "mesa" && $CI_PIPELIN=
E_SOURCE =3D=3D "push"
> +    - if: &is-fork-push $CI_PIPELINE_SOURCE =3D=3D "push"
>      # nightly pipeline
>      - if: &is-scheduled-pipeline $CI_PIPELINE_SOURCE =3D=3D "schedule"
>      # pipeline for direct pushes that bypassed the CI
> -    - if: &is-direct-push $CI_PROJECT_NAMESPACE =3D=3D "mesa" && $CI_PIP=
ELINE_SOURCE =3D=3D "push" && $GITLAB_USER_LOGIN !=3D "marge-bot"
> +    - if: &is-direct-push $CI_PIPELINE_SOURCE =3D=3D "push" && $GITLAB_U=
SER_LOGIN !=3D "marge-bot"
>
>
>  # Rules applied to every job in the pipeline
> @@ -170,26 +170,15 @@ stages:
>      - !reference [.disable-farm-mr-rules, rules]
>      # Never run immediately after merging, as we just ran everything
>      - !reference [.never-post-merge-rules, rules]
> -    # Build everything in merge pipelines, if any files affecting the pi=
peline
> -    # were changed
> +    # Build everything in merge pipelines
>      - if: *is-merge-attempt
> -      changes: &all_paths
> -      - drivers/gpu/drm/ci/**/*
>        when: on_success
>      # Same as above, but for pre-merge pipelines
>      - if: *is-pre-merge
> -      changes:
> -        *all_paths
> -      when: manual
> -    # Skip everything for pre-merge and merge pipelines which don't chan=
ge
> -    # anything in the build
> -    - if: *is-merge-attempt
> -      when: never
> -    - if: *is-pre-merge
> -      when: never
> +    - when: manual
>      # Build everything after someone bypassed the CI
>      - if: *is-direct-push
> -      when: on_success
> +    - when: manual
>      # Build everything in scheduled pipelines
>      - if: *is-scheduled-pipeline
>        when: on_success
> --
> 2.47.2
>


--=20
Helen Koike
