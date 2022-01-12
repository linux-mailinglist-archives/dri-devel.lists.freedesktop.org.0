Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E048D3A6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EBD10EAA1;
	Thu, 13 Jan 2022 08:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5217510E2C1;
 Wed, 12 Jan 2022 22:34:38 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v6so6787080wra.8;
 Wed, 12 Jan 2022 14:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knIFhEPhfZRBuZTOWy2YoocQvDBEb01Xkzu/MBiHudY=;
 b=IrTw6c8TuH4d7FJMVb7Sqkdgr/UwcfRciuehALfn0X6nuBK0a215y3aD0OhL6nzOhJ
 X8WNL9e1EOtkp2RTv9+i53s8+HVdAxmeGRytTInW5UPaB82P0zMbKdY5expW8+3oVNPf
 JzUfm4iAkd7RDI14MdcT9wByb1VhVUYhmMWSfc8NAK11OjEx/7b1gyHwfOJTl/sf6pXN
 NxMuMUG7GWKdT9d251RK1dEdCy0Gwuz+0vVZxi4X6rwK6S7wykzmnB83l68RJ3c6ZI3a
 Fl0eKh9qKx4sL5h9qVcAB9kOSxmJMXGkLZxVGV9VYkIrtucjDlmPTMD+3Pv2ESnuIpWr
 KvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=knIFhEPhfZRBuZTOWy2YoocQvDBEb01Xkzu/MBiHudY=;
 b=jK4ZgILHrRgcOQSKlUv1G9yM3xpVZe58WE9nuTxw6aGkV72eCG8ZyTg90l2PgMFI2u
 6WFBYnN+FaDQLH09jh9uUYn+qa7e9qxac8RiYcyVQs46qepCxUMxdxTNL+qiuI6l2bnL
 PpIhzLwI72ebSSZ6v58I2E4Uz8vPmFVYSvpoVr1fCMi8iMrgs/phwndpf8YBJ+aooeZK
 6bXtd826mmkvcT1rSyQfbBa/IQRlobJaBw4J5VNvveGZRQnUkI3nGCUalzoKy4ulk/wB
 afuvTnRrVP1K9kXu/NilATMu+Dk3R0LoDZEOCLY7Hxmx0hnC2iVRWfaZbYE5HjTWxGIu
 NpYw==
X-Gm-Message-State: AOAM533Zu9UNSHmfO7jaZnU9Vhdlsruit7/tNjjAnZIRLMVqYyZNAm3q
 vdRgb+M6epjHl7shmMAyd60=
X-Google-Smtp-Source: ABdhPJxr/dAp9kzCv+bTukUeT+ztHH20geBsaDAWgypGoftD/nCcRzpS44AXqFTAojplHX9JaTCfNA==
X-Received: by 2002:a5d:5848:: with SMTP id i8mr1516628wrf.398.1642026876895; 
 Wed, 12 Jan 2022 14:34:36 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id t15sm895597wrz.82.2022.01.12.14.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 14:34:36 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][RESEND] i915: make array flex_regs static const
Date: Wed, 12 Jan 2022 22:34:35 +0000
Message-Id: <20220112223435.949071-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jan 2022 08:32:04 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only array flex_regs on the stack but
instead it static const. Also makes the object code a little smaller.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

---

RESEND: Use correct e-mail address for sign-off and From: in e-mail.

---
 drivers/gpu/drm/i915/i915_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index e27f3b7cf094..df698960fdc0 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -2114,7 +2114,7 @@ gen8_update_reg_state_unlocked(const struct intel_context *ce,
 	u32 ctx_oactxctrl = stream->perf->ctx_oactxctrl_offset;
 	u32 ctx_flexeu0 = stream->perf->ctx_flexeu0_offset;
 	/* The MMIO offsets for Flex EU registers aren't contiguous */
-	i915_reg_t flex_regs[] = {
+	static const i915_reg_t flex_regs[] = {
 		EU_PERF_CNTL0,
 		EU_PERF_CNTL1,
 		EU_PERF_CNTL2,
-- 
2.33.1

