Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97AB7DFC34
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 23:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A993110E0DB;
	Thu,  2 Nov 2023 22:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8739B10E0DB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 22:13:14 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-581e5a9413bso764725eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 15:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1698963193; x=1699567993;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uZpKHIQGQChjn03OiR6zvh7oQbUczJl1KxbRNlHYq3c=;
 b=UpVwvELDT0hCUGRlJNRk6fO8r3Jis/mhCfH37NtZLApxzv/zViucOWNJYhFwo2XgR2
 jeHCEclj8rySCnAa/y8N/oI0E401UfzUXTCiUNSVMgvgcwN2p/ZUNZYuMNah077oJj5L
 vF9D9pcc3Np7Q4EbANGj04K1SLxwS7Znakiog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698963193; x=1699567993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZpKHIQGQChjn03OiR6zvh7oQbUczJl1KxbRNlHYq3c=;
 b=ly/uzWnCeR/AB7McX00GEvt4gSiPL9WvhkdZmDEU5r2MVm6Qzz5HD/fMYczNvmBmpl
 pvHitwRjabrlxDgaQz0cpqMurxGHVuR3xgjHxxxy5Oo6B8TPiejOYBY803l9G6gNPKES
 w5h8QTvQRdi58INEw46tt2suza8t0jOf8UdMi38bGMLQrt4n2+zi6opW1Y3WZUSSwTPr
 UFCLR6fEaqhuUIadGxxhPUU1E6/uXbM7UmtEUg52UfOrmPQNhwUs0MPJXKyeERin5kZy
 OeQqI9ccT+Sld+lzmQlKM6nGxKpDCmKP0N9aNTkdvpWv+f2YHZZF6DpFegE6oqXkRnpI
 oILA==
X-Gm-Message-State: AOJu0YwglyjAfGfZyYUso5xJyRS34XZrGqYtQPLwEEQh5kxhu6pNhqp3
 aMp5sKf1VqVDFn1A5uDK2jgJEg==
X-Google-Smtp-Source: AGHT+IFC/eSh0rDu/gw1lIy8MRPibeWao57KTEo2U8j772tz15QeQhOaa3mXupFJ9VCZitSdwvohfg==
X-Received: by 2002:a05:6358:3406:b0:168:d2b5:db9 with SMTP id
 h6-20020a056358340600b00168d2b50db9mr22988808rwd.6.1698963193581; 
 Thu, 02 Nov 2023 15:13:13 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:6ec1:79de:6e50:d6fa])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a63ce06000000b00565e96d9874sm196057pgf.89.2023.11.02.15.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 15:13:13 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/4] Add a few panels and use correct modes
Date: Thu,  2 Nov 2023 14:47:46 -0700
Message-ID: <20231102221309.1971910-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 4 patches:
1. Add a few new generic edp panels.
2. Support a new quirk to override the mode read from edid
3-4. Unset preferred mode from edid if hard-coded mode presents.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231101212604.1636517-1-hsinyi@chromium.org/

Hsin-Yi Wang (4):
  drm/panel-edp: Add several AUO/BOE panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/modes: Add a function to clear preferred modes
  drm/panel-edp: Choose correct preferred mode

 drivers/gpu/drm/drm_modes.c       |  16 ++++
 drivers/gpu/drm/panel/panel-edp.c | 130 ++++++++++++++++++++++++++++--
 include/drm/drm_modes.h           |   1 +
 3 files changed, 139 insertions(+), 8 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

