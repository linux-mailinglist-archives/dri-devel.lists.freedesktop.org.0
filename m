Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F3AB0E01
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA95010E9D8;
	Fri,  9 May 2025 08:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s6LyQe8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF510E9D8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:59:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so11775945e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 01:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746781184; x=1747385984; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gh/ALdVpxuaXhZUL5QFtMT28H7kuOgOyXFrKwM0kSAQ=;
 b=s6LyQe8yRivZbtP8F5uYo0B4r0aV5B1RnkqNo5biYoIdD+rUF4SOwkDlqK406scQrb
 HrjE1cA54rtl+fJjLNjCDU9cyYbI9NRVV71W7sjHj9eJCM/94RNF34ioUjc5a98ZESHG
 q+9l16Y2nQHW1QfvJSu+zE8qH2tEnla8w0s7r1d6+Z1v9d2dZmIQnA+B5doBbJkcNI3D
 i/RSvR538BUlVOXplnPj/oFI5J38EKQdfWoAbWMUbdiJYhiTEpiToNrAwBlo+GNS92tQ
 itEENAtqBtHL4vyl00TlWxRkN37cLMSkUpoDwslJBvWprPo6qIpoUEBzsnBIqVFertiU
 t8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746781184; x=1747385984;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gh/ALdVpxuaXhZUL5QFtMT28H7kuOgOyXFrKwM0kSAQ=;
 b=kJGBLfTIPm7x/JvwOJq1L7Uks+B9ANqHXb85gttpVUrOt4lZs1bWtEbTNTXjEe3vrE
 GEneEZn+t1/EHp7T4XkNpa/lDF6osLaGAlxO+wx7sZ9K9IaBPEJGAOttlzUFt9da5LdG
 MXOK7CYd8QCJ92xwMmNME8ccU8ctN+JsvR5snDol22y7n14/Km9EDm0CUgYO0Xxnfcus
 Dk3FcdQDmYVzOIdoBs1VW+ftxFE9Lms+l0HDckAde/RKuD9fXUmqrgo2Ygc9zXpbjHaj
 I30KOF+RIybyx7hOmRxUL+EtdMNf6EFSGep1dzIEiCblKdBor9ymXRtFzlGexgtyTpFR
 zlqQ==
X-Gm-Message-State: AOJu0YzErdLvIZdqZWLCFzZMMECz+qLfqBEp4w68E17d9tu1wuy8Ubpz
 E18YtvclRpjNSAseIAIR/VN758K7VNi7Ns+HYdLURDwngjRGNujbB9aMKvhCHPQ=
X-Gm-Gg: ASbGncsYQ57tBG2RqqDfDYSPxESIfHIJ+z2QGBuK0Vnbvo+KGoQHJaTwMf0K3jEbMFq
 4gkOKnQE3RftpZPFYa0/zt43/VNZBOrIo95f5p6ov6FJtxE57LOVzgGNZMQvfXfWHoDIW2Tp4Zv
 y/AniJsq+9jN2WI3tlaI9EQvq2G26o+WbF2OagPSfuV6ESLxZH3cec7/DnR0q6HDLJXR27/nLqU
 R1eUvqDGEtDPhVCNhkWXrgLFTMWZsOVXalgTOU0ZPlu6dmxTLQYNVKVyYWh+7nJ4ZECtXK/OjL1
 Y4AK8ytfmNZfmLQZi7qy6oS8BXet+u8+6NEHCcwRzxTQdsNIIS054u/lJ4mzEg==
X-Google-Smtp-Source: AGHT+IFFgVDU4MTbGBoj+CE2O5CNv1Tuh+orHpIHTEsK15CNC20+hPfSaqIvpAo8yJceBmfZVzw5/A==
X-Received: by 2002:a05:600c:1e02:b0:439:9737:675b with SMTP id
 5b1f17b1804b1-442d6db8213mr21706195e9.7.1746781184525; 
 Fri, 09 May 2025 01:59:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df639sm22369115e9.13.2025.05.09.01.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 01:59:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/6] panel: visionox-rm69299: modernize & support the
 variant found in the SHIFT6mq
