Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED66A7E6A0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC0610E517;
	Mon,  7 Apr 2025 16:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="e5ZmFIzx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2252010E516
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:34:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D83492047C;
 Mon,  7 Apr 2025 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744043646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BzcWM7AzXe38sTkDrxihqotAWSY9S1tEVGs+PbcYaYI=;
 b=e5ZmFIzxjzpNYanSphH9u7UvITmZFWSqHWN5E3pGzj+8EvrJtCLCMaYEeWv8VbJza8qM2d
 AXqWDTgCvx+kDm0hqcCq/HUzXLvDOVeJLtBnXNr+WqCJSuMhFrtxnpOI9p5tRtci9OSxWB
 4buQBa/KTXXMEOr3s2mcTLbeRrEkl+m7yLQmOpA0tycnobmh6bcQWF99fbDyNXjW8EUZsr
 S7ayq8ySaLoF1nWgG99kqvsihMVp9vujHWcFsA3FphnmvS8Mz3Jup3wa8jz7p78mzcdFfw
 AYw6cLShBfUGcNp+VlwSrf6y35Q7uBZ0/92e83MK/1fjSSXgsGzMrirnVkrBcA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/3] drm/panel: simple: add Tianma P0700WXF1MBAA and
 improve Tianma TM070JDHG34-00
Date: Mon, 07 Apr 2025 18:33:58 +0200
Message-Id: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHf+82cC/4WNQQ6CMBBFr0Jmbc2UBktdcQ/DosBUJpGWtAQxh
 LtbuYDL95L//g6JIlOCe7FDpJUTB5+hvBTQj9Y/SfCQGUosK1SoxcLWT1bMqBHfm5NTZ63A6tZ
 RXbuBnIE8nSM53s7so808clpC/Jwvq/zZP8FVChSyVxKVsUobbLoQlhf7ax8maI/j+AJ1YZ3Yu
 gAAAA==
X-Change-ID: 20250307-tianma-p0700wxf1mbaa-056be88fdef9
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgieetkeekgfdtudevueffueffveekheeiudfhfedvhfeukeeuhffhtddtvdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehsrghmsehrrghvnhgsohhrghdrohhrghdprhgtphhtthhopehquhhitggpjhgvshhsiihhrghnsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This short series adds power on/off timings to the Tianma TM070JDHG34-00
panel and adds support for the the Tianma P0700WXF1MBAA panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Rebased on current drm-misc-next
- Added Conor's R-by on the bindings
- Link to v1: https://lore.kernel.org/r/20250307-tianma-p0700wxf1mbaa-v1-0-1c31039a3790@bootlin.com

---
Luca Ceresoli (3):
      dt-bindings: display: simple: Add Tianma P0700WXF1MBAA panel
      drm/panel: simple: Tianma TM070JDHG34-00: add delays
      drm/panel: simple: add Tianma P0700WXF1MBAA panel

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 39 +++++++++++++++++++---
 2 files changed, 37 insertions(+), 4 deletions(-)
---
base-commit: fbe43810d563a293e3de301141d33caf1f5d5c5a
change-id: 20250307-tianma-p0700wxf1mbaa-056be88fdef9

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

