Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CF82F8CF4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03736E5C1;
	Sat, 16 Jan 2021 10:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3F16E0AB;
 Fri, 15 Jan 2021 11:43:40 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id w1so12817208ejf.11;
 Fri, 15 Jan 2021 03:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/9sksIUuZatO+aX8p4iLJ2mKZetuSFmDz0PF+YiOHOI=;
 b=YEJANZ1/9r+EPbKaQQTb3YhWamtM4DH9to+g8PWbIoYfCC2B9io/PF88pVRzv8fh61
 Wapvntn5ABjZ4BADq3kEhzYrfLziVhaprSzQD1mSf1hjsxKCDAxUsCWMtzTpTyJwZ/Ql
 2OKtFYFS//RkJM5MTRb5VHYlKtLi9PAgP2o50L/4C4rwV7bn6D8U0duHKDpPSdNh6r8E
 fybYpMd8V3cr0MKirGnUYPOuP/QV5wYCu0q7b9Pr2IZ35zwJ6tnVquuJfw/sbV7u9O9h
 oxFe7U6FfWf/79W+zxcUMZshS+fHCd56UJ7c8Y63FqlccwNeRBJ3ePAYCGUunR7p5scq
 zUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/9sksIUuZatO+aX8p4iLJ2mKZetuSFmDz0PF+YiOHOI=;
 b=rLEw5jQC37NEYVq6sqIYK55dDIN1gxAM7pWPLDLL5xCtJHV3mbR2I4mUy5sS9AwfIe
 OK/R7YLoKdrcDN4swo3bTnErz3Liyfpb2JmjAJ5Ku0PJaUQM1Y6Un1hq/hsVlQXm2kK9
 WsF0dMkqT6O9jN54maE5P+b84y8ag76y3u0h9oNx2ToHxF3QQDKORg8aNSgG6gjtdEh8
 52/m4gEDyksT0sV0yqN9FoXd9H/jAMs3MxQjlg0YPfbVVPHl/OYUJawRMHJE/biHoUik
 70DrCNcqLrToD/2+K32Qe51iyXcVKuitHHVj44JUk8oQlL8E9sEXOd66b/UdX49IV1Yy
 W9Wg==
X-Gm-Message-State: AOAM531Y0FmmCoXGhaJTW+IAqweK2U1sV2pmvhDF2MWILpAEdogBuZTa
 HnOqTiv6mbUH+f6hrLmzNUA=
X-Google-Smtp-Source: ABdhPJwET0Z8ZFGqMNHwdHfY36RdnFX6xRQgu56Fz+Cxj0NantVxngAd4EdKk1sELCE/DGiWkoU/OQ==
X-Received: by 2002:a17:906:48c:: with SMTP id
 f12mr3397945eja.431.1610711018663; 
 Fri, 15 Jan 2021 03:43:38 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d39:a000:7c85:8e80:b862:a8bf])
 by smtp.gmail.com with ESMTPSA id a2sm3184105ejt.46.2021.01.15.03.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:43:37 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/dp_helper: tweak kerneldoc to address warning
Date: Fri, 15 Jan 2021 12:43:29 +0100
Message-Id: <20210115114329.27152-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 07c9b8634fb6 ("drm/dp_helper: Add helpers to configure PCONs
RGB-YCbCr Conversion") introduces a warning with make htmldocs in
./drivers/gpu/drm/drm_dp_helper.c:965 for
drm_dp_downstream_rgb_to_ycbcr_conversion():

  warning: Excess function parameter 'colorspc' description
  warning: Function parameter or member 'color_spc' not described

Tweak the kerneldoc for drm_dp_downstream_rgb_to_ycbcr_conversion().

Fixes: 07c9b8634fb6 ("drm/dp_helper: Add helpers to configure PCONs RGB-YCbCr Conversion")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210115

Jani, please pick this minor doc warning fixup.

 drivers/gpu/drm/drm_dp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 3ecde451f523..d60e94ac6fdd 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -954,7 +954,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
  *                                               RGB->YCbCr conversion capability
  * @dpcd: DisplayPort configuration data
  * @port_cap: downstream facing port capabilities
- * @colorspc: Colorspace for which conversion cap is sought
+ * @color_spc: Colorspace for which conversion cap is sought
  *
  * Returns: whether the downstream facing port can convert RGB->YCbCr for a given
  * colorspace.
@@ -3134,7 +3134,7 @@ int drm_dp_pcon_pps_override_param(struct drm_dp_aux *aux, u8 pps_param[6])
 }
 EXPORT_SYMBOL(drm_dp_pcon_pps_override_param);
 
-/*
+/**
  * drm_dp_pcon_convert_rgb_to_ycbcr() - Configure the PCon to convert RGB to Ycbcr
  * @aux: displayPort AUX channel
  * @color_spc: Color-space/s for which conversion is to be enabled, 0 for disable.
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
