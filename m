Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC279E3F94
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B9310E4E9;
	Wed,  4 Dec 2024 16:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FqDiAWq2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6859A10E4E9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:27:01 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4349ea54db7so61685e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733329620; x=1733934420;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KyQtsXmeUdkqec1pltW/92iEDMhCyyh/Xugcf79kOqw=;
 b=FqDiAWq2b2IEcnvRqehPXfubQ2YMzDALUdnyyh/s3qXw4kRmKfY5O+wvZgbHvHiEBh
 PNQgWL7IydYtf8XaDmz6T+5NL08uBrQLHCtyxjUwp9LeGrAJYVIzaS+I6A8swTtJ+jFH
 SeanC0Tg7D8bkdAhzCVivYUPPZmqaFXOWH6OeNwapEGCLBINXFISshoAqorR5EXfTMrt
 TY93+vx7jj450lFgzGDaGFeVdP85sRvu87XX8NKt5tIt5auq84Xis3tfGzV4brqVChIE
 oj9TaSeN/4DDPrJtTt/rjLyp9zEjj24zYPwe7bBaVrTvvIKdhfn9ENXjFe00R/SvJxXu
 fVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733329620; x=1733934420;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KyQtsXmeUdkqec1pltW/92iEDMhCyyh/Xugcf79kOqw=;
 b=Artervz/LVmcuONWXqDUX6vtqa/Qi8htwrUqs4Kh4Ig2n+2YFCPSOJiNowS3sqxrNT
 i/bLL4Em3M9f77k0tOQgLIC8ZHdaHzlMzDyK3sjsTOlVxfFbR2bpk/fajQMH/lAsMBUd
 kFoqAD+1gJdwQr7jmt8ZVPmfi/AMIZjdNJuY4jI44tl6d+bWnWUjZM9Fiwg0om2m5ROS
 XAk2JviiIEfnjzgo6fLjvjAMxLzQRNywW2FaMcXXb/lpl3hSOTWVao4KxHybOJK+onl8
 r0BoEfdFErZzGySOcb1vf9V4uoXjK4NXWFVHA7cA1GihzMN06qwi+sPD1RBIwuWAY0WG
 jb3g==
X-Gm-Message-State: AOJu0YwcHxTk9DGqeP8N8yUFj737XdGVGVhNmbkg06XbxIHxGvEN/9Lt
 DYO0+VKm49HS59Qv5N0rzZML+7WE5iN8MxTKhiF5l0RjaMcLnVOsTDoXF+TWxA==
X-Gm-Gg: ASbGncsV1hHWFjCBz+raBZ2bTMULuWOAWWMMGN/29jQxm4NsqW7chf0jsOgmbIS21XG
 MbQko9DaMELu+gROqktzod12RAm15UqL6LG2GorB8Zyq8rKLtOjiCYnF+W9Bfozsn3n75YX/tYe
 hDLU4Eq5y3Q7MYju2ydlpepczyKlSCeyfH77v36VYUlMnl7o8A9QVtGNFPwE1SclEjMrfk382X/
 HacysPAGxT/D3TY6TRh4t0OtyH/kaVbfTRB4A==
X-Google-Smtp-Source: AGHT+IFpzQfGXpeDPtULiRhPLDybLBEA4OSAEcAX75ckbymNW1nJjJIq12WV3lMHghFcvSelG5JPlw==
X-Received: by 2002:a05:600c:55c5:b0:42b:8ff7:bee2 with SMTP id
 5b1f17b1804b1-434d52b563dmr1239595e9.5.1733329619368; 
 Wed, 04 Dec 2024 08:26:59 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e17574ebsm14388276f8f.30.2024.12.04.08.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:26:58 -0800 (PST)
From: Jann Horn <jannh@google.com>
Subject: [PATCH v2 0/3] fixes for udmabuf (memfd sealing checks and a leak)
Date: Wed, 04 Dec 2024 17:26:18 +0100
Message-Id: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqCUGcC/3WMyw7CIBQFf6W5azG82lhX/ofpgseFkthiwBJNw
 7+L3bucczKzQ8YUMMO12yFhCTnEtQE/dWBmtXokwTYGTrlknAqy2UXpzREX3piJpVL0qJUeBgH
 NeSY8jqbcp8ZzyK+YPke+sN/6r1QYocSNI78wI2Sv1M3H6B94NnGBqdb6BTX3zp2rAAAA
