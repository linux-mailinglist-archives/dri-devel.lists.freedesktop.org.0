Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07489E1EC4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710210EA17;
	Tue,  3 Dec 2024 14:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=helen.koike@collabora.com header.b="FQPWzx5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992410EA17
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1733235283; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BAz8uT1Wcxy5XFTkhXla+2rFmn6gReE986+S1jw+67jKLvRt94QVuGOKGh1DffwnHsNgJqRMy9NoCvGPbw6mK8rDyAqU2h75dPyHu5vIplsBXLv1TPREMs9gBkO5mz73LBXw/t8Q5cPXYy5PxVAVkpYZnqseJsQTUfF6ovZO/f4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1733235283;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Kt3Ag60okb753bLD5IzOxr7HnHKlyKy8guyIUs2/ek8=; 
 b=E5J2zM9HmtNQL5gxke/s3cG9bg2LKmyF3RZsNbEuDPIP1KNxErE48W/bLYdoErxkjNWyoOeFOe/1O+KanjC3b5g2hskeu1Xh/i0eTQVYKvQlg+x8Yngx3UiJop34y2sJh3gWz2izwZwcgaADoVY85sjm8wF2jIVIP8/nfLeWHIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=helen.koike@collabora.com;
 dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733235283; 
 s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Kt3Ag60okb753bLD5IzOxr7HnHKlyKy8guyIUs2/ek8=;
 b=FQPWzx5li6JIG30N66Fg6lDxsLRYDmqUTjNBnVQKY6R74GPWIEsJ1q3vPPc2022p
 rQmMmPPMc7LRdj4hc1TtFfwXcvHgtwHXRfhloZVN46d8y4+/QkUNB6T/4EW5W9km+hK
 wyIjLlnlm6d3I3cWG6kAqd6irCdIrE9TgQP/+rg4=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1733235281622162.0283050184795;
 Tue, 3 Dec 2024 06:14:41 -0800 (PST)
Date: Tue, 03 Dec 2024 11:14:41 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
 "daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
 "daniel" <daniel@ffwll.ch>, "robdclark" <robdclark@gmail.com>,
 "guilherme.gallo" <guilherme.gallo@collabora.com>,
 "sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
 "jani.nikula" <jani.nikula@linux.intel.com>,
 "dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
 "mripard" <mripard@kernel.org>,
 "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <1938cdf8eb3.e3b1897e528875.7861453509738681864@collabora.com>
In-Reply-To: <20241128042025.611659-2-vignesh.raman@collabora.com>
References: <20241128042025.611659-1-vignesh.raman@collabora.com>
 <20241128042025.611659-2-vignesh.raman@collabora.com>
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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





---- On Thu, 28 Nov 2024 01:20:20 -0300 Vignesh Raman  wrote ---

 > Uprev mesa to adapt to the latest changes in mesa ci=20
 > which includes new container jobs and stages. Also update=20
 > lava-submit script to adapt to the recent changes in mesa=20
 > to use LAVA rootfs overlays.=20
 > =20
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>=20
 > ---=20
 >  drivers/gpu/drm/ci/build.sh       |   2 +-=20
 >  drivers/gpu/drm/ci/build.yml      | 103 +++++++++++++++++++++++++++++-=
=20
 >  drivers/gpu/drm/ci/container.yml  |  22 +++----=20
 >  drivers/gpu/drm/ci/gitlab-ci.yml  |  71 ++++++++++++++------=20
 >  drivers/gpu/drm/ci/image-tags.yml |  11 +++-=20
 >  drivers/gpu/drm/ci/lava-submit.sh |  99 ++++++++++++++++++++--------=20
 >  drivers/gpu/drm/ci/test.yml       |  13 ++--=20
 >  7 files changed, 255 insertions(+), 66 deletions(-)=20
 > =20
 > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh=
