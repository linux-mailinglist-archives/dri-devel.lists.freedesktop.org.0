Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C68AEF389
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498A210E562;
	Tue,  1 Jul 2025 09:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kifEHTcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CB510E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:40:59 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-74ad4533ac5so5469280b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751362859; x=1751967659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y91NncPK7/NcNQ1UmJol8Fd0Ci46AhdIGyCjKnxZtQM=;
 b=kifEHTcLf4TsW9RTm9b7xKzwwZ+wCIEB0ukltODWPd8ZAiVZRcl6ltwaAShfF8YDAm
 Pw9q+NdAMN/6WM1Xh4LmBHDO/WJqe1vH64lpksz7hJtlobBWxPmkV+iek1BID68HS9rX
 tAbzdlcrmRol+i7tzyh2R5R+XB+gTv0/R83eFYytE6PooCJfk2XWnyjXqQDB5wnzRCpb
 9+gxuJnZSp+ikKKdzJ2SEaAukdWarZH4AgVIOyia7If7nsXonoAegKS8fAIJEXU3yNnm
 uYZG3schI+fh7h9u0bGbrTMJtimV364cPjCmIXpqTh1FOzVCo9A0ecyP+yBKbqSacOaH
 r3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751362859; x=1751967659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y91NncPK7/NcNQ1UmJol8Fd0Ci46AhdIGyCjKnxZtQM=;
 b=xC1MHgWjssakz4wxtb9SsBH3BxM6QZF1RX8GInlV17HHxY8pgTOn/dv/b22r8mxJ1o
 mA35B1Bo4Pmna7eLq1xlDnOXfUuPdTfAaWgOSiHRksHgiv297L0WeERqeEwyhKbuZ0cJ
 3v4WzjhvF71TYUahdnYfbM7HOLSE8RDBW5dHqWmHx6hvH0yrfIdjVtYsrJz3g+U21+yU
 toWlS7h73JAFizfiiUjq/EyDgJpcTg78sWL25HG0CfTEcAl+lHb17T7oiH9J4AINBQkr
 O4ky1l4lgvHpYGj07FKjeuT6PTiFMMQpHJT9Fy/+CC06phGbOVPCyBKFyxknAxbnAVol
 GTxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3BHCjJnE6rXHcs10x4fFJn0jR1uNjlENl9bpyzrpN0Y0RtSYTqQd2yQm2SPSDOZwwGJrRdhL3FJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQ/WfUhoQkr+trrT5E9GuPnxkoqZBUbrK2yRrFx27goBeP4g5t
 INlVdCq3sKsxiduVfUKEj10bnDQzqeX9JbBZsmGhaNIXis6Vaf++ikR0
X-Gm-Gg: ASbGncsFveKxvGGoxKyal3LvqxWlths9ZJkPq6OOo5RoOKXz2BsIZRXPwn5Po8iR6MC
 vqCADdEut5PKi1wsNGz9hec7t/IkLsEZytHkf3BsMMKkYu6QoKbNQqM0iySIuKi57XBXclnFnpj
 jYZ+S7eSs2mqxeibWV1jANlVAaChPAkEq0f5cAzuaFGzR+w0KL92XsQnTYZgwquL7FH6wK8DqKb
 7TmUPFtHM0X2I/yGnHzLag7WwtpwzetxqTJOCXzm0r1lTLo3KTgsd7o1XMnKarK6OV/N6LIOsYE
 cppAk3/4rM/YHwEedNNmTHpm0w9ceBu7aynokU1ifGZIXDGc0dkeWbfF71I89Ihu7/svq03aO0K
 SIg==
X-Google-Smtp-Source: AGHT+IGVMTwoGg5+t/VBPlWizgX/TDlm9njeq315sfW+K8E17Imd2YRP7ugM+hDbZut/vexETw2A2Q==
X-Received: by 2002:a05:6a21:7109:b0:220:898b:2ca1 with SMTP id
 adf61e73a8af0-222c9a71c21mr4955815637.21.1751362859066; 
 Tue, 01 Jul 2025 02:40:59 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-74af57e7279sm10945766b3a.150.2025.07.01.02.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 02:40:58 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: andy@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, dan.carpenter@linaro.org,
 gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
 tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
 notro@tronnes.org, thomas.petazzoni@free-electrons.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Date: Tue,  1 Jul 2025 15:10:21 +0530
Message-ID: <cover.1751361715.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Cleanup error handling in fbtft_framebuffer_alloc()

This patchset includes the revert commit for the v1 patch, and the
cleanup patch that is not yet applied.

I have not included the v3 patch ("staging: fbtft: fix potential memory 
leak in fbtft_framebuffer_alloc()") in this patchset, as it has been 
already applied on staging-testing

v4:
- Add a revert patch to remove v1 patch
- Not included the patch that is already applied on staging-testing
- Added Reviewed-by tags

v3:
- Remove a redundant check before calling kfree

v2:
- Change the earlier patch to also handle the error code returned by
  fb_deferred_io_init() and update Fixes tag to point to the commit that
  introduced the memory allocation (which leads to leak).
- Add second patch to make the error handling order symmetric to
  fbtft_framebuffer_release() and also remove managed allocation for
  txbuf as suggested by Andy and Dan.

Link to v3: https://lore.kernel.org/linux-staging/cover.1751207100.git.abdun.nihaal@gmail.com/
Link to v2: https://lore.kernel.org/linux-staging/cover.1751086324.git.abdun.nihaal@gmail.com/T/#md111471ddd69e6ddb0a6b98e565551ffbd791a34
Link to v1: https://lore.kernel.org/all/20250626172412.18355-1-abdun.nihaal@gmail.com/

Abdun Nihaal (2):
  Revert "staging: fbtft: fix potential memory leak in
    fbtft_framebuffer_alloc()"
  staging: fbtft: cleanup error handling in fbtft_framebuffer_alloc()

 drivers/staging/fbtft/fbtft-core.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

-- 
2.43.0

