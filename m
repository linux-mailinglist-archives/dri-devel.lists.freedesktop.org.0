Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CAB1BE49
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 03:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F1E10E2CE;
	Wed,  6 Aug 2025 01:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XD29/3Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B27310E2CE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 01:28:00 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-741a905439eso2312874a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754443679; x=1755048479; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8m6WQ7WFJFpA+OwxDVX3v2vixZ4KhoNYzGWzjB/pRgk=;
 b=XD29/3KaHDVKgf+AnHiY/Izzy0mm2egLY/zt8MPLycnrh9v7tKeFkhTh96Uj3wU+6k
 vQAMwphoFzYxn9pGcEhBuHGc2tLzQ2tZMOPxkPtQ5OwZoSqF/fSBHx1RJxStXFBQ888e
 Si9oJQ/oHQ7EMhdPzUdIOGwBhlkKmAxA4e2MAhUv8gUdqHYZQCFkLRl49frTZl60taAc
 Gv7EyrmHkrF4M2I7wOS3XgmRms2MKa3wm11DQQE67GmbyTV+HR+1mWguM9yoxExWakR/
 mzmEon6tnYz40NuhkcSrMQUea2qJTW0ixeMBZA9o7U9kq87kx9RrdzlOkC9Ji05Wijlw
 ZY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754443679; x=1755048479;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8m6WQ7WFJFpA+OwxDVX3v2vixZ4KhoNYzGWzjB/pRgk=;
 b=qtM5FcHEmsrk0kYdzfHmeqBdIbNnKWfNy/0iqzaHoBvPk9hlTAxXm8A74SMModayVN
 8iL0BMt1fhoWk4z+bE/GAbLZhUq9o35DVyqVhvD1KTkKrhwiwKAgWQLjtRGU8Hxh0L0c
 Af7UOYMSqshpWSNhoPyO1PxN/+LeRfOKnUTrEag8vIGWjcgie1j/kuUndEG3Caf1gLFF
 hdz4UAb2g2LRg35mPYVrfoLUnUroUxm6y+Z8J7lJ7PNZfRqnkZ2p/sFuq3DMHmC95wcY
 4204A9dbCxMo3me/syiBTxjyj7SO2agIc48EDtuzgT1cF/MeDXmFhyRIeBMrj3lStrcN
 LJTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMum62G+7dW10o4qjQZV+qbY9MIpkat7S2h6rMq/biHi38qjd/s7kDBle0Kgc52yFw4mPXKBJy4+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZJVIeimMhl7cTJQQBCu3vzmMqEEpJw0o3wd25fX4bYLEiEq1/
 wsg7SeTwLBTGlA8eVxSUxC62EJlbY1CYSXopjUVtBy9J8cIzWqF88GAb
X-Gm-Gg: ASbGncurFBbqMVjLAXxl0KXs613TUH8b5NNFpFmmjvsCiFeRHCFsgadRMZabJugaf8w
 1jFwre2D4IEzOmKDWXQERly5FQh8VL091GbHMJXhDNk1fYbZyg6dxVOa5VSAev3fnRC+V+IiWfV
 WdcwkprN6Xl763QpMYo2qViw2ZZdZ3NgKpTJMffOIf7UYYUjycHQTb9wawZ/tHVI5y8mpap8L9a
 VvLQVeaCU7emr2qC3WRd92PMPwx99i4pxQR+7ewjd2rQHL14xrTmGmepSGrCZzUeVYGM3SZUoxP
 BDmfS/aRoi6Cd9ZUyxj+oBGIdbJPRMWplmFkr/aSIy9XJFw/ma0lORxdoQjfnDXfYI1yGmk/kei
 flUxL3V22D2Ic1oVEy21WeXkER09RCw==
X-Google-Smtp-Source: AGHT+IHxxgfkjj5PlfPmUdlrNom9hvpdAQlX5GMiE3tvTipTbehMR7S6TcXRs1HyiWQGr82rD1N+pg==
X-Received: by 2002:a05:6830:2115:b0:742:fb8a:d2d8 with SMTP id
 46e09a7af769-74308e97a82mr1257902a34.21.1754443679368; 
 Tue, 05 Aug 2025 18:27:59 -0700 (PDT)
Received: from jander ([2600:382:6a2d:38ad:3f8d:6104:aa7f:a5d3])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-74186d912e6sm3054294a34.29.2025.08.05.18.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 18:27:59 -0700 (PDT)
Date: Tue, 5 Aug 2025 21:27:55 -0400
From: Christopher Orr <chris.orr@gmail.com>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345
Message-ID: <aJKvm3SlhLGHW4qn@jander>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Introduce high-res OLED panel for the Dell XPS 9345

These timings were selected based on Alex Vinarkskis' commit,
(6b3815c6815f07acc7eeffa8ae734d1a1c0ee817) for the LQ134N1
and seem to work fine for the high-res OLED panel on the 9345.

The raw edid for this SHP panel is:

00 ff ff ff ff ff ff 00 4d 10 8f 15 00 00 00 00
2e 21 01 04 b5 1d 12 78 03 0f 95 ae 52 43 b0 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 fd d7 00 a0 a0 40 fc 66 30 20
36 00 20 b4 10 00 00 18 00 00 00 fd 00 1e 78 cc
cc 38 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
37 31 4d 31 81 4c 51 31 33 34 5a 31 00 00 00 00
00 02 41 0c 32 01 01 00 00 0b 41 0a 20 20 01 ea

70 20 79 02 00 20 00 13 8c 52 19 8f 15 00 00 00
00 2e 17 07 4c 51 31 33 34 5a 31 21 00 1d 40 0b
08 07 00 0a 40 06 88 e1 fa 51 3d a4 b0 66 62 0f
02 45 54 d0 5f d0 5f 00 34 13 78 26 00 09 06 00
00 00 00 00 41 00 00 22 00 14 d9 6f 08 05 ff 09
9f 00 2f 00 1f 00 3f 06 5d 00 02 00 05 00 25 01
09 d9 6f 08 d9 6f 08 1e 78 80 81 00 0b e3 05 80
00 e6 06 05 01 6a 6a 39 00 00 00 00 00 00 58 90

Signed-off-by: Christopher Orr <chris.orr@gmail.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9a56e208cbdd..e491b84d0ae0 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2027,6 +2027,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 
 	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0004, &delay_200_500_e200, "116KHD024006"),
-- 
2.50.1

