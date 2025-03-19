Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C85A69697
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 18:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C710E560;
	Wed, 19 Mar 2025 17:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ifsx6r8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA76910E560;
 Wed, 19 Mar 2025 17:34:35 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso3684153a12.2; 
 Wed, 19 Mar 2025 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742405674; x=1743010474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HICfp25x6A8uBlCw5p5+rBvNZqOl807JCLoXLGdju5w=;
 b=ifsx6r8RSaanyjHLVqM8fvnvS/w8BpQ14o6f/UMWmJMwWK8SkHuWyYVzCUds5bcb/6
 EK7ipgDIjWNdat7MoGiBgmeZpSaltv0WMvgPrANUq8JwQ+epkx80FmpG3nujZKBHDs/7
 rhxbULVWKvoOo2MbxRE6rkgkwFY0nb7Xg+t6jyOKGx1cpIKZ5H44fWcDx63YYjx9eRrr
 /WP9IhyOxgyzlvvPPgRhSDCaW2WWJmpKRJBKLernfrhNejb78glbZ5ZPAsVsP4KXknW4
 6xYnd7ekAub4yBnkpfenUIPDHehxgP1kusL3wvYk5ccVZJFO1nKMYnlRHi4Bc2PV2nbt
 Mn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742405674; x=1743010474;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HICfp25x6A8uBlCw5p5+rBvNZqOl807JCLoXLGdju5w=;
 b=VvhAd4AumzorjZyREHNq9LWmwA7H5C0L5zmCTcWVToEPMlSoQ6vdvJEAk5yuiL7byA
 RyeqeOPk5T9JS/MlIUmdaryDIwpr0h9d6ugIyq3Jo+loaZa18gfO6sJ7x5cJoK1dHDxE
 cdoRfETPfS863zCJKWz2yOlfitZxhzEb6766ZghDMKv5oQjccimzGJMiSJtq2g7RMPh3
 ykPx/a1LLYEwZ7+mprrjykLPeutXoniOZtHveR3Fwl91NzPinXSxMA500HE+RZmWnaiv
 41gzBnhXpeklWD6QrDOCpKPabk9cVTvWPvnmqiEOs5kQTAP9ZNpB1l3vxbAeAfcREyKM
 2n0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCULHvhHzr2c1UjQ8VSmS3i4Nunz+L53qx+fH9F1ILmNN3Lxo8v35f9AzLypG9zdiSmQSCgU0I1lNhsQ@lists.freedesktop.org,
 AJvYcCXbObCsRUJgfF/iH02LStCNYK2eZ5uvvzQ5SgLGHyq/QYy+oi+G2vS0sY8oZWfLVavzPyWivwq/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTFjsyXkMTq/ajFrlVszPIWRe1z+zRc0XfjnBS2ZBiqtEH3Srd
 VLRr94QMYW8K5OjbKUNLHogHMrQXqRSwdW0ezE+pPj/K9GVlBp/g5PNQ1G76ht2zyaXlFj0AEI/
 ERNr3u6cDJ02wltEmvNxXcusybdg=
X-Gm-Gg: ASbGncuAOmNIfMQYMirJt5usUgHkUQepPJkknXTBkC5OymgmyeM9PR8DkloTQdsaOCE
 6MFDVZ5946Oqp9aq+pAbtwQrYlXCwxRvsQ0pfmXs/XWPeQkNixl8leVO7hzISoQxiONnxEkv05O
 bsyCTvXLZl2EsP6yMi7iHlXYr0ckY=
X-Google-Smtp-Source: AGHT+IHzu2e3XxsHC/7/u8CIt5MaZwZv1sD2yQijEy0cXRzLHdS5nTnlJJGE3hIhSh5QLgw2FNKxwlC7bngh5JrlEtw=
X-Received: by 2002:a05:6402:270b:b0:5e7:b02b:381f with SMTP id
 4fb4d7f45d1cf-5eba02bbcd6mr112300a12.30.1742405673821; Wed, 19 Mar 2025
 10:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
 <20250314085858.39328-2-vignesh.raman@collabora.com>
 <CAPW4XYZ6+kc+Pj61_Kz8-CEy0Aed92XeXDnUiDAEGNBU+SPxAg@mail.gmail.com>
 <38315386-9975-4bbb-91e8-34b872487c26@collabora.com>
