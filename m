Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B96B4532D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E710EB4B;
	Fri,  5 Sep 2025 09:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jxZb3aPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE9A10EB4B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:32:42 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-3e40057d90aso178086f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757064761; x=1757669561;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WUQQxacMUqRahxycdA3h1y3Z0OF1IgYvOPyUtwNUMm8=;
 b=jxZb3aPzz7zncvaJhdbXuB+lCt+I6STZcdZjYuNN+/oCMsRdH50Yvjzg0qujMM3Qsz
 d4jIgeb+zaj9t8GtbxGqjvnVkydXdFNe6mBZOm7GwTVzjsWEB3t/RAZeLwcHE68HpsrK
 wfkpHm2O2ed1jFdtDdeGPgZZQD4Q63W3HFBNspChcdglprD2in1UAe4heZisa8/Nhn9/
 TRRbIQMCrjaIsBpK9xm98Y9PE4vKrpv/fRToVHS67FIIJJTu8h0YnTy+oFNyCQhGbmSu
 ZcmKYMhFxny1P/pJk3c+JBss9E3p3c4sBIOyZbB1CTmo9MgAknbjUVT7MFBe6OdRW4Pa
 shaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757064761; x=1757669561;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUQQxacMUqRahxycdA3h1y3Z0OF1IgYvOPyUtwNUMm8=;
 b=YPT3Q2SRT3D/esHuwDkF1KIoV1/1CbVIH2IwGJ0UzRYsE0fCiCnu/LRJG8sHHIxCAs
 qUV0l5ltLdyLWfiRW4BKWGMcwtLndcXi7/tPPyQF+bSpgbeFlq58yARw5qdc8yytujWx
 GsNoLPOuYJkAHZathT3q6LwKrJ2+LkuyjAu0z3t+CrSgWACzjb38d9EkpldGfVVr8RY0
 lmWd/3RRt/y+5A4u2PC1oBJm2CK0UoVw0undhlVgfy3VXZa98i1OFkZnANGTTMFGSYpb
 OgnNbdcxlH3CLkm8Z59P4szaWch/gZ2zJK5vI6+rGJjpgl9PDGSEfINslyqjfu6mQ0iN
 RTMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpkUZBX1rnmhgeqScrfgxfOqHLQsAViZQuFiSGZ6fkOEEuM4sXiLWsjlmUGMxXehhxz/E4y3D36F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNxaURKo+aLIH8r16EQt8W1rmzo1pux998ORNONN40BSQ3s7FL
 2ysGszEb9ydVD0Io4+2dtO7SvHOIdpAD6X7w9E+ZvKaRqDnnwBWMox2MeP/18cwcRuH4ETOpClE
 kvBz8sKDifLbXCCMKUg==
X-Google-Smtp-Source: AGHT+IHZDkHcj/6VcYiM7mL8WwChssJZFLeAxiSE8KdBYC7hKhBpbzlSoeURD7a3i2UI42tf17qNH1ABChvUeQQ=
X-Received: from wrbm16.prod.google.com ([2002:adf:a3d0:0:b0:3db:bfe0:7582])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40d9:b0:3e0:43f0:b7ad with SMTP id
 ffacd0b85a97d-3e043f0bd75mr4771289f8f.18.1757064761059; 
 Fri, 05 Sep 2025 02:32:41 -0700 (PDT)
Date: Fri, 5 Sep 2025 09:32:39 +0000
Mime-Version: 1.0
Message-ID: <aLquN1YvdyI_6PJS@google.com>
Subject: [PULL] drm-rust-fixes 2025-09-05
From: Alice Ryhl <aliceryhl@google.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
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

Hi Dave and Sima,

Here's the first PR for the drm-rust-fixes branch. It includes the
commit to add the drm-rust repository to MAINTAINERS.

The following changes since commit b320789d6883cc00ac78ce83bccbfe7ed58afcf0:

  Linux 6.17-rc4 (2025-08-31 15:33:07 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-fixes-2025-09-05

for you to fetch changes up to 349510052f765b6eb9c2a21d0ffe08ba61fa683c:

  MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructure (2025-09-05 07:07:08 +0000)

----------------------------------------------------------------
- Add drm-rust tree to MAINTAINERS
- Require CONFIG_64BIT for Nova

----------------------------------------------------------------
Danilo Krummrich (2):
      gpu: nova-core: depend on CONFIG_64BIT
      MAINTAINERS: Add drm-rust tree for Rust DRM drivers and infrastructure

 MAINTAINERS                   | 11 ++++++++++-
 drivers/gpu/nova-core/Kconfig |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
Alice
