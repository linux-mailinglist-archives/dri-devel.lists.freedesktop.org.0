Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EEFBD7563
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 06:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0310E530;
	Tue, 14 Oct 2025 04:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="P8+sa8XC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321C610E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:31:33 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2698384978dso31377735ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 11:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1760380292; x=1760985092;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CyHScNioNUxAqCRLSGCVsNbNpblsxmwE5o0+kKeDGUI=;
 b=P8+sa8XCtnNyXCHL+xYremb/I7OvrTXsk61LXoswPvPACotS3/cIZ7Vi/zLAXi9QzA
 vMsRr0Sa09pepxue0Cbd7CHbjQw5D+QQ9MfIG7y6LzpDYHC8BJ+CONy4ZrZ5YDypq4l8
 pE8koADkJCNwGWK+UP1PLeys6oMhGizP5jQqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760380292; x=1760985092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CyHScNioNUxAqCRLSGCVsNbNpblsxmwE5o0+kKeDGUI=;
 b=iBOmBneWK3OGziuFWEeRPiqGMphIE77bR1loaSE3ZOoRu7BngBiH5BjI8jhAXxFNK4
 Z/rLG7gVLENfipT69YNKmR8ssxKnW9Uvjc8FWdPvv7k5v7d9gl8zdP2HFRmkCY8Hz7zz
 yIOl3cfAWy1NzzF2nfFXJWXMO8Hc4f3JIqnjRea9l1FNRvjBwej5Ss+0wiqeB6iNw8K/
 zSPedr6simuL+l2pi95zz/ln5gnQNFlsPLDBVNqNhnztU8ywzEjZqlZ8lpPaApo3uKRs
 Q7qSngDmn/IrpYrpIxrY6srNC4zyw/y8iC7qktmByKS9T3WYEIC5G+OX91Dyj5RC1jMK
 urVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzBDU+j7/+acA0zzJ0Nvm0fCJnUTGud+LoAsVl6fNQE0xjaJXjMVxnnQ1zHigBuhsyuAcEEmlSj5A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7fguI9nbcDiIYXdvm9pko+skHANGzaBHFB/Q+bxmdHA1b4OSE
 /ddr2CTZsaA9VvbXQrPT+HN2Xcms3YejXwx7J68bOH2Z9UMdiNadXKde+8zze/WI1ZY=
X-Gm-Gg: ASbGncsAP64oxAnpyLHfOt0Zlv8tNDfgHz5pgowVKq5vofKB9uW5Vdwki+KwNnyOpKy
 D7G01VVB0fSm6Q1SL027rgD7gzaHdMXFbv7drvcMDW+wtr0wjkRus9YvWnncWpQhVLJrTbLodtj
 ZNEleA1luG2P1MTO/LGu9ecWvoc+i+9B2EFIdTKPpuLt1YPSm/zwQo1/yS2YAaTWxaXwee3F/f8
 3bkwKyfjdUzDT9DofwG8Nd7dUL+Mcz7s/77M9Wcb9oEbtOnRd0YBnjw0aMws+9R1PTZZmJwSosE
 xxCGEDRYSOT+TmINx8rxcPKdjGRb6d4p8kN9TaymCzZ4+nykrW2VmCWgLDzqxiA6XnLndXcuBpv
 X0/L567248ucT/p4MnYkTRyYx9vqu37H5n7qrHcXAE1P4GJXS0MHAm6cTU4lJ7PvmwbiWGC62UI
 zqjW0mPMVuKw==
X-Google-Smtp-Source: AGHT+IHV+d2j74/e1G29FQZ2NJM2pqXZ75ajkDMvhMXEO7mXX2cQxMO76M1rFTKKeG0aEbIEAAVgLQ==
X-Received: by 2002:a17:902:ef10:b0:27e:eabd:4b41 with SMTP id
 d9443c01a7336-29027216505mr311772135ad.7.1760380292414; 
 Mon, 13 Oct 2025 11:31:32 -0700 (PDT)
Received: from pop-os.. ([189.7.87.127]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034cba155sm139865065ad.0.2025.10.13.11.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 11:31:31 -0700 (PDT)
From: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>
Subject: [PATCH] drm/i915/gem: fix typo in comment (I915_EXEC_NO_RELOC)
Date: Mon, 13 Oct 2025 15:31:23 -0300
Message-Id: <20251013183123.438573-1-marlonsanches@estudante.ufscar.br>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Oct 2025 04:57:11 +0000
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

The comment referenced the flag name incorrectly as 'I915_EXEC_NORELOC'
(missing underscore). This patch corrects the spelling in the comment
only; there is no functional change.

Signed-off-by: Marlon Henrique Sanches <marlonsanches@estudante.ufscar.br>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 39c7c32e1e74..7a0dee4111cb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -142,7 +142,7 @@ enum {
  * we want to leave the object where it is and for all the existing relocations
  * to match. If the object is given a new address, or if userspace thinks the
  * object is elsewhere, we have to parse all the relocation entries and update
- * the addresses. Userspace can set the I915_EXEC_NORELOC flag to hint that
+ * the addresses. Userspace can set the I915_EXEC_NO_RELOC flag to hint that
  * all the target addresses in all of its objects match the value in the
  * relocation entries and that they all match the presumed offsets given by the
  * list of execbuffer objects. Using this knowledge, we know that if we haven't
-- 
2.34.1

