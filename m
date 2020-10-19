Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16B2929AB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 16:43:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F406E9DD;
	Mon, 19 Oct 2020 14:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333576E9DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603118603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=HS9j6NFClw0xbf6pUYexyg09LSF+fCEmAaVviysMnkA=;
 b=gz4+ADC1GIzuynZZBraiYMTC4A1tDFN9Fk+YJg4dJ1zLllvYVOJcEb+GvsnpzqnJmqzka4
 OLjDN6yY/JjEGCnF47yP3RAySk2vkAY8b9Od128GwaenLUblNgo23yBSKm/pzjE0FliK/i
 ykN9egRqfWP/OhVipMBA1wwTNeDgsvU=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-5-PtnyZwOOeGM5WoTZlZAg-1; Mon, 19 Oct 2020 10:43:19 -0400
X-MC-Unique: 5-PtnyZwOOeGM5WoTZlZAg-1
Received: by mail-qt1-f199.google.com with SMTP id i39so122190qtb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HS9j6NFClw0xbf6pUYexyg09LSF+fCEmAaVviysMnkA=;
 b=JqkVHfdFftPiptZILbGPZkUTqy/MHF+qDXDL7Aa6leisM2CwcQziSju55+XXZkPR4X
 jAhYn+GGUoZpESbPE/tQrXx+dnb2s4W0hPUIZMhRunZQLrAFpLqS4S5uIKm+6NjlF1fR
 bjiPFC+d/SqKTxBQcPSczoTYihTOxSIoQEY/79vOtUvgiHOEf+ZLP2jssk42WLTZYYDu
 MeWJbQWAL6ObwzihbdJzT5mCaTTcd6h7tR0Mj1yllwRdvSufIOeO3Z4qXlhHQeiECY2v
 4cZC1i5qt2b5Iy1aFF+XvgY9ko4ZnuLmgO/4rc+TSZ/FRXnJI5SflSv6BMDPAESSqCsi
 5Yyw==
X-Gm-Message-State: AOAM533dfl/k2tUOEH1SU4r5iwkZdTzEutF14p1xvS6fadZgikb4/7VJ
 KpEDWcCpgpeHIzjL7iaghtHtS8J9nl8ZJT9ynkX/insDFgm9pN7wEzIXjmPdHI6nhzL0IhBR/jv
 Mvj4hsOvwzAHAKdOABofebeXDGG1E
X-Received: by 2002:ac8:937:: with SMTP id t52mr15592708qth.268.1603118598558; 
 Mon, 19 Oct 2020 07:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAjzy0z6rzYX/CmMgw+uXDi5Q1r8M21MiqKjUC0Nu0rYOLfUvcBlanK5Bdn1pFWCESWLn7oQ==
X-Received: by 2002:ac8:937:: with SMTP id t52mr15592664qth.268.1603118598290; 
 Mon, 19 Oct 2020 07:43:18 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id j8sm107460qke.38.2020.10.19.07.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:43:17 -0700 (PDT)
From: trix@redhat.com
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 issor.oruam@gmail.com, Anthony.Koo@amd.com, Rodrigo.Siqueira@amd.com,
 Tony.Cheng@amd.com, Charlene.Liu@amd.com, yogesh.mohanmarimuthu@amd.com,
 Aric.Cyr@amd.com, Igor.Kravchenko@amd.com, colin.king@canonical.com,
 tao.zhou1@amd.com, Dennis.Li@amd.com, mario.kleiner.de@gmail.com
Subject: [PATCH] drm/amdgpu: remove unneeded break
Date: Mon, 19 Oct 2020 07:43:11 -0700
Message-Id: <20201019144311.18260-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

A break is not needed if it is preceded by a return or break

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_transform.c      | 1 -
 drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c | 7 -------
 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 7 -------
 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 7 -------
 drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 7 -------
 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c   | 7 -------
 drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c   | 7 -------
 7 files changed, 43 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
index 2a32b66959ba..130a0a0c8332 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_transform.c
@@ -1330,7 +1330,6 @@ static bool configure_graphics_mode(
 			REG_SET(OUTPUT_CSC_CONTROL, 0,
 				OUTPUT_CSC_GRPH_MODE, 0);
 			break;
-			break;
 		case COLOR_SPACE_SRGB_LIMITED:
 			/* TV RGB */
 			REG_SET(OUTPUT_CSC_CONTROL, 0,
diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
index d741787f75dc..42c7d157da32 100644
--- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
@@ -418,25 +418,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index 2bbfa2e176a9..382581c4a674 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -471,25 +471,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
index b622b4b1dac3..7b4b2304bbff 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
@@ -446,25 +446,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
index 16fe7344702f..3d782b7c86cb 100644
--- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
@@ -383,25 +383,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
index 5a5a9cb77acb..e9dd78c484d6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -453,25 +453,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
index 0eae8cd35f9a..9dbf658162cd 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
@@ -458,25 +458,18 @@ static int map_transmitter_id_to_phy_instance(
 	switch (transmitter) {
 	case TRANSMITTER_UNIPHY_A:
 		return 0;
-	break;
 	case TRANSMITTER_UNIPHY_B:
 		return 1;
-	break;
 	case TRANSMITTER_UNIPHY_C:
 		return 2;
-	break;
 	case TRANSMITTER_UNIPHY_D:
 		return 3;
-	break;
 	case TRANSMITTER_UNIPHY_E:
 		return 4;
-	break;
 	case TRANSMITTER_UNIPHY_F:
 		return 5;
-	break;
 	case TRANSMITTER_UNIPHY_G:
 		return 6;
-	break;
 	default:
 		ASSERT(0);
 		return 0;
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