In-Reply-To: <38315386-9975-4bbb-91e8-34b872487c26@collabora.com>
From: Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Date: Wed, 19 Mar 2025 14:34:22 -0300
X-Gm-Features: AQ5f1JoPUcAvMrjBsWoRX2_tKLW_5IVh6ZaI7nzG5lkIPL3lBFa4MqHpkPy7Ams
Message-ID: <CAPW4XYY8=CbhN8G7NFe+w9udsTxC=whtTUCzK9-43mvSk0zdDg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
 jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
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

Em qua., 19 de mar. de 2025 =C3=A0s 10:24, Vignesh Raman
<vignesh.raman@collabora.com> escreveu:
>
> Hi Helen,
>
> On 19/03/25 00:22, Helen Mae Koike Fornazier wrote:
> > Em sex., 14 de mar. de 2025 =C3=A0s 05:59, Vignesh Raman
> > <vignesh.raman@collabora.com> escreveu:
> >>
> >> LAVA was recently patched [1] with a fix on how parameters are parsed =
in
> >> `lava-test-case`, so we don't need to repeat quotes to send the
> >> arguments properly to it. Uprev mesa to fix this issue.
> >>
> >> [1] https://gitlab.com/lava/lava/-/commit/18c9cf79
> >>
> >> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> >> ---
> >>   drivers/gpu/drm/ci/build.sh       | 16 ++++++++--------
> >>   drivers/gpu/drm/ci/build.yml      |  8 ++++++++
> >>   drivers/gpu/drm/ci/container.yml  | 24 +++++++++++++++++++++++
> >>   drivers/gpu/drm/ci/gitlab-ci.yml  | 32 +++++++++++++++++++++++++++++=
+-
> >>   drivers/gpu/drm/ci/image-tags.yml |  4 +++-
> >>   drivers/gpu/drm/ci/lava-submit.sh |  3 ++-
> >>   drivers/gpu/drm/ci/test.yml       |  2 +-
> >>   7 files changed, 77 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> >> index 19fe01257ab9..284873e94d8d 100644
> >> --- a/drivers/gpu/drm/ci/build.sh
> >> +++ b/drivers/gpu/drm/ci/build.sh
> >> @@ -98,14 +98,14 @@ done
> >>
> >>   make ${KERNEL_IMAGE_NAME}
> >>
> >> -mkdir -p /lava-files/
> >> +mkdir -p /kernel/
> >
> > the folder is not lava specific, correct?
>
> It is not lava specific. Only the directory name where the kernel image
> is copied is changed and the kernel image is uploaded to S3 for lava.
>
> This is based on,
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/5b65bbf72ce7024c5df2100=
ce4b12d59e8f3dd26

thanks for clarifying.

