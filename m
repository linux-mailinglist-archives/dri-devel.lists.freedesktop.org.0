Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F0BBCC5F8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 11:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA3110EB9A;
	Fri, 10 Oct 2025 09:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YyWV5lhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350810EB9A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 09:38:04 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 98e67ed59e1d1-33255011eafso2028291a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 02:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1760089084; x=1760693884; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DIh2qwkMoeCHH2ZTOMpMki7Y9wRE+NbEr8T8mhJQZZg=;
 b=YyWV5lhSAlJt4lKRqzT19dYKjI8qGJrv31rQvXpuN9wUJHY5aiMbLwW+Se1mVtJtUw
 MU/WHJtJJ43xhFjM6slyLVbKAlSXuc7YTZlgTlb7DO1KpfDheaCVA9cB7g9tqqMH1hAT
 ebc4WGjE3NBe9Ae/g2p668p2poL8pqh7KJ6oozWDsHTipzlWttwixlIdTPgM9FeqymB+
 1/m2cfb2Xq5MSoq/D+dewT0FQvejo8PSD3eH+r3kmzRefO6sOC6b0jRbF2slJDeAEo8t
 VSNLQlb7ox+kn+ODLN+FWLYwW0kg7Fi33sLG+Bddj5IUDq4wQaKpFCzNDgDJyOsaAcep
 CkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760089084; x=1760693884;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DIh2qwkMoeCHH2ZTOMpMki7Y9wRE+NbEr8T8mhJQZZg=;
 b=HbjusoUTk3n8Shxu9w0Lm8u4G0vdAGuMEPYTs38MxrIEhfqGV2pxGvDo1y23LlgN6f
 MkvSgx7J9zq3jWYVzaHvG0bJ7I3WGSi1Eye/d9aZujQXxuJBDDs/N1MWcrgGz9zxMyU6
 DxO7ydZxefx3pEEMzPorkR8j7prJa3ktSUDgY9vztKLrERSJAVxiMgkg1U1Q5fCy7jIR
 1Tq1H4rOM4+cT/ZJh1lreWFI0mcaw5ua+nfSr3sXX5UTEAfw+PyewRUhkjQGJy1Uqcwf
 KHL2v7ySRCi2zRxhrg0z6LqmmUF4Yp1CDlmgwkgUXbm/o+yIZJ50VH/KzYVxXHgZSbTJ
 l7wQ==
X-Gm-Message-State: AOJu0YwAXHKHfdKF0CPhflcnb/R9y2qq90zEVl8CWCSL86fvRyX+z9bL
 xbytp4il3FLjpSyZyNwNGFnwmUT2WKrL4UPAjI1aTPGcLdmtazPpaPYOFobz028TjLk=
X-Gm-Gg: ASbGnctb/icjCdztJPxtTH+qfg7h2Hq7NW/q5W0rx430IWns9nmBj45zNHCABzLknHy
 81AyVk5YcDfooVFvieFzDcC74LZghscrtLMbKE9cXcQvGpfblaSY3FcVemDhyih5T3ZHlu/1jmq
 DHJ9k1iAkQBDNQsP0VBD9+503lhRFMRDv5XAOSfsnPb3R3VqVRuFwnK8lDj92m2/XAefXgm0YLm
 0Zd2xx2G7K0KqMiJdZBVvDAAVdMp+YnBfWqFgbjT8EnQEylDee4v4I2ZmENqiDHKYejo3/luGmJ
 c2RVHZm8BixgvCo/eUtnWvbKboMY11dBzWkRORuuyP2YlH2LpAc6khUjnxf166mRzHaAuCAmSUv
 YLRI3tZg0qHZ4oWeXqP1AlvjKjIxNE322TzGgKL7dTJ2UcBU2b8+DS+zhnAwvwHhoH+o0F3ipUQ
 DaQcYM70IC4WS3kcgjoIc63hc=
X-Google-Smtp-Source: AGHT+IE2wj+eZssA6TSzpJaJjIg40oge1dIPe73EIfDWpkmFrmkYu8Y+3/4LATAVo6bm8P7VtzzjWw==
X-Received: by 2002:a17:90b:3ec4:b0:32e:51dd:46dd with SMTP id
 98e67ed59e1d1-33b5116b782mr15637151a91.16.1760089083929; 
 Fri, 10 Oct 2025 02:38:03 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b61a392cdsm2668196a91.7.2025.10.10.02.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 02:38:03 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v2 0/2] drm/panel: Add Ilitek IL79900A controller and bindings
Date: Fri, 10 Oct 2025 17:37:49 +0800
Message-Id: <20251010093751.2793492-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series adds device tree bindings and a DRM panel driver for
the Ilitek IL79900A MIPI-DSI LCD controller, which is used in the
Tianma TL121BVMS07-00 12.1-inch panel.

Changes in v2:
- PATCH 1/2: Address Rob Herring’s review comments and align with panel-common.yaml conventions.
- PATCH 2/2: Rename driver to panel-ilitek-il79900a and align naming and structure with existing Ilitek panel drivers.
- Link to v1: https://lore.kernel.org/all/20250930075044.1368134-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (2):
  dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
  drm/panel: Add driver for Ilitek IL79900A-based panels

 .../display/panel/ilitek,il79900a.yaml        |  64 +++
 drivers/gpu/drm/panel/panel-ilitek-il79900a.c | 394 ++++++++++++++++++
 2 files changed, 458 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-il79900a.c

-- 
2.34.1

