Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6AA46C46
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 21:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E0210E9E3;
	Wed, 26 Feb 2025 20:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cUKBwZ37";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548FD10E9E3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 20:24:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abbec6a0bfeso24763766b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 12:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740601460; x=1741206260; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2LPlZ9elyCBQd7HfWkhng7/ATOs+tQHMcn3jLxff7s=;
 b=cUKBwZ37LHPsH0PYGNa4ljv7LyfEyHjBJHbUwormUpLho8ag+PjcJSZQ/D0EY+edh7
 fa1rxWZip4ut+e8hWzEMBYfmRVoB8s6w58PWwXbm23F+2Uyzs7Lf76PcgYtperv4bRJ1
 M4yvBTUbxKpGyv/Txi7PA4tY8hMqdmyrIrlXEk1+tRiFainMR/Tt8t91Jek4b36Hl6Q2
 OmnN0UerCfTQ+r2dsVusymnuSf9HHiVpP/dgF+n3pGcmzblOgBdpcZ7IzkCJaQCy0rit
 2x6Ub4CUOf97wMJQuJ/xnngSRDgFfvkkFZphQOElqe+JKdI26pyle8OcPsKcZQJfeow1
 Wg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740601460; x=1741206260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O2LPlZ9elyCBQd7HfWkhng7/ATOs+tQHMcn3jLxff7s=;
 b=uzvZcnPUUhDugscGsE8A1Bxg3BNMv+vPBOe5cC5k2RdCHCjLWPrxSwdbXdC26pzXTL
 EWxbWn8Hwv1YQDbnYf3JXHhnoSnsAIUL0ib1RnF8ybZy/JsVcS59CWWEJhNhDmgJr8Ta
 7PSt+JqQHJQampgZYKuqmVAO9lymicsPbsl02GJFC6CR2WMWfmll3hmm+XkReHMc0wd6
 3jTSwIK3I9+TRksGxnv4/rUK6qv0ribuTpP9NYNZKEli9RZTdnpTW4I50c5kBt//XxXE
 AVYJ2+XHMQwZFKfolk3o/ZXzEAKSBozM1thW5JeUex32uqZHgZ0wZW15OhU8sLgUBaKY
 vCAg==
X-Gm-Message-State: AOJu0YxbKsBBQmrbpKB/s63qGg1PjtXtziU1jPGSOyEvJorhrUXhjyD2
 RorAy/EaIHHPGp081GegLPSrEKtu28wrNQKzix/97KVMIWj68Jw9W33zww+1sGDHNESPq7GP4YW
 4n8WNu4tkxOW5SWC0K+tnxDcziAg=
X-Gm-Gg: ASbGncuNRtcEVAhY+nQwF19qQK+34xrUcwuzhDLPk2o3mtvruR3uK972Pw19leImarL
 YvC45N0impc9dt7CrQra70uImp7sE96jPSEyTqZHGQuUtWpWRYyEtv7i6PsseG17S1pmVN0bMFR
 m5l3AdRLv0Zg==
X-Google-Smtp-Source: AGHT+IHZ9zn71hNPT073Seajv5QnbK+at0Y15ixdVsmdFgRf5ISg78/Yg+aTci4yWLn61MO0cOt5KTcxEdtKgnYuIoU=
X-Received: by 2002:a17:907:a317:b0:abe:fd0c:68a8 with SMTP id
 a640c23a62f3a-abefd0c7853mr416229466b.52.1740601459612; Wed, 26 Feb 2025
 12:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20250217053719.442644-1-vignesh.raman@collabora.com>
 <20250217053719.442644-4-vignesh.raman@collabora.com>
In-Reply-To: <20250217053719.442644-4-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 26 Feb 2025 17:24:08 -0300
X-Gm-Features: AQ5f1JoEGij5s02EkXcJQX2XuiqAewaehTaMPjCiNOd3tf5DXYODa9_T83CTx04
Message-ID: <CAPW4XYZ-yinJovLJDCPoriOLyV-q2V7JdFktkiAZK7Uwh8zmVg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/ci: enable lockdep detection
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
> We have enabled PROVE_LOCKING (which enables LOCKDEP) in drm-ci.
> This will output warnings when kernel locking errors are encountered
> and will continue executing tests. To detect if lockdep has been
> triggered, check the debug_locks value in /proc/lockdep_stats after
> the tests have run. When debug_locks is 0, it indicates that lockdep
> has detected issues and turned itself off. Check this value, and if
> lockdep is detected, exit with an error and configure it as a warning
> in GitLab CI.
>
> GitLab CI ignores exit codes other than 1 by default. Pass the correct
> exit code with variable FF_USE_NEW_BASH_EVAL_STRATEGY set to true or
> exit on failure.
>
> Also update the documentation.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.fornazier@gmail.com>

