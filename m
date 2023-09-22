Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 164A27AB794
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0B710E6C0;
	Fri, 22 Sep 2023 17:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753F910E6B8
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:32:24 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-274dd099cd5so1798430a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695403944; x=1696008744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTtgeSpUdLuurLr/un8bnu1axQ+1dpOqA/3ccL3TFAo=;
 b=fGBlTUKhjnY7e8ac/nUBK7kmFz+Z3rj69KUYq3D+x6WsQRa6+dRGLjBD3nbvTbSuek
 0AIDqdEtHLHU3A50opM+CEoZ+oOwzdU1BkQm/XO6x1b4Kq2Uu/GlNjCBKWDxBDuwzvtK
 0J7tGTT6O/FI4Qro5KjAD6EITvNg7hJdNj3kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695403944; x=1696008744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTtgeSpUdLuurLr/un8bnu1axQ+1dpOqA/3ccL3TFAo=;
 b=EPGh6eucN+ygVEXSJfwQColP2m010iWFSm4aXbWv04HYX22BeBJPu2aK6wiPNrgZPU
 STzjlOgqyxyDnj27fOdtplpbcgFeryDMMXWtMkdJDca4/KOV/g4kTvFzVpzqLHx0ut3N
 TQ8+Y57VA5lnl4qN/1XwAtRG4/sfWwakI/RUuuugwW5QZCsH0dmkemiTM7kR3JQqP8uQ
 /yL9vYxHITcjvCqSuTfcRtftGf2Kf4qlhMmJwHnwR26EpDlvM8EVa/59KpoCN1p0gtKX
 KnBVnQvQvjWFSW/p2QSWXlH8r1A4CewHn2zypmhgmxBC4q/LUJUXsQTLdf0QNvLPR4NK
 2kLQ==
X-Gm-Message-State: AOJu0YwVLS2sznMeqGkI0BAhF1pEVH3WOaHiPs4Ajy68a+IYjySXcjPv
 ScLonpi0wlYrAtJbdnilJAYBYA==
X-Google-Smtp-Source: AGHT+IH1kOxHRj7LaiNXbzPksDVzBRenY9YKDNpSK1EEyPL6u9P78p9pejQ3U+rxat+v82Jd4FEuCw==
X-Received: by 2002:a17:90b:128a:b0:274:729c:e4f with SMTP id
 fw10-20020a17090b128a00b00274729c0e4fmr390309pjb.15.1695403944032; 
 Fri, 22 Sep 2023 10:32:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 c4-20020a17090a020400b0026b26181ac9sm5637279pjc.14.2023.09.22.10.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:32:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 7/9] drm/virtio: Annotate struct virtio_gpu_object_array with
 __counted_by
Date: Fri, 22 Sep 2023 10:32:12 -0700
Message-Id: <20230922173216.3823169-7-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417; i=keescook@chromium.org; 
 h=from:subject;
 bh=eZm0aznK0m8B2PZ9kKPoriymoURbDsQWuTqSiG5Zn6g=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+ecN7AHVyI0F/T2hAcEM09nm5XXW5LLfQTE
 HSHvLmbqbqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JmrOD/wOpyQVRHrGQGo8XfD5jMBVmYMEWa7mtPz8TQHyKwul0h4DAnDuY1syEElYvTvb0qCuTg6
 YHpqfYbVJonRUjUd83cqsdEqsNMRkx8ryd+FwIwDMcHFmp3kEWfg5s9zyJpQlhMbIA8qRhFRzp6
 1nctWnxSwK5Y+R6FATebIjhT9U2Y8CD6khRnkG9NQuimrbhgcl/f447wIiYiu5X7idIzuMwSDFR
 Prf1JJwDz4YkxahRTnX8WrJXhYUDJjWqyw7MOMkMW6ybVBIL8ie1WLAZlKfuNoq/ypItBU4eAMz
 +BDqWKau3tdzcpK42SAJNB9SVOIvsM8EHP5boshP1NmOAEdUKG8SXMJr6bbYAfFt/Zdk5ZmYfpJ
 Yxipt98I+ZRxsbNFS4Y+4kVDYW0QBySazXXvWa8U736thID88na3V/aHvwB4Ql0tKp5Mk3oaHjZ
 VIJkT0hMJ0c+tnjLvg6pHMeQM7yKNB+s0mGuL84RFj6OyWPATVyWvcrsQ/dAxuy53EitcBlWyzG
 OhHlG4pbiUAIcoN9Kju8k9tthCpSQohkyEr1pwg2o2OfnyfTD7GoFuTt85RlHxHFcx2PYl1nV2x
 FeRCY+2qIpNwX19xvQ8Lx3Vt8SeFDNnJWY5M6UFCEs1Kyk4337zXOTTH+xiGEYKfZpRPhfZZ+7Z
 CzpyiCN8tLdjdOg==
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

As found with Coccinelle[1], add __counted_by for struct virtio_gpu_object_array.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: David Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 8513b671f871..96365a772f77 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -119,7 +119,7 @@ struct virtio_gpu_object_array {
 	struct ww_acquire_ctx ticket;
 	struct list_head next;
 	u32 nents, total;
-	struct drm_gem_object *objs[];
+	struct drm_gem_object *objs[] __counted_by(total);
 };
 
 struct virtio_gpu_vbuffer;
-- 
2.34.1

