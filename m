Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAAB686F3F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 20:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C1610E441;
	Wed,  1 Feb 2023 19:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 502 seconds by postgrey-1.36 at gabe;
 Wed, 01 Feb 2023 15:15:19 UTC
Received: from out-203.mta1.migadu.com (out-203.mta1.migadu.com
 [IPv6:2001:41d0:203:375::cb])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A838410E40B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:15:19 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1675264015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nxqm+4IZRFfG+BFvC8+di0Y0mHZDeyM6lhNBB5I4L7U=;
 b=GUq1RuIKjuHYjuQS0jputOzcj0/VxfTUnQhpAlMxu3EKAJpuWWXJ4wcbA/39Jk7pSv0Bcu
 NoHJhkYBq0vLxCoNPoCwb9Wy3dweusdLPCpaRvbde4ZOvdGWPTIKuecSwKFZT7iBO1asdX
 MlYBWxkGto5S34mB4mqwF/MTA6lJJB4=
From: richard.leitner@linux.dev
Subject: [PATCH v2 0/2] panel-simple: Add InnoLux G070ACE-L01 support
Date: Wed, 01 Feb 2023 16:06:28 +0100
Message-Id: <20230201-innolux-g070ace-v2-0-ebac7aaf004f@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPR/2mMC/w3LOwqAMAwA0KtIZgMxDn5uE2u0gZJCiyKId7fjG
 94LVYtphbV7oeht1bI3cN9BiOKnou3NwMQjMQ1o7jldD540kQTFYxcewrzooQxtbVIVtyIeYnt
 +pfR9PyMz4h5mAAAA
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=674;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=qICrJNgSNpd/ysAFIuK7QMeqbUpb/LYnyvOjJ/HgBBQ=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGJJvNfBVv8synxZ3gD9/9u59d6c9y5i862bqvO8361hn8YSZ
 zfc61VHKwiDGxSArpshib8zV7p5b9r5SUScXZg4rE8gQBi5OAZiIDy8jw6sZNxbmnU3UmXydZa6P8+
 s/hb4prla3T2hrfHfyFUld9pXhf4Dm1h9dqjM+LwiZHMjz+lfoETeLT8t2Fpaq3Lb/XrJ2NT8A
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 01 Feb 2023 19:50:13 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for the InnoLux G070ACE-L01 7" 800x480 TFT LCD
panel with WLED backlight.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Richard Leitner (2):
      dt-bindings: display: simple: add support for InnoLux G070ACE-L01
      drm/panel: simple: Add InnoLux G070ACE-L01

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: c0b67534c95c537f7a506a06b98e5e85d72e2b7d
change-id: 20230201-innolux-g070ace-fda21c89efe2

Best regards,
-- 
Richard Leitner <richard.leitner@skidata.com>