=20
 > index 139b81db6312..19fe01257ab9 100644=20
 > --- a/drivers/gpu/drm/ci/build.sh=20
 > +++ b/drivers/gpu/drm/ci/build.sh=20
 > @@ -132,7 +132,7 @@ fi=20
 >  # Pass needed files to the test stage=20
 >  mkdir -p install=20
 >  cp -rfv .gitlab-ci/* install/.=20
 > -cp -rfv ci/*  install/.=20
 > +cp -rfv bin/ci/*  install/.=20
 >  cp -rfv install/common install/ci-common=20
 >  cp -rfv drivers/gpu/drm/ci/* install/.=20
 > =20
 > diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml=
=20
 > index 9c198239033d..771ecfc5008d 100644=20
 > --- a/drivers/gpu/drm/ci/build.yml=20
 > +++ b/drivers/gpu/drm/ci/build.yml=20
 > @@ -2,7 +2,7 @@=20
 >  extends:=20
 >  - .build-rules=20
 >  - .container+build-rules=20
 > -  stage: build=20
 > +  stage: build-only=20
 >  artifacts:=20
 >  paths:=20
 >  - artifacts=20
 > @@ -110,3 +110,104 @@ build-nodebugfs:arm64:=20
 > =20
 >  build:x86_64:=20
 >  extends: .build:x86_64=20
 > +=20
 > +# Disable build jobs that we won't use=20
 > +alpine-build-testing:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-android:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm32:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm32-asan:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm64:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm64-asan:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm64-build-test:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-arm64-release:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-build-testing:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-clang:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-clang-release:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-no-libdrm:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-ppc64el:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-release:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-s390x:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-testing:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-testing-asan:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-testing-msan:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-vulkan:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian-x86_32:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +fedora-release:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +rustfmt:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +shader-db:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +windows-msvc:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +yaml-toml-shell-test:=20
 > +  rules:=20
 > +    - when: never=20

Well, I don't really like this list, but I guess we don't have a choice for=
 now...

 > diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/conta=
iner.yml=20
 > index 2a94f54ce4cf..07dc13ff865d 100644=20
 > --- a/drivers/gpu/drm/ci/container.yml=20
 > +++ b/drivers/gpu/drm/ci/container.yml=20
 > @@ -24,7 +24,7 @@ alpine/x86_64_build:=20
 >  rules:=20
 >  - when: never=20
 > =20
 > -debian/x86_64_test-vk:=20
 > +debian/arm64_test-gl:=20
 >  rules:=20
 >  - when: never=20
 > =20
 > @@ -32,7 +32,15 @@ debian/arm64_test-vk:=20
 >  rules:=20
 >  - when: never=20
 > =20
 > -debian/arm64_test-gl:=20
 > +debian/ppc64el_build:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian/s390x_build:=20
 > +  rules:=20
 > +    - when: never=20
 > +=20
 > +debian/x86_64_test-vk:=20
 >  rules:=20
 >  - when: never=20
 > =20
 > @@ -56,14 +64,6 @@ windows_test_msvc:=20
 >  rules:=20
 >  - when: never=20
 > =20
 > -.debian/x86_64_build-mingw:=20
 > -   rules:=20
 > -    - when: never=20
 > -=20
 > -rustfmt:=20
 > -   rules:=20
 > -    - when: never=20
 > -=20
 >  windows_msvc:=20
 >  rules:=20
 > -    - when: never=20
 > \ No newline at end of file=20
 > +    - when: never=20
 > diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitla=
b-ci.yml=20
 > index 90bde9f00cc3..86d8c5d8ce3b 100644=20
 > --- a/drivers/gpu/drm/ci/gitlab-ci.yml=20
 > +++ b/drivers/gpu/drm/ci/gitlab-ci.yml=20
 > @@ -1,6 +1,6 @@=20
 >  variables:=20
 >  DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa=20
 > -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha c6a9a9c3bce90923f7700219354e0b6=
e5a3c9ba6=20
 > +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha e1a8fd80d411a5ff8fa19ffcf09516a=
c5099a25c=20
 > =20
 >  UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git=20
 >  TARGET_BRANCH: drm-next=20
 > @@ -31,11 +31,7 @@ variables:=20
 >  PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/${S3_ARTIFACTS_BUCKET}/${CI_PROJECT=
_PATH}/${CI_PIPELINE_ID}=20
 >  # per-job artifact storage on MinIO=20
 >  JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}=20
 > -  # default kernel for rootfs before injecting the current kernel tree=
=20
 > -  KERNEL_REPO: "gfx-ci/linux"=20
 > -  KERNEL_TAG: "v6.6.21-mesa-f8ea"=20
 >  KERNEL_IMAGE_BASE: https://${S3_HOST}/${S3_KERNEL_BUCKET}/${KERNEL_REPO=
}/${KERNEL_TAG}=20
 > -  PKG_REPO_REV: "3cc12a2a"=20
 >  LAVA_TAGS: subset-1-gfx=20
 >  LAVA_JOB_PRIORITY: 30=20
 >  ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOM=
AIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts=20
 > @@ -59,7 +55,7 @@ default:=20
 >  - cd $CI_PROJECT_DIR=20
 >  - curl --output - $DRM_CI_PROJECT_URL/-/archive/$DRM_CI_COMMIT_SHA/mesa=
-$DRM_CI_COMMIT_SHA.tar.gz | tar -xz=20
 >  - mv mesa-$DRM_CI_COMMIT_SHA/.gitlab-ci* .=20
 > -    - mv mesa-$DRM_CI_COMMIT_SHA/bin/ci .=20
 > +    - mv mesa-$DRM_CI_COMMIT_SHA/bin .=20
 >  - rm -rf mesa-$DRM_CI_COMMIT_SHA/=20
 >  - echo -e "\e[0Ksection_end:$(date +%s):drm_ci_download_section\r\e[0K"=
=20
 > =20
 > @@ -85,6 +81,7 @@ include:=20
 >  - project: *drm-ci-project-path=20
 >  ref: *drm-ci-commit-sha=20
 >  file:=20
 > +      - '/.gitlab-ci/build/gitlab-ci.yml'=20
 >  - '/.gitlab-ci/container/gitlab-ci.yml'=20
 >  - '/.gitlab-ci/farm-rules.yml'=20
 >  - '/.gitlab-ci/lava/lava-gitlab-ci.yml'=20
 > @@ -115,9 +112,10 @@ include:=20
 >  stages:=20
 >  - sanity=20
 >  - container=20
 > -  - code-validation=20
 >  - git-archive=20
 > -  - build=20
 > +  - build-for-tests=20
 > +  - build-only=20
 > +  - code-validation=20
 >  - amdgpu=20
 >  - i915=20
 >  - mediatek=20
 > @@ -264,30 +262,63 @@ sanity:=20
 >  rules:=20
 >  - if: *is-pre-merge=20
 >  when: on_success=20
 > -    # Other cases default to never=20
 > +    - when: never=20
 >  variables:=20
 >  GIT_STRATEGY: none=20
 >  script:=20
 >  # ci-fairy check-commits --junit-xml=3Dcheck-commits.xml=20
 >  - ci-fairy check-merge-request --require-allow-collaboration --junit-xm=
l=3Dcheck-merge-request.xml=20
 > +    - |=20
 > +      set -eu=20
 > +      image_tags=3D(=20
 > +        ALPINE_X86_64_LAVA_SSH_TAG=20
 > +        CONTAINER_TAG=20
 > +        DEBIAN_BASE_TAG=20
 > +        DEBIAN_BUILD_TAG=20
 > +        DEBIAN_PYUTILS_TAG=20
 > +        DEBIAN_TEST_GL_TAG=20
 > +        KERNEL_ROOTFS_TAG=20
 > +        KERNEL_TAG=20
 > +        PKG_REPO_REV=20
 > +      )=20
 > +      for var in "${image_tags[@]}"=20
 > +      do=20
 > +        if [ "$(echo -n "${!var}" | wc -c)" -gt 20 ]=20
 > +        then=20
 > +          echo "$var is too long; please make sure it is at most 20 cha=
rs."=20
 > +          exit 1=20
 > +        fi=20
 > +      done=20
 >  artifacts:=20
 >  when: on_failure=20
 >  reports:=20
 >  junit: check-*.xml=20
 > +  tags:=20
 > +    - placeholder-job=20
 > =20
 > -# Rules for tests that should not block merging, but should be availabl=
e to=20
 > -# optionally run with the "play" button in the UI in pre-merge non-marg=
e=20
 > -# pipelines.  This should appear in "extends:" after any includes of=20
 > -# test-source-dep.yml rules, so that these rules replace those.=20
 > -.test-manual-mr:=20
 > +=20
 > +mr-label-maker-test:=20
 > +  extends:=20
 > +    - .fdo.ci-fairy=20
 > +  stage: sanity=20
 >  rules:=20
 > -    - !reference [.no_scheduled_pipelines-rules, rules]=20
 > -    - if: *is-forked-branch-or-pre-merge-not-for-marge=20
 > -      when: manual=20
 > +    - !reference [.mr-label-maker-rules, rules]=20
 >  variables:=20
 > -    JOB_TIMEOUT: 80=20
 > -=20
 > +    GIT_STRATEGY: fetch=20
 > +  timeout: 10m=20
 > +  script:=20
 > +    - set -eu=20
 > +    - python3 -m venv .venv=20
 > +    - source .venv/bin/activate=20
 > +    - pip install git+https://gitlab.freedesktop.org/freedesktop/mr-lab=
el-maker=20
 > +    - mr-label-maker --dry-run --mr $CI_MERGE_REQUEST_IID=20
 > =20
 >  # Jobs that need to pass before spending hardware resources on further =
testing=20
 >  .required-for-hardware-jobs:=20
 > -  needs: []=20
 > +  needs:=20
 > +    - job: clang-format=20
 > +      optional: true=20
 > +    - job: rustfmt=20
 > +      optional: true=20
 > +    - job: toml-lint=20
 > +      optional: true=20
 > diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/imag=
e-tags.yml=20
 > index 8d8b9e71852e..528ef44285bb 100644=20
 > --- a/drivers/gpu/drm/ci/image-tags.yml=20
 > +++ b/drivers/gpu/drm/ci/image-tags.yml=20
 > @@ -1,5 +1,5 @@=20
 >  variables:=20
 > -   CONTAINER_TAG: "2024-09-09-uprevs"=20
 > +   CONTAINER_TAG: "20241127-mesa-uprev"=20
 >  DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"=20
 >  DEBIAN_BASE_TAG: "${CONTAINER_TAG}"=20
 > =20
 > @@ -7,9 +7,16 @@ variables:=20
 >  DEBIAN_BUILD_TAG: "${CONTAINER_TAG}"=20
 > =20
 >  KERNEL_ROOTFS_TAG: "${CONTAINER_TAG}"=20
 > +   # default kernel for rootfs before injecting the current kernel tree=
=20
 > +   KERNEL_TAG: "v6.6.21-mesa-f8ea"=20
 > +   KERNEL_REPO: "gfx-ci/linux"=20
 > +   PKG_REPO_REV: "bca9635d"=20
 > =20
 >  DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"=20
 >  DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"=20
 >  DEBIAN_TEST_GL_TAG: "${CONTAINER_TAG}"=20
 > =20
 > -   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"=20
 > \ No newline at end of file=20
 > +   DEBIAN_PYUTILS_IMAGE: "debian/x86_64_pyutils"=20
 > +   DEBIAN_PYUTILS_TAG: "${CONTAINER_TAG}"=20
 > +=20
 > +   ALPINE_X86_64_LAVA_SSH_TAG: "${CONTAINER_TAG}"=20
 > diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava=
-submit.sh=20
 > index 6add15083c78..a1404a2d8cee 100755=20
 > --- a/drivers/gpu/drm/ci/lava-submit.sh=20
 > +++ b/drivers/gpu/drm/ci/lava-submit.sh=20
 > @@ -1,58 +1,105 @@=20
 > -#!/bin/bash=20
 > +#!/usr/bin/env bash=20
 >  # SPDX-License-Identifier: MIT=20
 > +# shellcheck disable=3DSC2086 # we want word splitting=20
 > +# shellcheck disable=3DSC1091 # paths only become valid at runtime=20
 > =20
 > -set -e=20
 > -set -x=20
 > +# If we run in the fork (not from mesa or Marge-bot), reuse mainline ke=
rnel and rootfs, if exist.=20
 > +_check_artifact_path() {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0_url=3D"https://${1}/${2}"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if curl -s -o /dev/null -I -L -f --retry 4 --re=
try-delay 15 "${_url}"; then=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo -n "${_url}"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0fi=20
 > +}=20
 > =20
 > -# Try to use the kernel and rootfs built in mainline first, so we're mo=
re=20
 > -# likely to hit cache=20
 > -if curl -L --retry 4 -f --retry-all-errors --retry-delay 60 -s "https:/=
/${BASE_SYSTEM_MAINLINE_HOST_PATH}/done"; then=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0BASE_SYSTEM_HOST_PATH=3D"${BASE_SYSTEM_MAINLINE=
_HOST_PATH}"=20
 > -else=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0BASE_SYSTEM_HOST_PATH=3D"${BASE_SYSTEM_FORK_HOS=
T_PATH}"=20
 > -fi=20
 > +get_path_to_artifact() {=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0_mainline_artifact=3D"$(_check_artifact_path ${=
BASE_SYSTEM_MAINLINE_HOST_PATH} ${1})"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if [ -n "${_mainline_artifact}" ]; then=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo -n "${_mainline_ar=
tifact}"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0fi=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0_fork_artifact=3D"$(_check_artifact_path ${BASE=
_SYSTEM_FORK_HOST_PATH} ${1})"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0if [ -n "${_fork_artifact}" ]; then=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0echo -n "${_fork_artifa=
ct}"=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0fi=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0set +x=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0error "Sorry, I couldn't find a viable built pa=
th for ${1} in either mainline or a fork." >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "" >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "If you're working on CI, this probably me=
ans that you're missing a dependency:" >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "this job ran ahead of the job which was s=
upposed to upload that artifact." >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "" >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "If you aren't working on CI, please ping =
@mesa/ci-helpers to see if we can help." >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "" >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0echo "This job is going to fail, because I can'=
t find the resources I need. Sorry." >&2=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0set -x=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0exit 1=20
 > +}=20
 > +=20
 > +. "${SCRIPTS_DIR}/setup-test-env.sh"=20
 > +=20
 > +section_start prepare_rootfs "Preparing root filesystem"=20
 > +=20
 > +set -ex=20
 > +=20
 > +section_switch rootfs "Assembling root filesystem"=20
 > +ROOTFS_URL=3D"$(get_path_to_artifact lava-rootfs.tar.zst)"=20
 > +[ $? !=3D 1 ] || exit 1=20
 > =20
 >  rm -rf results=20
 >  mkdir -p results/job-rootfs-overlay/=20
 > =20
 > +artifacts/ci-common/generate-env.sh > results/job-rootfs-overlay/set-jo=
b-env-vars.sh=20
 >  cp artifacts/ci-common/capture-devcoredump.sh results/job-rootfs-overla=
y/=20
 >  cp artifacts/ci-common/init-*.sh results/job-rootfs-overlay/=20
 >  cp artifacts/ci-common/intel-gpu-freq.sh results/job-rootfs-overlay/=20
 > +cp artifacts/ci-common/kdl.sh results/job-rootfs-overlay/=20
 >  cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/=20
 > =20
 > -# Prepare env vars for upload.=20
 > -section_start variables "Variables passed through:"=20
 > -KERNEL_IMAGE_BASE=3D"https://${BASE_SYSTEM_HOST_PATH}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0artifacts/ci-common/generate-env.sh | tee resul=
ts/job-rootfs-overlay/set-job-env-vars.sh=20
 > -section_end variables=20
 > -=20
 >  tar zcf job-rootfs-overlay.tar.gz -C results/job-rootfs-overlay/ .=20
 >  ci-fairy s3cp --token-file "${S3_JWT_FILE}" job-rootfs-overlay.tar.gz "=
https://${JOB_ROOTFS_OVERLAY_PATH}"=20
 > =20
 > +# Prepare env vars for upload.=20
 > +section_switch variables "Environment variables passed through to devic=
e:"=20
 > +cat results/job-rootfs-overlay/set-job-env-vars.sh=20
 > +=20
 > +section_switch lava_submit "Submitting job for scheduling"=20
 > +=20
 >  touch results/lava.log=20
 >  tail -f results/lava.log &=20
 > -=20
 >  PYTHONPATH=3Dartifacts/ artifacts/lava/lava_job_submitter.py \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0submit \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--farm "${FARM}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--device-type "${DEVICE_TYPE}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--boot-method "${BOOT_METHOD}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--job-timeout-min ${JOB_TIMEOUT:-30} \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--dump-yaml \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--pipeline-info "$CI_JOB_NAME: $CI_PIPELINE_URL=
 on $CI_COMMIT_REF_NAME ${CI_NODE_INDEX}/${CI_NODE_TOTAL}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--rootfs-url-prefix "https://${BASE_SYSTEM_HOST=
_PATH}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--rootfs-url "${ROOTFS_URL}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--kernel-url-prefix "https://${PIPELINE_ARTIFAC=
TS_BASE}/${DEBIAN_ARCH}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--build-url "${FDO_HTTP_CACHE_URI:-}https://${P=
IPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar.zst" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--job-rootfs-overlay-url "${FDO_HTTP_CACHE_URI:=
-}https://${JOB_ROOTFS_OVERLAY_PATH}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--job-timeout-min ${JOB_TIMEOUT:-80} \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--kernel-external "${EXTERNAL_KERNEL_TAG}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--first-stage-init artifacts/ci-common/init-sta=
ge1.sh \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--ci-project-dir "${CI_PROJECT_DIR}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--device-type "${DEVICE_TYPE}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--farm "${FARM}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--dtb-filename "${DTB}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--jwt-file "${S3_JWT_FILE}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--kernel-image-name "${KERNEL_IMAGE_NAME}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--kernel-image-type "${KERNEL_IMAGE_TYPE}" \=20
 > -=C2=A0=C2=A0=C2=A0=C2=A0--boot-method "${BOOT_METHOD}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--visibility-group "${VISIBILITY_GROUP}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--lava-tags "${LAVA_TAGS}" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--mesa-job-name "$CI_JOB_NAME" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--structured-log-file "results/lava_job_detail.=
json" \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0--ssh-client-image "${LAVA_SSH_CLIENT_IMAGE}" \=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--project-name "${CI_PROJECT_NAME}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--starting-section "${CURRENT_SECTION}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0--job-submitted-at "${CI_JOB_STARTED_AT}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0- append-overlay \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--name=3Dkernel-build \=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--url=3D"${FDO_HTTP_CAC=
HE_URI:-}https://${PIPELINE_ARTIFACTS_BASE}/${DEBIAN_ARCH}/kernel-files.tar=
.zst" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--compression=3Dzstd \=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--path=3D"${CI_PROJECT_=
DIR}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--format=3Dtar \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0- append-overlay \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--name=3Djob-overlay \=
=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--url=3D"https://${JOB_=
ROOTFS_OVERLAY_PATH}" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--compression=3Dgz \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--path=3D"/" \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--format=3Dtar \=20
 > +=C2=A0=C2=A0=C2=A0=C2=A0- submit \=20
 >  =C2=A0=C2=A0=C2=A0=C2=A0>> results/lava.log=20
 > diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml=
=20
 > index f0ef60c8f56d..42a8e7f93714 100644=20
 > --- a/drivers/gpu/drm/ci/test.yml=20
 > +++ b/drivers/gpu/drm/ci/test.yml=20
 > @@ -1,21 +1,21 @@=20
 >  .test-rules:=20
 >  rules:=20
 > -    - if: '$FD_FARM =3D=3D "offline" && $RUNNER_TAG =3D~ /^google-freed=
reno-/'=20
 > -      when: never=20
 > -    - if: '$COLLABORA_FARM =3D=3D "offline" && $RUNNER_TAG =3D~ /^mesa-=
ci-x86-64-lava-/'=20
 > -      when: never=20
 >  - !reference [.no_scheduled_pipelines-rules, rules]=20
 > +    - !reference [.collabora-farm-rules, rules]=20
 > +    - !reference [.google-freedreno-farm-rules, rules]=20
 >  - when: on_success=20
 > =20
 >  .lava-test:=20
 >  extends:=20
 >  - .test-rules=20
 > +    - .build-rules=20
 > +    - .container+build-rules=20
 >  timeout: "1h30m"=20
 >  script:=20
 >  # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY=
=20
 >  - rm -rf install=20
 >  - tar -xf artifacts/install.tar=20
 > -    - mv install/* artifacts/.=20
 > +    - mv -n install/* artifacts/.=20
 >  # Override it with our lava-submit.sh script=20
 >  - ./artifacts/lava-submit.sh=20
 > =20
 > @@ -32,6 +32,7 @@=20
 >  - alpine/x86_64_lava_ssh_client=20
 >  - kernel+rootfs_arm32=20
 >  - debian/x86_64_build=20
 > +    - python-test=20
 >  - testing:arm32=20
 >  - igt:arm32=20
 > =20
 > @@ -48,6 +49,7 @@=20
 >  - alpine/x86_64_lava_ssh_client=20
 >  - kernel+rootfs_arm64=20
 >  - debian/x86_64_build=20
 > +    - python-test=20
 >  - testing:arm64=20
 >  - igt:arm64=20
 > =20
 > @@ -64,6 +66,7 @@=20
 >  - alpine/x86_64_lava_ssh_client=20
 >  - kernel+rootfs_x86_64=20
 >  - debian/x86_64_build=20
 > +    - python-test=20
 >  - testing:x86_64=20
 >  - igt:x86_64=20
 > =20
 > --=20
 > 2.43.0=20
 > =20
 >=20

lgtm
Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen



