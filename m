Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79B879999
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 18:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50FEF112F37;
	Tue, 12 Mar 2024 17:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lMYYfcbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC06D112F29
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 17:03:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dd8d586126so1235145ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710262995; x=1710867795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
 b=lMYYfcbnpT4FnLMMCWppLrkJws+t7GqUJxE/x+ru+ROZkpXz3QOM3RVUQLpnIW4YcA
 C2+igIZCdUGY7nzkGSHAPUTaYs1vW6UUIrUbGUyd8GaylO+uKXwGAcUN7E0/Q46j8127
 y2+yZ7hQbpJAPLQO5ewFQI2aPmB8TBDW3kC8nqay8eCo/O25LD7FwpMwLKf9KhLt84S8
 yNaHMli2WYBlI/c+GxA27v+txDpC1dBFy3dn3dSoJVIwm4a+Y4yw2YOmu7X5IGxIEwXh
 +w2EdLxxQoarsI7Vx+Jd3z2iah/YFyl7u9u0cbFJP5aCAO4kDl0zOKKftM1VuOJGcukO
 sNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710262995; x=1710867795;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
 b=kTLu0VPfYSFwX1GaK6e2qYCYlgb+CYSjTXFUa6fKuwQXwopUGGa8JRYBDlBjAL4VfD
 2ETYzUSUTAv5NKtctExhMdDs4Xktfjh78c5jY1tievDPk8JIDIq7Xdp7Gl16oh/Nr+Gi
 AnFGlTWUfoG3ifBAUABhRf3Tm69I6yCLAl1sVxY8MEwAlvMbJZY9UhxiV1E1zddJXfqE
 wthDvvTNaQfDn3PV7C9sdks4rkAConXi3bW+OD1jKwrUAY984+FXu0evcVj2MSJjVLu+
 /NKVHXvI3gwOegp2IgyELU2DOC9rfBsvIGxHPfVMLInbTqSB+wziiEl5KGg0ieK/PWka
 xxWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcUhJofJaduRHLkHIi3YHbGyceyw8oHpri5jNoiZanazIfku8vJgYOV6eMYwPGzwW9b3XruQP++5R2u/ejNElSrM0hrFs/80sAUFbUy1LZ
X-Gm-Message-State: AOJu0YwBPcfChifPBTx2NYORNbKpaw2jkBz7zyyYPB3jc75+Ikf/Y3yq
 3WuU04dq+5HqV3WWvTYQH9yr/5+6ZE07GK1BsEchXjt/CbkODQjb
X-Google-Smtp-Source: AGHT+IGoSNJSdzshXUinY0deqrpWSsXfjdp27VpnRBXFH0xqKuZltMGKwFFXD7x5fWGnOCLrPfDYHw==
X-Received: by 2002:a17:902:7ec9:b0:1dd:b681:990e with SMTP id
 p9-20020a1709027ec900b001ddb681990emr2092458plb.36.1710262994820; 
 Tue, 12 Mar 2024 10:03:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a170902c61400b001dd02f4c8fcsm6942533plr.139.2024.03.12.10.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 10:03:13 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/14] Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:02:55 -0700
Message-Id: <20240312170309.2546362-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
  size increases if CONFIG_KUNIT=n. There would be some benefits to
  adding those pointers all the time (reduced complexity, ability to
  display function names in BUG/WARNING messages). That change, if
  desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests
