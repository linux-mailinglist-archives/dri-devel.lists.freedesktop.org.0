Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD99A9570B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 22:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE83B10E116;
	Mon, 21 Apr 2025 20:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="cfjAVu+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C79310E116
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 20:13:16 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5ed43460d6bso6420037a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 13:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1745266395; x=1745871195;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
 b=cfjAVu+ypmmJb/5v8qSYcgrNMP8EYWmBGh7xkk7ohmW8gYdYgW0cEgg21P5N4WGM+W
 3VTHy/jGYlpBeLhC298aomeGlY8QId7R0449kdYpQd0jve6jtPpBPDg9XA95OwX1lIEd
 OOqFNYcYGbKZ7kw2CXAvTnWpkJKbeHRaxDYiFlz3mseb8uKN5geFdDV2/ElX1newuB2p
 j27PbEGkN4S4MtIqc/sUwJs0gyu8Dy+xRuWUA7RY9n4gTOjS/0yqYWTB95BGbFnFAa7w
 Br3UHDscRNJhPRMrYKI/1yZbBvc0ugHvCnYlLteilcSYCRj8m6lW2LIr8MJxNryzZGSH
 6VMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745266395; x=1745871195;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pPtaoI6utTrKKW12z4v7ojubkyOrmx1+ChT5b/t83TQ=;
 b=nZbRvy9zn9opgLT8hgfJml7MVi2aAQyAa8e0+ZumcxcUCWyvySc9BV2eSWgROFEcO5
 INsHf+fjQaHE8sPaUyco9Bmh0LStkeoKjexrNHZ0lwnxXHX9jl44FCjZkvRsY7FwpCw8
 S/BybH8i3JpOlPuStq+WnGz8AMFBJxc/Dh0Hqj+UPh76eiIuJDjuGhIV6zSel29ULFBh
 ARniWZInCuXUE5VHgVwni3wdg39ZL4ub0vOZAfRh8oOe5QIBS07vnEJrIPs0ruqRJyAg
 znKWyb215XH2y657nlSuhKlG+m3YUjEVqXEVuPVIVXJG38ZfeIUXGgBl8SAkPtbsJJO6
 TwNQ==
X-Gm-Message-State: AOJu0YxzWIHecuV3Yi9td5bCERmkmsiVDlVdAO+z8EqFPDJJy7uDaKgw
 4I9Au+DuWFcTAH05BxACsrYLpJoyrpZUeFrG5gKdQAsiNd7FsmUZDnIyUg==
X-Gm-Gg: ASbGncvAAIXQtcHSZuER6kSyKERpUjx6mc8QRCDiDfzNbj/OcCDc7ZDvQRP8h2hPgHK
 pNSpLmE0V8YhA1Pbnnff24GiqHYwolWozcoImT8EqkJlMw5TmBl0eCuL9tmOp74uwhhmdewbR6q
 vnDRJnu5xG1pDiq8WhmofHqArbm+c2yBTWYpWZgxViHbVVGyF1JMCQ2K/GrSFNBBbRG9UwMAnxB
 H5f9pkv/pRT2rISsiOzZQ6XpYGgpp2A3TPS36Nb4kjRVxmQ5st4bYTaMvVF750pKwkY0q8tn8ZX
 rszYkIPzirmdNN0SBJO2Y1vaj5fqADKIm/Aq0lK8rKP3vefLQCUVU5dT5bn5T/FrAJ8mFVMFzLj
 6AuqY/VQU/W+8pHB40xONlJWaAAc82zYe2dNbgkg1Ihi+I4V1ymzUyrlQ9EnwvRFLYWHhJkSV3W
 RI
X-Google-Smtp-Source: AGHT+IEO+r+TuKnbuDISVGRChkpOQoNFOMRtWzn2WYKsN7WzPIYIE4fyTgA9Q7GUCV45qkxbPx0NaQ==
X-Received: by 2002:a05:6402:529a:b0:5ee:497:67d7 with SMTP id
 4fb4d7f45d1cf-5f62861bb8amr11048893a12.34.1745266394376; 
 Mon, 21 Apr 2025 13:13:14 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a02-3100-a503-5900-0000-0000-0000-0e63.310.pool.telefonica.de.
 [2a02:3100:a503:5900::e63]) by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5f62557a547sm4955447a12.22.2025.04.21.13.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 13:13:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org, christianshewitt@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
Date: Mon, 21 Apr 2025 22:12:58 +0200
Message-ID: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
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

This is a successor of a previous patchset by Christian [0]

Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
@ 59.94 media. The patch does resolve a calculation issue. It also makes
all fractional rates invalid which is a bigger problem.

Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
frequencies. And importantly it uses the relevant 64-bit maths helpers so
the code can still be compiled using for 32-bit ARM.
Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
still something to implement with future patches.

Neil, I'd like to hear your feedback on this approach.


[0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/


Christian Hewitt (1):
  Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Martin Blumenstingl (1):
  drm/meson: use unsigned long long / Hz for frequency types

 drivers/gpu/drm/meson/meson_drv.c          |   2 +-
 drivers/gpu/drm/meson/meson_drv.h          |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
 drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
 drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
 5 files changed, 126 insertions(+), 115 deletions(-)

-- 
2.49.0

