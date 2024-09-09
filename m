Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F5971064
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EAEB10E303;
	Mon,  9 Sep 2024 07:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gbewngcu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ECC10E303;
 Mon,  9 Sep 2024 07:56:48 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb0f28bfbso14486555e9.1; 
 Mon, 09 Sep 2024 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868607; x=1726473407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R4NS6jV5fKGk/mwoZluVrj+7uJlJEVUPyFdbxV7oRHQ=;
 b=GbewngcuiMDEmYfeEWOq4hXxj3ufyAI3zMP51y/cH2Vn8darTrSnvxJCYYouuXqz3p
 Tu9ReshjUBrKxyHyX4jwPdzU9IZtR/5gI2q9ZPtI54Da6n+Qn/TtH4Kf588kDfDBK0u/
 K2dkwSj+QWdLAIDuAR+N/0eBAvXaTjAXHyTHPKAkYUC8TTofPDwhSFO/KImSSTT0Y3QH
 MN69hOaXMHRJtKsEzRz8ggV3JbM/hv+WYyap6vlyw83n8xolteIg+9r/9ziqsLT/QGXC
 KTaFQtIS4C7fAlRfWwMrLaMoNiCa8LuTJ0dbANFrFDndYuyTz1WMYjpwEByIm3S3CP+F
 1zWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868607; x=1726473407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R4NS6jV5fKGk/mwoZluVrj+7uJlJEVUPyFdbxV7oRHQ=;
 b=W+LxHwtJZpuS96lYu0DuzKw7JSJQwzW1+Z/lGVxbZnM081gPDR8Y09YVHYnB9jeO7A
 Uvpx/qk5pfy6wXD+EPVjLpirKWgclKPznyZAC8TwCSFGhFZhYJvi/gttcOdRoQLrXQvY
 egp15lSAFVLtKzh3mFNojKll7wzYJ9RabVpGIU35oAOckz8VuDGr+Zm290KGzcZhOFiK
 eGcplPlQk0TvFYu5lbXeY1Hcp9vGjIhZQSPIiSnZu4i7nPvPAldtXpnSFX2VRaS1BUBU
 Zzq14ARsxt/+cOpRxVnECJYI01vRx3UARSNMD7oBWIDRPN3+bGE9nnXSx5pXanGjZ7gu
 NKFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKGcQ67DOMA7c9I3a8mTfo7345kEHjh4sHOw/4Stlnxceju+jBvSUi/PDNHbn20aUVd2vcxUvJ2k=@lists.freedesktop.org,
 AJvYcCXD6mzSb59kyPmBPyDd7IgceJ1ZxfPjcIHle5Cvvq3UE19AWwBrc7PRb92ednJ5S27ZK0xC3LesGE9x@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4mxQtE2iZ3SgaqRQloABAJ3+Rnrx2+QOqZOgul8zdZMA0pxiH
 ViOePnuch606qgAj/dahQ+AdrqbfcLvd2+odfSXTgwTg0bTH+/11
X-Google-Smtp-Source: AGHT+IEA5yak33SFTx+YZRupolj5vmzjBVIUunnRVoxkecwVhW5D0ABKP0ZK9jxMzGmcV67/WpIyKA==
X-Received: by 2002:a05:600c:310a:b0:42c:8812:82a6 with SMTP id
 5b1f17b1804b1-42c9f98a81cmr79250105e9.21.1725868606867; 
 Mon, 09 Sep 2024 00:56:46 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:46 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH RESEND v2 00/19] random: Resolve circular include dependency
 and include <linux/percpu.h> 
Date: Mon,  9 Sep 2024 09:53:43 +0200
Message-ID: <20240909075641.258968-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Resent due to missing linux-kernel@ mailing list inclusion.

There were several attempts to resolve circular include dependency
after the addition of percpu.h: 1c9df907da83 ("random: fix circular
include dependency on arm64 after addition of percpu.h"), c0842fbc1b18
("random32: move the pseudo-random 32-bit definitions to prandom.h") and
finally d9f29deb7fe8 ("prandom: Remove unused include") that completely
removes the inclusion of <linux/percpu.h>.

Due to legacy reasons, <linux/random.h> includes <linux/prandom.h>, but
with the commit entry remark:

--quote--
A further cleanup step would be to remove this from <linux/random.h>
entirely, and make people who use the prandom infrastructure include
just the new header file.  That's a bit of a churn patch, but grepping
for "prandom_" and "next_pseudo_random32" "struct rnd_state" should
catch most users.

But it turns out that that nice cleanup step is fairly painful, because
a _lot_ of code currently seems to depend on the implicit include of
<linux/random.h>, which can currently come in a lot of ways, including
such fairly core headfers as <linux/net.h>.

So the "nice cleanup" part may or may never happen.
--/quote--

We would like to include <linux/percpu.h> in <linux/prandom.h>.
In [1] we would like to repurpose __percpu tag as a named address space
qualifier, where __percpu macro uses defines from <linux/percpu.h>.

The major roadblock to inclusion of <linux/percpu.h> is the above
mentioned legacy inclusion of <linux/prandom.h> in <linux/random.h> that
causes circular include dependency that prevents <linux/percpu.h>
inclusion.

This patch series is the "nice cleanup" part that:

a) Substitutes the inclusion of <linux/random.h> with the
inclusion of <linux/prandom.h> where needed (patches 1 - 17).

