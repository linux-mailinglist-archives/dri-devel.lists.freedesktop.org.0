Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FE7E2E29
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:27:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4FE10E3F8;
	Mon,  6 Nov 2023 20:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62EC10E3F8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:27:23 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso3966295b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699302443; x=1699907243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=80E3933pskVlE5UyIRV6Ob4lwrCmfSHIsxb+JaP6S0I=;
 b=NVt9RLAleFgvKl1fILt5fKCR2KsGFf024+CHWtEAJmCXlV89KhqvzJxKabcRt6Xq7Q
 oohKSJOeVKr8UC70o1gqa/0RZbl+mIWrxhlVTB+CB2fXrjn+vawM+RGv6T8EBS5DhX6p
 Iv15SF4SItSgfHequ2Ah6W7DbJrYg9fhphykA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699302443; x=1699907243;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=80E3933pskVlE5UyIRV6Ob4lwrCmfSHIsxb+JaP6S0I=;
 b=v12fUXg/panhmM+2eA06x8rukdnZiQPk9KPLbGGfViM46x7STQltUtI92VOA3+MyHx
 /KIizPiv2FnYKEtgI3Gj7L5ABfYM3g491nwuv1xm+TRCapBVZtVmn2KfYn5ECY8+CdHL
 M8Ucxy932z0pqfeHo7gbRMownC4Ej3ja0yvPnI7atZMcTvYrqCV23eS0KPDY9g0iO1ml
 V0FnLfaJYvNmftANZuzqsB/qYFzUbBNgrWKlE2KtJim1GNao0BaZI+o3BXFpy6EneC5y
 m7vUeWFQFKWlRX5XUqboJ/FEaLlL3t9M0HOMjjkk3krljoMIc/kyixg4mKNZsJJnNZrD
 E6VQ==
X-Gm-Message-State: AOJu0YyNuHuMW0w1yllXpxze5SZrOgzVHMrwTAUXe6ojC4TXjBnihkj6
 IcL6SAcwEhTgeYI7eXIhXDEMfA==
X-Google-Smtp-Source: AGHT+IFt2a2rg2N35fU4YkotwbhqznStieELiLySmeft6wTdm0GPhFQxNEJH0xIcvECj7GXb4c3NJQ==
X-Received: by 2002:a05:6a00:14c5:b0:68e:351b:15b9 with SMTP id
 w5-20020a056a0014c500b0068e351b15b9mr817734pfu.4.1699302443259; 
 Mon, 06 Nov 2023 12:27:23 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:3374:ff6c:474e:a78])
 by smtp.gmail.com with ESMTPSA id
 fj36-20020a056a003a2400b00689f5940061sm6144150pfb.17.2023.11.06.12.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:27:22 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/3] Add a few panels and use correct modes
Date: Mon,  6 Nov 2023 12:22:47 -0800
Message-ID: <20231106202718.2770821-1-hsinyi@chromium.org>
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

This series contains 3 patches:
1. Add a few new generic edp panels.
2. Support a new quirk to override the mode read from edid
3. Only add hard-coded mode if both edid and hard-coded modes presents.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231101212604.1636517-1-hsinyi@chromium.org/
v2: https://patchwork.kernel.org/project/dri-devel/cover/20231102221309.1971910-1-hsinyi@chromium.org/

Hsin-Yi Wang (3):
  drm/panel-edp: drm/panel-edp: Add several generic edp panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Avoid adding multiple preferred modes

 drivers/gpu/drm/panel/panel-edp.c | 148 ++++++++++++++++++++++++++----
 1 file changed, 132 insertions(+), 16 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

