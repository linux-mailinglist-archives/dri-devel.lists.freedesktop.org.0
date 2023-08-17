Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA677F180
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 09:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771F610E1C0;
	Thu, 17 Aug 2023 07:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAE210E1BD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1692258757; x=1723794757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GEGe5f4/UbLT91KKdUFuOYO3OJjyIKamYwWn+TgLavk=;
 b=hCd/3RIk4rEmmXKdPITMsWY9jnmPaqzkGG8TGLDIIEWX+7R4zDtcVe56
 Zs3v3goZqG1Einak/FW2we+ALjbxhwdiSqkNwg8qAXJb3xahs3KZT/WDu
 nWUdt7Uz67e7WEdMIiebAhbdxrn+RdBzjl5HBCwOWnKRmxFp7w8I931iB
 UpdyijSIpk1L+nEG7cluOn7jzcKbHOHNi7Mr97yB8IusHkL5LaxuI0u9f
 N55UKIHQ2dKCuvSwue5JGpXxgSr0m1DGVQDvjOBHp3UtMjN4BQrcOHo7D
 wXYeiPddkkOSXLZNxElxrHUrKw3cSzVOshGwx6Nhc/1MNCp5K91XOGUgh w==;
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="32486938"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 17 Aug 2023 09:52:35 +0200
Received: from steina-w.tq-net.de (steina-w.tq-net.de [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5ADF2280075;
 Thu, 17 Aug 2023 09:52:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] Improve tc358767 debugging
Date: Thu, 17 Aug 2023 09:52:32 +0200
Message-Id: <20230817075234.1075736-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this small series improves debugging the tc358767 driver by using dev_err_probe
for additional information (patch 1) and print IRQ debug output only if hotplug
status actually changed.

Best regards,
Alexander

Alexander Stein (2):
  drm/bridge: tc358767: Use dev_err_probe
  drm: bridge: tc358767: Only print GPIO debug output if they actually
    occur

 drivers/gpu/drm/bridge/tc358767.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

-- 
2.34.1