Date: Fri, 09 May 2025 10:59:38 +0200
Message-Id: <20250509-topic-misc-shift6-panel-v2-0-c2c2d52abd51@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrDHWgC/4WNQQ7CIBBFr9LM2jFASouuvIfpAnEok1RooGk0T
 e8u9gIu30v++xsUykwFrs0GmVYunGIFdWrABRtHQn5WBiWUFlr0uKSZHb64OCyB/dLhbCNNKB/
 CKO1M23cS6nrO5Pl9lO9D5cBlSflzHK3yZ/83V4kCu5YMXYz3yujbxNHmdE55hGHf9y/bqJ6Kv
 wAAAA==
X-Change-ID: 20250507-topic-misc-shift6-panel-1b0825c84761
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=begbQC3Twc7/He76AAI8eeSeG2eczVhiBKL1kb6Uf2k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoHcP86ecbUVbY8XGHkeOFwBPL0TeGmWc+Z5Tjdhbs
 6uYaUG+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaB3D/AAKCRB33NvayMhJ0bmBD/
 0RaW9R/7cvEWGoMd84BC18u1Z7WkHKT5aTnR++KlVIG2iFejVA8J6T+HhTV/u9wW1DseMnEBUOfHUP
 fPdUhPyv/3hFJyhH9gJ0P9R1lpTc0oS/xhJm15NvQXMDpN7jZCQKq1xg+rsXTMZd73g5lNyERftpOH
 fBDTme8/rVPIZWpj8fYMQ8r0PbmxEzBBVhP1p0MiZYLVpe0EVxjsxYtzGzZJ5lQcWyrKyJ9pCgOCwO
 SBos9KMIZy2tIBSONNTF+3csyebot7cuMlPBiHeob774/p85o63kswYI8kRVkFXjDLtNbzyME+EW/I
 ixMjrZaO6muGUSlyP1JhQIViA8O2QNEAZubTQZV3Ltk4RXU8UVCIChBbGetz8mquPx9994CUaMh9i5
 rUXzeKuYwYwCptctvKpDKEO8/GsXeefxQMD6KO5wpeV+tsDBj3zV9Lictpj1kDF9Wf9tGWq4vtCzKr
 /BvUGITtdOnjK/lmlgS/3ixkseugjD3ityU/7/LKQUDuOjb3tBwS+RLQAZeKQ6rxHoBX602Z3BQZ9S
 K67+rhYc8aFDGGxB4nPcW2EH5Ymfs9Hc3lV7AJJrNC34Xs3YkE5uKy+360KBODAn2P4sHlE6EGQZsD
 AC8+xmG0ViqfEmX5jCcBxbNAH+P+egAssc0Pn/yv09My3yVUvUIeaKiIt8+g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Modernize the driver with panel_desc, _multi, const supplies and new panel
init with refcounting.

Re-spin of [1] and [2] to finally document and support this panel
variant.

[1] https://lore.kernel.org/all/20220123173650.290349-4-caleb@connolly.tech/
[2] https://lore.kernel.org/all/20220123173650.290349-5-caleb@connolly.tech/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Add panel_desc to support the variant
- Switch to _multi calls
- Switch to const supplies
- Switch to new panel alloc
- Fix shift panel init seq name
- Link to v1: https://lore.kernel.org/r/20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org

---
Caleb Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible string
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq

Neil Armstrong (4):
      drm/panel: visionox-rm69299: add plumbing to support panel variants
      drm/panel: visionox-rm69299: switch to _multi variants
      drm/panel: visionox-rm69299: switch to devm_regulator_bulk_get_const()
      drm/panel: visionox-rm69299: switch to devm_drm_panel_alloc()

 .../bindings/display/panel/visionox,rm69299.yaml   |   4 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 253 +++++++++++++++------
 2 files changed, 189 insertions(+), 68 deletions(-)
---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-topic-misc-shift6-panel-1b0825c84761

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

