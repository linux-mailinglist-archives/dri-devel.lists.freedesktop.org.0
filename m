Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FFA352F9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:34:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE00310EBC8;
	Fri, 14 Feb 2025 00:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fNAuLZg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94CB10EA82
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 12:43:52 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5de3c29e9b3so1322802a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739450631; x=1740055431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XjKKYlWXb6xupzizzPwV1OMDDEKmqUSqaArwd7zvko=;
 b=fNAuLZg1F65dmly1J1tsKGR1lzq8D7G4nCNj6UPDAh02d6h69EttkbSpsnbaGZaANM
 NyWS0Yk7qrBISlQkU8zTgB0FlLs1nTF1JCtG1hZH635TqMQayzdNHsExko/bi+COFBGa
 cdfnaxs5KwAq+eNdaY/lP1qOV/pnRp9zLwlaEeQsdLUzm2Us7mxaZ5foZesuB+Hv+p/X
 1kGA/PSkdqZq3P2j0WkVJX0Iw0xt5sodhjqvxCPhWAU1Cd5QnwYDlOqcnw6F2j1SjR4w
 v/aGmK+uOGPCKOUQmqATWHTOKv6WiBKNF3C6mfKd2w+jBDyELcgvQvGvJTTugX1PkCjO
 Qkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739450631; x=1740055431;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XjKKYlWXb6xupzizzPwV1OMDDEKmqUSqaArwd7zvko=;
 b=N3Iky0aWeemly5SvhW2IAfVSEtWrJKjoUReaQoqwAgrfvBJYw2S5iTevpyVmb/egv1
 MxkNEEQOro3WsUmuavVe5Ff/XgJqpLrIMIWr0Qk2wp/+2/NxIlOgr8bZJ8lhIRhq9aI0
 ESxrt9jufEI7ZDT2mnpKxsYpceu9Y4M/0D5Jzv5MEr1XNBoSbLIYFruZd9WflWMWKZfC
 LO2ABdgx0XZoK0J5TLhCiWh2Bhn5TiyX03yo2dV+RI4NNbyjeeQnZj+jnZ+vfhDwz7tW
 QKhncUHiTAU6ECUW3l6XZ0Q3WetU3SS5tR0rpi/JmE8aHOxK/Mz1N3GBQzbxF3RwRmda
 rNgg==
X-Gm-Message-State: AOJu0YxSKytL9WZiCMN6GWOvIQdNbMiF87hpXSDgNizCU+z5HimDcWa+
 RXFyK6OpPpkGC15DalVCK+y+J1ANoot9rPN2FQsaPEH2Obt/MnlKTgj/Ll8bTj1/Fg815R27EsY
 Hl4D7cLEPJqg7rE10fR2T59FcnEk=
X-Gm-Gg: ASbGncsE1iUd+12am4zPagcvpxIpDMBFIV/W64+bScy3bxZggjoOzL2G53/QSo3+pu5
 RgiXEueXDBez6vz5mJMsLEZ3g5m0PdMAMfhU/psopXq6k7FYL/3caVqb+KlboPNaV372Rkvcr+Z
 Y=
X-Google-Smtp-Source: AGHT+IFOw0kNCJFvrzKPyY1j6HibE6TL5bfUxYtzxWEfNrqyHD/MWFpjH/Bqtwv4+uWz3RPHu41mqOu5jSp87zpWBX0=
X-Received: by 2002:a05:6402:3905:b0:5dc:c9ce:b022 with SMTP id
 4fb4d7f45d1cf-5dec9e793c6mr2867061a12.9.1739450630923; Thu, 13 Feb 2025
 04:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20250211152812.54018-1-vignesh.raman@collabora.com>
 <20250211152812.54018-4-vignesh.raman@collabora.com>
In-Reply-To: <20250211152812.54018-4-vignesh.raman@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Thu, 13 Feb 2025 09:43:39 -0300
X-Gm-Features: AWEUYZluT3Wkd1PZxazm6bk_o2BFn8FJ-1pTiFEGh_ywmnPSgc6YNgpHF_7ceUE
Message-ID: <CAPW4XYZtj7HRhoeOfYguZBEnbqpbRscKrXTn5821aAxvcqNb0g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/ci: enable lockdep detection
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 jani.nikula@linux.intel.com, dmitry.baryshkov@linaro.org, mripard@kernel.org, 
 boqun.feng@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

Hi Vignesh,

thanks for your patch.

Em ter., 11 de fev. de 2025 =C3=A0s 12:29, Vignesh Raman
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
> ---
>
> v2:
>   - Lockdep failures are reported as pipeline warnings,
>     and the documentation is updated.
>
> ---
>  Documentation/gpu/automated_testing.rst |  4 ++++
>  drivers/gpu/drm/ci/igt_runner.sh        | 11 +++++++++++
>  drivers/gpu/drm/ci/test.yml             | 19 ++++++++++++++++---
>  3 files changed, 31 insertions(+), 3 deletions(-)
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
> index 0eab020a33b9..3af735dbf6bd 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -1,6 +1,8 @@
>  .lava-test:
>    extends:
>      - .container+build-rules
> +  variables:
> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
>    timeout: "1h30m"
>    rules:
>      - !reference [.scheduled_pipeline-rules, rules]
> @@ -13,6 +15,9 @@
>      - mv -n install/* artifacts/.
>      # Override it with our lava-submit.sh script
>      - ./artifacts/lava-submit.sh
> +  allow_failure:
> +    exit_codes:
> +      - 101

Maybe we could have this rule more generically instead of just in lava,
so we can re-use it in other jobs as well and we don't need to repeat it.


Regards,
Helen

>
>  .lava-igt:arm32:
>    extends:
> @@ -88,9 +93,14 @@
>      - igt:arm64
>    tags:
>      - $RUNNER_TAG
> +  allow_failure:
> +    exit_codes:
> +      - 101
>
>  .software-driver:
>    stage: software-driver
> +  variables:
> +    FF_USE_NEW_BASH_EVAL_STRATEGY: 'true'
>    timeout: "1h30m"
>    rules:
>      - !reference [.scheduled_pipeline-rules, rules]
> @@ -108,6 +118,9 @@
>      - debian/x86_64_test-gl
>      - testing:x86_64
>      - igt:x86_64
> +  allow_failure:
> +    exit_codes:
> +      - 101
>
>  .msm-sc7180:
>    extends:
> @@ -153,7 +166,7 @@ msm:apq8016:
>      BM_KERNEL_EXTRA_ARGS: clk_ignore_unused
>      RUNNER_TAG: google-freedreno-db410c
>    script:
> -    - ./install/bare-metal/fastboot.sh
> +    - ./install/bare-metal/fastboot.sh || exit $?
>
>  msm:apq8096:
>    extends:
> @@ -167,7 +180,7 @@ msm:apq8096:
>      GPU_VERSION: apq8096
>      RUNNER_TAG: google-freedreno-db820c
>    script:
> -    - ./install/bare-metal/fastboot.sh
> +    - ./install/bare-metal/fastboot.sh || exit $?
>
>  msm:sdm845:
>    extends:
> @@ -181,7 +194,7 @@ msm:sdm845:
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
