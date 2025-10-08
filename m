Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B944BC396E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008710E773;
	Wed,  8 Oct 2025 07:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FyMoXubc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76D410E773
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:50 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-578ecc56235so4635834e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908709; x=1760513509; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
 b=FyMoXubcwG1Sdt1qXjl/GhC3zSvIODmUk2w4oD4Ktr2J9PNdc6tRwvR2O6eb4Rmec2
 5kt8x52KwkGjVSF2Z2HlN6WtLJv+ixlLSrziCI6EkI5ArMWEnNuUGwI5JswycIBnmtYF
 aybPCCM2w+K/uWAsG9A5t8t6GAEoADXbqQKC/G+BmLRqK7iU6MVtSna1PjoWRYxmNxT4
 VgLLRGcoftvGyo3Dpv6dapJqcUxBjs2lqjbvKbeTM/E/JDax0p6pwE36d4Kt7ZDk6Uuj
 O8mBsXmtzYMIYkBVS1hkELhtWpClPCoja1QH+gqOy5vxfqQdlmeJR/Ys8DEzqwf61hAF
 sYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908709; x=1760513509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNRJG9b/INfi23des3nzlgfKaLYdiUShg0Bsn9STYF0=;
 b=bfwWvPplidW4RjqsEta1zF5NdV/cvFi7KsYF0Af/mSo/u1iCJXhBt8NZX//yQOZdrE
 UjJHBW2TE0me9MoSKtLO+wVojjwpYB/IwakskqdrSlhugkEgHuQVhekFybyiYCKmCVmY
 p6HX8lA7dMfj01TtZ+/Vrv9lKgVKUo4lNVYxX3kddc14IrhFDzq/ZLjelt1BATvZOhNR
 aUD7Av9UQkzu7FrOsqCIxUdNA6FaQzpKaUczNmphlODXNYFDYXX551O9vUbyeuMblm+1
 alAznkWz9EMWlDMUsruXho8n72gXt2i1FWXVl2OTaXibBJIQvT5MirsgTMkZ7YmIyLwB
 EgoQ==
X-Gm-Message-State: AOJu0YwDNq8r5fsBb7AAFvZFC0xRDSAHbyQlJeRyYUgvKNY9dlIUTec1
 U+cak8KXjXyPW7sN8yNjYBq2cuwfA/7KN/rv+Yqm6yyCar2xvWc1nKS0
X-Gm-Gg: ASbGncuHwhtuHYuL6st8L7+BuuZuI9sc/jMP4/+3m23MeWbGXqSaEsvOpJP1tOQRVQl
 9zBWbAI82Oa5lp0Rls/M4Wj8YpqkU+JhVkJXWK+bnld2Kg9jpBjGHiCQbMUgNC0VlRvMOTOXUap
 K/eY5oCgmwNYqiqsa82nlpV6RjO6PGjoLcniSd0RrbyIoJ7Q0NZj4lM97sbvf/orAbilocT9dWh
 crX4H9NzheFjniXszDmGglMOvlrm4jxLO07aEMexsUFIg5a9/mtBXOYw+wyBO707L4wIqRHIdzr
 gy6emDNO9sIGaAegRgch1rITdefn2ulgXiQAQbEYvJjiWumf9nJ9wYnDDuLoDOaxibUaUsEPcWI
 DvTuXq4QBEb8sPcD0aHC6FY9lva/e+MjHsunWLA==
X-Google-Smtp-Source: AGHT+IF61Uf+7jyVQLbDjguFkflG7qNGvFKGa9VJbcmzM10P4AOV0pJo6kc07mp87QYBfIqV8TPf7A==
X-Received: by 2002:a05:6512:2247:b0:55f:4107:ac46 with SMTP id
 2adb3069b0e04-5906d8a084amr687325e87.25.1759908708862; 
 Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 21/24] staging: media: tegra-video: tegra20: adjust luma
 buffer stride
Date: Wed,  8 Oct 2025 10:30:43 +0300
Message-ID: <20251008073046.23231-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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
index 0457209b789a..626f34543853 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -504,7 +504,7 @@ static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
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

