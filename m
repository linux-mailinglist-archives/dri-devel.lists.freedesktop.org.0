Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999F3AE381A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 10:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6410E1C8;
	Mon, 23 Jun 2025 08:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OF4tK7qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBC710E1C8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 08:15:33 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55350d0eedeso3979311e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750666529; x=1751271329; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
 b=OF4tK7qi/QTvQDlYt8lI/wdK93KHnjmrMk9o8Y7BbN6Ugz3YgyvS8nzUAEuCss42I3
 77+roPXTx/1NAqG3eyiMMGZ0TXpag+mQ8sAZsBUOwy3S27ZlOPr90vqf+PoBpuITx5f6
 mdyLTSnWCeY/lFrCbbJ8fiHQnTmGq52FaO6Lr3KvFe5IcfeFJpjohT9bY4OObiCQKTDf
 pq6p9WuUrE8k6SdJof2Un3S43Q5bX/JVP3aTeUKHdQUDZhTmltY3G2ehwuHybFVBZClQ
 sLIvzCs6G8CTky54F4sdMvTSBKCQx8RwqYJHSlscBEIHQqP0Fh33SJv6F4oUGtPYd7ma
 PssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750666529; x=1751271329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rEQjQUYSKvzxJm5N20PdRW2h2XKmpKdlgrVQR8zsmLo=;
 b=FEnKZTGiNGfykRDHv4a5IijRhb2AGTFhj9T2pHYFqBo5tawOXdatX4CfYssesek7zn
 JRzotHao76p1W78thjT3yvfnKOl+dxJ8PltVOyVAM46GyEPjfpDX9P0MgatZ7tSZmI9j
 q7IWxj/E3Lj7tlkm2Qr0Y9fD1mPkVYFhrWYY9cOPCfF41OyOmrMFShZnsy8eYn5t4jAs
 FFm/Y1bj0PkLq0iVXv7PIMHdWZT7Bwmx6wtKAWVC7dX2B8/C+AjIU2BUz6ub//Ngzt3q
 heLnkqDRdE0xUO7vHO05BvdSJcCp7oPh5ljEbrsnANKdlDKWrXSpHn7j0PSne93Tr1Tp
 5MIw==
X-Gm-Message-State: AOJu0Yxko+j1k1TLY2A6yeMIOgK26IIJibMO9yLmGP+u/BH13DjzdCvG
 RRpjn429sxSzTqc18Zd1mpXohfchzGxmilfLoNKQqmU3k7MTlhIcgCjw
X-Gm-Gg: ASbGncsvMUj0KuOtbZTleU/YPc3pI603pwWzAgqaNSIoUbw0Gd9Ao9JS86RHY84OFGa
 yyVP3pFhZV2dgojX6TyIt65EwefCcczH8O/xb3MV5pxrhooKguIJsnikL0Gg85MU+mstqbBmqOO
 7eEVyVpDHUDGOxypH7DSwmUamzgwXXM8eP4JLlmUQbB0c5aAdHtsY9k4DrlUs1a+hklhoV3R04p
 5B5ww8vAqRG+LZxNwkptxP8SM7XWosVAWGpJj2SQ/CtNEoedze7zJfOnR4I/SwE1OKNZk8fsJuf
 WngJ3gIHAaWw9VCA/V47WSDjNG9t9MyM2gqNZGYQO37ifMivfQl4g9fhRIlm4U8w
X-Google-Smtp-Source: AGHT+IFjSEME9axbEezabsS1db2kU9eJeB6ycyGrcQnUZEvKISlUaTokNROFLP51ZCePkc/xrdMAAQ==
X-Received: by 2002:a05:6512:31d5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553e3bd0367mr3782171e87.22.1750666528523; 
 Mon, 23 Jun 2025 01:15:28 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e414483asm1308072e87.52.2025.06.23.01.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 01:15:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] drm: bridge: add ssd2825 RGB/DSI bridge support
Date: Mon, 23 Jun 2025 11:15:02 +0300
Message-ID: <20250623081504.58622-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
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

Solomon SSD2825 is a RGB to MIPI DSI bridge used in LG Optimus 4D P880
and LG Optimus Vu P895

---
Changes on switching from v6 to v7:
- removed enabled checks
- configuration complete quirk moved from host_transfer to
  atomic_enable
- switched to devm_drm_bridge_alloc
- removed redundant dev_set_drvdata use

Changes on switching from v5 to v6:
- set correct module name in Kconfig help
- return error if spi sync failed for reading

Changes on switching from v4 to v5:
- rebased on top of drm-misc-next with adjustments to fit

Changes on switching from v3 to v4:
- no changes, resend

Changes on switching from v2 to v3:
- added mutex guard
- configuration register flags parametrized using panel flags
- removed unneded debug messages
- removed unimplemented modes checks
- added check for maximum pixel row length
- use types header
- remove ssd2825_to_ns
- shift bridge setup into atomic pre-enable
- cleaned default values of hzd and hpd

Changes on switching from v1 to v2:
- added description for clock
- removed clock-names
- added boundries for hs-zero-delay-ns and hs-prep-delay-ns
- added mutex lock for host transfers
- converted to atomic ops
- get drm_display_mode mode with atomic helpers
- parameterized INTERFACE_CTRL_REG_6 configuration
- added video mode validation and fixup
- removed clock name
- switched to devm_regulator_bulk_get_const
- added default timings
---

Svyatoslav Ryhel (2):
  dt-bindings: display: bridge: Document Solomon SSD2825
  drm: bridge: Add support for Solomon SSD2825 RGB/DSI bridge

 .../display/bridge/solomon,ssd2825.yaml       | 141 ++++
 drivers/gpu/drm/bridge/Kconfig                |  13 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ssd2825.c              | 775 ++++++++++++++++++
 4 files changed, 930 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/solomon,ssd2825.yaml
 create mode 100644 drivers/gpu/drm/bridge/ssd2825.c

-- 
2.48.1

