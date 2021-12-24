Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554847EF69
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 15:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404110E465;
	Fri, 24 Dec 2021 14:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B97410E465
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 14:12:38 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id u16so6718100plg.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 06:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ClX7KW0PIL7QXcserN/OWxZM7FB+UOOy301ajqBt20I=;
 b=ZUqAD4m5ScwVopUxBc6DLY7Xt0JjjyzBfYAaiDsazvwTg2iWTb6HgGWxYs+lXWOHAL
 uN9lwGMpVv3yLVpD9C/jZD+fjKh3ggrzbjvwu0wG+Jj6uiyqKWWh6CObPXUqteze5E1D
 fxFX+Bi7sOxebqf+nPH64N9ODdT1r9Q/b+oBdXxwo+HroNtx2HfN6oHzyksuf71JCoi6
 5Kb/5XIm3hrDeriQE8RJvPpBKyoTakXXm6LJAltmqBRZb0dGq+1uBWFJyX4tTkRMkbiF
 vm+zWn4DlOYz9hPLBL6soiErO8Jrhd++b9O98ZqsQwisn95SKAoJUM5q8lsdtvU0c7wi
 9s8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ClX7KW0PIL7QXcserN/OWxZM7FB+UOOy301ajqBt20I=;
 b=cUBa+hDvG12qRR5Q/GSODhjNyo0/GHqeyVO3sQCgOzely1206DMCUmDGbZ+3XIhbQ7
 oIUWEBwxx9C1pm+8xrSeDTENcuYywZes1QRKJDPTeDHLrGjqv674r1dAzPipN9WN7ZN7
 0q+MV2uvQ6sZA2uZDjy+24ZSapUQoEuRs/Ba7yn1PetzyIehMJBHPlLw0JkfgEjClnLX
 xUNgjM1hxsDQincMMYdzSSb7eiMpkQCCEuavvT2kF3/EnD/goGaf0mJkQBrH1sFP5o0S
 BZE3dYz+bZqzwnhaFe3wmR2e6H88sp15ZLq8zE+xv3fqlYN2f2MSImjJNZ7b/8ewUKGx
 TgbQ==
X-Gm-Message-State: AOAM533zi5U2JOlmuKxg+rMW9etlZ/3G003ZmWaIE3Y6h18vNW7Wlgsl
 xVaS+d0vzYcxiYPTkEIw4xo=
X-Google-Smtp-Source: ABdhPJxKkwwAvZhs9Lkj79rNrg2CWQYhRbSsolinHSrGYZ+vjmvJlZ0d/O4wP2XHb4cp8c8ue8/aZw==
X-Received: by 2002:a17:903:300c:b0:148:ac76:b30a with SMTP id
 o12-20020a170903300c00b00148ac76b30amr6725636pla.125.1640355157681; 
 Fri, 24 Dec 2021 06:12:37 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:800:94db:99e3:c3c:2dfc:8554])
 by smtp.gmail.com with ESMTPSA id h7sm9919140pfv.35.2021.12.24.06.12.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Dec 2021 06:12:37 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH v1 1/2] drm/sprd: remove the selected DRM_KMS_CMA_HELPER in
 kconfig
Date: Fri, 24 Dec 2021 22:12:12 +0800
Message-Id: <20211224141213.27612-2-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211224141213.27612-1-kevin3.tang@gmail.com>
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lukas.bulwahn@gmail.com, orsonzhai@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On linux-next, commit 43531edd53f0 ("drm/sprd: add Unisoc's drm kms master") adds the config DRM_SPRD,
which selects DRM_KMS_CMA_HELPER.

However, commit 09717af7d13d ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") just removed the
DRM_KMS_CMA_HELPER. So, the select DRM_KMS_CMA_HELPER refers to a non-existing kconfig symbol.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/Kconfig b/drivers/gpu/drm/sprd/Kconfig
index 3edeaeca0..9a9c7ebfc 100644
--- a/drivers/gpu/drm/sprd/Kconfig
+++ b/drivers/gpu/drm/sprd/Kconfig
@@ -3,7 +3,6 @@ config DRM_SPRD
 	depends on ARCH_SPRD || COMPILE_TEST
 	depends on DRM && OF
 	select DRM_GEM_CMA_HELPER
-	select DRM_KMS_CMA_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select VIDEOMODE_HELPERS
-- 
2.29.0

