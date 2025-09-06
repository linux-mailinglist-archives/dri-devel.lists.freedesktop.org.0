Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1229B46F59
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F3110E383;
	Sat,  6 Sep 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSp5klu2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C64510E38E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-55f7a34fb35so2931897e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166874; x=1757771674; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
 b=KSp5klu29eud+zjY9QC7VrPiVI7nKj1v/tZs82bpaw/K+Q5t6UBjx5xwxkYWxzR05+
 mru0eLIKv94u6/IjJvDd0OWupu4hBQEDsN3rAYTqVD9ACSFbMAMF6S5yNnzcNpeCWfoy
 UqmE9gNj4/cKchPIHaXOAqoILW/UqoKxn8H0Nx0fvN4mLbBfXDmqy7bTTNVGSbJ/PQYy
 EyTBAnyH04EJF2NFJW5HafIRNYZSTrOB93LRBJ1Bsls369TTB64fCFJ9IauhquHzLKWj
 67FdOFKxLa/VwZSogJbvTjxo6ymlH2OYb6P+1eI/Zija2DW0gceVITfVQ8IaBUC/ceIF
 7eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166874; x=1757771674;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aNTsfQxNPr67Asls944jtBoWmsz4/ks+GrA5zAOV45E=;
 b=IFMIzzCBjj7cP4AhXY0ct6/SLe7anMIVwwBNJ785OK+gSrcL9kf7O2bvwZXift22lj
 4ZU3hj1GCflag0vorCUFuUfi1zAnYWtfKH47Cqzq7BcBO3H8MpXK/gff4yFQFJvxUE9j
 1LTCwtX5NHX9pJqclKuXFGDaSMG7Dd0qAVGLDbRN8xUmNBbClIsh39bejEmy1fxfTXza
 Chu+AlkE790YQ5Yh07pvr58W/PBNlQJ7mhj7TeKaP8aXN3PUbKEadJu+gTn3cNxtFL0I
 37Deb1H36UUY9XWbd0fxgrrGTPHzZ2fEmh2dJ7JG/ER39do+WS39lzPckk5i8TnbUQQm
 JTxA==
X-Gm-Message-State: AOJu0YyukjFGbuBfA3S9HM/7Z56LDO0YkpEgnxgD2djWshl/ojHdn76A
 53GuTpJ3HvHcBktg43L+HetP57+DKu4DIx127YsXIJWjS+8IySb7CORp
X-Gm-Gg: ASbGncsYLsAGTxRb5LP/7uIvLqtduflNXuxGhnxEQNjheMXRywVkw+euwgkH4Dw8jlJ
 2IwLw1d9cEwYW5j5HRXx1xMlyaKkFlqYi4Hcaz8aEew82b5ypwHISmzrea8eCpxf7QIxaOsQU9E
 fmM01t4QW+XG4im/qHPGYwxnl1cQKf5ISdSN+6Cztnhtq0qO0uIKQ6VinqfIWi8hLeJlso2oOok
 qXO2X8HMU4NgQm9k1cgfpWCVdVBlN3B6gplvnPRjfsEt4De76zpigPAjLeHdQneSZaa8WfC1YqY
 SxM5S2sRueoV0hSyRwLJoEkKfl3u4kqU5IErimUtgli/reSV6wzprUAD+udki9GW4HCmGYqzP3h
 hYjZaB7kB3ne2IVsk2KqYXYyT
X-Google-Smtp-Source: AGHT+IH1vblFyXu/7o3n3WbTvyGZ3MOBFvdatO7tkrpxQQblaA/pNjQzUSIoFy2wgH3lZ8pHhTFemw==
X-Received: by 2002:a05:6512:2213:b0:560:8b56:5dc6 with SMTP id
 2adb3069b0e04-5625f53580amr634047e87.19.1757166873870; 
 Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 20/23] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Sat,  6 Sep 2025 16:53:41 +0300
Message-ID: <20250906135345.241229-21-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

Luma buffer stride is calculated by multiplying height in pixels of image
by bytes per line. Adjust that value accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index f9adb0611638..20cdcc4e01aa 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -497,7 +497,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
-	int stride_l = chan->format.bytesperline;
+	int stride_l = chan->format.bytesperline * height;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
 	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
-- 
2.48.1

