Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EAD7AB7EB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5BD10E07E;
	Fri, 22 Sep 2023 17:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD2910E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 17:42:14 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c3d8fb23d9so20926895ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695404534; x=1696009334;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gDHDeV42Frwj7XYTpJqGl5ND8N8KbUFLGf1moqK0weE=;
 b=H5rVU7q3a9U9oXDmRl+d4VRrSAcCrDJaXnwoic3MiG7AKklx3GvFvVKfJS4Znw7Jle
 cC5YG31DUO5iRxLKEXjLTeR8U572/gXy2wyZgk0KYjfnD3SrWq1yxNGQrEraQyL8sZ9a
 TDppsBoeyOotkj2xUVrdfONhDK1YgxlrVGGhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695404534; x=1696009334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gDHDeV42Frwj7XYTpJqGl5ND8N8KbUFLGf1moqK0weE=;
 b=hGBp7Rf29Fzahpe4AnamppnMQSNFnyvLe3XklsNeMX16j22msFfmKJLV64JKFBkUHs
 tSZZT4rmr+MPImggcDwHwpm40E96xfxZkPSTzatpBaMaoFTDjhteRydIBYFjsddHv9mT
 0Fj3o23MKaAOPBceyGQAsvrzkTn4JG32FMiH7ALlY6IYdGenVqiTv8yMR/bg0emhJj5q
 e2V9UcOm2NiW/nrTmC4FU4BOA1jH/tTKJZARoMGHmnYTBKXYLbNNs/iwg5PXaURbqXFS
 XzrZvi2dk93jiaCHmJe9qm99u5cvlCCe+l3kewpsIEpkV16f5/GMFK76cnZ29Ft0lnNj
 Z5ew==
X-Gm-Message-State: AOJu0YwznNtT2OanFtrxt36vtgPf0o73DdjTNNeLIjCqb8GiIgPP24uU
 LO/jl+bIqVEDPEMUj5v1Ip7LcQ==
X-Google-Smtp-Source: AGHT+IGrotoWlyQLkbK6Whf4OiNGUyhA4I63WbY8Ewuxyx3hCVqXIcaVt+Ft6DWt7mPQfxETuKi2Cg==
X-Received: by 2002:a17:902:f812:b0:1c5:6f3c:94fe with SMTP id
 ix18-20020a170902f81200b001c56f3c94femr128683plb.69.1695404533773; 
 Fri, 22 Sep 2023 10:42:13 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170902b78300b001bdd68b3f4bsm3751544pls.295.2023.09.22.10.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 10:42:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH 9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
Date: Fri, 22 Sep 2023 10:32:14 -0700
Message-Id: <20230922173216.3823169-9-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=keescook@chromium.org; 
 h=from:subject;
 bh=SnNIrp1FHi4lB0nFNYirvVw5/7/jvEw6i/lP/RJRA6A=; 
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDc+e3L4G5PZF7SaBMxHwj62ZCFc4FzMHTqhT9
 tfDr8MgF6uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3PngAKCRCJcvTf3G3A
 JnkWEACXtjUq16fS873Hx8yyB8djpvoH6XVS+/OuSPCo2t7GIoIpy1zBkPiH2Ei14JMNlHdMGGy
 8yOKrl1rGoQOP3jjY04cxJWy1h5uFFHAxW6VGYIBsbbFRIqAXuVC4UKEN+qYZ97MTJmwc0eHVdX
 Z441sTRctCLNHoMhSAQn6O3TWU2+/QOV8cz2Ls8cuKVLErRruCIa6OzHgGSnhC5Rq1OWXZyJNiQ
 1aWVoVn67WL0VqIe3RW1cZvMnlWNTbgZP1DUee1eLb7MmfT7XMLkW6Jz/8rTfAeSUSsLhxKbIcO
 ZpXIWrrfcefYP4Dz3BMU6z9OLUAHdpdLEnnvQyDviUPLmbRyS5mdJpKrC9XT7FTANcayQSTonRu
 M12CaA8ASNf3ak1iu7o4DhTMZeHyb2Wpz2kwj4Nyg6YzYpRNC2gtRkBRdxIJn60r90kd27Yxl7Y
 Hb+w/DnzIvunJlaIiKWIEE9lJfyZWF2fgi9gcXtI26HlMj/Jn9jmdHnLwh96IqxloMmooRdvULL
 NK01ICP7mB/XJ36KSBZv5ss3B5LUV9OwyC4T2xpvqKmG/iSr65/EUsg0AYInGQ5v0STKkN7TYFV
 abYOWvuq0o/pltuNX+Gpbsn9+VvBaxhF2CeSHtOP8ARhgkctRhQJ2+OhqQ35i3SIQBBSkeCOxlL
 2y59f7fhlJo6LCg==
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

As found with Coccinelle[1], add __counted_by for struct v3d_perfmon.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Emma Anholt <emma@anholt.net>
Cc: Melissa Wen <mwen@igalia.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7f664a4b2a75..106454f28956 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -59,7 +59,7 @@ struct v3d_perfmon {
 	 * values can't be reset, but you can fake a reset by
 	 * destroying the perfmon and creating a new one.
 	 */
-	u64 values[];
+	u64 values[] __counted_by(ncounters);
 };
 
 struct v3d_dev {
-- 
2.34.1