b) Removes legacy inclusion of <linux/prandom.h> from
<linux/random.h> (patch 18).

c) Includes <linux/percpu.h> in <linux/prandom.h> (patch 19).

The whole series was tested by compiling the kernel for x86_64 allconfig
and some popular architectures, namely arm64 defconfig, powerpc defconfig
and loongarch defconfig.

[1] https://lore.kernel.org/lkml/20240812115945.484051-4-ubizjak@gmail.com/

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>
Cc: Eduard Zingerman <eddyz87@gmail.com>
Cc: Song Liu <song@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>
Cc: KP Singh <kpsingh@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>
Cc: Hao Luo <haoluo@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stephen Hemminger <stephen@networkplumber.org>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
v2: - Reword commit messages to mention the removal of legacy inclusion
    of <linux/prandom.h> from <linux/random.h>
    - Add missing substitution in crypto/testmgr.c
    (reported by kernel test robot)
    - Add Acked-by:.

Uros Bizjak (19):
  x86/kaslr: Include <linux/prandom.h> instead of <linux/random.h>
  crypto: testmgr: Include <linux/prandom.h> instead of <linux/random.h>
  drm/i915/selftests: Include <linux/prandom.h> instead of
    <linux/random.h>
  drm/lib: Include <linux/prandom.h> instead of <linux/random.h>
  media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
  mtd: tests: Include <linux/prandom.h> instead of <linux/random.h>
  fscrypt: Include <linux/once.h> in fs/crypto/keyring.c
  scsi: libfcoe: Include <linux/prandom.h> instead of <linux/random.h>
  bpf: Include <linux/prandom.h> instead of <linux/random.h>
  lib/interval_tree_test.c: Include <linux/prandom.h> instead of
    <linux/random.h>
  kunit: string-stream-test: Include <linux/prandom.h> instead of
    <linux/random.h>
  random32: Include <linux/prandom.h> instead of <linux/random.h>
  lib/rbtree-test: Include <linux/prandom.h> instead of <linux/random.h>
  bpf/tests: Include <linux/prandom.h> instead of <linux/random.h>
  lib/test_parman: Include <linux/prandom.h> instead of <linux/random.h>
  lib/test_scanf: Include <linux/prandom.h> instead of <linux/random.h>
  netem: Include <linux/prandom.h> in sch_netem.c
  random: Do not include <linux/prandom.h> in <linux/random.h>
  prandom: Include <linux/percpu.h> in <linux/prandom.h>

 arch/x86/mm/kaslr.c                              | 2 +-
 crypto/testmgr.c                                 | 2 +-
 drivers/gpu/drm/i915/selftests/i915_gem.c        | 2 +-
 drivers/gpu/drm/i915/selftests/i915_random.h     | 2 +-
 drivers/gpu/drm/i915/selftests/scatterlist.c     | 2 +-
 drivers/gpu/drm/lib/drm_random.h                 | 2 +-
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 drivers/mtd/tests/oobtest.c                      | 2 +-
 drivers/mtd/tests/pagetest.c                     | 2 +-
 drivers/mtd/tests/subpagetest.c                  | 2 +-
 fs/crypto/keyring.c                              | 1 +
 include/linux/prandom.h                          | 1 +
 include/linux/random.h                           | 7 -------
 include/scsi/libfcoe.h                           | 2 +-
 kernel/bpf/core.c                                | 2 +-
 lib/interval_tree_test.c                         | 2 +-
 lib/kunit/string-stream-test.c                   | 1 +
 lib/random32.c                                   | 2 +-
 lib/rbtree_test.c                                | 2 +-
 lib/test_bpf.c                                   | 2 +-
 lib/test_parman.c                                | 2 +-
 lib/test_scanf.c                                 | 2 +-
 net/sched/sch_netem.c                            | 1 +
 23 files changed, 22 insertions(+), 24 deletions(-)

-- 
2.46.0

