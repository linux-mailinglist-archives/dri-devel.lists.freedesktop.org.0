Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED21E2B4DA9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155F76E9E5;
	Mon, 16 Nov 2020 17:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA516E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id u12so12441312wrt.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
 b=lOXQP9/jWpUTVRFTXLhX/qUxrASE13UGlSufAsJNt/RZrsyQXt1Kgj/ODkG8POYrxb
 ttRKdLmv8vaQaTO570FUt6rkbqNvcuWrvkF5Snw1qKoDQhjK8AOAs9su2BJI1JuB/EZb
 Q1TX1WiamLQ6FiNETqn9/QrrR+eXntaFK0XhkR3+zIFNcM2TEjVAWAyVecWFihQAUxBd
 lOV9jjWhGmbs9Uz2AlzvdClkVdW46nM9LqPlEhUJp9iCuTgIjbIkvc58Ud57PxGCAv29
 TUlPk5GBxi8iIKWORUS5d2nTPDhGzD7fu4rq0ki04xBP3yK3SUSSa9qwcM5TquuxW9Be
 ZJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
 b=epd+vv4OUlBB/g9driM5I0uLDSSZXPPIx1SyoAguvNOrsmIazL3rR2N3lxQozGur7S
 TJqrP1y95h8CBZOsMCso8j54P8OWbBoZeZVbvxHXtHa58NIlyjC9NKdTWhs5T4iesgJU
 qai4BEZsVYzmXjt1JxdSQw0EV1S3DYOWUXZv6FzHVkX4+U1jRoQ0tqZvm+8RoQFNacfP
 cpjKRqH17fP+gxyOwgsqCOg/mVaxh0SccfP0BClVGYMmD/ClyDPbvgRgyUt9q3TLYy0b
 EwgpnKYGmOcO/x41n3Hx8bQRDvLpvLpqKbAnEiwdkwERXlyePQN4L4mtUyYeoucMhQPw
 av5g==
X-Gm-Message-State: AOAM532xjSLX311rWl4QLiJnPbTYYLe61WadaD/0NVMtPP4VU4ZaPHVR
 paJizOkaP9jNh9kLiGOMB9MRnA==
X-Google-Smtp-Source: ABdhPJzk2sZtxzq55jR9/b3VYM19OME3kQ9c0B1dB6F5OZ/+fz7NgXKq2LMwoXVd4pXK97ON956dqQ==
X-Received: by 2002:a5d:42c9:: with SMTP id t9mr19786159wrr.13.1605548487217; 
 Mon, 16 Nov 2020 09:41:27 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/42] drm/exynos/exynos_drm_gsc: Supply missing description
 for 'num_limits'
Date: Mon, 16 Nov 2020 17:40:36 +0000
Message-Id: <20201116174112.1833368-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, Eunchul Kim <chulspro.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jinyoung Jeon <jy0.jeon@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Sangmin Lee <lsmin.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_gsc.c:129: warning: Function parameter or member 'num_limits' not described in 'gsc_driverdata'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eunchul Kim <chulspro.kim@samsung.com>
Cc: Jinyoung Jeon <jy0.jeon@samsung.com>
Cc: Sangmin Lee <lsmin.lee@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 45e9aee8366a8..b01f36e76eafd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -118,6 +118,7 @@ struct gsc_context {
  * struct gsc_driverdata - per device type driver data for init time.
  *
  * @limits: picture size limits array
+ * @num_limits: number of items in the aforementioned array
  * @clk_names: names of clocks needed by this variant
  * @num_clocks: the number of clocks needed by this variant
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
