Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B703995A3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F546EE79;
	Wed,  2 Jun 2021 21:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDB86EE5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 21:53:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so2622047pja.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 14:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=294OLwHTColeKIbvM+Vxirn0n1T4QgV6EDZpTr74zIQ=;
 b=TPRhf40qFHect27NNVxe5HetAqBac8ZEqrTA6gXjniSh3j9Js2prokUdMKY1HzVkAF
 xf+7Wv8hjoeFaBhzy4ZlNv1Uk7WKURjIros/bhV+1xfc/X3fh3PR0afmqqHwLqfq6GgS
 UAm2fggL0u2uN7X88Tmj9A/BaL/6sRP9TOyPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=294OLwHTColeKIbvM+Vxirn0n1T4QgV6EDZpTr74zIQ=;
 b=ICW3os+EyXQrbRHT6ixVAq8kBRbb/+aM7JJI4rGRoZ7ejyKUuHvtEV0GCLYXtWdmcF
 MV2rytt0C+urawTPzghZsc96XnJn6sMwLt28zvProrux8LLKtDis0OSgSuG5IIU5ZUD9
 LcTloz77h1p56uRxG7cl6OzDSew5AFC77h6rPPwjehm+HA/XlF0xszXPzJJUcNL71VL/
 y2tBn/9Vm+tpcMM1o/a3NtwWwR/enbuC19Nk0shYltdiE9zMi/fsoHHbMBCYu3mzRyzT
 +hyRlOLUCIPgfzccPA1s3rZWLRaAXuC8SoQQYfrmVgSku6T7J01Kp7d0u3AaFB/EuMwD
 4rOw==
X-Gm-Message-State: AOAM532Ie6pZCd+8vca/ymrLibAUrY3DuuzVHqUNVx2jdVhnFfNhHj6O
 MgGEN0kuhryWKPXevauEMmvGlA==
X-Google-Smtp-Source: ABdhPJyDYLf1Xk/q7chv1V0jA9dP3c7q0nRFMdSazCr0Tpvc6IKLruHHQQ7BjHSxbyk6f6duIFiwHA==
X-Received: by 2002:a17:902:b48d:b029:fd:e7d2:4e98 with SMTP id
 y13-20020a170902b48db02900fde7d24e98mr32198306plr.55.1622670782179; 
 Wed, 02 Jun 2021 14:53:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w26sm646667pgl.50.2021.06.02.14.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 2/3] drm/msm/a6xx: add CONFIG_QCOM_LLCC dependency
Date: Wed,  2 Jun 2021 14:52:51 -0700
Message-Id: <20210602215252.695994-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602215252.695994-1-keescook@chromium.org>
References: <20210602215252.695994-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=b3814fe4bd33921403b01af8b87c0ad8bda4b97e;
 i=F41GiRbSdBaON2nBD/u4X1mdcnbCCx8eKO1cTn6eM9g=;
 m=lCmQIRI6GhZ9M8T5GPwD8Xs9Sn4SkeWxgYU4anLVMAw=;
 p=GXRYnPgQOHuLukoESgGOFME4H/mwNAwviL4ERy8Ru18=
X-Patch-Sig: m=pgp; i=arnd@arndb.de; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC3/bMACgkQiXL039xtwCZ8cQ/+KNj
 z11/7Hu0gAQx32xz2aL+8PMUyEZJqRMjh5EGmjm0yiQX4o3bHcTetWySoAhqwuIk0pCd3BTuP4gco
 KSpa/Z+9Jt+BynDVOQlpeHeWbyLLpdiQCkoF4pXNNhzOo+MbIuS74tCICtglNjGNxftt2fKDuVHhj
 i4V6elio1VpugMPwKfrfjYHPEdQ4372aKhuXo4spji9jt66KRthG50aWFnfvp3nFTsVMAIJshMb13
 bkAVIQIDjxmtHn8iKn/W2yvjQ7IFqE3wtOuKG+c1DUXKhm8MJI5GPVJ8IpIrFxBsjA/Yyuy3J7Zu/
 ZGDG8GnZo3Ysiilg/GJ75bufLueWnlQZfqyUKWQ5V+qP2HpvuKQtNIrO8sommNnUCJizOTYjD21bP
 Z5RXFTFdfyVRJ2Tq3SP8bhgRfZH9oa0dHTUOEw5RwgppvexPNvcN++XDxvhSCfW9MCgLHFNOeyyyi
 lZX9Q2tN4ATnUHdyqehbHl+/A89ZnEpbC5dRGManNN9tuqs0PtxNV23j+UdD0MhS+hUdgZvaRo1yv
 X5DLwoDqEZ9kve0nSZnu2ctNezGnFF+0nIlPvjl3Vj7xFv6CUrTNf6S0JcGfNeBYXLriPpyYBkwNk
 6FzbT9lJ472MPfz4K50kbiOzPdOFO6s7+H1jljAZHbOz0luWUINKZ0yTMIB82cwo=
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When LLCC support is in a loadable module, the adreno support
cannot be built-in:

aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_gpu_init':
a6xx_gpu.c:(.text+0xe0): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xe0): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0xec): undefined reference to `llcc_slice_getd'
a6xx_gpu.c:(.text+0xec): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_getd'
aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gpu.o: in function `a6xx_destroy':
a6xx_gpu.c:(.text+0x274): undefined reference to `llcc_slice_putd'
a6xx_gpu.c:(.text+0x274): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `llcc_slice_putd'
aarch64-linux-ld: a6xx_gpu.c:(.text+0x27c): undefined reference to `llcc_slice_putd'

Add a Kconfig dependency that disallows the broken configuration
but allows all working ones.

Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20210103140407.3917405-1-arnd@kernel.org
---
 drivers/gpu/drm/msm/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 10f693ea89d3..52536e7adb95 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -7,6 +7,8 @@ config DRM_MSM
 	depends on IOMMU_SUPPORT
 	depends on OF && COMMON_CLK
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
+	depends on QCOM_LLCC || QCOM_LLCC=n
+	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
@@ -15,7 +17,6 @@ config DRM_MSM
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM if ARCH_QCOM
-	select QCOM_COMMAND_DB if ARCH_QCOM
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select SYNC_FILE
-- 
2.25.1

