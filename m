Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9371BA0320
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A810E96D;
	Thu, 25 Sep 2025 15:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j5NK6qKx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9810E961
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:23 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-57da66e0dc9so1102497e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813442; x=1759418242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=j5NK6qKx2WI0WQK+x/HGMByTzuPdK+Wfddr349MB/jnWF+hA0Vc/XszMiqpL/xIRWb
 k1skYpXY6ugKCohJQq2KbXP1zAUrQM2rp+6Gv3pUGWlM9g45hMSN29eUyjTN1ewOAkKE
 +pE6kr9dBGuFi7shp4EoIJB/2GZxp0z7CNYCeeDYCvg36NIJ0hv9ZcnykEMFuyp1Kt1j
 YzmQsxOTx3RgoYP1NU+ZcL/vmVP6Y6QBUUHLNfrty/TOHiCWSJSOxL6hbeOGPyD7o300
 zOavEJ9tPIYnugp8JFr6tKHYZLCAADDbKv6Jr/DMVeX5ycx+CHKiWafE2igsODW9+M1Z
 RmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813442; x=1759418242;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=K65jsoIMVdaDklaj4Sc/+W2UtVLrpVoh8kjYdkLCp76Otk5G+PNBknTZGR3wnTSNxH
 dk3YYkZgc+8JH44jtwTftzh+ZAWnivxVBzCtnk+rgPlBuUXa/M4vJQ8l1/Z38mUhe0Eh
 MO6i56d5f/jvZjWa4+KxYal8lPZzlEJ0BZUdRWicXOF70b4Tttyj8gP4tB2nuS8skUSg
 sNj/dPNZOhhl5GQV/ymlgfHSk75U5VTvPkfwNmxUwFSNwOSF3T01fhpsthkno5XxIFk3
 1wCymGHOgxi2zMPoaPOYKlZJT09A50+uK5zre3pqFKvBqEx3ED+F/7Kw1dRPYYQT9IkU
 Arrg==
X-Gm-Message-State: AOJu0YxcV/DVy8rIdry4khPpI4CYGhXfmi8odd7Vmm3pQU9et/pdOYVN
 S1lz0sFXUfEUb5D8UNfEEvDeQ6MW8Y+etIXSY1yVw1tI5XexUjF+sSyY
X-Gm-Gg: ASbGncsf+SleNF8TYOXQY6S43OLzEtJA0qef85Ky23gaQZgxysTJMjg9ahMOxyK3ohP
 yiDEU2I+fRI+GhYF0rB+YUazYeshwjrvIr1X4qmgzCbLoLnIrR4LLby9e8V3BONCP7ywwuztWrj
 E+AgE0YBrP9ese0QO1X84pJK7QAjbQArEHv13cKbjAsLpTdIE/W/wB3YIyhX0YYFpu5w9ZdMggT
 DCPnu1kxoxuHA5h8zUQ53HqBHI1SVtCP0KZtLsyozJsexT4OHmUJyVuMIyNXhQewTCe+xqqHr57
 +lrQoH/L2JlhQcFKLy/KgIe5NBLNHtGnZj+Pcpmawb1xizGLbfmf6kH/JSFtGD1q5WawUtECTGg
 mS0PGKqIGZqXwQQ==
X-Google-Smtp-Source: AGHT+IGR2iv+Kh9ab2Gm8gGsLzPj15GIU7TA9oRp1epPRzVsSpV56VOyWvYjJkH+/G6EVhjFNycXFg==
X-Received: by 2002:a05:6512:6d1:b0:57e:ef77:699c with SMTP id
 2adb3069b0e04-582d09297aemr1358949e87.3.1758813441925; 
 Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 06/22] staging: media: tegra-video: vi: adjust
 get_selection op check
Date: Thu, 25 Sep 2025 18:16:32 +0300
Message-ID: <20250925151648.79510-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

