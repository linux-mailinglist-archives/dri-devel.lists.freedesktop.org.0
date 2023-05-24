Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A880770EEDF
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:02:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1D310E57F;
	Wed, 24 May 2023 07:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976E710E57D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:02:36 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4394217a8cbso197752137.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 00:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684911755; x=1687503755;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
 b=GS0T+2ZiZtIWhMLKI1BCOYeVgv/IGtV84JHpGDoKwUETz4c5FtzkwVnkLZRCAUXr1w
 UOjLF0XImHP0TCxXerBTDu66jzWaLqIR9nA8v6V3EWkXUKhwccAiz/r4JNsXzNNbfyFu
 nkw+g0Ehx1u0wgcDZr5f8Pz/jHmmPlEZAglyd6lx2LTlJhSwj5U9kaoBXf/dQ3pujEmR
 r20QDnFLKHPJ373hZiYFZ+HMh3Tp2Fd/nANKSufzOjFVaDzoXf/4zxNzYDQeWcR6iT+g
 kcmTH8SLmxfacnyj+71eWYp0Vr8Xvd9/4o5fysO5cedJS1mDIsMXl9PfLh5zO+vTPfGp
 xvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684911755; x=1687503755;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zathy20xS7vJeZuKOGggo3NoBWnp0DVNbyEjeiM6xS4=;
 b=YbCNhD5j9zJBB4vr1gGPMIAGbjLVm6UfsaySJio7gBFlBvbZC2crHc3phj8L0XRdbU
 NvTNXpgdo4td9Czr1dq0QwQLpuShy/Ta+6mNDz15x/wjaCJcUhXufL3aQSsa0J1UygDl
 z3wi/Ac4woziDQ0tJUkH4if5XlMTJsDsiFuyrJdYwUPtwKxY42IutBYFGAml+xknMkyx
 mzI4/8SsTAiLVL3GrF/mpnTm5iGnc4EmYWYPYYG5AQwu9XN4vw0aJrXMQ31B9k9KofG/
 fQTOKi14sdYYus1y8k2g7/jgrQ2nYT7PJNrThelkQNcm2InC4i7zNELV0YjYu3uqURto
 L9pQ==
X-Gm-Message-State: AC+VfDzYqE9yQ5ktl//uCgRszt+ouHtZwZal2UHyw5oOk3W8t+EXDqnT
 DYUveIbPtm7AdD8hX7w3deqprSjWYyQTyaobYIt0qg==
X-Google-Smtp-Source: ACHHUZ5YvfK9jIfenGUN1SYu3dWbneLgbIzcETIs71ai8XaJGabWjDHqNLVp3vKy8J/gVDKADHkGbupXtaLmckg4avo=
X-Received: by 2002:a05:6102:2f4:b0:437:db1d:7edf with SMTP id
 j20-20020a05610202f400b00437db1d7edfmr5330791vsj.26.1684911755092; Wed, 24
 May 2023 00:02:35 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 24 May 2023 12:32:24 +0530
Message-ID: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
Subject: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 clang-built-linux <llvm@lists.linux.dev>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 lkft-triage@lists.linaro.org
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
Cc: Nathan Chancellor <nathan@kernel.org>, arun.r.murthy@intel.com,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
with clang.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going \
  --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 \
  SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- \
  'HOSTCC=sccache clang' 'CC=sccache clang' \
   LLVM=1 LLVM_IAS=1

drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
unannotated fall-through between switch labels
[-Werror,-Wimplicit-fallthrough]
                case I915_FORMAT_MOD_X_TILED:
                ^
drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
'break;' to avoid fall-through
                case I915_FORMAT_MOD_X_TILED:
                ^
                break;
1 error generated.

log:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230524/testrun/17171777/suite/build/test/clang-lkftconfig/history/



--
Linaro LKFT
https://lkft.linaro.org
