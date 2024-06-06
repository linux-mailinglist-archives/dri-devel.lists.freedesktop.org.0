Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD98FE330
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3777910E0C4;
	Thu,  6 Jun 2024 09:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="SQLmI/jJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3405110E0C4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:42:30 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a6c7ae658d0so90902766b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1717666949; x=1718271749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IlMHYdHpbSsMWZFdyT0K8Fjv839Jpj+HUlzJKS7Co+k=;
 b=SQLmI/jJvvfrAPNnJvEcylR7SEY0es2p3gTjVDmWB66NXmx1SG28Kiq7qVZ50Vkuxt
 Ray2ma2BJWgX2alfABx1i3fH2WJ5jw/VCrCzeWsdMFKnzhpfONa72bulekkHytIkEIfz
 8YX1+Sw1gAa5l4vHGfzlsjtoQnJJGZQFKNPS7GMdoiC4LhOKb9L5IvBrwqBfENXLzesG
 B3VyhNsF5cS7pv2wEWum/n6zcvqrCW+ObvzzmkPP3ja7ca+mUgDKfZeaXHa0dNpPwOBg
 99zYGm4VgyrPqMVFqKpPo5FoXb1/3dVXiNn+b6bSRIs9DRfeNFGbAm9iq7WUBNud6jYu
 wxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717666949; x=1718271749;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IlMHYdHpbSsMWZFdyT0K8Fjv839Jpj+HUlzJKS7Co+k=;
 b=V3MiYfGkxidyW2ujcwSkSnfcBtkb/1eEFaO0XBCYYphq7nXVIcUPIlexeVwWKPfHek
 OpmAxr9OVaQI+QtHvY+kSbcdGTMQJJLQkQprhxfi1OupHUi7788ZyM938slJPNPNIkyB
 0pBACrKWJCaALLftYysM+mrQqwBABbEIhCgDixvMr2YB8M7SiiP/EDk3MToKQ0v4qqiW
 lYCkU2XCEkb71bxqUwYJ0plupLKucubVw1jQrfJ23obN2dLla0eyyMzWqFBOUQRN6CeJ
 eXl4H8fzswCGEwQ9rUyCCzHn7cUn/tgnzINwzKcEZ8HoKqD8czTtZbIz18r/l36f7CyG
 +6wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAWdEievuGgG8V+TqQ0j3dvj777U5xw7tAE7Uo3yZJFm6VSnmnQ5A3y4gNS2YPzDKdJOs5qrsQDLhGMYkX2WyGl3C/SaWLgCXy3D4XqioV
X-Gm-Message-State: AOJu0Yy0nreBjcAtqHb8I3YtQYWlpGwgYOF41LUNd7FfCeGkMJLeXcw6
 zWZD4GbODa7jlCIBi5NCLC5d7KZHjiHRxMUj6iWN5LQuF6EUcKJeDNQdPoU/IL7KYlmbs6VlasO
 EIUg=
X-Google-Smtp-Source: AGHT+IGCDgFyPpX9CXJQtyOL58oz+VP0Rp2sLkukB9+7fEQVCwQ5CTPZQI1cjrbmD0/ctfJw0gi2Lw==
X-Received: by 2002:a17:906:f9d7:b0:a69:65a7:420d with SMTP id
 a640c23a62f3a-a699f88afb4mr409714366b.35.1717666949091; 
 Thu, 06 Jun 2024 02:42:29 -0700 (PDT)
Received: from debian.fritz.box. (aftr-82-135-80-164.dynamic.mnet-online.de.
 [82.135.80.164]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80728867sm71303266b.192.2024.06.06.02.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 02:42:28 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: stylon.wang@amd.com, roman.li@amd.com, Qingqing.Zhuo@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] drm/amd/display: Fix dml_print_mode_support() for
 USRRetrainingSupport
Date: Thu,  6 Jun 2024 11:39:44 +0200
Message-Id: <20240606093942.103123-1-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The address of a struct field is usually not NULL, making this test
always truthy. Test the boolean value instead.

Fixes the following Coccinelle/coccicheck error reported by
test_addr.cocci:

	ERROR: test of a variable/field address

Compile-tested only.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
index c247aee89caf..a98ec059725a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
@@ -404,7 +404,7 @@ void dml_print_mode_support(struct display_mode_lib_st *mode_lib, dml_uint_t j)
 	dml_print("DML: MODE SUPPORT:     Host VM or Immediate Flip Supported        : %s\n", ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == false && !mode_lib->scratch.dml_core_mode_support_locals.ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j]) ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT:     dram clock change support                  : %s\n", mode_lib->scratch.dml_core_mode_support_locals.dram_clock_change_support == true ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT:     f_clock change support                     : %s\n", mode_lib->scratch.dml_core_mode_support_locals.f_clock_change_support == true ? "Supported" : "NOT Supported");
-	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || &mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
+	dml_print("DML: MODE SUPPORT:     USR Retraining Support                     : %s\n", (!mode_lib->ms.policy.USRRetrainingRequiredFinal || mode_lib->ms.support.USRRetrainingSupport[j]) ? "Supported" : "NOT Supported");
 	dml_print("DML: MODE SUPPORT: ===============================================\n");
 }
 
-- 
2.39.2

