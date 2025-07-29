Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26730B15391
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 21:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A2C10E21E;
	Tue, 29 Jul 2025 19:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3cvNeydx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com
 [209.85.222.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6AC10E21E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 19:37:28 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-7e36e4467e3so38977685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1753817848; x=1754422648;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1gbKWHstsqjpQUrskmEj35TBdlQ+Ks8m0MsBKhxomQ=;
 b=3cvNeydxrUWPDaRmGqlMDVpk0g128/3nHIXnga7JsopCWp0RFBo16AXbu7d7zsJytK
 HOiok4Mk7lMw9vzATngsL4xIsly5FLFqAw9Rzj+GsWOwHeozF1nydkGuI8oqTt0xMz4S
 naFbJthyhxxkGk9PRrTagNZC0r/iooBeIRkcKUqWv/3VyYUa1h7Op0m2pBEebPlQV8Fi
 DbpG/u835nfRIdJdTPsZYACNDERfsjHG+reo0DNmCGA3L2HiWwmRL0MAQzPuDDru7cWI
 tjb80zfPvGh8ghJkDiR/zpMbkfYGaM5wNBZ+ka3QW1Rzd+Jtlqwznl3vL8yfICXhIYgE
 QEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753817848; x=1754422648;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z1gbKWHstsqjpQUrskmEj35TBdlQ+Ks8m0MsBKhxomQ=;
 b=VNWzu4oVcAYOuPKQ4ZY4p5atx/O5TcmgD93RLi+lwF9wP6PsN9B5dHprBUzKK1e3rQ
 eYEKy5C9oBDeaoq27sOjEbpRE/q9glh79B5Tdq6ehohZ0Ytyp8YEobOZ/IlHlk/tBU2U
 Mr8tuKValK9CJi45Puh0CaePMICQ5cegotBTPlhjlc9DQzYr7Kjqy6Bpm90PjPopeKTc
 cs1V650z5s9S/bnrnwCfkAEwEkJksEuUG++0OOkOMMDCZM/vENSB9x3MGDAp08hAl5MH
 0COUaskcq64TMmCyepinaHiOSfVvkUALq4TNB5/czNWYB+Z5TXiZ8Hf3fWRFhcefSEfN
 w4Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCdvLGiDSl2bIW0Ij2tb4dP8gKeUX9wb4mLAGNQRDa9TJwEjYAzteRSHbM6HNL8FgTmX1B3dINjZ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8AA34K/uVqHSd93lwfLi9DOcY81skr32TMcXoX6t/h6RI54Nu
 VtP3+f2jMJpw74H9O3kfxoBqMNXu0XUURursofkhPxe7sr1CiYsXdWAnpPjOdrmkabaTHte6hsl
 9BRzhgpBDt2yxdQ==
X-Google-Smtp-Source: AGHT+IH49q8FwE/ekxv3FeoZfBKO45/GCZY6ANFvVAwiH31rvsPrQpAAJiadtmnkP06wHNdCbESTk/zdijXtfQ==
X-Received: from qkkh15.prod.google.com ([2002:a05:620a:10af:b0:7e6:4e45:e180])
 (user=marievic job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:57d8:b0:7e6:5f1c:4d78 with SMTP id
 af79cd13be357-7e66ed5c00fmr119271185a.33.1753817847731; 
 Tue, 29 Jul 2025 12:37:27 -0700 (PDT)
Date: Tue, 29 Jul 2025 19:36:43 +0000
In-Reply-To: <20250729193647.3410634-1-marievic@google.com>
Mime-Version: 1.0
References: <20250729193647.3410634-1-marievic@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193647.3410634-6-marievic@google.com>
Subject: [PATCH 5/9] drm/xe: Update parameter generator to new signature
From: Marie Zhussupova <marievic@google.com>
To: rmoar@google.com, davidgow@google.com, shuah@kernel.org, 
 brendan.higgins@linux.dev
Cc: elver@google.com, dvyukov@google.com, lucas.demarchi@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marie Zhussupova <marievic@google.com>
Content-Type: text/plain; charset="UTF-8"
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

This patch modifies `xe_pci_live_device_gen_param`
in xe_pci.c to accept an additional `struct kunit *test`
argument.

Signed-off-by: Marie Zhussupova <marievic@google.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 1d3e2e50c355..62c016e84227 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -129,7 +129,7 @@ EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
  * Return: pointer to the next &struct xe_device ready to be used as a parameter
  *         or NULL if there are no more Xe devices on the system.
  */
-const void *xe_pci_live_device_gen_param(const void *prev, char *desc)
+const void *xe_pci_live_device_gen_param(struct kunit *test, const void *prev, char *desc)
 {
 	const struct xe_device *xe = prev;
 	struct device *dev = xe ? xe->drm.dev : NULL;
-- 
2.50.1.552.g942d659e1b-goog

