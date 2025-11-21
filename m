Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27728C7851F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2382D10E80D;
	Fri, 21 Nov 2025 10:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EB7P9ZGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AAA10E80C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:06:33 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-429c76c8a1bso2084171f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1763719592; x=1764324392;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cl2MKw8tab6Mtz1FgEqrovn666OZWtYzaeQDzUi1X/I=;
 b=EB7P9ZGlvi9DtS2k+qj1JXCUlRE2AJzCF2PxB7H+3BIHMMrRDQRtgVLK4CiakYpOJW
 wIZZYOKR8KARJufnj8KK8O0gwdDHFHGohzwv8zeD+qbvbx+iwjsTYMbk9hh4hjHHapR0
 RhzOF6+tPIgAAlYRYP5ilzCk7HKNMzVMiA1FLkVJqXh4S0Uf0uuXfVtDwmAcFqj8A6Fy
 P6l4Bbmvzsrnm2JGgogc0urBQMcyAzTW5LHP89nri0F3PzcBiENkVYOvXcwXNQ3/kMeo
 m7Sg4iXXdaaK71e67dHtqTIVomyALy6Hh8QlYttMkbSi9FONkgrcEGzDsqJo4GxjH0P6
 55yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763719592; x=1764324392;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cl2MKw8tab6Mtz1FgEqrovn666OZWtYzaeQDzUi1X/I=;
 b=TmeKa4yXUX01ubhhvy3w5WLhESDiXQoH9hE3+uSXo87z864kj1i66+0MlLaPSxEQz7
 uuj+49582iBOPyzRIJQMOSVwDgSkXI68HhehrWm07uqt6WmkN/YmtSQnt7PNea8auofA
 9+nfH3c4zsR3py3wtzCtVgZApy/yGUPnni2RplQaS7cqsMz1Hl6QA2PDK3jmZDs3zuMH
 jqiup59uL+B+jJ5Vld5LE88eWdem5fKSOuCZyVXz/H5dEQ4Z1ClHZNg9k0HBMDOb3ofS
 4SjqGs2BI/99WuTL9fFicNQyLUGpnImSBIA1AacmIWmm3EEe9mADB78dvALiRxgRZSIC
 LFsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcW1RNj5GSQBi3e5FdSljCdAuNKeVDZkt9iJP6jJkzebDy3aUbXSoHpIPSWrfvnVVnuxo4A48TCCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4Ot6SQtINKU6o4B3JNHLNin19Ul28OwTGytCOwO3BoHeKQpfo
 URf0yUg8X5k1AndmLfoDTYkgiW7yEIgnQkaNuUfnskr6OmK/CXCSqltBoqsHegFdhM6ZCdEhfkM
 /I8Ur384xUyWeC1TeLg==
X-Google-Smtp-Source: AGHT+IFRCpnui5X/hdHVF+GN9/3IwNDrRnkzekQdAdU4QEDBAj7wm7oIR1v0hrBczQVblLlGTSnUTYy18xsQNyg=
X-Received: from wroe1.prod.google.com ([2002:adf:ef01:0:b0:42b:b28a:6748])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f44:0:b0:429:d350:802d with SMTP id
 ffacd0b85a97d-42cc1d34848mr1592512f8f.45.1763719592117; 
 Fri, 21 Nov 2025 02:06:32 -0800 (PST)
Date: Fri, 21 Nov 2025 10:06:30 +0000
Mime-Version: 1.0
Message-ID: <aSA5pshsJ7TeJIbu@google.com>
Subject: [PULL] DRM Rust changes for v6.19 (2nd)
From: Alice Ryhl <aliceryhl@google.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

Please pull the following DRM Rust changes. This PR fixes a warning and
broken link in the Rust documentation build when building with rustc
prior to 1.80.0.

The commit has been in linux-next for one round.

- Alice

The following changes since commit f0ded972d37150f9f889de75c9eecc5cb0730013:

  Merge tag 'drm-rust-next-2025-11-18' of https://gitlab.freedesktop.org/drm/rust/kernel into drm-next (2025-11-20 10:44:50 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/rust/kernel.git tags/drm-rust-next-2025-11-21

for you to fetch changes up to 57dc2ea0b7bdb828c5d966d9135c28fe854933a4:

  rust: slice: fix broken intra-doc links (2025-11-20 10:13:35 +0000)

----------------------------------------------------------------
Core Changes:

- Fix warning in documentation builds on older rustc versions.

----------------------------------------------------------------
Miguel Ojeda (1):
      rust: slice: fix broken intra-doc links

 rust/kernel/slice.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
