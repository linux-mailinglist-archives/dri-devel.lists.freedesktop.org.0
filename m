Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67C80544F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 13:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D7910E50D;
	Tue,  5 Dec 2023 12:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D5D610E50D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 12:36:42 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6ce33234fd7so1664961b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 04:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701779802; x=1702384602;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KIsb92r91QpPekGXu//XTsZOOlRQ2+GzhKmsBQNjlBs=;
 b=PjgwrNRitm9xtyQLk24wx3VNuopcO6wVvJjVu8IYQDI6ELOAfzPv0BrI9dQDXVWPjZ
 C6LjYf2wEX5oOWEa3fghP51f/UGGfoheuP8vXN7LMz/BdNzyRAAzEY/YlrU79XKq+BUk
 gloraQxmpDfiDc6qzOaJZMT3F4BxQ+kC5vYl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701779802; x=1702384602;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIsb92r91QpPekGXu//XTsZOOlRQ2+GzhKmsBQNjlBs=;
 b=HvkKKOn3f2DRAahqM8taABc8iCpc3wwzjWUWOR55nO0p1OIPniDk7QSR4FA9OxGpUw
 tTsrW3zijTGRLdT7Ezr/IpJLOu48XWfecq6RLVtUa6YqxPHBZXPeeTchK9V/lwRNv7LX
 KPtGN1rMupGIFfWMHZIFMmU6QXJMCJmSNvzVgZl6x2g7sn3KwG0gq+nsAF4VRC7ojRQ/
 D2Ave8MZAdjKfjG0t2yVT+Y+Jy6PN1jzylF4s9Fn78T1G0AoX+7eQdGG+G+mFrWmuDZ7
 yTvFEcoTPOTl19xtPEEjRRLOl61Qz8fB1I1D77hd/ETHpKbxhZZssXMx23w+GyI9NEqq
 1wAg==
X-Gm-Message-State: AOJu0Yzug2j7EdeexWdFVhzh3eqfAPAyCHU173cpD58ELQ42fQYsGOQ4
 iuR+bylI12zcI6A/YmCQcAxTqA==
X-Google-Smtp-Source: AGHT+IF6AYuS2w8vqW1PS7HCIG9VdZITdv4Vw0j4ZEYFjRIjxdtKSKpGWhyEF6S9kd1UPykcAM7zJg==
X-Received: by 2002:a05:6a20:7490:b0:18f:97c:5b82 with SMTP id
 p16-20020a056a20749000b0018f097c5b82mr2572927pzd.80.1701779801795; 
 Tue, 05 Dec 2023 04:36:41 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:433d:45a7:8d2c:be0e])
 by smtp.gmail.com with ESMTPSA id
 p26-20020aa7861a000000b006ce7abe91dasm285115pfn.195.2023.12.05.04.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 04:36:41 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/4] Support panels used by MT8173 Chromebooks in edp-panel
Date: Tue,  5 Dec 2023 20:35:33 +0800
Message-ID: <20231205123630.988663-1-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
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
Cc: Guenter Roeck <groeck@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 4 patches:
1. Add a new panel delay to support some BOE panels
2. Sort the panel entries as a clean up. This one does not depend on other
   patches in this series and can be merged separately.
3. Add panel entries used by Mediatek MT8173 Chromebooks.
4. Add panels missing data sheets but used to work in older kernel version
   without any specified delays.


Pin-yen Lin (4):
  drm/panel-edp: Add powered_on_to_enable delay
  drm/edp-panel: Sort the panel entries
  drm/edp-panel: Add panels delay entries
  drm/panel-edp: Add some panels with conservative timings

 drivers/gpu/drm/panel/panel-edp.c | 92 ++++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog

