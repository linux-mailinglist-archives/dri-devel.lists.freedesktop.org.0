Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D10C23087
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 03:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D7D10E154;
	Fri, 31 Oct 2025 02:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XvxzhalN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A6410E154
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:35:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2698384978dso14393145ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761878138; x=1762482938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9vvQRtDmKDzAuZGXq3vjR0AUmU7rFcWJ57hWGdXPzcg=;
 b=XvxzhalNNv5xx++t0hKfZ/X4uO6fWrBkOG3cRZvkc/k+KVzWyN1XT0rOQf49t5AMZd
 9MEZPF7gEjmtLjBIDNdOLMimk+07Ge+CtSfMvKCYqKyLfGkk8gfeO+q9yx0Xz4zQ9gYk
 kBwhOz183hcAsOvUCdUxSvxrxRi4SJHWDcsZoIuL2f2C2jh+L3qbwq+jlGHud1Cka2KF
 gRZ3SUzmCDip1bMfjCA/OB+3I4car3jlvd68BlWShMIG7t7GTmqhB3FRIvL79LVcg+SO
 7Vz4tCofgQANNpyXQFOLxvCvCAcCrg98EJRZVT9tDhBHyPzGRd3slW2xY3JkPoyK/c66
 IMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761878138; x=1762482938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vvQRtDmKDzAuZGXq3vjR0AUmU7rFcWJ57hWGdXPzcg=;
 b=V4bLzDmTrzoKCZOJ/6edAHMKyYLYIEtJj9+UMCYMMPRgNMJygEx6AWRivGs6bGh/gZ
 pXkkvM+sykTXUECZt+UN4igoElmYI9x0oBkqYVRKetvihXBo/8CrhNPL0KtYAJG7djJq
 hq/YRP1dWkUDG5+dY45pQHCIVB2YwYlR6CCEQEEhdahUBSQCzirbo8bqBIKJG1brZEQe
 SaJlr5AED6FedsWeOf4j+IvO5KDEtHlJkzx4/RS6M76tEMv9h8o+5l99mDojWOBxkbXj
 6fTXuusl/fAshfYSrTO5bjpjEZQ1rEgFH0TZ2L5xcK95TFHXlsG3mSDm72Ls9NHuFx3A
 wP/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2jqS2YKcG4i7ci6wjnvWmdB229L6+39GXnm3WVk6bAGs/svYex3DPK8SM2VlMHDHVVjCrwgrC70I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGTpy40qqr8y+W4s5pa7ecQT5Cd+4wo6voKURQJYJndHozKzJy
 sqrgJNTDJkhyMYFIOBpcMGaztrJcaBndhaxtje8nWvTtpx5QSGAyDmy3
X-Gm-Gg: ASbGncvvC3cygnFson2p4Sob81zZ3RlzhOhPWLwLVn4ezFBb3i8T8u4vZafwVMQx/ua
 EBMtXK8+fXkp73Xy/ousKKH8OVAaBXb2R8KEE2mT60ofnVu5RvfP1JRF9XLl6DR9Flujj8EXE6B
 T7Ytr2dQ9Zc6zha4rtDG3qKT+mpKxe1P8eAJ99jd3s9Ql61zHgAiwfCU59dBBttou41Hh/V+o6B
 WFBAvGpaoGHBKo0FF7LteDNywPbKCv9VGssFyEOIJWj9VeRwniNLsyQM777G4JF07IHS+OHES52
 4+30L0oTlEDkDItxeJ83XunEfyOEjdqJhQ8d5kSSfTQac467GYx1/7hzwERouR0pb97qv0t705x
 7MBQVvEztaDitvbgqC88KbFdq2M+FEKriBmmXN2XUQPpuge/dIaVyw8Dsfr0o183mCVoBiioIkm
 l5
X-Google-Smtp-Source: AGHT+IEluerJf1Yae3TPbqAUr6I78s2WydyYE9qOcEluGuH9xjTI40DkyWuxTHldqCEahsYNqzQsMA==
X-Received: by 2002:a17:902:d507:b0:263:3e96:8c1b with SMTP id
 d9443c01a7336-2951a55d380mr29699905ad.33.1761878138054; 
 Thu, 30 Oct 2025 19:35:38 -0700 (PDT)
Received: from archie.me ([210.87.74.117]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29526871b31sm4626845ad.8.2025.10.30.19.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 19:35:37 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id B11164209E4A; Fri, 31 Oct 2025 09:35:35 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: gpu: Limit toctree depth
Date: Fri, 31 Oct 2025 09:35:21 +0700
Message-ID: <20251031023521.12391-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=bagasdotme@gmail.com;
 h=from:subject; bh=08DR8ByIVln+RtqS/Cdj4+7tEMme3kgNEHW0emoY5+w=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDJksCgLnLxv9frYxp2KjjuGSCxotjKclP8/XbY+ae1bn+
 G3OP3mTO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCRqCsM/6z35a01+mzFKXTW
 o+DwgchOj70/2B6+T7gRvVkz3C5juxfDX8Gpd+LFf+vvO32pSHb/Q0E+tqht4rNEeY4xTFRzvfF
 hEjMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

Currently, gpu docs toctree lists all headings across the documentation.
Don't spoil these details by limiting the toctree depth to 2.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 7dcb15850afdb2..e6207b31f8dbd9 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -3,6 +3,7 @@ GPU Driver Developer's Guide
 ============================
 
 .. toctree::
+   :maxdepth: 2
 
    introduction
    drm-internals

base-commit: 6fb7f298883246e21f60f971065adcb789ae6eba
-- 
An old man doll... just what I always wanted! - Clara

