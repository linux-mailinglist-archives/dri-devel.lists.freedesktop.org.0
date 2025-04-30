Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231DCAA455B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A6510E706;
	Wed, 30 Apr 2025 08:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="1pPrsFN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C7B10E709
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=hQyzVgSeS1zqqoyGREtN+mz33pRSUXUrrYNi91vis3M=; b=1pPrsFN6Bx75iVbdytX4QUGAef
 SBhDdRSKKdJoVVMtn7Njgqt5S8xRJZUA1g5nlHezxIktzKi7mCO+n9QZWuhKqx34OjHdThxaztS5v
 lncGWqIQgAXDRcl1ucg6mlD9+VqyByfEJH6Lnd3m0NM703WKcrVVk4AcqPaflzZ3JuT2LCIh5DRhz
 vhtWcP45xbKyfRxkzNgVdHVEMSoIrDvbu+gs2Z6U9J6mBke+khQLi5bLPlqkOopVWlhx8OZATxKSe
 DksVca83S65gqyudQpD7Ca1oD7nW/a6NE1pgu28NskLsRjtGjyACSSwuacjNFti1lRB4z8ViO6E7l
 xmyQ6+Ow==;
Received: from i53875ba4.versanet.de ([83.135.91.164]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uA2oV-00032E-P0; Wed, 30 Apr 2025 10:29:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Date: Wed, 30 Apr 2025 10:28:48 +0200
Message-ID: <20250430082850.244199-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

Working on an upcoming board dts, I noticed a dtc check warning
about the port node and at the same time the kernel-test-robot
noticed the same warning with a overlay I added recently.

So allow the port node in the binding of two leadtek displays
to fix that.


Heiko Stuebner (2):
  dt-bindings: display: ltk050h3146w: add port property
  dt-bindings: display: ltk500hd1829: add port property

 .../devicetree/bindings/display/panel/leadtek,ltk050h3146w.yaml  | 1 +
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.2

