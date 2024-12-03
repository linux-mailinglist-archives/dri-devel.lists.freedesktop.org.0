Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCC79E2927
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3163610EAD1;
	Tue,  3 Dec 2024 17:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OZ4+e2Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E3D10EAD1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 17:26:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4349ea54db7so56515e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733246807; x=1733851607;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=esMBl0uOLbGzsFzbKrL9tw7lBRfURdjOWkpYSobO80c=;
 b=OZ4+e2SfQFvTUxRmDGzxHGjTfwojq1dtXYtYUmZGxbsM5Y02IkVcJ7da+XFDbS5z4w
 b8WuDTAyvy/N7qphNgO9r361maY0WH719trOM9kJesOP7sPSPu2S10vypTL1aJLFutUK
 6JeWNNgvaYJZyB/l70551e+JiBAKBJfvniwODmc24DjVi85dnovc7eOYGovBHP8jWnAD
 PeMtfnY4KgrZ5MHMFimWVR9Ip1eahtco8eKwLy3ZPc2W5msFDc3ktoqzSH1Djmifyfyo
 6T1aEqUyQioAR1T7460nqVdRn4imsWOJASdPbyy8c2kmUwKBDhG6G+8ehByh1+6yIkjo
 khqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733246807; x=1733851607;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=esMBl0uOLbGzsFzbKrL9tw7lBRfURdjOWkpYSobO80c=;
 b=E8WGTPXIlyvxcT68xVJz8UoJCoDnyV7VMlsxuzMxGEwnJNYzfu1zw6D5FR5ygdAJj3
 Kkd3MK5ErMvnTgWAlZxyVTEMWb7vPPKTYgynmHzjupouPBTjpSVGUChELDo6GjOqwdfQ
 yiqAPA5OXxUX1Z94VPsmX01IjIPBdS2vSCEWhLE8zHVxAgzjyZqnxh+ZuKZFvYuD0EQu
 PDqaGuq2cE291pJrWAqSK4VL/7JdA0bI4duuNaTMoQRvJvfj99+3m6NVZbedUyJ5Xkum
 RMRgpkA17dJeLqcDG4Q/zRWnbLW9MO7D27B78CxCY6vZi/C0xzfElnbYN8LeYCYR88o+
 FhAg==
X-Gm-Message-State: AOJu0YwMiy5RLVasGzPLT+fgp33q1uOT4DVSV9Rn6gqn771QvIfBXDxF
 3b1H+InXjcejtM7W70TLCWe3ts+HlEMEd8y2q9tMWnnijVejYou009E9UXhYDQ==
X-Gm-Gg: ASbGncvvF3JhbyR0mUHOTJAEcPDmsamHEePioqj7rW79fiEYc5vaZhwgLLltV2aE48q
 EtdVT+U3bngrg+JLlaU/NpoPFWIAMHyF2KvuuUYNbM9HX5x9tVMcYmqCQCp+ORnFo/lzezzhdAq
 BQ4UWJzoZJgfohe6T/oD0MTWMfhuoWlrELwsrLt2F+fw9HGCc/LVfjtWzgmBqkL1eimrdjq8CzA
 7Z9tzvzDvlkvuKswVsz72Vi2LVa2rAkl/1mLjw=
X-Google-Smtp-Source: AGHT+IHu3tfTAoXvieXaIRaJiRZryx8cWpn3+5PzdcsLUtGUjPoPKMn6gY/KMYeGtkKYB5HV7URZ6Q==
X-Received: by 2002:a05:600c:2144:b0:434:9d0b:bd7c with SMTP id
 5b1f17b1804b1-434d12b8df7mr1213685e9.3.1733246806576; 
 Tue, 03 Dec 2024 09:26:46 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:92ba:3294:39ee:2d61])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385f8448d32sm4515574f8f.96.2024.12.03.09.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 09:26:45 -0800 (PST)
From: Jann Horn <jannh@google.com>
Subject: [PATCH 0/3] fixes for udmabuf (memfd sealing checks and a leak)
Date: Tue, 03 Dec 2024 18:25:34 +0100
Message-Id: <20241203-udmabuf-fixes-v1-0-f99281c345aa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4/T2cC/x3LTQqAIBBA4avIrBP8y0VXiRaaY80iC8UIpLsnL
 T8er0HBTFhgYg0y3lToTB1yYLDuLm3IKXSDEspIJTSv4XC+Rh7pwcKDMHpE77y1GvpzZfxDX+b
 lfT+rWACQXwAAAA==
X-Change-ID: 20241203-udmabuf-fixes-d0435ebab663
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 John Stultz <john.stultz@linaro.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733246801; l=2909;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=MCDy6HkUfDKHYjRUBvEabLuhWMTUUHI+2O5UXR9PdkA=;
 b=7R1+MVXGDrX8ZjzD+lYpU8vJrqqQZsU/jjVE8x5Xvlp659inhHh4Hs6EU5+zsTLaWSIvHEjrU
 U58t58Lkh24B4O1A8seSqKkOWQKwCT4vgQTfc8JN9wGpHh4WP31+uUE
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
Jann Horn (3):
      udmabuf: fix racy memfd sealing check
      udmabuf: also check for F_SEAL_FUTURE_WRITE
      udmabuf: fix memory leak on last export_udmabuf() error path

 drivers/dma-buf/udmabuf.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)
---
base-commit: b86545e02e8c22fb89218f29d381fa8e8b91d815
change-id: 20241203-udmabuf-fixes-d0435ebab663

-- 
Jann Horn <jannh@google.com>

