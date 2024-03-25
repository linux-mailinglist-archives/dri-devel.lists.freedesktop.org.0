Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5F88AC6F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 18:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9B710EA11;
	Mon, 25 Mar 2024 17:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kSD6VY3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAAB10E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:52:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6ea9a605ca7so1081249b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711389175; x=1711993975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
 b=kSD6VY3bVDSLyt0pwFTfRG5HEwJaIISQUCq1b9OUTE5Oj0BysQNrDaE8L3KZ2Mw4hV
 DEVCwYSKtPV9F4k7TkGFawIT9XvQhDpp2e/lp7Js7UJHP9loSffz0Sy6HgPlPeSspMlL
 ppLBFTSvlEvqt9E3tyzTvY9hVgkePphuP/uiX0lA01qAWmL7yuP+0YghApVOmbWFb0bH
 d+A7oLmzLvDRfDM617eS66wDr9MMFWuTLYon6w4X3k8CZfg2UlfOL2l1hOEej88J380S
 KrZoQhbU098+zrhR7a22K1cN1NmTdUGQA9WbuvJO+jYFsg7VdxtQd+EMplV0r+ciibdp
 k9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711389175; x=1711993975;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
 b=kVO8OiIBi7RZss8+sUURLyitv+KtIa0EcEffj3wskrwzqNz4xzRnCk4FvlvNJXfUEt
 7uZ3owPVtxUggbkrzqT/HLsp1CjgDL35mcMIBHKJ16WBIPfvALPca+D3bhyMPbPSsqts
 MqX2HLX+TbwL6Wk5fshogXKVXipiF1D/FblFYsbP3pn+9xOgSbekf9HWgOyX2OJCgKI6
 mGAuj10JEBi+Moe7NWrP6K3pufy8ZK9EsUjg1SWjDozgV+bW+Wr5gbKZ7IxGhCfozYtv
 C3EJyLYaLuU6H4BbndxP5TZ5GGYreerifs9FFtWdonobY9P13W7VnkaONGGLYHygNO29
 ZgDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWefN5VBupBFlbufq01Lh6ePBnuBeUQ0FVrQjDDkUSQKfj82Ivlz40NU0fbYL/3XDXW/ewYRTflrshWjRE7jwt9Jo856lX0YKXAhdWnVkfM
X-Gm-Message-State: AOJu0Yw9qKAHxqKCViPMVkHtmFIQFSBqlSYUBhA0mToFb8IIeIb0iaSY
 pWLisQKLXalLvg4b2mJ+JZmPQWb3dj2Q2XS4GPV9MNM/opRVsmbG
X-Google-Smtp-Source: AGHT+IGIDWtPHdUbX+7LWIxScptU3Z3k9sozN35URR01B7XvfxcUzrh1Z1HYjZAKi2mO+Me8ITFPPw==
X-Received: by 2002:a05:6a20:6a0e:b0:1a3:c4ba:a453 with SMTP id
 p14-20020a056a206a0e00b001a3c4baa453mr6509702pzk.7.1711389175417; 
 Mon, 25 Mar 2024 10:52:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 dr18-20020a056a020fd200b005cd835182c5sm5239787pgb.79.2024.03.25.10.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:52:53 -0700 (PDT)
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
 netdev@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 00/14] Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:34 -0700
Message-Id: <20240325175248.1499046-1-linux@roeck-us.net>
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

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.