> ---
>
> v2:
>   - Lockdep failures are reported as pipeline warnings,
>     and the documentation is updated.
>
> v3:
>   - Add a common job for exit code handling and extend it in other jobs.
>
> ---
>  Documentation/gpu/automated_testing.rst |  4 ++++
>  drivers/gpu/drm/ci/igt_runner.sh        | 11 +++++++++++
>  drivers/gpu/drm/ci/test.yml             | 17 ++++++++++++++---
>  3 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/=
automated_testing.rst
> index 6d7c6086034d..62aa3ede02a5 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -115,6 +115,10 @@ created (eg. https://gitlab.freedesktop.org/janedoe/=
linux/-/pipelines)
>  5. The various jobs will be run and when the pipeline is finished, all j=
obs
>  should be green unless a regression has been found.
>
> +6. Warnings in the pipeline indicate that lockdep
> +(see Documentation/locking/lockdep-design.rst) issues have been detected
> +during the tests.
> +
>
>  How to update test expectations
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_ru=
nner.sh
> index 68b042e43b7f..2a0599f12c58 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -85,5 +85,16 @@ deqp-runner junit \
>     --limit 50 \
>     --template "See $ARTIFACTS_BASE_URL/results/{{testcase}}.xml"
>
> +# Check if /proc/lockdep_stats exists
> +if [ -f /proc/lockdep_stats ]; then
> +    # If debug_locks is 0, it indicates lockdep is detected and it turns=
 itself off.
> +    debug_locks=3D$(grep 'debug_locks:' /proc/lockdep_stats | awk '{prin=
t $2}')
> +    if [ "$debug_locks" -eq 0 ] && [ "$ret" -eq 0 ]; then
> +        echo "Warning: LOCKDEP issue detected. Please check dmesg logs f=
or more information."
> +        cat /proc/lockdep_stats
> +        ret=3D101
> +    fi
> +fi
> +
>  cd $oldpath
>  exit $ret
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 0eab020a33b9..dbc4ff50d8ff 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -1,6 +1,14 @@
> +.allow_failure_lockdep:
> +  variables:
> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
> +  allow_failure:
> +    exit_codes:
> +      - 101
> +
>  .lava-test:
>    extends:
>      - .container+build-rules
> +    - .allow_failure_lockdep
>    timeout: "1h30m"
>    rules:
>      - !reference [.scheduled_pipeline-rules, rules]
> @@ -69,6 +77,7 @@
>    extends:
>      - .baremetal-test-arm64
>      - .use-debian/baremetal_arm64_test
> +    - .allow_failure_lockdep
>    timeout: "1h30m"
>    rules:
>      - !reference [.scheduled_pipeline-rules, rules]
> @@ -91,6 +100,8 @@
>
>  .software-driver:
>    stage: software-driver
> +  extends:
> +    - .allow_failure_lockdep
>    timeout: "1h30m"
>    rules:
>      - !reference [.scheduled_pipeline-rules, rules]
> @@ -153,7 +164,7 @@ msm:apq8016:
>      BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>      RUNNER_TAG: google-freedreno-db410c
>    script:
> -    - ./install/bare-metal/fastboot.sh
> +    - ./install/bare-metal/fastboot.sh || exit $?
>
>  msm:apq8096:
>    extends:
> @@ -167,7 +178,7 @@ msm:apq8096:
>      GPU_VERSION: apq8096
>      RUNNER_TAG: google-freedreno-db820c
>    script:
> -    - ./install/bare-metal/fastboot.sh
> +    - ./install/bare-metal/fastboot.sh || exit $?
>
>  msm:sdm845:
>    extends:
> @@ -181,7 +192,7 @@ msm:sdm845:
>      GPU_VERSION: sdm845
>      RUNNER_TAG: google-freedreno-cheza
>    script:
> -    - ./install/bare-metal/cros-servo.sh
> +    - ./install/bare-metal/cros-servo.sh || exit $?
>
>  msm:sm8350-hdk:
>    extends:
> --
> 2.43.0
>


--=20
Helen Koike
