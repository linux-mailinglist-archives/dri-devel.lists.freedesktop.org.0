Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770427AB780
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E130F10E6BC;
	Fri, 22 Sep 2023 17:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449F10E6B7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:18 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bf6ea270b2so20992455ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403938; x=1696008738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7mFLDUO5Hv4nuyIM6aHVjhOJF2f1Ccv+t7gCPQABb0=;
 b=cnVApfJYVyx2AGAFVI6wsiWMjzUFeuZbSMTvfPcp0wUdJc9LA5GiFzZy2hzQtuCdOO
 lrT3/x/sgCgbtFA1tbCiE6VmvuHSBS67+/qHBBJjo4jEAhyku9sxBEte6tK77ApZcU4J
 JXqGBFlmnatDZR1LtVBc+qK4M9fnZYUZaJzmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403938; x=1696008738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7mFLDUO5Hv4nuyIM6aHVjhOJF2f1Ccv+t7gCPQABb0=;
 b=mNz9p3qZCsG3vI2qvVE4FApYFlPCsdj68loSkQVGEDExN2mcjsKUgIojTjpHaVUviw
 TiU9jvOwYzZyHEoiYJo/weiqI7D7oiJBELnB/tnb+zxY7FMsATNWEHe0KoO3od5oLJc7
 6vwGTyh4iGU5SXesIhPOJQTE1cJvgp9Q27VfWUXFhLASTnusSBGk4W3ltk0eqjHmgV2m
 E1XXn347YNWzWhW8hX+EdbgyZ1hvioNhsaWoGiGHIYfHzFT8eBvKyZ6K5IOUC4GcRUco
 KuWRl+8cKcUDNjU3v8WFAURShjBnAOAjPpTZ7fTa1NDC1igx//o3PlvKqQcv3XkshHUq
 y1Ew==
X-Gm-Message-State: AOJu0Yx2PQekAervwkaxhWLDTKCT3lzLVHa7Mmsy7FqKK2B92wWnkM/L
 BPIPdBPpT/PCoq+/tESLOanm5Q==
X-Google-Smtp-Source: AGHT+IE6F6K7CDwEaF3fHkMJFZDdCooH5rNl5USI0rssAlTS7mc8rdfuFtX4TpzsK8su4KRyBFD88Q==
X-Received: by 2002:a17:902:e847:b0:1b6:bced:1dc2 with SMTP id
 t7-20020a170902e84700b001b6bced1dc2mr224040plg.0.1695403938058; 
 Fri, 22 Sep 2023 10:32:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 jf2-20020a170903268200b001b8c6662094sm3752514plb.188.2023.09.22.10.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 1/9] drm/amd/pm: Annotate struct
 smu10_voltage_dependency_table with __counted_by
Date: Fri, 22 Sep 2023 10:32:06 -0700
Message-Id: <20230922173216.3823169-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712; i=keescook@chromium.org; 
 h=from:subject;
 bh=kCvC5X4RJuHaoweqFnQ9xMUwIDOFINcpTmqcFOUOp9g=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+dzQGoS9m8Q71IG/SluCNIy0Np4uBUNCXIF
 2oTBIaso6OJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PnQAKCRCJcvTf3G3A
 JjY9EACkZXMo7wzxY4THEhXZJmkYixLA2UlloTPXgPy8CvMUYiNLBwVLSqoh/h/5MhgdgB+pVHX
 gjEPVRbNLsQ1sMYLw31nppSpdtNmrx+qI2Xv8/FCIrTsOHuBoHSi+9nwoY2LW7IEx8xVxDORb01
 i9WnFgRMl8JlxFCnGrKgYtrWpQVCGXMfpunpsPAAmh2g5Yfkoo8Yodegj0WGJdFnSQzp2irODLS
 4fzO25EG9TH3jtCwjZItDt5m0cT8oO2gC1LVyKm/WXFfllivnEC967z9zUAtQtABdtjhtosOPHC
 1jSJ119A0nTIyM6aLwtiK32qSZA2Of2ooijB8afmhRUb5Jb+iPKwLmRnvY+TycfX8U8VtGQBkbA
 PsbT82Qj4Qqirr4cuxGVW/oAnE7XDwMh8IEHMNP1n3XOmEtlx7TVlgUKL774++kkLb5/dO90oUm
 DGOwxoXK9G23PdRFLUZ82z/F0glCWWkDrqrmKUkcKnY7rdSxGYAapRKXY6YbnmQ3EA3hqkEBXtV
 Df/r+VTS0EiXZ6VrmE54NZ2HQTkIjn/3uMxtp2UVPqb2tn6zRXFLAI85C3NUtvV2TNniYKdU/mB
 V12ppntQS4AmfEbCBhZc3biSLzO4h5eErGTnBoeVzf8NDuINYiUgr2+IDcyvEE0XObVZcrukMxP
 e9S9RTOiaW+wWUw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 Lijo Lazar <lijo.lazar@amd.com>, Kees Cook <keescook@chromium.org>,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct smu10_voltage_dependency_table.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Evan Quan <evan.quan@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Xiaojian Du <Xiaojian.Du@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Kevin Wang <kevin1.wang@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
index 808e0ecbe1f0..42adc2a3dcbc 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
@@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
 
 struct smu10_voltage_dependency_table {
 	uint32_t count;
-	struct smu10_clock_voltage_dependency_record entries[];
+	struct smu10_clock_voltage_dependency_record entries[] __counted_by(count);
 };
 
 struct smu10_clock_voltage_information {
-- 
2.34.1

