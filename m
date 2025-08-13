Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631CB24B19
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90C410E727;
	Wed, 13 Aug 2025 13:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="L8vTXVLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50ADD10E729
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:51:18 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e1ff326bbso808988b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093078; x=1755697878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2c4SClBLaEcuuZYVj5SwZ6daEI8HGZlE+9CzkOMlMk=;
 b=L8vTXVLTlVWdCkSNA4oPdVOJAZPOQDBHbYXOHtSCcIVF5rrnLsmqQf4nxvz+aSkNQf
 a53R8wJDAJkOe5ehIQWx1hVAHvHNK7XDe3nRMIb0ykY34/x/jM/PXuJ+QGIO9sS2AI+J
 oDSwQkLsk9XpfPSWtbP8AmXqEKH4f5UR67ZUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093078; x=1755697878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2c4SClBLaEcuuZYVj5SwZ6daEI8HGZlE+9CzkOMlMk=;
 b=Qxlv1FVk0nE7nTCoIYSqE1Ns9Be1cPvhBSiXRc7pz2tWQa+gJ89yUdzQNIN8Hj/i98
 Cxl0fXuEC7P0y7uwk93YKlcssLX3oLb+itV0RlAL/cJn2dZm7ZIRug4i2wZj165vtw2s
 DT2n2ehZ972wVQsqXC6xahZ25iqnJqhEdGQIDokUgDUYBQm9IQgVEZqn8lix4PEkhKGb
 yY4z5uMKkUvAYnQ564PrItCMtDvLTvaWH2czSY6QEs0yX5E0U+HTIJhlXBpVNUKoVMck
 T8TLqI3J9WMddHTPHXMM+otJVGBwTn+/yjpPEefm4pCx3UURxzgwJ4DOIiP51MWCZpWC
 jCuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcZzmK/gzY+4JF7nL00Bo7Z/bR+WXDZ5w6WJUGa9jrb83ZxH7GcKNcJi37vW10y+QqdAw8Ldknm3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwXP3WeMbeX0lFlngZMbZrzwqDoOk3C6F6e0bqLSOCH9zT4U2H
 0GnNQbQyhbwI4LyThiXU1YHPy+LjVpFXko1mHKWntBXjbZc/t9x1ayOabg8xtqSIhQg=
X-Gm-Gg: ASbGncscL0K2POYZvyYZLl5j0VWkbFH+ZKWpNOcPdnFP5LPHtZ0TJHE/EzplkA8UhBj
 SdzP2ETiLdtjAJBHS9Dya48eF9nHXIcQWTWKfbVcFZDdDBdU2fHPQEqoubOmRpefKjobpSRc34v
 UjhzouY0qrewOhct06+OH7D9e2OwK0L2n9tO154yHlW7ftgGaWpbrpDbqQWSkODT/XTpKw45Q/W
 KFdanncW/QWOvmbU21+pVHc/K/6ZrC0iJXevm8oZUxGsaXq+Ffu9ZA0+f8SVoQVu3MMJ9arTKgF
 a3jlC2PyqlGU7P3UmveejC240xVKKZK4jF1jv0EMLWIhgr2UE+BUavimlfZwXCW2TJ0ZLskD7/d
 zFU1A+eoORyqzCEM6saHWGoK4LB+gx/OE
X-Google-Smtp-Source: AGHT+IEf0aKPvCkI4XZhTOxy6XIagQxe5LGeKHK48oqbFSDd9m6+Nt4BKpedf/EsGP9aHHkB726Wng==
X-Received: by 2002:a17:902:ec82:b0:23f:fa47:f933 with SMTP id
 d9443c01a7336-2430e96adcemr41503215ad.8.1755093077850; 
 Wed, 13 Aug 2025 06:51:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:51:17 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 6/9 v3] drm/i915/display: Remove outdated struct_mutex comments
Date: Wed, 13 Aug 2025 10:50:30 -0300
Message-ID: <20250813135035.144762-7-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
References: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
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

The struct_mutex will be removed from the DRM subsystem, as it was a
legacy BKL that was only used by i915 driver. After review, it was
concluded that its usage was no longer necessary

This patch update a comment about struct_mutex in i915/display, in order
to prevent future misunderstandings.

* intel_fbc.c: Removed the statement that intel_fbc->lock is the inner
  lock when overlapping with struct_mutex, since struct_mutex is no
  longer used anywhere in the driver.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index d4c5deff9cbe..aaaabba77b88 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -98,11 +98,7 @@ struct intel_fbc {
 	struct intel_display *display;
 	const struct intel_fbc_funcs *funcs;
 
-	/*
-	 * This is always the inner lock when overlapping with
-	 * struct_mutex and it's the outer lock when overlapping
-	 * with stolen_lock.
-	 */
+	/* This is always the outer lock when overlapping with stolen_lock */
 	struct mutex lock;
 	unsigned int busy_bits;
 
-- 
2.50.1

