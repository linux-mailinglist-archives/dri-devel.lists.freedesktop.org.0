Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34005BCE7B8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552D210E00B;
	Fri, 10 Oct 2025 20:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IsjKrzA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B617910E00B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 20:22:46 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-7946137e7a2so28917526d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760127766; x=1760732566; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kOlXU3CUoKeK/3MB4H/Hutp9m6wXAv/MJRLCHZaC5v4=;
 b=IsjKrzA5KXs9VRp+TqJcjjJ9E2QkJH98Em0FedEBFS14AnS0fpYDDTsbYiegn6DStH
 /VG3GpNvxqKDwtwzs5kqHt5FUjmk/y/XQbXqPEjgcEP7JAtWVkfq0hG47CvTkxFAokh0
 wKkPJSSFRD2zc8gfaxZfUaWo6h4iAd16vFKHpGFmrrkA1CFaezri5ELSbm0zlteF+OW6
 jela0ra5vCEdqrG2YGaFFdE+ZzrDhHCL5fREvAs53N264EVQk+DBP5pU6sZGWK/mxO6i
 OS/gabPS532RRZtnKhgUj83s+5GiOQpVYqWvrQEBOushfllCpA22BXvPYQH+SJDYV1bF
 71ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760127766; x=1760732566;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kOlXU3CUoKeK/3MB4H/Hutp9m6wXAv/MJRLCHZaC5v4=;
 b=ciKnXtKcZKcOYl8pA8286BhhB1Zd5sHkeZVsntUNM39KHmio+sea/oOCsmyWP5JmJB
 NYaYmxKrLCAGg5MEZyCwV2x8XeM15R8QISiyIAEmWkswpTaxbAkE8Df1egrPS8yWFly+
 Bmcx0395DGlngQHiCBxhD7ON1bin7BvVNpeuOQOcvOhhKuOrFADRfq83tj/I9TG0R6+R
 W/xL5y5HNjiA0mk8TFMspGWKzJQZ3T7bp2Z9fri+TCj2JqW0FvBLXzvxWBtO2a+6oLyA
 CidQE53DvUXh2GHI65EDTU2Dwsjzigkpk9fN3UZnjpksRYI0/ta/GUWZxgFlGsTgxgbe
 4wMQ==
X-Gm-Message-State: AOJu0YzXrhPfis5e6SyWuGLJtjVxgJulV8vFbvl6c1AZdJ0gby4W/vYq
 Iyu2Sm7UwN6AFNhiOMR3GGbrV/SHGuFTssyu7gxpsRPidCC50lyLBcpPwiVM0NdUc7lgTA32lGI
 2q8Vb7UCtB+UW5jzF/UBiYAZkivzF5Dg=
X-Gm-Gg: ASbGncs2QtZH3yCvxu3VGSZkNF+i4BrDSYQdeZBWDuXrm2/vvZXTWUulxX/+MCxMybE
 XQzy7ZoUYbeFsnXaMiP1VUadwKUgKD0soxmgSnPJ88NAeYJb7m+jSsPUDNBsr64lXMz+bsG+ndA
 2KE1tUxtvXWgxHHz0UPepeaCRV1DiPF5xFjLRLNcJqhydfDfScxCINtiGIDoc4i/0bbh7/81qVI
 oywKS8WCGCrJMYXRe/KdsXoYEMlXrG2JhbB+opz0FqrMw==
X-Google-Smtp-Source: AGHT+IFRBVsqFinOd4zTYiRWveXS359GwGwHzVPRkzgxnHxzaIBwEyLo8p0XGX9557suH3OnFdez/xvaECXYxImIuAE=
X-Received: by 2002:a05:6214:27e9:b0:803:3b8e:e9a5 with SMTP id
 6a1803df08f44-87b2efc2c78mr178005776d6.36.1760127765447; Fri, 10 Oct 2025
 13:22:45 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 11 Oct 2025 06:22:34 +1000
X-Gm-Features: AS18NWAVMCkrlDV90Tmk-ZHzHs4WJK4jFJRa3qb-mFFk11CtCG6cKQIhbqS-TcI
Message-ID: <CAPM=9tx8Hiozxaf+0WkOH3GrXKhCr_ccqVtd1v7WkP_V9DmeJQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.18-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Some fixes leftover from our fixes branch, just nouveau and vmwgfx.

Thanks,
Dave.

drm-fixes-2025-10-11:
drm fixes for 6.18-rc1

nouveau:
- Return errno code from TTM move helper

vmwgfx:
- Fix null-ptr access in cursor code
- Fix UAF in validation
- Use correct iterator in validation
The following changes since commit e5f0a698b34ed76002dc5cff3804a61c80233a7a:

  Linux 6.17 (2025-09-28 14:39:22 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-11

for you to fetch changes up to 5ca5f00a167cdd28bcfeeae6ddd370b13ac00a2a:

  Merge tag 'drm-misc-fixes-2025-10-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-10-11 06:17:13 +1000)

----------------------------------------------------------------
drm fixes for 6.18-rc1

nouveau:
- Return errno code from TTM move helper

vmwgfx:
- Fix null-ptr access in cursor code
- Fix UAF in validation
- Use correct iterator in validation

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'drm-misc-fixes-2025-10-09' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes

Ian Forbes (2):
      drm/vmwgfx: Fix Use-after-free in validation
      drm/vmwgfx: Fix copy-paste typo in validation

Shuhao Fu (1):
      drm/nouveau: fix bad ret code in nouveau_bo_move_prep

Zack Rusin (1):
      drm/vmwgfx: Fix a null-ptr access in the cursor snooper

 drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 17 ++++++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  6 ++++--
 3 files changed, 17 insertions(+), 8 deletions(-)
