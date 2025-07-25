Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D2B12591
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9E10EA14;
	Fri, 25 Jul 2025 20:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CkM6CRjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DE510EA14
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:32:34 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae36e88a5daso481021166b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 13:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753475552; x=1754080352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/YWWBYyy945FBnwlnZpKd09E9G+7x9+DymnwvKki5Jw=;
 b=CkM6CRjCtcF9DrkUTzCxISEzCItVWJ8ghK91nNtwSLa3txvcNlWKOcGSD/bq1VcPjv
 rOqWe0nJt2ondOJK9S8Fj2Bl1qlCIlDKeIOguDVz6dpjya/DCs8E52ExNYdpO1y3y8+8
 Ahn16nsLyS/l6XyVKLIO8K9qJCOboFOQfrv3ygMlMA5XVVg8S93QKs9KqO9id4Ge/u9+
 tlSjTPm8XRK91Wgeqdcf/LGx/+Cz3X9GUY3l205eaP/4BKivM1BqPwfaFIlTtAQExPVJ
 EN9CwCZaRoilE9DUE/oZo2z3VN2GyF6eFyHC9sKMIlqkkH08xorSlTFPYtCowoyHwr1u
 Qilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753475552; x=1754080352;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YWWBYyy945FBnwlnZpKd09E9G+7x9+DymnwvKki5Jw=;
 b=Urqb37xWntFzXytKUdta5Hz7Xsq8k+eoWgT8OXc3N9jvOF01Gi5Nx81mnkwoMXUr8u
 sHf8ULDoMaxXzGtrR26gJR6QtG454NrNn5Gr43KqnLkpxAEbe3wb3nkEzv06yID33NNp
 eCNJaU8l9dMkgy7wRn5cMu7Z1BzzZTvP3uZ2zuX0gLa+OzPi+OsxzG6GMo34HooF2NRD
 gtrqjyuyi78zNEztte/bm0c/HvwL/twhET1mJDMq0i8TGWsKiIQokpzTIS56f6GnDPjj
 MLcNwD0aCv5Pw+yqQRUT73wpkBINKf+SjiyaKsC8nMjV/jXBKoz2kGLYgzYdq/rnbxbE
 x3GA==
X-Gm-Message-State: AOJu0Yz7WsO9YyEY/pz1i/34v74mrvyMG24kvCF1mBsTV3q0gLKQJHZz
 jCvD74cVjy+Mf10KZJl6ljtY5zaYdr8GSC+uSfCtKBDtJTYRZ+X/DUX6MybN9py7iABPttcuxeP
 B64dzTRGinecX3wUs/D23Q5fmhUAMMuU=
X-Gm-Gg: ASbGncu/rCXQGJoivH9lqCk7pXkh+eaFVMYakVQ0Re6plb/WV3HyzlH+2IRfSXkR5qz
 V0wBvmfckhmzEzlLX8TNzaKvhUkSkwCkXTqM7nWGghe6BvVwtCdTY4cR3fEgGjawzLPKWBISm6j
 MgtHvk456tWgLZQLKuBjLC4se2uk5lnCz/fG2pSLYxa+jB309E4jr8B0ubd1hwp6s2Ktn1s5dmm
 hKw3Q==
X-Google-Smtp-Source: AGHT+IFDrY1Ilguba3HkIWrrqLS4FdVeacXWI2ssXgaEGE9CqhwabZHerKcNB9u0Wv3SRG36XYQtq+zqAjxcSBLfzK4=
X-Received: by 2002:a17:907:7209:b0:ae0:ac28:ec21 with SMTP id
 a640c23a62f3a-af61730b8dfmr335524766b.13.1753475551807; Fri, 25 Jul 2025
 13:32:31 -0700 (PDT)
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 26 Jul 2025 06:32:20 +1000
X-Gm-Features: Ac12FXwa5Y-y2EoTKy2xDj2te92g2Mku2sA49fGNEuzXKrTt0wxVd91vzS2PPCQ
Message-ID: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
Subject: [git pull] drm fixes (part two) for 6.16-rc8/final
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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

Hi Linus,

Okay this time hopefully in plain text from the start, just the follow
up fixes for i915 and xe, all pretty minor.

Thanks,
Dave.

drm-fixes-2025-07-26:
drm fixes (part 2) for 6.16-rc8/final

i915:
- Fix DP 2.7 Gbps DP_LINK_BW value on g4x
- Fix return value on intel_atomic_commit_fence_wait

xe:
- Fix build without debugfs
The following changes since commit 337666c522b9eca36deabf4133f7b2279155b69f=
:

  Merge tag 'drm-misc-fixes-2025-07-23' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-fixes
(2025-07-24 06:49:38 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-26

for you to fetch changes up to 14e8f8e74dc137ff9f1dfb2781784ceb19497ee5:

  Merge tag 'drm-xe-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes
(2025-07-25 11:03:08 +1000)

----------------------------------------------------------------
drm fixes (part 2) for 6.16-rc8/final

i915:
- Fix DP 2.7 Gbps DP_LINK_BW value on g4x
- Fix return value on intel_atomic_commit_fence_wait

xe:
- Fix build without debugfs

----------------------------------------------------------------
Aakash Deep Sarkar (1):
      drm/i915/display: Fix dma_fence_wait_timeout() return value handling

Dave Airlie (2):
      Merge tag 'drm-intel-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-fixes
      Merge tag 'drm-xe-fixes-2025-07-24' of
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes

Lucas De Marchi (1):
      drm/xe: Fix build without debugfs

Ville Syrj=C3=A4l=C3=A4 (1):
      drm/i915/dp: Fix 2.7 Gbps DP_LINK_BW value on g4x

 drivers/gpu/drm/i915/display/intel_display.c | 3 ++-
 drivers/gpu/drm/i915/display/intel_dp.c      | 6 ++++++
 drivers/gpu/drm/xe/xe_gt.h                   | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)
