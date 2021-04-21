Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4103673AD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AA66E9ED;
	Wed, 21 Apr 2021 19:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303566E9F1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a4so42518874wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/kZqRjhE3R5JUG9kHiYQ4hDaNWVduuH/NPkt3x6nfsA=;
 b=oGke5souEYgJohQtV2QSaNwO2ESSjvHKqjUSi5z7tDqnUcyIVMeEXAyluKQnGGoHoh
 Ca8dZUujb+1HYqJYAEAA2/WIcJ0zQxw/Sk8kkNGGAhHD/M+l38Hr8LIglCmr6ExfJWD/
 jCewvRKpgbWQbezDa0OAp1lcbrQf6TfP/cbVo9iQgT8Jh0G65ssudMCse57lXby2AEei
 5T7NxSjk+qeqobGeIgx7EsUmqKG4QKRq2WXzkAxgFAFDGFfY5qQx9M2Bv0ahVGPsXfo2
 SGjvYw1rincMHC+rdqcSiTLQE4ni3ig64WoKJm8G0x0ok8pB6C6zmRJcI47lusqEFSY9
 2xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/kZqRjhE3R5JUG9kHiYQ4hDaNWVduuH/NPkt3x6nfsA=;
 b=VFWKmwc0sq9/PAaeR0+bceKwg37MiemNSwXbFs3BpVXLE3nXjxO4b9VHsalEm683sA
 aIvAy8Bs0qtxNzBtbhsPObf7z9asz3SpSwwSomkW67mym7ZJQOkfaV0o2Nytw6SGZgMi
 AIYdm0x3q7bubnVIh9s3k2GXNPJ50Jxu2hHZcNF3nv4SiQtOhIP2lhnlYiqQh1hKTK9l
 lQ0YdAY72RlmBOVj0tRVP1GkpnKg6Tb83XgksVEdHspApQiDIqs9ro/2Brs1oiQRFIYe
 Wqeu6tBCU/Xx/OQoh7MH1/OhQXP1mrDcnQ7ef34pPqI+0qmFmQlklFi9kecCKzJe+pVs
 D5qg==
X-Gm-Message-State: AOAM533LKezIxCApjzfhfUXVeGD0xXcMTAy/EtSdsiqX6XW/hzM+PFKL
 cms1xXcZnmdWVfdOXTZNR1Y=
X-Google-Smtp-Source: ABdhPJz07TgN43jTbi7d0YRbfGaBSemHp+g7RW97Qynj85k3ab6X3ASUh/RWCXezI5ypRAhuSylrIw==
X-Received: by 2002:a5d:47c1:: with SMTP id o1mr27365168wrc.216.1619034421930; 
 Wed, 21 Apr 2021 12:47:01 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:00 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/5] drm: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:53 +0100
Message-Id: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new line with */ on the last line of a block comment to follow 
the Linux kernel coding conventions. 
Problem found by checkpatch.
in tree dpu/drm

Beatriz Martins de Carvalho (5):
  drm: drm_atomic.c: Adjust end of block comment
  drm: drm_auth.c: Adjust end of block comment
  drm: drm_bufs.c: Adjust end of block comment
  drm: drm_connector.c: Adjust end of block comment
  drm: drm_context.c: Adjust end of block comment

 drivers/gpu/drm/drm_atomic.c    | 3 ++-
 drivers/gpu/drm/drm_auth.c      | 3 ++-
 drivers/gpu/drm/drm_bufs.c      | 3 ++-
 drivers/gpu/drm/drm_connector.c | 9 ++++++---
 drivers/gpu/drm/drm_context.c   | 3 ++-
 5 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
