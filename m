Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E23759965
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479F610E4A8;
	Wed, 19 Jul 2023 15:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DB410E4A8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:20:16 +0000 (UTC)
Received: from johnny.home (unknown
 [IPv6:2a01:e0a:212:79f0:c8e5:afad:333a:7f73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: aferraris)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7543E6606FCE;
 Wed, 19 Jul 2023 16:20:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689780013;
 bh=z+ogJ9n6eVKxhL88T+iiOwnuLjSShxFXaTt/FLDI9c4=;
 h=From:To:Cc:Subject:Date:From;
 b=nnCxvicjSGFTOAsGooJ/PQCJffm48/T2BaYQvwsbCmgyN3D/3xtSiSbWYcDL7iE+1
 7xjTQJy3QCn5hVevO1dyDrsfjDdMTyhR8OlHCLLN2AwrlDLmFLYzj156fRP3R0zK/X
 R32b6YmQWDc4hT8BXlzel7zn/sAQZ5vVPNvhJfMURFRPrQCFLQeH7Qg9VSiN5PgS19
 c+XfIeK07xrREY8zb5LQcD/mY+DX5W3OCUccHx7ZtXQmU1BRigr0abOsHojY5R3xH0
 D3ck9dv1R3T4qkdk4zMJsd2Vwyc2Sg5SC3+ke8Qim6/87Ba6sfe2txew4cu734fdGi
 6ddFpNgdinwNQ==
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2 RESEND] Add driver for Novatek NT35596S panel
Date: Wed, 19 Jul 2023 17:20:05 +0200
Message-Id: <20230719152007.197710-1-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches add support for Novatek NT35596S based JDI FHD panels,
found in Xiaomi Mi Mix2S mobile phones.

Notes:
- I'm taking over this series as the original submitter is no longer
  able to work on/test those patches.
- Re-sending as I messed the1st attempt by not including the mailing
  lists; sorry to those impacted by the noise

Changes in v5:
- Move changelogs out of commit messages.
- Wrap comment/text lines around 80 chars.

Changes in v4:
- Correct numeric order of the items in binding.

Changes in v3:
- Embed the support into existing driver (panel-novatek-nt36672a), as
  these two IC are similar with different initialization commands.

Changes in v2:
- Correct items order in Makefile and improve failure handling.

Molly Sophia (2):
  dt-bindings: display: panel: Add Novatek NT35596S panel bindings
  drm: panel: Add novatek nt35596s panel driver

 .../display/panel/novatek,nt36672a.yaml       |  21 +-
 drivers/gpu/drm/panel/Kconfig                 |   7 +-
 .../gpu/drm/panel/panel-novatek-nt36672a.c    | 251 ++++++++++++++++--
 3 files changed, 251 insertions(+), 28 deletions(-)

-- 
2.40.1
