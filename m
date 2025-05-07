Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4134CAADBBC
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 11:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C0210E381;
	Wed,  7 May 2025 09:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VBmzeJBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE1810E785
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 09:43:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso4769735e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746611022; x=1747215822; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L9NPb1ubbCYKF9SGt/95PQ+zvu0nmCRl9cb2P0c699U=;
 b=VBmzeJBz9AiT06TYINF1mWqaLVu7HmFSEp/zb+lqfUw0kPJxlFrTLn3ckYYQUXt/Uz
 yOu1hOQsIoKPxVoH3hD9CjGU+6cVWEWtdBZInDSgWX+s26LHN6K7IrSJqMY+5ZgMqaou
 wDW2bbUPgC0iWT7gKRzzbPiVRQYWb9s2hkaFnC9TRGqPG+f+22+xLebH/VgDY2MiKXH2
 uNAnI49tXkpUiVn3Kr0Gvi9AhTqKVmfOPJsQjXvcvNXD+/OH4VVffVzoC4qOk4xMdnlg
 zZIT7c5stuHAv7z/NGyMgntKe/I0wlREzW2m0x+D/KMdS6SLhbhasP5apWwYkUxd2UFo
 7jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746611022; x=1747215822;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L9NPb1ubbCYKF9SGt/95PQ+zvu0nmCRl9cb2P0c699U=;
 b=KK16Ln9tvVO2rQu89cI9u95YE9v0Dv8qWP266iabYoOPZfaN6Aih27Ew2u0/e1HL1I
 krf5urY+YRrAZDdKHwru4ETVUHc5M4EgrVcCitDJOirMJTjd90FdHcxHftRNnSUaSDCK
 Wq5t+S8HSA/iubUSKuLKB2quAgjqk024/i8U68Vbiopg99DW0CbPtXDu9dE4DTBbGGew
 Tr9DG0hdStAHFD6g9BfhmPo1qqOC9rDusbZMgdakhGoS7m09G7nVQo95Xd+UQy2NTJj8
 rhS+bVSohBrCSteuHZw1at1ya5kq5dlknOI2fD8BoC3DnGv6yVHJqZF3EKD8t5kuNVzq
 lB3A==
X-Gm-Message-State: AOJu0YzsAsJy3ftJ/yCTQPFHoiYKLgYz3D6f/Zofv5k6Bj+ai6xtZdrH
 l7M/7+BkB5ooPmhcl2V5+G2KjvYLN2Dd+/Y680HjO9tPaRGeItPrWihGnC/Nrj0=
X-Gm-Gg: ASbGnculR9J19RWVg2fJqqMyxeA6EDwlJcW7K3cA0iK1Dkyetd6js628A+Xd6oz3b4i
 vKFNOjEs05xzLyUSyqRhZdQ2/r6GnMVBJ1mvnA6IDJyQ131mT9UrtZksMaktptRazOAjceJdMWN
 5hWpimzMcqemgj5EgcdCUYbF48+oxKOqXF8GI2B6WHa0jjwxwRypHX8cg9Zfts3nesgLk+AFozC
 3YJ8eMUWEt/So+6aNBOE6ZqehNG5nEkvjDCzauOotP3kA5J9pJGBfGdodRt7onro/BUBOIJG2dA
 +QRBjli/5PoyBgyUFxM/AQdtVlF2N+nkhgDGEFhSVqTvp4P7W4hQ7rpZJofQyQ==
X-Google-Smtp-Source: AGHT+IEV2rqMcvfZh9wTygpv0mKHsKvPqg585NNDNe9+GO4gszC9YjKibaKM67xkRPHBeTzlESoR2g==
X-Received: by 2002:a05:600c:4313:b0:441:bbe5:f562 with SMTP id
 5b1f17b1804b1-441d3a813b6mr18131525e9.16.1746611021700; 
 Wed, 07 May 2025 02:43:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d434670csm25360095e9.15.2025.05.07.02.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:41 -0700 (PDT)
From: neil.armstrong@linaro.org
Subject: [PATCH 0/2] panel: visionox-rm69299: support the variant found in
 the SHIFT6mq
Date: Wed, 07 May 2025 11:43:37 +0200
Message-Id: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEkrG2gC/x3MQQqAIBBA0avErBtQyYquEi3MphooEyciiO6et
 HyL/x8QSkwCXfFAoouFj5ChywL86sJCyFM2GGWssqrB84jscWfxKCvPZ43RBdpQj6o11rdVU2v
 IdUw08/2f++F9P1hcgzZpAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=861;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VAw4LvKHXvijiJBA747ZYCqb44eYKH6QLm7/zgf83Wc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoGytLP7ZsXCLnAU7ck672LmJ0r8Vso2SiYY7gYl81
 L5SQzzqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaBsrSwAKCRB33NvayMhJ0bhkEA
 Cz3e6I7dqaLfzDwySsO8D1JhWqLrItxqTXugkjYmruyJWde2JDWIxkcuhOULI1PNdhpveWJgeqkYTB
 aWrOQFx+5VD5BiYJLRNDk0SKYSgXPjYfLv07x2nKVk0jDGmVXEn/4/oGtx24xUG0/3ILiFmfyd2dvE
 3wzwL/xt93syZlkCM+pDOxvyjq1CqKaNMZsHSwfLu9V0+Vvufb0QorApkmmcW7r2BYknEqeu3qT4il
 fvL6AYz3MmlOPxcGb07jHOJFWk/KWur7cBaEUdIVWVqzMbf9dx0oe/z2ONyu4NbxMDXiLCMI/aFZZI
 eFraIn2MdgCHUJy/0bKlZw2wdeegZYD+qFAjuu2oczIcLCD4UVjEyrCfJtL7Hw8elNUbcdTAYkK8IN
 jCHhSlFmzXhMuYMVl69q1PPU9eHLSeAhohFHJBIk21/BBD6H9ZAk22arACBt9eiuxL/tfbFqGIxpsV
 fGHExGBG0WngvhO/OFRmBEw1fZ0jq4f/JPezje0/vI4ZYZGRC9NPQeJ7rw4QKlJByuc1hkgcp1GrQu
 H4x/JseJTzU7pSnnvKpoUsbQViBWw7mlZPov+SX7UV6MsT4cp+0GYkaIV5N9wwBj60aHhJrF73A790
 z5wnpH7wOlMNs5bMWPBOUDeno5Y+qI+QIThQh24e2aZ/8BpvgUllCOlHGmPQ==
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

Re-spin of [1] and [2] to finally document and support this panel
variant.

[1] https://lore.kernel.org/all/20220123173650.290349-4-caleb@connolly.tech/
[2] https://lore.kernel.org/all/20220123173650.290349-5-caleb@connolly.tech/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Caleb Connolly (2):
      dt-bindings: display: visionox-rm69299: document new compatible string
      drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq

 .../bindings/display/panel/visionox,rm69299.yaml   |   4 +-
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 221 ++++++++++++++++++---
 2 files changed, 198 insertions(+), 27 deletions(-)
---
base-commit: 08710e696081d58163c8078e0e096be6d35c5fad
change-id: 20250507-topic-misc-shift6-panel-1b0825c84761

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

