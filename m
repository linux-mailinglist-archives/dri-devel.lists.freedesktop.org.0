Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F497E31C6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1E310E46D;
	Tue,  7 Nov 2023 00:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF6B10E46D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:00:29 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5bbd3eb2f8fso4797208a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699315228; x=1699920028;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=21e/wYlKKqV9mT9+9Mlh/xElPGx/iUs7TKMPyQ0Zc0U=;
 b=A2/DddVCNWUUjdMuPJdx+FSvZEvtEHviQ8E68CRcGhrV9W35wJqMNkIbJ11Po956I5
 H9inCtaoEgt9d2953EJfmX2vMtxBs+Gcm9QeuKhFt/Yq0fZRvWTHKT7HhK3cMler4dId
 hwpXxRp0pmBAlmrqd8Fnj2Cze3PhzV6CKPgvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315228; x=1699920028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=21e/wYlKKqV9mT9+9Mlh/xElPGx/iUs7TKMPyQ0Zc0U=;
 b=R8hqy8xbsyKqE2HuP7WuRPtjs9apQjQlYMJIWrU6ieqb0bFkreD2H+3605OSkb9iYc
 c1x5/qqBhHWfbMU9lPJg2ezGZY71UjNvo5NQzzfmbVdUsUWjl6sLPoNpjOIVnkKhkxhR
 lKlSHpDCT8LHCJ7k8zIZz1nnBgYOHUIHfFFhjotMVt+T1UKu/dQmkfy2aULhRYg2e8RU
 Nz+yNyqTVLUILWb0JLk/2L2vCOu1LphEv3d1lZK33JnJ8ncQjfxMsZmWNkY7rBNyDtlp
 lvbLSBGWL4SmKnA7BoHlxWLpx6yM7EyAgw+hngIa5uN8Jrn4QE5u19bNfFKHecc1DIsO
 CzlQ==
X-Gm-Message-State: AOJu0YyiZ+MAQxOiAMzB2odWPVDTSl/jXMaI+8N4CSW//l7zFNCH1069
 1jNdL/cQ1P7L+AMjDp7ifIjAlA==
X-Google-Smtp-Source: AGHT+IGamsXcnSCA+MbJdg+vx6O6uxyacsDYNxLNHmivj5ndEOFKNmAzOAGJeTNVBtUZoJF3xVuSQg==
X-Received: by 2002:a17:90a:8988:b0:27d:8a04:f964 with SMTP id
 v8-20020a17090a898800b0027d8a04f964mr1202135pjn.24.1699315228619; 
 Mon, 06 Nov 2023 16:00:28 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 fw11-20020a17090b128b00b00268b439a0cbsm5852866pjb.23.2023.11.06.16.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:00:28 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v5 0/4] Add a few panels and use correct modes
Date: Mon,  6 Nov 2023 15:51:31 -0800
Message-ID: <20231107000023.2928195-1-hsinyi@chromium.org>
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains 3 patches:
1. Add a few new generic edp panels.
2. Support a new quirk to override the mode read from edid
3. Only add hard-coded mode if both edid and hard-coded modes presents.

v1: https://patchwork.kernel.org/project/dri-devel/cover/20231101212604.1636517-1-hsinyi@chromium.org/
v2: https://patchwork.kernel.org/project/dri-devel/cover/20231102221309.1971910-1-hsinyi@chromium.org/
v3: https://patchwork.kernel.org/project/dri-devel/cover/20231106202718.2770821-1-hsinyi@chromium.org/
v4: https://patchwork.kernel.org/project/dri-devel/cover/20231106210337.2900034-1-hsinyi@chromium.org/

Hsin-Yi Wang (4):
  drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02, B116XAK01 name and
    timing
  drm/panel-edp: drm/panel-edp: Add several generic edp panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Avoid adding multiple preferred modes

 drivers/gpu/drm/panel/panel-edp.c | 134 +++++++++++++++++++++++++++---
 1 file changed, 122 insertions(+), 12 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

