Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E058E23C17E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679E6E03E;
	Tue,  4 Aug 2020 21:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D226E03E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:32:09 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q76so4293634wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DF5yKzOPMXVYngQSBfD05wSpsfrYcHWC8kfD4ia0he8=;
 b=X5Hetv2i20phNPeysBMxrpvbCw1680QQcLa9h94KZpQN+puvrnT2Vt+tz59KPZLvst
 d7nxvSsNM980eMV3iuwL3f9MoryemPn4GwFytGIxtCBWDEh4ZR4QIIXvU112pZBrHXdw
 VGsUFwCinb3qG4QdVLVokiEBOeMGFknnSzvbj5XJ9w7FNMczQkMZC7CRU+JfHYiW4uNQ
 JrAMlNa7jwd0mdbtu593vZjlK3k+k8fiIsAQALmzchn+CqCTJFBQRirizzWwAnEmhnha
 oR8zBjHSRpD0+Z1NLI5n/B/Yv7EwnBmKcfrIZSU7Arm7oUvPSjQQEDEz20qdiSscZ8JZ
 kjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DF5yKzOPMXVYngQSBfD05wSpsfrYcHWC8kfD4ia0he8=;
 b=kRXAT8KAYqkemT0hHdArHonf8vhzcfi4E84MNSk5BmkrIKGhB5SiN+thEzyfrOuqql
 kjO4TV8AkwhHt//MCzEjApuWsJphdcxYSdvw6AUElfWLG1ONjLMSt05Rkxr+8xsIppNa
 PeNqHwJWwaMdqG4wDHMo0b4fQa7RMy3dpiw3OXEY0OwqOrwVNz8ObgrxZX2P1ZHwfcGD
 zx9WPbL4xQRwJOgpt3b5fxHvWMFYS4m9ZZsYTAtoXHRYn4FynFydzDwGBo3Y4JPpl1N9
 0LlsqmMc2IkvaLMFSU3ap/2zXEwdS1ExW7RXIABD4CooxrA8BmlsGYtT8fOirK5biiSk
 GCPA==
X-Gm-Message-State: AOAM530KwusrMCc9EMQWXOCaVBy5XMd7MbgLFrr4pbRPdrMg0t7kMLjp
 CYHX6PHpEiKG9+95hR5Jg8kimQ==
X-Google-Smtp-Source: ABdhPJyqjoYqAxdILDMHmmRCdSipij570vuqXhhbIObdvyHI//y80TnursbmM7JKudu5PlcObRw/AA==
X-Received: by 2002:a1c:9803:: with SMTP id a3mr323249wme.57.1596576728200;
 Tue, 04 Aug 2020 14:32:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:ce92:471f:873f:fc56])
 by smtp.gmail.com with ESMTPSA id x11sm97612wmc.33.2020.08.04.14.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 14:32:07 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] amd/display: Add GFX9+ modifier support.
Date: Tue,  4 Aug 2020 23:31:11 +0200
Message-Id: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
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
Cc: maraeo@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds modifier support to radeonsi.
It has been tested on

- VEGA10, RAVEN, NAVI14
- weston, sway, X with xf86-video-amdgpu (i.e. legacy path still works)

and includes some basic testing of the layout code.

The main goal is to keep it somewhat simple and regression free, so
on the display side this series only exposes what the current GPU
can render to. While we could expose more I think that is more
suitable for follow-up work as the benefit would be minimal and
there are some more design discussion there to discuss that are
orthogonal from the initial implementation.

Similarly this series only exposes 32-bpp displayable DCC in the cases
that radeonsi would use it and any extra capabilities here should be
future work.

I believe these are by far the most complicated modifiers we've seen
up till now, mostly related to

- GPU identification for cases where it matters wrt tiling.
- Every generation having tiling layout changes
- Compression settings.

I believe the complexity is necessary as every layout should be different
and all layouts should be the best in some situation (though not all
combinations of GPU parameters will actually have an existing GPU).

That said, on the render side the number of modifiers actually listed for
a given GPU is ~10, and in the current implementation that is the same
for the display side. (we could expose more actually differing layouts
on the display side for cross-GPU compatibility, but I consider that
out of scope for this initial work).

This series can be found on
https://github.com/BNieuwenhuizen/linux/tree/modifiers

An userspace implementation in radeonsi can be found on
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6176

Bas Nieuwenhuizen (8):
  drm/amd/display: Do not silently accept DCC for multiplane formats.
  drm/amd: Init modifier field of helper fb.
  drm/amd/display: Honor the offset for plane 0.
  drm/fourcc:  Add AMD DRM modifiers.
  drm/amd/display: Refactor surface tiling setup.
  drm/amd/display: Set DC options from modifiers.
  drm/amd/display: Add formats for DCC with 2/3 planes.
  drm/amd/display: Expose modifiers.

 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 758 +++++++++++++++---
 include/uapi/drm/drm_fourcc.h                 | 115 +++
 3 files changed, 775 insertions(+), 100 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
