Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32980B992
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 08:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C36710E21D;
	Sun, 10 Dec 2023 07:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C58010E1CF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Dec 2023 07:05:09 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1702191385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=anKjJLW+Q6Owr4nvVHJwGKumqbTmyNrMralbG/U98v0=;
 b=CuI2HDI0zS2hFtuHeYQY5X8oZk5JLwtSodVsK6s92nfok1XdIQjhHThC3FfEob25So2kIK
 BPlYPffHXHEVH4Z4jzf4J1IxKpG3EVoybDPHRKBH1uHth3/DTcTyf6tOBZdY4cJ4PBoPcU
 6SoCj+x+9ValK0WjfbitVU6bVCwKmLDChI6H30HF7uY7OKTcrw/LvNDf8LxrxKHtaa6Zf4
 gtC6MD08mlwPLD5OFENHy7pt9VLsYKwBIsJl6P+LHnLC6IKXk/SrfO9xopUU4uSEcIrzSL
 KExu12YlXKyzcieZBStRrHkeELC+wZIEW3LUPPE9lGSN70RnGbI5TfR3DwT52g==
From: John Watts <contact@jookia.org>
Subject: [PATCH RFC v5 0/7] Add FS035VG158 panel
Date: Sun, 10 Dec 2023 17:55:48 +1100
Message-Id: <20231210-fs035vg158-v5-0-d75adc75571f@jookia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRgdWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDI2NDI0MD3bRiA2PTsnRDUwtdU3NLU2NjC6PUlCQzJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAWpvSAWEAAAA=
To: dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, John Watts <contact@jookia.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello there,

This RFC introduces support for the FS035VG158 LCD panel, cleaning up
the nv3052c driver on the way and documentating existing panel code.

This revision is mostly a resend and ask for more feedback.
I have tested that it works on next-20231208.

John.

v4 -> v5:
- Add Reviewed-By trailers

v3 -> v4:
- Mark panel_regs_len as unsigned

v2 -> v3:
- Dropped patches that add extra sleep time

v1 -> v2:
- Fixed a variable declaration style error
- Cleaned up device tree yaml

---
John Watts (7):
      drm/panel: nv3052c: Document known register names
      drm/panel: nv3052c: Add SPI device IDs
      drm/panel: nv3052c: Allow specifying registers per panel
      drm/panel: nv3052c: Add Fascontek FS035VG158 LCD display
      dt-bindings: display: panel: Clean up leadtek,ltk035c5444t properties
      dt-bindings: vendor-prefixes: Add fascontek
      dt-bindings: display: panel: add Fascontek FS035VG158 panel

 .../display/panel/fascontek,fs035vg158.yaml        |  56 +++
 .../display/panel/leadtek,ltk035c5444t.yaml        |   8 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c    | 515 +++++++++++++++------
 4 files changed, 437 insertions(+), 144 deletions(-)
---
base-commit: bc63de6e6ba0b16652c5fb4b9c9916b9e7ca1f23
change-id: 20231210-fs035vg158-57953382edb6

Best regards,
-- 
John Watts <contact@jookia.org>

