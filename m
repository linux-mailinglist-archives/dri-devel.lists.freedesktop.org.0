Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAFFB46F35
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FF110E37F;
	Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnSgA9sH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F9C10E37C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55f72452a8eso3602893e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166852; x=1757771652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=LnSgA9sHdXKyiHOtdCMksbDeJ7cdSHGTaXgm62AMpnV9d1Gb2YsTcBuPl0A0s2VAqT
 5QRWYRBcK5hL58SVPMb34xpPG0DTCnCec3joWzX/NGIeO4l9NrZ0mm6EtSdOmZP6FBIz
 jGgWCO1UzjR6fR+lwRszKyqdBtsOPPwBR0BlG1KUkibfPMp0htGL6m2pebRGRA+AwuxV
 UEaiDuZnS5X67ZzZlA0jDmJyGTbbV+QsDkcUZKb3OVnIW+p9ndeFAd/WqfLURurhMezf
 p4Hw+Vvk+PKwR8J1U5k4U7S4QcN6MXlx7kmjjiwF0NHSkW6gepRkRzdKgi6hl9K2Lo7j
 ANFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166852; x=1757771652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=YSG01ld/zMz/oQSATxYKBwVJ/Rcc7k+HkeY1F3p0zXx3UsHnnPv1YbM7GM5/dSXcmu
 FXEWDKqgu+YQ2UIWRAev89+/GFhk3rOhgGo+PnincyPvKoaj8/8e1kLZT35opW74h+Oo
 A8E8OM5QzSjfp/5AoivnxzsAVtw4R4rkifBXk9blxBQklOAJ+jBugL7DGb7FZU4qxki5
 CeUqBvdQo7/tr23QFSSEJCh6XIU93CvHqpGB1Ho0jPEuaFeF0J0ZZ2hQWUA2Ns3VJ1/F
 rj5IBFHC1HWMHrDARpH9ZoEEt1kqVvC3W4OLELmHmWjcnwabxxgVp0ANo3GHopB+B19E
 AQDg==
X-Gm-Message-State: AOJu0YyFv2sw0lRpx6PqEltQHDcYTq/Pv0FXg2QPUxnuHU30iEfupI/3
 asAyIKMVkPNni32x8xKGTP0ncd7FyYWy3qeu4XOib4FWfQvwZJhvIYSg
X-Gm-Gg: ASbGncsdKTkIHTnYel4x1/TuTcC5MxzNWdE7smYOkGApqNNBRYBj1jVBMnUfC2g4ahL
 QAQ+l7xd5nBencT9qjdSJkjzrOELW360TdnKqUZ+GFiK0mSKesTgVDhvs8IO0dVXkvcZUxqQ1T+
 92j/hbbbTsb+O0j7UnAchKiuvA/j+oEmN+fxqdmgV33IocmEF7xTtMVw5NpR8qXovdMt4ivggVz
 YHTWhVyE7sZSCqBhi0weNMTn4uUVGgf4JxEcAtVy5eBiNoDc33t4SYyloa5yK1faPIuBO1YjJ9X
 O77LoTwYVvMhBt7TTL0KSkiN5KHwxqSbeWIFZ9DyvnZJSazrztw5mwc8qDSELFx5uVyjM4L3GbS
 gwC7DR++xMcMTPljIkMay1jiM
X-Google-Smtp-Source: AGHT+IFNdBjIXq5sYz1MCdAhWLRCrwcVaq6AC94sETsLdKECpgkyBPhg/M7G3wdyhSPEeg7Mdr0rBQ==
X-Received: by 2002:a05:6512:1390:b0:55f:6eed:7805 with SMTP id
 2adb3069b0e04-56261313e4amr564548e87.2.1757166851621; 
 Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:11 -0700 (PDT)
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
Subject: [PATCH v2 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
Date: Sat,  6 Sep 2025 16:53:27 +0300
Message-ID: <20250906135345.241229-7-clamor95@gmail.com>
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

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

