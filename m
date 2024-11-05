Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF269BD784
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 22:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECC010E3CB;
	Tue,  5 Nov 2024 21:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J/dpiENY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1B310E3CB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 21:20:04 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7e6cbf6cd1dso4010034a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 13:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730841604; x=1731446404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lvJRS0Iq2Rr1qnscnO445sP51rMCDjYbRL0P/uElMFI=;
 b=J/dpiENYvlqcjhOVMxNVBxiD2nfrBp+HRYMxOR2s0r0sveLKWjxqa2/OnsZj6UntMy
 bn1X9nXCHWVVkNIv/0oLg0H5YEC92mJhHWbzCmZ7auijX1FmEEx6QuoZU5WL7RJ2R7La
 8iW2uVPplL7HKt2FUma7dCu9a8g+HZk0s8qQarjNGLiYz05QYT4wqxQ1BRsf6HGVb2sk
 osHhH/z+QuyimajjhbUcerQjSXawATlunfQTgVFLh2lg07r6vheMv1R1nzdGpeta1JbE
 oArFQGOKu2R2oxcFSTJsIwBAFt6zVU6dg2gWBJD5ocwHmakvsLVRhCiYLUeLSwmvOlWD
 UxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730841604; x=1731446404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvJRS0Iq2Rr1qnscnO445sP51rMCDjYbRL0P/uElMFI=;
 b=lRoNLsqC03WLlOo/Dy0J6eGTuyy16WEUGXUIxP9h00Y/C/pZIW85cXQRLyMMui0jEv
 hcV0n+vF7oGiW8od+xRLsIhvGx7htu2UwRe1OlxYFcz6w0C4Uni/AcJoz3fvgPKE2HMp
 hELV896AhGZEh6FRALPV7tn0mcuvawAlZy3r4svmrQOC0b4U71rKG8Vz7Sb/TyroVjP9
 7VUrESyyBH2ihtV3WRbe+xHrTm70uZ0LQj0JQZ7inIIa/Lhpox/aiXMcG8q4/C1nhD1Q
 fOFYHvVd2fiMoBoI7Xvy8iNZj87exs7rEOrjh1shj1DiekafLfXFtjypNhuN3Dv+CS1n
 Xwqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMwt19zK+5DpVvLkV6AFS7hOCOFu0XXrwKo9g89mOd2ugtKuIr2jtMaBujV6BpbGFXODUOFLhmaLc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJI6o2iq5PiZ6xnboceXeeAPiXSBrI2fWFu2l1oCauLuGb2eW2
 8wye0gjgeZN9eITL3YOgQ2AN2a53YEJmbhqg6Y5V8F9d5w540dVO
X-Google-Smtp-Source: AGHT+IHOr6UuR/OTItB2xPC5Y/uX2O3GRqNIdSS39MEbeCVUUynWuJDZdIv8YAe3h0ovqFcFaQmllQ==
X-Received: by 2002:a17:902:d4c3:b0:20c:ee32:759f with SMTP id
 d9443c01a7336-210f76d659cmr349627895ad.39.1730841604058; 
 Tue, 05 Nov 2024 13:20:04 -0800 (PST)
Received: from macbook-pro-49.lan ([2603:3023:16e:5000:1863:9460:a110:750b])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057068a8sm83723025ad.86.2024.11.05.13.20.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 13:20:03 -0800 (PST)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 kernel-team@fb.com
Subject: [PATCH v2 bpf-next 0/2] drm, bpf: User drm_mm in bpf
Date: Tue,  5 Nov 2024 13:19:59 -0800
Message-Id: <20241105212001.38980-1-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

From: Alexei Starovoitov <ast@kernel.org>

Hi DRM folks,

we'd like to start using drm_mm in bpf arena.
The drm_mm logic fits particularly well to bpf use case.
See individual patches.
objdump -h lib/drm_mm.o 
.text         000012c7
So no vmlinux size concerns.

v1->v2:
- Fix build issues and add Acks.

Alexei Starovoitov (2):
  drm, bpf: Move drm_mm.c to lib to be used by bpf arena
  bpf: Switch bpf arena to use drm_mm instead of maple_tree

 MAINTAINERS                       |  1 +
 drivers/gpu/drm/Makefile          |  1 -
 drivers/gpu/drm/drm_print.c       | 39 ++++++++++++++++++
 kernel/bpf/arena.c                | 67 ++++++++++++++++++++++++-------
 lib/Makefile                      |  2 +
 {drivers/gpu/drm => lib}/drm_mm.c | 48 +++-------------------
 6 files changed, 99 insertions(+), 59 deletions(-)
 rename {drivers/gpu/drm => lib}/drm_mm.c (95%)

-- 
2.43.5

