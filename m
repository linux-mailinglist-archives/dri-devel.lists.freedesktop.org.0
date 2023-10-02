Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81A7B5B44
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 21:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4097F10E234;
	Mon,  2 Oct 2023 19:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D810E234
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 19:30:21 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1dc863efb61so59615fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Oct 2023 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696275021; x=1696879821; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jUiwZsfNL+Nrg1jXw0JxGe3bXbWu0f0psKz9r2m5WiY=;
 b=DcDx5UZWjcDHcBjQihx42Z947/VbDjlsi/NNTlNfdUwQ9iAbkzeb2b/CkhHioxVprd
 yGk0slKdk0431XMZEsHlWPAPJ0BJ30IYcA3S/PqVkSQjx3munuchkVtIG4Sz9hlIej2A
 tr7gHWmXG0nPOX9Y/03oyMFX+4NV12DdSemhMj2aiwhFO2Izr7E/1Z0YQWVVD5YMg29V
 hciDpPpxXqXyv7BCiz2AYQmj6dss64sZ2KYoHZZeumSxOi2Up1yBZ4Lj75vhFGyyvguU
 SMp7AWtmJomQkMRDPnRu2WwrUsxkHlZUmB3ERBcpxjXMWcO8AJ6RRQvnM/7mg7SzkvA1
 hCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696275021; x=1696879821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jUiwZsfNL+Nrg1jXw0JxGe3bXbWu0f0psKz9r2m5WiY=;
 b=J4D/KyQ+XqboO/okgfraYPisbNvlZDx8Vi/0Io5Zi325/QzH7+C3N0M4vzuQgvlJow
 oAYFt+43p/tMljiCL9qHVN5jtKyaxVLQa0Tr55JkqLbZxcVI469WcAtRKu42g+Gw6mHs
 CtaFkyrl1GtP1kZ86andbDK/MUM3BSctgfBP6pTfJ+uvJ+o5R9O5LC0RjLgKD6SSHZ0p
 jyGFhi/Rsto5PULgOGO3Xjf+HnU0VpcRb59y9P8Nl9qEuEfmXZfIECDc865O0qHnZ/Bf
 lEWcsGv2cuPSAqFe+X+lKnHydzZekiifChVUKDUxWa3r6BxojrL2EuVPdSea8H8UPAwK
 DmdQ==
X-Gm-Message-State: AOJu0YwBykW2I0B3L6lmrXtruia1yJxf96IQRZM3XOOF6wMUHHrMvoMt
 wOJzdcGLoq/RuNgxgIlNNpE=
X-Google-Smtp-Source: AGHT+IENy5FCBijNCtcz5aUwT7z2wWql9RTrKgtXWzxLeSfXf7oVjc5YmkXzfoYQwqhWA/3IUgiq7g==
X-Received: by 2002:a05:6870:a3cc:b0:1d6:cbcd:80f8 with SMTP id
 h12-20020a056870a3cc00b001d6cbcd80f8mr13452652oak.54.1696275020746; 
 Mon, 02 Oct 2023 12:30:20 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 ep35-20020a056870a9a300b001dc8b2f06a1sm4846398oab.55.2023.10.02.12.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 12:30:20 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH V3 0/2] Support Anbernic RG351V Panel
Date: Mon,  2 Oct 2023 14:30:14 -0500
Message-Id: <20231002193016.139452-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG351V panel. This panel is mostly
identical to the one used in the 353 series, except it has a different
panel ID when queried (0x4000 for the 351V, 0x3052 for the 353 panel)
and will not work without the inclusion of the
MIPI_DSI_CLOCK_NON_CONTINUOUS flag.

Updates from V2:
 - Modified the driver so that we only apply the
   MIPI_DSI_CLOCK_NON_CONTINUOUS flag when the compatible matches
   a panel (the 351v) that needs it.
 - Updated the binding documentation to be consistent with existing
   panels.

Updates from V1:
 - Revised text in devicetree documentation to remove references to
   specific hardware.

Chris Morgan (2):
  dt-bindings: display: newvision,nv3051d: Add Anbernic 351V
  drm/panel: nv3051d: Add Support for Anbernic 351V

 .../bindings/display/panel/newvision,nv3051d.yaml         | 5 ++---
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c           | 8 ++++++++
 2 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.34.1

