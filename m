Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB4AA699C
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE17610E8A8;
	Fri,  2 May 2025 04:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtqcgzMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA96310E149
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 04:05:34 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-af59c920d32so1113778a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746158734; x=1746763534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dSub1wuh8nlEkm+pKUMg5wgv6Gx8ymFTnPqus5nWjls=;
 b=gtqcgzMYoEAYCs77DCsvPd3w2yNLI9yfK8DO6KSW9OdUClcU+m/WV5e9ksVSZLq4ta
 K63d04rvew0xRVz8RdDbcV1T3LYLjHlnNg8LesuCM+fepMuFu/H+9YUNVCqdG1k9qVpJ
 zJDAmjBmNPS5G3FrQYTqOUsP1mK1t58RMivQM09O4n8Z/NP0tOWOiTUJaFVE3/5ekqp2
 YAWng62D2FAUIgbba/5ZrRL6HVVnLkGIMSqKwtWteSUDya1WxfWNELwcf9g6eYx9j3d8
 lvJlNn+v6nTw3asoWVA86rC6J0rvO17EpZBcsAfpa00ZGbWit5zYaKIVra3KoshYkqcm
 FNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746158734; x=1746763534;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSub1wuh8nlEkm+pKUMg5wgv6Gx8ymFTnPqus5nWjls=;
 b=uvEpk383WUznE8dvy7q5Hmiauk+d+S1ozShEzK2sDJNWJKun/lyK0eaJyU9m2JN7m+
 jPrEhrulGCmvsgdH3TDBCepV2jrJkQMab2yf6RO+ZRv5BeCav5FDStENRY4srKgGkQRq
 Yh7j4KodFqL4xrAXOdnAk48lPf0B4jz3yyhKWIYvx3+7NxgzjYTYpHtd9Nt8X5jZUNPj
 wL2QO0jEyxDXE9PuPsEsOIalzLFZjoWUjrwbWmwQubzitOJxYIUEqa2faX0qFwJyTlRC
 oaFuHc6TDpjtNastC+kEf94/kna3dUP2UmTOlFWcuDrQBpAOh25kyKwe+DZ9qC74bBDR
 qsXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGgyyyNvwzPV6qFHa3b3TBW6YNHLZS0QzTZw6PfOKjhoIAYQ+yJNfM2xrh+cQPRQk1IGbOKHyz3xo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoGlkrClPz2eqaNdVD+80h/UMUEDd0hAFGav24x6ddu2KozYB9
 St1AVrlkK7kvOLgW/gz37jayKSuj8HtcSIYKVBinzePikhlS1eyM
X-Gm-Gg: ASbGncsFmeY+YqDcGI8ix3UYOjlx2btxbAT1T7hlpE9HGvjGkZaYZkFIn0RPfsL7R6C
 bWk73oWdqc0WRgaqhIM1MfRx5vUC42VXihyJpJFR8Z0foJZd6E5EM7iHhp6zppKUMPB8/0uyI0H
 xm8H/2brO42YAHknVO4kUqNUDU8INcJNwxUBM6lRqwa1xNlHlREfPkTgQeIyWFmoxOvcq2UHg0o
 joevAZWmO6gqiP7bblmZ2Ualmna0RL05ITfgHzrwyOYmTTzy7cUp28AMRfmj6NjuYFgdPh79jk6
 TVTkZ+GnfmGSnePHfhka0+31FTp9plkjbIQUerp+dEShMQgVPzv4oLbz54CS2uTAJUs0vTOd2Dt
 YmlnfFdf5P0NRZK4HVDQG/6+y21IB7w==
X-Google-Smtp-Source: AGHT+IHgEx/So5EIbHlSMpzfphWaNj6WsLQNTdHJsmuELyjZ0DzDKhxqJDDpr/U0LH8lOLMGSv6Ucw==
X-Received: by 2002:a17:902:ef0b:b0:223:6657:5003 with SMTP id
 d9443c01a7336-22e103899d1mr22760535ad.32.1746158734054; 
 Thu, 01 May 2025 21:05:34 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fb836sm4510635ad.141.2025.05.01.21.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 21:05:33 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v2 0/3] fbdev: Add deferred I/O support for contiguous kernel
 memory framebuffers
Date: Thu,  1 May 2025 21:05:22 -0700
Message-Id: <20250502040525.822075-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Current deferred I/O code works only for framebuffer memory that is
allocated with vmalloc(). The code assumes that the underlying page
refcount can be used by the mm subsystem to manage each framebuffer
page's lifecycle, which is consistent with vmalloc'ed memory, but not
with contiguous kernel memory from alloc_pages() or similar. When used
with contiguous kernel memory, current deferred I/O code eventually
causes the memory free lists to be scrambled, and a kernel panic ensues.
The problem is seen with the hyperv_fb driver when mmap'ing the
framebuffer into user space, as that driver uses alloc_pages() for the
framebuffer in some configurations. This patch set fixes the problem
by supporting contiguous kernel memory framebuffers with deferred I/O.

Patch 1 exports a 'mm' subsystem function needed by Patch 2.

Patch 2 is the changes to the fbdev deferred I/O code. More details
are in the commit message of Patch 2.

Patch 3 updates the hyperv_fb driver to use the new functionality
from Patch 2.

Michael Kelley (3):
  mm: Export vmf_insert_mixed_mkwrite()
  fbdev/deferred-io: Support contiguous kernel memory framebuffers
  fbdev: hyperv_fb: Fix mmap of framebuffers allocated using
    alloc_pages()

 drivers/video/fbdev/core/fb_defio.c | 128 +++++++++++++++++++++++-----
 drivers/video/fbdev/hyperv_fb.c     |   1 +
 include/linux/fb.h                  |   1 +
 mm/memory.c                         |   1 +
 4 files changed, 111 insertions(+), 20 deletions(-)

-- 
2.25.1