>
> >
> >>   for image in ${KERNEL_IMAGE_NAME}; do
> >> -    cp arch/${KERNEL_ARCH}/boot/${image} /lava-files/.
> >> +    cp arch/${KERNEL_ARCH}/boot/${image} /kernel/.
> >>   done
> >>
> >>   if [[ -n ${DEVICE_TREES} ]]; then
> >>       make dtbs
> >> -    cp ${DEVICE_TREES} /lava-files/.
> >> +    cp ${DEVICE_TREES} /kernel/.
> >>   fi
> >>
> >>   make modules
> >> @@ -121,11 +121,11 @@ if [[ ${DEBIAN_ARCH} =3D "arm64" ]]; then
> >>           -d arch/arm64/boot/Image.lzma \
> >>           -C lzma\
> >>           -b arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb \
> >> -        /lava-files/cheza-kernel
> >> +        /kernel/cheza-kernel
> >>       KERNEL_IMAGE_NAME+=3D" cheza-kernel"
> >>
> >>       # Make a gzipped copy of the Image for db410c.
> >> -    gzip -k /lava-files/Image
> >> +    gzip -k /kernel/Image
> >>       KERNEL_IMAGE_NAME+=3D" Image.gz"
> >>   fi
> >>
> >> @@ -139,7 +139,7 @@ cp -rfv drivers/gpu/drm/ci/* install/.
> >>   . .gitlab-ci/container/container_post_build.sh
> >>
> >>   if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
> >> -    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /lava-files/vmlinux.=
xz
> >> +    xz -7 -c -T${FDO_CI_CONCURRENT:-4} vmlinux > /kernel/vmlinux.xz
> >>       FILES_TO_UPLOAD=3D"$KERNEL_IMAGE_NAME vmlinux.xz"
> >>
> >>       if [[ -n $DEVICE_TREES ]]; then
> >> @@ -148,7 +148,7 @@ if [[ "$UPLOAD_TO_MINIO" =3D "1" ]]; then
> >>
> >>       ls -l "${S3_JWT_FILE}"
> >>       for f in $FILES_TO_UPLOAD; do
> >> -        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /lava-files/$f \
> >> +        ci-fairy s3cp --token-file "${S3_JWT_FILE}" /kernel/$f \
> >>                   https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/$f
> >>       done
> >>
> >> @@ -165,7 +165,7 @@ ln -s common artifacts/install/ci-common
> >>   cp .config artifacts/${CI_JOB_NAME}_config
> >>
> >>   for image in ${KERNEL_IMAGE_NAME}; do
> >> -    cp /lava-files/$image artifacts/install/.
> >> +    cp /kernel/$image artifacts/install/.
> >>   done
> >>
> >>   tar -C artifacts -cf artifacts/install.tar install
> >> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.y=
ml
> >> index 6c0dc10b547c..8eb56ebcf4aa 100644
> >> --- a/drivers/gpu/drm/ci/build.yml
> >> +++ b/drivers/gpu/drm/ci/build.yml
> >> @@ -143,6 +143,10 @@ debian-arm64-release:
> >>     rules:
> >>       - when: never
> >>
> >> +debian-arm64-ubsan:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian-build-testing:
> >>     rules:
> >>       - when: never
> >> @@ -183,6 +187,10 @@ debian-testing-msan:
> >>     rules:
> >>       - when: never
> >>
> >> +debian-testing-ubsan:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian-vulkan:
> >>     rules:
> >>       - when: never
> >> diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/con=
tainer.yml
> >> index 07dc13ff865d..56c95c2f91ae 100644
> >> --- a/drivers/gpu/drm/ci/container.yml
> >> +++ b/drivers/gpu/drm/ci/container.yml
> >> @@ -24,6 +24,18 @@ alpine/x86_64_build:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/arm32_test-base:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/arm32_test-gl:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/arm32_test-vk:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/arm64_test-gl:
> >>     rules:
> >>       - when: never
> >> @@ -32,6 +44,10 @@ debian/arm64_test-vk:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/baremetal_arm32_test:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/ppc64el_build:
> >>     rules:
> >>       - when: never
> >> @@ -40,6 +56,14 @@ debian/s390x_build:
> >>     rules:
> >>       - when: never
> >>
> >> +debian/x86_32_build:
> >> +  rules:
> >> +    - when: never
> >> +
> >> +debian/x86_64_test-android:
> >> +  rules:
> >> +    - when: never
> >> +
> >>   debian/x86_64_test-vk:
> >>     rules:
> >>       - when: never
> >> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/git=
lab-ci.yml
> >> index b06b9e7d3d09..55b540c4cf92 100644
> >> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> >> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> >> @@ -1,6 +1,6 @@
> >>   variables:
> >>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> >> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 7d3062470f3ccc6cb40540e772e90=
2c7e2248024
> >> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 82ab58f6c6f94fa80ca7e1615146f=
08356e3ba69
> >>
> >>     UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
> >>     TARGET_BRANCH: drm-next
> >> @@ -187,6 +187,36 @@ stages:
> >>       - when: manual
> >>
> >>
> >> +# Repeat of the above but with `when: on_success` replaced with
> >> +# `when: delayed` + `start_in:`, for build-only jobs.
> >> +# Note: make sure the branches in this list are the same as in
> >> +# `.container+build-rules` above.
> >> +.build-only-delayed-rules:
> >> +  rules:
> >> +    - !reference [.common-rules, rules]
> >> +    # Run when re-enabling a disabled farm, but not when disabling it
> >> +    - !reference [.disable-farm-mr-rules, rules]
> >> +    # Never run immediately after merging, as we just ran everything
> >> +    - !reference [.never-post-merge-rules, rules]
> >> +    # Build everything in merge pipelines
> >> +    - if: *is-merge-attempt
> >> +      when: delayed
> >> +      start_in: &build-delay 5 minutes
> >> +    # Same as above, but for pre-merge pipelines
> >> +    - if: *is-pre-merge
> >> +      when: manual
> >> +    # Build everything after someone bypassed the CI
> >> +    - if: *is-direct-push
> >> +      when: manual
> >> +    # Build everything in scheduled pipelines
> >> +    - if: *is-scheduled-pipeline
> >> +      when: delayed
> >> +      start_in: *build-delay
> >> +    # Allow building everything in fork pipelines, but build nothing =
unless
> >> +    # manually triggered
> >> +    - when: manual
> >> +
> >
> > Do you think we could avoid repeating code by using anchor (&) and
> > reference (*) ?
> >
> > https://docs.gitlab.com/ci/yaml/yaml_optimization/#yaml-anchors-for-scr=
ipts
>
> We could create anchors for the repeated rules in .container+build-rules
> and .build-only-delayed-rules, but I would prefer to first do this in
> mesa and then adapt the same in drm-ci. Right now it is the same as
> mesa, so maybe fix this in the next mesa uprev. What do you suggest?

If we just herit from mesa, than sure, we can do this on mesa, but it
seems this could be made here.
But if you think it is better to fix there first than update here, I'm
fine with this too.

Acked-by: Helen Koike <helen.fornazier@gmail.com>

Thanks
Helen

>
> Regards,
> Vignesh
>
> >
> > Regards,
> > Helen
> >
> >> +
> >>   .ci-deqp-artifacts:
> >>     artifacts:
> >>       name: "${CI_PROJECT_NAME}_${CI_JOB_NAME}"
> >> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/im=
age-tags.yml
> >> index 20049f3626b2..c04ba0e69935 100644
> >> --- a/drivers/gpu/drm/ci/image-tags.yml
> >> +++ b/drivers/gpu/drm/ci/image-tags.yml
> >> @@ -1,5 +1,5 @@
> >>   variables:
> >> -   CONTAINER_TAG: "20250204-mesa-uprev"
> >> +   CONTAINER_TAG: "20250307-mesa-uprev"
> >>      DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
> >>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
> >>
> >> @@ -20,3 +20,5 @@ variables:
> >>      DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"
> >>
> >>      ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"
> >> +
> >> +   CONDITIONAL_BUILD_ANGLE_TAG: fec96cc945650c5fe9f7188cabe80d8a
> >> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/la=
va-submit.sh
> >> index 6e5ac51e8c0a..f22720359b33 100755
> >> --- a/drivers/gpu/drm/ci/lava-submit.sh
> >> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> >> @@ -48,7 +48,8 @@ ROOTFS_URL=3D"$(get_path_to_artifact lava-rootfs.tar=
.zst)"
> >>   rm -rf results
> >>   mkdir -p results/job-rootfs-overlay/
> >>
> >> -artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-=
job-env-vars.sh
> >> +artifacts/ci-common/export-gitlab-job-env-for-dut.sh \
> >> +    > results/job-rootfs-overlay/set-job-env-vars.sh
> >>   cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/
> >>   cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
> >>
> >> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> >> index dbc4ff50d8ff..84a25f0e783b 100644
> >> --- a/drivers/gpu/drm/ci/test.yml
> >> +++ b/drivers/gpu/drm/ci/test.yml
> >> @@ -112,7 +112,7 @@
> >>       - kvm
> >>     script:
> >>       - ln -sf $CI_PROJECT_DIR/install /install
> >> -    - mv install/bzImage /lava-files/bzImage
> >> +    - mv install/bzImage /kernel/bzImage
> >>       - mkdir -p /lib/modules
> >>       - install/crosvm-runner.sh install/igt_runner.sh
> >>     needs:
> >> --
> >> 2.47.2
> >>
> >
> >
>


--=20
Helen Koike
