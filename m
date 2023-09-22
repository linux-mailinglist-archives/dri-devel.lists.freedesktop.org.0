Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6202C7AB78C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBB310E6B8;
	Fri, 22 Sep 2023 17:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C750110E6B2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:21 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so20612655ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403941; x=1696008741;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWOiU92ExO1tEuVJ2ItejZKQh8uiQWENZYmfi07W000=;
 b=PF0J1Sdwf9lSottLYAulcsieWHzI9aZOO0JPDHuzOtlhgsYdqjp8UF5Vv4wI5o6tEn
 p0DKHq7AnBy4YWUSH9mzATLBmUcUO+u9EEfSI7PlF8PtsIeV4t24nNSSDiweS3bCoMJK
 8NtiV/5G2CNFVNzZCUGxPVmsgxIzNEBFnhVo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403941; x=1696008741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWOiU92ExO1tEuVJ2ItejZKQh8uiQWENZYmfi07W000=;
 b=Q+P+cyY8+LqHXDtWYfd57qDkyo7jO09HhaMBx6QE1yy/dk0kGsaKdcZtVZmqBfO6qb
 22fb9nilkhlYIQtCjlaAEJvgNT8cfJGzgXGxW/CjfqwIs8SOcr1vgymFs9w+0CeQVIQb
 BkDT1YAA7xKleL8UauKJNEVFvsu9fCYepm2lPNyKzkzIY1lbiQTkImb4HogkIf6JoGhR
 xuDNP1EnRe4FGYPQyX3ZFyB4yKetoZ7J9hgGTzAU2wMBX0EoCB5D8/wrfNsEVHK0H/XL
 XLu+4nsdlcAWHoUCJqe8wePkoA9nRDJTk6AFkuSYU4wb1t2s+bgNse8hE533md8H3KfA
 dKjQ==
X-Gm-Message-State: AOJu0Yx8Y/iqxC3K+C90ZWpgDsvJAP7Gh+Q0DrH4d9WLPH6F+AiJfQgs
 9/ewJ6vvGY7XRwgs6ObR55MzjA==
X-Google-Smtp-Source: AGHT+IHozbo6RGGEOfFNm2quF7eyhyB1jYnKoC2EoQE9eESJOC/u5eL19BCqbdONa5XuKmexTM0hYA==
X-Received: by 2002:a17:902:e5c1:b0:1c3:d07f:39f7 with SMTP id
 u1-20020a170902e5c100b001c3d07f39f7mr152502plf.62.1695403941371; 
 Fri, 22 Sep 2023 10:32:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f54600b001c5f7e06256sm8967plf.152.2023.09.22.10.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:19 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
Date: Fri, 22 Sep 2023 10:32:09 -0700
Message-Id: <20230922173216.3823169-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=keescook@chromium.org; 
 h=from:subject;
 bh=xDkJWau6qmNIlEczl2n21zh31yaWnnGb4ZbtRzkDM5w=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+eutUHe9SLnXaUpaJySdpFne687ECfxzj9x
 c9gWcqZLYaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JjnbD/9OQiE+N5TDN74IQPEo9SgzH0oAvZBxcgjjWQ+yn1SxoSDB5LIrgeGtiyQGvx7BYlpt+Mk
 MT5bPfHehA9na7K4kzqg9quYRtDWvIN27rP/uwZxsg6q5pZKW93YRamZq1G+itcAKW6RA20Gl5L
 oXzlXw8xjsnhIYhIM57Pko4wOg7e7p9M1OFiWoZvPmi3jXsn0iVx99yrPXIgM7uK4j+SGaJVO/e
 Db6B/ovadEGxmj6A5SpZjflvdzGUHbCnD/wxy8R6PCGroCHj+rG2bB4Bzu1Bz+aXu2YhIKPBoAr
 CfA7YAuzv8p7/Dy4rMzzOl1WMQu/T5Rh5tIJo2Eg44ksRdJK4w4OJBgr+8wPd1dntiatR4Ulsgn
 ZfRzuaLWVaPb+FcgFpd7LGX/chEK+f5iu5eFguQ8F1ZvI4wUYZ1dYV0HliOOkBFszZQ42WITuND
 M88ZKBxyD4ccXy0nUhHCMZsLs9jr152hzbB82sQrCyl+qJ7p0yYLaHOjzT6CRZvzNUXk0DrXNdf
 cM+AdoWXZHFWhEsT+HLVIWg+oEAfqN+3W2w08etC077cqQ4Kj366BbtIh2HIlNX7LYF3uztip5O
 Cy/EA3VNLkh7U/Gwv7/PDy6HCSs6sJ32cEGquxZ7iLKQf7SPjcZHlBvml7AJOep9Fs2EukYfNDz
 1KplYtpYhU7H+uA==
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
 Lang Yu <Lang.Yu@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>, freedreno@lists.freedesktop.org,
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

As found with Coccinelle[1], add __counted_by for struct dpu_hw_intr.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index dab761e54863..50cf9523d367 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -61,7 +61,7 @@ struct dpu_hw_intr {
 		void (*cb)(void *arg, int irq_idx);
 		void *arg;
 		atomic_t count;
-	} irq_tbl[];
+	} irq_tbl[] __counted_by(total_irqs);
 };
 
 /**
-- 
2.34.1

