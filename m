Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96641B5A394
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF2A10E0FA;
	Tue, 16 Sep 2025 21:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="it4YdeS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D278410E0FA
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:31 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-327f87275d4so5759684a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056911; x=1758661711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JnksU2SwWU4C6GidGC0GSw5ecTfl2Qc9jjuMTd5CwuA=;
 b=it4YdeS9ogaUS6xzg8nTQAk9m15S5PAwGWcAhzJAMRpGwMrQ4g3dYGU9crFP9ehqad
 Z/mfUiBfq4wq+m1+Cio9cmwlk94KQd+VSyx+H7gq1ITOwI+iftRkRT+0uEXmAyYjpPnR
 Wmx5yUmNswlOvNuHyQKmAV7fAX0Bk4YyYFoBApFibwYwa0yKkAGC95FX3XowBMVwmzCw
 kW2rHrjn7iHttFzaQ7SjiIeor2EL7UtmGQrwP9UryaPvpf++bEau54nPDDJ3RV+1fbWi
 o3Kt/1sCKIPTleNtR5qeJWvD5/EiZMJTof79OZbbrLH3ajo9qmYKNn90pjz3pFITySCu
 Ch0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056911; x=1758661711;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JnksU2SwWU4C6GidGC0GSw5ecTfl2Qc9jjuMTd5CwuA=;
 b=GqR6Pyn+a+Uf/kTb7O0btpj6kBpi5p9YjywIeC/XhF6eQR0dxRtKaL4oNtzn2mrs1G
 ubU91l9bry1PgIhEc/vch/7EJFs3RIm58EhcO6eBTZs0+ZYwpHyPGorZEfw6ngQVWwCO
 vc/uHGJFggGSpzjQ6ULHAYP0O59xtQcCUf9qr+rA4Jg025hVr1rolgbzEPakrNtK4dDv
 Z5Ef3/MjRhNjvfhM5gVuI/+8q2cAKgo8gc2pOs2/nTNibsaD3pLlF8bFm0qnxKjhoacV
 XYQwaw/ooB0TrIDPuo+wF7/ee5lQi2+1mikgZzW+NyN06d2X2qOxkcTe8/r3ROb12RDw
 d03Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+vwLGXmhlSMQNebyDiU7yK+rVvuQ85QerHQKn9TKOEqHX90Gv7WWqmvRVElah/GkqF/N2qrZkQxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx63QW4Tm0250bGDjFAXE0paRapIq8sfgkKeUg3eYV3BwstDxZ8
 UKST0Lb6uHw1SxLlcCsqWf/E/qvxOFg5GHI5vj4ZDM+D1PeIrS1tqhj5
X-Gm-Gg: ASbGnctQKgCyHQZVMIPpoZq93PybF+JPALv5snSi3P5kn3fqBQffEArMBl4+E3dN2wE
 yZ1zsp3R+x19uVOngddJXX99VDrIN02V/qTvJwxJP/SClUkGRB0Zu6nJ8gmzBr5wdlE600wdvFl
 QEvEh0c/hQqw7dJbrRon4WUpXvcM2TJDEW9p17K7gAtBd4uwc6hQBEWNFhk3ibKHxJpKAd14dac
 VRkV6Vi0WIlxxZEpFXAlVv6KAcS2irIl8okO8Vn49UEleRPDPLfTP6o32z28tP1P3noRWjLuZZF
 p6HQMHukKccB9G5/Md8+M68rFVIUVg+ppZnj9XB0vB00SxVkVipwpwBifXwde0cHsDv3vjP25R0
 ANl19Dw5++r7ZbZ62sHtOKukDdyjUPN5i0FzEIGfu6bUhf7AcYbPxWmEq+su1zOYbuMtsDOhPH3
 W1Jwds+JOaOQ==
X-Google-Smtp-Source: AGHT+IFDCNg8RT7iyB/b9XWWvWDI50pwmmPAEJl2QkoNSyYP2rCXRsOqrvEryw3II2ggN4h26fj0GA==
X-Received: by 2002:a17:90b:5583:b0:32e:6858:b503 with SMTP id
 98e67ed59e1d1-32e6858b70dmr10303623a91.29.1758056911296; 
 Tue, 16 Sep 2025 14:08:31 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 41be03b00d2f7-b54a35ca2basm14988737a12.12.2025.09.16.14.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:30 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] drm/panthor: minor AS_CONTROL clean up
Date: Tue, 16 Sep 2025 14:08:13 -0700
Message-ID: <20250916210823.4033529-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

This series performs minor AS_CONTROL clean up.

Patch 1 to 5 rename and document AS_CONTROL config functions. There is
no functional change. All functions are now prefixed by mmu_hw_ for
consistency. All of them also expect locking. I choose not to suffix
them by _locked, but I can be convinced.

Patch 6 to 7 eliminiate redundant mmu_hw_wait_ready. This is the main
functional change of the series. panthor_vm_flush_range no longer waits
for UNLOCK to complete.

Patch 8 to 10 give mmu_hw_flush_caches final touches, to improve error
handling, simplifying code, etc.

Chia-I Wu (10):
  drm/panthor: rename and document wait_ready
  drm/panthor: rename and document lock_region
  drm/panthor: add mmu_hw_cmd_unlock
  drm/panthor: add mmu_hw_cmd_update
  drm/panthor: rename and document mmu_hw_do_operation_locked
  drm/panthor: remove write_cmd
  drm/panthor: remove unnecessary mmu_hw_wait_ready calls
  drm/panthor: improve error handling for mmu_hw_flush_caches
  drm/panthor: move size check to mmu_hw_flush_caches
  drm/panthor: simplify mmu_hw_flush_caches

 drivers/gpu/drm/panthor/panthor_mmu.c | 157 +++++++++++++++-----------
 1 file changed, 94 insertions(+), 63 deletions(-)

-- 
2.51.0.384.g4c02a37b29-goog