X-Change-ID: 20241203-udmabuf-fixes-d0435ebab663
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=3258;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=x70cZ6Pnodptk8s8H2UvJEPrrE/aNUkvtZGjOJaEWtk=;
 b=wvi+WMu5XyGongyF0xG2h2EfpSwyL8Ch96wwqWKQwp3k2ZEGtB86dYewh42kVY0ZyLnBTMeKu
 1GCnV9vQLOPBwlbq+veVUlxDTxbwGjCn5HlM6jDoIcqd5fad7aYhFUZ
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

I have tested that patches 2 and 3 work using the following reproducers.
I did not write a reproducer for the issue described in patch 1.

Reproducer for F_SEAL_FUTURE_WRITE not being respected:
```
#define _GNU_SOURCE
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <linux/udmabuf.h>

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int memfd = SYSCHK(memfd_create("test", MFD_ALLOW_SEALING));
  SYSCHK(ftruncate(memfd, 0x1000));
  SYSCHK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK|F_SEAL_FUTURE_WRITE));
  int udmabuf_fd = SYSCHK(open("/dev/udmabuf", O_RDWR));
  struct udmabuf_create create_arg = {
    .memfd = memfd,
    .flags = 0,
    .offset = 0,
    .size = 0x1000
  };
  int buf_fd = SYSCHK(ioctl(udmabuf_fd, UDMABUF_CREATE, &create_arg));
  printf("created udmabuf buffer fd %d\n", buf_fd);
  char *map = SYSCHK(mmap(NULL, 0x1000, PROT_READ|PROT_WRITE, MAP_SHARED, buf_fd, 0));
  *map = 'a';
}
```

Reproducer for the memory leak (if you run this for a while, your memory
usage will steadily go up, and /sys/kernel/debug/dma_buf/bufinfo will
contain a ton of entries):
```
#define _GNU_SOURCE
#include <err.h>
#include <errno.h>
#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <linux/udmabuf.h>

#define SYSCHK(x) ({          \
  typeof(x) __res = (x);      \
  if (__res == (typeof(x))-1) \
    err(1, "SYSCHK(" #x ")"); \
  __res;                      \
})

int main(void) {
  int memfd = SYSCHK(memfd_create("test", MFD_ALLOW_SEALING));
  SYSCHK(ftruncate(memfd, 0x1000));
  SYSCHK(fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK));
  int udmabuf_fd = SYSCHK(open("/dev/udmabuf", O_RDWR));

  // prevent creating new FDs
  struct rlimit rlim = { .rlim_cur = 1, .rlim_max = 1 };
  SYSCHK(setrlimit(RLIMIT_NOFILE, &rlim));

  while (1) {
    struct udmabuf_create create_arg = {
      .memfd = memfd,
      .flags = 0,
      .offset = 0,
      .size = 0x1000
    };
    int buf_fd = ioctl(udmabuf_fd, UDMABUF_CREATE, &create_arg);
    assert(buf_fd == -1);
    assert(errno == EMFILE);
  }
}
```

Signed-off-by: Jann Horn <jannh@google.com>
---
Changes in v2:
- patch 1/3: use file_inode instead of ->f_inode (Vivek)
- patch 1/3: add comment explaining the inode_lock_shared()
- patch 3/3: remove unused parameter (Vivek)
- patch 3/3: add comment on cleanup (Vivek)
- collect Acks
- Link to v1: https://lore.kernel.org/r/20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com

---
Jann Horn (3):
      udmabuf: fix racy memfd sealing check
      udmabuf: also check for F_SEAL_FUTURE_WRITE
      udmabuf: fix memory leak on last export_udmabuf() error path

 drivers/dma-buf/udmabuf.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)
---
base-commit: b86545e02e8c22fb89218f29d381fa8e8b91d815
change-id: 20241203-udmabuf-fixes-d0435ebab663

-- 
Jann Horn <jannh@google.com>

