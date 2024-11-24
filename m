Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DC09D6D02
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 09:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FD210E126;
	Sun, 24 Nov 2024 08:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJgIlfCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C684210E126
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 08:03:01 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-7eda47b7343so2691308a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 00:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732435381; x=1733040181; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=okZX6pXA4mfS/KAXJ+4rw/o+tdcSDmzhi/SRAL4gwz4=;
 b=SJgIlfCpcl+6A3OKn0cWGStmlSGWfY17Tc3sdn4ByDDUeWNsO6F4NLGgq3HO5Wlh6i
 gJmecjm6YaiTbXl6kATFAUudHA4o3rjirUG89RzzPhSCtYGQcKTHRJiWCxww1PuTVubc
 lMr5Ha7B7FaOco7/ehyFC+myvyQjKnLwJb8zlxxgZXlnGNUGf2c5jdOh0cR4ilKEhibj
 xUi8BaiqNyUP/7r8dwIXLScHgpUqkXL6zM7ZPGQvOglMuBNQqXmDppy2C96uXyGeWISO
 /K85jA9XY5h6Lq52v4IguDUICoGq5hZN508XiGqLyPo9HptJrfkF9Mm+Xus/tMhtGzDd
 MpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732435381; x=1733040181;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=okZX6pXA4mfS/KAXJ+4rw/o+tdcSDmzhi/SRAL4gwz4=;
 b=VyBfnBb0vm5osgblZ3e1MDDo0Z2L+YIPv5++HtNeucfKjApahKyFgcuVEYi+hqkjUa
 CCtBR/8Q68uA4cEo2q2Pm4f7WS1cd5E7PyoflKyLUkKgYI48SBZo8TCEUHjjUNmu0SdH
 3KqSaQ8ohl7iLgGG/53oSE76lMa1MuPhRk9XfMT0tILeElv0U4j+zhC2vwktSjMo4vC9
 Grt+jq2TS4fu8fVyv1OBYBYsW6K9bHRK/L5l3kyV04n3GfN6+6VCGJ14aggJS+8mHGr2
 hR/uqg6DSBHqY1h8slVULhQ0id2OlAq/pHrLfgne5raZGeq5Oetvk1yFvLNyahS4sLma
 W4Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC248d9bfZcthztkuknX9whgIMFaF+SxShcSNsewPKS0yHcuHhlzSvJVz0SQhoT3zwvJuPv47IuQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAzeqeMMfInQU3O8T8pLQdNwdlLiZqd96DTyOqFSbB/SqSHmYh
 IEKpwqMOvMA0lrjFegdcPO4SbxxCqh3RO9Yh65JD7sHyQV5dLOlj
X-Gm-Gg: ASbGncvqFVCCjcNJT7GHIH+HfPNdXoz1CtGjrVaka5YWL4xaURxUu1XQe0V7seHbBqP
 PEn7O1jlRhPMW+ZmxYESfJhJxl51YqSQTAOjiLg0AKzibnDBQE8AjklQ8UhUalyrlGzA5zBjm2p
 4x4ZrZzTudbI9JLp1I3cPWlK6AjIIS1erIa+tzYOacDOVTX7+g1ZmPRcYMBgqbx2W57TyFZ8CvY
 inVFg9j76vP/D9Azf7peGpLhCAUQpsmdyIrb+5cy8IebhhFQAhxIblSxfAweGQ=
X-Google-Smtp-Source: AGHT+IFpKGhehrzqjP+Je2lUITne1F2+KG/GZH3kSIJmjMcz3C+YkJc34BMHDi5B9s701wdNb2J8ig==
X-Received: by 2002:a17:90b:3e8c:b0:2ea:7a22:539c with SMTP id
 98e67ed59e1d1-2eb0e125416mr11955627a91.7.1732435381155; 
 Sun, 24 Nov 2024 00:03:01 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ead03de6f6sm7956708a91.34.2024.11.24.00.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 00:03:00 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Ryan Walklin <ryan@testtoast.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/6] drm/panel: nv3052c: Add support for new Anbernic panels
Date: Sun, 24 Nov 2024 17:02:11 +0900
Message-ID: <20241124080220.1657238-1-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Add support for new panels used in the Anbernic RG XX series.

This patch series adds:
* YLM-LBV0345001H-V2 `anbernic,rg35xx-plus-rev6-panel`, for the RG35XX Plus (Rev6)
* YLM-LBV0400001X-V1 `anbernic,rg40xx-panel`, for the RG40XX series
* YLM-LBN0395004H-V1 `anbernic,rgcubexx-panel`, for the RG CubeXX

Hironori KIKUCHI (6):
  dt-bindings: display: panel: Add another panel for RG35XX Plus (Rev6)
  drm: panel: nv3052c: Add another panel for RG35XX Plus (Rev6)
  dt-bindings: display: panel: Add a panel for RG40XX series
  drm: panel: nv3052c: Add a panel for RG40XX series
  dt-bindings: display: panel: Add a panel for RG CubeXX
  drm: panel: nv3052c: Add a panel for RG CubeXX

 .../anbernic,rg35xx-plus-rev6-panel.yaml      |  60 ++
 .../display/panel/anbernic,rg40xx-panel.yaml  |  60 ++
 .../panel/anbernic,rgcubexx-panel.yaml        |  60 ++
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 588 ++++++++++++++++++
 4 files changed, 768 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-rev6-panel.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rg40xx-panel.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,rgcubexx-panel.yaml

-- 
2.47.0

