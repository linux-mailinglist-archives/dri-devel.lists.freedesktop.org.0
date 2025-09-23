Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC0B9552C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF86C10E04F;
	Tue, 23 Sep 2025 09:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FyTqFo59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D9310E04F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:51:12 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b523fb676efso4629856a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758621072; x=1759225872; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
 b=FyTqFo59LR881O8bttoiJQAwYYxYL6jDUsrfJMd+3alFfFPvYIucMYLOtzgxC3ldIA
 +w9a6mfM8C7It7K7A2OnQCgw9MdiTZiUw5Y0Zwwn9JSznoc2FuzBZQ8q1Rx5Lh7VSDpO
 UHmH5X+3cw30kP4riy330UWuisgviH5bWXHra9Dg+tp5a4SpjO6ei5GsnZ9QC+AVGQIG
 QL6lIv3uyfiEPPtaR3uI5+fROleylB6XfrKRAoaFtllnbiLs20jTLJYhDin1Lq3jdJUJ
 xHu1/n2Z4mqaGv4ASqVbJ+enJsaMwHEgR47exmvcY2XVqCUkjaRMWlUrDy7WkDUs6zzn
 qTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758621072; x=1759225872;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujUSntEdEB2Zj8RW3cXBNzPb5lb7mNEARj7gYfxpl6o=;
 b=pxOSnkvgNpx8iWURba5/jybv9qgkW0hPkqBon7hKGpjfh/zs1ZvRMjdiC9XiNOpqvF
 tNOVk9j0X7BmKu49iKPiTBczRbRclB22TfAJuspabLEveeRmCaGmbIUS5KUwsENvdyyo
 oYai8hXvVM40oWQM294mLaHFy6UzEl0ljGMoPPdzkd5cvollKXBxzn6xc1bdxzuTr18c
 J1IyafFq46L3BIB3cMSg/527mJDuCpBE7FTd8dZdqf8GYRRQkUQxCIl1qFEfJUQOYQwX
 B+VoV4+i/YXIvkhKIPg3EUQbxjxjS0wz8v6ho8MEjm5wRLFjAo2n9YtpfKPNINrm9Hce
 mMzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF8IvjEKMEUjT5T/pxUQuRwgM9uZWQkOQ46MWQcClheEc7B8KrpzVs4hgTYZED5Pebj4916TIXao8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCQw15pq1h+UbI12SLLOIy80kUCoRiLhqoCZv9g5tOqbaGjhZA
 7RLcuch6zdV8flgOoi6+HMJraT5qnpXTxBXykWzaBofaCssKOXhUvh9oRTvjI/HqHs5t3mSH57h
 Ms5SSrnNk7/8vC1ja1DdZC1s2ZI6lU2Daqpg4dceK2+82x0euI8LBe/7EYA==
X-Gm-Gg: ASbGncvgV/UJR0cr/M/75UyU/vmC/D3lTiW4fe7RPaefvD5WFQzid73vi4zdf4TT53H
 FjUg6r+v+u8hvfzw11Qd4/ivG2YuTJTxFzt36gJyxnXHEy1Ikv+M9/5iQ9hjOExMNBtBHTY94WR
 +ltv8dWm//ulpkusDLffOPDBN64e7vanNXwM5I/8coycbZ2Ask3h9HzkQkKUcRt8pL9a39cWUHz
 pSdN4mI+uxFHqEc0aTtz9wRFZ3sK3lIDQi3+KBlVKYhJ0aszC0=
X-Google-Smtp-Source: AGHT+IFHus42Ak5ruWRhTAyg3xMfr+guDvkTkhHI6eHQ3GvPvUzkyf4uNtM2sp4MCW+8IQd4OjacMuEUwlCpUIFW7h0=
X-Received: by 2002:a17:902:ecc5:b0:264:c886:8188 with SMTP id
 d9443c01a7336-27cc2c98b42mr26887555ad.24.1758621071785; Tue, 23 Sep 2025
 02:51:11 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 23 Sep 2025 15:21:00 +0530
X-Gm-Features: AS18NWCTfgTcnoVtFJ38FtxMSy0NvoryOqAycB2FQR-fdtYRDlc0bdIbrsPkR5s
Message-ID: <CA+G9fYuZZUQq=7qPavXnHZtX9oQ=amfYVeYRZu3SHfD0ReD6nQ@mail.gmail.com>
Subject: next-20250922: xe_device_sysfs.c:300:25: error: label 'cleanup' used
 but not defined
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 Linux Regressions <regressions@lists.linux.dev>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Anders Roxell <anders.roxell@linaro.org>,
 Ben Copeland <benjamin.copeland@linaro.org>
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

The arm64 and x86_64 builds failed on the Linux next-20250922 tag build due
to following build warnings / errors with gcc and clang toolchain.

First seen on next-20250922
Good: next-20250919
Bad: next-20250922

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250922: xe_device_sysfs.c:300:25: error: label
'cleanup' used but not defined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
drivers/gpu/drm/xe/xe_device_sysfs.c: In function 'xe_device_sysfs_init':
drivers/gpu/drm/xe/xe_device_sysfs.c:300:25: error: label 'cleanup'
used but not defined
  300 |                         goto cleanup;
      |                         ^~~~

## Source
* Kernel version: 6.17.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250922
* Git commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
* Architectures: arm64, x86_64
* Toolchains: gcc-13 and clang-20
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29968978/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250922/log-parser-build-gcc/gcc-compiler-drivers_gpu_drm_xe_xe_device_sysfs_c-error-label-cleanup-used-but-not-defined/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/333Idt9y0485dJThIiCgCMB7ehs/config

--
Linaro LKFT
