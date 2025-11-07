Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F89FC40E92
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 17:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B3210E0F2;
	Fri,  7 Nov 2025 16:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LcHLVMO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178C410E10F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 16:43:04 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-429c61b0ef7so445661f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762533782; x=1763138582;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=on8bewL1RI4N4l+sU7wrnJnMvJdHM/hSBq36uJM+rEs=;
 b=LcHLVMO3X9X9vMAOvIxKOrS2ok+Mv4D1u8pAl96e2TcPF4ealSRzTxJZWUs/+pw9w1
 3cjQqnQaO8pNJ/6N8+iaHpWJE6iKD4T0/3wcrto8aZmdhLfPgYTx/ntdvbJprg3gUlb8
 CFeShzklIcZeMU3gG1Bngy1n1/LVWpx3ZOC+L2e63RfvUpAT9nr4nsi0g5zSAU80EmVN
 UkR25QdWmc4hh2bAm33Dni8hCZUynEJQWG8TPJ/cjIBqkJspmWEyNuo0Anot/VF9hfES
 VV2BIsYTbmqtIA5HG0RJI2i90jqZzydBw8IGD7Yy4IIV+yrq9d1KnK/kK1a2NVyJDPdw
 P8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762533782; x=1763138582;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=on8bewL1RI4N4l+sU7wrnJnMvJdHM/hSBq36uJM+rEs=;
 b=kTW7ktZiFqznNpQyYaYGIlkKqbqYQCFc10eNmrfs/stiykMva0fGyKRjV8PisWENP/
 MK2CTvpbl5FUqntVPiFBKo154BfRS6xKSgN437YRcoS5jsONjbyGmSUoEVa8ZA92D8ur
 zSQU/4pep7c4o+QSCxAG/dbHmtepxPttai7PLNQFA5NxK966GziOHro6yDydrWV52GfO
 unXB/sb5oXFNjnmAAQl/qL2ivDAak4nQTyzYEnww0nr6Bt0i8B380iw/f6gWb6nakFuD
 N0COplGMGxxmMeBzfZYaahrInN7R22GVNHumhaw++geN686Ce4WbjN1wAVvM359oPZVm
 LptA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXssQYJ4FlUkHz5bbGdukzAuXePv+3WhUAUfYp2qnZNlAnMof1T8/LxaGzHS4x6MqD6hqdtpKYLClc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxE6Af0O/YcCeufBSfYx0/2/WUIb1HAy9Migi/hxg2zC/6L2JZY
 KAvVDJbL+lq56EqO12TivV3X8jviodwb2Uzu0J5qyR8epLrGwcKAXIMXrqmfzbVXiCvPIqgGBQ=
 =
X-Google-Smtp-Source: AGHT+IErWQ/bAs6sgLKAGNRJ/4CQ20iQCILHo6B+nhBcFHGoZnZeYmzcBl/waJrrk8dDdmr4ZnLdN3g5
X-Received: from wrzd3.prod.google.com ([2002:a5d:6dc3:0:b0:428:4fa9:ac7d])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:25c7:b0:426:d60f:746f
 with SMTP id ffacd0b85a97d-42ae5ac329dmr3140724f8f.30.1762533782550; Fri, 07
 Nov 2025 08:43:02 -0800 (PST)
Date: Fri,  7 Nov 2025 17:42:41 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp;
 fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2688; i=ardb@kernel.org;
 h=from:subject; bh=fwiBdr2UguIhUnvRRI7uFyScWi3GAhl3ehVZMRQfNi8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIZNPsfETS8sT+bOnqzxSTleu8262DO08KLiGPZ7zEpuqR
 7BbP39HKQuDGBeDrJgii8Dsv+92np4oVes8SxZmDisTyBAGLk4BmMgVVoZ/qkd7Dn76GcJq1qrt
 +mN7veu1Dxn/uqTmP7376OzXF98PNjH8L3QIvnNR8eVcj1u3Clb/+Kx5addtUe/GiMOC95nOxq/
 dzwAA
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107164240.2023366-2-ardb+git@google.com>
Subject: [PATCH] drm/i195: Fix format string truncation warning
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

From: Ard Biesheuvel <ardb@kernel.org>

GCC notices that the 16-byte uabi_name field could theoretically be too
small for the formatted string if the instance number exceeds 100.

Given that there are apparently ABI concerns here, this is the minimal
fix that shuts up the compiler without changing the output or the
maximum length for existing values < 100.

drivers/gpu/drm/i915/intel_memory_region.c: In function =E2=80=98intel_memo=
ry_region_create=E2=80=99:
drivers/gpu/drm/i915/intel_memory_region.c:273:61: error: =E2=80=98%u=E2=80=
=99 directive output may be truncated writing between 1 and 5 bytes into a =
region of size between 3 and 11 [-Werror=3Dformat-truncation=3D]
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |                                                             ^~
drivers/gpu/drm/i915/intel_memory_region.c:273:58: note: directive argument=
 in the range [0, 65535]
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |                                                          ^~~~~~
drivers/gpu/drm/i915/intel_memory_region.c:273:9: note: =E2=80=98snprintf=
=E2=80=99 output between 7 and 19 bytes into a destination of size 16
  273 |         snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  274 |                  intel_memory_type_str(type), instance);
      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

This is unlikely to be the right fix, but sending a wrong patch is
usually a better way to elicit a response than just sending a bug
report.

 drivers/gpu/drm/i915/intel_memory_region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i=
915/intel_memory_region.c
index 59bd603e6deb..ad4afcf0c58a 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -271,7 +271,7 @@ intel_memory_region_create(struct drm_i915_private *i91=
5,
 	mem->instance =3D instance;
=20
 	snprintf(mem->uabi_name, sizeof(mem->uabi_name), "%s%u",
-		 intel_memory_type_str(type), instance);
+		 intel_memory_type_str(type), instance % 100);
=20
 	mutex_init(&mem->objects.lock);
 	INIT_LIST_HEAD(&mem->objects.list);
--=20
2.51.2.1041.gc1ab5b90ca-goog

