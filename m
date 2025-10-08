Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2237BC3926
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 09:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEC910E76A;
	Wed,  8 Oct 2025 07:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LpZd3OkQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72A10E764
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 07:31:27 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-58afb2f42e3so8512979e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 00:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759908686; x=1760513486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=LpZd3OkQaTD71hWcg1ihpU3vHy7MmHzE4jmaxDpFJ3iGDZk9VBGswRZ9cJZi595dvK
 RkbnzgY0MFClVdCndl2RqpkIkVj4PLo4o52oho80L0MGWF8NOEQB/jeHksjM49OQmUXz
 ISqrzIyR7GfD8OYg1K4KyU1cahXlr9ICKxeGgqJKkVtcMvg90iOblSgOrlbzQFbCPYeP
 5Vs87o4kP0pP8b9CMXuvIWao8cUnsLZCowfHKROBhnh69laxwAb5H1PdD0JOctz1Ld2e
 N3Ugnv+yaBIuuLr2Ar/LgjVj+wDHD0y77O+syd/1jJz4DgfbWq4IBCMqo+bqRgZjwHsR
 Yzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759908686; x=1760513486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=pP3COaxgQkkB2Oh+kXwbL8Ag5FbrPSEZbCiPfahg+HsMJFhUigBJKVt8LguEbJEqNa
 yRrxHelsejtFXkaMTd+KjCYZdEeUbpx7D02cwHXz7z0E5EX1R0Mt7jebbqLmWozK/xme
 n40/FXQ+zK69nb6C0ue9ker9zjonpdU3zcjoHF7Xr1uKxzdb+pxiSrHLqdYW9mEmpjB1
 PlEoDk+wxZyO3CtPX3BIx45fYtRdf5cUT7riXPktMrdKIVFM9s6yYu0th8wSRBCuoPdi
 EwvNXwKT7kpAYRg1N82J5D7I4HIr1kNXXz6aqVXOrXfEXnWk68NPfPgNq+j5uJRz9ydT
 4C7w==
X-Gm-Message-State: AOJu0YzCFsSC+S4AtDzQxhhj6wQ9IXAtfaQPPJsHff/Hdj6qE+sbUQku
 3jukh01IFkwdj/BMhb8qmofL0ecABCqNs7/Mp+AvUKHXSE0Rc4OeDeQo
X-Gm-Gg: ASbGnctJbHOR+3VwP8gja+ZhoHfwvdHZCSR9snwhKSCk1YlcYCpZkBeNzZf+Q+lzToF
 KQU8wiUHEcsZzfZyPX0vmC7sM8U7sEU3wN4lGqMjLPk5ONxNw5lnRB873NSKSqmJ7wm50A9bccu
 ILDn5vZkGaNH6JvkmnLWaZ3IF/UeuPoe3Y7WdetypkNIlpPt3d+4yTtoTzkhgzKf88c63W6n26Q
 EUMmwtieqYspc5C1GMvrwIslU8ZkUOItZ1q1Gxu2QXvWw+UtugVhXEJwgiZGfkEP0vHXbv3+Drk
 KkZagDYe0gH+kkarSC0jdS504xW1oQPhQaR7pUSyCNBXsz4M3FdKwS48G1igpRLk2peI7Crt/+m
 ofOFEmhVh/XWDabBoHT2SsOMW/+PqJcSDfXjHTg==
X-Google-Smtp-Source: AGHT+IFR32lh8FtdUEL6SphWqMKGIHQLehIZkE6OfQDikiDPLeDxw8CjYdXaviYneZ6ag7JJ8WYzTQ==
X-Received: by 2002:a05:6512:ad0:b0:57b:1ca2:ab60 with SMTP id
 2adb3069b0e04-5906de89076mr686708e87.52.1759908685358; 
 Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 00:31:25 -0700 (PDT)
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
Subject: [PATCH v4 07/24] staging: media: tegra-video: vi: adjust
 get_selection op check
Date: Wed,  8 Oct 2025 10:30:29 +0300
Message-ID: <20251008073046.23231-8-clamor95@gmail.com>
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

