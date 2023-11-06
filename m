Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAF27E2E8F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BE110E41C;
	Mon,  6 Nov 2023 21:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288C010E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 21:03:41 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2802c41b716so4096195a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 13:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699304621; x=1699909421;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P0IQyvMq1nhgyAfkUJUt91oFnqOK0wtJnc9t4EbDGpw=;
 b=CQUMEGo+V1olZllCge2EYc7bxUwueM58+5JjRBlzNFxa87xrv/9cCmDevYlxJgNTpc
 y89FWBzWiZbPVVZU73KxEWgxnT5otr+ObsNPyY42IxfPTqhgEfigSymiR+LJel6XbNsT
 yucuWfK0PW4rLV5si85Eds5T0SbsxvgZKFrwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699304621; x=1699909421;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P0IQyvMq1nhgyAfkUJUt91oFnqOK0wtJnc9t4EbDGpw=;
 b=Od7YH9+ASei1Q/cwb6FhJ7CjqBhNycYOyn+0GZ/gQ3fpI5/7LB+/rVlpwWJGTqd220
 kPxVMn1tSY0ClGTdm9JLXCnvTBUfF6kFlh5XnQ/1lR4F3aGUtp9BLkNYB1KB/1J10ESH
 U4/vydCKDGcnPYn69to0u37+4SMctySHI/oaoY1HGewn8YbVOXrkV8E5Zvx7AgF65RNg
 1+yfYDC9yfAB2rNnrttKko9sHW1dJ0LuNyMYSDgBBvNNnRD+iu8GCPBEzzITLo0g0HZV
 1HWuXJL3dz3YrD61CNkJibI8V1exuj1UG8OTA/DW4ZEAl25sirMg54yO3+O6mamOkZdt
 s3eQ==
X-Gm-Message-State: AOJu0YyvqiNAAIsA+CNhebkPIH+XALPj9XswpSsi10P03gzPS9LtHZza
 SSSbxPKeGxrqTUMtKPPYx9HQrQ==
X-Google-Smtp-Source: AGHT+IFltuGcFYnuLj+qwXqqKSiyLd6vdgDwuo1FCXHKemqumq0pTt+FlW/esVerE7+MOVMCbtvuSw==
X-Received: by 2002:a17:90a:ca11:b0:27c:f8bd:9a98 with SMTP id
 x17-20020a17090aca1100b0027cf8bd9a98mr21793104pjt.40.1699304620658; 
 Mon, 06 Nov 2023 13:03:40 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:3374:ff6c:474e:a78])
 by smtp.gmail.com with ESMTPSA id
 11-20020a170902c14b00b001c75a07f62esm6291220plj.34.2023.11.06.13.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 13:03:40 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 0/3] Add a few panels and use correct modes
Date: Mon,  6 Nov 2023 13:00:49 -0800
Message-ID: <20231106210337.2900034-1-hsinyi@chromium.org>
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
v3: https://patchwork.kernel.org/project/dri-devel/cover/20231106202718.2770821-1-hsinyi@chromium.org/

Hsin-Yi Wang (3):
  drm/panel-edp: drm/panel-edp: Add several generic edp panels
  drm/panel-edp: Add override_edid_mode quirk for generic edp
  drm/panel-edp: Avoid adding multiple preferred modes

 drivers/gpu/drm/panel/panel-edp.c | 130 ++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 7 deletions(-)

-- 
2.42.0.869.gea05f2083d-goog

