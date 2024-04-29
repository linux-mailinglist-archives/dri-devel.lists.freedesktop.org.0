Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDE8B5C93
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 17:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA685112CF4;
	Mon, 29 Apr 2024 15:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YUuixz4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326C1112CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 15:07:06 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-5ad2a15374eso3030987eaf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714403225; x=1715008025; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Kq/mDhjDx0haJOXMYO5ieP1vWAdfCIwGNjDIS1vV1ns=;
 b=YUuixz4O9dM7zFbPsY47P84rtLzbQdMERf7L5VIwsYAnhTfSNMpkF+bHJC+XVsE+xG
 P8vwqFf0Pxz1b47vOuPSeCcp9nTx05UpPCWWjR8HBfVx2fwHKR/6ZW15L6uc0u29OxJV
 zDi4u0NfxL40MgE6KZRsg72070YmHH3iMEkyDCZuz50TpypTzYh7dw3vFuwG80/iVkEU
 wudAI3qIP+yNjuKIzDtmL+PyzbNHS/SdE9xWqWYMB900QQ+H+UDsc9+5xjBYcYwjZrSa
 Zm7t2qIhGFEm30PEfksS2dw91HH66HZ2KC8UHn/HsP3iqcOxo4ztUW7w4y8jcj8s0M2U
 c3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714403225; x=1715008025;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kq/mDhjDx0haJOXMYO5ieP1vWAdfCIwGNjDIS1vV1ns=;
 b=UT9LZKcdv/XE7hXWFdl8DYHMpBP/+Vv7ec4pVHxPGopfv07+cx9hfjK0zZjEC5dI/0
 pqoxYmAGuw98PaS7VODkH5nNWGhPrs/SmfDjbunI9nRpFmNuWMXuh9HofJpScImbMg1m
 LRmh9kKXZUm9zp+cL3nplHzM3rnlJ44aWnk0e5NHXygrMufDZ17QaKSmxOsAdV7DJeem
 zz5BzObXrKbxnnBQRgElPUtyauYDKZFHvMgvkHRwE7duZCDdSb0EJylTBHIQE8R2ZeOO
 sac5IVuqvHyfZN/yKNV2BR+adz2TUzHOa+gz9ZZTQrF4t2j1dqo7tYFgauk2qQKzvke+
 AImw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiWZOAmQH7b+7e8hHA7/pKxybW+aME9UyG7nDxYGmaQnUH/Q+gu779QN4z0K6v6znxLllIL+q5Q7mhRSaN06GMGxOddQFfp7hdBZx5QM+j
X-Gm-Message-State: AOJu0YyZErwVbpcB8WijCkBwuV5yHKu049HE1IlGpa317qWKqt+CqLuS
 d3jm6Dt9vYKhGVFdGTnRH4vPP6QqzLUOPcDoSPqhnNUchiKIuphUj9sJVn2qpBr0X8R3fVg7Kkd
 mAs+83yyCNfin496Beyy6WNv/98FPFEWRcrDOtQ==
X-Google-Smtp-Source: AGHT+IGi7klXrfkLGYDk0bH46vsiOhdwy/HLQn/JmrZKyHF7xJC4yozyKeAYx8uVrhCWOCacbYNZwg87iwhAtb2HZSs=
X-Received: by 2002:a05:6358:5d91:b0:186:3fcb:8da9 with SMTP id
 s17-20020a0563585d9100b001863fcb8da9mr11016997rwm.21.1714403224770; Mon, 29
 Apr 2024 08:07:04 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 29 Apr 2024 20:36:53 +0530
Message-ID: <CA+G9fYu7Ug0K8h9QJT0WbtWh_LL9Juc+VC0WMU_Z_vSSPDNymg@mail.gmail.com>
Subject: nouveau: r535.c:1266:3: error: label at end of compound statement
 default: with gcc-8
To: open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

Following build warnings / errors noticed on Linux next-20240429 tag on the
arm64, arm and riscv with gcc-8 and gcc-13 builds pass.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Commit id:
 b58a0bc904ff nouveau: add command-line GSP-RM registry support

Buids:
--
  gcc-8-arm64-defconfig - Fail
  gcc-8-arm-defconfig - Fail
  gcc-8-riscv-defconfig - Fail

Build log:
----
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c: In function 'build_registry':
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1266:3: error: label at
end of compound statement
   default:
   ^~~~~~~
make[7]: *** [scripts/Makefile.build:244:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.o] Error 1

metadata:
  git_describe: next-20240429
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_short_log: b0a2c79c6f35 ("Add linux-next specific files for 20240429")
  arch: arm64, arm, riscv
  toolchain: gcc-8

Steps to reproduce:
----
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

Links:
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2flcoOuqVJfhTvX4AOYsWMd5hqe/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23704376/suite/build/test/gcc-8-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240429/testrun/23705756/suite/build/test/gcc-8-defconfig/details/


--
Linaro LKFT
https://lkft.linaro.org
