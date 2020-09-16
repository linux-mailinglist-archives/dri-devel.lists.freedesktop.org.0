Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83126C3F8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 17:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DAD6E05D;
	Wed, 16 Sep 2020 15:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF836E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 15:01:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s12so7237048wrw.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIu707qF3XC1wFSQ0JUGDpXqJcRkuCHBFIGNuiyznGk=;
 b=wijQmT9vsB6ZR+aWtfyqwpoZM80cItkpJVGHdMlmCQTeVLozm9Yboz64+dfnBsTDcb
 AQ05GRsBvv1zgg0nM+bVTnixJiEzOdxwjzDEWmRryfrOMR6vKJyM7TlG5B44gUPpkhYB
 cKkzrNChnol0O+vHwKZWC3u3pSpHaY1ytGp+4nMeT2bttuoRS2JN0lmVucAKbZ9mIDK9
 5lJJE0y6YIa/olkfyVVqXwQzQfCSyRzHaXYhTbRiYSQ1yT9l9KlUiYWgrq5vFr9bh4wr
 XmtQyuq7zY7Y59xieNCJKTY0ID76DPAvj4pRWxeyxFu1LbPWGBhJXQXR/0llRYDZiEuq
 5SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIu707qF3XC1wFSQ0JUGDpXqJcRkuCHBFIGNuiyznGk=;
 b=RzlHoMGJJve6E8M1/k7/YXO3MNXUlKqm/hCbX0iYHlVrSyO4ctiSRli86ZZOSaALx9
 aVQunCHPULzbKAV4Rs/kfa6AqM7RedXFhpSNdzomlDCh1GVitl7RGGQu9xGK7VVxinYn
 xn0z8Qd5Cg//2jTFAHyUoGfIddvgtZYjHumttr7+K7tOeclveqHqKyn5KTDRDF4TVfeE
 2trJZlDhf7zcor82E/DtDRv1erU4yhuQmR/Qs3WzTwgb3Hi5Vb9E8EmvrbqEcm1ou6M0
 Vrda7N1aXJ0NRMIkR3GclWwJj+2W2CBTDxf4bT6pi1BkyXnqLhXdPC/95pVonlw/qsja
 v1wA==
X-Gm-Message-State: AOAM533/5MOH0Tm7u4H9GypssxWUWFnu5nYP2Cl0nchwZLZCYviicV6g
 RvOwe89b0pY64OfD1TzZNQMeeA==
X-Google-Smtp-Source: ABdhPJx8Y/UqOEW6k23Aim2WVavTxhbpjN+oKkic+uEsOX4V6GEuQI6WasgaF8S7gi1dWVdYZ6QyyQ==
X-Received: by 2002:adf:9e41:: with SMTP id v1mr29697264wre.60.1600268512806; 
 Wed, 16 Sep 2020 08:01:52 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 m3sm33275243wrs.83.2020.09.16.08.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 08:01:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com
Subject: [PATCH v2 0/3] drm/panfrost: add Amlogic integration quirks
Date: Wed, 16 Sep 2020 17:01:44 +0200
Message-Id: <20200916150147.25753-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The T820, G31 & G52 GPUs integrated by Amlogic in the respective GXM, G12A/SM1 & G12B
SoCs needs a quirk in the PWR registers at the GPU reset time.

This serie adds the necessary quirks for the Amlogic integrated GPUs only.

Changes since v1 at [1]:
- removed the BROKEN_SH quirk after [2] was sent by robin
- rebased on top of [3] by steven and moved the vendor quirk in the proper quirk function
- added PWR_KEY unlock definition, and cleaned definition

[1] https://lkml.kernel.org/r/20200908151853.4837-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/cover.1600213517.git.robin.murphy@arm.com
[3] https://lkml.kernel.org/r/20200909122957.51667-1-steven.price@arm.com

Neil Armstrong (3):
  drm/panfrost: add support for vendor quirk
  drm/panfrost: add amlogic reset quirk callback
  drm/panfrost: add Amlogic GPU integration quirks

 drivers/gpu/drm/panfrost/panfrost_device.h |  3 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 11 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 15 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h    |  2 ++
 drivers/gpu/drm/panfrost/panfrost_regs.h   |  4 ++++
 5 files changed, 35 insertions(+)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
