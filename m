Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18F431258
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142BE6E995;
	Mon, 18 Oct 2021 08:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F8E6E995;
 Mon, 18 Oct 2021 08:43:37 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id np13so11698339pjb.4;
 Mon, 18 Oct 2021 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/sIT4umqcrgezmo7NeKDo4pD3l7TGx1ShKleFi4zvMg=;
 b=lXrjdjy9g+sP6tVwh3R0LbFpvRMw0iCGBp/+3otwIDwVuLTV1rO74j9MnDfjuh5M3Q
 fNPJe3SkENcfuVJExXQfsOZwhFHvJvz4mbANfzRXJl2MpB3Kn3mzEIwEPrHXIPEazqXL
 Ex3O9KwPrnrWvwHVCa2PLdrQZaqLPXHKNs0Sbeq8DN3AXirhwYKRwU98oP0L1kKgoBAi
 pN7UJX4sdSu4a4iM/pMveiGmf2u/yxkYBhIBnFOvvatcBxvu53AVXtWkuMH085L0WA2g
 qiTDZ5WFGShMbsmqo+GPO98HKItWZexk9yIeyPi/lp2mVDVXIMk2M07vkTqTa4sb1TV7
 2fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/sIT4umqcrgezmo7NeKDo4pD3l7TGx1ShKleFi4zvMg=;
 b=KoGvDMU+8e42njJx0gCWf0dwUj60671Dkg4s5IQ/yCJiN2JMutL1OiyDHVCfMPjoPi
 WripjPYsAzOLBuSombn/acKohatGfYZ0rEolt4YhuRUkp/vz3Tjrhmw3g52GBUcD+IHc
 ujn08J150j14FP5aLm3tqskICHsmu69xXgoz10ZocLfUm3BRd+vRQhKwKDcdrkd3ighP
 d9NKSKrw4HN7NDEVXY2WC+PgCu1j2mG13fSuwPuONRWt6a26UukrBP1JOSfCFS0u+kFH
 1KpDosNe/Ex2v5X5STjd/oapEV6q+uWJCtuQTcgzMooKVqMqo50aDnIPR0B4D0gXA02Y
 rdUg==
X-Gm-Message-State: AOAM530pdJ/zvZoWhACAyEU9Fs0ezy3SlTKovevyPG/fXK7/fhjWR9WV
 KyMTEHMVNcPq7745B8Io2XGDYOfo0a8=
X-Google-Smtp-Source: ABdhPJyXe3WVogvoDfLeXoKli08zF7MOl0pG+v3UNaG4cNfHsYezHxB8MJjkOAYchUOyIYllZuWSlQ==
X-Received: by 2002:a17:902:ed8c:b0:13f:136f:efb1 with SMTP id
 e12-20020a170902ed8c00b0013f136fefb1mr25827200plj.56.1634546617391; 
 Mon, 18 Oct 2021 01:43:37 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s14sm12356974pfg.50.2021.10.18.01.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:43:36 -0700 (PDT)
From: luo penghao <cgel.zte@gmail.com>
X-Google-Original-From: luo penghao <luo.penghao@zte.com.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luo penghao <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/i915/display: Remove unused variable and its
 assignment.
Date: Mon, 18 Oct 2021 08:43:31 +0000
Message-Id: <20211018084331.851975-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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

Variable is not used in functions, and its assignment is redundant too.
So it should be deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/i915/display/intel_dpll.c:1653:2 warning:
Value stored to 'bestm1' is never read.

drivers/gpu/drm/i915/display/intel_dpll.c:1651:2 warning:
Value stored to 'bestn' is never read.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index b84ed4a..28b1616 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1644,13 +1644,11 @@ static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 	enum pipe pipe = crtc->pipe;
 	enum dpio_channel port = vlv_pipe_to_channel(pipe);
 	u32 loopfilter, tribuf_calcntr;
-	u32 bestn, bestm1, bestm2, bestp1, bestp2, bestm2_frac;
+	u32 bestm2, bestp1, bestp2, bestm2_frac;
 	u32 dpio_val;
 	int vco;
 
-	bestn = crtc_state->dpll.n;
 	bestm2_frac = crtc_state->dpll.m2 & 0x3fffff;
-	bestm1 = crtc_state->dpll.m1;
 	bestm2 = crtc_state->dpll.m2 >> 22;
 	bestp1 = crtc_state->dpll.p1;
 	bestp2 = crtc_state->dpll.p2;
-- 
2.15.2

