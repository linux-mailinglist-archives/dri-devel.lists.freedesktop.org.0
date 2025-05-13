Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86431AB5D71
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 21:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6710E5E5;
	Tue, 13 May 2025 19:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YpnfC9Ke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79A210E5E4;
 Tue, 13 May 2025 19:54:33 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d93deba52fso17784165ab.0; 
 Tue, 13 May 2025 12:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747166072; x=1747770872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/t/gHhhMRzRsZJHJonG5aB+f1lyT45c1amcNji7Dww=;
 b=YpnfC9KeavYP2hoXkdwjHlRgcjhzEC9QtcKLy1jdCxjtKzYhPNnQPbgcJbj1gvajwk
 XxXiGkV7polnYcvQk9lTEdqJYt1N1fSYgQyl9c53nIeETUYEza4QXBKQJ61V9eriNlvx
 FC2NQpuLD+3skJHN2co5bH1OHN+XU0FfttnQyzUH5k+AxzVsHkSB3iw8QHrVJLKr1jGw
 pwFaKrv8LC6HjEfEuURX5i4rtr3v30nUpn5b6xz0trHlwTA28z5oere4OUyDIZACDECY
 c4F0g36eafz4fBNX0TOy+pkTdRFV4o1734xKX32YG3rw7rK20l10LwkC7pHg/CPveZRk
 n0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747166072; x=1747770872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/t/gHhhMRzRsZJHJonG5aB+f1lyT45c1amcNji7Dww=;
 b=uf/SttyQq9M9RmGodHbVH3iZgbqpSNhUWVv1rE4KwNRETgyfAJqRv7ugJGftJsR1J4
 z89zxlh+buHO6DZFVPLu6WNTEYAPRnd/owl3fPe9jDZ8BhfzJWBBNppXftYpn02TSxce
 jqS4gUQE6rFiqyE/K9RdPezfuOcpDXBH4hZ//frSybe+BCSaKcWkt83/Zg/NF2mEAtZu
 iWvaCzPP7bwjbpqf9CkCjIUiTcclgVQKiICEmENGCXJzoc9p5OZRiwHXZ4Z4l5tvMD2c
 OyGghqEZR0UiFScREBSehmxmlsoqwmolUQ9Mbu2aRbBSEZOtvBChpSuYXVr/7l/yAe/3
 f7fA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/9LlGYtd/sylkPGfq9nTmOxWqTlmTs+mB8W3yaPXDqcyMaFbAgDcgd5dzG8A3nb6IKSWrCs4SG1A=@lists.freedesktop.org,
 AJvYcCXm06e0CyKHkERX6+f+tZWK/k/ZUgkztMg+sh/gAP994Teg8W5BiuXziTByHyAF1lYqkr85Pzat7TZw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWZ3XyxKvTmNPKi9pkK0j99AFyQMf+r70iK6QbSOWjwuGaNesI
 vnDSoWsZoxpQQgc8xqr44vK+N5Obkyqp/r0SKPc+SxBTMyVtCPO259D1aCrVICzVgeLpA845tyF
 clwxZ3tvQuEhMQDp0IF5RDnClx+c=
X-Gm-Gg: ASbGncuOAJUj/Rj7dWfWg44+epsaUSHB/JpDON1hIJG06AJv/JfUo50FvbbWJsTPdM9
 4T/fy9Eo7TfcfgMm9Uhd1aFAXt/oZB0fROD0HUvMh2ZyXy8UQTg3gm0MbLswgmsDuymljHOm19n
 yd+buRVTO9axHxogJoZHIa3z8s5tUyf9ZlpJEWsolnm0WFV2AIJCshXp45X6bkXSU=
X-Google-Smtp-Source: AGHT+IEVFIiwgENc7UkbS77UjLlFAdiO1rH+CkYa4UauxVyc8UQRPx2oUuCyvt1y5p4MXBN6IR7VjiMR9ik/DGcAcLw=
X-Received: by 2002:a05:6e02:1487:b0:3d4:276:9a1b with SMTP id
 e9e14a558f8ab-3db6f7ecf4dmr9598155ab.16.1747166072138; Tue, 13 May 2025
 12:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
In-Reply-To: <20250513-ci-disable-sdm845-v1-1-9c3ca7d0f24b@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 12:54:20 -0700
X-Gm-Features: AX0GCFt0d3XbdcQmZrgMu4T2VTxsDC9QLhRzGl8nbsgyaF66JVYaMmdLJZ_-FOY
Message-ID: <CAF6AEGtoKsB7waADtCWz7q=fTpfXJ+yqoEeCNvbvschegHT4Qg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: disable sdm845 devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Tue, May 13, 2025 at 11:51=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The SDM845 Cheeza runners are currently offline. Disable them until they
> come back again.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/test.yml | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 84a25f0e783b6ca7f8a993c709d5a0fc86bf18d3..cc685833e8d2747dd21dc9a54=
9c3d405431de8d0 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -180,19 +180,19 @@ msm:apq8096:
>    script:
>      - ./install/bare-metal/fastboot.sh || exit $?
>
> -msm:sdm845:
> -  extends:
> -    - .baremetal-igt-arm64
> -  stage: msm
> -  parallel: 6
> -  variables:
> -    DEVICE_TYPE: sdm845-cheza-r3
> -    DRIVER_NAME: msm
> -    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> -    GPU_VERSION: sdm845
> -    RUNNER_TAG: google-freedreno-cheza
> -  script:
> -    - ./install/bare-metal/cros-servo.sh || exit $?
> +#msm:sdm845:

Jfyi you could just rename the job to start with a period.. (with the
caveat that for a job that is extended elsewhere, you need to rename
it everywhere... but that doesn't seem to be the case here)

BR,
-R

> +#  extends:
> +#    - .baremetal-igt-arm64
> +#  stage: msm
> +#  parallel: 6
> +#  variables:
> +#    DEVICE_TYPE: sdm845-cheza-r3
> +#    DRIVER_NAME: msm
> +#    BM_KERNEL: https://${PIPELINE_ARTIFACTS_BASE}/arm64/cheza-kernel
> +#    GPU_VERSION: sdm845
> +#    RUNNER_TAG: google-freedreno-cheza
> +#  script:
> +#    - ./install/bare-metal/cros-servo.sh || exit $?
>
>  msm:sm8350-hdk:
>    extends:
>
> ---
> base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
> change-id: 20250513-ci-disable-sdm845-fca26359229a
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
