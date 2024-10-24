Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164BF9ADA5A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 05:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F0810E893;
	Thu, 24 Oct 2024 03:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="nNyh1LTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-19.consmr.mail.ir2.yahoo.com
 (sonic308-19.consmr.mail.ir2.yahoo.com [77.238.178.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453F010E8A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729739920; bh=V/yLWpCvTEqY5RyESeLn3te4FPujd83OdnV26kczf9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=nNyh1LThvWIlFJyL0KRwV0yRTduZ0849AHGz4PiYSbwlrlWI0yYevyJWh9+p7mq9EqPWSWUGg1a1V+gy4NzC53+lJB8lZXEAXLVDKZxqxluW6pxt6JfydIeXPP1qr2/hmiNTGSE8y9afFJy7ShOUClbUXFEXavflQMS8AuUUcy2U8Ptnk1cmyE41F7T5riF4c0sAK8mvHxxYUMldnX+PBYhOMocnKhgxHB+7HYev09YCX5qhX9GhDDScVD+qPqXb9tZcoFeRoFDNGUA7m0uNIqesVyGIlSNMxMez2m39Jk06zj7MM0Rde5EGuQbzsnee5Jr3/+pB3nqzRww/iEChTA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729739920; bh=6OgYXmWdn4XDiAX90cyBbR4XINglsV92ldmSOIu8o8V=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=NPpoqfn1ZKxJemqRRDrDbIZC0Hrhyxp+OnNKVGU7ejqAeZpRL/3dw9Lx0SwD+PMqXw5OBwbSZvBT02psp03xYja62c9HrmQ1bp8qnp2aMxnHs58kvTsNV3ZfhskC1XtXR8Sb1AoP+cxYJtwXGH9spynujiw1Bqs3xKswZ52il2bZOOUvRdFyEqLJazFT7/+V/Xm/8hmLDdrGd10GWMwKFNtnHgfr5UDMBE4WYzF/WdkO51Wkg9gGFMSO+N7LiuBRvndnWLbdTkNRngKprnqEXqqUJEyMZ10DMO1nCJU7ZX0FuGyTm3icKaTAzs5ipgw959Dy58Ub/T6EILYiwFFnpw==
X-YMail-OSG: eRMveYkVM1nvlEsA.JoCYclhfRtMGJejPSdiwDO7iu1ExAZrOUoPtKA32fW4yne
 C4d5E5Aj6jJsPYANZTCux1m6P0DqhQpjbz6f9JjkUJ0QQGSGyFHWRlMR67Bz_aNMtzhMHEOyQ97i
 xEoGoJNSoCs5YMxy9TI4Q6_tAUeyDV61ToNprXQbFcrC8iuKyfK2wC34k_8k3wZClwDeIGMc2ElS
 3mrSW8rmX8sdxEjhbrz9QCqPI7ozKASgAuwF56bJX1Uyro2hAfYMiCet16HMRNFSA86JsmrX18_o
 2XBAICGS22a1SGpnrwJTnySYu2Oa8ZiYfWtfOt4HHmjakuFkdKQKex2rhxa92lKuuE5wJPB7txYw
 gEPVqBfzZCULfCwfNzsDHoSNf2qWF4S1Ws8sBs4rXAFf4N5V7dnpU4ftyg.ppfj3Yzd_XQmHAtq8
 e71RPzUKCT0bjrSgGOvtsmLyVZvUaAtxHL3jYlvFaWkVccwo21TPmDY3GimB_3ltdvK81XYHVgIQ
 UnrdrCk5E3oEx96AjWck59DmGHgezvNq2APQHpVpFddLHNp12JgePIuzTRxRI088icxqG65xDjPe
 pZDzcqWQizUUnh7gdrwALuapkuJhk8pIQMqNTneFJqJNxH5w.TRITsZpdrqMB7cbFmllPJHShTrY
 tja0LcTJvlmx1MSieycHg8G5FX5kEc1MYQ7j6yL1lcMCd4jLopZkmCFXchAUb.amt8tqxh1KM.sg
 x8sNEXnckxqpR6L9AspFzugciCb_aKFbnQX2336bBAq6G5mUipIEsbz_8cMEP1C1UHClKBHUiEgQ
 2mz0zDaGvXDNxbjtk9h26pXPR1gSnRqKcU1cKoADfGuDtZTL5_OUuW0C5nNPV5StxsUUAxWeTUNI
 zyYEEeq4vV5.m2qzn9kKN94znBDoFi_tBjDpTYhIMiQ4z8gKlI2s1wIorxqyHyw3Im_rXTHsnfVk
 yvlzyQcGrfbeINlqoOGjtXSnwhMqWgh7zXMlpqQn2Z2_uLcEHedTdfUjjSQ2Y_w.0jIrKQ_cYFMl
 DFt4eRoLRIIOfqRsQxeJUeWMmws6Ct3ggpprED_O6AyE0zRjIONmPMCwXt9F82V6TOtRfbMcVVz9
 ZGNOvuLLkIMwny1J7Eow13e48Y5oSoql9CHTnuOxHAgAZop.iLm.Fj_c9I5SHkCXlP4GE.r54oIk
 UyPsH5m0zJs9q3Yu7u5_q5yVRNyo_.qMl67nchLS2X2jTvn7qcOULU9Ns.RRaze4DMpBZNrYP.n2
 2F5DWpVR_tGyP3siQd7Wd6U5mH5Ot2GY8hu49CBNkGgtwt1TpN2wjLq52UWRekHo5b7zgrQIlT.e
 GFG.kRNIdupMQ0Ov3d8l.tF6mGEThqD5ZkmN5bRijKVk899oHcFa.cHzyneMl278mZ_eT4kkfHJu
 EPqU_HolWegI9ynfEFQpp7msjvtFc_9sMbugDRy0cb4XbagDluGmileWe8RAfRZ38hMBfgYdxQip
 Uoqc74Qpo1nWGm_GArWv8L8qmODhcJQDg.lJfFuUdHBxD3aiOUsWgydu8pFBob5YqifMR7ESR4Ue
 MIhifrAW9Vm6YWi1oc3eFUf1nvHXW9rzfVMamwx9paK67d82TFqFRUBSVy2dZabm2yBXU1DenE_W
 vFJSiYKYOE0iAGbn4ZQGwHhAXP9KwfQ2xTZn0YPp6ZMTPfy.HK23vJJ20dtY7zt321xRXseac5x2
 zipXL5lkZoSAilqBQbOG5QzwAZSoLLRJdhTYQZsiv_YwkGZF2qg3nFR2ZOS0HbT2mS5MKMtC7LJf
 vf97WtCGxwiy2jlexuYU.GFp3lJaVMlNCOHa4_5c_vKra3vsihAqUanlnK1vdcYC9gwGDtD9pxgS
 W0cB_1X.7yxX7fKxeRwsxbemEyUT1IebMS2LxFNG224v.2Foz_zSqMx0TiLZU3iWcYuiw3bWXn7O
 HguhF1B6W8p5Y5WNHhpcCPRJPuoPDHlYn.QfAkwfmzz3QEDmlm2asnP5DlhKXT1QMNiHKf1k3Nuv
 opTRdkzA2PeLFNoGf12C_9IR8LkmOK4tBU04gbpd1va8Zqx87_MDsERuabjQkKNZfwBpgZGkOD9M
 8RWl.OBYUiSFESX5rePqtCV__fVq0Hjjrm2Lt5PZpU5_qt8nNbfES9u7BhpmU6tGKVuQhgpMbe_1
 sit6oyo_6MIB9hA_kmNQLkcTB3.YeAVbzkYOL9TLnBvfsouE_9QYYs9N2BnUyOY3D9FDi36cSXzw
 q6yJFTbULAdxDU2T_TtcWke7WcoSyduk6gluRW75.ml7mjRRNgCRh2SEiDHj.1GVd8WBg4wC3JwW
 wlYvL08.4T3Kyr5He4jBz32PZMLD3gSE9XJxRC3_cJvgD7ZxXmgzl
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 61af113c-0b3c-40b5-acfb-4c058bf6fb03
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Oct 2024 03:18:40 +0000
Received: by hermes--production-ir2-c694d79d9-2zgj2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 26d1652bc1703d2ade3e89c3cd33808b; 
 Thu, 24 Oct 2024 03:18:36 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v3 0/5] Add new panel driver Samsung S6E88A0-AMS427AP24
Date: Thu, 24 Oct 2024 05:18:22 +0200
Message-Id: <cover.1729738189.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729738189.git.jahau@rocketmail.com>
References: <cover.1729738189.git.jahau@rocketmail.com>
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

The patchset adds a new driver for Samsung AMS427AP24 panel with S6E88A0
controller. Patches are based on current branch drm-misc-next.

Changes in v3:
 - Patch 2: Dropped the second "bindings" in the commit subject.
 - Patch 2: Applied 4 spaces indentation in the example.
 - Patch 3: Made struct s6e88a0_ams427ap24_supplies[] "static".
 - Patch 3: Removed the "panel->prepared" parts from functions
   s6e88a0_ams427ap24_prepare() and s6e88a0_ams427ap24_unprepare().
 - Patch 5: Dissolved function s6e88a0_ams427ap24_parse_dt() and placed
   the parsing in the probe function. Changed the parsing from
   of_property_read_bool() to device_property_read_bool().

v1: https://lore.kernel.org/dri-devel/cover.1728582727.git.jahau@rocketmail.com/T/#t
v2: https://lore.kernel.org/dri-devel/cover.1729630039.git.jahau@rocketmail.com/T/#t

Jakob Hauser (5):
  dt-bindings: display: panel: Move flip properties to panel-common
  dt-bindings: display: panel: Add Samsung S6E88A0-AMS427AP24
  drm/panel: samsung-s6e88a0-ams427ap24: Add initial driver
  drm/panel: samsung-s6e88a0-ams427ap24: Add brightness control
  drm/panel: samsung-s6e88a0-ams427ap24: Add flip option

 .../bindings/display/panel/panel-common.yaml  |   8 +
 .../panel/samsung,s6e88a0-ams427ap24.yaml     |  65 ++
 .../display/panel/samsung,s6e8aa0.yaml        |  10 +-
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-samsung-s6e88a0-ams427ap24.c  | 754 ++++++++++++++++++
 6 files changed, 840 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c

-- 
2.39.5

