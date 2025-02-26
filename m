Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B323A46C3C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E4810E9E0;
	Wed, 26 Feb 2025 20:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bfy0Kq6E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4C910E9E0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:23:18 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so24073366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740601397; x=1741206197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hv3d4DyrXa2wa/xE8OSCNIM8w3UTF+Jeuiot7/Rh1Kw=;
 b=Bfy0Kq6E8oJxJyzo15WQDAbNsSaPoPm/ORAk36pIOP/xmZZRe5lUkfjvE35KiwZyrP
 ECH5Yuo7J0xSi49ncK0JhWvg56dbhTFrRDc0LMWBR9s0xnyTrDJYyPZOfe4oHq5aoIfP
 3uSMqtadm+ENfgXEzor8bMu2g/P9U289dsCcL3cT0Srxl+UNFphj/A+s/0/m6GbAGNm2
 RyoChXMilneprRVWrI89++lc3yfL9i2G7ltYurqULydAtciv+2wraesbdz0ea4n8/B7Y
 iQVMHzzTnozVGpJVInXg8zQ4G7rCLVAFZLfP/ISDDMbWpFfbThUpew8UZ+RtvJ1D4BAw
 PTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740601397; x=1741206197;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hv3d4DyrXa2wa/xE8OSCNIM8w3UTF+Jeuiot7/Rh1Kw=;
 b=es/fBFIL2bGrdt5nqEPSirl09dvr0mfM39lKSjYoZkG06QpKDDXuk2eIgsxa3fhxps
 FgxGfRrac0ybUJrT5p+O2L1Reg4kRxNgK8wHKpPGjzgay8iz1/RCjThRm0WCEKT0vhTk
 AvM1SbyPHpOy2sy0EZOOoGsA4GKexd24eowt740OU8IhocOiBXz+1XCuYA/1E+AJpcS0
 dFND4MoCI5yahy8dAYlZqMvVnxbiT8Q7XTNZ/qVHD6EuK5GT/Pt1AYn2Rpnf/kA0jG0P
 JBXpPmqmRphMho/zIIDTkXnSaC69VAoEK5+Ua71SC6EFn4ySwZri/oUr9QuY7BvXbiSi
 KCcQ==
X-Gm-Message-State: AOJu0YzwWH13KXpNTpi34p8bKvRR9gr4EPSXSv60rMT08nCm3UYE6ziB
 gS2qPlupQtZrORkPb/UsDNvz/Asv5ZojBxyujBfGhXVWUiDFCuoN73y6+uhhGwgFqMmonr8XjD+
 9E32FG7NJ/ShZOgyG+R6zF30Mo10=
X-Gm-Gg: ASbGncsG8cdFtVpRP2Dk0Vv53dZ6YlS2S08gbONIME9c/VbnjU7MuJiIowL6OEZNjKF
 dHHWfIGNtfJZNgJAGpWHDRQP8E/rVUr9f4BbOVbCgLa1yDLHBg8A2ReWAbGiENrfLaUebIB0Q2d
 OJVhTHAw4Jng==
X-Google-Smtp-Source: AGHT+IGcsknzYjLwND3bc1sPcXNQvaTyzDm2Bjz/NgjyNqfZjWbfKQaEhvo+HzC0+4k8y8v3Za1vyra69VerEi8lBQY=
X-Received: by 2002:a17:907:97cd:b0:abc:28a5:cbe2 with SMTP id
 a640c23a62f3a-abed10fa38dmr1042739166b.55.1740601396636; Wed, 26 Feb 2025
 12:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
 <20250217053719.442644-2-vignesh.raman@collabora.com>
In-Reply-To: <20250217053719.442644-2-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 26 Feb 2025 17:23:02 -0300
X-Gm-Features: AQ5f1JpoHXHT8WUgEiQgQiVgMuwnc--RICCLBb6XnGOBifRcYHDlqacEmmL5AQ4
Message-ID: <CAPW4XYbzAT6P4R83ZJOWFf8v0kPvP1eM1gg0=La9Nu4psCtKKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/ci: refactor software-driver stage jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org
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

Em seg., 17 de fev. de 2025 =C3=A0s 02:37, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Move common job configuration for software-driver
> stage jobs to separate job.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

> ---
>
> v2:
>   - New patch in the series.
>
> v3:
>   - No changes.
>
> ---
>  drivers/gpu/drm/ci/test.yml | 59 +++++++++++++++----------------------
>  1 file changed, 24 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 6a1e059858e5..0eab020a33b9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -89,6 +89,26 @@
>    tags:
>      - $RUNNER_TAG
>
> +.software-driver:
> +  stage: software-driver
> +  timeout: "1h30m"
> +  rules:
> +    - !reference [.scheduled_pipeline-rules, rules]
> +    - when: on_success
> +  extends:
> +    - .test-gl
> +  tags:
> +    - kvm
> +  script:
> +    - ln -sf $CI_PROJECT_DIR/install /install
> +    - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules
> +    - install/crosvm-runner.sh install/igt_runner.sh
> +  needs:
> +    - debian/x86_64_test-gl
> +    - testing:x86_64
> +    - igt:x86_64
> +
>  .msm-sc7180:
>    extends:
>      - .lava-igt:arm64
> @@ -440,47 +460,16 @@ panfrost:g12b:
>      - .panfrost-gpu
>
>  virtio_gpu:none:
> -  stage: software-driver
> -  timeout: "1h30m"
> -  rules:
> -    - !reference [.scheduled_pipeline-rules, rules]
> -    - when: on_success
> +  extends:
> +    - .software-driver
>    variables:
>      CROSVM_GALLIUM_DRIVER: llvmpipe
>      DRIVER_NAME: virtio_gpu
>      GPU_VERSION: none
> -  extends:
> -    - .test-gl
> -  tags:
> -    - kvm
> -  script:
> -    - ln -sf $CI_PROJECT_DIR/install /install
> -    - mv install/bzImage /lava-files/bzImage
> -    - install/crosvm-runner.sh install/igt_runner.sh
> -  needs:
> -    - debian/x86_64_test-gl
> -    - testing:x86_64
> -    - igt:x86_64
>
>  vkms:none:
> -  stage: software-driver
> -  timeout: "1h30m"
> -  rules:
> -    - !reference [.scheduled_pipeline-rules, rules]
> -    - when: on_success
> +  extends:
> +    - .software-driver
>    variables:
>      DRIVER_NAME: vkms
>      GPU_VERSION: none
> -  extends:
> -    - .test-gl
> -  tags:
> -    - kvm
> -  script:
> -    - ln -sf $CI_PROJECT_DIR/install /install
> -    - mv install/bzImage /lava-files/bzImage
> -    - mkdir -p /lib/modules
> -    - ./install/crosvm-runner.sh ./install/igt_runner.sh
> -  needs:
> -    - debian/x86_64_test-gl
> -    - testing:x86_64
> -    - igt:x86_64
> --
> 2.43.0
>


--=20
Helen Koike
