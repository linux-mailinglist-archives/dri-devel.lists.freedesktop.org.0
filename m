Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C567ACE840A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2370B10E740;
	Mon, 29 Dec 2025 21:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Iq0zqbRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com
 [209.85.210.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863F910E740
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:50 +0000 (UTC)
Received: by mail-pf1-f227.google.com with SMTP id
 d2e1a72fcca58-7b9215e55e6so5795438b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045590; x=1767650390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eqxbMiL7ohe4dc/pwMvCfPcqWUGF7TjyIlnwnpMs1gk=;
 b=SaFswl0bhN+sHP+OPlA9ueuHqNaRlT6jR2M6oET/gDXjXiupEpck4CAyeTwEbR57m1
 Xey8LPRd+wSuyGbMzDefUQqT1T3HEJS4Rgd7Q5pz8Dv+R9hGm+kxMIaluNsAFpS8Pog+
 QAbwLfsPQLlPn77zLFfFSy0f9S+n5b/o8qEDd97IC5Pt9tPgbZZWBnbNc9h9+Uo0PXbA
 kf1XUvQDA4AKODPCJqGXvnRAkslmRDILkMk+H5A5xAAbbrrijnHLHnsPEcA7esEUahZz
 k9FMdzS9bbAfsWz9pVtvApRY78aog1lK+qYCJbrHjWR3ktdmNzd4s5VwVHfbX6M7KgZm
 eTZQ==
X-Gm-Message-State: AOJu0YxMpv6Eh0x6q+cz6+I1Ro8NehGft9SKBfT1GNcb1bLPotGK8p8A
 xuNve9UlU8ZGe516InNr30orcj6+s/sG4iokVfQ1rLrOdpxeOvL+6xm9x1NENDtN+SptUAX9R0i
 63wVnsCiAB+LxNn6gWNZmcLyyfuKUMbzlUhJR3+GLMxlR+1E+hxNgxo1yILC+38dc0wWKGlY5fZ
 AKx7eiUpR82VFO0T4TPmbJAgw/DtjKShP3L9gZBBY4qGtu0HIa0TRxyINETDlnUKydP3qXhB4Id
 OLM/sw0MMIE9S8osa1r
X-Gm-Gg: AY/fxX4s3u3zEfoBJijnhvTX5sMR4kKjl6Nuf4zcdUbTc1ycO7o7U5zA/6yRClcYgVy
 kCBRw+adyuje2wxVT6No/emRaGnOVcWl1AVNID1Z7QG7xU2p9vRWeauUOeSJoLE+Oyha8tq7v0E
 LQ8KYTlRpPkM5cG/gmYXjpxzCok8eWCIEmkNYJ3OdZ7z38ubxazExOHfBDMLUousxSHBMZJJ7cl
 EqAixKjPkhHxPg5BFZIqwqlFFgVfo7qc7R5ESeJwDr1YZm0qh0gQm0EyBujZEIDFDezmcBLjpab
 5nH8aKf1Z81wSR2h+qwo/nk8C0nSxbiKyIYzdWDrySNd5h6yRVtabQMn4o1JVnwALUcDueXGJLd
 01s6vUcyoO17yW8dFx99iHcbTTDdulISSai0iZ4nIcKhaZMdkowlhoZFY1sSCmGYJ+T8JsDXdj0
 4sg7eh4draADGn0gaRe3b7B1mtRuWaRuvSDUBPEho4EAQd
X-Google-Smtp-Source: AGHT+IEVAp50O0lUkTjkL/h2dACVm0QbWeIeC60bGjroVcdzc3rCPMT4hxOK3VVSrY8Q9fcQbjaCcuL6BB/t
X-Received: by 2002:a05:6a00:1d86:b0:7b8:7f5d:95aa with SMTP id
 d2e1a72fcca58-7ff64dcd5fdmr28689502b3a.27.1767045590022; 
 Mon, 29 Dec 2025 13:59:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 d2e1a72fcca58-7ff7ac2818dsm3557957b3a.1.2025.12.29.13.59.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2e2342803so2213604185a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045586; x=1767650386;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eqxbMiL7ohe4dc/pwMvCfPcqWUGF7TjyIlnwnpMs1gk=;
 b=Iq0zqbRIZSL0AvPFaKhVU4W2DP4DTuTpV/Ggos+mufsNE525pVssCdCFZ11ooTxKKh
 NgrmXaPtgFx+ukEeDAUwthLnTf0s3m4e2Bt+cg2ueLWogAF95FBJsMNYhddkVV4LTdYu
 vwegevyZj3fn5Wmnr59XLtd49N8BA7jqUnAj0=
X-Received: by 2002:a05:620a:44d5:b0:8b2:e179:feb7 with SMTP id
 af79cd13be357-8c08fa99a77mr5321268085a.49.1767045585932; 
 Mon, 29 Dec 2025 13:59:45 -0800 (PST)
X-Received: by 2002:a05:620a:44d5:b0:8b2:e179:feb7 with SMTP id
 af79cd13be357-8c08fa99a77mr5321265485a.49.1767045585459; 
 Mon, 29 Dec 2025 13:59:45 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:44 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 12/12] drm/i915: Use devm aperture helpers for sysfb restore
 on probe failure
Date: Mon, 29 Dec 2025 16:58:18 -0500
Message-ID: <20251229215906.3688205-13-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

This ensures users don't lose display output if the i915 driver
fails to probe after removing the firmware framebuffer.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/i915/i915_driver.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c97b76771917..f9efeb825064 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -506,7 +506,12 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
 	if (ret)
 		goto err_perf;
 
-	ret = aperture_remove_conflicting_pci_devices(pdev, dev_priv->drm.driver->name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	ret = devm_aperture_remove_conflicting_pci_devices(pdev, dev_priv->drm.driver->name);
 	if (ret)
 		goto err_ggtt;
 
@@ -866,6 +871,12 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	i915->do_release = true;
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 out_cleanup_gem:
-- 
2.48.1

