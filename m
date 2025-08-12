Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B7CB21EA1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 08:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF7F10E033;
	Tue, 12 Aug 2025 06:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=heitbaum.com header.i=@heitbaum.com header.b="TkhNfLFp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F1510E033
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 06:55:22 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2406fe901fcso53668695ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 23:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heitbaum.com; s=google; t=1754981722; x=1755586522;
 darn=lists.freedesktop.org; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gQpilYnt4FgOjs5+1tewTfyxrC4VggVjH4vFHfgXSYI=;
 b=TkhNfLFpzcTVMmhxD/dRNQM2NOViubiZJsv1GUHpFi41r0hHEj0aYFPANDoAaIt+m2
 pIgFlbZOCbZV0IRtE5Yam4A+hTrZzMiOuWK/+rSlhX88QAWHfN9/ouQfjWFsMS1SnFkG
 QBcw2FIEdYHhZqgOl7qL04jp56DwGnVSv23ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754981722; x=1755586522;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gQpilYnt4FgOjs5+1tewTfyxrC4VggVjH4vFHfgXSYI=;
 b=F0V/gJCmVxjAbU+kmV6nE4RWa3GjyMHq1vdz0n1hyba8U5C4kYDjcJUg2dcg1Y0N4Z
 JyJvz8WDu2to8QcFNb17Fu3BvEwC9rsNSEv1bU1B+ODJ38AKVFeP5pmpPU4D1WYP+om1
 4mXKSP60OXNrE2hF2FB4WtwmUoDvhp6ngNQ00FtsVHsGWpdVqhgh3K2av76dnAXpbvzA
 VwJm1J6mdIQNgHiDzK6rfQq7yZ/ECs59s6t6nkyLKwIhyX7xKZ8RQ3Xscd95IT9VmfGG
 qQpChoZ6anzCwEGdhrKtfIZwkkSV9KKHWb8zx0zlptFSf/QeLtwC8A2mOivb2pKXn5Kz
 Wmcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJIHjcVx+JqoECnIdaSNFNecEnjd5CY9rhmZvkEkXwHl3WqskbemfaHoKRuT3WUNiFXkCFBdi6eyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXUpvYQxm6Ie+F+DxnsTq9msqeXfqjIMdbTjC05tzYvnSanmC+
 fFRphYbfyD+9mUe40aNd74S2GcG7YzoOS67whvG3WjUOvnQcLTmhoG6GjnFU1PfrEPc=
X-Gm-Gg: ASbGncuOVANNyjNsmlujeYfIIw5H3p+zgss0GYRQVbXKSiQ0/TVfdDQ8HbWKIkaP+CQ
 KW64bTS1tIpBhEQA992Zh1eGT8+Xmwi19LvaGSnzQreWukjGzf8XmYgBDc5F7keNxljpoiE0auE
 /wSli9EgUvfh6Jmg/LP3U8mXaFyWhzS60cA2Xbb4Mc49nC6jeKGpt7jlFqjbEv36BtU11Y9zuia
 qzV1ESJJauwShkkVH1tQHG/a70k1lvxamh2qKv5GQ4E7g1l+JiQw293H00DKmCaTP227tG+cxPb
 uDXpiz9S0oDDu87QX7v2XpKzuTjFG/iecvb77PD7BQb4j7Ngbc06rK2F6AYt2Kcd6zTFxQITZXn
 Rwa4XWkdzSXaE/YCfKaoYrGKtyQTj8zzQydAsGlJvtv8m6pr+DN+2O9M=
X-Google-Smtp-Source: AGHT+IGZE5ejnVJXLy+u8D+y8H3N4C4rUcjtSocvHp94fOPiHgfZuivNo0dcelQy8UmjKn8/qCY+Yg==
X-Received: by 2002:a17:903:124b:b0:240:11cd:8502 with SMTP id
 d9443c01a7336-242c203d160mr209522875ad.13.1754981722075; 
 Mon, 11 Aug 2025 23:55:22 -0700 (PDT)
Received: from 8eba3d7b3083 (122-199-11-121.ip4.superloop.au. [122.199.11.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24300f8ca2asm7538825ad.141.2025.08.11.23.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 23:55:21 -0700 (PDT)
Date: Tue, 12 Aug 2025 06:55:15 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: rudi@heitbaum.com
Subject: [PATCH] drm/rockchip: cdn-dp: select bridge for cdp-dp
Message-ID: <aJrlUzV1u4i65NRe@8eba3d7b3083>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Select drm bridge connector when building cdp-dp.
This was missed in previous commit causing build failure.

Fixes: Commit afbbca25d06e ("drm/rockchip: cdn-dp: Convert to drm bridge")
Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index ab525668939a..faf50d872be3 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -53,6 +53,7 @@ config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
 	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
-- 
2.43.0

