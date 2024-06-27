Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A561291B10C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 22:54:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6B10EB41;
	Thu, 27 Jun 2024 20:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gwmail.gwu.edu header.i=@gwmail.gwu.edu header.b="aYKnFgeH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A5A10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:27:14 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fa0f143b85so46169585ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 11:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwmail.gwu.edu; s=google; t=1719512833; x=1720117633;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puKEntbYEmMEidhzP0NA7FT52xgsmmmBOCRFF0y7bVk=;
 b=aYKnFgeHilNbdaS8SfkYsMgG0AJYE1o7T1mbRWAdGCJAMNStYmfu7A1ZKroBujKmSj
 SQxJgP6DD7uy/FWBGFnjQjk+I1aTio9GDS0F12A5OP8jCZTqO35ftut/oqOl8jnZ1ZdP
 utxgduIfo5FzCn5gdZmrHfL2XtO/2X32M5bPvcgWGtMY7JzC0y9ni+RIba6s9k/IOAi0
 QQtgbi+DPng7v6rsssuBRBPWfQ28oQHWlJoyC/3VZFN1jV5WyCZobaw7KpH+P3WFZ4ga
 dO24KVAa53qwqq4U6ZYSMVXChEy4mXx6KyKVhutmVaR5aD8jFCYTSmWD0DHenbDtam1k
 CHeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719512833; x=1720117633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puKEntbYEmMEidhzP0NA7FT52xgsmmmBOCRFF0y7bVk=;
 b=vL0gq6KZTOLCWtFo4/t0ZLUXWEbtCOCqBqIc1440Iy/hvfEHMH+m2jnFLEkR3jJ0A5
 MkwTyzPMAZdq44vPDkfwK5hrkx09O2lF6yxt7jVTzTtspuIr+Pp1gutebnavAOQ4qtB1
 hN1EHJ9lxeB4K/R3q9nig5tfsZlN6q5pic3mjpf9RS42cc/GpKUCKZ7ar1gOLm/FTO3v
 1CEuTFhUrVqKxZutzZLzyBLRG3Uvsuvl1BEUNcB7kSiDuLvpmjPaLgBh2MPOL7eu9K+Q
 2PLnmLIVTO/sHlEXSIqrXCeL7sElFsGSqQFSvVmBDFz1UfxGbO39Dih5+XaWsB0EtR3S
 DcoA==
X-Gm-Message-State: AOJu0Yy5xTxYBo1DpLbeUpagKLlBS0k+7O7Kok3OpWaEaxZf0IKw1I5P
 Gs2c2MCjXhdiE1GWfGUTOjwO3z1u8aUd1aDVaQh7+DN/GJt9CkteTj05P9oC5VhF3SQVWchI9+7
 rQQ==
X-Google-Smtp-Source: AGHT+IE7K7ae4HNLZS6+iF+fFNm5LOjTtJFBS3YMKiPav776AhwOPxZBhDFhHhh9h1LgNxSHFxIFWA==
X-Received: by 2002:a17:90a:784a:b0:2c4:b515:46d4 with SMTP id
 98e67ed59e1d1-2c861224475mr11183473a91.3.1719512833539; 
 Thu, 27 Jun 2024 11:27:13 -0700 (PDT)
Received: from aw-m18-r1.. (syn-023-241-237-137.res.spectrum.com.
 [23.241.237.137]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c91d3eb34bsm94490a91.56.2024.06.27.11.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 11:27:13 -0700 (PDT)
From: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>
X-Google-Original-From: Matthew Schwartz <mattschwartz@gwu.edu>
To: mario.limonciello@amd.com
Cc: dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 johns@valvesoftware.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mattschwartz@gwmail.gwu.edu,
 mattschwartz@gwu.edu, me@kylegospodneti.ch, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH V2 1/2] drm: panel-orientation-quirks: Add quirk for Valve
 Galileo
Date: Thu, 27 Jun 2024 11:27:02 -0700
Message-ID: <20240627182702.85260-1-mattschwartz@gwu.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <a160a3b4-1193-490c-aa25-8761142f4e08@amd.com>
References: <a160a3b4-1193-490c-aa25-8761142f4e08@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jun 2024 20:53:57 +0000
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

From: John Schoenick <johns@valvesoftware.com>

Valve's Steam Deck Galileo revision has a 800x1280 OLED panel

Suggested-by: John Schoenick <johns@valvesoftware.com>
Link: https://gitlab.com/evlaV/linux-integration/-/commit/d2522d8bf88b35a8cf6978afbbd55c80d2d53f4f
Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3d127127e7cb..ac8319d38e37 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -427,6 +427,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* VIOS LTH17 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "VIOS"),
-- 
2.45.2

