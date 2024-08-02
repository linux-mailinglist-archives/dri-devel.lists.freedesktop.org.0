Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A79458F7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 09:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58ABD10E06E;
	Fri,  2 Aug 2024 07:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="1eMnAl2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F339710E063
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 07:06:07 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3db157cb959so4917454b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 00:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1722582367; x=1723187167; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TTIBsGPtfu1Pgb8/bR61xHSHCNQbyXzi1cZXpHVQwvs=;
 b=1eMnAl2M7tLpUHNvb9S9K7iG/PLuozt5QcT9lsDPA33Kc+Anj9AI4OEQ00KR+/+mr2
 JP68YM3sOhK41hU1N4i8auH5nf0MrFVGwphoRTdO0HLVmSPiXYtnL7iUMwjgrAfE28yy
 REWNFWxbyGgvhRfZ38ddjBs4Ies7PFi024lJC+965avTpitHOnOn30x/2bLIBdxFuuuG
 v0dTNXdZugkVtQXYCZF3XuvwwKK77aP8WIbkAXHxQH3wmvzqIGhXr6xMyfnaNhl2jYIK
 FFsK7a1JIKBTJKhFBuc8VyH9EKuGv5gi1EcWvSImIUKrZ/x4Iso7O8Eldkmw9Ugy8EVO
 3g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722582367; x=1723187167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTIBsGPtfu1Pgb8/bR61xHSHCNQbyXzi1cZXpHVQwvs=;
 b=fNX4Y4uvuN9p7rZvBEvupTHwnxza932eFwxvwvcikmitkhTtA1xgqKpeRqsgX21J/R
 ewHgHo2j7PsHx+ab3hw+VpxLQXNlHbQHAJHQsuYewuQlXkiYd8BwjnMhNl5xg+VxGSSC
 rpDmOK0/8wqKwxNIF2BgVMRV2CVyP0OkW1fN5xaYoDtotReHkoEEWgtMTHn2qIO1tNZw
 Nrs7EbEtDPgLXlC9W/IWMo46ZYGPVo9qbYcNZDxvb5uJ8Xh2/18v6UP4XkR4hJUZXiRc
 us1Gtp14Lku5o/MaHw/pq75shbQOSDLKExP3AxzCm2F5R7LyVCwfLpjlSrQQHx56c4t0
 eXDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtWkIvBPATbBlLQbNhQa+8/iOzZu7aCCSC75DhPH9p/vtYW3AOd31iC/4TRFlMu2P++HCXzX/fuaYo14yeGk2SBVz9sA/Dcp/Vc/Nw1UC/
X-Gm-Message-State: AOJu0YyI6mdjpOdnlt0TVpgFUZ2ok4f/58udUvJ8SoVYgcLYe6+kvOMF
 HKdk2WG2Sg1CLnBwoY0bhxjJK1lES7HDr3F0b0l64AfXOBkrD1X7AtKXsGbvvBI=
X-Google-Smtp-Source: AGHT+IGRXSlWnciuqQZfC3tHOqc0cfNVLuu5sQUtWmYqcOy51Kd1bHWfac9G4uWn7rTTZ4G3ZYP9+A==
X-Received: by 2002:a05:6870:a550:b0:259:8805:b634 with SMTP id
 586e51a60fabf-26891ee302bmr3133273fac.49.1722582367067; 
 Fri, 02 Aug 2024 00:06:07 -0700 (PDT)
Received: from terryhsiao-Latitude-5490..
 (2001-b011-2017-1033-1725-8ce9-24c5-cfd1.dynamic-ip6.hinet.net.
 [2001:b011:2017:1033:1725:8ce9:24c5:cfd1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7106ed2abe2sm805654b3a.189.2024.08.02.00.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 00:06:06 -0700 (PDT)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v1] drm/panel-edp: Fix HKC MB116AN01 name
Date: Fri,  2 Aug 2024 15:06:02 +0800
Message-Id: <20240802070602.154201-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Aug 2024 07:36:51 +0000
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

Rename HKC MB116AN01 from Unknown to MB116AN01

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2733366b02b0..7183df267777 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1948,7 +1948,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d51, &delay_200_500_e200, "Unknown"),
-	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "Unknown"),
+	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5b, &delay_200_500_e200, "MB116AN01"),
 	EDP_PANEL_ENTRY('H', 'K', 'C', 0x2d5c, &delay_200_500_e200, "MB116AN01-2"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x048e, &delay_200_500_e200_d10, "M116NWR6 R5"),
-- 
2.34.1

