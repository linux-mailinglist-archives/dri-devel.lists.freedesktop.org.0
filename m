Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26DD0B0D8
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2410E8F2;
	Fri,  9 Jan 2026 15:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DYkAuDM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FECC10E8F2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:52:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-29f102b013fso43432765ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767973950; x=1768578750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=DYkAuDM10+iIB0D0IEYSgiIiBd198fno3pYFzCtNODUlAO6H1x6W1OqS4nvKQc9rQG
 5yS4/Gi4ReclB57SwpF+daDkdhJYmRvvuRqTLQHcQJunBXpKPG2Vq/rLxtOIoZFgqJP/
 Ba1pWwfETi3pxWrion2Lyv9r2zZBd6zUHSTpznTqdiPYQbXpk8rvRIAoWG/UvBCGFEZI
 yAyBxOtfbp5sBead/MVYaD+kLkMCV1zlZRByRsi7byrhUsixEwkfuCtn7iC1/Mhs/FfF
 1SVFb3/9aX7qczDa0l8HHUe1K5JBpON1D1o/JUfE3i/VyBX64orSEmmpCSIMjDKqa9x0
 JBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973950; x=1768578750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CBICZ8YwEG0B49att9rs+qAvonW13wXo7ZtxBvLrLF0=;
 b=AFPxlfW1WLGJMexIHnQJ9zV2Jn1RMqiP0t8A26ziDeSrrzCictxvhSfE1tX1srM1YO
 IqM2HoCq9ngDCdp4NTRDSUJ9dWUI2WD8+YALWPIlWNWC6ChzcSIHxyEOWfL1N3TB/J+V
 P1vOl1fLWCDVG+/4rKuox7vnIxSSuoY/u8knveSif5qXNiIq/KT9Gff++bZXy26DkRUC
 01OWc0ZNc3VgKy2jCEA7Q8AjGxSJaLGcQm2NK6b1uP0jGBcfALauFXCBNRvKeTrgqOts
 Mmp6ICP8+KRJnf9j+qSx9Raoy2ZbUkMHGzTgJKEAm7flldUCg3iFL0T0isL3/Ycs+rIC
 iwXg==
X-Gm-Message-State: AOJu0YxK/xNLsvOqshc22AP10tUorDeuRA7xn10+IKpFX2PdVOK1d7gQ
 ePbAOniqPgUy2fPyqRWJURi1prDgmhY0Tq5PzcANuPowTwqfcjO9vVTeWTKpNdYV
X-Gm-Gg: AY/fxX5uSMuZh1cLayXRb5h4uSkLsiKfm1j69dwMu5lkLI3YjC4kztjA8BhQqV5q2lZ
 MMT/u4u+Mdk/c257K5q/5dr19X7PH87M491XZHHLZ00b46qnDaaIy0xTtEyhaNQ0EL/D8s282TO
 FCo/F2/bqmyJFXERIJKh+wGJeV9zg9pdZbxUyqxM3rx41VyficGR3x97K/0QIMf2mUBbaAdonnV
 6MejCTA8a8fDavW1/c1d642GgSwux621pWuH3pck90QUulM/rZCT1i2WR+uFW8rs0GaPn+lcCka
 xP4i0rAM7MsFs2eO0I0sCiuZtxPDI86GhlgHHprfLxeCX5roSSx3xzrxZ26AWzE2NzhBdV5rfnj
 cigyBUaffe1IMbNnWIEbekLOSQMOfHMNL96lVmUnbNODQ8dSyO5SE4YOTojcLC/Iu1V69sMBROC
 PdLOHhsGVJ2H4uZhM11GK79Habt9yjl/hTwUWnUbCU3mA=
X-Google-Smtp-Source: AGHT+IGQRgqTmn0HTpzqAznCDXp5nMuHeMtlHOV/hqdqAJeAGWAp0Qo0BWdkGzib9AbzHh1mVQgR1w==
X-Received: by 2002:a17:903:1988:b0:297:e3c4:b2b0 with SMTP id
 d9443c01a7336-2a3ee4c1345mr97283365ad.54.1767973950201; 
 Fri, 09 Jan 2026 07:52:30 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:1613:9777:a803:43fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3cd4654sm110278455ad.97.2026.01.09.07.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:52:29 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH v2 2/2] drm/panel: panasonic-vvx10f034n00: transition to
 mipi_dsi wrapped functions
Date: Fri,  9 Jan 2026 21:22:03 +0530
Message-ID: <20260109155203.34886-2-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109155203.34886-1-avinal.xlvii@gmail.com>
References: <20260109155203.34886-1-avinal.xlvii@gmail.com>
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

Changes the panasonic-vvx10f034n00 panel to multi
style functions for improved error handling.

Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
---
 .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c   | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c3308fc55df..73c5827a15a4 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -44,14 +44,24 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
 
 static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
 {
-	return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_disable(struct drm_panel *panel)
 {
 	struct wuxga_nt_panel *wuxga_nt = to_wuxga_nt_panel(panel);
 
-	return mipi_dsi_shutdown_peripheral(wuxga_nt->dsi);
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = wuxga_nt->dsi
+	};
+
+	mipi_dsi_shutdown_peripheral_multi(&dsi_ctx);
+	return dsi_ctx.accum_err;
 }
 
 static int wuxga_nt_panel_unprepare(struct drm_panel *panel)
-- 
2.52.0

