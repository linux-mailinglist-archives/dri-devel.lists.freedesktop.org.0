Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C81420AD44
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 09:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D176E413;
	Fri, 26 Jun 2020 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 633 seconds by postgrey-1.36 at gabe;
 Fri, 26 Jun 2020 03:41:10 UTC
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8C86E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 03:41:10 +0000 (UTC)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 4C59C7EC0E;
 Thu, 25 Jun 2020 22:30:35 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1593142235; bh=Hy3qKfXHwG5eYAJuCpaXK7TCeMP269A9UoaRSa1A4+Y=;
 h=From:To:Cc:Subject:Date:From;
 b=J+yD5JTrAhhUHcuP4Umd8+0REVO9aX6zmjExV4ypWwr2/THFo1WGVLOv80v/jC3CW
 FtvPg2HK4mqtKHxV7alHkAskEvfIkjL8L3viNb/T+Xd1HweEETvLU2p8zw/5k0Nuwd
 Q3+rdcBOp6dzB2nnNvKNcRt+Q5gKFB9uA4sMD/Vffs3NfEXNapYcH3jo6WxsoDebCU
 uU7e/D/4fCC6MMAvugK/DDjPxtjR94jnc845+E+7lVVaVixpncKsv/vSYcNEVvdet/
 UKxgCqBCGYGpvCtHDF5dj9biAZM+EP2A+dLP4aVxC2dA/gzoj6Ifbn0ncetgokWNgN
 jBd3XeWd3D1yQ==
From: Shawn Anastasio <shawn@anastas.io>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/bridge: analogix_dp: Add PSR toggle
Date: Thu, 25 Jun 2020 22:30:22 -0500
Message-Id: <20200626033023.24214-1-shawn@anastas.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Jun 2020 07:36:15 +0000
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
Cc: airlied@linux.ie, a.hajda@samsung.com, linux-kernel@vger.kernel.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a commandline toggle for the Panel Self-Refresh feature
to the analogix_dp bridge driver, much like the one in i915.

This is required to work around a hardware fault in some Pinebook Pro units
from the May 2020 batch whose display panels seem to behave sporadically
when PSR is enabled.

Shawn Anastasio (1):
  drm/bridge: analogix_dp: Add enable_psr param

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
