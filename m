Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17A0A97551
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 21:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D3710E333;
	Tue, 22 Apr 2025 19:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ARopWZpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E845D10E333
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 19:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745349587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
 b=ARopWZprK41uGh9fj9fu902/MEZnEWejCf7wNpNQotNhPHWeF8JHv2tse81R3c7jJQ5VoG
 tMpeolVegVqu4BemDS2Qor0zemvzTcYJ/r375Iu43IKSg7BSQJALrOT1vHevQ9KD/I9ZFE
 /9fpxdQnvEKxSC0J684E2jl786yA5lA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-yKYFKQsNMEWu_UoxmYIovg-1; Tue, 22 Apr 2025 15:19:45 -0400
X-MC-Unique: yKYFKQsNMEWu_UoxmYIovg-1
X-Mimecast-MFC-AGG-ID: yKYFKQsNMEWu_UoxmYIovg_1745349585
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-478f78ff9beso169519151cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349585; x=1745954385;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y+KK05zMW7c3LQIz7d14BdD80ooDf/JC+jFj6UdPYvQ=;
 b=WJEOx6jP37OKfvRKmKJbMKvmA80Tswa60SKm3PE1YsQ2ULY3TL3hP+kAXuXc7JNVRM
 orP8bgmmmzCc0PD2MtJlUL5SYm2v+klesEq0XaseL2sTianxjqiG9SDymUDSm/DuG/2C
 2jdDJN6HfqHnUoSpqGcOZjTVLY5yBStR3WQAahEgfBPyELbB5pnzWzyNyZqHTJABmoGC
 UtdUTJn0XXa7ZUHzFxzNcaVTZcTqCGmqOZPEMzJDHRSoXMujwJL+xdGDuHeXKFDwpz2+
 O6Ne1loSpb5rsFPGIQSOwW7WXKXJBgQ/I76MLEqUONTGdM8NVogVtgKwtl9cO/zHFPa8
 wGrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxCcuMSqDCe6/lm6vXjA1pgNTasletuKIjJaUpFby36Y6x/NyPo9wLq/IFnOctqTaGP3m3Tn85wxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypzytpWsK4gVdL9bkBI0D8pgANE3CsFw8JtA2wMIfZPibkkDi2
 GuLgk2tB4Drq8SpKMGfCqDrUcFIzHyL3Ugsth5BDJSp6mcCGg6c6BIYAP0Ox3IxspusI4Dy3Wtv
 udWaFBFpJXEJvGEN1SOMbjU87ErIT2u1dTAuE/zMZ1eIUSLrhxHxbP5cfP5+n5So5cw==
X-Gm-Gg: ASbGnctTwP5Yeg7tp3JhREFf6dL9stOMsRxkHlCEXkk+3QqqKEAkACJuq5HAQDpufQ/
 ozHhqaD+UyFZTqREj0MpEzb8SL7sa0A3WDJEQ9ovlJXjy54Hvxkvmwlzwu+7mZhZGc5A5rAxRxl
 vWlWW/VFcWYm8cWUBGLZzCAfhqAPycENQ1A1eJIkY9gdtgr1uh5WHnalBqoBf38aD/vias1tle8
 3UbtlEIUlbzX7vRVvnLOTri8/EvYOryIuV2L6iBs0R/LYzyHuKjVh87JWkTNuwJVLPlZmtbPgr8
 etQIELAmhnuovIOeRwHckN4DuTyqIzKw73FKqV3TO1g=
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id
 d75a77b69052e-47aec49fe50mr306107501cf.33.1745349585339; 
 Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpIAsSnkkHHksne2RzJemve8iXpTk1ZF86CXiy9hxjUVtuSkEj08Rwo52JAcVf57qaA/nAwg==
X-Received: by 2002:a05:622a:10a:b0:476:60a1:3115 with SMTP id
 d75a77b69052e-47aec49fe50mr306107231cf.33.1745349585034; 
 Tue, 22 Apr 2025 12:19:45 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb
 ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 12:19:44 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, jstultz@google.com, tjmercier@google.com,
 christian.koenig@amd.com
Cc: mripard@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v2 0/2] dma-buf: heaps: Use constant name for CMA heap
Date: Tue, 22 Apr 2025 12:19:37 -0700
Message-ID: <20250422191939.555963-1-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GGWeBrNz-OS6YsyjtVKh0LDzGVGTsPGMlBhmprkvTbs_1745349585
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Hi all,

This patch series is based on a previous discussion around CMA heap
naming. [1] The heap's name depends on the device name, which is
generally "reserved", "linux,cma", or "default-pool", but could be any
arbitrary name given to the default CMA area in the devicetree. For a
consistent userspace interface, the series introduces a constant name
for the CMA heap, and for backwards compatibility, an additional Kconfig
that controls the creation of a legacy-named heap with the same CMA
backing.

The ideas to handle backwards compatibility in [1] are to either use a
symlink or add a heap node with a duplicate minor. However, I assume
that we don't want to create symlinks in /dev from module initcalls, and
attempting to duplicate minors would cause device_create() to fail.
Because of these drawbacks, after brainstorming with Maxime Ripard, I
went with creating a new node in devtmpfs with its own minor. This
admittedly makes it a little unclear that the old and new nodes are
backed by the same heap when both are present. The only approach that I
think would provide total clarity on this in userspace is symlinking,
which seemed like a fairly involved solution for devtmpfs, but if I'm
wrong on this, please let me know.

Changelog:
    v2: Use tabs instead of spaces for large vertical alignment.

Jared Kangas (2):
  dma-buf: heaps: Parameterize heap name in __add_cma_heap()
  dma-buf: heaps: Give default CMA heap a fixed name

 Documentation/userspace-api/dma-buf-heaps.rst | 11 ++++---
 drivers/dma-buf/heaps/Kconfig                 | 10 +++++++
 drivers/dma-buf/heaps/cma_heap.c              | 30 ++++++++++++++-----
 3 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.49.0

