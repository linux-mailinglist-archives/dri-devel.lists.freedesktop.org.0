Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F76B705D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C5F10E486;
	Mon, 13 Mar 2023 07:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-5.mta1.migadu.com (out-5.mta1.migadu.com
 [IPv6:2001:41d0:203:375::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5297510E482
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 07:51:26 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1678693882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nxqm+4IZRFfG+BFvC8+di0Y0mHZDeyM6lhNBB5I4L7U=;
 b=M8Du3949TGpyn2LG7wdznTRteqQh3mthjAdt+w8K8WtFnZHa5Hu7N+eGvYSqaGqGAIGG0/
 tc99zF7hLgnSbcZesZMdrw7Mr1givl2KLdYRJ47AiExkjebLXDhf6Nl1xzkXy2h7+K+xVg
 fQwiShy8eNkR/ka+bX4VVDEAC4rQypA=
From: richard.leitner@linux.dev
Subject: [PATCH RESEND v2 0/2] panel-simple: Add InnoLux G070ACE-L01
 support
Date: Mon, 13 Mar 2023 08:50:15 +0100
Message-Id: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=674;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=qICrJNgSNpd/ysAFIuK7QMeqbUpb/LYnyvOjJ/HgBBQ=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFL4rv7kuNpeIVVdZesScHCv9vqO4NLNQhNaV2sJ/2bUmrZ0
 7bb1HaUsDGJcDLJiiiz2xlzt7rll7ysVdXJh5rAygQxh4OIUgImErWdkmHFcRVLv7OnVXJ79rIwLS+
 XPBP3zuFMYcduvQ9pXSrOFhZFhjfvKGTfZBa9fEf0WpFhyxedV/5KZt1KUPoqx/N5z79o8HgA=
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
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

