Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7A1B4A39E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070F10E63B;
	Tue,  9 Sep 2025 07:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jIsSIQxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5291A10E63C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:33:59 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-336ce4a8bfcso43770051fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757403238; x=1758008038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
 b=jIsSIQxna8Z8BpxFNySLSgFAS95zoZhXwGHofmoL45G7IqXGIloE2qjs+MD2XT/k/i
 vYdmaHOqB/AteeVrlfeL96TMMVH+f2E4zTHVQLcNjrELYDK+eRjgTOR+UBfsfplL+R4N
 Y98pRzkET/4SHaAal9D7TQB381+zR2jx3y4On7YhwKbL9X8gIOF5MZCc/505iwbEtCsF
 N0ZPCrhKp1LjpDtCHS5qcNPA4WwFTy2ZtJzby2PCTb/GuUU/5aFtB12tMTO3aUmerx4u
 Yw1fs7cBeH3+/gPQ2RqMuHKC29v9DY4+nLXawlccbkgsNlxN3NHdHeChK2woqSSTa677
 0vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757403238; x=1758008038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYiswRj/QaYbkwuLO6ropupZ4HLa9+N1VAg/V5RUYGk=;
 b=wPwy6iQ+HfSUUXrYTmqp65tuiseDH+ZgSGB4uXAVtpgarygTREresbcs3mEamlyYG9
 EotEj9WrcqFJIuZZ3xb7+qs46yQBCh2/QI6EgKo4B84fNt+Kz9DcaEawjfViAP+42tYo
 Uwzq0y2Os4AvPjf9AY37JlnyUEf7f+aofSx+vh71Jm6tsDpQTjxZwwRPWuKACSGJVoeQ
 rlfKkgCYXDhjrlyL2YUl2ADxOfMRJwNyBUTSSdDYR7NXJt+AWCJMVWGQZkyfPusRGAJ1
 NyaAauJCqVpVVBymXbifXgDvD4zuxsHYxiXA8sQANXE76uxv4oQnCRidrEKToa7fDuq8
 1FDg==
X-Gm-Message-State: AOJu0YyNovPMNChbmRUO9Ma+Yad5devC/YzF/f3ez0f0UjMSVeH4nnE2
 iWiF6xCSlq68V14AltGPSjP1aqyyQ9tbeog7Rj7gUelk9FrEN3dj1q9c
X-Gm-Gg: ASbGncvFvMcWoZHZofW8RaEey/drpU7xFwhppQmXXCWS9dANQEDkaDkR/WkGVLCExcc
 RNu9LddCTr0k2TRtsBmCE7ldJXYm56PIf3res9eB4qXT9iNdK8UIIlTwPoTOeb3enIPAfs732j3
 UFOfT0eZp/xvah+9AkFKtrzN+LV77sg9N04uaHgx14wHz4ImzzkjR3lX4D2A5dnTjMMekF3g5DE
 BNmUsdahT7GKzuKAcNwfsSRMXcZrwOmAcRbiIjlaMDWCIT1Mpc49k6wPWC3PEmA/bgU5n4xXX4D
 cXOnLTsSJ/FfbwnyW6ZhC8sbJRJGTch6cRk0V2Qhi6wUXc9+EozWpALEyEEfqyJZxWGue78+OTk
 bW5JQcTrQjUUcxA==
X-Google-Smtp-Source: AGHT+IElpt1mNRwwWKhQpfkwc63KOwvW3rDRSy5Rcmjz1QUiR7+paKgXpx8Z2+qnNuoRZk5EjISFSA==
X-Received: by 2002:a05:651c:41c5:10b0:338:7f3:a757 with SMTP id
 38308e7fff4ca-33b57862674mr23066631fa.10.1757403237229; 
 Tue, 09 Sep 2025 00:33:57 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c91a6bsm37542721fa.21.2025.09.09.00.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 00:33:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] gpu/drm: tegra: dsi: calculate packet parameters for
 video mode
Date: Tue,  9 Sep 2025 10:33:35 +0300
Message-ID: <20250909073335.91531-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909073335.91531-1-clamor95@gmail.com>
References: <20250909073335.91531-1-clamor95@gmail.com>
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

Calculate packet parameters for video mode same way it is done or
command mode, by halving timings plugged into equations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index aab555a2eb68..1ec3f03d2577 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -545,12 +545,19 @@ static void tegra_dsi_configure(struct tegra_dsi *dsi, unsigned int pipe,
 		/* horizontal back porch */
 		hbp = (mode->htotal - mode->hsync_end) * mul / div;
 
-		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
-			hbp += hsw;
-
 		/* horizontal front porch */
 		hfp = (mode->hsync_start - mode->hdisplay) * mul / div;
 
+		if (dsi->master || dsi->slave) {
+			hact /= 2;
+			hsw /= 2;
+			hbp /= 2;
+			hfp /= 2;
+		}
+
+		if ((dsi->flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) == 0)
+			hbp += hsw;
+
 		/* subtract packet overhead */
 		hsw -= 10;
 		hbp -= 14;
-- 
2.48.1

