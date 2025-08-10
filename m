Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96617B1F9C4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Aug 2025 13:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568BE10E140;
	Sun, 10 Aug 2025 11:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eM3gdcMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4C710E140
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 11:22:44 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso21747025e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Aug 2025 04:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754824963; x=1755429763; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhhFXRDo1oqiT60OoNv34yNBdmuJ8HYGxW8L8Z+UYnk=;
 b=eM3gdcMYVP7QymLtmELWHqWQ36VgN+o9iXbmdOcKXb5NR7hAcr46I/XIgdbplEZIFv
 J968qvQlm7n2yxvXGf/8hwpxV89ZK6gUfStdavS57y17POw2d211HwqYdpI12tb6dmqT
 G/s1CsdOpTrSZqlKaq0M3z71t445MUaf26Q102EPGaAmmirh8/sF3zygsyq1tHoeGGOa
 zWeTEw/YwaVQq9xlBdjIgBFNH9MnUSoU6Si83WxOY8CrZmtFecj29l+SFqHe/GKwklZ8
 S2/yjgpMm5hVpDnSyje5fZP8JGvQsGKxeHXXsjrqZuSbCS8qWkxo1EEfa693EfXFUe8J
 T5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754824963; x=1755429763;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhhFXRDo1oqiT60OoNv34yNBdmuJ8HYGxW8L8Z+UYnk=;
 b=nltUu8Swstw56HzWACS4GaOlffDTouNwiULSwNVG1il3ItgKOlO5InAJ0bNzJo6kyj
 iAmkLkJvy5Bs2yuFw524jfHG6KlFw5FPPBePgZ4hyqxXDDDw/6vLu7whuqdVok+89+f1
 xnRGrNFl+UIrAWNh+3vYxVxSmclUCJwII+FP2AMNDzmUHrELAMIZUBISDOB1aTAmUK29
 ewd2rtfM2eMKKcD7Pj1DrPhIrrPEF1FAG8ep/xd3SWk1F/6LWgOEqslTcVzbcn4yQwAY
 beyAK7NJWlAH5H/+OtzfqpB+xJbIShK4j++zHr54ZMHviD3tSBzXRhmUD/9DGb9EPx2y
 /vug==
X-Gm-Message-State: AOJu0Yy/B5vx/n4CleahD72x9oMgcT+NMnxFe8Kbaf8lHp06a5NSG2ip
 JkOOkfu1dYJclMILV6Y/Hr+4d4FOfL1B7AfyCxQvdG7bv6Y9r/8qO6l8
X-Gm-Gg: ASbGncsiROK18gIoQzXZ+wOQAUm7NeKR86fxUMdO6oIBZ0j6JUPkjnHobP5J7X2/WD/
 iPABcCGnjNzElHO5NrYqi0g4UABHfTfm5Eex1U7bDyHi+ZhdHNYLif72Au+Ze6NtFD2rLqxPriZ
 gsGxUkSpfwTpLQtZxkf3KMeMrv9pWhmOy1Wc019SMCyiTNvKXYShxmD8tS23rNDRuK75VEA37VM
 bKGQk0NnnnI6tHIU5IFAAIbQFv/ZYV1mfRDh3gq+KPZszd/9sL7NRilQ115o5uTEucAoUvD52QW
 ss5bTgv/InfP3Wbi4cHqbJuFBZCd4F2sLafA5kTUOrD0jM+iX8326Z/dzNMJTNk4599RBms8Bfc
 E73Vc6ll/2uycXGulyHvxprP0LQaeWxkIQAcHTe5vbCegbetb4PQBjgdPeuD/God4ITeVuIbx
X-Google-Smtp-Source: AGHT+IFaniUBDX8gJy6ORJM4iQr4pxv5XTKMu1lZCkl7ztSeaP2EIElttBJC25j1GVEo/9v7FIJk8Q==
X-Received: by 2002:a05:600c:4ed0:b0:456:1bae:5470 with SMTP id
 5b1f17b1804b1-459f4eb4126mr86519615e9.8.1754824962393; 
 Sun, 10 Aug 2025 04:22:42 -0700 (PDT)
Received: from localhost.localdomain (109.red-88-1-15.dynamicip.rima-tde.net.
 [88.1.15.109]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f5ca8ab7sm15816113f8f.59.2025.08.10.04.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Aug 2025 04:22:41 -0700 (PDT)
From: Javier Garcia <rampxxxx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dakr@kernel.org,
 robin.clark@oss.qualcomm.com, antomani103@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, me@brighamcampbell.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Javier Garcia <rampxxxx@gmail.com>
Subject: [PATCH v2] drm: Add directive to format code in comment
Date: Sun, 10 Aug 2025 13:22:18 +0200
Message-ID: <20250810112218.293272-1-rampxxxx@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
References: <qf6xwtxh57jg6ico7n53ft7bepogeal5wfhthodsnf55eabgum@de2ah47jovbg>
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

Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")

  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2444: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2446: Block quote ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2450: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2451: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2455: Unexpected indentation.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2456: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2457: Definition list ends without a blank line; unexpected unindent.
  Warning: ./drivers/gpu/drm/drm_gpuvm.c:2458: Definition list ends without a blank line; unexpected unindent.


Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
---
v1 -> v2:
      * Added the proper Fixes tag.
      * v1 https://lore.kernel.org/lkml/20250804212902.22554-1-rampxxxx@gmail.com

 drivers/gpu/drm/drm_gpuvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..74d949995a72 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2432,6 +2432,8 @@ static const struct drm_gpuvm_ops lock_ops = {
  *
  * The expected usage is:
  *
+ * .. code-block:: c
+ *
  *    vm_bind {
  *        struct drm_exec exec;
  *
-- 
2.50.1

