Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398DA4C2E77
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 15:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36110E9D6;
	Thu, 24 Feb 2022 14:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F8610E9D6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:31:23 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id j12so4139735ybh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 06:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=yN4qqwzRUbf48GIlrimNl5sMWvOFulKNBolCSX/vfSs=;
 b=ueUn5iqUjUYldOHpCUKXR+wfQojXmywKv3+H2krKYsKK642HIuat0fTLg9wk1Ee8ea
 mcolfxfYSHLI6NSj8TwUIDeC5Hx56X5uRgwWqEROPqKGls9/BFYx7tCQUTg6UqWzhdz9
 L2WHYtp6ZZ1Hk8pGJaxUdcfaUybg2gZmI9pfBoHGxVg/Zjep4YtM+/3oychx5Q72LXgo
 IWKa77qzorc88gHqjp+C3GwBwrFrS5AKV/+2ZLo2JGvCgQDlq1/sc8B/+EsN3odlmDq1
 4qr6DfrU4ENLvh7OsvsDJ3xobLKGPY68ZLnCxGUuSFiyb2ay9BO5w0lAnNYPJUcibq20
 S93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=yN4qqwzRUbf48GIlrimNl5sMWvOFulKNBolCSX/vfSs=;
 b=kNrfGNFad2t0xXbskhvvPP2iUYSYpoVeLpLZk1cBbBM4wOCHKPUE9xniEyfrSIbjQ+
 1q2mkwvsBN5240eymf7Ejeb0VPgHehe30sMeNjF+1H809tCCC4uvze6B6WqS9dCwmFQx
 CRpKgpDaqjP2hOsH9FE3V2CwYVIR0mXrdbqKpnj0bygj8aN6yiN2OkOmWmc/BXW9jnHK
 rZEvMsjbhN+cbGCRXEONlXqkko9hHLAzlSH206CeqVglNCxhI5wmDdGopOFEd6jZnBW5
 vLpd8omlCqtcc7c6b5wxmfy2YHFWnVAD5F6FihNX7Ba55aMv8fw8LjlTQHtstpdRHVZy
 QF/g==
X-Gm-Message-State: AOAM5330rL9MwnKBb642n3YCl05BB2Gxystog5KCF+xWtKJ2BzGTL4FN
 OkYYXsbV0FIou7f/xjhAop2IqW06/cDMPqus1tBoCABuRt44OA==
X-Google-Smtp-Source: ABdhPJzCAv17bPxxtrBHUsYVgjz+4kPNay/KOgbfa2FRXojMJEjYMnZBpYaZ7q1jNSMEQ4TypGvXqY148lSE5HmF/i8=
X-Received: by 2002:a25:6993:0:b0:624:55af:336c with SMTP id
 e141-20020a256993000000b0062455af336cmr2650572ybc.412.1645713081929; Thu, 24
 Feb 2022 06:31:21 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 24 Feb 2022 20:01:10 +0530
Message-ID: <CA+G9fYu4PPE6_91mzor0bW7RSzBDNJ3xqqgeeK-jR1jokmhYOQ@mail.gmail.com>
Subject: gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10 is outside
 array bounds of 'const u8[6]'
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, lkft-triage@lists.linaro.org,
 Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Please ignore this email if it is already reported]

Linux next-20220223 arch riscv build warnings noticed.
Build configs:
  - riscv-gcc-9-defconfig
  - riscv-gcc-9-defconfig
  - riscv-gcc-10-defconfig
  - riscv-gcc-11-defconfig

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: d4a0ae62a277377de396850ed4b709b6bd9b7326
  git_describe: next-20220223
  arch: riscv
  toolchain: gcc-11

Build warnings:
-----------
drivers/gpu/drm/dp/drm_dp.c: In function
'drm_dp_get_adjust_request_post_cursor':
drivers/gpu/drm/dp/drm_dp.c:59:27: warning: array subscript 10 is
outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'}
[-Warray-bounds]
   59 |         return link_status[r - DP_LANE0_1_STATUS];
      |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/dp/drm_dp.c:210:51: note: while referencing 'link_status'
  210 | u8 drm_dp_get_adjust_request_post_cursor(const u8
link_status[DP_LINK_STATUS_SIZE],
      |
~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[1]: Target '__all' not remade because of errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Steps to reproduce:
------------------
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake

tuxmake --runtime podman --target-arch riscv --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org

[1] https://builds.tuxbuild.com/25XO99nwfQgKrWKz4yfBPYw0wyU/
