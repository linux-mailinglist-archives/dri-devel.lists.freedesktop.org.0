Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E0251303
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BAA6E87C;
	Tue, 25 Aug 2020 07:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs14.siol.net [185.57.226.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152CB6E218
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 15:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id C9FE7525761;
 Mon, 24 Aug 2020 17:04:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id FnGb3Jyiudtj; Mon, 24 Aug 2020 17:04:47 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 76D4552576B;
 Mon, 24 Aug 2020 17:04:47 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id B9A56525761;
 Mon, 24 Aug 2020 17:04:44 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: mripard@kernel.org,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH 0/2] ARM: dts: sun8i: r40: Enable mali400 GPU
Date: Mon, 24 Aug 2020 17:04:32 +0200
Message-Id: <20200824150434.951693-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following two patches enable Mali400 GPU on Allwinner R40 SoC. At this
point I didn't add table for frequency switching because it would
require far more testing and defaults work stable and reasonably well.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: gpu: mali-utgard: Add Allwinner R40 compatible
  ARM: dts: sun8i: r40: Add Mali node

 .../bindings/gpu/arm,mali-utgard.yaml         |  2 ++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 22 +++++++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
